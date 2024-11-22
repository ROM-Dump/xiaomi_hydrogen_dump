#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:16373070:36e203be67e5c764e8c076fb08fd4bae3114e6f3; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:13370698:77588983f04181833800ced649212dc29d31940e EMMC:/dev/block/bootdevice/by-name/recovery 36e203be67e5c764e8c076fb08fd4bae3114e6f3 16373070 77588983f04181833800ced649212dc29d31940e:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
