#!/bin/bash

#==================================
# SOURCE UTILS
#==================================
cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"


#==================================
# APK
#==================================
apk_install() {
    declare -r EXTRA_ARGUMENTS="$3"
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! apk_installed "$PACKAGE"; then
        execute "apk add --quiet --no-progress $EXTRA_ARGUMENTS $PACKAGE" "$PACKAGE_READABLE_NAME"
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi
}

apk_update() {
    execute \
        "sudo apk update --quiet —no-progress" \
        "APK Update"
}

apk_upgrade() {
    execute \
        "sudo apk upgrade" \
        "APK Update"
}

apk_installed() {
    apk info "$1" &> /dev/null
}


#==================================
# FISHER
#==================================
fisher_install() {
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    fish -c "fisher install $PACKAGE" &> /dev/null
    print_result $? "$PACKAGE_READABLE_NAME" "true"
}
