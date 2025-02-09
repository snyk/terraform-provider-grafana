resource "grafana_dashboard" "test" {
  config_json      = jsonencode({
    id             = 12345,
    title          = "Production Overview",
    tags           = [ "templated" ],
    timezone       = "browser",
    schemaVersion  = 16,
    version        = 0,
    refresh        = "25s"
  })
}

data "grafana_dashboard" "from_id" {
  dashboard_id = grafana_dashboard.test.dashboard_id
}

data "grafana_dashboard" "from_uid" {
  uid = grafana_dashboard.test.id
}
