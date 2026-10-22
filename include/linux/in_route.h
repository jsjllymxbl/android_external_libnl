/*
 * libnl 2.0 的 netlink/route/route.h 会 #include <linux/in_route.h>，
 * 但 GB(2.3) 的 bionic 内核头没有这个头文件（它是很老的 2.0 时代遗留头）。
 * 检查过 route.h 并没有使用 in_route.h 里的任何符号，因此这里给一个空桩，
 * 只为让 libnl 能在 GB 上编译（wpa_supplicant 的 NL80211 不需要路由部分）。
 */
#ifndef _LINUX_IN_ROUTE_H
#define _LINUX_IN_ROUTE_H

#endif /* _LINUX_IN_ROUTE_H */
