package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ClusterEvent.class */
class ClusterEvent {
    private final String clusterId;

    public ClusterEvent(String clusterId) {
        this.clusterId = clusterId;
    }

    public String getClusterId() {
        return this.clusterId;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClusterEvent that = (ClusterEvent) o;
        if (!this.clusterId.equals(that.clusterId)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        return this.clusterId.hashCode();
    }
}
