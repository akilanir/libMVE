package com.mongodb;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.bson.util.annotations.Immutable;

@Immutable
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MongoCredential.class */
public final class MongoCredential {
    public static final String MONGODB_CR_MECHANISM = "MONGODB-CR";
    public static final String GSSAPI_MECHANISM = "GSSAPI";
    public static final String PLAIN_MECHANISM = "PLAIN";
    public static final String MONGODB_X509_MECHANISM = "MONGODB-X509";
    private final String mechanism;
    private final String userName;
    private final String source;
    private final char[] password;
    private final Map<String, Object> mechanismProperties;

    public static MongoCredential createMongoCRCredential(String userName, String database, char[] password) {
        return new MongoCredential(MONGODB_CR_MECHANISM, userName, database, password);
    }

    public static MongoCredential createGSSAPICredential(String userName) {
        return new MongoCredential("GSSAPI", userName, "$external", null);
    }

    public static MongoCredential createMongoX509Credential(String userName) {
        return new MongoCredential(MONGODB_X509_MECHANISM, userName, "$external", null);
    }

    public static MongoCredential createPlainCredential(String userName, String source, char[] password) {
        return new MongoCredential(PLAIN_MECHANISM, userName, source, password);
    }

    public <T> MongoCredential withMechanismProperty(String key, T value) {
        return new MongoCredential(this, key, value);
    }

    MongoCredential(String mechanism, String userName, String source, char[] password) {
        if (mechanism == null) {
            throw new IllegalArgumentException("mechanism can not be null");
        }
        if (userName == null) {
            throw new IllegalArgumentException("username can not be null");
        }
        if (mechanism.equals(MONGODB_CR_MECHANISM) && password == null) {
            throw new IllegalArgumentException("Password can not be null for MONGODB-CR mechanism");
        }
        if (mechanism.equals("GSSAPI") && password != null) {
            throw new IllegalArgumentException("Password must be null for the GSSAPI mechanism");
        }
        this.mechanism = mechanism;
        this.userName = userName;
        this.source = source;
        this.password = password != null ? (char[]) password.clone() : null;
        this.mechanismProperties = Collections.emptyMap();
    }

    <T> MongoCredential(MongoCredential from, String mechanismPropertyKey, T mechanismPropertyValue) {
        this.mechanism = from.mechanism;
        this.userName = from.userName;
        this.source = from.source;
        this.password = from.password;
        this.mechanismProperties = new HashMap(from.mechanismProperties);
        this.mechanismProperties.put(mechanismPropertyKey, mechanismPropertyValue);
    }

    public String getMechanism() {
        return this.mechanism;
    }

    public String getUserName() {
        return this.userName;
    }

    public String getSource() {
        return this.source;
    }

    public char[] getPassword() {
        if (this.password == null) {
            return null;
        }
        return (char[]) this.password.clone();
    }

    public <T> T getMechanismProperty(String str, T t) {
        T t2 = (T) this.mechanismProperties.get(str);
        return t2 == null ? t : t2;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MongoCredential that = (MongoCredential) o;
        return this.mechanism.equals(that.mechanism) && Arrays.equals(this.password, that.password) && this.source.equals(that.source) && this.userName.equals(that.userName) && this.mechanismProperties.equals(that.mechanismProperties);
    }

    public int hashCode() {
        int result = this.mechanism.hashCode();
        return (31 * ((31 * ((31 * ((31 * result) + this.userName.hashCode())) + this.source.hashCode())) + (this.password != null ? Arrays.hashCode(this.password) : 0))) + this.mechanismProperties.hashCode();
    }

    public String toString() {
        return "MongoCredential{mechanism='" + this.mechanism + "', userName='" + this.userName + "', source='" + this.source + "', password=<hidden>, mechanismProperties=" + this.mechanismProperties + '}';
    }
}
