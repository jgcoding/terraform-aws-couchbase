# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "ami_id" {
  description = "The ID of the AMI to run in the cluster. This should be an AMI built from the Packer template under examples/couchbase-ami/couchbase.json. Leave blank to use one of the example AMIs we have published publicly."
  default     = "ami-93ff89f2"
}

variable "target_vpc" {
  description = "VPC for the couchbase cluster"
  default     = "couchbase"  
}

variable "cluster_name" {
  description = "What to name the Couchbase cluster and all of its associated resources"
  default     = "couchbase"
}

variable "instance_type" {
  description = "Size of VM"
  default     = "m4.xlarge"
}

variable "ssh_key_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to an empty string to not associate a Key Pair."
  default     = "vlm-api-key"
}

variable "data_volume_device_name" {
  description = "The device name to use for the EBS Volume used for the data directory on Couchbase nodes."
  default     = "/dev/xvdh"
}

variable "data_volume_mount_point" {
  description = "The mount point (folder path) to use for the EBS Volume used for the data directory on Couchbase nodes."
  default     = "/couchbase-data"
}

variable "index_volume_device_name" {
  description = "The device name to use for the EBS Volume used for the index directory on Couchbase nodes."
  default     = "/dev/xvdi"
}

variable "index_volume_mount_point" {
  description = "The mount point (folder path) to use for the EBS Volume used for the index directory on Couchbase nodes."
  default     = "/couchbase-index"
}

variable "volume_owner" {
  description = "The OS user who should be made the owner of the data and index volume mount points."
  default     = "couchbase"
}

variable "couchbase_load_balancer_port" {
  description = "The port the load balancer should listen on for Couchbase Web Console requests."
  default     = 8091
}

variable "cluster_username {
  description = "The cluster username"
  default = "store_admin"
}

variable "cluster_password {
  description = "The cluster password"
  default = "4y8xs#7Cnk"
}

variable "test_user_name {
  description = "The test user name"
  default = "store_tester"
}

variable "test_user_password {
  description = "The test user password"
  default = "b3xf&cHNQH"
}

variable "test_bucket_name {
  description = "The test bucket name"
  default = "test-bucket"
}



variable "app_server_count" {}
variable "app_server_ip_start" {}

# Discover VPC
data "aws_vpc" "target_vpc" {
  filter = {
    name = "tag:Name"
    values = ["${var.target_vpc}"]
  }
}

# Discover subnet IDs. This requires the subnetworks to be tagged with Tier = "AppTier"
data "aws_subnet_ids" "app_tier_ids" {
  vpc_id = "${data.aws_vpc.target_vpc.id}"
  tags {
    Tier = "AppTier"
  }
}

# Discover subnets and create a list, one for each found ID
data "aws_subnet" "app_tier" {
  count = "${length(data.aws_subnet_ids.app_tier_ids.ids)}"
  id = "${data.aws_subnet_ids.app_tier_ids.ids[count.index]}"
}

resource "aws_instance" "app_server" {
  ...

  # Create N instances
  count = "${var.app_server_count}"

  # Use the "count.index" subnet
  subnet_id = "${data.aws_subnet_ids.app_tier_ids.ids[count.index]}"

  # Create an IP address using the CIDR of the subnet
  private_ip = "${cidrhost(element(data.aws_subnet.app_tier.*.cidr_block, count.index), var.app_server_ip_start + count.index)}"

  ...
}