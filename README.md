# steamlink-debian
Debian GNU/Linux on the Valve Steam Link

```
djmuted@steamlink:~$ fastfetch
       _,met$$$$$gg.           djmuted@steamlink
    ,g$$$$$$$$$$$$$$$P.        ---------------
  ,g$$P"         """Y$$.".     OS: Debian GNU/Linux bullseye 11.11 armv7l
 ,$$P'               `$$$.     Host: Valve Steam Link
',$$P       ,ggs.     `$$b:    Kernel: Linux 5.10.228
`d$$'     ,$P"'   .    $$$     Uptime: 10 hours, 40 mins
 $$P      d$'     ,    $$$P    Packages: 363 (dpkg)
 $$:      $.   -    ,d$$'      Shell: bash 5.1.4
 $$;      Y$b._   _,d$P'       Terminal: /dev/pts/1
 Y$$.    `.`"Y$$$$P"'          CPU: Marvell Berlin
 `$$b      "-.__               Memory: 63.55 MiB / 498.16 MiB (13%)
  `Y$$                         Swap: Disabled
   `Y$$.                       Disk (/): 2.78 GiB / 7.23 GiB (38%) - ext3 [External]
     `$$b.                     Local IP (eth0): 192.168.1.7/24
       `Y$$b.                  Locale: C
          `"Y$b._
             `"""
```

## Default passwords:

> :warning: **Recommended**: Consider changing your passwords with `passwd` after first login

### Default user
User: `debian`
password: `steamlink`

### Root user
User: `root`
password: `root`

## First boot
For the first boot a LAN connection is required. Once the new kernel starts booting, there will be no HDMI output anymore. Connect to the Steam Link via SSH. Local IP address can be found in your router's DHCP table. 

### Change hostname
```bash
sudo hostnamectl set-hostname steamlink
sudo echo "127.0.0.1 steamlink" >> /etc/hosts
```

### Fix date and time (RTC does not work yet)
```bash
sudo ntpdate ntp.ubuntu.com
```

### Resize root partition to full disk size
```bash
sudo resize2fs /dev/sda1
```

## What does not work
- NAND driver
- DMA controller
- video/audio output
- suspend/resume/halt/reboot
- RTC

## Credits
Based on [Getting Linux on Valve Steam Link](https://heap.ovh/getting-linux-on-valve-steam-link.html) and [Docker Debian bootstrap script](https://github.com/copy/v86)
