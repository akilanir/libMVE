package com.mongodb.util.management;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/management/NullMBeanServer.class */
public class NullMBeanServer implements MBeanServer {
    @Override // com.mongodb.util.management.MBeanServer
    public boolean isRegistered(String mBeanName) {
        return false;
    }

    @Override // com.mongodb.util.management.MBeanServer
    public void unregisterMBean(String mBeanName) {
    }

    @Override // com.mongodb.util.management.MBeanServer
    public void registerMBean(Object mBean, String mBeanName) {
    }
}
