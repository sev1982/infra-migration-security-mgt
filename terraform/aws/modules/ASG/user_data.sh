#!/bin/bash

yum update -y
yum install -y httpd

systemctl enable httpd
systemctl start httpd

echo "<h1>Hello from ${env} - $(hostname -f)</h1>" > /var/www/html/index.html
