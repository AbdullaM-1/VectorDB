#!/usr/bin/env bash
set -euo pipefail

# Build (for linux/amd64) and push clubfit-vectordb image to AWS ECR.
# docker-build-run.sh handles local runs; this script builds specifically for ECS.
#
# Prerequisites:
#   - AWS CLI installed and configured (aws configure / env vars / IAM role)
#   - ECR repository already created (or set CREATE_REPO=1 to auto-create)
#
# Usage:
#   bash push-to-ecr.sh
#   TAG=v1.2 bash push-to-ecr.sh
#   CREATE_REPO=1 bash push-to-ecr.sh

# ── Configuration ─────────────────────────────────────────────────────────────
AWS_REGION="${AWS_REGION:-us-east-1}"
AWS_ACCOUNT_ID="${AWS_ACCOUNT_ID:-734849394517}"
ECR_REPO="${ECR_REPO:-clubfitvector}"
TAG="${TAG:-latest}"
CREATE_REPO="${CREATE_REPO:-0}"   # set to 1 to create the ECR repo if missing

ECR_REGISTRY="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
FULL_IMAGE="${ECR_REGISTRY}/${ECR_REPO}:${TAG}"

echo "AWS account  : ${AWS_ACCOUNT_ID}"
echo "Region       : ${AWS_REGION}"
echo "ECR image    : ${FULL_IMAGE}"
echo "Platform     : linux/amd64"
echo ""

# ── Optionally create ECR repository ─────────────────────────────────────────
if [ "${CREATE_REPO}" = "1" ]; then
  echo "Ensuring ECR repository '${ECR_REPO}' exists..."
  aws ecr describe-repositories \
    --repository-names "${ECR_REPO}" \
    --region "${AWS_REGION}" >/dev/null 2>&1 \
  || aws ecr create-repository \
       --repository-name "${ECR_REPO}" \
       --region "${AWS_REGION}" \
       --image-scanning-configuration scanOnPush=true \
       --encryption-configuration encryptionType=AES256
  echo "Repository ready."
fi

# ── Authenticate Docker with ECR ──────────────────────────────────────────────
echo "Logging in to ECR..."
aws ecr get-login-password --region "${AWS_REGION}" \
  | docker login --username AWS --password-stdin "${ECR_REGISTRY}"

# ── Build for linux/amd64 (required for ECS; local Mac may be arm64) ──────────
echo "Building image for linux/amd64..."
docker build --platform linux/amd64 -t "${FULL_IMAGE}" .

# ── Push to ECR ───────────────────────────────────────────────────────────────
echo "Pushing ${FULL_IMAGE}..."
docker push "${FULL_IMAGE}"

echo ""
echo "Done. Image available at:"
echo "  ${FULL_IMAGE}"
echo ""
echo "To deploy to ECS, update your task definition to use this image URI."
