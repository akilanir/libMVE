package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ConnectionPoolWaitQueueEvent.class */
class ConnectionPoolWaitQueueEvent extends ConnectionPoolEvent {
    private final long threadId;

    public ConnectionPoolWaitQueueEvent(String clusterId, ServerAddress serverAddress, long threadId) {
        super(clusterId, serverAddress);
        this.threadId = threadId;
    }

    public long getThreadId() {
        return this.threadId;
    }

    @Override // com.mongodb.ConnectionPoolEvent, com.mongodb.ClusterEvent
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ConnectionPoolWaitQueueEvent that = (ConnectionPoolWaitQueueEvent) o;
        if (!getClusterId().equals(that.getClusterId()) || !getServerAddress().equals(that.getServerAddress()) || this.threadId != that.threadId) {
            return false;
        }
        return true;
    }

    @Override // com.mongodb.ConnectionPoolEvent, com.mongodb.ClusterEvent
    public int hashCode() {
        int result = super.hashCode();
        return (31 * result) + ((int) (this.threadId ^ (this.threadId >>> 32)));
    }
}
