package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ClusterListenerAdapter.class */
abstract class ClusterListenerAdapter implements ClusterListener {
    ClusterListenerAdapter() {
    }

    @Override // com.mongodb.ClusterListener
    public void clusterOpened(ClusterEvent event) {
    }

    @Override // com.mongodb.ClusterListener
    public void clusterClosed(ClusterEvent event) {
    }

    @Override // com.mongodb.ClusterListener
    public void clusterDescriptionChanged(ClusterDescriptionChangedEvent event) {
    }
}
