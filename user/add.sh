#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }

echo "��ѡ��������û�"
echo ""
read -p "�����û����� " uname
read -p "����˿ڣ� " uport
read -p "�������룺 " upass
echo ""
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
fi
read -p "����Э������� " ux2
read -p "������������� " uo2
read -p "������������(G)�� " ut
read -p "����˿����ƣ���1~80��90~100����"1-80,90-100"���� " ub

cd /usr/local/shadowsocksr
python mujson_mgr.py -a -u $uname -p $uport -k $upass -m $um1 -O $ux1 -o $uo1 -G $ux2 -g $uo2 -t $ut -f $ub