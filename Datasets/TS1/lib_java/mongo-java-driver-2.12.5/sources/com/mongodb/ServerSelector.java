package com.mongodb;

import java.util.List;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ServerSelector.class */
interface ServerSelector {
    List<ServerDescription> choose(ClusterDescription clusterDescription);
}
