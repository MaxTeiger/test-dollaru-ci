# #!/bin/bash
# # Use IFS to set the field separator to a comma
# IFS=','
# my_string="node01,  node06, node13, node02"

# # Remove spaces from the string
# my_string="${my_string// /}"

# # Loop through the string and print each element
# for element in $my_string
# do
# 	echo $element
# done


node_list_provided="node01,  node06, node13, node02"
node_list=${node_list_provided// /}

IFS=','

echo "💻 Nodes list: $node_list"

for node_name in $node_list; do
    echo "🕦📦 Downloading package.tar.gz from S3"
    echo "aws s3 cp s3://dollaru-script/${node_name}/${{ inputs.tags }}/package.tar.gz package.tar.gz"
    echo "✅📦 Downloaded package.tar.gz from S3"
    
    echo "🕦🚢 Shipping package to node"
    echo "ssh ubuntu@${node_name} \"rm -rf /target/dir-backup && cp /target/dir /target/dir-backup && rm -rf /target/dir \""
    echo "ssh ubuntu@${node_name} \"cd /target/dir && tar -xvv\" < package.tar.gz"
    echo "✅🚢 Shipping package to node"
    
    rm package.tar.gz
done;