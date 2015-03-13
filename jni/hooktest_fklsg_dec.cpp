#include <android/log.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "substrate.h"
#include <jni.h>
#include <unistd.h>
 
#include <sys/stat.h>
#define LOG_TAG "INJECT"
#define LOGD(fmt, args...) __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, fmt, ##args)

//hook 拿字节长度







 void *(*lua_loadbuffer_f)(void *,  char *s, long len,void *s2,void *s5);

 void * lua_loadbuffer_hook(void *L,  char *s, long len,void *s2,void *s5)
 {
	 return lua_loadbuffer_f(L,s,len,s2,s5);
 }


 void *(*lua_loadx_org)(void *,  void *s, void *s1,void *s2,void *s5);

  void * lua_loadx_hook(void *L,  void *s, void *s1,void *s2,void *s5)
  {

	  char *tmp = (char *)s1;
	  LOGD("lua_loadx_hook  is %s !%x,%x,%x,%x,%x,%x!!!!!!!!!!!!",s2,tmp[0],tmp[1],tmp[2],tmp[3],tmp[4],tmp[5]);



	  return lua_loadx_org(L,s,s1,s2,s5);
  }




int (*myAES_set_decrypt_key_org)(const unsigned char *userKey, const int bits,  int key);

int myAES_set_decrypt_key(const unsigned char *userKey, const int bits,  int key){
	LOGD("myAES_set_decrypt_key %s" , userKey);
	return myAES_set_decrypt_key_org( userKey , bits, key) ; 
	
}


void* (*_ZN7cocos2d11CCFileUtils12setDecryptorEPFbPhPmE_org)(unsigned char *, unsigned long *) ;
void* _ZN7cocos2d11CCFileUtils12setDecryptorEPFbPhPmE(unsigned char* a1, unsigned long * a2){
	//LOGD("_ZN7cocos2d11CCFileUtils12setDecryptorEPFbPhPmE %s %x" ,a1,a2  ) ; 
	void* ret =  _ZN7cocos2d11CCFileUtils12setDecryptorEPFbPhPmE_org(a1,a2) ;
        LOGD("_ZN7cocos2d11CCFileUtils12setDecryptorEPFbPhPmE ret %d, %x %d", ret,a1, *((int *)a2 )  ) ;
	if( (int)ret == 0 ) {
		LOGD("%s", a1) ;
	}	
	return ret ; 
}


void *(*cocos2d_loadfile_data_org)(const char *name,  char  *rw, long *size);

 void * cocos2d_loadfile_data_hook(const char *name,  char  *rw, long *size)
{
  //	LOGD("lua_loadx_hook  is !!!!!!!!!!!",name);
  	return cocos2d_loadfile_data_org(name,rw,size);
 }

 JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved)
 {
 	MSImageRef image;
 	image = MSGetImageByName("/data/data/com.babeltime.fknsango_gwphone/lib/libgame.so");
 	
	void* aes_setkey = (void*)MSFindSymbol( image , "AES_set_decrypt_key" ) ;
	if( aes_setkey != NULL ){
		LOGD("HOOK myAES_set_decrypt_key") ; 
		MSHookFunction( (void*)aes_setkey , (void*)myAES_set_decrypt_key , (void**)&myAES_set_decrypt_key_org) ; 
	}
	void* f = (void*)MSFindSymbol( image , "_Z10bt_decryptPhPm" ) ;
	if( f != NULL ){
		LOGD("f hook") ; 
		MSHookFunction( (void*)f , (void*)_ZN7cocos2d11CCFileUtils12setDecryptorEPFbPhPmE , (void**)&_ZN7cocos2d11CCFileUtils12setDecryptorEPFbPhPmE_org) ; 
	}

/*

 	void *(*lua_loadx_org_sym)(void *,  char *s, long len,void *s2,void *s5);
 	lua_loadx_org_sym = (void * (*)(void *,  char *s, long len,void *s2,void *s5)) MSFindSymbol(image, "lua_loadx");

 	 if(lua_loadbuffer_org_sym != NULL)
 	 {
 	//	 LOGD("lua_loadx_org_sym is %p!!!!!!!!!!!!\n",lua_loadbuffer_org_sym);
 	 	 //	MSHookFunction((void *)lua_loadx_org_sym, (void*)lua_loadx_hook, (void**)&lua_loadx_org);
 	 }
 	 else
 	 {
 	 //	 LOGD("lua_loadx_org_sym no find!!!!!!!!!!!!!!!!!!\n");
 	  }

 	void *(*lua_loadfile_data_org_sym)(void *,  char *s, long len,void *s2,void *s5);
 	lua_loadfile_data_org_sym = (void * (*)(void *,  char *s, long len,void *s2,void *s5)) MSFindSymbol(image, "_ZN7cocos2d11CCFileUtils11getFileDataEPKcS2_Pm");

 	if(lua_loadfile_data_org_sym != NULL)
 	{
 	//	LOGD("lua_loadfile_data_org_sym is %p!!!!!!!!!!!!\n",lua_loadfile_data_org_sym);
 	//	MSHookFunction((void *)lua_loadfile_data_org_sym, (void*)cocos2d_loadfile_data_hook, (void**)&cocos2d_loadfile_data_org);
 	}
 	else
 	{
 	//	LOGD("lua_loadx_org_sym no find!!!!!!!!!!!!!!!!!!\n");
 	}
*/
 	return JNI_VERSION_1_4;
 }


