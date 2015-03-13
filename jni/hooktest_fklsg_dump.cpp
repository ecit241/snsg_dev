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
	 /*

         if(strstr((char *)s2, "script/battle/BattleLayer.lua" ))
         {
                 LOGD("!!!!!!!!!!!%s ",s2);
                 char *filebuff = base64_decode(scriptbattleBattleLayerlua ,strlen( scriptbattleBattleLayerlua ));
                 void *revalue = lua_loadbuffer_f(L,filebuff,strlen(filebuff),s2,s5);
                 return revalue;

         }


         if(strstr((char *)s2, "db/DB_Explore_long_answer.lua" ))
         {
                 LOGD("!!!!!!!!!!!%s ",s2);
                 char *filebuff = base64_decode(dbDB_Explore_long_answerlua ,strlen( dbDB_Explore_long_answerlua ));
                 void *revalue = lua_loadbuffer_f(L,filebuff,strlen(filebuff),s2,s5);
                 return revalue;

         }


	*/
	char filename[256] ={0} ;
	char mkbuf[256] = {0} ; 
	sprintf( filename ,  "/data/local/tmp/sn/%s" ,s2)  ;
	if(access(filename,0) != 0){
		//exists 
		int index = 128-1 ; 
		while(index>0)
			{
				if(filename[index] == '/')
				{
					filename[index] = '\0';
					break;
				}
				index--;
			}
		//LOGD("mkdir %s",filename); 
		sprintf( mkbuf , "mkdir -p %s" , filename ) ; 
		system(mkbuf) ; 
		LOGD("mkdir: %s",mkbuf);
		filename[index] = '/';
		FILE *fp = fopen( filename , "w" ) ;
		if(!fp) {
			LOGD("open fileerr %s",filename) ; 
		}
		else{
			fwrite(s , 1 , len , fp ) ;
			LOGD("saved  %s",filename) ;
			fclose(fp) ;  
		} 
	} 
	
 
	 return lua_loadbuffer_f(L,s,len,s2,s5);
 }


 void *(*lua_loadx_org)(void *,  void *s, void *s1,void *s2,void *s5);

  void * lua_loadx_hook(void *L,  void *s, void *s1,void *s2,void *s5)
  {

	  char *tmp = (char *)s1;
	  LOGD("lua_loadx_hook  is %s !%x,%x,%x,%x,%x,%x!!!!!!!!!!!!",s2,tmp[0],tmp[1],tmp[2],tmp[3],tmp[4],tmp[5]);



	  return lua_loadx_org(L,s,s1,s2,s5);
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
 	void *(*lua_loadbuffer_org_sym)(void *,  char *s, long len,void *s2,void *s5);
 	lua_loadbuffer_org_sym = (void * (*)(void *,  char *s, long len,void *s2,void *s5)) MSFindSymbol(image, "luaL_loadbufferx");
  LOGD("lua_loadbuffer_org_sym %d",lua_loadbuffer_org_sym)
 	if(lua_loadbuffer_org_sym != NULL)
 	 {
 	 	//LOGD("lua_pushlstring_org_sym is %p!!!!!!!!!!!!\n",lua_loadbuffer_org_sym);
 	 	MSHookFunction((void *)lua_loadbuffer_org_sym, (void*)lua_loadbuffer_hook, (void**)&lua_loadbuffer_f);
 	 }
 	 else
 	 {
 	 //	LOGD("lua_pushlstring_org no find!!!!!!!!!!!!!!!!!!\n");
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


