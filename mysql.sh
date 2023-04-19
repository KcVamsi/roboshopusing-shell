echo -e "\e[31mdisbale\e[0m"
dnf module disable mysql -y 
echo -e "\e[31mcopy file\e[0m"
cp /home/centos/roboshopsuing-shell/mysql.repo vim /etc/yum.repos.d/mysql.repo
echo -e "\e[31minstall\e[0m"
yum install mysql-community-server -y
echo -e "\e[31mstarting the service\e[0m"
systemctl enable mysqld
systemctl restart mysqld  
echo -e "\e[31mmysql password\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
mysql -uroot -pRoboShop@1