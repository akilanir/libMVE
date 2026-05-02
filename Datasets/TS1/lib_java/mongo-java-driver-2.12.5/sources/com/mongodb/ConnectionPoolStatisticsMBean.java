package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ConnectionPoolStatisticsMBean.class */
public interface ConnectionPoolStatisticsMBean {
    String getHost();

    int getPort();

    int getMinSize();

    int getMaxSize();

    int getSize();

    int getCheckedOutCount();

    int getWaitQueueSize();
}
