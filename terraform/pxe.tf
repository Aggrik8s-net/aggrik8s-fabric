/*          iPXE Boot Talos nodes using RB5009's.
    We have several things to do to enable PXE boot on our VLANs.

  1. DHCP Network options set in vlan<n>.tf files.
  2. pxe.tf will do these parts:
     - Download kernal and ramdisk files from Sideros website,
     - Set up DHCP Op=ion sets for each
     - set tftp rule for each
     - enable tftp for each vlan

   ### We do see the DHCP and bootserver on VLAN1500 using existing stub.

 */
