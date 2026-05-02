package com.mongodb;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Java5MongoConnectionPoolMBean.class */
public interface Java5MongoConnectionPoolMBean {
    String getName();

    String getHost();

    int getPort();

    int getTotal();

    int getInUse();

    int getMaxSize();
}
