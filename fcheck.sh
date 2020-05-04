#!/bin/bash

echo -e "----------------------------------"
echo -e "       FCheck v1.0"
echo -e "       By RUTERA"
echo -e "----------------------------------\n"

echo "Enter your DOMAIN: (ex. http://domain.com or https://domain.com )"
read domain
echo "Enter time wait seconds: (ex. 5)"
read timewait
echo "Enter file extension: .php .txt .htaccess"
read ext
echo -e "===================[Scanning]===================\n"

### ADD file name like ex.(info infophp test admin phpcheck and etc.) separated by an interval.
prefixes="info curl"

url="$domain"
for prefix in $prefixes; do
  name="${prefix}."$ext

sleep $timewait
if wget --spider -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36" $url/$name 2>/dev/null; then
  echo -e "File exists\n -> " $url/$name
else
  echo "File does not exist"
fi
done
