export PATH=/Users/zzw/Documents/adt/android-ndk-r10d:/Users/zzw/Documents/adt/adt-bundle-mac-x86_64-20140702/bin:/Users/zzw/Documents/adt/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:/Users/zzw/Documents/adt/android-ndk-r10d:/Users/zzw/Documents/adt/adt-bundle-mac-x86_64-20140702/bin:/Users/zzw/Documents/adt/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:/Users/zzw/Documents/adt/android-ndk-r10d:/Users/zzw/Documents/adt/adt-bundle-mac-x86_64-20140702/bin:/Users/zzw/Documents/adt/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:/opt/iOSOpenDev/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
#com.youzu.android.snsgz

wget $1 -O $2

fkbase="/Users/zzw/Documents/adt/snsg_dev"

for dir in `ls |grep apk`
do 
apktool d -f $dir
apkname=${dir%.apk*}

 

cp $fkbase/packapk/libs/*.so ${apkname}/lib/armeabi/
cp  libs/*.smali ${apkname}/smali/com/youzu/sanguohero
cp  libs/*.png ${apkname}/assets

if [ -d "${apkname}/lib/armeabi-v7a/" ]; then
  echo "exists v7a"
  cp $fkbase/packapk/libs/*.so ${apkname}/lib/armeabi-v7a/
  cp ${apkname}/lib/armeabi/libgame.so ${apkname}/lib/armeabi-v7a/
fi





#exit ; 


java Fklsg ${apkname}/smali/com/youzu/sanguohero/Sanguohero.smali
mv -f ${apkname}/smali/com/youzu/sanguohero/Sanguohero.smali_t ${apkname}/smali/com/youzu/sanguohero/Sanguohero.smali

apktool.sh b $apkname


sign.sh  ${apkname}/dist/${apkname}.apk ${apkname}/dist/${apkname}_ok.apk 
mv ${apkname}/dist/${apkname}_ok.apk ok_pack/
rm -fr ${apkname}
mv $dir had_done/
done






