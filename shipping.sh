source common.sh
echo -e "\e[31minstall maven\e[0m"
yum install maven -y
echo -e "\e[31muser add\e[0m"
useradd ${app_user}
echo -e "\e[31mmake app dir\e[0m"
rm -rf /app
mkdir /app 
echo -e "\e[31mdownloading maven\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip 
cd /app 
echo -e "\e[31munzipping\e[0m"
unzip /tmp/shipping.zip
mvn clean package 
mv target/shipping-1.0.jar shipping.jar 
echo -e "\e[31mcopying files\e[0m"
cp /home/centos/roboshopusing-shell/shipping.service /etc/systemd/system/shipping.service
echo -e "\e[31mstarting the service\e[0m"
systemctl daemon-reload
systemctl enable shipping 
systemctl start shipping
echo -e "\e[31mdownloading the repo\e[0m"
yum install mysql -y 
echo -e "\e[31mpassword\e[0m"
mysql -h mysql.devopsdomain1.online -uroot -pRoboShop@1 < /app/schema/shipping.sql 
systemctl restart shipping