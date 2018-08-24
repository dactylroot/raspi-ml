

watching()
{
    local func=$1
    local desc=""
    if [ -n "$2" ]; then desc=$2; fi; 
    local log=~/setup.log
    if [ -n "$3" ]; then log=$3; fi; 

    $func >> $log 2>&1 &
    local pid=$!
    local delay=0.5
    local spinstr='|/-\'
    printf "$desc" 
    tput civis
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c] " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b"
    done
    wait $pid
    ret=$?
    printf "    \b\b\b"
    if [ $ret != 0 ] 
    then
        printf "\n  FAILED (exit code %s)\n" "$ret"
    else
        printf "\n"
    fi  
    tput cnorm
}


echo "Installing OpenCV for Python"

# via https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/
func() {
    sudo apt install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev -y
    sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev -y
    sudo apt install libgtk2.0-dev libgtk-3-dev
    sudo apt install libatlas-base-dev gfortran
}
watching func "  - OpenCV"


func() {
    pip3 install opencv-python
}
watching func "  - opencv-python"
