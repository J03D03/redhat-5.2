# Running Red Hat 5.2 (1998) with QEMU

This is an extension to Marcos David's blog post from 2014 which can be found [here](https://marcosgildavid.blogspot.com/2014/07/remembering-red-hat-linux-52-from-1998.html).  
All steps to create a functional Red Hat 5.2 machine with network support are listed below.

---

## Setup
1. Create a directory to store everything `mkdir qemu-redhat52`
2. Enter the directory `cd qemu-redhat52`
3. Download the [redhat-5.2.iso](https://archive.org/download/redhat-5.2_release/redhat-5.2-i386.iso) from archive.org
4. Install [QEMU](https://www.qemu.org/download/)
5. Create a disk image: `qemu-img create -f qcow2 redhat52.img 1G`
6. Use this command `qemu-system-i386 -hda redhat52.img -cdrom redhat-5.2-i386.iso -m 256 -vga cirrus -net nic,model=ne2k_pci -net user` to start the virtual machine. "The `-vga cirrus` parameter is essential to get a desktop later on" [[1]](#1). The `-net nic,model=ne2k_pci -net user` is needed for the network setup.
7. Free your mouse with `CTRL` + `ALT` + `g`
8. Follow the (textual or visual) installation instructions

## Installation (textual)
The installation prompts you several times. Format: `WINDOW HEADLINE (OPTION) - CHOICE`.
1. Welcome to Red Hat Linux! - `ENTER`
2. Red Hat Linux - `Ok`
3. Choose a language (`English`) - `Ok`
4. Keyboard Type (`us`) - `Ok`
5. Installation Method (`Local CDROM`) - `Ok`
6. Insert your Red Hat CD - `Ok`
7. Installation Path - `Install`
8. Installation Class - `Workstation`
9. Bad Partition Table - `Initialize`
10. Warning partitions - `Ok`
11. Warning data loss - `Yes`
12. Probing Result PS/2 mouse - `Ok`
13. Configure Mouse (`Generic Mouse`) - `Ok`
14. PCI Probe - `Ok`
15. Monitor Setup (Custom) - `OK`
16. Custom Monitor Setup - `OK`
17. Custom Monitor Setup Continued 1 (`Super VGA 1024x768`) - `Ok`
18. Custom Monitor Setup Continued 2 (`50-70`) - `Ok`
19. Screen Configuration - `Probe`
20. Probing to begin - `Ok`
21. Probing finished: - `Let Me Choose`
22. Select Video Modes (`24 bit "800x600"`) - `Ok`
23. Network Configuration: - `Yes`
24. Load module (`NE2000 PCI`) - `Ok`
25. Module Options (`Autoprobe`) - `Ok`
26. Boot Protocol (`DHCP`) - `Ok`
27. Configure Timezones (`US/Eastern`) - `Ok`
28. Configure Printer - `No`
29. Root Password (`password`, `password`) - `Ok`
30. Bootdisk - `No`
31. Done - `Ok`
32. localhost login: `root`, `password`

## Installation (visual)
Click on the image to watch the video on Marcos David's YouTube channel. For network setup please refer to the textual installation step 23-26.
[![IMAGE ALT TEXT](https://img.youtube.com/vi/exLceN2YsXw/maxresdefault.jpg)](http://www.youtube.com/watch?v=exLceN2YsXw "Red Hat 5.2 (1998) Installation")

## Transfer data with Netcat
Since `ftp` is already installed we use it to get `nc`.
1. Connect to ftp.pbone.net via `ftp 93.179.225.212`
2. Name `anonymous`, Password `""`
3. Enable passive mode `pass`
4. Navigate to package `cd mirror/archive.download.redhat.com/pub/redhat/linux/5.2/en/os/i386/RedHat/RPMS`
5. Download the package with `get nc-1.10-1.i386.rpm`
6. Exit the ftp server with `exit`
7. Install `nc` with `rpm -i nc-1.10-1.i386.rpm`

From now on you can transfer files from and to your host machine via Netcat as described [here](https://nakkaya.com/2009/04/15/using-netcat-for-file-transfers/).

---

## References
<a id="1">[1]</a>
Marcos David (28 July 2014).  
Remembering Red Hat Linux 5.2 (from 1998) - Part I (Installation)  
https://marcosgildavid.blogspot.com/2014/07/remembering-red-hat-linux-52-from-1998.html [Online, accessed 8th-June-2021]

