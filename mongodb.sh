# we need to copy the repo file to the correct location.

cp mongodb.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org -y 
systemctl enable mongod 
systemctl start mongod 

## here we nend to change the ip from 127.0.0.0 to 0.0.0.0
but the editing of file cant be done here.