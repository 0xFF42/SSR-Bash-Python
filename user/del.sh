#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }

echo "1.ʹ���û���"
echo "2.ʹ�ö˿�"
echo ""
while :; do echo
	read -p "��ѡ�� " lsid
	if [[ ! $lsid =~ ^[1-2]$ ]]; then
		echo "${CWARNING}�������! ��������ȷ������!${CEND}"
	else
		break	
	fi
done
if [[ $lsid == 1 ]];then
	read -p "�����û����� " uid
	cd /usr/local/shadowsocksr
	python mujson_mgr.py -d -u $uid
fi
if [[ $lsid == 1 ]];then
	read -p "����˿ںţ� " uid
	cd /usr/local/shadowsocksr
	python mujson_mgr.py -d -p $uid
fi