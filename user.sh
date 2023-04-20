script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
echo -e "\e[31mconfiguring the nodejs\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[31minstalling the nodejs\e[0m"
yum install nodejs -y
echo -e "\e[31muser add\e[0m"
useradd ${app_user}
echo -e "\e[31mcreate directory\e[0m"
rm -rf /app
mkdir /app 
echo -e "\e[31mdownloading the app content\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip 
cd /app 
echo -e "\e[31munzipping the file\e[0m"
unzip /tmp/user.zip
npm install 
echo -e "\e[31mcopying the home location\e[0m"
cp ${script_path}/user.service /etc/systemd/system/user.service
echo -e "\e[31mstarting the user service\e[0m"
systemctl daemon-reload
systemctl enable user 
systemctl start user
echo -e "\e[31mcopying the home location\e[0m"
cp ${script_path}/mongodb.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.devopsdomain1.online </app/schema/user.js
