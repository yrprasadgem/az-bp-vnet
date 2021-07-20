vnet_resource_group_name       = "rg-tftest-aksapp01"
vnet_name                      = "vnet-tftest-aksapp01"
#vnet_dns_servers               = "dns server name"
# Adding Standard DDoS Plan, and custom DNS servers (Optional)
#vnet_ddos_enable               = "true"
#ddos_plan_name                 = "ddos-prd-aksapp01"
firewall_subnet_address_prefix = ["10.69.1.0/24"]
bastion_subnet_address_prefix = ["10.69.2.0/24"]
vnet_address_space            = ["10.69.0.0/16"]
