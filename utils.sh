#!/bin/bash

ask_user() {
    local question="$1"
    local function_to_run="$2"
    
    while true; do
        read -p "$question (y/n): " yn
        case $yn in
            [Yy]* ) 
                $function_to_run
                break
                ;;
            [Nn]* ) 
                break
                ;;
            * ) 
                echo "Please answer yes[y] or no[n]."
                ;;
        esac
    done
}
