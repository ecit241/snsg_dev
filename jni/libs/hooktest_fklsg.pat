#include <android/log.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "substrate.h"
#include <jni.h>
#include <sys/stat.h>
#define LOG_TAG "INJECT"
#define LOGD(fmt, args...) __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, fmt, ##args)

//hook 拿字节长度


{%for item in data.values() %}
const char *{{item.name}} = "{{item.text}}" ;
{%endfor%}

const char base[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
static char find_pos(char ch)
{
    char *ptr = (char*)strrchr(base, ch);//the last position (the only) in base[]
    return (ptr - base);
}

char *base64_decode(const char *data, int data_len)
{
    int ret_len = (data_len / 4) * 3;
    int equal_count = 0;
    char *ret = NULL;
    char *f = NULL;
    int tmp = 0;
    int temp = 0;
    char need[3];
    int prepare = 0;
    int i = 0;
    if (*(data + data_len - 1) == '=')
    {
        equal_count += 1;
    }
    if (*(data + data_len - 2) == '=')
    {
        equal_count += 1;
    }
    if (*(data + data_len - 3) == '=')
    {//seems impossible
        equal_count += 1;
    }
    switch (equal_count)
    {
    case 0:
        ret_len += 4;//3 + 1 [1 for NULL]
        break;
    case 1:
        ret_len += 4;//Ceil((6*3)/8)+1
        break;
    case 2:
        ret_len += 3;//Ceil((6*2)/8)+1
        break;
    case 3:
        ret_len += 2;//Ceil((6*1)/8)+1
        break;
    }
    ret = (char *)malloc(ret_len);
    if (ret == NULL)
    {
        LOGD("No enough memory.\n");
        exit(0);
    }
    memset(ret, 0, ret_len);
    f = ret;
    while (tmp < (data_len - equal_count))
    {
        temp = 0;
        prepare = 0;
        memset(need, 0, 4);
        while (temp < 4)
        {
            if (tmp >= (data_len - equal_count))
            {
                break;
            }
            prepare = (prepare << 6) | (find_pos(data[tmp]));
            temp++;
            tmp++;
        }
        prepare = prepare << ((4-temp) * 6);
        for (i=0; i<3 ;i++ )
        {
            if (i == temp)
            {
                break;
            }
            *f = (char)((prepare>>((2-i)*8)) & 0xFF);
            f++;
        }
    }
    *f = '\0';
    return ret;
}


 void *(*lua_loadbuffer_f)(void *,  char *s, long len,void *s2,void *s5);

 void * lua_loadbuffer_hook(void *L,  char *s, long len,void *s2,void *s5)
 {

{%for item in data.values() %}
         if(strstr((char *)s2, "{{item.fname}}" ))
         {
                 LOGD("!!!!!!!!!!!%s ",s2);
                 char *filebuff = base64_decode({{item.name}} ,strlen( {{item.name}} ));
                 void *revalue = lua_loadbuffer_f(L,filebuff,strlen(filebuff),s2,s5);
                 return revalue;

         }

{%endfor%}


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


