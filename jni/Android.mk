LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE:= dbpays
LOCAL_SRC_FILES := hooktest_fklsg.cpp
LOCAL_PRELINK_MODULE := FALSE
LOCAL_CPPFLAGS :=--std=c++11 
#LOCAL_CFLAGS := -I./include/ -I./dalvik/vm/ -I./dalvik -DHAVE_LITTLE_ENDIAN 

LOCAL_LDLIBS := -llog -L./libs/ -lsubstrate 
include $(BUILD_SHARED_LIBRARY)

