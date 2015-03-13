#include <android/log.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "substrate.h"
#include <jni.h>
#include <unistd.h>

#include <string>

#include <sys/stat.h>
#define LOG_TAG "INJECT"
#define LOGD(fmt, args...) __android_log_print(ANDROID_LOG_DEBUG, LOG_TAG, fmt, ##args)



// com.youzu.sanguohero.FloatWindowBigView.doUpdate

/* Header for class sh_lilith_dgame_TestWM */

#ifndef _Included_sh_lilith_dgame_TestWM
#define _Included_sh_lilith_dgame_TestWM
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     sh_lilith_dgame_TestWM
 * Method:    setSpeed
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_com_youzu_sanguohero_GameUtils_doUpdate
  (JNIEnv *, jobject, jint,jstring);

#ifdef __cplusplus
}
#endif
#endif

static int intifinit = 0;
static int  intvalue = 1;
static struct timeval tvbase;




 // 加速代码  
int(*gettimeofday_f)(struct timeval*tv, struct timezone *tz);

int gettimeofday_hook(struct timeval*tv, struct timezone *tz)
{
 int revalue = gettimeofday_f(tv,tz);

 long timenow = tv->tv_sec;
 long timenow2 = tv->tv_usec;
 

   if( intvalue == 2 )
   {
     tv->tv_sec = tvbase.tv_sec + (timenow - tvbase.tv_sec) * intvalue;
     tv->tv_usec = timenow2 * intvalue;
   }
   else
   {
     tv->tv_sec = tvbase.tv_sec + (timenow - tvbase.tv_sec) / intvalue;
     tv->tv_usec = timenow2 / intvalue;
   }
  
// LOGD("clock_gettime_hook !!!%d!!%d!!!%d!!%d",timenow,tv->tv_sec,tvbase.tv_sec,intvalue);
   return revalue;
}



int(*clock_gettime_f)(clockid_t clk_id,struct timespec *tp);

int clock_gettime_hook(clockid_t clk_id,struct timespec *tp)
{
 int revalue = clock_gettime_f(clk_id,tp);
   long timenow = tp->tv_sec;
   long timenow2 = tp->tv_nsec;
   if( intvalue == 2)
   {
     tp->tv_sec = timenow * intvalue;
     tp->tv_nsec = timenow2 * intvalue;
   }
   else
   {
     tp->tv_sec = timenow / intvalue;
     tp->tv_nsec = timenow2 / intvalue;
   }
   return revalue;
}
 // 加速结束 


//jni 调用，设速度
 JNIEXPORT void JNICALL Java_com_youzu_sanguohero_GameUtils_doUpdate
   (JNIEnv *jni, jobject job, jint value, jstring packagename)
 {
    const char* str;  
    str = jni->GetStringUTFChars(packagename, false);  
    if(str == NULL) {  
       return  ; /* OutOfMemoryError already thrown */  
    }  
    return ; 
    gettimeofday_hook(&tvbase,NULL);
    // 处理加速
    char path[255] = {0} ;
    sprintf(path,"%s/speed_status",str) ; 
    
    FILE *fp = fopen(path,"r") ;
    if(fp){
        char c = fgetc(fp );
        fclose(fp) ;
        if(c == '1'){
            LOGD("加速 %d %s" , value,path) ;
            intvalue = 2;
            return   ;
        }
    }
    LOGD("无加速 %d %s" , value,path) ;
    intvalue = 1 ;

 }


int (*lua_gettop) (void *L);
int (*lua_type)(void *L,int i);
char* (* lua_typename)(void *L, int a2);
char* (*lua_tolstring)(void *L, signed int a2, int a3) ;
char* (*_Z17getPackageNameJNIv)(std::string &s) ;

void myPrintLuaStack(void *L){
    int stackTop=lua_gettop(L);//获取栈顶的索引值
    int index,t;


    t=lua_type(L,-1);
    LOGD("(i:%d) %s\n",-1,lua_typename(L,t));  


    LOGD("--栈顶(v)(%d)--\n",stackTop);
    //显示栈中的元素
    for(index=stackTop;index>0;--index)
     {  t=lua_type(L,index);
        LOGD("(i:%d) %s\n",index,lua_typename(L,t));       
     }
    LOGD("--栈底--\n");
}


//hook 拿字节长度

  char* mylua_buf= "\
local DungeonBattleSceneClass = require \"app.scenes.dungeon.DungeonBattleScene\" \n\
local StoryTouchEventClass = require \"app.scenes.storytouch.StoryTouchEvent\" \n\
local action = require \"app.common.action.Action\" \n\
local Entry = require \"app.scenes.battle.entry.Entry\" \n\
local skippath = CCFileUtils:sharedFileUtils():getWritablePath() .. 'skip_status' ;\n\
function file_exists(path)  \n\
  local file = io.open(path, \"rb\") \n\
  if file then file:close() end \n\
  return file ~= nil \n\
end \n\
if( file_exists(skippath) == false ) then \n\
local f = io.open(skippath, 'w') ; \n\
f:write('1') ; \n\
io.close(f) ; \n\
end  \n\
local count = 0;\n\
local function isSkip()\n\
    count = count +  1 ;\n\
    if(count % 20 == 0 ) then \n\
        local mFile = io.open(skippath, 'r')\n\
        local skip=  mFile:read('*n') ; \n\
        io.close(mFile) ; \n\
        return skip == 1 \n\
    end\n\
    return false;\n\
end \n\
\
orgEntryisDone = Entry.isDone \n\
function EntryisDone(self,...)\n\
    local ret =  orgEntryisDone(self,...)\n\
    if (isSkip()) then \n\
      CCLuaLog('INJECT   skip' ) ; \n\
      return true  ;\n\
    end \n\
    return ret  ; \n\
end \n\
Entry.isDone = EntryisDone \n\
orgDungeonBattleSceneClassCtor = DungeonBattleSceneClass.ctor       \n\
function CtorNew(self,...)        \n\
  CCLuaLog(\"DungeonBattleScene.ctor\")        \n\
  orgDungeonBattleSceneClassCtor(self,...)        \n\
end         \n\
DungeonBattleSceneClass.ctor = CtorNew ; \n\
-- __PrintTable \n\
for k,v in pairs(DungeonBattleSceneClass) do \n\
    -- CCLuaLog('INJECT action ' .. tostring(k) .. ' '  .. tostring(v) )\n\
end \n\
";



std::string (*_ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv)(int a1) ; 

int (*lua_pcall) (void *L, int nargs, int nresults, int errfunc);
 
 void *(*lua_loadbuffer_f)(void *,  char *s, long len,void *s2,void *s5);


std::string my_ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv(int a){

    
    std::string ret =  _ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv(a) ;
    
    //LOGD("my_ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv %s " , (ret).c_str() ) ;
    return ret ; 
}
static bool first = 0 ; 
 void * lua_loadbuffer_hook(void *L,  char *s, long len,void *s2,void *s5)
 {

     if(strstr((char*)s2 , "assets/scripts/app/cfg/task_info.lua")){
              
               return lua_loadbuffer_f(L,s,len,s2,s5);
                
     }
     if(!first && strstr((char *)s2, "assets/scripts/app/scenes/battle/EnemyCardSprite.lua" ))
         {
               
            first = 1 ;  
            void * ret2= lua_loadbuffer_f(L,mylua_buf,strlen(mylua_buf),(void*)"test3.lua",s5); 
            int ret3 =lua_pcall(L,0,0,0) ; 
            void* ret4 = lua_loadbuffer_f(L,s,len,s2,s5);
            return ret4;

         }
   
  if(strstr((char const *)s2,"assets")>0 || strstr((char const *)s2, "/data") >0){
  //LOGD("loadbuff %s" , s2) ;

   /*
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
  
  }*/
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



/*********hook java by cydia*********/

   int ClearException(JNIEnv *jenv){
       jthrowable exception = jenv->ExceptionOccurred();
       if (exception != NULL) {
           jenv->ExceptionDescribe();
           jenv->ExceptionClear();
           return true;
       }
       return false;
   }


   static bool g_bAttatedT = false;
   static JNIEnv *GetEnv(JavaVM *g_JavaVM)
   {
     int status;
       JNIEnv *envnow = NULL;
       status = g_JavaVM->GetEnv((void **)&envnow, JNI_VERSION_1_6);
       if(status < 0)
       {
           status = g_JavaVM->AttachCurrentThread(&envnow, NULL);
           if(status < 0)
           {
               return NULL;
           }
           g_bAttatedT = true;
       }
       return envnow;
   }


   static void DetachCurrent(JavaVM *g_JavaVM)
   {
       if(g_bAttatedT)
       {
           g_JavaVM->DetachCurrentThread();
       }
   }



   static MSImageRef dvm_image = NULL;
   static MSImageRef cydia_dvm_image = NULL;
   static void (*find_method)(JNIEnv *jni, jclass _class, jmethodID methodID, void *function, void **result)=NULL;
   static void (*oldCode_java_show)(JNIEnv *, jobject, ...);
   static void (*oldCode_java_hidden)(JNIEnv *, jobject, ...);
   static JavaVM *jvm_org = NULL;


   static jclass javaClientClass_org = NULL;
   static jmethodID inject_method_show = NULL;
   static jmethodID inject_method_hidden = NULL;
   static void newCodejava_show(
       JNIEnv *jni, jobject thiss,jobject jactive

   )
   {

    
    (*oldCode_java_show)(jni, thiss,jactive);
     
    if(javaClientClass_org != NULL)
    {
      jni->CallStaticVoidMethod(javaClientClass_org,inject_method_show,jactive);
       
    }
    
   }

   static void newCodejava_hidden(
       JNIEnv *jni, jobject thiss,jobject jactive
   )
   {
    
     (*oldCode_java_hidden)(jni, thiss,jactive);
    
    if(javaClientClass_org != NULL)
    {
      jni->CallStaticVoidMethod(javaClientClass_org,inject_method_hidden,jactive);
       
    }
  
   }

 JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved)
 {

  if(intifinit)
  {
    return JNI_VERSION_1_6;
  }
  intifinit = 1;
  MSImageRef image_time;
  image_time = MSGetImageByName("/system/lib/libc.so");

  int (*gettimeofday_org)(struct timeval*tv, struct timezone *tz);
  gettimeofday_org = (int (*)(struct timeval*tv, struct timezone *tz)) MSFindSymbol(image_time, "gettimeofday");

  int (*clock_gettime_org)(clockid_t clk_id,struct timespec *tp);
  clock_gettime_org = (int (*)(clockid_t clk_id,struct timespec *tp)) MSFindSymbol(image_time, "clock_gettime");
  
 
  //MSHookFunction((void *)gettimeofday_org, (void*)gettimeofday_hook, (void**)&gettimeofday_f);
  //MSHookFunction((void *)clock_gettime_org, (void*)clock_gettime_hook, (void**)&clock_gettime_f);


 	MSImageRef image;
 	image = MSGetImageByName("/data/data/com.babeltime.fknsango_gwphone/lib/libgame.so");
  LOGD("image is %d" , image) ;
 	void *(*lua_loadbuffer_org_sym)(void *,  char *s, long len,void *s2,void *s5);
 	lua_loadbuffer_org_sym = (void * (*)(void *,  char *s, long len,void *s2,void *s5)) MSFindSymbol(image, "luaL_loadbufferx");
	//lua_gettop =(int (*) (void*)) MSFindSymbol(image, "lua_gettop") ;
 	lua_pcall= (int (*) (void *L, int nargs, int nresults, int errfunc))MSFindSymbol(image, "lua_pcall") ; 
  lua_gettop= (int (*) (void *L))MSFindSymbol(image, "lua_gettop") ; 
  lua_type= (int (*)(void *L,int i))MSFindSymbol(image, "lua_type") ; 
  lua_typename= (char* (* )(void *L, int a2))MSFindSymbol(image, "lua_typename") ; 
  lua_tolstring= (char* (*)(void *L, signed int a2, int a3))MSFindSymbol(image, "lua_tolstring") ; 
  _Z17getPackageNameJNIv = (  char* (* )(std::string &s  ))  MSFindSymbol(image, "_Z17getPackageNameJNIv");
  
  ; 
  _ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv = (std::string (*)(int a1)) MSFindSymbol(image,"_ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv") ;
  MSHookFunction((void *)_ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv, (void*)my_ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv, (void**)&_ZN7cocos2d18CCFileUtilsAndroid15getWritablePathEv);



	//lua_getfield = ( void (*) (void *L, int index, const char *k)) MSFindSymbol(image, "lua_getfield") ; 
	//MSHookFunction( (void *)lua_getfield,(void*)mylua_getfield,(void**)&lua_getfield);
	if(lua_loadbuffer_org_sym != NULL)
 	 {
 	 	//LOGD("lua_pushlstring_org_sym is %p!!!!!!!!!!!!\n",lua_loadbuffer_org_sym);
 	 	MSHookFunction((void *)lua_loadbuffer_org_sym, (void*)lua_loadbuffer_hook, (void**)&lua_loadbuffer_f);
 	 }
 	 else
 	 {
 	 //	LOGD("lua_pushlstring_org no find!!!!!!!!!!!!!!!!!!\n");
 	 }
   
 




 	//以下为hook java的，为了显示按钮
  JNIEnv *env = GetEnv(vm);
  MSImageRef dvm_image = MSGetImageByName("/system/lib/libc.so");
  void *gp = dlopen("/data/data/com.youzu.snsgz.linyou.youmi/lib/libsubstrate-dvm.so",RTLD_LAZY);
  cydia_dvm_image = MSGetImageByName("/data/data/sh.lilith.dgame.lemon/lib/libsubstrate-dvm.so");
  LOGD("dlopen %d , dvm %d" , gp , cydia_dvm_image) ; 

  jclass gameutil = env->FindClass("com/youzu/sanguohero/GameUtils");
  jmethodID getBRAND = env->GetStaticMethodID( gameutil, "getBRAND","()Ljava/lang/String;");
  jstring jstr =  (jstring)env->CallStaticObjectMethod( gameutil,getBRAND);
  const char* str;  
  str = env->GetStringUTFChars(jstr, false);  
  LOGD("getBRAND %s" , str) ; 
  if( strstr(str,"Meizu") != NULL) {
      return JNI_VERSION_1_6 ;
  }

  find_method = (void (*)(JNIEnv *, jclass , jmethodID , void *, void **)) MSFindSymbol(cydia_dvm_image, "MSJavaHookMethod");
  const char *target_class = "android/app/Instrumentation";//对大部分app来说，这是一个父类
  jvm_org = vm;
  jclass clazzTarget = env->FindClass(target_class);
   
  const char *fun_show = "init",*fun_hid = "hidden";
  javaClientClass_org = env->FindClass("com/youzu/sanguohero/TestWM");
   
  inject_method_show = env->GetStaticMethodID(javaClientClass_org, fun_show, "(Landroid/app/Activity;)V");
  
  inject_method_hidden = env->GetStaticMethodID(javaClientClass_org, fun_hid, "(Landroid/app/Activity;)V");
   
  //显示按钮
  jmethodID method_resume = env->GetMethodID(clazzTarget,
                 "callActivityOnResume",
                 "(Landroid/app/Activity;)V"
             );

  //隐藏按钮
  jmethodID method_pause = env->GetMethodID(clazzTarget,
                   "callActivityOnPause",
                   "(Landroid/app/Activity;)V"
               );


  find_method(env, clazzTarget, method_resume, reinterpret_cast<void *>(&newCodejava_show),reinterpret_cast<void **>(&oldCode_java_show));
  find_method(env, clazzTarget, method_pause, reinterpret_cast<void *>(&newCodejava_hidden),reinterpret_cast<void **>(&oldCode_java_hidden));

  DetachCurrent(vm);
   
  return JNI_VERSION_1_6;
 }




