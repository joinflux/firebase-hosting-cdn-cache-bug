#!/usr/bin/env bash

set +x

IMAGE_URL=australia-southeast1-docker.pkg.dev/api-demo-94c7a/api-demo
VERSION="$(git rev-parse head)"
TAG="${IMAGE_URL}":"${VERSION}"

echo "--- building image"
docker build -f Dockerfile -t "${TAG}" .

echo "--- pushing image"
docker push "${TAG}"

echo "--- deploying image"
gcloud run deploy api --image "${TAG}" \
	--platform managed \
	--port 7979 \
	--region australia-southeast1
