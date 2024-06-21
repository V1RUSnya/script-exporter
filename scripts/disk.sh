#!/bin/bash
ARRAY_DISK=($(lsblk -b | grep ^sd[a-z][^0-9] | awk '{ print $1 }'))
for element in "${ARRAY_DISK[@]}"
do
  size=($(lsblk -b | grep ^$element | awk '{ print $4 }'))
  echo "node_exporter_disk_size_lsblk{disk=\"$element\"} $size"
done
