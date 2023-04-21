app_user=roboshop

print_head(){
    echo -e "\e[31m$1\e[0m"
}

function_nodejs() {
print_head "Configure the application"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
print_head "installing the application"
yum install nodejs -y
print_head "adding the user"
useradd ${app_user}
print_head "Creating the directory"
rm -rf /app
mkdir /app 
print_head "downloading the application"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip 
print_head "Changing the directory"
cd /app 
print_head "unzipping the application"
unzip /tmp/${component}.zip 
npm install 
print_head "Copying the files"
cp ${script_path}/${component}.service /etc/systemd/system/${component}.service
print_head "starting the application"
systemctl daemon-reload
systemctl enable ${component} 
systemctl restart ${component}
}