# Kops Kubernetes Cluster Scaling for Cost Optimization

## Overview

This template allows you to trigger the scaling up or down of the Kubernetes cluster managed by Kops. The purpose is to optimize costs by scaling down the cluster during off-hours and scaling it back up when needed.

## Usage

1. Navigate to the template in Backstage.
2. Click "Create" to start the workflow.
3. Select the desired action:
   - `scale-down`: Reduces the cluster size to minimize costs.
   - `scale-up`: Increases the cluster size to normal operating capacity.
4. Click "Create" to trigger the action.

## Technical Details

### Workflow

The template triggers a GitHub Actions workflow named `*-kops-k8s-scaling-schedule.yml`. These workflows, in turn, call a reusable workflow that handles the actual scaling operations.

#### Main Workflow (`*-kops-k8s-scaling-schedule.yml`)

- **Trigger**: 
  - Scheduled runs:
    - Scale up: Every weekday at 12:00 UTC (8:00 PM EDT)
    - Scale down: Every weekday at 00:00 UTC (8:00 PM EDT)
  - Manual trigger via GitHub Actions UI or this Backstage template

- **Jobs**:
  1. `check-status`: Verifies if the workflow should run (enable or disable scheduled workflows using the `set-scheduled-workflows-status` template).
  2. `optimize-cluster`: Calls the reusable workflow to perform the scaling action.
  3. `slack-notify-success`: Sends a Slack notification upon successful completion.
  4. `slack-notify-skipping`: Notifies if the workflow was skipped due to being disabled, as informed by `check-status`.

#### Reusable Workflow (`k8s-kops-scaling.yml`)

This workflow performs the actual scaling operations:

1. **Scale Down**:
   - Stores the current instance group configuration in AWS Parameter Store.
   - Modifies Node instance groups:
     - Sets `minSize` to 0
     - Sets `maxSize` to 1
     - Changes `machineType` to t2.micro
   - Applies changes and performs a rolling update.

2. **Scale Up**:
   - Retrieves the original configuration from AWS Parameter Store.
   - Applies the original configuration.
   - Performs a rolling update.
   - Validates the cluster state (with a 10-minute timeout).

## Troubleshooting

If the workflow fails or the cluster doesn't reach the desired state contact the DevOps team or create a GitHub issue in the `LearnWithHomer/infrastructure-public` repository.

## Notes

- The scale-down process significantly reduces cluster capacity. Ensure that this action is not triggered during times of expected high traffic or important operations.
- After scaling up, allow some time for the cluster to stabilize before running critical workloads.