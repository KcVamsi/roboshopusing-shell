echo -e "\e[31minstall redis repos\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
echo -e "\e[31install redis\e[0m"
dnf module enable redis:remi-6.2 -y
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf
yum install redis -y 
echo -e "\e[31mstart redis\e[0m"
systemctl enable redis 
systemctl start redis 