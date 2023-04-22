script=$(realpath "$0")
script_path=$(dirname $script)
rabbitmq_app_password=$1
if [ -z "$mysql_root_password" ];
then
echo input missing
exit
fi
source ${script_path}/common.sh
echo -e "\e[31minstalling golang\e[0m"
yum install golang -y
echo -e "\e[31madding app\e[0m"
useradd ${app_user}
echo -e "\e[31changing directory\e[0m"
rm -rf /app
mkdir /app 
echo -e "\e[31mdownloading package\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip 
cd /app 
echo -e "\e[31munzipping package\e[0m"
unzip /tmp/dispatch.zip
sed -i -e "s|rabbitmq_app_password|${rabbitmq_app_password}|" ${script_path}/dispatch.service
cp ${script_path}/dispatch.service /etc/systemd/system/dispatch.service
go mod init dispatch
go get 
go build
echo -e "\e[31mrestarting\e[0m"
systemctl daemon-reload
systemctl enable dispatch 
systemctl restart dispatch
