package com.mongodb;

import com.mongodb.ConcurrentPool;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Logger;
import org.bson.util.Assertions;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/PooledConnectionProvider.class */
class PooledConnectionProvider {
    private static final Logger LOGGER = Loggers.getLogger("connection");
    private final ConcurrentPool<Connection> pool;
    private final ConnectionPoolSettings settings;
    private final AtomicInteger waitQueueSize = new AtomicInteger(0);
    private final AtomicInteger generation = new AtomicInteger(0);
    private final ExecutorService sizeMaintenanceTimer;
    private final String clusterId;
    private final ServerAddress serverAddress;
    private final Runnable maintenanceTask;
    private final ConnectionPoolListener connectionPoolListener;
    private final ConnectionFactory connectionFactory;
    private volatile boolean closed;
    private volatile boolean hasWorked;

    public PooledConnectionProvider(String clusterId, ServerAddress serverAddress, ConnectionFactory connectionFactory, ConnectionPoolSettings settings, ConnectionPoolListener connectionPoolListener) {
        this.connectionFactory = connectionFactory;
        this.clusterId = (String) Assertions.notNull("clusterId", clusterId);
        this.serverAddress = (ServerAddress) Assertions.notNull("serverAddress", serverAddress);
        this.settings = (ConnectionPoolSettings) Assertions.notNull("settings", settings);
        ConnectionItemFactory connectionItemFactory = new ConnectionItemFactory();
        this.pool = new ConcurrentPool<>(settings.getMaxSize(), connectionItemFactory);
        this.maintenanceTask = createMaintenanceTask();
        this.sizeMaintenanceTimer = createTimer();
        this.connectionPoolListener = (ConnectionPoolListener) Assertions.notNull("connectionPoolListener", connectionPoolListener);
        connectionPoolListener.connectionPoolOpened(new ConnectionPoolOpenedEvent(clusterId, serverAddress, settings));
    }

    public Connection get() {
        return get(this.settings.getMaxWaitTime(TimeUnit.MILLISECONDS), TimeUnit.MILLISECONDS);
    }

    public Connection get(long timeout, TimeUnit timeUnit) {
        try {
            if (this.waitQueueSize.incrementAndGet() > this.settings.getMaxWaitQueueSize()) {
                throw new MongoWaitQueueFullException(String.format("Too many threads are already waiting for a connection. Max number of threads (maxWaitQueueSize) of %d has been exceeded.", Integer.valueOf(this.settings.getMaxWaitQueueSize())));
            }
            this.connectionPoolListener.waitQueueEntered(new ConnectionPoolWaitQueueEvent(this.clusterId, this.serverAddress, Thread.currentThread().getId()));
            Connection connection = this.pool.get(timeout, timeUnit);
            this.hasWorked = true;
            while (shouldPrune(connection)) {
                this.pool.release(connection, true);
                connection = this.pool.get(timeout, timeUnit);
            }
            this.connectionPoolListener.connectionCheckedOut(new ConnectionEvent(this.clusterId, this.serverAddress));
            Connection connection2 = connection;
            this.waitQueueSize.decrementAndGet();
            this.connectionPoolListener.waitQueueExited(new ConnectionPoolWaitQueueEvent(this.clusterId, this.serverAddress, Thread.currentThread().getId()));
            return connection2;
        } catch (Throwable th) {
            this.waitQueueSize.decrementAndGet();
            this.connectionPoolListener.waitQueueExited(new ConnectionPoolWaitQueueEvent(this.clusterId, this.serverAddress, Thread.currentThread().getId()));
            throw th;
        }
    }

    public void release(Connection connection) {
        if (!this.closed) {
            this.connectionPoolListener.connectionCheckedIn(new ConnectionEvent(this.clusterId, this.serverAddress));
        }
        this.pool.release(connection, connection.isClosed() || shouldPrune(connection));
    }

    public boolean hasWorked() {
        return this.hasWorked;
    }

    public void close() {
        if (!this.closed) {
            this.pool.close();
            if (this.sizeMaintenanceTimer != null) {
                this.sizeMaintenanceTimer.shutdownNow();
            }
            this.closed = true;
            this.connectionPoolListener.connectionPoolClosed(new ConnectionPoolEvent(this.clusterId, this.serverAddress));
        }
    }

    public void doMaintenance() {
        if (this.maintenanceTask != null) {
            this.maintenanceTask.run();
        }
    }

    private Runnable createMaintenanceTask() {
        Runnable newMaintenanceTask = null;
        if (shouldPrune() || shouldEnsureMinSize()) {
            newMaintenanceTask = new Runnable() { // from class: com.mongodb.PooledConnectionProvider.1
                @Override // java.lang.Runnable
                public synchronized void run() {
                    if (PooledConnectionProvider.this.shouldPrune()) {
                        PooledConnectionProvider.LOGGER.fine(String.format("Pruning pooled connections to %s", PooledConnectionProvider.this.serverAddress));
                        PooledConnectionProvider.this.pool.prune();
                    }
                    if (PooledConnectionProvider.this.shouldEnsureMinSize()) {
                        PooledConnectionProvider.LOGGER.fine(String.format("Ensuring minimum pooled connections to %s", PooledConnectionProvider.this.serverAddress));
                        PooledConnectionProvider.this.pool.ensureMinSize(PooledConnectionProvider.this.settings.getMinSize());
                    }
                }
            };
        }
        return newMaintenanceTask;
    }

    private ExecutorService createTimer() {
        if (this.maintenanceTask == null) {
            return null;
        }
        ScheduledExecutorService newTimer = Executors.newSingleThreadScheduledExecutor();
        newTimer.scheduleAtFixedRate(this.maintenanceTask, this.settings.getMaintenanceInitialDelay(TimeUnit.MILLISECONDS), this.settings.getMaintenanceFrequency(TimeUnit.MILLISECONDS), TimeUnit.MILLISECONDS);
        return newTimer;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldEnsureMinSize() {
        return this.settings.getMinSize() > 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldPrune() {
        return this.settings.getMaxConnectionIdleTime(TimeUnit.MILLISECONDS) > 0 || this.settings.getMaxConnectionLifeTime(TimeUnit.MILLISECONDS) > 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldPrune(Connection connection) {
        return fromPreviousGeneration(connection) || pastMaxLifeTime(connection) || pastMaxIdleTime(connection);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean pastMaxIdleTime(Connection connection) {
        return expired(connection.getLastUsedAt(), System.currentTimeMillis(), this.settings.getMaxConnectionIdleTime(TimeUnit.MILLISECONDS));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean pastMaxLifeTime(Connection connection) {
        return expired(connection.getOpenedAt(), System.currentTimeMillis(), this.settings.getMaxConnectionLifeTime(TimeUnit.MILLISECONDS));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean fromPreviousGeneration(Connection connection) {
        return this.generation.get() > connection.getGeneration();
    }

    private boolean expired(long startTime, long curTime, long maxTime) {
        return maxTime != 0 && curTime - startTime > maxTime;
    }

    public void invalidate() {
        this.generation.incrementAndGet();
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/PooledConnectionProvider$ConnectionItemFactory.class */
    private class ConnectionItemFactory implements ConcurrentPool.ItemFactory<Connection> {
        private ConnectionItemFactory() {
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.mongodb.ConcurrentPool.ItemFactory
        public Connection create() {
            Connection connection = PooledConnectionProvider.this.connectionFactory.create(PooledConnectionProvider.this.serverAddress, PooledConnectionProvider.this, PooledConnectionProvider.this.generation.get());
            PooledConnectionProvider.LOGGER.fine(String.format("Opened connection to %s", PooledConnectionProvider.this.serverAddress));
            PooledConnectionProvider.this.connectionPoolListener.connectionAdded(new ConnectionEvent(PooledConnectionProvider.this.clusterId, PooledConnectionProvider.this.serverAddress));
            return connection;
        }

        @Override // com.mongodb.ConcurrentPool.ItemFactory
        public void close(Connection connection) {
            String reason;
            if (!PooledConnectionProvider.this.fromPreviousGeneration(connection)) {
                if (!PooledConnectionProvider.this.pastMaxLifeTime(connection)) {
                    if (PooledConnectionProvider.this.pastMaxIdleTime(connection)) {
                        reason = "it is past its maximum allowed idle time";
                    } else {
                        reason = "the pool has been closed";
                    }
                } else {
                    reason = "it is past its maximum allowed life time";
                }
            } else {
                reason = "there was a socket exception raised on another connection from this pool";
            }
            if (!PooledConnectionProvider.this.closed) {
                PooledConnectionProvider.this.connectionPoolListener.connectionRemoved(new ConnectionEvent(PooledConnectionProvider.this.clusterId, PooledConnectionProvider.this.serverAddress));
            }
            connection.close();
            PooledConnectionProvider.LOGGER.fine(String.format("Closed connection to %s because %s.", PooledConnectionProvider.this.serverAddress, reason));
        }

        @Override // com.mongodb.ConcurrentPool.ItemFactory
        public boolean shouldPrune(Connection connection) {
            return PooledConnectionProvider.this.shouldPrune(connection);
        }
    }
}
