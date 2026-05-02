package com.mongodb.util;

import com.mongodb.InUseConnectionBean;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/ConnectionPoolStatisticsBean.class */
public class ConnectionPoolStatisticsBean {
    private final int total;
    private final int inUse;
    private final InUseConnectionBean[] inUseConnections;

    public ConnectionPoolStatisticsBean(int total, int inUse, InUseConnectionBean[] inUseConnections) {
        this.total = total;
        this.inUse = inUse;
        this.inUseConnections = inUseConnections;
    }

    public int getTotal() {
        return this.total;
    }

    public int getInUse() {
        return this.inUse;
    }

    public InUseConnectionBean[] getInUseConnections() {
        return this.inUseConnections;
    }
}
