package com.mongodb.util.management;

import com.mongodb.util.management.jmx.JMXMBeanServer;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/management/MBeanServerFactory.class */
public class MBeanServerFactory {
    private static final MBeanServer mBeanServer;

    static {
        MBeanServer tmp;
        try {
            tmp = new JMXMBeanServer();
        } catch (Throwable th) {
            tmp = new NullMBeanServer();
        }
        mBeanServer = tmp;
    }

    public static MBeanServer getMBeanServer() {
        return mBeanServer;
    }
}
