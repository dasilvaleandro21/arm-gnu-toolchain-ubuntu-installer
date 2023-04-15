echo Thanks to https://lindevs.com/install-arm-gnu-toolchain-on-ubuntu
echo Script by Leandro da Silva

uninstall()
{
	sudo rm -rf /opt/gcc-arm-none-eabi
	sudo rm -rf /etc/profile.d/gcc-arm-none-eabi.sh
	echo ARM toolchain succesfully uninstalled!
}

while true; do
    read -p "Do you wish to remove the arm toolchain? " yn
    case $yn in
        [Yy]* ) uninstall; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
