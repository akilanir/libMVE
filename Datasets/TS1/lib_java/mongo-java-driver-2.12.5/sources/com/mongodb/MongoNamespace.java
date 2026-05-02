package com.mongodb;

import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MongoNamespace.class */
final class MongoNamespace {
    private static final String NAMESPACE_TEMPLATE = "%s.%s";
    public static final String COMMAND_COLLECTION_NAME = "$cmd";
    private final String databaseName;
    private final String collectionName;

    public MongoNamespace(String databaseName, String collectionName) {
        if (databaseName == null) {
            throw new IllegalArgumentException("database name can not be null");
        }
        if (collectionName == null) {
            throw new IllegalArgumentException("Collection name can not be null");
        }
        this.databaseName = databaseName;
        this.collectionName = collectionName;
    }

    public String getDatabaseName() {
        return this.databaseName;
    }

    public String getCollectionName() {
        return this.collectionName;
    }

    public String getFullName() {
        return getDatabaseName() + "." + getCollectionName();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MongoNamespace that = (MongoNamespace) o;
        if (this.collectionName != null) {
            if (!this.collectionName.equals(that.collectionName)) {
                return false;
            }
        } else if (that.collectionName != null) {
            return false;
        }
        if (this.databaseName != null) {
            if (!this.databaseName.equals(that.databaseName)) {
                return false;
            }
            return true;
        }
        if (that.databaseName != null) {
            return false;
        }
        return true;
    }

    public String toString() {
        return this.databaseName + "." + this.collectionName;
    }

    public int hashCode() {
        int result = this.databaseName != null ? this.databaseName.hashCode() : 0;
        return (31 * result) + (this.collectionName != null ? this.collectionName.hashCode() : 0);
    }

    public static String asNamespaceString(String databaseName, String collectionName) {
        return String.format(NAMESPACE_TEMPLATE, databaseName, collectionName);
    }
}
