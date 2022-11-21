
terraform init
# 在当前的文件夹下进行初始化
# 会下载文件对应provider所需要的数据包(插件)
#   比如，本例中provider使用的AWS，那么init阶段就会下载相应的插件
#   当前文件夹的 .terraform\providers\registry.terraform.io\hashicorp\aws\4.39.0\linux_amd64\terraform-provider-aws_v4.39.0_x5

terraform plan

# 相当于dry-run，显示变更的内容
#   首次运行时，有些信息是会显示的，有些则会显示known after apply
# 对于不是首次运行的
#   会对比本地的status文件和当前的.tf文件的差分，显示变更的内容

terraform apply

# 实施变更前
#   会先显示一次plan的结果(实际上应该就是执行了一次plan)，输入yes确认后执行变更
#   如果plan的结果发现并没有发生差分，则不会提示继续实施变更   
# 除了使用provider的插件实施变更以外
#   如果本地没有，则会成一个status文件；如果已经有，则会更新
#       terraform.tfstate
# 


terraform destroy
# 删除