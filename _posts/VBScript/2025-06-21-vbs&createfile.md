---
layout: post
title: "vbs&createfile"
date: 2025-06-21 01:40:04 +0000
categories: [VBScript]
tags: [VBScript]
published: true
author : "rocky-lxj"
---
## 输入文件名
```
dim Name
name = InputBox("Enter the file name")
msgBox "You entered: " & name
createfiles(name)
```

## create 函数实现

```
sub createfiles(file_name)
    dim base_path : base_path = "E:\\vbs\\excel\\"
    dim fso
    set fso = CreateObject("Scripting.FileSystemObject")
    dim path : path = base_path & file_name
    if not fso.FileExists(path) then
        dim file
        set file = fso.CreateTextFile(path, true)
        file.Close
    end if 
end sub
```
