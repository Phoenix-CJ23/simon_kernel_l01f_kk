#!/bin/bash

if [ -f no_config_in_jb ];then
	rm -f no_config_in_jb
fi

#for file in $(egrep -v '(^#|^$)' /root/SimpleKernel/.config)
#for file in $(egrep -v '(^#|^$)' /root/SimpleKernel/.config)
for file in $(egrep -v '(^#|^$)' /root/10c_l01f/l01f_kernel_10c/.config)
do
	grep "${file%=*}=" .config
	#if [ -z $ss ];then
	if [ $? -eq 1 ];then
		echo $file >> ./no_config_in_this_jb
	fi
done
