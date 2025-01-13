---
layout: post
title: "problem in crawl and os"
date: 2025-01-04 23:42:36 +0000
categories: [爬虫]
tags: [os,爬虫]
published: true
author : "rocky-lxj"
---
# 爬取文件导入本地常见错误

### 1、导入html页面的文字类型是不对的

```python
#使用chardet库
import chardet 
#再导入获取html页面时将他的encoding转化成当前的页面的文字
ress=requests.get(url=find_url[i],headers=headers)
ress.encoding = chardet.detect(ress.content)['encoding']#detect检测
```

### 2、写入图片

```python
#将图片保存在本地的时候,使用二进制去保存
#首先是要他的内容(content)
ans = requests.get(url='https://pic.netbian.com' + list1[j], headers=headers).content
with open(path + name + '.jpg', 'wb') as f:
     f.write(ans)
```

### 3、访问太过于频繁，服务器拒绝响应

```python
#导入time库使用sleep
import time
time.sleep(1)
```

### 4、响应的user-agent只有一个

```python
#提前导入一个列表包含已有的user-agent
#导入random库，然后random一个user-agent
import random
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
headers['User-Agent'] = random.choice(user_agent_list)
```

# os

### 动态建立文件

```python
import os
path = './图片爬取数据/第' + str(i) + '页的数据/'
if os.path.exists(path) == False:
    #查看该路径是否存在
   os.mkdir(path)
```

