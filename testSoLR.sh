#!/bin/sh

#Date 2014-11-27
#Author Giorgos Papoutsis

URL="http://83.212.168.41:8080/apache-solr-1.4.1/select/"

curl -g $URL"/select/?q=%2Bdate%3A2014+%2Bagrovoc%3A[*+TO+*]+-URI%3A"$2"&version=2.2&start=0&rows=4&indent=on&fl=*%2Cscore&sort=random_10"$1"+asc" >./files/$1.txt

echo $1


exit
