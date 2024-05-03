#!/bin/bash


maa_version=v5.2.3 
file_path="./resources/MAA-$maa_version-linux-x86_64.tar.gz"  # 指定文件路径
download_url="https://github.com/MaaAssistantArknights/MaaAssistantArknights/releases/download/$maa_version/MAA-$maa_version-linux-x86_64.tar.gz"  # 下载链接
if [ ! -f "$file_path" ]; then
    echo "MAA文件不存在，开始下载..."
    wget -O "$file_path" "$download_url"
    echo "MAA下载完成!"
else
    echo "MAA文件已存在，无需下载."
fi

folder="./resources/maa"
custom_folder="./custom_script"
if [ -d "$folder" ]; then
    echo "MAA =资源文件夹存在"
else
    echo "文件夹不存在"
    mkdir $folder
    tar -xzf $file_path -C $folder
    echo "解压完成"
    sudo cp -rf $custom_folder/* $folder
fi



game_apk_path="./resources/ark.apk"
game_download_url="https://ak.hypergryph.com/downloads/android_lastest"
if [ ! -f "$game_apk_path" ]; then
    echo "游戏APK 文件不存在，开始下载..."
    wget -O "$game_apk_path" "$game_download_url"
    echo "游戏APK 下载完成!"
else
    echo "游戏APK 文件已存在，无需下载."
fi

docker build -t mrfz-docker .