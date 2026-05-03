#!/usr/bin/env bash
set -e

cd /etc/nixos

# Stage all changes
git add .

# Commit with timestamp if there are changes
if ! git diff --cached --quiet; then
  git commit -m "rebuild: $(date '+%Y-%m-%d %H:%M')"
fi

# Rebuild
sudo nixos-rebuild switch

# Push if rebuild succeeded
git push
