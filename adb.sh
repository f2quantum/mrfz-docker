adb connect 172.88.1.1:5555
adb install /root/ark.apk
adb -s 127.0.0.1:5555 shell am start com.hypergryph.arknights/com.u8.sdk.U8UnityContext
#adb shell am force-stop com.hypergryph.arknights
#suscrcpy -s 127.0.0.1:5555
