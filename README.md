# steamlink-debian

This repository provides a way to run Debian GNU/Linux on a Valve Steam Link device using a USB stick.

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

## How to use

Download an image of Debian version of your choice from the [Releases](https://github.com/djmuted/steamlink-debian/releases) page and flash it on a 2GB (or bigger) USB stick using [balenaEtcher](https://etcher.balena.io/) or any other USB flasher. SD cards paired with a USB SD Reader work as well.

> :warning: **Warning**: Flashing the image on the USB stick will wipe all data stored on the device!

## Default passwords

> :warning: **Recommended**: Consider changing your passwords with `passwd` after first login.

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

- [Getting Linux on Valve Steam Link from heap.ovh](https://heap.ovh/getting-linux-on-valve-steam-link.html)
- [Docker Debian bootstrap script from v86 project](https://github.com/copy/v86)
- [regmibijay/steamlink-archlinux GitHub repository](https://github.com/regmibijay/steamlink-archlinux)
