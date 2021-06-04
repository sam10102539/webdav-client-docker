# #!bin/bash

echo "$WEBDRIVE_URL $WEBDRIVE_USERNAME $WEBDRIVE_PASSWORD" >> /usr/share/davfs2/secrets
echo 'secrets /usr/share/davfs2/secrets' | sudo tee -a ~/.davfs2/davfs2.conf
chmod 600 /usr/share/davfs2/secrets

mount -t davfs -o noexec,conf=/root/.davfs2/davfs2.conf $WEBDRIVE_URL /mnt/webdav

sleep infinity
