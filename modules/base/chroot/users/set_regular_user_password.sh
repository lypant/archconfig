#!/bin/bash

# TODO: probably functions script needs to be loaded here...

repeatUntilSuccess "passwd adam" 3 || echo -e "\nERROR: password unchanged\n"

