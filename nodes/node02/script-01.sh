  node_list_provided="node01, node02"
  node_list=${my_string// /}
  
  IFS=','
  
  echo "💻 Nodes list: $node_list"
  
  for node_name in $node_list; do
    echo "🕦📦 Downloading package.tar.gz from S3"
    echo "aws s3 cp s3://dollaru-script/${node_name}/azertyu/package.tar.gz package.tar.gz"
    echo "✅📦 Downloaded package.tar.gz from S3"
  
    echo "🕦🚢 Shipping package to node"
    echo "ssh ubuntu@${node_name} \"rm -rf /target/dir-backup && cp /target/dir /target/dir-backup && rm -rf /target/dir \""
    echo "ssh ubuntu@${node_name} \"cd /target/dir && tar -xvv\" < package.tar.gz"
    echo "✅🚢 Shipping package to node"
  
    rm package.tar.gz
  done;