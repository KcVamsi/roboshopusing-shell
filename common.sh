app_user=roboshop

function_nodejs(){

echo -e "\e[31mConfigure the application\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[31minstalling the application\e[0m"
yum install nodejs -y
echo -e "\e[31madding the user\e[0m"
useradd ${app_user}
echo -e "\e[31mCreating the directory\e[0m"
rm -rf /app
mkdir /app 
echo -e "\e[31mdownloading the application\e[0m"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip 
echo -e "\e[31mChanging the directory\e[0m"
cd /app 
echo -e "\e[31munzipping the application\e[0m"
unzip /tmp/${component}.zip 
npm install 
echo -e "\e[31mCopying the files\e[0m"
cp ${script_path}/${component}.service /etc/systemd/system/${component}.service
echo -e "\e[31mstarting the application\e[0m"
systemctl daemon-reload
systemctl enable ${component} 
systemctl restart ${component}

}