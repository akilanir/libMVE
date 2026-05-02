package com.mongodb;

import java.util.List;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ReadPreferenceServerSelector.class */
class ReadPreferenceServerSelector implements ServerSelector {
    private final ReadPreference readPreference;

    public ReadPreferenceServerSelector(ReadPreference readPreference) {
        this.readPreference = readPreference;
    }

    public ReadPreference getReadPreference() {
        return this.readPreference;
    }

    @Override // com.mongodb.ServerSelector
    public List<ServerDescription> choose(ClusterDescription clusterDescription) {
        return this.readPreference.choose(clusterDescription);
    }

    public String toString() {
        return "ReadPreferenceServerSelector{readPreference=" + this.readPreference + '}';
    }
}
