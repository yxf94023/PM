#! /bin/bash
#\brief 在纯文本中针对标题进行h标签的插入
#\author yuxunfeng
#\date 2020/02/08

#define
input_file=${1} #输入文件
#define

array_name=(
""
""
"h2"
"h3"
"h4"
)
array_len=${#array_name[*]}


#1 根据文件名 获取当前处理的章节信息
chapter=$(basename -s .html "${input_file}")

sed -i 's| |__|g' ${input_file}

for i in $(egrep -o "^${chapter}(\.[0-9]+)+__\S+" ${input_file});do
	
	echo "$i"
	#统计节点信息 根据数量 决定采用hx标签
	dots_num=$(echo "${i}" | awk -F"." '{print NF}')
	
	if [ "$dots_num" -lt "$array_len" ];then
	
		replace_str="<${array_name[$dots_num]}>${i}</${array_name[$dots_num]}>"
		echo $replace_str
		
		sed -i "s|^${i}|${replace_str}|g" ${input_file}
	fi
done

sed -i "s|^uu__|<li>|g" ${input_file}
sed -i 's|__| |g' ${input_file}


