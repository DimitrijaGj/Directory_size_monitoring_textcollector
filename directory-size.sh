#!/usr/bin/env sh

echo "# HELP node_directory_size_bytes Disk space used by some directories"
echo "# TYPE node_directory_size_bytes gauge"

for dir in "$@"
do
  du --block-size=1 --summarize "$dir" \
    | awk -v directory="$dir" '{ print "node_directory_size_bytes{directory=\"" directory "\"} "  $1 }'
done
