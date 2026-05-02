package com.mongodb;

import java.util.EventListener;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ClusterListener.class */
interface ClusterListener extends EventListener {
    void clusterOpened(ClusterEvent clusterEvent);

    void clusterClosed(ClusterEvent clusterEvent);

    void clusterDescriptionChanged(ClusterDescriptionChangedEvent clusterDescriptionChangedEvent);
}
