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
	python mujson_mgr.py -l -u $uid
fi
if [[ $lsid == 2 ]];then
	read -p "����˿ںţ� " uid
	cd /usr/local/shadowsocksr
	python mujson_mgr.py -l -p $uid
fi

echo "1.�޸�����"
echo "2.�޸ļ���"
echo "3.�޸�Э��"
echo "4.�޸Ļ���"
echo "5.�޸�Э�����"
echo "6.�޸Ļ�������"
echo "7.�޸�����"
echo "8.�޸Ķ˿�����"


read -p "��ѡ�� " ec
if [[ ! $ec =~ ^[1-8]$ ]]; then
	echo "${CWARNING}�������! ��������ȷ������!${CEND}"
else
	break	
fi
done

if [[ $ec == 1 ]];then
	read -p "�������룺 " upass
	cd /usr/local/shadowsocksr
	if [[ $lsid == 1 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -u $uid -k $upass
	fi
	if [[ $lsid == 2 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -p $uid -k $upass
	fi
fi
if [[ $ec == 2 ]];then
	echo "���ܷ�ʽ"
	echo '1.chacha20'
	echo '2.aes-128-cfb'
	echo '3.aes-256-cfb'
	echo '4.salsa20'
	echo '5.rc4-md5'
	while :; do echo
	read -p "������ܷ�ʽ�� " um
	if [[ ! $um =~ ^[1-5]$ ]]; then
		echo "${CWARNING}�������! ��������ȷ������!${CEND}"
	else
		break	
	fi
	done
	
	if [[ $um == 1 ]];then
		um1="chacha20"
	fi
	if [[ $um == 2 ]];then
		um1="aes-128-cfb"
	fi
	if [[ $um == 3 ]];then
		um1="aes-256-cfb"
	fi
	if [[ $um == 4 ]];then
		um1="salsa20"
	fi
	if [[ $um == 5 ]];then
		um1="rc4-md5"
	fi
	cd /usr/local/shadowsocksr
	if [[ $lsid == 1 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -u $uid -m $um1
	fi
	if [[ $lsid == 2 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -p $uid -m $um1
	fi
fi
if [[ $ec == 3 ]];then
	echo "Э�鷽ʽ"
	echo '1.origin'
	echo '2.auth_simple'
	echo '3.auth_sha1_v2'
	echo '4.auth_sha1_v4'
	echo '5.auth_aes128_md5'
	echo '6.auth_aes128_sha1'
	echo '7.verify_sha1'
	echo '8.verify_deflate'
	while :; do echo
	read -p "����Э�鷽ʽ�� " ux
	if [[ ! $ux =~ ^[1-8]$ ]]; then
		echo "${CWARNING}�������! ��������ȷ������!${CEND}"
	else
		break	
	fi
	done
	
	if [[ $ux == 1 ]];then
		ux1="origin"
	fi
	if [[ $ux == 2 ]];then
		ux1="auth_simple"
	fi
	if [[ $ux == 3 ]];then
		ux1="auth_sha1_v2"
	fi
	if [[ $ux == 4 ]];then
		ux1="auth_sha1_v4"
	fi
	if [[ $ux == 5 ]];then
		ux1="auth_aes128_md5"
	fi
	if [[ $ux == 6 ]];then
		ux1="auth_aes128_sha1"
	fi
	if [[ $ux == 7 ]];then
		ux1="verify_sha1"
	fi
	if [[ $ux == 8 ]];then
		ux1="verify_deflate"
	fi
	cd /usr/local/shadowsocksr
	if [[ $lsid == 1 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -u $uid -O $ux1
	fi
	if [[ $lsid == 2 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -p $uid -O $ux1
	fi
fi
if [[ $ec == 4 ]];then
	echo "������ʽ"
	echo '1.plain'
	echo '2.http_simple'
	echo '3.http_post'
	echo '4.tls1.2_ticket_auth'
	while :; do echo
	read -p "���������ʽ�� " uo
	if [[ ! $uo =~ ^[1-4]$ ]]; then
		echo "${CWARNING}�������! ��������ȷ������!${CEND}"
	else
		break	
	fi
	done
	
	if [[ $uo == 1 ]];then
		uo1="plain"
	fi
	if [[ $uo == 2 ]];then
		uo1="http_simple"
	fi
	if [[ $uo == 3 ]];then
		uo1="http_post"
	fi
	if [[ $uo == 4 ]];then
		uo1="tls1.2_ticket_auth"
	cd /usr/local/shadowsocksr
	if [[ $lsid == 1 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -u $uid -o $uo1
	fi
	if [[ $lsid == 2 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -p $uid -o $uo1
	fi
fi
if [[ $ec == 5 ]];then
	read -p "����Э������� " ux2
	cd /usr/local/shadowsocksr
	if [[ $lsid == 1 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -u $uid -G $ux2
	fi
	if [[ $lsid == 2 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -p $uid -G $ux2
	fi
fi
if [[ $ec == 6 ]];then
	read -p "������������� " uo2
	cd /usr/local/shadowsocksr
	if [[ $lsid == 1 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -u $uid -g $uo2
	fi
	if [[ $lsid == 2 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -p $uid -g $uo2
	fi
fi
if [[ $ec == 7 ]];then
	read -p "������������(G)�� " ut
	cd /usr/local/shadowsocksr
	if [[ $lsid == 1 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -u $uid -t $ut
	fi
	if [[ $lsid == 2 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -p $uid -t $ut
	fi
fi
if [[ $ec == 8 ]];then
	read -p "����˿����ƣ���1~80��90~100����"1-80,90-100"���� " ub
	cd /usr/local/shadowsocksr
	if [[ $lsid == 1 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -u $uid -f $ub
	fi
	if [[ $lsid == 2 ]];then
		cd /usr/local/shadowsocksr
		python mujson_mgr.py -e -p $uid -f $ub
	fi
fi