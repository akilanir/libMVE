package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/NoOpConnectionPoolListener.class */
class NoOpConnectionPoolListener implements ConnectionPoolListener {
    NoOpConnectionPoolListener() {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionPoolOpened(ConnectionPoolOpenedEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionPoolClosed(ConnectionPoolEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionCheckedOut(ConnectionEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionCheckedIn(ConnectionEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void waitQueueEntered(ConnectionPoolWaitQueueEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void waitQueueExited(ConnectionPoolWaitQueueEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionAdded(ConnectionEvent event) {
    }

    @Override // com.mongodb.ConnectionPoolListener
    public void connectionRemoved(ConnectionEvent event) {
    }
}
