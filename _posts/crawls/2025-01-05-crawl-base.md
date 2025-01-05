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

# 爬取三国演义项目

```python
#!/user/bin/env python3
# -*- coding: utf-8 -*-
import os
import random
import time
import chardet as chardet
import requests
from bs4 import BeautifulSoup


def GetCharset(content):
    return chardet.detect(content)['encoding']


if __name__ == '__main__':
    url='https://www.shicimingju.com/book/sanguoyanyi.html'
    headers = {
        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0',
    }
    response=requests.get(headers=headers,url=url)
    response.encoding = GetCharset(response.content)
    response=response.text
    # print(response)
    soup=BeautifulSoup(response,'lxml')
    # print(soup)
    res=soup.select('.book-mulu > ul > li ')
    title=[]
    find_url=[]
    # print(res)
    for i in res:
        title.append(i.a.string)
        find_url.append('https://www.shicimingju.com'+i.a['href'])
    # print(find_url)
    for i in range(0,len(title)):
        time.sleep(1)
        path='./三国演义爬取结果/'+title[i]+'.txt'
        with open(path,'w',encoding='utf-8') as f:
            ress=requests.get(url=find_url[i],headers=headers)
            ress.encoding = GetCharset(ress.content)
            ress = ress.text
            soupp=BeautifulSoup(ress,'lxml')
            wb=soupp.find_all('div',class_='chapter_content')[0].get_text()
            # print(wb)
            f.write(wb)
        print("第{}章已经存放好！！！".format(i+1))

```
## 简易网页爬取

```python
import requests

if __name__ == "__main__":
    url = "https://www.sogou.com/web"
    # 处理url携带参数：封装到字典
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0"
    }
    keyw = str(input('enter a word:'))
    params = {
        'query': keyw
    }
    response = requests.get(url=url, params=params, headers=headers)
    page = response.text
    filename = keyw + "的搜索结果"
    with open("./webresult/"+filename+".html", 'w', encoding='utf-8') as f:
        f.write(page)
    print("finish")
```

## 百度翻译

```python
import json

import requests
if __name__ == "__main__":
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0"
    }
    url="https://fanyi.baidu.com/sug"
    while True:
        s = input("您想查询?\n")
        data = {"kw":s}
        response=requests.post(url=url,data=data,headers=headers)
        # print(response.status_code)
        # #检验状态码，看是否能查询到
        result=response.json()
        res=result["data"]
        for i in res :
            print(i)
        # fp=open("./wordresult/result.json",'w',encoding="utf-8")
        #手动打开需要存储的位置
        # json.dump(result,fp=fp,ensure_ascii=False)
        #json文件下载

```

# 图片网页爬取数据

```python
import time
import random
import requests
import re
import os
from fake_useragent import UserAgent
from bs4 import BeautifulSoup

def found(s):
    ans = ''
    for i in s:
        if i != '<' and i != '>' and i != '/' and i != '\\' and i != '|' and i != ':' and i != '"' and i != '*' and i != '?':
            ans = ans + i
    return ans


if __name__ == "__main__":
    # ua = UserAgent(r'D:\python文件\爬虫\fake_useragent.json').random
    headers = {
        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0'
    }
    user_agent_list = [
        "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36",
        "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36",
        "Mozilla/5.0 (Windows NT 10.0; …) Gecko/20100101 Firefox/61.0",
        "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36",
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36",
        "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36",
        "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)",
        "Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.5; en-US; rv:1.9.2.15) Gecko/20110303 Firefox/3.6.15",
        ]

    url = 'https://pic.netbian.com/'
    for i in range(1,100):
        time.sleep(1)
        new_url = url
        if i > 1:
            new_url = new_url + 'index_' + str(i) + '.html'
        # print(new_url)
        # headers['User-Agent'] = random.choice(user_agent_list)
        response = requests.get(headers=headers, url=new_url).text.encode('iso-8859-1').decode('gbk')
        path = './图片爬取数据/第' + str(i) + '页的数据/'
        if os.path.isdir(path) == False:
            os.mkdir(path)
        # with open(path + '第' + str(i) + '页.html', 'w', encoding='utf-8') as f:
        #     f.write(response)
        ex1 = '<li><a.*?<img src="(.*?)".*?><b>.*?<\/b><\/a><\/li>'
        ex2 = '<li><a.*?<b>(.*?)<\/b><\/a><\/li>'
        list1 = re.findall(ex1, response, re.S)
        list2 = re.findall(ex2, response, re.S)
        for j in range(0, len(list1)):
            name = found(list2[j])
            print(name)
            requests.adapters.DEFAULT_RETRIES = 5
            ans = requests.get(url='https://pic.netbian.com' + list1[j], headers=headers).content
            with open(path + name + '.jpg', 'wb') as f:
                f.write(ans)
        print("第{}页下载完成，一共下载{}张".format(i, len(list1)))

```


