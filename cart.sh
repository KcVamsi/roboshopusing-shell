script_path=$(dirname $0)
source ${script_path}/common.sh
echo -e "\e[31mconfiguration\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[31minstalling the nodejs\e[0m"
yum install nodejs -y
echo -e "\e[31museradding\e[0m"
useradd ${app_user}
echo -e "\e[31mcreate app dir\e[0m"
rm -rf /app
mkdir /app 
echo -e "\e[31mdownloading\e[0m"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip 
echo -e "\e[31munziping\e[0m"
unzip /tmp/cart.zip
cp /app
npm install 
echo -e "\e[31mcopying\e[0m"
cp $script_path/cart.service /etc/systemd/system/cart.service
echo -e "\e[31mstarting\e[0m"
systemctl daemon-reload
systemctl enable cart 
systemctl start cart