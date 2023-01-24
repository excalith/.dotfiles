#!/bin/bash

setBackgroundColor()
{
    echo -en "\x1b[48;2;$1;$2;$3""m"
}

resetOutput()
{
    echo -en "\x1b[0m\n"
}


rainbowColor()
{ 
    let h=$1/43
    let f=$1-43*$h
    let t=$f*255/43
    let q=255-t

    if [ $h -eq 0 ]
    then
        echo "255 $t 0"
    elif [ $h -eq 1 ]
    then
        echo "$q 255 0"
    elif [ $h -eq 2 ]
    then
        echo "0 255 $t"
    elif [ $h -eq 3 ]
    then
        echo "0 $q 255"
    elif [ $h -eq 4 ]
    then
        echo "$t 0 255"
    elif [ $h -eq 5 ]
    then
        echo "255 0 $q"
    else
        # execution should never reach here
        echo "0 0 0"
    fi
}

print_strips()
{
    printf "\n"
    # Gives a color $1/255 % along HSV
    # Who knows what happens when $1 is outside 0-255
    # Echoes "$red $green $blue" where
    # $red $green and $blue are integers
    # ranging between 0 and 255 inclusive
    for i in `seq 0 127`; do
        setBackgroundColor $i 0 0
        echo -en " "
    done
    resetOutput
    for i in `seq 255 128`; do
        setBackgroundColor $i 0 0
        echo -en " "
    done
    resetOutput

    for i in `seq 0 127`; do
        setBackgroundColor 0 $i 0
        echo -n " "
    done
    resetOutput
    for i in `seq 255 128`; do
        setBackgroundColor 0 $i 0
        echo -n " "
    done
    resetOutput

    for i in `seq 0 127`; do
        setBackgroundColor 0 0 $i
        echo -n " "
    done
    resetOutput
    for i in `seq 255 128`; do
        setBackgroundColor 0 0 $i
        echo -n " "
    done
    resetOutput

    for i in `seq 0 127`; do
        setBackgroundColor `rainbowColor $i`
        echo -n " "
    done
    resetOutput
    for i in `seq 255 128`; do
        setBackgroundColor `rainbowColor $i`
        echo -n " "
    done
    resetOutput
}


print_colors()
{
    printf "\n"
    echo -e "\033[39mDefault \033[m     \033[37mLighGray \033[m         \033[49mDefault \033[m      \033[47mLighGray \033[m"
    echo -e "\033[30mBlack \033[m       \033[90mDarkGray \033[m         \033[40mBlack \033[m        \033[100mDarkGray \033[m"
    echo -e "\033[31mRed \033[m         \033[91mLightRed \033[m         \033[41mRed \033[m          \033[101mLightRed \033[m"
    echo -e "\033[32mGreen \033[m       \033[92mLightGreen \033[m       \033[42mGreen \033[m        \033[102mLightGreen \033[m"
    echo -e "\033[33mYellow \033[m      \033[93mLightYellow \033[m      \033[43mYellow \033[m       \033[103mLightYellow \033[m"
    echo -e "\033[34mBlue \033[m        \033[94mLightBlue \033[m        \033[44mBlue \033[m         \033[104mLightBlue \033[m"
    echo -e "\033[35mMagenta \033[m     \033[95mLightMagenta \033[m     \033[45mMagenta \033[m      \033[105mLightMagenta \033[m"
    echo -e "\033[36mCyan \033[m        \033[96mLightCyan \033[m        \033[46mCyan \033[m         \033[106mLightCyan \033[m"
}

main()
{
    print_colors
    print_strips
}

main