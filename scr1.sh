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

tar -zcf ~/my_script/archive.tar ~/my_script/rezultat

scp ~/my_script/archive.tar gudini2@192.168.0.19:~/my_script/archive.tar

chmod +x ~/my_script/scr_dop.sh

scp -pq  ~/my_script/scr_dop.sh gudini2@192.168.0.19:'~/my_script/scr_dop.sh'

ssh gudini2@192.168.0.19 '~/my_script/scr_dop.sh'

chmod +x ~/my_script/scr1.sh



