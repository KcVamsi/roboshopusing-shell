echo -e "\e[31mConfigure the application\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[31minstalling the application\e[0m"
yum install nodejs -y
echo -e "\e[31madding the user\e[0m"
useradd roboshop
echo -e "\e[31mCreating the directory\e[0m"
rm -rf /app
mkdir /app 
echo -e "\e[31mdownloading the application\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
echo -e "\e[31mChanging the directory\e[0m"
cd /app 
echo -e "\e[31munzipping the application\e[0m"
unzip /tmp/catalogue.zip 
npm install 
echo -e "\e[31mCopying the files\e[0m"
cp /home/centos/roboshopusing-shell/catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[31mstarting the application\e[0m"
systemctl daemon-reload
systemctl enable catalogue 
systemctl start catalogue
echo -e "\e[31mCopying the mongod\e[0m"
cp /home/centos/roboshopusing-shell/mongodb.repo /etc/systemd/system/catalogue.service
yum install mongodb-org-shell -y
mongo --host mongodb.devopsdomain1.online </app/schema/catalogue.js