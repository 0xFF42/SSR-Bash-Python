#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }

echo "��ѡ�����û�����"
echo '1.����û�'
echo '2.ɾ���û�'
echo '3.�޸��û�'
echo '4.��ʾ�û�������Ϣ'
echo '5.��ʾ�����û���Ϣ'
echo ""
while :; do echo
read -p "��ѡ�� " userc
if [[ ! $userc =~ ^[1-5]$ ]]; then
	echo "${CWARNING}�������! ��������ȷ������!${CEND}"
else
	break	
fi
done

if [[ $userc == 1 ]];then
	bash /usr/local/SSR-Bash-Python/user/add.sh
fi
if [[ $userc == 2 ]];then
	bash /usr/local/SSR-Bash-Python/user/del.sh
fi
if [[ $userc == 3 ]];then
	bash /usr/local/SSR-Bash-Python/user/edit.sh
fi
if [[ $userc == 4 ]];then
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
		python mujson_mgr.py -l -u $uid
	fi
	if [[ $lsid == 2 ]];then
		read -p "����˿ںţ� " uid
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -l -p $uid
	fi
fi
if [[ $userc == 5 ]];then
	cd /usr/local/shadowsocksr
	python mujson_mgr.py -l
fi
