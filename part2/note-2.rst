

What's Terraform ?
==================

* IaC 工具
  
  | 　[Open source] & [vender agnostic]
  | 　vender agnostic
  | 　　　  -> 使用时用同一套代码可以在各种的云服务商平台上进行部署和管理, 无需另外的单独配置

* Single binary complied by GO
  
  | 　Terraform工具本身就是一个整合好的binary文件, 下载即用
  | 　工具本身使用Go语言开发和编译的

* Declarative syntax 声明式的语法
  
  | 　(其他的一些工具如k8s也是这种形式)
  | 　只需要定义目标状态, 无需定义具体的实现过程(这一部分工具会自动处理)

* 使用 HCL or JSON 格式定义需要的状态

  | 　HCL : 
  | 　　HashCorp Configuraton Language
  | 　　是Terraform公司自己做的一种定义格式

* Agentless (push mode) 

  | 　无需在其他的平台或者地方安装专门的agent
  | 　但这也意味着平台上无法推送实时的信息回给我们
  | 　所以使用的是从我们这边单向的 push 模式

Terraform Core Components
======================================================

* Terraform executable file
* Configuration files
* Provider plugins
* State data


First Class Demo
==========================

大致的流程

1. 安装Terroform
2. (服务provider侧的准备), 本次实验中我们准备一个访问AWS的credentials
3. 配置tf文件
4. 执行terrform的命令



1. Terraform Install 
======================================================

for WINDOWS
-----------------------

两步

  1. 下载可执行文件

    - 从这里下载, https://www.terraform.io/downloads
    - 将下载的exe文件保存到一个合适的位置, 比如 c:\terraform

  2. 添加PATH

    - 将刚保存exe的文件夹添加到path


| 然后直接新打开一个powershell
| 输入 terraform version 就可以确认当前的版本


for Linux or Mac OS
-----------------------

大体上，两种方法, 不多赘述

1. 使用yum，apt等软件工具安装
2. 直接下载binary文件，放到/user/local/bin下边


2. 准备一个访问AWS的credentials
====================================
就不详细配图了, 大致流程

1. 打开aws console, 进入iam
2. 做一个iam user
3. 生成一个这个user的access key和secret access key, 保存备用
4. ※ 注意给iam user添加相应的aws policy, 不然没权限


3. 配置tf文件
====================================

创建第一个tf文件
-----------------

``main.tf``

.. code-block:: terraform

    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 4.16"
        }
      }

      required_version = ">= 1.2.0"
    }

    provider "aws" {
      access_key = "********************"
      secret_key = "********************"
      region     = "eu-central-1"
    }

    resource "aws_vpc" "vpc" {
      cidr_block           = "10.0.0.0/16"
      enable_dns_hostnames = "true"
      tags = {
        Name = "my-vpc"
      }
    }

.. note::

  这里的access_key和secret_key换成刚才AWS的iam user
  


1. 执行terrform的命令
====================================

| 初次的执行时, 顺序是: 
| 　　init -> plan -> apply
| 之后修改tf文件后执行变更时, 顺序是: 
| 　　init -> plan -> apply

命令的说明
--------------

.. code-block:: bash

  terraform init

| 在当前的文件夹下进行初始化
| 　比如，本例中provider使用的AWS，
| 　那么init阶段就会下载相应的插件到当前文件夹的 
| 　　.terraform\providers\registry.terraform.io\hashicorp\aws\4.39.0\linux_amd64\terraform-provider-aws_v4.39.0_x5

.. code-block:: bash

  terraform plan

| 相当于dry-run，显示变更的内容
| 　首次运行时，有些信息是会显示的，有些则会显示known after apply
| 对于不是首次运行的时候
| 　会对比本地的status文件和当前的.tf文件的差分，显示变更的内容


.. code-block:: bash

  terraform apply

| 实施变更前
| 　会先显示一次plan的结果(实际上应该就是执行了一次plan)，输入yes确认后执行变更
| 　如果plan的结果发现并没有发生差分，则不会提示继续实施变更   
| 除了使用provider的插件实施变更以外
| 　如果本地没有，则会成一个status文件；如果已经有，则会更新
| 　　terraform.tfstate


.. code-block:: bash

  terraform destroy

| 删除当前定义的内容


