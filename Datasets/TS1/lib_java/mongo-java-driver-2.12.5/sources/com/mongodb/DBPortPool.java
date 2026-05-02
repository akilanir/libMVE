package com.mongodb;

import com.mongodb.util.SimplePool;
import java.util.concurrent.Semaphore;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBPortPool.class */
public class DBPortPool extends SimplePool<DBPort> {
    final MongoOptions _options;
    private final Semaphore _waitingSem;
    final ServerAddress _addr;

    public String getHost() {
        return this._addr.getHost();
    }

    public int getPort() {
        return this._addr.getPort();
    }

    @Deprecated
    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBPortPool$NoMoreConnection.class */
    public static class NoMoreConnection extends MongoClientException {
        private static final long serialVersionUID = -4415279469780082174L;

        public NoMoreConnection(String msg) {
            super(msg);
        }
    }

    @Deprecated
    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBPortPool$SemaphoresOut.class */
    public static class SemaphoresOut extends MongoWaitQueueFullException {
        private static final long serialVersionUID = -4415279469780082174L;
        private static final String message = "Concurrent requests for database connection have exceeded limit";

        SemaphoresOut() {
            super(message);
        }

        SemaphoresOut(int numPermits) {
            super("Concurrent requests for database connection have exceeded limit of " + numPermits);
        }
    }

    @Deprecated
    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBPortPool$ConnectionWaitTimeOut.class */
    public static class ConnectionWaitTimeOut extends MongoTimeoutException {
        private static final long serialVersionUID = -4415279469780082174L;

        ConnectionWaitTimeOut(int timeout) {
            super("Connection wait timeout after " + timeout + " ms");
        }
    }

    DBPortPool(ServerAddress addr, MongoOptions options) {
        super("DBPortPool-" + addr.toString() + ", options = " + options.toString(), options.connectionsPerHost);
        this._options = options;
        this._addr = addr;
        this._waitingSem = new Semaphore(this._options.connectionsPerHost * this._options.threadsAllowedToBlockForConnectionMultiplier);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mongodb.util.SimplePool
    public DBPort get() {
        try {
            if (!this._waitingSem.tryAcquire()) {
                throw new SemaphoresOut(this._options.connectionsPerHost * this._options.threadsAllowedToBlockForConnectionMultiplier);
            }
            try {
                DBPort port = get(this._options.maxWaitTime);
                this._waitingSem.release();
                if (port == null) {
                    throw new ConnectionWaitTimeOut(this._options.maxWaitTime);
                }
                return port;
            } catch (InterruptedException e) {
                throw new MongoInterruptedException(e);
            }
        } catch (Throwable th) {
            this._waitingSem.release();
            throw th;
        }
    }

    @Override // com.mongodb.util.SimplePool
    public void cleanup(DBPort p) {
        p.close();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.mongodb.util.SimplePool
    public DBPort createNew() {
        return new DBPort(this._addr);
    }

    public ServerAddress getServerAddress() {
        return this._addr;
    }
}
