variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "display_name" {
  type = string
}

variable "filter" {
  type = string
}

variable "notification_channels" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "mon_override_tags" {
  type    = map(string)
  default = {}
}

variable "infra_email" {
  type = string
}

variable "app_email" {
  type = string
}

variable "sec_email" {
  type = string
}