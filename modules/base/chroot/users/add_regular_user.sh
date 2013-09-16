#!/bin/bash

useradd -m -g "$USER_MAIN_GROUP" -G "$USER_ADDITIONAL_GROUPS" -s "$USER_SHELL" "$USER_NAME"

