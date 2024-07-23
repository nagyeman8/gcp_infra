variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "internal1" {
  type = string
}

variable "internal2" {
  type = string
}

variable "external1" {
  type = string
}

variable "external2" {
  type = string
}

variable "network_tier" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "network" {
  type = string
}

variable "location" {
  type = string
}

variable "repository_id" {
  type = string
}

variable "format" {
  type = string
}

variable "immutable_tags" {
  type = string
}

variable "dataset_id" {
  type = string
}

variable "friendly_name" {
  type = string
}

variable "default_table_expiration_ms" {
  type = string
}

variable "env" {
  type = string
}

variable "table_id" {
  type = string
}

variable "deletion_protection" {
  type = string
}

variable "type" {
  type = string
}

variable "default" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "block-project-ssh" {
  type = string
}

variable "integrity-monitoring" {
  type = string
}

variable "vtpm" {
  type = string
}

variable "inf_override_tags" {
  type    = map(string)
  default = {}
}

variable "zone" {
  type = string
}

variable "image" {
  type = string
}

variable "preemptible" {
  type = string
}

variable "enable_vtpm" {
  type = string
}


variable "database" {
  type = string
}

variable "database_version" {
  type = string
}

variable "root_password" {
  type = string
}

variable "tier" {
  type = string
}

variable "ssl_mode" {
  type = string
}

variable "vpc_network" {
  type = string
}

variable "auto_create_subnetworks" {
  type = string
}

variable "ip_cidr_range" {
  type = string
}

variable "stack_type" {
  type = string
}

variable "nat" {
  type = string
}

variable "router" {
  type = string
}

variable "nat_ip_allocate_option" {
  type = string
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type = string
}

variable "enable" {
  type = string
}

variable "filter" {
  type = string
}

variable "peering" {
  type = string
}

variable "network2" {
  type = string
}

variable "peer_network2" {
  type = string
}

variable "max_instances" {
  type = number
}

variable "min_instances" {
  type = number
}

variable "connector" {
  type = string
}

variable "ipv4_range" {
  type = string
}

variable "purpose" {
  type = string
}

variable "address_type" {
  type = string
}

variable "address" {
  type = string
}

variable "prefix_length" {
  type = string
}

variable "ip_version" {
  type = string
}

variable "image_storage_bucket_name" {
  type = string
}

variable "force_destroy" {
  type = string
}

variable "storage_class" {
  type = string
}

variable "uniform_bucket_level_access" {
  type = string
}

variable "environment" {
  type = string
}

variable "image_storage_bucket1" {
  type = string
}
