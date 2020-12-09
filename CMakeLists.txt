#cmake最低版本号要求
cmake_minimum_required(VERSION 3.16.3)

#工程名称
project(gd32)

#使能汇编
enable_language(ASM)

#设置交叉编译环境
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR arm)

#使能编译器
SET(CMAKE_C_COMPILER arm-none-eabi-gcc)
SET(CMAKE_CXX_COMPILER arm-none-eabi-gcc)

#arm-none-eabi-objcopy用于输出bin文件
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)

#arm-none-eabi-size用于查看文件占用flash和ram的大小
set(CMAKE_SIZE arm-none-eabi-size)

add_definitions(
-USE_STDPERIPH_DRIVER
-GD32F450
)

# 添加文件夹
add_subdirectory(code)
