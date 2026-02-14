#!/usr/bin/env bash
set -euo pipefail

UPLOAD_URL="${1:?Usage: release.sh <upload_url> <platform-arch>}"
SUFFIX="${2:?Usage: release.sh <upload_url> <platform-arch>}"

UPLOAD_URL="${UPLOAD_URL:?UPLOAD_URL environment variable is required}"
SUFFIX="${1:?Usage: release.sh <platform-arch>}"

found=0

while IFS= read -r -d '' artifact; do
  found=1
  filename="$(basename "$artifact")"
  extension="${filename##*.}"
  base="${filename%.*}"

  # Append platform-arch suffix and URL-encode the name
  name="${base}-${SUFFIX}.${extension}"
  encoded_name=$(printf '%s' "$name" | jq -sRr @uri)

  echo "Uploading ${name}..."
  curl -sf \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H "Content-Type: application/octet-stream" \
    --data-binary "@${artifact}" \
    "${UPLOAD_URL}?name=${encoded_name}"
done < <(find out/make -type f \( -name '*.exe' -o -name '*.zip' -o -name '*.deb' -o -name '*.rpm' -o -name '*.nupkg' \) -print0)

if [ "$found" -eq 0 ]; then
  echo "Warning: no installer artifacts found in out/make/"
  exit 1
fi
