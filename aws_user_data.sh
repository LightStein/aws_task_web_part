#!/bin/bash
# install httpd (linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
yum install git -y
PublicIP=$(curl http://checkip.amazonaws.com)
PrivateIP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

# clone website project
git clone https://github.com/LightStein/aws_task_web_part.git
# remove default index
rm /var/www/html/index.html
# copy project's index to the directory that will be hosted
cp ./aws_task_web_part/index.html /var/www/html/
# generate .js file and copy to host directory
chmod +x ./aws_task_web_part/env.sh
./aws_task_web_part/env.sh > /var/www/html/env.js

sudo apt-get install apache2
sudo service apache2 start
sudo apache2 chkconfig on