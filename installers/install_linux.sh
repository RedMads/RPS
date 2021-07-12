#check if this script run as root or not
if [ "$EUID" -ne 0 ]; then

    echo "[!] Run this script as root!"
    exit

fi


sudo gem install colorize os