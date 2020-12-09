build_path=$(cd "$(dirname "$0")";pwd)
echo "$build_path"

./clear.sh

cd code

if [ ! -d "gd32f4_library" ]
then
  unrar x GD32F4xx_Firmware_Library_V2.1.1.rar gd32f4_library/  
fi

#gcc test.c -o test
#mv test ../output/.
cd $build_path/build
cmake ..
#cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain.cmake
