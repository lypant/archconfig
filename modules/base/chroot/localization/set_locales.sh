#!/bin/bash

# TODO use uncommentVar function!
sed -i "s/#$LANGUAGE1 UTF-8/$LANGUAGE1 UTF-8/g" /etc/locale.gen
sed -i "s/#$LANGUAGE2 UTF-8/$LANGUAGE2 UTF-8/g" /etc/locale.gen

