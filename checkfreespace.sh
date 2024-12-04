#!/bin/bash


# Get the disk info
disk_info=$(df /)


# Get the percentage
used_space=$(echo "$disk_info" | awk 'NR==2 {print $5}' | tr -d '%')


# Message Var
Message=""

# Figure out percentage
case $used_space in
    [0-6][0-9])
        Message="You're good, you have only used up $used_space% space."
        ;;
    [7-8][0-9])
        Message="Keep an eye out, you've used up $used_space% of your space."
        ;;
    [9][0-8])
        Message="Please get a new disk. Home is $used_space% full."
        ;;
    99)
        Message="I'm drowning over here! Home is at $used_space%!"
        ;;
    *)
        Message="It's too late for me..."
        ;;
esac

# Show message
echo "$Message"

