tags = {
  "classification"    = "pbmm"
  "contact"           = "bernard.maltais@canada.ca; john.nephin@canada.ca; louis-eric.tremblay@canada.ca"
  "costcentre"        = "566811"
  "env"               = "template-test"
  "owner"             = "bernard.maltais@canada.ca; john.nephin@canada.ca; louis-eric.tremblay@canada.ca"
  "cloudusageprofile" = "3"
  "branch"            = "CIO"
}

env     = "ScDc"
group   = "CIO"
project = "ESLZ_PoC"

location = "canadacentral"

deployOptionalFeatures = {
  ddos_protection_plan       = false
  recovery_services_vault    = false
  security_center            = false
  sentinel                   = false
  update_management          = true
  deny_publicip_subscription = false
  deny_publicips_on_nics     = false
  jumpServer                 = true
}

## Optional Features variables ##

optionalFeaturesConfig = {
  recovery_services_vault = {
    sku                 = "Standard" # Sets the vault's SKU. Possible values include: Standard, RS0
    soft_delete_enabled = true       # Is soft delete enable for this Vault?
  }
  security_center = {
    email = "some@test.com"
    phone = "123-456-7890"
  }
}

network = {
  vnet = ["10.101.240.0/24"]
  subnets = {
    PAZ = ["10.101.240.0/27"]
    OZ  = ["10.101.240.32/27"]
    RZ  = ["10.101.240.64/27"]
    MAZ = ["10.101.240.96/27"]
  }
}
Landing-Zone-Next-Hop = "100.96.185.8"

domain = {
  public = {
    name = "eslz-poc.dev.ciso.ssc-spc.gc.ca"
  }
  private = {
    name                 = "eslz-poc.dev.local"
    registration_enabled = true # Set to true if auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled?
  }
}

L1_RBAC = {
  ownerNames = [
    "john.nephin@163dev.onmicrosoft.com",
    "bernard.maltais@163dev.onmicrosoft.com",
    "louis-eric.tremblay@163dev.onmicrosoft.com",
    "test-bernard.maltais@163dev.onmicrosoft.com"
  ]

  contributorNames = []

  readerNames = []
}

vmConfigs = {
  /*
  # Template for Linux server variables

  Server-Name = {
    deploy = bool # Optional. Default is true
    admin_username       = string # Optional. Default is "azureadmin" 
    admin_password       = string # Required
    os_managed_disk_type = string # Optional. Default is "StandardSSD_LRS"
    vm_size              = string # Required. Example: "Standard_D2s_v3"
    priority             = string # Optional. Default is "Regular". possible values are "Regular" or "Spot"
  }
  */

  SWJ-01 = {
    name           = "SWJ-Base01"
    admin_password = "Canada123!"
    vm_size        = "Standard_D2s_v3"
    priority       = "Spot"
  }
}
