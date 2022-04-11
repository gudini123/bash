#!/bin/bash
> ~/my_script/rezultat
echo "Введите название таблицы"
read table
while read text; do
	array[$i]=$text
	echo ${array[$i]}
	i=$(($i+1))
done < ~/my_script/$table

for (( i = 0; i < ${#array[@]}; i++ )); do
	echo ${array[$i]}>> ~/my_script/rezultat
done

tar -cvj ~/my_script/rezultat | ssh gudini2@192.168.0.19 "tar -xj --strip-components=3 -C ~/my_script"

chmod +x ~/my_script/scr1.sh



