#!/bin/bash

# Read the current version from version.json
current_version=$(grep -oE '"version": "([^"]+)"' version.json | sed -E 's/"version": "([^"]+)"/\1/')

# Increment the version number
new_version=$((current_version + 1))

# Update version.json with the new version number
#sed -i "s/\"version\": \"$current_version\"/\"version\": \"$new_version\"/" version.json
sed "s/\"version\": \"$current_version\"/\"version\": \"$new_version\"/" version.json > temp.json && mv temp.json version.json


# Commit and push the changes to GitHub
git add version.json
git commit -m "Bump version to $new_version"
git push
