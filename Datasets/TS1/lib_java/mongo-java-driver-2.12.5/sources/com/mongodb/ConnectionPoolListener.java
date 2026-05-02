package com.mongodb;

import java.util.EventListener;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ConnectionPoolListener.class */
interface ConnectionPoolListener extends EventListener {
    void connectionPoolOpened(ConnectionPoolOpenedEvent connectionPoolOpenedEvent);

    void connectionPoolClosed(ConnectionPoolEvent connectionPoolEvent);

    void connectionCheckedOut(ConnectionEvent connectionEvent);

    void connectionCheckedIn(ConnectionEvent connectionEvent);

    void waitQueueEntered(ConnectionPoolWaitQueueEvent connectionPoolWaitQueueEvent);

    void waitQueueExited(ConnectionPoolWaitQueueEvent connectionPoolWaitQueueEvent);

    void connectionAdded(ConnectionEvent connectionEvent);

    void connectionRemoved(ConnectionEvent connectionEvent);
}
