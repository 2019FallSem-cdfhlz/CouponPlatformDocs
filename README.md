## 查看文档

使用浏览器访问：http://shendianjiao:8080/ （助记：神电教，不要忘记带上端口号）

> 如果上面的地址无法访问，可以尝试直接用IP地址：http://172.81.239.128:8080/
> 感谢`@jiangzihao`同学贡献的域名
> 如果持续无法访问，请在微信群里`@Libre-`:handshake:

## 如何拥有仓库编辑权

请在微信群`@Libre-`

## 如何添加文档

> 添加文档的前提是拥有了仓库的编辑权。

将本仓库克隆到自己的电脑上（仅第一次编辑需要，之后只需`git pull`即可）：

> 本仓库绑定了两个托管平台，推荐执行第一条`git clone`，是腾讯的代码托管平台，速度比较快。

```shell
git clone git@git.code.tencent.com:ffffansz/2019semdoc.git

# 或者（两条执行其中一条即可）
git clone git@github.com:2019FallSem-cdfhlz/CouponPlatformDocs.git
```

然后按照以下步骤（以添加一篇题目为`install-docker`的文章为例）：

> 以下步骤在Windows/Linux平台均可，Windows平台下Markdown编辑器推荐Typora或VSCode:thumbsup:

1. 在`content/docs`目录下新建一个文件夹`install-docker`（自己操作时，将`install-docker`改成自己要添加的文章名称）
2. 在刚刚新建的`install-docker`文件夹下新建一个`index.md`文件
3. 在`index.md`的开头加入以下几行：
   ```shell
    ---
    title: '你的文章名称'
    date: 2019-02-11T19:27:37+08:00  // 编辑时间
    weight: 6                        // weight的值最好参考网站上已有的文档中的weight值，越大排得越后
    ---
   ```
4. 然后在`index.md`中输入文档内容即可

> 关于Markdown入门，可参阅[这篇文章](https://www.jianshu.com/p/191d1e21f7ed)。

编辑完成，保存文件，在仓库根目录下执行以下命令，提交你的更改：

```shell
git add --all . && git commit -m "<对本次修改的概述> by <你的名字或代号>"
git push
```

> 建议每次`git add`之前先`git pull`一下，把仓库的更新拉下来。如果对Git工具不太了解可以看[廖雪峰的Git教程](https://www.liaoxuefeng.com/wiki/896043488029600)，或者在群里提问什么的。

:point_up: 编辑完文档后尽量检查一下命令的正确性以及表述的清晰程度，**确保你的操作可以被他人直接复现**，也方便写实验报告的同学查阅，提高沟通效率。

等待一小段时间后，访问 http://shendianjiao:8080/ 即可查看更新后的文档。