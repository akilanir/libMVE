package com.mongodb;

import java.util.List;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/AnyServerSelector.class */
class AnyServerSelector implements ServerSelector {
    AnyServerSelector() {
    }

    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        return clusterDescription.getAny();
    }

    public String toString() {
        return "AnyServerSelector{}";
    }
}
