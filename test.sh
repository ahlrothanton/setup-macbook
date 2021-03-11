#!/usr/bin/env bash


while getopts "r" opts; do
    case "${opts}" in
        r)
            BOOT=true
            ;;
    esac
done

echo $BOOT

if [ "$BOOT" = true ] ; then
	echo reboot
else
	echo no boot
fi

