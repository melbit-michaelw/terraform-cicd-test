variable "access_key" {}
variable "secret_key" {}

variable "name" {
    default = "Test"
}

variable "env" {
    default = "dev"
}

variable "nats_required" {
    default = 1
}

variable "number_of_azs" {
    default = 3
}

variable "region" {
    default = "ap-southeast-2"
}
