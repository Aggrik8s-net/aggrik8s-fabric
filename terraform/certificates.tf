
//
//  crs328-01
//

/*
import {
  to = routeros_system_certificate.rb5009-01
  id = "*9"
}

import {
  to = routeros_system_certificate.webfig_rb5009-01
  id = "*A"
}

resource "routeros_system_certificate" "rb5009-01" {
  provider = routeros.rb5009-01
  name     = "rb5009-01"
  common_name = "192.168.88.2"
}

resource "routeros_system_certificate" "webfig_rb5009-01" {
  provider = routeros.rb5009-01
  name     = "webfig"
  common_name = "192.168.88.2"
}
*/


# routeros_system_certificate.crs305-01:
resource "routeros_system_certificate" "crs305-01" {
    provider         = routeros.crs305-01
    // authority        = "true"
    common_name      = "192.168.88.4"
    // crl              = "false"
    days_valid       = 365
    // digest_algorithm = false
    // expires_after    = "52w2h47m20s"
    // fingerprint      = "83487306e552c99431273bbbe3c80da6b1fe76a405fb7e19f7097cc2e9984764"
    // id               = "*1"
    // invalid_after    = "2162-09-30 02:25:25"
    // invalid_before   = "2161-09-30 02:25:25"
    key_size         = "prime256v1"
    // key_type         = "ec"
    key_usage        = [
      "crl-sign",
      "key-cert-sign",
    ]
    name             = "crs305-01"
    // private_key      = true
    // serial_number    = "79033C754139955A"
    // skid             = "4b4cc858172630c666fd3176cd977c08a71ce927"
    // smart_card_key   = "false"
    trusted          = true
  }


# routeros_system_certificate.webfig_crs305-01:
resource "routeros_system_certificate" "webfig_crs305-01" {
  provider = routeros.crs305-01
  // akid             = "4b4cc858172630c666fd3176cd977c08a71ce927"
  // authority        = "true"
  // ca               = "crs305-01"
  common_name      = "192.168.88.4"
  country          = "US"
  // crl              = "false"
  days_valid       = 3650
  // digest_algorithm = false
  // expires_after    = "521w2d2h49m25s"
  // fingerprint      = "be51c9e4a502e3ce4bf9973fea12a37f0af7e725b2639c88498d3c7e93a351d1"
  // id               = "*2"
  // invalid_after    = "2171-09-28 02:27:30"
  // invalid_before   = "2161-09-30 02:27:30"
  key_size         = "prime256v1"
  // key_type         = "ec"
  key_usage        = [
    "crl-sign",
    "digital-signature",
    "key-agreement",
    "key-cert-sign",
    "tls-server",
  ]
  locality         = "NY"
  name             = "webfig"
  organization     = "AGGRIK8S"
  // private_key      = true
  // serial_number    = "5B401A3AA7A7152F"
  // skid             = "f5556de45b8d55e36e7b64b17ebfca6202b9a733"
  // smart_card_key   = "false"
  trusted          = false
  unit             = "DEV"
}


//
//  crs328-01
//
# routeros_system_certificate.aggrik8s-tik_crs328-01:
resource "routeros_system_certificate" "aggrik8s-tik_crs328-01" {
    provider = routeros.crs328-01
    // authority        = "true"
    common_name      = "aggrik8s-tik"
    // crl              = "false"
    days_valid       = 365
    // digest_algorithm = false
    // expires_after    = "52w2h31m21s"
    // fingerprint      = "7688ee46ce20a1a245375327cf5becefc1b45f0bae38e8c475f91aff78877b2f"
    // id               = "*4"
    // invalid_after    = "2162-09-30 01:53:52"
    // invalid_before   = "2161-09-30 01:53:52"
    key_size         = "prime256v1"
    // key_type         = "ec"
    key_usage        = [
        "crl-sign",
        "key-cert-sign",
    ]
    name             = "aggrik8s-tik"
    // private_key      = true
    // serial_number    = "72C6BD8D45361B1A"
    // skid             = "56c9de6e53cebc5a8f951e1d8dcbde337db69b6d"
    // smart_card_key   = "false"
    trusted          = true
}
# routeros_system_certificate.webfig_crs328-01:
resource "routeros_system_certificate" "webfig_crs328-01" {
    provider = routeros.crs328-01
    // akid             = "56c9de6e53cebc5a8f951e1d8dcbde337db69b6d"
    // authority        = "true"
    // ca               = "aggrik8s-tik"
    common_name      = "192.168.88.5"
    country          = "US"
    // crl              = "false"
    days_valid       = 3650
    // digest_algorithm = false
    // expires_after    = "521w2d2h34m6s"
    // fingerprint      = "fdbf3448bf2fce1b76006b2f017304a39333cd60fb70059f9cfceeef1cb134e1"
    // id               = "*5"
    // invalid_after    = "2171-09-28 01:56:37"
    // invalid_before   = "2161-09-30 01:56:37"
    key_size         = "prime256v1"
    // key_type         = "ec"
    key_usage        = [
        "crl-sign",
        "digital-signature",
        "key-agreement",
        "key-cert-sign",
        "tls-server",
    ]
    locality         = "NY"
    name             = "webfig"
    organization     = "AGGRIK8S"
    // private_key      = true
    // serial_number    = "181E4D57CD215AF7"
    // skid             = "d0ad4d4dbc8b7088a2c65ef1175b93b1bfa7a63f"
    // smart_card_key   = "false"
    trusted          = false
    unit             = "DEV"
}# routeros_system_certificate.aggrik8s-tik_rb5009-02:
resource "routeros_system_certificate" "aggrik8s-tik_rb5009-02" {
    provider         = routeros.rb5009-02
    // authority        = "true"
    common_name      = "192.168.88.3"
    // crl              = "false"
    days_valid       = 365
    // digest_algorithm = false
    // expires_after    = "52w19h10m44s"
    // fingerprint      = "8a631abeabb3e9f3c90c2ff2878eee35671d957aed6a4cc7617ccc1b2cc3ae97"
    // id               = "*1"
    // invalid_after    = "2162-09-30 19:05:56"
    // invalid_before   = "2161-09-30 19:05:56"
    key_size         = "prime256v1"
    // key_type         = "ec"
    key_usage        = [
        "crl-sign",
        "key-cert-sign",
    ]
    name             = "aggrik8s-tik"
    // private_key      = true
    // serial_number    = "FF4E61C5C4D80F"
    // skid             = "9eed6918fabd1af30a1745a1e1c10e410ca50107"
    // smart_card_key   = "false"
    trusted          = true
}
# routeros_system_certificate.webfig_rb5009-02:
resource "routeros_system_certificate" "webfig_rb5009-02" {
    provider         = routeros.rb5009-02
    // akid             = "9eed6918fabd1af30a1745a1e1c10e410ca50107"
    // authority        = "true"
    // ca               = "aggrik8s-tik"
    common_name      = "192.168.88.3"
    country          = "US"
    // crl              = "false"
    days_valid       = 3650
    // digest_algorithm = false
    // expires_after    = "521w2d19h10m57s"
    // fingerprint      = "d930e5ff905da5f5b0e78631945a1a54d76fe4178b8af0bb62aec80b88499169"
    // id               = "*2"
    // invalid_after    = "2171-09-28 19:08:49"
    // invalid_before   = "2161-09-30 19:08:49"
    key_size         = "prime256v1"
    // key_type         = "ec"
    key_usage        = [
        "crl-sign",
        "digital-signature",
        "key-agreement",
        "key-cert-sign",
        "tls-server",
    ]
    locality         = "NY"
    name             = "webfig"
    organization     = "AGGRIK8S"
    // private_key      = true
    // serial_number    = "5AA0AD8392109565"
    // skid             = "c857a16e8c013f175bf165612db691c45dd00604"
    // smart_card_key   = "false"
    trusted          = false
    unit             = "DEV"
}
# routeros_system_certificate.rb5009-01:
resource "routeros_system_certificate" "rb5009-01" {
    provider         = routeros.rb5009-01
    // authority        = "true"
    common_name      = "192.168.88.2"
    // crl              = "false"
    days_valid       = 365
    // digest_algorithm = false
    // expires_after    = "52w2h55m39s"
    // fingerprint      = "6fdc9750b0b28855c7edbf4bbdb8d23650205347e5ba1d8d2f046146015700f6"
    // id               = "*9"
    // invalid_after    = "2162-09-30 03:07:11"
    // invalid_before   = "2161-09-30 03:07:11"
    key_size         = "prime256v1"
    // key_type         = "ec"
    key_usage        = [
        "crl-sign",
        "key-cert-sign",
    ]
    name             = "rb5009-01"
    // private_key      = true
    // serial_number    = "58DD392072FE1077"
    // skid             = "dfc5bb68292700bbdf9ae63f698ebff4fb4177c5"
    // smart_card_key   = "false"
    trusted          = true
}
# routeros_system_certificate.webfig_rb5009-01:
resource "routeros_system_certificate" "webfig_rb5009-01" {
    provider         = routeros.rb5009-01
    // akid             = "dfc5bb68292700bbdf9ae63f698ebff4fb4177c5"
    // authority        = "true"
    // ca               = "rb5009-01"
    common_name      = "192.168.88.2"
    country          = "US"
    // crl              = "false"
    days_valid       = 3650
    // digest_algorithm = false
    // expires_after    = "521w2d2h57m20s"
    // fingerprint      = "67bb55fdf59f3472ca0400a87552588d1e88754e437d4152aa7f9358eadf07e2"
    // id               = "*A"
    // invalid_after    = "2171-09-28 03:08:52"
    // invalid_before   = "2161-09-30 03:08:52"
    key_size         = "prime256v1"
    // key_type         = "ec"
    key_usage        = [
        "crl-sign",
        "digital-signature",
        "key-agreement",
        "key-cert-sign",
        "tls-server",
    ]
    locality         = "NY"
    name             = "webfig"
    organization     = "AGGRIK8S"
    // private_key      = true
    // serial_number    = "352DBC94FAA90A99"
    // skid             = "238420614214dd8e8517c99200dade52c7bb6e24"
    // smart_card_key   = "false"
    trusted          = false
    unit             = "DEV"
}
