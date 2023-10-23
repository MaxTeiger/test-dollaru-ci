echo "Commit SHA: $GIT_SHA"

folders=$(cd ./nodes && find . -mindepth 1 -maxdepth 1 -type d | cut -c 3-)

# Print the list of nodes names
echo "${folders[@]}"
for node in $folders; do
    echo "<---------------- ${node} ---------------->"
    echo "aws s3 ls \"s3://dollaru-script/$node/$GIT_SHA\""
    
    # if aws s3 ls "s3://dollaru-script/$node/$GIT_SHA" 2>&1 | grep -q 'NoSuchBucket\|NoSuchKey'; then

    if false; then
        echo "Folder does not exist"
    else
        echo "Folder exists in s3"
        echo "🕦📦 Downloading package.tar.gz from S3"
        echo "aws s3 cp s3://dollaru-script/$node/$GIT_SHA/package.tar.gz package.tar.gz"
        echo "✅📦 Downloaded package.tar.gz from S3"
        
        echo "🕦🪣 Uploading package.tar.gz to s3 bucket"
        echo "aws s3 cp package.tar.gz s3://dollaru-script/$node/$RELEASE_VERSION/package.tar.gz"
        echo "✅🪣 Uploaded package.tar.gz to s3 bucket"
        
    fi
done