package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ConnectionPoolOpenedEvent.class */
class ConnectionPoolOpenedEvent extends ConnectionPoolEvent {
    private final ConnectionPoolSettings settings;

    public ConnectionPoolOpenedEvent(String clusterId, ServerAddress serverAddress, ConnectionPoolSettings settings) {
        super(clusterId, serverAddress);
        this.settings = settings;
    }

    public ConnectionPoolSettings getSettings() {
        return this.settings;
    }

    @Override // com.mongodb.ConnectionPoolEvent, com.mongodb.ClusterEvent
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ConnectionPoolOpenedEvent that = (ConnectionPoolOpenedEvent) o;
        if (!getClusterId().equals(that.getClusterId()) || !getServerAddress().equals(that.getServerAddress()) || !this.settings.equals(that.getSettings())) {
            return false;
        }
        return true;
    }

    @Override // com.mongodb.ConnectionPoolEvent, com.mongodb.ClusterEvent
    public int hashCode() {
        int result = super.hashCode();
        return (31 * result) + this.settings.hashCode();
    }
}
