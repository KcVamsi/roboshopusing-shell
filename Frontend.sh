yum install nginx -y 
rm -rf /usr/share/nginx/html/* 
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip 
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip 

# here we need to add a config file. we cannt add directly the cmnd here, so 1st we need to create a config file seperately and then copy that file to the current location

cp frontend.config  /etc/nginx/default.d/roboshop.conf 

systemctl restart nginx 
systemctl enable nginx
