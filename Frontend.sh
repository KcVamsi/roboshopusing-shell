yum install nginx -y 
cp frontend.config  /etc/nginx/default.d/roboshop.conf 
rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip 
cp frontend.conf /etc/nginx/default.d/roboshop.conf

# here we need to add a config file. we cannt add directly the cmnd here, so 1st we need to create a config file seperately and then copy that file to the current location


systemctl restart nginx 
systemctl enable nginx
