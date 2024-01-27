#!/bin/bash

deb_file_name="google-chrome-stable_current_amd64.deb55"

if [ -f "deb_file/${deb_file_name}" ]
then
    echo "File Exists"
else
    echo "File Does Not Exist"
fi