#!/usr/bin/env bash
set -e

cd /etc/nixos

# stage changes
git add .

# commit it
git commit -m "rebuild: $(date '+%Y-%m-%d %H:%M')"

# Rebuild
sudo nixos-rebuild switch

# Push
git push
