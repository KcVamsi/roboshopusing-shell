script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

component=catalogue
function_nodejs

echo -e "\e[31mCopying the mongod\e[0m"
cp ${script_path}um.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.devopsdomain1.online </app/schema/catalogue.js