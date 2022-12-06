variable "name_label" {

  type = string           // 类型(必须)
  description = "value"   // 说明(可选)
  default = "value"       // 默认值(可选)
  sensitive = true        // 是否为敏感信息(可选) , 若是, 则一些输出在打印信息时会masking掉

}