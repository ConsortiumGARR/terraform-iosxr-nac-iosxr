locals {
  call_home = flatten([
    for device in local.devices : [
      {
        key                        = device.name
        device_name                = device.name
        service_active             = try(local.device_config[device.name].call_home.service_active, local.defaults.iosxr.devices.configuration.call_home.service_active, null)
        sender_from                = try(local.device_config[device.name].call_home.sender.from, local.defaults.iosxr.devices.configuration.call_home.sender.from, null)
        sender_reply_to            = try(local.device_config[device.name].call_home.sender.reply_to, local.defaults.iosxr.devices.configuration.call_home.sender.reply_to, null)
        contact_email              = try(local.device_config[device.name].call_home.contact_email, local.defaults.iosxr.devices.configuration.call_home.contact_email, null)
        contact_smart_licensing    = try(local.device_config[device.name].call_home.contact_smart_licensing, local.defaults.iosxr.devices.configuration.call_home.contact_smart_licensing, null)
        phone_number               = try(local.device_config[device.name].call_home.phone_number, local.defaults.iosxr.devices.configuration.call_home.phone_number, null)
        street_address             = try(local.device_config[device.name].call_home.street_address, local.defaults.iosxr.devices.configuration.call_home.street_address, null)
        customer_id                = try(local.device_config[device.name].call_home.customer_id, local.defaults.iosxr.devices.configuration.call_home.customer_id, null)
        contract_id                = try(local.device_config[device.name].call_home.contract_id, local.defaults.iosxr.devices.configuration.call_home.contract_id, null)
        site_id                    = try(local.device_config[device.name].call_home.site_id, local.defaults.iosxr.devices.configuration.call_home.site_id, null)
        rate_limit                 = try(local.device_config[device.name].call_home.rate_limit, local.defaults.iosxr.devices.configuration.call_home.rate_limit, null)
        data_privacy_hostname      = try(local.device_config[device.name].call_home.data_privacy.hostname, local.defaults.iosxr.devices.configuration.call_home.data_privacy.hostname, null)
        data_privacy_level_normal  = try(local.device_config[device.name].call_home.data_privacy.level, local.defaults.iosxr.devices.configuration.call_home.data_privacy.level, null) == "normal" ? true : null
        data_privacy_level_high    = try(local.device_config[device.name].call_home.data_privacy.level, local.defaults.iosxr.devices.configuration.call_home.data_privacy.level, null) == "high" ? true : null
        http_proxy_name            = try(local.device_config[device.name].call_home.http_proxy.server, local.defaults.iosxr.devices.configuration.call_home.http_proxy.server, null)
        http_proxy_port            = try(local.device_config[device.name].call_home.http_proxy.port, local.defaults.iosxr.devices.configuration.call_home.http_proxy.port, null)
        source_interface           = try(local.device_config[device.name].call_home.source_interface, local.defaults.iosxr.devices.configuration.call_home.source_interface, null)
        syslog_throttling          = try(local.device_config[device.name].call_home.syslog_throttling, local.defaults.iosxr.devices.configuration.call_home.syslog_throttling, null)
        vrf                        = try(local.device_config[device.name].call_home.vrf, local.defaults.iosxr.devices.configuration.call_home.vrf, null)
        aaa_authorization          = try(local.device_config[device.name].call_home.aaa_authorization.active, local.defaults.iosxr.devices.configuration.call_home.aaa_authorization.active, null)
        aaa_authorization_username = try(local.device_config[device.name].call_home.aaa_authorization.username, local.defaults.iosxr.devices.configuration.call_home.aaa_authorization.username, null)
        mail_servers = try(length(local.device_config[device.name].call_home.mail_servers) == 0, true) ? null : [
          for mail_server in local.device_config[device.name].call_home.mail_servers : {
            mail_server_name = try(mail_server.name, local.defaults.iosxr.devices.configuration.call_home.mail_servers.name, null)
            priority         = try(mail_server.priority, local.defaults.iosxr.devices.configuration.call_home.mail_servers.priority, null)
          }
        ]
        profiles = try(length(local.device_config[device.name].call_home.profiles) == 0, true) ? null : [
          for profile in local.device_config[device.name].call_home.profiles : {
            profile_name                               = try(profile.name, local.defaults.iosxr.devices.configuration.call_home.profiles.name, null)
            active                                     = try(profile.active, local.defaults.iosxr.devices.configuration.call_home.profiles.active, null)
            anonymous_reporting_only                   = try(profile.anonymous_reporting_only, local.defaults.iosxr.devices.configuration.call_home.profiles.anonymous_reporting_only, null)
            destination_message_size_limit             = try(profile.message_size_limit, local.defaults.iosxr.devices.configuration.call_home.profiles.message_size_limit, null)
            destination_msg_format_short               = try(profile.message_format, local.defaults.iosxr.devices.configuration.call_home.profiles.message_format, null) == "short_text" ? true : null
            destination_msg_format_long                = try(profile.message_format, local.defaults.iosxr.devices.configuration.call_home.profiles.message_format, null) == "long_text" ? true : null
            destination_transport_method_email         = try(profile.transport_methods.email, local.defaults.iosxr.devices.configuration.call_home.profiles.transport_methods.email, null) == true ? true : null
            destination_transport_method_email_disable = try(profile.transport_methods.email, local.defaults.iosxr.devices.configuration.call_home.profiles.transport_methods.email, null) == false ? true : null
            destination_transport_method_http          = try(profile.transport_methods.http, local.defaults.iosxr.devices.configuration.call_home.profiles.transport_methods.http, null) == true ? true : null
            destination_transport_method_http_disable  = try(profile.transport_methods.http, local.defaults.iosxr.devices.configuration.call_home.profiles.transport_methods.http, null) == false ? true : null
            reporting_smart_call_home_data             = try(profile.reporting.smart_call_home_data, local.defaults.iosxr.devices.configuration.call_home.profiles.reporting.smart_call_home_data, null) == true ? true : null
            reporting_smart_call_home_data_disable     = try(profile.reporting.smart_call_home_data, local.defaults.iosxr.devices.configuration.call_home.profiles.reporting.smart_call_home_data, null) == false ? true : null
            reporting_smart_licensing_data             = try(profile.reporting.smart_licensing_data, local.defaults.iosxr.devices.configuration.call_home.profiles.reporting.smart_licensing_data, null) == true ? true : null
            reporting_smart_licensing_data_disable     = try(profile.reporting.smart_licensing_data, local.defaults.iosxr.devices.configuration.call_home.profiles.reporting.smart_licensing_data, null) == false ? true : null
            destination_addresses = try(length(profile.addresses) == 0, true) ? null : [
              for address in profile.addresses : {
                address_type        = try(address.type, local.defaults.iosxr.devices.configuration.call_home.profiles.addresses.type, null)
                destination_address = try(address.address, local.defaults.iosxr.devices.configuration.call_home.profiles.addresses.address, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].call_home, null) != null || try(local.defaults.iosxr.devices.configuration.call_home, null) != null
  ])
}

resource "iosxr_call_home" "call_home" {
  for_each                   = { for c in local.call_home : c.key => c }
  device                     = each.value.device_name
  service_active             = each.value.service_active
  sender_from                = each.value.sender_from
  sender_reply_to            = each.value.sender_reply_to
  contact_email              = each.value.contact_email
  contact_smart_licensing    = each.value.contact_smart_licensing
  phone_number               = each.value.phone_number
  street_address             = each.value.street_address
  customer_id                = each.value.customer_id
  contract_id                = each.value.contract_id
  site_id                    = each.value.site_id
  rate_limit                 = each.value.rate_limit
  data_privacy_hostname      = each.value.data_privacy_hostname
  data_privacy_level_normal  = each.value.data_privacy_level_normal
  data_privacy_level_high    = each.value.data_privacy_level_high
  http_proxy_name            = each.value.http_proxy_name
  http_proxy_port            = each.value.http_proxy_port
  source_interface           = each.value.source_interface
  syslog_throttling          = each.value.syslog_throttling
  vrf                        = each.value.vrf
  aaa_authorization          = each.value.aaa_authorization
  aaa_authorization_username = each.value.aaa_authorization_username
  mail_servers               = each.value.mail_servers
  profiles                   = each.value.profiles
}
