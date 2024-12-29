---
layout: post
title:  "Create Github Pages+Jekyll Chirpy "
date:   2024-12-25 01:53:52 +0000
categories: jekyll
tags: [jekyll,github-io]
published: true
---
> 本文旨在搭建一个github.io个人主页项目
> 操作系统win11+vscode+docker

## 准备工作

### Ruby&Jekll
> 下载[Ruby&Jekll](https://rubyinstaller.org/downloads/)
> 1.选择最新版本进行，否则会导致后续出现问题，满足RubyGems version >=3.3.22，安装时将gem源改为[清华源](https://mirrors.tuna.tsinghua.edu.cn/help/rubygems/)
> 2.打开exe执行文件 操作过程中会弹出cmd，需要输出选择选项 此时选择3
> 3.安装结束，打开新的cmd，安装Jekyll
> ```
> gem install jekyll bundler
> ```
> 4.检查是否安装成功,查看jekyll版本
> ```
> jekyll -v
> ```

### Docker
> 1.windows系统安装[Docker Deskbook](https://app.docker.com/)，搭建linux环境
> 2.下载到本地之后，若有需要在指定盘进行安装(下文以D举例)
> 3.打开cmd
> ```
> "D:\download\Docker Desktop Installer.exe"  install --installation-dir="PATH"
> ```
> PS:最好不要修改默认保存路径，会死
> 4.若有汉化需求,[打开此网站](https://github.com/asxez/DockerDesktop-CN),找到对应的版本号(与docker版本一致)，阅读readme进行安装

### github-io
> 1.[打开此网页](https://github.com/cotes2020/chirpy-starter)进行快速化定制
> 2.Use this temple -> create a new respository
> 3.命名新仓库名称为 USERNAME.github.io , 这里面USERNAME 是你的Github的用户名。
> 在仓库中点击右上角设置后，找到pages设置，将Source修改为 Github Action。
> 修改仓库中 _config.yml 文件的第26行的 url，改为自己的 https://USERNAME.github.io即可

## 本地部署
> 1.打开Docker Desktop并且打开vscode
> 2.安装[Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
> 3.vscode clone  github.io
> 4.进行Docker配置
> 5.打开终端编辑,执行一下配置命令
> ```
> bundle
> ```

## 基础设置
### 头像设置
> 将对应头像设置为avatar.png,存入asset
> 将_config.yml文件中的avatar路径修改为相对路径

### 语言/时间/侧边栏/标语
> timezone: 中国输入 Asia/Shanghai
>
>
> lang: 语言，默认英文。中文设置zh-CN
>
> title: 侧边栏名称
>
> tagline:自己的标语

## 本地调试及上传
> 打开终端,执行操作，并预留端口
> ```
> bundle exec jekyll s
> ```
> 当上传至github时,可能遇到不能及时适配,在项目中的**Action**中build and deply 中**run workflow**

## 发布文章
> jekyll适配markdown文件，所以文章其实是以markdown形式发出的
> 下载[jekyll-compose](https://rubygems.org/gems/jekyll-compose)
> 参考该[项目](https://rubygems.org/gems/jekyll-compose)
> 当需要写文章的时候在终端输入
> ```
> bundle exec jekyll new _posts/(名字).md
> ```


## 参考地址
> [【避坑篇】使用Github Pages搭建个人主页or博客网站](https://zhuanlan.zhihu.com/p/641525444)
>
>
> [【快速部署+客制化】Github Pages+Jekyll Chirpy 速搭个人主页](https://zhuanlan.zhihu.com/p/695291923)
>
> [using-the-chirpy-starter](https://chirpy.cotes.page/posts/getting-started/#option-1-using-the-chirpy-starter)
>
> [Windows10 docker安装D盘，更改docker镜像默认保存路径](https://www.cnblogs.com/luzhuangzhi/p/17869210.html#:~:text=1%E3%80%81%E8%BF%90%E8%A1%8Cdocker%EF%BC%8C%E8%BF%9B%E5%85%A5%E8%AE%BE%E7%BD%AE%E9%A1%B5%EF%BC%8C%E7%82%B9%E5%87%BBResources%E9%80%89%E9%A1%B9%EF%BC%8C%E5%8F%91%E7%8E%B0%E9%95%9C%E5%83%8F%E9%BB%98%E8%AE%A4%E5%AE%89%E8%A3%85%E5%9C%A8%25UserProfile%25%5B%26AppDataLocal%26%5DDockerwsl%E7%9B%AE%E5%BD%95%E4%B8%8B%202%E3%80%81%E7%82%B9%E5%87%BBBrowse%E6%8C%89%E9%92%AE%EF%BC%8C%E9%80%89%E6%8B%A9%E8%87%AA%E5%AE%9A%E4%B9%89%E7%9A%84%E5%85%B6%E4%BB%96%E7%9B%98%E8%B7%AF%E5%BE%84%EF%BC%8C%E4%BE%8B%E5%A6%82%EF%BC%9AD%3AProgram%20%E5%A6%82%E4%B8%8B%E5%9B%BE%E6%89%80%E7%A4%BA%EF%BC%9A,3%E3%80%81%E6%9C%80%E5%90%8E%E7%82%B9%E5%87%BBApply%20%26%20restart%E6%8C%89%E9%92%AE%E9%87%8D%E5%90%AFDocker%E5%8D%B3%E5%8F%AF%E7%94%9F%E6%95%88%E3%80%82)

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
