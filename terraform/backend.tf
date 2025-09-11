//  TEST bucket - verified to work
// import {
//   to = digitalocean_spaces_bucket.foobar-aggrik8s-fabric
//   id = "nyc3,foobar-aggrik8s-fabric" # Replace with your bucket's region and name
// } 
resource "digitalocean_spaces_bucket" "foobar-aggrik8s-fabric" {
  name   = "foobar-aggrik8s-fabric"
  region = "nyc3"
}


// Imported using:
//
//       doppler run --name-transformer tf-var -- \
//               terraform import digitalocean_spaces_bucket.aggrik8s-cluster \
//               nyc3,aggrik8s-cluster
//
// Then populated this resource using:
//        terraform state show digitalocean_spaces_bucket.aggrik8s-cluster
//
// The attributes commented out are READ ONLY, get from state as shown above.
//

// resource "digitalocean_spaces_bucket" "aggrik8s-fabric" {
//   // bucket_domain_name = "aggrik8s-cluster.nyc3.digitaloceanspaces.com"
//   // endpoint           = "nyc3.digitaloceanspaces.com"
//   force_destroy      = false
//   // id                 = "aggrik8s-cluster"
//   name               = "aggrik8s-fabric"
//   region             = "nyc3"
//   // urn                = "do:space:aggrik8s-cluster"
// 
//   versioning {
//     enabled = true
//   }
// }
