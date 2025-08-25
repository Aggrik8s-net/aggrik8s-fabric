resource "routeros_file" "test-rb509-01" {
  provider = routeros.rb5009-01
  name     = "test"
  contents = "This is a test"
}


resource "routeros_file" "test-rb509-02" {
  provider = routeros.rb5009-02
  name     = "test"
  contents = "This is a test"
}

resource "routeros_file" "test-crs305-01" {
  provider = routeros.crs305-01
  name     = "test"
  contents = "This is a test"
}

resource "routeros_file" "test-crs328-01" {
  provider = routeros.crs328-01
  name     = "test"
  contents = "This is a test"
}