script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
component=user
function_nodejs

echo -e "\e[31mcopying the home location\e[0m"
cp ${script_path}/mongodb.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.devopsdomain1.online </app/schema/user.js
