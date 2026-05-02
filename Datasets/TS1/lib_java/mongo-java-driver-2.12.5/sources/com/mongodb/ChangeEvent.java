package com.mongodb;

import org.bson.util.Assertions;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ChangeEvent.class */
class ChangeEvent<T> {
    private final T oldValue;
    private final T newValue;

    public ChangeEvent(T t, T t2) {
        this.oldValue = (T) Assertions.notNull("oldValue", t);
        this.newValue = (T) Assertions.notNull("newValue", t2);
    }

    public T getOldValue() {
        return this.oldValue;
    }

    public T getNewValue() {
        return this.newValue;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ChangeEvent<?> that = (ChangeEvent) o;
        if (!this.newValue.equals(that.newValue)) {
            return false;
        }
        if (this.oldValue != null) {
            if (!this.oldValue.equals(that.oldValue)) {
                return false;
            }
            return true;
        }
        if (that.oldValue != null) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this.oldValue != null ? this.oldValue.hashCode() : 0;
        return (31 * result) + this.newValue.hashCode();
    }

    public String toString() {
        return "ChangeEvent{oldValue=" + this.oldValue + ", newValue=" + this.newValue + '}';
    }
}
