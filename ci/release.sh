#!/usr/bin/env bash
set -euo pipefail

UPLOAD_URL="${1:?Usage: release.sh <upload_url> <platform-arch>}"
SUFFIX="${2:?Usage: release.sh <upload_url> <platform-arch>}"

# Strip the {?name,label} template from the upload URL
UPLOAD_URL="${UPLOAD_URL%\{*}"

for artifact in out/make/**/*.{exe,zip,deb,rpm}; do
  [ -f "$artifact" ] || continue

  filename="$(basename "$artifact")"
  extension="${filename##*.}"
  name="${filename%.*}-${SUFFIX}.${extension}"

  echo "Uploading ${name}..."
  curl -sf \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H "Content-Type: application/octet-stream" \
    --data-binary "@${artifact}" \
    "${UPLOAD_URL}?name=${name}"
done
