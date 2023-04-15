echo Thanks to https://lindevs.com/install-arm-gnu-toolchain-on-ubuntu
echo Script by Leandro da Silva

install()
{
	ARM_TOOLCHAIN_VERSION=$(curl -s https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads | grep -Po '<h4>Version \K.+(?=</h4>)')
	echo Found arm toolchain version $ARM_TOOLCHAIN_VERSION
	echo Downloading installer
	curl -Lo gcc-arm-none-eabi.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_TOOLCHAIN_VERSION}/binrel/arm-gnu-toolchain-${ARM_TOOLCHAIN_VERSION}-x86_64-arm-none-eabi.tar.xz"
	echo Creating directory /opt/gcc-arm-none-eabi
	sudo mkdir /opt/gcc-arm-none-eabi
	echo Extracting files
	sudo tar xf gcc-arm-none-eabi.tar.xz --strip-components=1 -C /opt/gcc-arm-none-eabi
	echo Adding environment variables
	echo 'export PATH=$PATH:/opt/gcc-arm-none-eabi/bin' | sudo tee -a /etc/profile.d/gcc-arm-none-eabi.sh
	source /etc/profile
	echo Testing version
	arm-none-eabi-gcc --version
	arm-none-eabi-g++ --version
	while true; do
	    read -p "Do you want to delete the compressed installer file now?" yn
	    case $yn in
		[Yy]* ) rm -rf gcc-arm-none-eabi.tar.xz; break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	    esac
	done
	
	echo ARM toolchain succesfully installed!
}


while true; do
    read -p "Do you wish to install the arm toolchain? " yn
    case $yn in
        [Yy]* ) install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


