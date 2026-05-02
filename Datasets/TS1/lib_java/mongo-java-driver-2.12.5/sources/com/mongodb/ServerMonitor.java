package com.mongodb;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.bson.util.annotations.ThreadSafe;

/*  JADX ERROR: NullPointerException in pass: ClassModifier
    java.lang.NullPointerException: Cannot invoke "java.util.List.forEach(java.util.function.Consumer)" because "blocks" is null
    	at jadx.core.utils.BlockUtils.collectAllInsns(BlockUtils.java:1029)
    	at jadx.core.dex.visitors.ClassModifier.removeBridgeMethod(ClassModifier.java:245)
    	at jadx.core.dex.visitors.ClassModifier.removeSyntheticMethods(ClassModifier.java:160)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1511)
    	at jadx.core.dex.visitors.ClassModifier.visit(ClassModifier.java:65)
    */
@ThreadSafe
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ServerMonitor.class */
class ServerMonitor {
    private static final Logger LOGGER = Loggers.getLogger("cluster");
    private ServerAddress serverAddress;
    private final ChangeListener<ServerDescription> serverStateListener;
    private final SocketSettings socketSettings;
    private final ServerSettings settings;
    private final Mongo mongo;
    private final PooledConnectionProvider connectionProvider;
    private int count;
    private long elapsedNanosSum;
    private volatile boolean isClosed;
    private final Thread monitorThread;
    private final Lock lock = new ReentrantLock();
    private final Condition condition = this.lock.newCondition();

    /*  JADX ERROR: Failed to decode insn: 0x0002: MOVE_MULTI
        java.lang.ArrayIndexOutOfBoundsException: arraycopy: source index -1 out of bounds for object array[6]
        	at java.base/java.lang.System.arraycopy(Native Method)
        	at jadx.plugins.input.java.data.code.StackState.insert(StackState.java:52)
        	at jadx.plugins.input.java.data.code.CodeDecodeState.insert(CodeDecodeState.java:137)
        	at jadx.plugins.input.java.data.code.JavaInsnsRegister.dup2x1(JavaInsnsRegister.java:313)
        	at jadx.plugins.input.java.data.code.JavaInsnData.decode(JavaInsnData.java:46)
        	at jadx.core.dex.instructions.InsnDecoder.lambda$process$0(InsnDecoder.java:50)
        	at jadx.plugins.input.java.data.code.JavaCodeReader.visitInstructions(JavaCodeReader.java:85)
        	at jadx.core.dex.instructions.InsnDecoder.process(InsnDecoder.java:46)
        	at jadx.core.dex.nodes.MethodNode.load(MethodNode.java:157)
        	at jadx.core.dex.nodes.ClassNode.load(ClassNode.java:458)
        	at jadx.core.ProcessClass.process(ProcessClass.java:69)
        	at jadx.core.ProcessClass.generateCode(ProcessClass.java:117)
        	at jadx.core.dex.nodes.ClassNode.generateClassCode(ClassNode.java:401)
        	at jadx.core.dex.nodes.ClassNode.decompile(ClassNode.java:389)
        	at jadx.core.dex.nodes.ClassNode.getCode(ClassNode.java:339)
        */
    static /* synthetic */ long access$602(com.mongodb.ServerMonitor r6, long r7) {
        /*
            r0 = r6
            r1 = r7
            // decode failed: arraycopy: source index -1 out of bounds for object array[6]
            r0.elapsedNanosSum = r1
            return r-1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.mongodb.ServerMonitor.access$602(com.mongodb.ServerMonitor, long):long");
    }

    static {
    }

    ServerMonitor(ServerAddress serverAddress, ChangeListener<ServerDescription> serverStateListener, SocketSettings socketSettings, ServerSettings settings, String clusterId, Mongo mongo, PooledConnectionProvider connectionProvider) {
        this.serverAddress = serverAddress;
        this.serverStateListener = serverStateListener;
        this.socketSettings = socketSettings;
        this.settings = settings;
        this.mongo = mongo;
        this.connectionProvider = connectionProvider;
        this.monitorThread = new Thread(new ServerMonitorRunnable(), "cluster-" + clusterId + "-" + serverAddress);
        this.monitorThread.setDaemon(true);
    }

    void start() {
        this.monitorThread.start();
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ServerMonitor$ServerMonitorRunnable.class */
    class ServerMonitorRunnable implements Runnable {
        ServerMonitorRunnable() {
        }

        /* JADX WARN: Failed to check method for inline after forced processcom.mongodb.ServerMonitor.access$602(com.mongodb.ServerMonitor, long):long */
        @Override // java.lang.Runnable
        public void run() {
            DBPort connection = null;
            try {
                ServerDescription currentServerDescription = ServerMonitor.this.getConnectingServerDescription(null);
                Throwable currentException = null;
                while (!ServerMonitor.this.isClosed) {
                    ServerDescription previousServerDescription = currentServerDescription;
                    Throwable previousException = currentException;
                    if (connection == null) {
                        try {
                            connection = new DBPort(ServerMonitor.this.serverAddress, null, ServerMonitor.this.getOptions(), 0);
                        } catch (Throwable t) {
                            currentException = t;
                            currentServerDescription = ServerMonitor.this.getConnectingServerDescription(t);
                        }
                    }
                    try {
                        currentServerDescription = ServerMonitor.this.lookupServerDescription(connection);
                    } catch (IOException e) {
                        ServerMonitor.this.count = 0;
                        ServerMonitor.access$602(ServerMonitor.this, 0L);
                        if (connection != null) {
                            connection.close();
                            ServerMonitor.this.connectionProvider.invalidate();
                        }
                        connection = new DBPort(ServerMonitor.this.serverAddress, null, ServerMonitor.this.getOptions(), 0);
                        try {
                            currentServerDescription = ServerMonitor.this.lookupServerDescription(connection);
                        } catch (IOException e1) {
                            connection.close();
                            connection = null;
                            throw e1;
                        }
                    }
                    if (!ServerMonitor.this.isClosed) {
                        try {
                            logStateChange(previousServerDescription, previousException, currentServerDescription, currentException);
                            sendStateChangedEvent(previousServerDescription, currentServerDescription);
                        } catch (Throwable t2) {
                            ServerMonitor.LOGGER.log(Level.WARNING, "Exception in monitor thread during notification of server state change", t2);
                        }
                    }
                    waitForNext();
                }
            } finally {
                if (connection != null) {
                    connection.close();
                }
            }
        }

        private void sendStateChangedEvent(ServerDescription previousServerDescription, ServerDescription currentServerDescription) {
            if (ServerMonitor.stateHasChanged(previousServerDescription, currentServerDescription)) {
                ServerMonitor.this.serverStateListener.stateChanged(new ChangeEvent(previousServerDescription, currentServerDescription));
            }
        }

        private void logStateChange(ServerDescription previousServerDescription, Throwable previousException, ServerDescription currentServerDescription, Throwable currentException) {
            if (ServerMonitor.descriptionHasChanged(previousServerDescription, currentServerDescription) || ServerMonitor.exceptionHasChanged(previousException, currentException)) {
                if (currentException != null) {
                    ServerMonitor.LOGGER.log(Level.INFO, String.format("Exception in monitor thread while connecting to server %s", ServerMonitor.this.serverAddress), currentException);
                } else {
                    ServerMonitor.LOGGER.info(String.format("Monitor thread successfully connected to server with description %s", currentServerDescription));
                }
            }
        }

        private void waitForNext() {
            try {
                long timeRemaining = waitForSignalOrTimeout();
                if (timeRemaining > 0) {
                    long timeWaiting = ServerMonitor.this.settings.getHeartbeatFrequency(TimeUnit.NANOSECONDS) - timeRemaining;
                    long minimumNanosToWait = ServerMonitor.this.settings.getHeartbeatConnectRetryFrequency(TimeUnit.NANOSECONDS);
                    if (timeWaiting < minimumNanosToWait) {
                        long millisToSleep = TimeUnit.MILLISECONDS.convert(minimumNanosToWait - timeWaiting, TimeUnit.NANOSECONDS);
                        if (millisToSleep > 0) {
                            Thread.sleep(millisToSleep);
                        }
                    }
                }
            } catch (InterruptedException e) {
            }
        }

        private long waitForSignalOrTimeout() throws InterruptedException {
            ServerMonitor.this.lock.lock();
            try {
                long awaitNanos = ServerMonitor.this.condition.awaitNanos(ServerMonitor.this.settings.getHeartbeatFrequency(TimeUnit.NANOSECONDS));
                ServerMonitor.this.lock.unlock();
                return awaitNanos;
            } catch (Throwable th) {
                ServerMonitor.this.lock.unlock();
                throw th;
            }
        }
    }

    public void connect() {
        this.lock.lock();
        try {
            this.condition.signal();
            this.lock.unlock();
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    public void close() {
        this.isClosed = true;
        this.monitorThread.interrupt();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public MongoOptions getOptions() {
        MongoOptions options = new MongoOptions();
        options.setConnectTimeout(this.socketSettings.getConnectTimeout(TimeUnit.MILLISECONDS));
        options.setSocketTimeout(this.socketSettings.getReadTimeout(TimeUnit.MILLISECONDS));
        options.setSocketFactory(this.socketSettings.getSocketFactory());
        return options;
    }

    static boolean descriptionHasChanged(ServerDescription previousServerDescription, ServerDescription currentServerDescription) {
        return !previousServerDescription.equals(currentServerDescription);
    }

    static boolean stateHasChanged(ServerDescription previousServerDescription, ServerDescription currentServerDescription) {
        return descriptionHasChanged(previousServerDescription, currentServerDescription) || previousServerDescription.getAverageLatencyNanos() != currentServerDescription.getAverageLatencyNanos();
    }

    static boolean exceptionHasChanged(Throwable previousException, Throwable currentException) {
        if (currentException == null) {
            return previousException != null;
        }
        if (previousException != null && currentException.getClass().equals(previousException.getClass())) {
            return currentException.getMessage() == null ? previousException.getMessage() != null : !currentException.getMessage().equals(previousException.getMessage());
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ServerDescription lookupServerDescription(DBPort connection) throws IOException {
        LOGGER.fine(String.format("Checking status of %s", this.serverAddress));
        long startNanoTime = System.nanoTime();
        CommandResult isMasterResult = connection.runCommand(this.mongo.getDB("admin"), new BasicDBObject("ismaster", 1));
        this.count++;
        this.elapsedNanosSum += System.nanoTime() - startNanoTime;
        CommandResult buildInfoResult = connection.runCommand(this.mongo.getDB("admin"), new BasicDBObject("buildinfo", 1));
        return createDescription(isMasterResult, buildInfoResult, this.elapsedNanosSum / this.count);
    }

    private ServerDescription createDescription(CommandResult commandResult, CommandResult buildInfoResult, long averageLatencyNanos) {
        return ServerDescription.builder().state(ServerConnectionState.Connected).version(getVersion(buildInfoResult)).address(commandResult.getServerUsed()).type(getServerType(commandResult)).hosts(listToSet((List) commandResult.get("hosts"))).passives(listToSet((List) commandResult.get("passives"))).arbiters(listToSet((List) commandResult.get("arbiters"))).primary(commandResult.getString("primary")).maxDocumentSize(commandResult.getInt("maxBsonObjectSize", ServerDescription.getDefaultMaxDocumentSize())).maxMessageSize(commandResult.getInt("maxMessageSizeBytes", ServerDescription.getDefaultMaxMessageSize())).maxWriteBatchSize(commandResult.getInt("maxWriteBatchSize", ServerDescription.getDefaultMaxWriteBatchSize())).tags(getTagsFromDocument((DBObject) commandResult.get("tags"))).setName(commandResult.getString("setName")).minWireVersion(commandResult.getInt("minWireVersion", ServerDescription.getDefaultMinWireVersion())).maxWireVersion(commandResult.getInt("maxWireVersion", ServerDescription.getDefaultMaxWireVersion())).averageLatency(averageLatencyNanos, TimeUnit.NANOSECONDS).ok(commandResult.ok()).build();
    }

    private static ServerVersion getVersion(CommandResult buildInfoResult) {
        return new ServerVersion(((List) buildInfoResult.get("versionArray")).subList(0, 3));
    }

    private Set<String> listToSet(List<String> list) {
        if (list == null || list.isEmpty()) {
            return Collections.emptySet();
        }
        return new HashSet(list);
    }

    private static ServerType getServerType(BasicDBObject isMasterResult) {
        if (isReplicaSetMember(isMasterResult)) {
            if (isMasterResult.getBoolean("ismaster", false)) {
                return ServerType.ReplicaSetPrimary;
            }
            if (isMasterResult.getBoolean("secondary", false)) {
                return ServerType.ReplicaSetSecondary;
            }
            if (isMasterResult.getBoolean("arbiterOnly", false)) {
                return ServerType.ReplicaSetArbiter;
            }
            if (isMasterResult.containsKey("setName") && isMasterResult.containsField("hosts")) {
                return ServerType.ReplicaSetOther;
            }
            return ServerType.ReplicaSetGhost;
        }
        if (isMasterResult.containsKey("msg") && isMasterResult.get("msg").equals("isdbgrid")) {
            return ServerType.ShardRouter;
        }
        return ServerType.StandAlone;
    }

    private static boolean isReplicaSetMember(BasicDBObject isMasterResult) {
        return isMasterResult.containsKey("setName") || isMasterResult.getBoolean("isreplicaset", false);
    }

    private static Tags getTagsFromDocument(DBObject tagsDocuments) {
        if (tagsDocuments == null) {
            return new Tags();
        }
        Tags tags = new Tags();
        for (String key : tagsDocuments.keySet()) {
            tags.put(key, tagsDocuments.get(key).toString());
        }
        return tags;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ServerDescription getConnectingServerDescription(Throwable throwable) {
        return ServerDescription.builder().type(ServerType.Unknown).state(ServerConnectionState.Connecting).address(this.serverAddress).exception(throwable).build();
    }
}
