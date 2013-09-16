#!/bin/bash

git clone http://git.suckless.org/dwm "$DWM_BUILD_PATH"
cd $DWM_BUILD_PATH
git checkout 4fb31e0 -b my_adjustments
sed -i "s/PREFIX = \/usr\/local/PREFIX = \/usr/g" "$DWM_BUILD_PATH/config.mk"
sed -i "s/X11INC = \/usr\/X11R6\/include/X11INC = \/usr\/include\/X11/g" "$DWM_BUILD_PATH/config.mk"
sed -i "s/X11LIB = \/usr\/X11R6\/lib/X11LIB = \/usr\/lib\/X11/g" "$DWM_BUILD_PATH/config.mk"
sed -i "s/"st"/"$TERMINAL_EMULATOR_COMMAND"/g" "$DWM_BUILD_PATH/config.def.h"
git commit -a -m "My adjustments"
sudo make clean install

