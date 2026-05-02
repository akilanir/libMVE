package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ClusterDescriptionChangedEvent.class */
class ClusterDescriptionChangedEvent extends ClusterEvent {
    private final ClusterDescription clusterDescription;

    public ClusterDescriptionChangedEvent(String clusterId, ClusterDescription clusterDescription) {
        super(clusterId);
        this.clusterDescription = clusterDescription;
    }

    public ClusterDescription getClusterDescription() {
        return this.clusterDescription;
    }

    @Override // com.mongodb.ClusterEvent
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ClusterDescriptionChangedEvent that = (ClusterDescriptionChangedEvent) o;
        if (!getClusterId().equals(that.getClusterId()) || !this.clusterDescription.equals(that.clusterDescription)) {
            return false;
        }
        return true;
    }

    @Override // com.mongodb.ClusterEvent
    public int hashCode() {
        return this.clusterDescription.hashCode();
    }
}
