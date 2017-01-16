#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }

echo "��ѡ���˷���������"
echo "1.�鿴����������״̬"
echo "2.��������"
echo "3.ֹͣ����"
echo "4.��������־�ķ���"
echo "5.�鿴��־"
echo "6.�޸�DNS"

while :; do echo
read -p "��ѡ�� " serverc
if [[ ! $serverc =~ ^[1-6]$ ]]; then
	echo "${CWARNING}�������! ��������ȷ������!${CEND}"
else
	break	
fi
done

if [[ $serverc == 1 ]];then
	ps aux|grep server.py
fi
if [[ $serverc == 2 ]];then
	cd /usr/local/shadowsocksr
	bash run.sh
fi
if [[ $serverc == 3 ]];then
	cd /usr/local/shadowsocksr
	bash stop.sh
fi
if [[ $serverc == 4 ]];then
	cd /usr/local/shadowsocksr
	bash logrun.sh
fi
if [[ $serverc == 5 ]];then
	cd /usr/local/shadowsocksr
	bash tail.sh
fi
if [[ $serverc == 6 ]];then
	read -p "������Ҫ DNS ������: " ifdns1
	read -p "�����Ҫ DNS ������: " ifdns2
	echo "nameserver $ifdns1" > /etc/resolv.conf
	echo "nameserver $ifdns2" >> /etc/resolv.conf
	echo "DNS ������������Ϊ  $ifdns1 $ifdns2"
fi