// output "interface_names_by_device" {
//    value = {
//    for device_name, device in data.routeros_interfaces.all :
//      device_name => [
//        for interface in device.interfaces : interface.name
//      ]
//  }
// }