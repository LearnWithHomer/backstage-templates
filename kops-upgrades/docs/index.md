# Kops Kubernetes Cluster Upgrade

## Overview

This template triggers a GitHub Actions workflow to upgrade the Kubernetes cluster. It utilizes a reusable workflow for Kops K8s Cluster Scheduled Upgrade, which checks for available upgrades and performs the upgrade if necessary.

## Components

1. **Backstage Template**: `*-kops-upgrade`
2. **GitHub Actions Workflow**: `*codeSpark-prod*-kops-k8s-upgrade.yml`
3. **Reusable Workflow**: `k8s-kops-upgrade.yml`

## Workflow Details

1. Checks for available Kubernetes upgrades using Kops.
2. If an upgrade is available, it performs the upgrade and initiates a rolling update.
3. Outputs the upgrade status, old version, and new version (if upgraded).

## Usage

To initiate a cluster upgrade:

1. Navigate to the Backstage catalog.
2. Find the template.
3. Click "Create" to start the process.
4. Review the information and confirm the action.

The template will trigger the GitHub Actions workflow, which will:

1. Check for available upgrades.
2. Perform the upgrade if a new version is available.
3. Send a Slack notification with the result.

## Notifications

- Successful upgrades are reported in the appropriate Slack channel for the environment being upgraded.
- Failed upgrade attempts are also reported in the same channel.

## Security

The workflow uses GitHub's OIDC provider to authenticate with AWS, eliminating the need for long-lived credentials.

## Troubleshooting

If the upgrade fails contact the DevOps team for assistance.