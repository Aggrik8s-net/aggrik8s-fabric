
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
/*
resource "proxmox_virtual_environment_container" "ubuntu_container" {
  description = "Managed by Terraform"

  node_name = "pve"
  vm_id     = 1234

  # newer linux distributions require unprivileged user namespaces
  unprivileged = true
  features {
    nesting = true
  }

  initialization {
    hostname = "terraform-provider-proxmox-ubuntu-container"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      keys = [
        trimspace(tls_private_key.ubuntu_container_key.public_key_openssh)
      ]
      password = random_password.ubuntu_container_password.result
    }
  }

  network_interface {
    name = "veth0"
  }

  disk {
    datastore_id = "cluster-lvm"
    size         = 4
  }

  operating_system {
    # template_file_id = proxmox_virtual_environment_download_file.ubuntu_2504_lxc_img.id
    # Or you can use a volume ID, as obtained from a "pvesm list <storage>"
    template_file_id = "local:vztmpl/ubuntu-25.04-server-cloudimg-amd64-root.tar.xz"
    type             = "ubuntu"
  }

 // mount_point {
 //   # bind mount, *requires* root@pam authentication
 //   volume = "/mnt/bindmounts/shared"
 //   path   = "/mnt/shared"
 // }

  mount_point {
    # volume mount, a new volume will be created by PVE
    volume = "cluster-lvm"
    size   = "10G"
    path   = "/mnt/volume"
  }

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }
}
*/
/*
resource "proxmox_virtual_environment_download_file" "ubuntu_2504_lxc_img" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = "pve"
  url          = "https://mirrors.servercentral.com/ubuntu-cloud-images/releases/25.04/release/ubuntu-25.04-server-cloudimg-amd64-root.tar.xz"
}

resource "proxmox_virtual_environment_download_file" "release_20231211_ubuntu_22_jammy_lxc_img" {
  content_type       = "vztmpl"
  datastore_id       = "local"
  node_name          = "pve"
  url                = "https://cloud-images.ubuntu.com/releases/22.04/release-20231211/ubuntu-22.04-server-cloudimg-amd64-root.tar.xz"
  checksum           = "c9997dcfea5d826fd04871f960c513665f2e87dd7450bba99f68a97e60e4586e"
  checksum_algorithm = "sha256"
  upload_timeout     = 4444
}
*/

resource "random_password" "ubuntu_container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "ubuntu_container_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


resource "proxmox_virtual_environment_container" "influxdb_container" {
  node_name = "pve"
  vm_id = 1022
  operating_system {
    # template_file_id = proxmox_virtual_environment_download_file.ubuntu_2504_lxc_img.id
    # Or you can use a volume ID, as obtained from a "pvesm list <storage>"
    # template_file_id = "local:vztmpl/jammy-server-cloudimg-amd64.tar.gz"
    template_file_id = "local:vztmpl/ubuntu-25.04-server-cloudimg-amd64-root.tar.xz"
    type             = "ubuntu"
  }
  disk {
    datastore_id = "cluster-lvm"
    size         = 4
  }
  network_interface {
    name = "veth0"
    bridge = "vlan1500"
  }
}

resource "proxmox_virtual_environment_container" "telegraf_container" {
  node_name = "pve"
  vm_id     = 1023
  operating_system {
    # template_file_id = proxmox_virtual_environment_download_file.ubuntu_2504_lxc_img.id
    # Or you can use a volume ID, as obtained from a "pvesm list <storage>"
    # template_file_id = "local:vztmpl/jammy-server-cloudimg-amd64.tar.gz"
    template_file_id = "local:vztmpl/ubuntu-25.04-server-cloudimg-amd64-root.tar.xz"
    type             = "ubuntu"
  }
  disk {
    datastore_id = "cluster-lvm"
    size         = 4
  }
  network_interface {
    name = "veth0"
    bridge = "vlan1500"
  }
}

resource "proxmox_virtual_environment_container" "grafana_container" {
  node_name = "pve"
  vm_id     = 1024
  operating_system {
    # template_file_id = proxmox_virtual_environment_download_file.ubuntu_2504_lxc_img.id
    # Or you can use a volume ID, as obtained from a "pvesm list <storage>"
    # template_file_id = "local:vztmpl/jammy-server-cloudimg-amd64.tar.gz"
    template_file_id = "local:vztmpl/ubuntu-25.04-server-cloudimg-amd64-root.tar.xz"
    type             = "ubuntu"
  }
  disk {
    datastore_id = "cluster-lvm"
    size         = 4
  }
  network_interface {
    name = "veth0"
    bridge = "vlan1500"
  }
}

output "ubuntu_container_password" {
  value     = random_password.ubuntu_container_password.result
  sensitive = true
}

output "ubuntu_container_private_key" {
  value     = tls_private_key.ubuntu_container_key.private_key_pem
  sensitive = true
}

output "ubuntu_container_public_key" {
  value = tls_private_key.ubuntu_container_key.public_key_openssh
}

resource "proxmox_virtual_environment_file" "ubuntu_container_template" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = "pve"

  source_file {
    path = "http://download.proxmox.com/images/system/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  }
}

data  "proxmox_virtual_environment_datastores" "pve" {
  node_name = "pve"
}