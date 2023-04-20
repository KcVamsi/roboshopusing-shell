script=$(realpath "$0")
script_path=$(dirname "script")
source ${script_path}/common.sh
rabbimq_app_password=$1
echo -e "\e[31minstalling package\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
echo -e "\e[31minstalling\e[0m"
yum install erlang -y
echo -e "\e[31mdownloading\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
echo -e "\e[31minstalling rabbit\e[0m"
yum install rabbitmq-server -y 
echo -e "\e[31mstarting service\e[0m"
systemctl enable rabbitmq-server 
systemctl start rabbitmq-server 
echo -e "\e[31mpassword reset\e[0m"
rabbitmqctl add_user roboshop $(rabbimq_app_password)
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
