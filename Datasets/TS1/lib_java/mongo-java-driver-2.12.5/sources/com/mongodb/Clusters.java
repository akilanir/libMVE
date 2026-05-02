package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Clusters.class */
final class Clusters {
    private Clusters() {
    }

    public static Cluster create(String clusterId, ClusterSettings settings, ServerSettings serverSettings, ClusterListener clusterListener, Mongo mongo) {
        ClusterableServerFactory serverFactory = new DefaultClusterableServerFactory(clusterId, serverSettings, mongo);
        if (settings.getMode() == ClusterConnectionMode.Single) {
            return new SingleServerCluster(clusterId, settings, serverFactory, clusterListener != null ? clusterListener : new NoOpClusterListener());
        }
        if (settings.getMode() == ClusterConnectionMode.Multiple) {
            return new MultiServerCluster(clusterId, settings, serverFactory, clusterListener != null ? clusterListener : new NoOpClusterListener());
        }
        throw new UnsupportedOperationException("Unsupported cluster mode: " + settings.getMode());
    }
}
