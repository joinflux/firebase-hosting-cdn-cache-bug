#!/usr/bin/env bash

set +euo pipefail

IMAGE_URL=australia-southeast1-docker.pkg.dev/api-demo-94c7a/api-demo
VERSION="$(git rev-parse head)"
TAG="${IMAGE_URL}/api":"${VERSION}"

set -x
echo "--- building image"
docker buildx build --platform linux/amd64 --push -t "${TAG}" .
# docker build -f Dockerfile -t "${TAG}" .

echo "--- deploying image"
gcloud run deploy api --image "${TAG}" \
	--platform managed \
	--port 7979 \
	--project api-demo-94c7a \
	--region australia-southeast1
