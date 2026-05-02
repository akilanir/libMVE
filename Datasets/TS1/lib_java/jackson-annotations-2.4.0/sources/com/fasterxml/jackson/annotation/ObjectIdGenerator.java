package com.fasterxml.jackson.annotation;

import java.io.Serializable;

/* loaded from: jackson-annotations-2.4.0.jar:com/fasterxml/jackson/annotation/ObjectIdGenerator.class */
public abstract class ObjectIdGenerator<T> implements Serializable {
    public abstract Class<?> getScope();

    public abstract boolean canUseFor(ObjectIdGenerator<?> objectIdGenerator);

    public abstract ObjectIdGenerator<T> forScope(Class<?> cls);

    public abstract ObjectIdGenerator<T> newForSerialization(Object obj);

    public abstract IdKey key(Object obj);

    public abstract T generateId(Object obj);

    /* loaded from: jackson-annotations-2.4.0.jar:com/fasterxml/jackson/annotation/ObjectIdGenerator$IdKey.class */
    public static final class IdKey implements Serializable {
        private static final long serialVersionUID = 1;
        public final Class<?> type;
        public final Class<?> scope;
        public final Object key;
        private final int hashCode;

        public IdKey(Class<?> type, Class<?> scope, Object key) {
            this.type = type;
            this.scope = scope;
            this.key = key;
            int h = key.hashCode() + type.getName().hashCode();
            this.hashCode = scope != null ? h ^ scope.getName().hashCode() : h;
        }

        public int hashCode() {
            return this.hashCode;
        }

        public boolean equals(Object o) {
            if (o == this) {
                return true;
            }
            if (o == null || o.getClass() != getClass()) {
                return false;
            }
            IdKey other = (IdKey) o;
            return other.key.equals(this.key) && other.type == this.type && other.scope == this.scope;
        }
    }
}
