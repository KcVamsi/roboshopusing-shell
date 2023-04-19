# we need to copy the repo file to the correct location.

cp mongodb.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org -y 
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
systemctl enable mongod 
systemctl restart mongod 

## here we nend to change the ip from 127.0.0.0 to 0.0.0.0
