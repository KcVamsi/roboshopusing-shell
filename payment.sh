script=$(realpath "$0")
script_path=$(dirname "$script")
rabbitmq_app_password=$1
if [ -z "$rabbitmq_app_password" ];
then
echo input missing
exit
fi
source ${script_path}/common.sh
echo -e "\e[31minstalling package\e[0m"
yum install python36 gcc python3-devel -y
echo -e "\e[31museradd\e[0m"
useradd ${app_user}
echo -e "\e[31mdirectry\e[0m"
rm -rf /app
mkdir /app 
echo -e "\e[31mzipfile\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip 
cd /app 
echo -e "\e[31munzipping\e[0m"
unzip /tmp/payment.zip
echo -e "\e[31install\e[0m"
pip3.6 install -r requirements.txt
echo -e "\e[31mcopying\e[0m"
sed -i -e "s|rabbitmq_app_password|${rabbitmq_app_password}|" ${script_path}/payment.service
cp ${script_path}/payment.service /etc/systemd/system/payment.service
echo -e "\e[31mstarting\e[0m"
systemctl daemon-reload
systemctl enable payment 
systemctl restart payment
