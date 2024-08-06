# Rancher Agent Memory Check

## Overview

This documentation covers the "Rancher Agent Memory Check" system, which consists of a reusable GitHub Actions workflow, a caller workflow, and this Backstage template. The system is designed to monitor and manage the memory usage of Rancher Agent pods in the Kubernetes cluster.

## Reusable Workflow: Pod Memory Check

### Purpose
This workflow checks the memory usage of specified pods and restarts them if they exceed a defined threshold.

### Key Features
- Configurable namespace and pod prefix
- Adjustable memory threshold
- Automatic pod restart when threshold is exceeded
- Output of the number of restarted pods

### Inputs
- `namespace`: The Kubernetes namespace to check (required)
- `pod_prefix`: The prefix of the pods to check (required)
- `memory_threshold_mi`: Memory threshold in MiB (required)
- `kubectl_version`: Version of kubectl to use (optional, default: '1.29.3')

### Secrets
- `KUBE_CONFIG`: Kubernetes configuration for cluster access (required)

### Outputs
- `pods_restarted`: Number of pods that were restarted

## Caller Workflow

### Purpose
This workflow is specifically tailored for checking the Rancher Agent pods in the Little Passports production environment.

### Key Features
- Scheduled to run every 15 minutes
- Manual trigger option with customizable memory threshold
- Slack notification on successful pod restarts

### Trigger Methods
1. Scheduled: Runs every 15 minutes
2. Manual: Can be triggered manually with a custom memory threshold

### Jobs
1. `check-cattle-system-pods`: Calls the reusable workflow
2. `slack-notify-success`: Sends a Slack notification if pods were restarted

## Backstage Template

### Purpose
This template provides a user-friendly interface in Backstage to trigger the memory check workflow manually.

### Key Features
- Simple form to input memory threshold
- Triggers the GitHub Actions workflow directly from Backstage

### Parameters
- `threshold`: Memory threshold in MiB (default: 1000)

### Actions
- Dispatches the GitHub Actions workflow with the specified memory threshold

## Usage

### Automated Checks
The system automatically checks the Rancher Agent pod memory usage every 15 minutes using the scheduled trigger in the caller workflow.

### Manual Checks
1. Via GitHub Actions:
   - Navigate to the GitHub Actions page for the repository
   - Find the "littlePassport*RancherAgentPodMemoryCheck" workflow
   - Click "Run workflow"
   - Enter the desired memory threshold (in MiB)
   - Click "Run workflow"

2. Via Backstage:
   - Navigate to the "Trigger LP * Rancher Agent Memory Check" template
   - Enter the desired memory threshold (in MiB)
   - Submit the form to trigger the workflow

### Notifications
If any pods are restarted due to exceeding the memory threshold, a Slack notification will be sent to the `littlepassports-*-status` channel.

## Maintenance

- Regularly review and update the `kubectl_version` in the reusable workflow
- Adjust the memory threshold as needed based on application requirements
- Monitor the frequency of pod restarts and adjust the check interval if necessary

For any issues or improvements, please contact the DevOps team.
