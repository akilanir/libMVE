package com.mongodb;

import com.mongodb.util.ConnectionPoolStatisticsBean;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MongoConnectionPoolMXBean.class */
public interface MongoConnectionPoolMXBean {
    String getName();

    int getMaxSize();

    String getHost();

    int getPort();

    ConnectionPoolStatisticsBean getStatistics();
}
