package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ConnectionEvent.class */
class ConnectionEvent extends ClusterEvent {
    private final ServerAddress serverAddress;

    public ConnectionEvent(String clusterId, ServerAddress serverAddress) {
        super(clusterId);
        this.serverAddress = serverAddress;
    }

    public ServerAddress getServerAddress() {
        return this.serverAddress;
    }

    @Override // com.mongodb.ClusterEvent
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass() || !super.equals(o)) {
            return false;
        }
        ConnectionEvent that = (ConnectionEvent) o;
        if (!getClusterId().equals(that.getClusterId()) || !getServerAddress().equals(that.getServerAddress()) || !this.serverAddress.equals(that.serverAddress)) {
            return false;
        }
        return true;
    }

    @Override // com.mongodb.ClusterEvent
    public int hashCode() {
        int result = super.hashCode();
        return (31 * result) + this.serverAddress.hashCode();
    }
}
