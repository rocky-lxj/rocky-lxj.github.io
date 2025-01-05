---
layout: post
title: "crawl base"
date: 2025-01-05 00:14:46 +0000
categories: [crawls]
tags: [python,crawls]
published: true
author : "rocky-lxj"
---
# python 爬虫



### format方法

> 当我们需要输出一个需要自己放置变量的东西时，可以使用format方法

```python
txt="我叫{xx},我今年{yy}岁".format(xx=?,yy=?)
#其中问号为自己想赋值的变量
#同样也是可以在print中使用
#若是要保留小数，那么直接format(xx=?:.2f,yy=?:.2f)
```



### 导包

> 1、import 模块名 （使用方法时，需要加上模块名）例:statistics.median()
>
> 2、from 模块名 import 方法名 （精确找到模块名中的方法，不需要再加上模块名）
>
> 3、from 模块名 import *(使用时不需要加上模块名，但是容易重复方法名，会出现冗余)
>
> windows 按住crl键点击函数名自动导包



### 捕获异常

> try方法：
>
> 放入你需要做的事情
>
> except ://如果出错，是这样的情况
>
> else:(接在except后面，如果是正确的)
>
> finally:（最终的进程做的事情）



### 读文件

> 1、如果读文件时，没有找到你传入文件(file not found错误)
>
> 2、open("相对路径"，"r",encoding="utf-8")//打开只读权限的文件
>
> 3、读取的时候是以字符串的形式读取
>
> 4、程序会记录读取到的位置(比如第一次print(f.read())//就会输出这个文本的所有，在调用一次就什么都不输出了，因为已经读完了)
>
> 5、readline()每次只读一行
>
> 6、readlines()方法，相当于read方法，把每一行做为一个单位，放入列表
>
> 7、若是以open方法打开，再最后需要用close方法关闭
>
> 8、一般来说，不单独使用open方法
>
> 例：with open("相对路径"，"r",encoding="utf-8") as f:
>
> //这样的话，他会自己使用完之后自动关闭



### 写文件

> 写文件有两个，w(只写)和a(附加)，若是想既能读又能写，那么是r+
>
> 若是文件不存在，那么会直接创建



### 多次请求未响应文件

> ```python
> requests.adapters.DEFAULT_RETRIES = 5
> #在request库中，使用该方法可以设置重新发送请求次数
> ```

### 抓取豆瓣top250

```python
import requests
from bs4 import BeautifulSoup
headers={
    "User-Agent":
}
wz="https://movie.douban.com/top250"
with open("./poem.txt","r+",encoding="utf-8") as f:
    for j in range(0,10):
        fid=wz
        if j>0:
            page=j*25
            fid+="?start="+str(page)+"&filter="
        response=requests.get(fid,headers=headers)#拿到了html属性
        content=response.text#翻译成txt文档
        soup=BeautifulSoup(content,"html.parser")#将他用指定的html语言翻译
        soupp=soup.findAll("span",attrs={"class":"title"})
        for i in soupp:
            s=i.string
            if '/' not in s :
                f.write(s+"\n")
with open("./poem.txt","r+",encoding="utf-8") as f:
    txt=f.readlines()
    for i in txt:
        print(i,end="")
```

