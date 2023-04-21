script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
mysql_root_password=$1
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
echo -e "\e[31mdownloading the repo\e[0m"
yum install mysql -y 
echo -e "\e[31mpassword\e[0m"
mysql -h mysql.devopsdomain1.online -uroot -p${mysql_root_password} < /app/schema/shipping.sql 
echo -e "\e[31mcopying files\e[0m"
cp ${script_path}/shipping.service /etc/systemd/system/shipping.service
echo -e "\e[31mstarting the service\e[0m"
systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping