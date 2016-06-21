# goofys_install

## Installation

```
cat << EOS > /etc/goofys.conf
S3_MOUNT_NAME='<Mount Directory Path>'
S3_BUCKET_NAME='<S3 Bucket Name>'
EOS
```

`curl -o- https://raw.githubusercontent.com/kwkoizumi/goofys_install/master/install.sh | bash`

