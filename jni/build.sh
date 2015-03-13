#!/bin/sh

cd /Users/zzw/Documents/adt/fk_dev/jni
/Users/zzw/Documents/adt/android-ndk-r10c/ndk-build
#adb push ../libs/armeabi/libdbpays.so /data/data/com.babletime.fknsango_anzhi/libs
scp  -P 32200 ../libs/armeabi/libdbpays.so zzw@115.29.43.207:/home/zzw/packapk/libs