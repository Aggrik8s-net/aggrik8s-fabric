// rb5009-01
resource "routeros_system_identity" "rb5009-01_identity" {
  provider = routeros.rb5009-01
  name = "rb5009-01"
}
resource "routeros_system_clock" "rb5009-01_timezone" {
  provider = routeros.rb5009-01
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}

// rb5009-02
resource "routeros_system_identity" "rb5009-02_identity" {
  provider = routeros.rb5009-02
  name = "rb5009-02"
}
resource "routeros_system_clock" "rb5009-02_timezone" {
  provider = routeros.rb5009-02
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}

// crs305-02
resource "routeros_system_identity" "crs305-01_identity" {
  provider = routeros.crs305-01
  name = "crs305-01"
}
resource "routeros_system_clock" "crs305-01_timezone" {
  provider = routeros.crs305-01
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}

// crs305-02
resource "routeros_system_identity" "crs328-01_identity" {
  provider = routeros.crs328-01
  name = "crs328-01"
}
resource "routeros_system_clock" "crs328-01_timezone" {
  provider = routeros.crs328-01
  time_zone_name       = "America/New_York"
  time_zone_autodetect = false
}
