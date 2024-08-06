# RDS Cluster Management for Cost Optimization in Non Production Environments

## Overview

This template allows you to start or stop AWS RDS clusters in connected AWS accounts using GitHub Actions. It's designed to provide an easy way to manage database resources, helping to optimize costs in non production environments.

## Usage

### Manual Triggering

1. Navigate to this template in Backstage.
2. Click on the "Create" button.
3. Fill in the required parameters:
   - **Cluster Identifier**: Choose the RDS cluster you want to manage (e.g., `cs-dev-docdb-dev`).
   - **Action**: Select either `start` or `stop`.
4. Click "Create" to trigger the GitHub Action.

### Scheduled Operations

The workflow is also configured to run on a schedule:
- Start: Monday to Friday at 8:00 AM EST
- Stop: Monday to Friday at 8:00 PM EST

## Workflow Details

### Main Workflow (`*-account-scheduled-scaling.yml`)

1. **Check Status**: Determines if the workflow should run based on scheduling.
2. **RDS Management**: Calls the reusable workflow to perform the start/stop action.
3. **Slack Notifications**: Sends notifications about the operation's success or failure.

## Parameters

- `cluster`: The identifier of the RDS cluster to manage.
- `action`: The action to perform (`start` or `stop`).

## Notifications

Slack notifications are sent to the aapropriate slack channel for:
- Successful operations
- Failed operations
- Skipped executions (when the workflow is disabled)

## Troubleshooting

If you encounter issues:

1. Check the GitHub Actions logs for detailed error messages.
2. Ensure the specified RDS cluster exists and is in a valid state for the requested action.

## Customization

To modify the scheduled times or add new clusters:

1. Update the `cron` expressions in the `*-account-scheduled-scaling.yml` file.
2. Modify the `scheduled-clusters` input in the same file.

## Support

For assistance, please contact the DevOps team or create an issue in the `LearnWithHomer/github-actions-and-crons` repository.
