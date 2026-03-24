#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   bash docker-build-run.sh
#   IMAGE_NAME=clubfit-vectordb TAG=dev HOST_PORT=5003 bash docker-build-run.sh

IMAGE_NAME="${IMAGE_NAME:-clubfit-vectordb}"
TAG="${TAG:-latest}"
CONTAINER_NAME="${CONTAINER_NAME:-clubfit-vectordb}"
HOST_PORT="${HOST_PORT:-5003}"
CONTAINER_PORT="${CONTAINER_PORT:-5003}"
FAISS_INDEX_DIR_HOST="${FAISS_INDEX_DIR_HOST:-$(pwd)/faiss_index}"

echo "Building image: ${IMAGE_NAME}:${TAG}"
docker build -t "${IMAGE_NAME}:${TAG}" .

echo "Stopping old container (if exists): ${CONTAINER_NAME}"
docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true

mkdir -p "${FAISS_INDEX_DIR_HOST}"

echo "Running container: ${CONTAINER_NAME}"
docker run -d \
  --name "${CONTAINER_NAME}" \
  -p "${HOST_PORT}:${CONTAINER_PORT}" \
  -e PORT="${CONTAINER_PORT}" \
  -e FAISS_INDEX_DIR=/app/faiss_index \
  -e OPENAI_API_KEY="${OPENAI_API_KEY:?OPENAI_API_KEY is not set}" \
  -v "${FAISS_INDEX_DIR_HOST}:/app/faiss_index" \
  "${IMAGE_NAME}:${TAG}"

echo "Container started."
echo "Health check: http://localhost:${HOST_PORT}/health"
