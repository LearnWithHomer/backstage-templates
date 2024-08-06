# Set Scheduled Workflow Status

## Overview

This Backstage template allows you to enable or disable a selected scheduled workflow in GitHub Actions by setting a value in AWS Parameter Store. It provides a simple interface to manage the status of various scheduled workflows across different projects and environments.

## Purpose

The primary purpose of this template is to provide a centralized and user-friendly way to control the execution of scheduled workflows. This is particularly useful for:

- Temporarily disabling scheduled tasks during maintenance windows
- Enabling or disabling environment-specific workflows
- Managing resource usage by controlling when certain automated tasks run

## How It Works

1. The template presents a form where you select a workflow and its desired status (enabled or disabled).
2. Upon submission, it triggers a GitHub Actions workflow.
3. The GitHub Actions workflow updates the corresponding parameter in AWS Parameter Store.
4. The scheduled workflows check this parameter before executing, allowing for dynamic control of their status.

## Usage

To use this template:

1. Navigate to the template in your Backstage installation.
2. Click on the "CREATE" button to start a new instance of the template.
3. In the form that appears:
   - Select the desired workflow from the dropdown list.
   - Choose the status you want to set (enabled or disabled).
4. Click "NEXT" and then "CREATE" to execute the template.

## Available Workflows

The template supports the following workflows:

- begin-site-account-scheduled-scaling
- codeSpark-account-scheduled-scaling
- data-platform-dev-account-scheduled-scaling
- data-platform-prod-account-scheduled-scaling
- data-platform-staging-account-scheduled-scaling
- homer-production-account-scheduled-scaling
- infrastructure-account-scheduled-scaling
- littlepassports-production-account-scheduled-scaling
- littlepassports-staging-account-scheduled-scaling
- parent-ai-account-scheduled-scaling
- codeSpark-staging-kops-k8s-scaling-schedule
- homer-staging-kops-k8s-scaling-schedule
- homer-test-kops-k8s-scaling-schedule
- littlepassports-staging-kops-k8s-scaling-schedule
- LittlePassport EFS Restart

## Technical Details

### GitHub Actions Workflow

The template triggers a GitHub Actions workflow (`setWorkflowStatus.yml`) in the `LearnWithHomer/github-actions-and-crons` repository. This workflow:

1. Runs on a self-hosted runner.
2. Installs and configures the AWS CLI.
3. Assumes an AWS IAM role with permissions to modify Parameter Store.
4. Updates the specified parameter in AWS Parameter Store with the new status.

### AWS Parameter Store

The status for each workflow is stored in AWS Parameter Store under the path `/workflows/<workflow-name>/status`. The value is either "enabled" or "disabled".

## Support

For additional support or to report issues, please contact the DevOps team.