#!/bin/bash

# 获取当前日期和时间
DATE=$(date +"%Y-%m-%d %H:%M:%S +0000")

# 获取文章标题
echo "Enter the post title:"
read TITLE

# 创建文件名（按日期格式命名）
FILENAME=$(date +"%Y-%m-%d")-$(echo $TITLE | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-').md

# 写入基本模板内容
cat >"_posts/$FILENAME" <<EOL
---
layout: post
title: "$TITLE"
date: $DATE
categories: []
tags: []
published: true
author : "rocky-lxj"
---
EOL

echo "New post created: _posts/$FILENAME"
