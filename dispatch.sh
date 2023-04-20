source commom.sh
echo -e "\e[31minstalling package\e[0m"
yum install golang -y
echo -e "\e[31minstalling package\e[0m"
useradd $(app_user)
echo -e "\e[31minstalling package\e[0m"
rm -rf /app
mkdir /app 
echo -e "\e[31minstalling package\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip 
cd /app 
echo -e "\e[31minstalling package\e[0m"
unzip /tmp/dispatch.zip
go mod init dispatch
go get 
go build
vim /etc/systemd/system/dispatch.service
echo -e "\e[31minstalling package\e[0m"
systemctl daemon-reload
systemctl enable dispatch 
systemctl start dispatch
