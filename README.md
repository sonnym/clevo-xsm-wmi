# Clevo-xSM-wmi


Kernel module for keyboard backlighting of Clevo SM series notebooks.

Based upon tuxedo-wmi, created by Christoph Jaeger.
http://www.linux-onlineshop.de/forum/index.php?page=Thread&threadID=26


### Additions over tuxedo-wmi

* Sysfs interface to control the brightness, mode, colour,
  on/off state after the module has loaded.
  In the original code you can only set these before the module loads.
* Small application to visually control the keyboard lighting using the sysfs
  interface.
* Mode key cycles through colours.


### Doodloo's Additions

I have added a small DKMS configuration file to the repository, this way the module
can get re-built automatically when the kernel gets updated.

To get it working with your distribution, clone this repository and then, from the
`module` directory (You have to be root, so make sure you `sudo -i` first):

```
# Copy sources...
cp -R . /usr/src/clevo-xsm-wmi-1.0
# Instruct DKMS that a new module is available for dynamic compilation:
dkms add      -m clevo-xsm-wmi -v 1.0
# Builds the module for the current kernel.
dkms build    -m clevo-xsm-wmi -v 1.0
# Optional: makes a .deb file that you can save and later directly install using `dpkg -i ...`:
dkms mkdeb    -m clevo-xsm-wmi -v 1.0
# Actually installs the module into the modules tree:
dkms install  -m clevo-xsm-wmi -v $VER
# Optionnal: loads the module right now.
modprobe clevo-xsm-wmi

```

At this point, your keyboard `Fn + ... keys` should work.


### License

This program is free software;  you can redistribute it and/or modify
it under the terms of the  GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or (at
your option) any later version.

This program is  distributed in the hope that it  will be useful, but
WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
General Public License for more details.

You should  have received  a copy of  the GNU General  Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
