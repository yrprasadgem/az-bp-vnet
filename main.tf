
module "azure_vnet_creation" {
  #source = "git::git@bitbucket.org:contournetworkdelivery/azure-vnet-module?ref=master"
  source = "git::git@bitbucket.org:reddiprasad/azure-vnet-module.git?ref=master"
  # Vnet creation
  vnet_address_space             = var.vnet_address_space
  vnet_resource_group_name       = var.vnet_resource_group_name
  vnet_name                      = var.vnet_name
  vnet_location                  = var.azure_regions_map["az1"]
  #vnet_dns_servers               = var.vnet_dns_servers
  vnet_tags                      = var.vnet_tags
  # Adding Standard DDoS Plan, and custom DNS servers (Optional)
  #vnet_ddos_enable               = var.vnet_ddos_enable
  #ddos_plan_name                 = var.ddos_plan_name # this value is commented

  # Azure firewall subnet updated
  firewall_subnet_address_prefix  = ["10.69.0.0/24"]
  firewall_service_endpoints      = []

  # Azure bastion subnet updated
  bastion_subnet_address_prefix  = ["10.69.4.0/24"]
  bastion_service_endpoints      = []

  subnets = {
    mgnt_subnet = {
      subnet_name           = "snet-tftest-ext01"
      subnet_address_prefix = ["10.69.1.0/24"]

      nsg_inbound_rules = [
        # [name, priority, direction, access, protocol, destination_port_range, source_address_prefix, destination_address_prefix]
        # To use defaults, use "" without adding any values.
        ["http_allow", "100", "Inbound", "Allow", "Tcp", "80", "*", "0.0.0.0/0"],
        ["https_allow", "101", "Inbound", "Allow", "", "443", "*", ""],
        ["tcp_8080_allow", "102", "Inbound", "Allow", "Tcp", "8080-8090", "*", ""],
      ]

      nsg_outbound_rules = [
        # [name, priority, direction, access, protocol, destination_port_range, source_address_prefix, destination_address_prefix]
        # To use defaults, use "" without adding any values.
        ["udp_outbound_allow", "103", "Outbound", "Allow", "Udp", "53", "", "0.0.0.0/0"],
      ]
      enforce_private_link_endpoint_network_policies  = false
      enforce_private_link_service_network_policies = true
    }

    tftest_subnet_svc  = {
      subnet_name   = "snet-tftest-123"
      subnet_address_prefix = ["10.69.12.0/24"]
      nsg_inbound_rules = []
      nsg_outbound_rules  = []
      service_endpoints     = []
      enforce_private_link_endpoint_network_policies  = true
      enforce_private_link_service_network_policies = true
    }
    postgres_sql_subnet_svc  = {
      subnet_name   = "snet-tftest-PvtApp128"
      subnet_address_prefix = ["10.69.128.0/18"]
      nsg_inbound_rules = []
      nsg_outbound_rules  = []
      service_endpoints     = []
      enforce_private_link_endpoint_network_policies  = true
      enforce_private_link_service_network_policies = true
    }

    dmz_subnet = {
      subnet_name           = "snet-tftest-int02"
      subnet_address_prefix = ["10.69.2.0/24"]
      nsg_inbound_rules = []
      nsg_outbound_rules = []
      enforce_private_link_endpoint_network_policies  = false
      enforce_private_link_service_network_policies = true
    }
  }
}
