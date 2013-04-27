export ARCH=arm
export CROSS_COMPILE=/home/dlhxr/codesourcery/bin/arm-none-eabi-
make clean
make distclean
make omap4_tuna_config
make -j8 omap4_tuna
./pack_tool/mkbootimg --kernel u-boot.bin --ramdisk /dev/null -o u-boot.aimg
cp -r ./pack_tool/META-INF META-INF
cp ./pack_tool/signapk.jar signapk.jar 
cp ./pack_tool/testkey.x509.pem testkey.x509.pem
cp ./pack_tool/testkey.pk8 testkey.pk8
zip -r I9250_U-Boot_Kernel.zip META-INF u-boot.aimg 
java -jar signapk.jar testkey.x509.pem testkey.pk8 I9250_U-Boot_Kernel.zip SIGNED_I9250_U-Boot_Kernel.zip
rm I9250_U-Boot_Kernel.zip
rm *.jar
rm *.pk8
rm *.pem
rm -r META-INF 
