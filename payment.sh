app_user=roboshop
echo -e "\e[31minstalling package\e[0m"
yum install python36 gcc python3-devel -y
echo -e "\e[31museradd\e[0m"
useradd $(app_user)
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
cp /home/centos/roboshopusing-shell/payment.service /etc/systemd/system/payment.service
echo -e "\e[31mstarting\e[0m"
systemctl daemon-reload
systemctl enable payment 
systemctl start payment
