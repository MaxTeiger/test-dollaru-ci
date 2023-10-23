#!/bin/bash
set -euo pipefail

bucket_name="your-bucket-name"
folder_path="your-folder-path"

if aws s3 ls "s3://$bucket_name/$folder_path" 2>&1 | grep -q 'NoSuchBucket\|NoSuchKey'; then
	echo "Folder does not exist"
else
	echo "Folder exists"
fi

# Replace all occurrences of "\n" with ","
folder_list=$(aws s3 ls "s3://$bucket_name/$folder_path" | awk '{print $2}' | tr '\n' ',' | sed 's/,$//')

echo "Folder list: $folder_list"




