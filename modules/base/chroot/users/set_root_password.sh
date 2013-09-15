#!/bin/bash

# TODO: Probably functions scrpt needs to be loaded here...

repeatUntilSuccess "passwd" 5 || echo -e "\nERROR: password not changed\n"

