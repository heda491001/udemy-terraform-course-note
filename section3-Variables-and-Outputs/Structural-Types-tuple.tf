variable "tuple_test" {

  type = tuple([string, number , string])

  description = "tuple test"

  default = ["a", 15, true]

}