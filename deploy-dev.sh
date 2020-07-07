#!/bin/bash
COLOR_G="\x1b[0;32m" #绿色
COLOR_R="\x1b[1;31m" #红色
RESET="\x1b[0m"

STR_ERR="[程序出错!!！ 请仔细检查!!!!!!]"
STR_OK="[通过!]"

MSG_ERR=$COLOR_R$STR_ERR$RESET
MSG_OK=$COLOR_G$STR_OK$RESET

myexit()
{
if [ $1 -ne 0 ]
then
    echo -e $MSG_ERR ;
    exit ;
fi
}

echo Deploy Project
# docker-compose up -d --force-recreate --build

# 获取最新版代码
git pull
myexit $?
echo -e $MSG_OK
# 强制重新编译容器
docker-compose down
docker-compose up -d --force-recreate --build


# 定制镜像
# docker build -t myapp:pm2 ./backend

# 重启启动容器
# docker stop myapp
# docker rm myapp
# docker run --name myapp -p 3000:3000  -d myapp:pm2