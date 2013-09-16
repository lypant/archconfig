#!/bin/bash

repeatUntilSuccess "passwd $USER_NAME" 3 || echo -e "\nERROR: password unchanged\n"

