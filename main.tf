resource "oci_data_safe_target_database" "data_safe_target_databases" {
  for_each = var.data_safe_target_databases

  compartment_id            = each.value.compartment_id
  defined_tags              = each.value.defined_tags
  description               = each.value.description
  display_name              = each.value.display_name
  freeform_tags             = each.value.freeform_tags
  manage_privileges_trigger = each.value.manage_privileges_trigger

  database_details {
    autonomous_database_id = each.value.database_details.autonomous_database_id
    database_type          = each.value.database_details.database_type
    db_system_id           = each.value.database_details.db_system_id
    infrastructure_type    = each.value.database_details.infrastructure_type
    instance_id            = each.value.database_details.instance_id
    ip_addresses           = each.value.database_details.ip_addresses
    listener_port          = each.value.database_details.listener_port
    pluggable_database_id  = each.value.database_details.pluggable_database_id
    service_name           = each.value.database_details.service_name
    vm_cluster_id          = each.value.database_details.vm_cluster_id
  }

  dynamic "connection_option" {
    for_each = each.value.connection_option != null ? [each.value.connection_option] : []
    content {
      connection_type              = connection_option.value.connection_type
      datasafe_private_endpoint_id = connection_option.value.datasafe_private_endpoint_id
      on_prem_connector_id         = connection_option.value.on_prem_connector_id
    }
  }

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      password  = credentials.value.password
      user_name = credentials.value.user_name
    }
  }

  dynamic "peer_target_database_details" {
    for_each = each.value.peer_target_database_details != null ? each.value.peer_target_database_details : []
    content {
      database_details {
        autonomous_database_id = peer_target_database_details.value.database_details.autonomous_database_id
        database_type          = peer_target_database_details.value.database_details.database_type
        db_system_id           = peer_target_database_details.value.database_details.db_system_id
        infrastructure_type    = peer_target_database_details.value.database_details.infrastructure_type
        instance_id            = peer_target_database_details.value.database_details.instance_id
        ip_addresses           = peer_target_database_details.value.database_details.ip_addresses
        listener_port          = peer_target_database_details.value.database_details.listener_port
        pluggable_database_id  = peer_target_database_details.value.database_details.pluggable_database_id
        service_name           = peer_target_database_details.value.database_details.service_name
        vm_cluster_id          = peer_target_database_details.value.database_details.vm_cluster_id
      }
      dataguard_association_id = peer_target_database_details.value.dataguard_association_id
      description              = peer_target_database_details.value.description
      display_name             = peer_target_database_details.value.display_name
      dynamic "tls_config" {
        for_each = peer_target_database_details.value.tls_config != null ? [peer_target_database_details.value.tls_config] : []
        content {
          certificate_store_type = tls_config.value.certificate_store_type
          key_store_content      = tls_config.value.key_store_content
          status                 = tls_config.value.status
          store_password         = tls_config.value.store_password
          trust_store_content    = tls_config.value.trust_store_content
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "tls_config" {
    for_each = each.value.tls_config != null ? [each.value.tls_config] : []
    content {
      certificate_store_type = tls_config.value.certificate_store_type
      key_store_content      = tls_config.value.key_store_content
      status                 = tls_config.value.status
      store_password         = tls_config.value.store_password
      trust_store_content    = tls_config.value.trust_store_content
    }
  }
}

