variable "data_safe_target_databases" {
  description = <<EOT
Map of data_safe_target_databases, attributes below
Required:
    - compartment_id
    - database_details (block):
        - autonomous_database_id (optional)
        - database_type (required)
        - db_system_id (optional)
        - infrastructure_type (required)
        - instance_id (optional)
        - ip_addresses (optional)
        - listener_port (optional)
        - pluggable_database_id (optional)
        - service_name (optional)
        - vm_cluster_id (optional)
Optional:
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - manage_privileges_trigger
    - connection_option (block):
        - connection_type (required)
        - datasafe_private_endpoint_id (optional)
        - on_prem_connector_id (optional)
    - credentials (block):
        - password (required)
        - user_name (required)
    - peer_target_database_details (block):
        - database_details (required, block):
            - autonomous_database_id (optional)
            - database_type (required)
            - db_system_id (optional)
            - infrastructure_type (required)
            - instance_id (optional)
            - ip_addresses (optional)
            - listener_port (optional)
            - pluggable_database_id (optional)
            - service_name (optional)
            - vm_cluster_id (optional)
        - dataguard_association_id (optional)
        - description (optional)
        - display_name (optional)
        - tls_config (optional, block):
            - certificate_store_type (optional)
            - key_store_content (optional)
            - status (required)
            - store_password (optional)
            - trust_store_content (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - tls_config (block):
        - certificate_store_type (optional)
        - key_store_content (optional)
        - status (required)
        - store_password (optional)
        - trust_store_content (optional)
EOT

  type = map(object({
    compartment_id            = string
    defined_tags              = optional(map(string))
    description               = optional(string)
    display_name              = optional(string)
    freeform_tags             = optional(map(string))
    manage_privileges_trigger = optional(number)
    database_details = object({
      autonomous_database_id = optional(string)
      database_type          = string
      db_system_id           = optional(string)
      infrastructure_type    = string
      instance_id            = optional(string)
      ip_addresses           = optional(list(string))
      listener_port          = optional(number)
      pluggable_database_id  = optional(string)
      service_name           = optional(string)
      vm_cluster_id          = optional(string)
    })
    connection_option = optional(object({
      connection_type              = string
      datasafe_private_endpoint_id = optional(string)
      on_prem_connector_id         = optional(string)
    }))
    credentials = optional(object({
      password  = string
      user_name = string
    }))
    peer_target_database_details = optional(list(object({
      database_details = object({
        autonomous_database_id = optional(string)
        database_type          = string
        db_system_id           = optional(string)
        infrastructure_type    = string
        instance_id            = optional(string)
        ip_addresses           = optional(list(string))
        listener_port          = optional(number)
        pluggable_database_id  = optional(string)
        service_name           = optional(string)
        vm_cluster_id          = optional(string)
      })
      dataguard_association_id = optional(string)
      description              = optional(string)
      display_name             = optional(string)
      tls_config = optional(object({
        certificate_store_type = optional(string)
        key_store_content      = optional(string)
        status                 = string
        store_password         = optional(string)
        trust_store_content    = optional(string)
      }))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    tls_config = optional(object({
      certificate_store_type = optional(string)
      key_store_content      = optional(string)
      status                 = string
      store_password         = optional(string)
      trust_store_content    = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_safe_target_databases : (
        contains([for v in ["AUTONOMOUS_DATABASE", "DATABASE_CLOUD_SERVICE", "INSTALLED_DATABASE"] : lower(v)], lower(v.database_details.database_type))
      )
    ])
    error_message = "must be one of: \"AUTONOMOUS_DATABASE\", \"DATABASE_CLOUD_SERVICE\", \"INSTALLED_DATABASE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_target_databases : (
        v.connection_option == null || (contains([for v in ["ONPREM_CONNECTOR", "PRIVATE_ENDPOINT"] : lower(v)], lower(v.connection_option.connection_type)))
      )
    ])
    error_message = "must be one of: \"ONPREM_CONNECTOR\", \"PRIVATE_ENDPOINT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_target_databases : (
        v.peer_target_database_details == null || alltrue([for item in v.peer_target_database_details : (contains([for v in ["AUTONOMOUS_DATABASE", "DATABASE_CLOUD_SERVICE", "INSTALLED_DATABASE"] : lower(v)], lower(item.database_details.database_type)))])
      )
    ])
    error_message = "must be one of: \"AUTONOMOUS_DATABASE\", \"DATABASE_CLOUD_SERVICE\", \"INSTALLED_DATABASE\""
  }
}

