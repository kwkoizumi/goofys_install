#!/bin/bash

base=${0##*/}

#echo -e "S3_MOUNT_NAME='mount'\nS3_BUCKET_NAME='bucket'" > /etc/goofys.conf
if [ -e /etc/goofys.conf ]; then
  . /etc/goofys.conf
else
  echo "/etc/goofys.conf is not found."
fi

[ "${S3_BUCKET_NAME}" == "" ] && logger -ist "${base}" "S3_BUCKET_NAME is empty." && exit 1

[ "${S3_MOUNT_NAME}" ] && logger -ist "${base}" "S3_MOUNT_NAME is empty." && exit 1

yum update -y
yum install golang fuse git -y
export GOPATH=$HOME/go
go get github.com/kahing/goofys
go install github.com/kahing/goofys

[ -e ${S3_MOUNT_NAME} ] || mkdir -p ${S3_MOUNT_NAME}
#${GOPATH}/bin/goofys ${S3_BUCKET_NAME} ${S3_MOUNT_NAME}
echo "${GOPATH}/bin/goofys ${S3_BUCKET_NAME} ${S3_MOUNT_NAME}"
