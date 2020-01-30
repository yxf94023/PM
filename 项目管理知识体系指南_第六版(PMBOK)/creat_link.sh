#! /bin/bash
#\brief 替换pmp中出现的链接跳转
#\author yuxunfeng
#\date 2020/01/30

#define
input_file=${1} #输入文件
#define

array_name=(" "
 "../第一章 引论/1.html#"
 "../第二章 项目运行环境/2.html#"
 "../第三章 项目过程和项目经理技能/3.html#"
 "../第四章 项目整合管理/4.html#"
 "../第五章 项目范围管理/5.html#"
 "../第六章 项目进度管理/6.html#"
 "../第七章 项目成本管理/7.html#"
 "../第八章 项目质量管理/8.html#"
 "../第九章 项目资源管理/9.html#"
 "../第十章 项目沟通管理/10.html#"
 "../第十一章 项目风险管理/11.html#"
 "../第十二章 项目采购管理/12.html#"
 "../第十三章 项目相关方管理/13.html#")
 
array_len=${#array_name[*]}
for i in $(egrep -o "见 [0-9]+(.[0-9]+)* 节" ${input_file});do
	
	echo "$i"
	#提取纯章节数字
	nums_chapter=$(echo "${i}" | egrep -o "[0-9]+(.[0-9]+)*")
	num_chapter=$(echo "${nums_chapter}" | awk -F"." '{print $1}')
	
	if [ "$num_chapter" -le "$array_len" ];then
	
		replace_str="见 <a href=\""${array_name[$num_chapter]}"${nums_chapter}\">${nums_chapter} 节</a>"
		echo $replace_str
		
		sed -i "s|见 ${nums_chapter} 节|${replace_str}|g" ${input_file}
	fi
done

