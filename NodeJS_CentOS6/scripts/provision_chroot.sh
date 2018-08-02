#!/bin/bash

yum update -y
mkdir -p /chroot
mkdir -p /chroot/var/lib/rpm
rpm --rebuilddb --root=/chroot
# NOTE: This is for CentOS 6.10
cd /tmp
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/centos-release-6-10.el6.centos.12.3.x86_64.rpm
rpm -i --root=/chroot --nodeps centos-release*.rpm
yum --installroot=/chroot install -y rpm-build yum

cp /chroot/etc/skel/.??* /chroot/root
cp /bin/* /chroot/bin
cp /sbin/ifconfig /chroot/sbin
cp /etc/resolv.conf /chroot/etc/resolv.conf

mount --bind /proc /chroot/proc
mount --bind /dev /chroot/dev

# Make utility for user to easily chroot into environment
utility='chuser'
echo 'sudo chroot /chroot /bin/bash -l' > /usr/local/bin/${utility}
chmod 755 /usr/local/bin/${utility}

echo -------------------------------------------
echo
echo "DONE CONFIGURING CHROOT ENVIRONMENT"
echo
echo "Now, run 'vagrant ssh'"
echo "To log into chroot, run '${utility}'"
echo
echo -------------------------------------------

