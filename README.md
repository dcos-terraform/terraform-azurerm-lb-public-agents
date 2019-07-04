[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/buildStatus/icon?job=dcos-terraform%2Fterraform-azurerm-lb-public-agents%2Fsupport%252F0.2.x)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-lb-public-agents/job/support%252F0.2.x/)

Azure LB Public Agents
============
This module create a load balancer to acces public agents externally

EXAMPLE
-------

```hcl
module "lb-public-agents" {
  source  = "dcos-terraform/lb-public-agents/azurerm"
  version = "~> 0.2.0"

  cluster_name = "production"

  location            = ["North Europe"]
  resource_group_name = "my-resource-group"
  additional_rules    = [{ frontend_port = 8080 }]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| instance\_nic\_ids | List of instance nic ids created by this module | list | n/a | yes |
| location | Azure Region | string | n/a | yes |
| num | How many instances should be created | string | n/a | yes |
| resource\_group\_name | Name of the azure resource group | string | n/a | yes |
| additional\_rules | List of additional rules | list | `<list>` | no |
| name\_prefix | Name Prefix | string | `""` | no |
| tags | Add custom tags to all resources | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| backend\_address\_pool | backend address pool |
| lb\_address | lb address |

