package com.mongodb;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/TaggableReadPreference.class */
public abstract class TaggableReadPreference extends ReadPreference {
    private static final List<DBObject> EMPTY = new ArrayList();
    final List<DBObject> _tags;

    abstract List<ServerDescription> getServers(ClusterDescription clusterDescription);

    abstract List<ServerDescription> getServersForTags(ClusterDescription clusterDescription, Tags tags);

    TaggableReadPreference() {
        this._tags = EMPTY;
    }

    TaggableReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
        if (firstTagSet == null) {
            throw new IllegalArgumentException("Must have at least one tag set");
        }
        this._tags = new ArrayList();
        this._tags.add(firstTagSet);
        Collections.addAll(this._tags, remainingTagSets);
    }

    @Override // com.mongodb.ReadPreference
    public boolean isSlaveOk() {
        return true;
    }

    @Override // com.mongodb.ReadPreference
    public DBObject toDBObject() {
        DBObject readPrefObject = new BasicDBObject("mode", getName());
        if (!this._tags.isEmpty()) {
            readPrefObject.put("tags", this._tags);
        }
        return readPrefObject;
    }

    public List<DBObject> getTagSets() {
        List<DBObject> tags = new ArrayList<>();
        for (DBObject tagSet : this._tags) {
            tags.add(tagSet);
        }
        return tags;
    }

    public String toString() {
        return getName() + printTags();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TaggableReadPreference that = (TaggableReadPreference) o;
        return this._tags.equals(that._tags);
    }

    public int hashCode() {
        int result = this._tags.hashCode();
        return (31 * result) + getName().hashCode();
    }

    @Override // com.mongodb.ReadPreference
    List<ServerDescription> choose(ClusterDescription clusterDescription) {
        if (this._tags.isEmpty()) {
            return getServers(clusterDescription);
        }
        for (DBObject curTagSet : this._tags) {
            Tags tags = getTagsFromDBObject(curTagSet);
            List<ServerDescription> taggedServers = getServersForTags(clusterDescription, tags);
            if (!taggedServers.isEmpty()) {
                return taggedServers;
            }
        }
        return Collections.emptyList();
    }

    String printTags() {
        return this._tags.isEmpty() ? "" : " : " + new BasicDBObject("tags", this._tags);
    }

    private static Tags getTagsFromDBObject(DBObject curTagSet) {
        Tags tags = new Tags();
        for (String key : curTagSet.keySet()) {
            tags.append(key, curTagSet.get(key).toString());
        }
        return tags;
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/TaggableReadPreference$SecondaryReadPreference.class */
    static class SecondaryReadPreference extends TaggableReadPreference {
        SecondaryReadPreference() {
        }

        SecondaryReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
            super(firstTagSet, remainingTagSets);
        }

        @Override // com.mongodb.ReadPreference
        public String getName() {
            return "secondary";
        }

        @Override // com.mongodb.TaggableReadPreference
        List<ServerDescription> getServers(ClusterDescription clusterDescription) {
            return clusterDescription.getSecondaries();
        }

        @Override // com.mongodb.TaggableReadPreference
        List<ServerDescription> getServersForTags(ClusterDescription clusterDescription, Tags tags) {
            return clusterDescription.getSecondaries(tags);
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference.class */
    static class SecondaryPreferredReadPreference extends SecondaryReadPreference {
        SecondaryPreferredReadPreference() {
        }

        SecondaryPreferredReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
            super(firstTagSet, remainingTagSets);
        }

        @Override // com.mongodb.TaggableReadPreference.SecondaryReadPreference, com.mongodb.ReadPreference
        public String getName() {
            return "secondaryPreferred";
        }

        @Override // com.mongodb.TaggableReadPreference, com.mongodb.ReadPreference
        List<ServerDescription> choose(ClusterDescription clusterDescription) {
            List<ServerDescription> servers = super.choose(clusterDescription);
            return !servers.isEmpty() ? servers : clusterDescription.getPrimaries();
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/TaggableReadPreference$NearestReadPreference.class */
    static class NearestReadPreference extends TaggableReadPreference {
        NearestReadPreference() {
        }

        NearestReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
            super(firstTagSet, remainingTagSets);
        }

        @Override // com.mongodb.ReadPreference
        public String getName() {
            return "nearest";
        }

        @Override // com.mongodb.TaggableReadPreference
        List<ServerDescription> getServers(ClusterDescription clusterDescription) {
            return clusterDescription.getAnyPrimaryOrSecondary();
        }

        @Override // com.mongodb.TaggableReadPreference
        List<ServerDescription> getServersForTags(ClusterDescription clusterDescription, Tags tags) {
            return clusterDescription.getAnyPrimaryOrSecondary(tags);
        }
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference.class */
    static class PrimaryPreferredReadPreference extends SecondaryReadPreference {
        PrimaryPreferredReadPreference() {
        }

        PrimaryPreferredReadPreference(DBObject firstTagSet, DBObject... remainingTagSets) {
            super(firstTagSet, remainingTagSets);
        }

        @Override // com.mongodb.TaggableReadPreference.SecondaryReadPreference, com.mongodb.ReadPreference
        public String getName() {
            return "primaryPreferred";
        }

        @Override // com.mongodb.TaggableReadPreference, com.mongodb.ReadPreference
        List<ServerDescription> choose(ClusterDescription clusterDescription) {
            List<ServerDescription> servers = clusterDescription.getPrimaries();
            return !servers.isEmpty() ? servers : super.choose(clusterDescription);
        }
    }
}
