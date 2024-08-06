# Littlepassports EFS-CSI Restart

## Overview

This template triggers a GitHub Actions workflow that automatically detects and restarts stuck EFS-CSI pods in the Littlepassports production Kubernetes cluster. It's designed to address issues where pods get stuck in the `ContainerCreating` state, which can impact the performance and stability of the Littlepassports application.

## When to Use This Template

Use this template when:

1. You suspect that EFS-CSI pods are stuck in the `ContainerCreating` state.
2. You want to proactively check and resolve potential EFS-CSI issues.
3. You need to manually trigger the restart process outside of the scheduled runs.

## How It Works

The template triggers a GitHub Actions workflow that performs the following steps:

1. Checks for pods in the `ContainerCreating` state that have been stuck for more than 150 seconds.
2. If a stuck pod is found:
   - Drains the node where the stuck pod is running.
   - Deletes all `efs-csi-node` pods on that node.
   - Uncordons the node.
3. Sends a Slack notification about the action taken.

## Usage

To use this template:

1. Navigate to the template in Backstage.
2. Click on the "Create" button.
3. Review the information and click "Create" to trigger the workflow.

No additional input is required from the user.

## Scheduled Runs

The GitHub Actions workflow is scheduled to run automatically every 15 minutes. This ensures regular checks and prompt resolution of any stuck pods.

## Manual Triggering

While the workflow runs on a schedule, you can use this Backstage template to manually trigger the process at any time.

## Notifications

Slack notifications are sent to the `#littlepassports-production-status` channel for the following scenarios:

- When the workflow successfully restarts stuck pods.
- When the workflow is skipped (if it's disabled).

## Support

For any issues or questions, please contact the DevOps team or create an issue in the [infrastructure-public](https://github.com/LearnWithHomer/infrastructure-public) repository.