variable "db_port" {
  type = object({
    external = number
    internal = number
    protocol = string
  })

  default = {
    external = 5432
    internal = 5433
    protocol = "tcp"
  }

}