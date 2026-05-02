package com.mongodb;

import com.mongodb.DBPort;
import com.mongodb.MongoAuthority;
import com.mongodb.MongoException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.bson.util.Assertions;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBTCPConnector.class */
public class DBTCPConnector implements DBConnector {
    private static final AtomicInteger NEXT_CLUSTER_ID = new AtomicInteger(1);
    private volatile boolean _closed;
    private final Mongo _mongo;
    private Cluster cluster;
    private final ClusterConnectionMode connectionMode;
    private MongosHAServerSelector mongosHAServerSelector;
    private final MyPort _myPort = new MyPort();
    private ClusterType type = ClusterType.Unknown;

    public DBTCPConnector(Mongo mongo) {
        this._mongo = mongo;
        this.connectionMode = (this._mongo.getAuthority().getType() == MongoAuthority.Type.Set || this._mongo.getMongoOptions().getRequiredReplicaSetName() != null) ? ClusterConnectionMode.Multiple : ClusterConnectionMode.Single;
    }

    public void start() {
        Assertions.isTrue("open", !this._closed);
        MongoOptions options = this._mongo.getMongoOptions();
        String clusterId = Integer.toString(NEXT_CLUSTER_ID.getAndIncrement());
        this.cluster = Clusters.create(clusterId, ClusterSettings.builder().hosts(this._mongo.getAuthority().getServerAddresses()).mode(this.connectionMode).requiredReplicaSetName(this._mongo.getMongoOptions().getRequiredReplicaSetName()).build(), ServerSettings.builder().heartbeatFrequency(options.heartbeatFrequencyMS, TimeUnit.MILLISECONDS).heartbeatConnectRetryFrequency(options.heartbeatConnectRetryFrequencyMS, TimeUnit.MILLISECONDS).heartbeatSocketSettings(SocketSettings.builder().connectTimeout(options.heartbeatConnectTimeoutMS, TimeUnit.MILLISECONDS).readTimeout(options.heartbeatReadTimeoutMS, TimeUnit.MILLISECONDS).socketFactory(this._mongo.getMongoOptions().getSocketFactory()).build()).build(), null, this._mongo);
    }

    @Override // com.mongodb.DBConnector
    public void requestStart() {
        Assertions.isTrue("open", !this._closed);
        this._myPort.requestStart();
    }

    @Override // com.mongodb.DBConnector
    public void requestDone() {
        this._myPort.requestDone();
    }

    @Override // com.mongodb.DBConnector
    public void requestEnsureConnection() {
        Assertions.isTrue("open", !this._closed);
        this._myPort.requestEnsureConnection();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public WriteResult _checkWriteError(DB db, DBPort port, WriteConcern concern) throws IOException {
        CommandResult e = port.runCommand(db, concern.getCommand());
        e.throwOnError();
        return new WriteResult(e, concern);
    }

    @Override // com.mongodb.DBConnector
    public WriteResult say(DB db, OutMessage m, WriteConcern concern) {
        Assertions.isTrue("open", !this._closed);
        return say(db, m, concern, (ServerAddress) null);
    }

    @Override // com.mongodb.DBConnector
    public WriteResult say(DB db, OutMessage m, WriteConcern concern, ServerAddress hostNeeded) {
        Assertions.isTrue("open", !this._closed);
        DBPort port = this._myPort.get(true, ReadPreference.primary(), hostNeeded);
        try {
            WriteResult say = say(db, m, concern, port);
            this._myPort.done(port);
            return say;
        } catch (Throwable th) {
            this._myPort.done(port);
            throw th;
        }
    }

    WriteResult say(final DB db, final OutMessage m, final WriteConcern concern, final DBPort port) {
        Assertions.isTrue("open", !this._closed);
        if (concern == null) {
            throw new IllegalArgumentException("Write concern is null");
        }
        try {
            try {
                WriteResult writeResult = (WriteResult) doOperation(db, port, new DBPort.Operation<WriteResult>() { // from class: com.mongodb.DBTCPConnector.1
                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // com.mongodb.DBPort.Operation
                    public WriteResult execute() throws IOException {
                        port.say(m);
                        if (concern.callGetLastError()) {
                            return DBTCPConnector.this._checkWriteError(db, port, concern);
                        }
                        return new WriteResult(db, port, concern);
                    }
                });
                m.doneWithMessage();
                return writeResult;
            } catch (MongoException.Network e) {
                if (concern.raiseNetworkErrors()) {
                    throw e;
                }
                CommandResult res = new CommandResult(port.serverAddress());
                res.put("ok", (Object) false);
                res.put("$err", (Object) "NETWORK ERROR");
                WriteResult writeResult2 = new WriteResult(res, concern);
                m.doneWithMessage();
                return writeResult2;
            }
        } catch (Throwable th) {
            m.doneWithMessage();
            throw th;
        }
    }

    <T> T doOperation(DB db, DBPort dBPort, DBPort.Operation<T> operation) {
        try {
            dBPort.checkAuth(db.getMongo());
            return (T) dBPort.doOperation(operation);
        } catch (MongoException e) {
            throw e;
        } catch (IOException e2) {
            this._myPort.error(dBPort, e2);
            throw new MongoException.Network("Operation on server " + dBPort.getAddress() + " failed", e2);
        } catch (RuntimeException e3) {
            this._myPort.error(dBPort, e3);
            throw e3;
        }
    }

    @Override // com.mongodb.DBConnector
    public Response call(DB db, DBCollection coll, OutMessage m, ServerAddress hostNeeded, DBDecoder decoder) {
        Assertions.isTrue("open", !this._closed);
        return call(db, coll, m, hostNeeded, 2, null, decoder);
    }

    @Override // com.mongodb.DBConnector
    public Response call(DB db, DBCollection coll, OutMessage m, ServerAddress hostNeeded, int retries) {
        Assertions.isTrue("open", !this._closed);
        return call(db, coll, m, hostNeeded, retries, null, null);
    }

    @Override // com.mongodb.DBConnector
    public Response call(DB db, DBCollection coll, OutMessage m, ServerAddress hostNeeded, int retries, ReadPreference readPref, DBDecoder decoder) {
        Assertions.isTrue("open", !this._closed);
        try {
            Response innerCall = innerCall(db, coll, m, hostNeeded, retries, readPref, decoder);
            m.doneWithMessage();
            return innerCall;
        } catch (Throwable th) {
            m.doneWithMessage();
            throw th;
        }
    }

    private Response innerCall(DB db, DBCollection coll, OutMessage m, ServerAddress hostNeeded, int remainingRetries, ReadPreference readPref, DBDecoder decoder) {
        if (readPref == null) {
            readPref = ReadPreference.primary();
        }
        if (readPref == ReadPreference.primary() && m.hasOption(4)) {
            readPref = ReadPreference.secondaryPreferred();
        }
        DBPort port = this._myPort.get(false, readPref, hostNeeded);
        Response res = null;
        boolean retry = false;
        try {
            try {
                port.checkAuth(db.getMongo());
                res = port.call(m, coll, decoder);
            } catch (IOException ioe) {
                this._myPort.error(port, ioe);
                retry = shouldRetryQuery(readPref, coll, ioe, remainingRetries);
                if (!retry) {
                    throw new MongoException.Network("Read operation to server " + port.host() + " failed on database " + db, ioe);
                }
                this._myPort.done(port);
            } catch (RuntimeException re) {
                this._myPort.error(port, re);
                throw re;
            }
            if (res._responseTo != m.getId()) {
                throw new MongoException("ids don't match");
            }
            this._myPort.done(port);
            if (retry) {
                return innerCall(db, coll, m, hostNeeded, remainingRetries - 1, readPref, decoder);
            }
            ServerError err = res.getError();
            if (err != null && err.isNotMasterError()) {
                if (remainingRetries <= 0) {
                    throw new MongoException("not talking to master and retries used up");
                }
                return innerCall(db, coll, m, hostNeeded, remainingRetries - 1, readPref, decoder);
            }
            return res;
        } catch (Throwable th) {
            this._myPort.done(port);
            throw th;
        }
    }

    public ServerAddress getAddress() {
        Assertions.isTrue("open", !this._closed);
        ClusterDescription clusterDescription = getClusterDescription();
        if (this.connectionMode == ClusterConnectionMode.Single) {
            return clusterDescription.getAny().get(0).getAddress();
        }
        if (clusterDescription.getPrimaries().isEmpty()) {
            return null;
        }
        return clusterDescription.getPrimaries().get(0).getAddress();
    }

    public List<ServerAddress> getAllAddress() {
        Assertions.isTrue("open", !this._closed);
        return this._mongo._authority.getServerAddresses();
    }

    public List<ServerAddress> getServerAddressList() {
        Assertions.isTrue("open", !this._closed);
        List<ServerAddress> serverAddressList = new ArrayList<>();
        ClusterDescription clusterDescription = getClusterDescription();
        for (ServerDescription serverDescription : clusterDescription.getAll()) {
            serverAddressList.add(serverDescription.getAddress());
        }
        return serverAddressList;
    }

    public ReplicaSetStatus getReplicaSetStatus() {
        Assertions.isTrue("open", !this._closed);
        if (getType() == ClusterType.ReplicaSet && this.connectionMode == ClusterConnectionMode.Multiple) {
            return new ReplicaSetStatus(getClusterDescription());
        }
        return null;
    }

    boolean isMongosConnection() {
        Assertions.isTrue("open", !this._closed);
        return getType() == ClusterType.Sharded;
    }

    public String getConnectPoint() {
        Assertions.isTrue("open", !this._closed);
        ServerAddress master = getAddress();
        if (master != null) {
            return master.toString();
        }
        return null;
    }

    private boolean shouldRetryQuery(ReadPreference readPreference, DBCollection coll, IOException ioe, int remainingRetries) {
        return (remainingRetries == 0 || coll._name.equals(MongoNamespace.COMMAND_COLLECTION_NAME) || (ioe instanceof SocketTimeoutException) || readPreference.equals(ReadPreference.primary()) || this.connectionMode != ClusterConnectionMode.Multiple || getType() != ClusterType.ReplicaSet) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ClusterDescription getClusterDescription() {
        return this.cluster.getDescription(getClusterWaitTimeMS(), TimeUnit.MILLISECONDS);
    }

    private int getClusterWaitTimeMS() {
        return Math.min(this._mongo.getMongoOptions().maxWaitTime, this._mongo.getMongoOptions().connectTimeout);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getConnectionWaitTimeMS() {
        return this._mongo.getMongoOptions().maxWaitTime;
    }

    DBPort getPrimaryPort() {
        Assertions.isTrue("open", !this._closed);
        return this._myPort.get(true, ReadPreference.primary(), null);
    }

    void releasePort(DBPort port) {
        this._myPort.done(port);
    }

    ServerDescription getServerDescription(ServerAddress address) {
        Assertions.isTrue("open", !this._closed);
        return getClusterDescription().getByServerAddress(address);
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBTCPConnector$MyPort.class */
    class MyPort {
        private final ThreadLocal<PinnedRequestStatus> pinnedRequestStatusThreadLocal = new ThreadLocal<>();

        MyPort() {
        }

        DBPort get(boolean keep, ReadPreference readPref, ServerAddress hostNeeded) {
            DBPort pinnedRequestPort = getPinnedRequestPortForThread();
            if (hostNeeded != null) {
                if (pinnedRequestPort != null && pinnedRequestPort.serverAddress().equals(hostNeeded)) {
                    return pinnedRequestPort;
                }
                return getConnection(new ServerAddressSelector(hostNeeded));
            }
            if (pinnedRequestPort != null) {
                if (portIsAPrimary(pinnedRequestPort) || !keep) {
                    return pinnedRequestPort;
                }
                pinnedRequestPort.getProvider().release(pinnedRequestPort);
                setPinnedRequestPortForThread(null);
            }
            DBPort port = getConnection(DBTCPConnector.this.createServerSelector(readPref));
            if (threadHasPinnedRequest()) {
                setPinnedRequestPortForThread(port);
            }
            return port;
        }

        private boolean portIsAPrimary(DBPort pinnedRequestPort) {
            for (ServerDescription cur : DBTCPConnector.this.getClusterDescription().getPrimaries()) {
                if (cur.getAddress().equals(pinnedRequestPort.serverAddress())) {
                    return true;
                }
            }
            return false;
        }

        void done(DBPort port) {
            Connection requestPort = getPinnedRequestPortForThread();
            if (port != requestPort) {
                port.getProvider().release(port);
            }
        }

        void error(DBPort port, Exception e) {
            if (!(e instanceof InterruptedIOException)) {
                DBTCPConnector.this.getServer(new ServerAddressSelector(port.getAddress())).invalidate();
            }
            port.close();
            this.pinnedRequestStatusThreadLocal.remove();
        }

        void requestEnsureConnection() {
            if (!threadHasPinnedRequest() || getPinnedRequestPortForThread() != null) {
                return;
            }
            setPinnedRequestPortForThread(getConnection(DBTCPConnector.this.createServerSelector(ReadPreference.primary())));
        }

        private DBPort getConnection(ServerSelector serverSelector) {
            return (DBPort) DBTCPConnector.this.getServer(serverSelector).getConnection(DBTCPConnector.this.getConnectionWaitTimeMS(), TimeUnit.MILLISECONDS);
        }

        void requestStart() {
            PinnedRequestStatus current = getPinnedRequestStatusForThread();
            if (current == null) {
                this.pinnedRequestStatusThreadLocal.set(new PinnedRequestStatus());
            } else {
                current.nestedBindings++;
            }
        }

        void requestDone() {
            PinnedRequestStatus current = getPinnedRequestStatusForThread();
            if (current != null) {
                if (current.nestedBindings > 0) {
                    current.nestedBindings--;
                    return;
                }
                this.pinnedRequestStatusThreadLocal.remove();
                if (current.requestPort != null) {
                    current.requestPort.getProvider().release(current.requestPort);
                }
            }
        }

        PinnedRequestStatus getPinnedRequestStatusForThread() {
            return this.pinnedRequestStatusThreadLocal.get();
        }

        boolean threadHasPinnedRequest() {
            return this.pinnedRequestStatusThreadLocal.get() != null;
        }

        DBPort getPinnedRequestPortForThread() {
            if (threadHasPinnedRequest()) {
                return this.pinnedRequestStatusThreadLocal.get().requestPort;
            }
            return null;
        }

        void setPinnedRequestPortForThread(DBPort port) {
            this.pinnedRequestStatusThreadLocal.get().requestPort = port;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ServerSelector createServerSelector(ReadPreference readPreference) {
        if (this.connectionMode == ClusterConnectionMode.Multiple) {
            List<ServerSelector> serverSelectorList = new ArrayList<>();
            if (getType() == ClusterType.Sharded) {
                serverSelectorList.add(getMongosHAServerSelector());
            } else if (getType() == ClusterType.ReplicaSet) {
                serverSelectorList.add(new ReadPreferenceServerSelector(readPreference));
            } else {
                serverSelectorList.add(new AnyServerSelector());
            }
            serverSelectorList.add(new LatencyMinimizingServerSelector(this._mongo.getMongoOptions().acceptableLatencyDifferenceMS, TimeUnit.MILLISECONDS));
            return new CompositeServerSelector(serverSelectorList);
        }
        return new AnyServerSelector();
    }

    private synchronized ClusterType getType() {
        if (this.type == ClusterType.Unknown) {
            this.type = getClusterDescription().getType();
        }
        return this.type;
    }

    private synchronized MongosHAServerSelector getMongosHAServerSelector() {
        if (this.mongosHAServerSelector == null) {
            this.mongosHAServerSelector = new MongosHAServerSelector();
        }
        return this.mongosHAServerSelector;
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBTCPConnector$PinnedRequestStatus.class */
    static class PinnedRequestStatus {
        DBPort requestPort;
        public int nestedBindings;

        PinnedRequestStatus() {
        }
    }

    public String debugString() {
        return getClusterDescription().getShortDescription();
    }

    public void close() {
        this._closed = true;
        if (this.cluster != null) {
            this.cluster.close();
            this.cluster = null;
        }
    }

    public void updatePortPool(ServerAddress addr) {
    }

    public DBPortPool getDBPortPool(ServerAddress addr) {
        throw new UnsupportedOperationException();
    }

    @Override // com.mongodb.DBConnector
    public boolean isOpen() {
        return !this._closed;
    }

    @Override // com.mongodb.DBConnector
    public CommandResult authenticate(MongoCredential credentials) {
        DBPort port = this._myPort.get(false, ReadPreference.primaryPreferred(), null);
        try {
            CommandResult result = port.authenticate(this._mongo, credentials);
            this._mongo.getAuthority().getCredentialsStore().add(credentials);
            this._myPort.done(port);
            return result;
        } catch (Throwable th) {
            this._myPort.done(port);
            throw th;
        }
    }

    public int getMaxBsonObjectSize() {
        ClusterDescription clusterDescription = getClusterDescription();
        if (clusterDescription.getPrimaries().isEmpty()) {
            return 4194304;
        }
        return clusterDescription.getPrimaries().get(0).getMaxDocumentSize();
    }

    MyPort getMyPort() {
        return this._myPort;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Server getServer(ServerSelector serverSelector) {
        return this.cluster.getServer(serverSelector, getClusterWaitTimeMS(), TimeUnit.MILLISECONDS);
    }
}
