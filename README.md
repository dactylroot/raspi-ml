## Raspbian Setup Scripts

These scripts document customization for our production computer-vision devices.

Written for Raspbian 9.4 "Stretch" and Bash (not Dash).

  1. `NewPiSetup.workflow`
  2. Reboot
  3. `ml_setup`
  4. `py_setup`

### OpenCV

OpenCV needs to be compiled and installed. Use `cv_prep` then [compile and install manually](https://www.pyimagesearch.com/2017/09/04/raspbian-stretch-install-opencv-3-python-on-your-raspberry-pi/).

### Mini Pi

Can creat a nice image on a 4GB disk by utilizing an external flash drive as swap space for the large package builds.

