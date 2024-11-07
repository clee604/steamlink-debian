ARG DEBIAN_VERSION=bullseye
FROM docker.io/arm32v7/debian:$DEBIAN_VERSION-slim

ARG KERNEL_VERSION=5.10.228

COPY ./kernel-$KERNEL_VERSION/ /boot/
RUN mkdir -p /lib/modules && mv /boot/$KERNEL_VERSION-steam /lib/modules/$KERNEL_VERSION-steam

COPY ./rootfs/usr/bin/* /usr/bin/
COPY ./rootfs/steamlink/ /steamlink/

# Enable non-free repositories
RUN sed -i 's/main/main contrib non-free/' /etc/apt/sources.list

# Install basic system components
RUN apt-get update && apt-get install -y --no-install-recommends systemd dbus ca-certificates dhcpcd5 nano vim openssh-server ntpdate sudo ifupdown net-tools udev iputils-ping wget dosfstools unzip binutils libatomic1 initramfs-tools e2fsprogs firmware-libertas

# Create initramfs
RUN mkinitramfs -o /boot/initramfs-linux-steam.img $KERNEL_VERSION-steam

RUN useradd -m debian
RUN echo "debian:steamlink" | chpasswd
RUN echo "root:root" | chpasswd

# Enable ssh as root
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Enable basic services
RUN systemctl enable ssh
RUN systemctl enable dbus
RUN systemctl enable networking

# /etc/network/interfaces setup
RUN echo "allow-hotplug eth0" > /etc/network/interfaces
RUN echo "auto eth0" >> /etc/network/interfaces
RUN echo "iface eth0 inet dhcp" >> /etc/network/interfaces

# /etc/fstab setup, /dev/sda1 (ext3) as /
RUN echo "/dev/sda1 / ext3 defaults 0 1" > /etc/fstab

RUN apt-get --yes clean