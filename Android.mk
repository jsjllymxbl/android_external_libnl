LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

# libnl 2.0（来自 CyanogenMod android_external_libnl）
#
# wpa_supplicant 的 NL80211 驱动(driver_nl80211.c)需要它，而 Android/GB 没有
# 系统 libnl。原 Android.mk 同时定义了静态和共享两个同名模块（GB 构建会冲突），
# 这里只编静态库，并且只保留 NL80211/generic netlink 需要的源文件：
#   * 去掉 fib_lookup / route / netfilter：GB 内核头缺 linux/in_route.h 等，
#     且 nl80211 用不到（route.h 的 include 已用 include/linux/in_route.h 桩解决）
#   * EAI_ADDRFAMILY 在 GB bionic 的 netdb.h 里没有定义，补一个宏
#     （只是 getaddrinfo 错误码的 case 分支，取 glibc 的值 -9）

LOCAL_SRC_FILES :=  lib/nl.c \
	lib/socket.c \
	lib/msg.c \
	lib/attr.c \
	lib/handlers.c \
	lib/cache.c \
	lib/cache_mngr.c \
	lib/cache_mngt.c \
	lib/object.c \
	lib/utils.c \
	lib/data.c \
	lib/addr.c \
	lib/error.c \
	lib/genl/ctrl.c \
	lib/genl/mngt.c \
	lib/genl/family.c \
	lib/genl/genl.c

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_CFLAGS += -DEAI_ADDRFAMILY=-9
LOCAL_MODULE := libnl_2

include $(BUILD_STATIC_LIBRARY)
