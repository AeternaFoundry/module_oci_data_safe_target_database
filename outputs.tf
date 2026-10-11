output "data_safe_target_databases_id" {
  description = "Map of id values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no id are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.id if v.id != null && length(v.id) > 0 }
}
output "data_safe_target_databases_associated_resource_ids" {
  description = "Map of associated_resource_ids values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no associated_resource_ids are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.associated_resource_ids if v.associated_resource_ids != null && length(v.associated_resource_ids) > 0 }
}
output "data_safe_target_databases_compartment_id" {
  description = "Map of compartment_id values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no compartment_id are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "data_safe_target_databases_connection_option" {
  description = "Map of connection_option values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no connection_option are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => one(v.connection_option) if v.connection_option != null && length(v.connection_option) > 0 }
}
output "data_safe_target_databases_credentials" {
  description = "Map of credentials values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no credentials are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => one(v.credentials) if v.credentials != null && length(v.credentials) > 0 }
  sensitive   = true
}
output "data_safe_target_databases_database_details" {
  description = "Map of database_details values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no database_details are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => one(v.database_details) if v.database_details != null && length(v.database_details) > 0 }
}
output "data_safe_target_databases_defined_tags" {
  description = "Map of defined_tags values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no defined_tags are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "data_safe_target_databases_description" {
  description = "Map of description values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no description are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.description if v.description != null && length(v.description) > 0 }
}
output "data_safe_target_databases_display_name" {
  description = "Map of display_name values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no display_name are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "data_safe_target_databases_features" {
  description = "Map of features values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no features are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.features if v.features != null && length(v.features) > 0 }
}
output "data_safe_target_databases_freeform_tags" {
  description = "Map of freeform_tags values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "data_safe_target_databases_lifecycle_details" {
  description = "Map of lifecycle_details values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "data_safe_target_databases_manage_privileges_trigger" {
  description = "Map of manage_privileges_trigger values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no manage_privileges_trigger are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.manage_privileges_trigger if v.manage_privileges_trigger != null }
}
output "data_safe_target_databases_peer_target_database_details" {
  description = "Map of peer_target_database_details values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no peer_target_database_details are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.peer_target_database_details if v.peer_target_database_details != null && length(v.peer_target_database_details) > 0 }
  sensitive   = true
}
output "data_safe_target_databases_peer_target_databases" {
  description = "Map of peer_target_databases values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no peer_target_databases are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.peer_target_databases if v.peer_target_databases != null && length(v.peer_target_databases) > 0 }
}
output "data_safe_target_databases_state" {
  description = "Map of state values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no state are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.state if v.state != null && length(v.state) > 0 }
}
output "data_safe_target_databases_system_tags" {
  description = "Map of system_tags values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no system_tags are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "data_safe_target_databases_time_created" {
  description = "Map of time_created values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no time_created are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "data_safe_target_databases_time_updated" {
  description = "Map of time_updated values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no time_updated are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}
output "data_safe_target_databases_tls_config" {
  description = "Map of tls_config values across all data_safe_target_databases, keyed the same as var.data_safe_target_databases except keys with no tls_config are omitted"
  value       = { for k, v in oci_data_safe_target_database.data_safe_target_databases : k => one(v.tls_config) if v.tls_config != null && length(v.tls_config) > 0 }
  sensitive   = true
}

