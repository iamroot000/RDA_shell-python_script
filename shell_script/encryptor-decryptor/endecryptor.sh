#!/bin/bash
#Author: Nikko Rei Aratan
#Last Modified: December 04, 2021
#Project: RDA (AutoKinit)
echo "#############################################"
echo "# this encryptor/decryptor is using openssl #"
echo "#############################################"
sleep 1;
function encrypthis
{
	#echo "Choose ciphers: "
	echo "### By Default if will use AES256 ###"
	sleep 1;
	echo "Enter String to Encrypt: " 
	read str_enc
	echo "Please confirm input: $str_enc"
	echo "1. Proceed"
	echo "2. Retry"
	read confirmation
	if [ $confirmation = "1" ]
		then
			enc_pass=$( echo $str_enc | openssl enc -e -aes256 -base64 -pass pass:testpass -pbkdf2)
		else
			encrypthis
	fi
	echo "Processing"
	sleep 2
	echo "Your encrypted string is: $enc_pass"
	echo "Please save your encrypted string . . ."
}

function decrypthis
{
	#echo "Choose ciphers: "
	echo "### By Default if will use AES256 ###"
	sleep 1;
	echo "Enter String to Encrypt: " 
	read str_dec
	echo "Please confirm input: $str_dec"
	echo "1. Proceed"
	echo "2. Retry"
	read confirmation
	if [ $confirmation = "1" ]
		then
			dec_pass=$( echo $str_dec | openssl enc -d -aes256 -base64 -pass pass:testpass -pbkdf2)
		else
			decrypthis
	fi
	echo "Processing"
	sleep 2
	echo "Your decrypted string is: $dec_pass"
	echo "Please save your decrypted string . . ."
}
echo "Please select number:"
echo "1. Encrypt String"
echo "2. Decrypt String"
read choice
case $choice in
	1 )
		encrypthis
	;;
	2 )
		decrypthis
	;;
esac
exit




# decrypthis
# exit