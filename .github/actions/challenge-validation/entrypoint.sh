#!/bin/sh -l

config_file=".ctf/config"

if [ -f "$config_file" ]; then
    echo "Config file $config_file exists."
else
    echo "Config file $config_file not found."
    if [ -z "$CTFD_URL" ] || [ -z "$CTFD_TOKEN" ]; then
        echo "Error: Environment variables CTFD_URL and CTFD_TOKEN are not set."
        exit 1
    else
        echo "Creating .ctf/config ..."
        mkdir .ctf
        echo "[config]" >> $config_file
        echo "url = $CTFD_URL" >> $config_file
        echo "access_token = $CTFD_TOKEN" >> $config_file
        echo "" >> $config_file
        echo "[challenges]" >> $config_file
        find . -type f -name "challenge.yml" -exec dirname {} \; | sort -u | cut -c 3- | awk '{print $0 " = " $0}' >> $config_file
        pwd    
    fi
fi


ctf challenge install
ctf challenge sync

if [ $? -ne 0 ]; then
    echo "Error: ctf challenge sync failed : see error above."
    exit 1
fi

echo "Both commands executed successfully"

exit 0