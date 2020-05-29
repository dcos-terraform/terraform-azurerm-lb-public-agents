/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/buildStatus/icon?job=dcos-terraform%2Fterraform-azurerm-lb-public-agents%2Fsupport%252F0.2.x)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-lb-public-agents/job/support%252F0.2.x/)
 *
 * Azure LB Public Agents
 * ============
 * This module create a load balancer to acces public agents externally
 *
 * EXAMPLE
 * -------
 *
 *```hcl
 * module "lb-public-agents" {
 *   source  = "dcos-terraform/lb-public-agents/azurerm"
 *   version = "~> 0.2.0"
 *
 *   cluster_name = "production"
 *
 *   location            = ["North Europe"]
 *   resource_group_name = "my-resource-group"
 *   additional_rules    = [{ frontend_port = 8080 }]
 * }
 *```
 */

provider "azurerm" {
  version = "~> 2.3"
  features {
  }
}

module "public-agents" {
  source  = "dcos-terraform/lb/azurerm"
  version = "~> 0.2.0"

  cluster_name = var.cluster_name
  name_prefix  = var.name_prefix

  location            = var.location
  resource_group_name = var.resource_group_name

  instance_nic_ids = [var.instance_nic_ids]

  lb_name_format = "ext-%[1]s-%s"

  providers = {
    azurerm = azurerm
  }

  additional_rules = [var.additional_rules]

  probe = {
    port         = 9090
    protocol     = "Http"
    request_path = "/_haproxy_health_check"
  }

  num = var.num

  tags = var.tags
}

