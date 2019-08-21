#!/usr/bin/expect
set timeout 3
spawn mysqladmin -uroot -p password 11111111
expect  "password:" 
send "\r"
interact
