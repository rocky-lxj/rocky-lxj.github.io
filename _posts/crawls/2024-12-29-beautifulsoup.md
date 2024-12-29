---
layout: post
title: "beautifulsoup"
date: 2024-12-29 10:51:23 +0000
categories: [crawls]
tags: [beautifulsoup,crawls]
published: true
author : "rocky-lxj"
---

# BeautifulSoup

1、BeautifulSoup使用方法

```python
from bs4 import BeautifulSoup
#从bs4库拿出BeautifulSoup
#soup=BeautifulSoup(<文件位置>，解析器)
#！！
#soup.(html标签名称a\p\span...)返回html中第一次出现的标签值
#soup.find('标签名称'))返回html中第一次出现的标签值
#两者是相同的，但是find能更精确
#soup.find('标签名称',特殊例子(例如:class_(一定要加下划线)='xxx'))
#！！
#soup.findall('标签名称')返回符合要求的所有内容(列表)
```

2、select

```python
#select
#soup。select('.tang')某种选择器，id，class，标签...只要符合都返回，是一个列表
#例子
#soup.select(.tang>ul>li>a)返回的就是在.tang属性下的a的内容
#>代表一个层级
#如果不加>，就表示多个层级
```

3、想获取到标签内的文本

```python
#soup.a.text/get_text()/string
#text/get_text()可以获取某一个标签中所有的文本内容
#string只可以获取直系文本内容
```

4、获取标签中属性值

```python
#soup.a['href']
#找到标签当中的属性内容
```

