# consul template
consul {
  address = "localhost:8500"

  retry {
    enabled  = true
    attempts = 12
    backoff  = "250ms"
  }
}

vault {
  renew_token = false
}

template {
  source      = "config.ini.tpl"
  destination = "config.ini"
  command     = "cat config.ini"
}

// template {
//   source      = "nginx.conf.tpl"
//   destination = "nginx.conf"
//   command     = "echo \"systemctl reload nginx\""
// }