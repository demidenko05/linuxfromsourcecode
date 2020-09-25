#!/bin/bash
set -e
if ( [ $LFSC32B = 1 ] ) ; then
  make i386_defconfig
else
  make x86_64_defconfig
fi
if ( [ $? = 0 ] ) ; then
  #CONFIG_DEBUG_STACK_USAGE make not set to suppress debug messages
  #ASUS,ACER,NOUVEAU,REALTEK,SYNAPTICS,ELAN,INTEL
  #MMC
  #grep CONFIG_MMC_REALTEK_PCI -r . --include=Makefile <- rtsx_pci_sdmmc
  #CONFIG_PINCTRL dp ACPI (mb LPSS)
  #CONFIG_PINCTRL -> intel...
  #RTL8
  #INTEL MEI ME
  #GPIOLIB -> DesignWare I2C 
  #CONFIG_HOTPLUG_PCI_*
  #CONFIG_LPC_*
  #CONFIG_ATH9K

  # d -default set , u -unset o - optional
  #GUI X11:
  #CONFIG_INPUT=y d
  #CONFIG_INPUT_EVDEV=y d
  #CONFIG_INPUT_MISC=y  d
  #CONFIG_INPUT_UINPUT=y u
  #CONFIG_DRM=y d
  #CONFIG_DRM_I915=y d
  nano .config
  make PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_LIBDIR="" menuconfig
  nano .config
  if ( [ $? = 0 ] ) ; then
    make -j$NCORES all
    if ( [ $? = 0 ] ) ; then
      bash ../../kerninst1.sh
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
