package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ChangeListener.class */
interface ChangeListener<T> {
    void stateChanged(ChangeEvent<T> changeEvent);
}
