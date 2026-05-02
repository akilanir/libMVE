package com.mongodb.util.management;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/management/MBeanServer.class */
public interface MBeanServer {
    boolean isRegistered(String str);

    void unregisterMBean(String str);

    void registerMBean(Object obj, String str);
}
