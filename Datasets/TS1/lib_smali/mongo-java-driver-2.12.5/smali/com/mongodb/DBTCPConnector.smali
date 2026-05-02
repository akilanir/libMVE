.class public Lcom/mongodb/DBTCPConnector;
.super Ljava/lang/Object;
.source "DBTCPConnector.java"

# interfaces
.implements Lcom/mongodb/DBConnector;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;,
        Lcom/mongodb/DBTCPConnector$MyPort;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final NEXT_CLUSTER_ID:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private volatile _closed:Z

.field private final _mongo:Lcom/mongodb/Mongo;

.field private final _myPort:Lcom/mongodb/DBTCPConnector$MyPort;

.field private cluster:Lcom/mongodb/Cluster;

.field private final connectionMode:Lcom/mongodb/ClusterConnectionMode;

.field private mongosHAServerSelector:Lcom/mongodb/MongosHAServerSelector;

.field private type:Lcom/mongodb/ClusterType;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/mongodb/DBTCPConnector;->NEXT_CLUSTER_ID:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>(Lcom/mongodb/Mongo;)V
    .registers 4
    .param p1, "mongo"    # Lcom/mongodb/Mongo;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-direct {v0, p0}, Lcom/mongodb/DBTCPConnector$MyPort;-><init>(Lcom/mongodb/DBTCPConnector;)V

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    .line 53
    sget-object v0, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->type:Lcom/mongodb/ClusterType;

    .line 61
    iput-object p1, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    .line 62
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MongoAuthority;->getType()Lcom/mongodb/MongoAuthority$Type;

    move-result-object v0

    sget-object v1, Lcom/mongodb/MongoAuthority$Type;->Set:Lcom/mongodb/MongoAuthority$Type;

    if-eq v0, v1, :cond_2a

    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MongoOptions;->getRequiredReplicaSetName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2f

    :cond_2a
    sget-object v0, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    :goto_2c
    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    .line 64
    return-void

    .line 62
    :cond_2f
    sget-object v0, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    goto :goto_2c
.end method

.method private _checkWriteError(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .registers 6
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "port"    # Lcom/mongodb/DBPort;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-virtual {p3}, Lcom/mongodb/WriteConcern;->getCommand()Lcom/mongodb/BasicDBObject;

    move-result-object v1

    invoke-virtual {p2, p1, v1}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 134
    .local v0, "e":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 135
    new-instance v1, Lcom/mongodb/WriteResult;

    invoke-direct {v1, v0, p3}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V

    return-object v1
.end method

.method static synthetic access$000(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .registers 5
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;
    .param p1, "x1"    # Lcom/mongodb/DB;
    .param p2, "x2"    # Lcom/mongodb/DBPort;
    .param p3, "x3"    # Lcom/mongodb/WriteConcern;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBTCPConnector;->_checkWriteError(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;
    .param p1, "x1"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/mongodb/DBTCPConnector;->createServerSelector(Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/DBTCPConnector;)Lcom/mongodb/ClusterDescription;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;
    .param p1, "x1"    # Lcom/mongodb/ServerSelector;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/mongodb/DBTCPConnector;->getServer(Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/mongodb/DBTCPConnector;)I
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBTCPConnector;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getConnectionWaitTimeMS()I

    move-result v0

    return v0
.end method

.method private createServerSelector(Lcom/mongodb/ReadPreference;)Lcom/mongodb/ServerSelector;
    .registers 7
    .param p1, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 546
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    sget-object v2, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v1, v2, :cond_4d

    .line 547
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 548
    .local v0, "serverSelectorList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterType;->Sharded:Lcom/mongodb/ClusterType;

    if-ne v1, v2, :cond_33

    .line 549
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getMongosHAServerSelector()Lcom/mongodb/MongosHAServerSelector;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 555
    :goto_1a
    new-instance v1, Lcom/mongodb/LatencyMinimizingServerSelector;

    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v2

    iget v2, v2, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-direct {v1, v2, v3, v4}, Lcom/mongodb/LatencyMinimizingServerSelector;-><init>(JLjava/util/concurrent/TimeUnit;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 557
    new-instance v1, Lcom/mongodb/CompositeServerSelector;

    invoke-direct {v1, v0}, Lcom/mongodb/CompositeServerSelector;-><init>(Ljava/util/List;)V

    .line 559
    .end local v0    # "serverSelectorList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    :goto_32
    return-object v1

    .line 550
    .restart local v0    # "serverSelectorList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    :cond_33
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    if-ne v1, v2, :cond_44

    .line 551
    new-instance v1, Lcom/mongodb/ReadPreferenceServerSelector;

    invoke-direct {v1, p1}, Lcom/mongodb/ReadPreferenceServerSelector;-><init>(Lcom/mongodb/ReadPreference;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 553
    :cond_44
    new-instance v1, Lcom/mongodb/AnyServerSelector;

    invoke-direct {v1}, Lcom/mongodb/AnyServerSelector;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 559
    .end local v0    # "serverSelectorList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerSelector;>;"
    :cond_4d
    new-instance v1, Lcom/mongodb/AnyServerSelector;

    invoke-direct {v1}, Lcom/mongodb/AnyServerSelector;-><init>()V

    goto :goto_32
.end method

.method private getClusterDescription()Lcom/mongodb/ClusterDescription;
    .registers 5

    .prologue
    .line 393
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterWaitTimeMS()I

    move-result v1

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3}, Lcom/mongodb/Cluster;->getDescription(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ClusterDescription;

    move-result-object v0

    return-object v0
.end method

.method private getClusterWaitTimeMS()I
    .registers 3

    .prologue
    .line 397
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v0

    iget v0, v0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v1}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v1

    iget v1, v1, Lcom/mongodb/MongoOptions;->connectTimeout:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method private getConnectionWaitTimeMS()I
    .registers 2

    .prologue
    .line 401
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v0

    iget v0, v0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    return v0
.end method

.method private declared-synchronized getMongosHAServerSelector()Lcom/mongodb/MongosHAServerSelector;
    .registers 2

    .prologue
    .line 572
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->mongosHAServerSelector:Lcom/mongodb/MongosHAServerSelector;

    if-nez v0, :cond_c

    .line 573
    new-instance v0, Lcom/mongodb/MongosHAServerSelector;

    invoke-direct {v0}, Lcom/mongodb/MongosHAServerSelector;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->mongosHAServerSelector:Lcom/mongodb/MongosHAServerSelector;

    .line 575
    :cond_c
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->mongosHAServerSelector:Lcom/mongodb/MongosHAServerSelector;
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-object v0

    .line 572
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getServer(Lcom/mongodb/ServerSelector;)Lcom/mongodb/Server;
    .registers 6
    .param p1, "serverSelector"    # Lcom/mongodb/ServerSelector;

    .prologue
    .line 650
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterWaitTimeMS()I

    move-result v1

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p1, v1, v2, v3}, Lcom/mongodb/Cluster;->getServer(Lcom/mongodb/ServerSelector;JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Server;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized getType()Lcom/mongodb/ClusterType;
    .registers 3

    .prologue
    .line 564
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->type:Lcom/mongodb/ClusterType;

    sget-object v1, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    if-ne v0, v1, :cond_11

    .line 565
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getType()Lcom/mongodb/ClusterType;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->type:Lcom/mongodb/ClusterType;

    .line 567
    :cond_11
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->type:Lcom/mongodb/ClusterType;
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_15

    monitor-exit p0

    return-object v0

    .line 564
    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private innerCall(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    .registers 26
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "m"    # Lcom/mongodb/OutMessage;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;
    .param p5, "remainingRetries"    # I
    .param p6, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p7, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    .line 277
    if-nez p6, :cond_6

    .line 278
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object p6

    .line 280
    :cond_6
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v4

    move-object/from16 v0, p6

    if-ne v0, v4, :cond_1b

    const/4 v4, 0x4

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lcom/mongodb/OutMessage;->hasOption(I)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 281
    invoke-static {}, Lcom/mongodb/ReadPreference;->secondaryPreferred()Lcom/mongodb/ReadPreference;

    move-result-object p6

    .line 283
    :cond_1b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    const/4 v5, 0x0

    move-object/from16 v0, p6

    move-object/from16 v1, p4

    invoke-virtual {v4, v5, v0, v1}, Lcom/mongodb/DBTCPConnector$MyPort;->get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;

    move-result-object v14

    .line 285
    .local v14, "port":Lcom/mongodb/DBPort;
    const/16 v16, 0x0

    .line 286
    .local v16, "res":Lcom/mongodb/Response;
    const/16 v17, 0x0

    .line 288
    .local v17, "retry":Z
    :try_start_2c
    invoke-virtual/range {p1 .. p1}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v4

    invoke-virtual {v14, v4}, Lcom/mongodb/DBPort;->checkAuth(Lcom/mongodb/Mongo;)V

    .line 289
    move-object/from16 v0, p3

    move-object/from16 v1, p2

    move-object/from16 v2, p7

    invoke-virtual {v14, v0, v1, v2}, Lcom/mongodb/DBPort;->call(Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v16

    .line 290
    move-object/from16 v0, v16

    iget v4, v0, Lcom/mongodb/Response;->_responseTo:I

    invoke-virtual/range {p3 .. p3}, Lcom/mongodb/OutMessage;->getId()I

    move-result v5

    if-eq v4, v5, :cond_97

    .line 291
    new-instance v4, Lcom/mongodb/MongoException;

    const-string v5, "ids don\'t match"

    invoke-direct {v4, v5}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_4f} :catch_4f
    .catch Ljava/lang/RuntimeException; {:try_start_2c .. :try_end_4f} :catch_bd
    .catchall {:try_start_2c .. :try_end_4f} :catchall_8e

    .line 293
    :catch_4f
    move-exception v13

    .line 294
    .local v13, "ioe":Ljava/io/IOException;
    :try_start_50
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v4, v14, v13}, Lcom/mongodb/DBTCPConnector$MyPort;->error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V

    .line 295
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    move-object/from16 v2, p2

    move/from16 v3, p5

    invoke-direct {v0, v1, v2, v13, v3}, Lcom/mongodb/DBTCPConnector;->shouldRetryQuery(Lcom/mongodb/ReadPreference;Lcom/mongodb/DBCollection;Ljava/io/IOException;I)Z

    move-result v17

    .line 296
    if-nez v17, :cond_b5

    .line 297
    new-instance v4, Lcom/mongodb/MongoException$Network;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Read operation to server "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v14}, Lcom/mongodb/DBPort;->host()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " failed on database "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v13}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v4
    :try_end_8e
    .catchall {:try_start_50 .. :try_end_8e} :catchall_8e

    .line 304
    .end local v13    # "ioe":Ljava/io/IOException;
    :catchall_8e
    move-exception v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v5, v14}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    throw v4

    :cond_97
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v4, v14}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    .line 307
    :goto_9e
    if-eqz v17, :cond_c6

    .line 308
    add-int/lit8 v9, p5, -0x1

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v4 .. v11}, Lcom/mongodb/DBTCPConnector;->innerCall(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v16

    .line 319
    .end local v16    # "res":Lcom/mongodb/Response;
    :cond_b4
    :goto_b4
    return-object v16

    .line 304
    .restart local v13    # "ioe":Ljava/io/IOException;
    .restart local v16    # "res":Lcom/mongodb/Response;
    :cond_b5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v4, v14}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    goto :goto_9e

    .line 300
    .end local v13    # "ioe":Ljava/io/IOException;
    :catch_bd
    move-exception v15

    .line 301
    .local v15, "re":Ljava/lang/RuntimeException;
    :try_start_be
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v4, v14, v15}, Lcom/mongodb/DBTCPConnector$MyPort;->error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V

    .line 302
    throw v15
    :try_end_c6
    .catchall {:try_start_be .. :try_end_c6} :catchall_8e

    .line 310
    .end local v15    # "re":Ljava/lang/RuntimeException;
    :cond_c6
    invoke-virtual/range {v16 .. v16}, Lcom/mongodb/Response;->getError()Lcom/mongodb/ServerError;

    move-result-object v12

    .line 312
    .local v12, "err":Lcom/mongodb/ServerError;
    if-eqz v12, :cond_b4

    invoke-virtual {v12}, Lcom/mongodb/ServerError;->isNotMasterError()Z

    move-result v4

    if-eqz v4, :cond_b4

    .line 313
    if-gtz p5, :cond_dc

    .line 314
    new-instance v4, Lcom/mongodb/MongoException;

    const-string v5, "not talking to master and retries used up"

    invoke-direct {v4, v5}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 316
    :cond_dc
    add-int/lit8 v9, p5, -0x1

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v4 .. v11}, Lcom/mongodb/DBTCPConnector;->innerCall(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v16

    goto :goto_b4
.end method

.method private shouldRetryQuery(Lcom/mongodb/ReadPreference;Lcom/mongodb/DBCollection;Ljava/io/IOException;I)Z
    .registers 8
    .param p1, "readPreference"    # Lcom/mongodb/ReadPreference;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "ioe"    # Ljava/io/IOException;
    .param p4, "remainingRetries"    # I

    .prologue
    const/4 v0, 0x0

    .line 377
    if-nez p4, :cond_4

    .line 389
    :cond_3
    :goto_3
    return v0

    .line 380
    :cond_4
    iget-object v1, p2, Lcom/mongodb/DBCollection;->_name:Ljava/lang/String;

    const-string v2, "$cmd"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 383
    instance-of v1, p3, Ljava/net/SocketTimeoutException;

    if-nez v1, :cond_3

    .line 386
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 389
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    sget-object v2, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v1, v2, :cond_3

    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v1

    sget-object v2, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    if-ne v1, v2, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method


# virtual methods
.method public authenticate(Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;
    .registers 8
    .param p1, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 620
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    const/4 v3, 0x0

    invoke-static {}, Lcom/mongodb/ReadPreference;->primaryPreferred()Lcom/mongodb/ReadPreference;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/mongodb/DBTCPConnector$MyPort;->get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;

    move-result-object v0

    .line 623
    .local v0, "port":Lcom/mongodb/DBPort;
    :try_start_c
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v0, v2, p1}, Lcom/mongodb/DBPort;->authenticate(Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 624
    .local v1, "result":Lcom/mongodb/CommandResult;
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/MongoAuthority;->getCredentialsStore()Lcom/mongodb/MongoCredentialsStore;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/mongodb/MongoCredentialsStore;->add(Lcom/mongodb/MongoCredential;)V
    :try_end_1f
    .catchall {:try_start_c .. :try_end_1f} :catchall_25

    .line 627
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    return-object v1

    .end local v1    # "result":Lcom/mongodb/CommandResult;
    :catchall_25
    move-exception v2

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v3, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    throw v2
.end method

.method public call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;I)Lcom/mongodb/Response;
    .registers 14
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "m"    # Lcom/mongodb/OutMessage;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;
    .param p5, "retries"    # I

    .prologue
    const/4 v6, 0x0

    .line 248
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_17

    const/4 v0, 0x1

    :goto_8
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object v7, v6

    .line 249
    invoke-virtual/range {v0 .. v7}, Lcom/mongodb/DBTCPConnector;->call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v0

    return-object v0

    .line 248
    :cond_17
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    .registers 10
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "m"    # Lcom/mongodb/OutMessage;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;
    .param p5, "retries"    # I
    .param p6, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p7, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    .line 266
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 268
    :try_start_a
    invoke-direct/range {p0 .. p7}, Lcom/mongodb/DBTCPConnector;->innerCall(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_14

    move-result-object v0

    .line 270
    invoke-virtual {p3}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    return-object v0

    .line 266
    :cond_12
    const/4 v0, 0x0

    goto :goto_7

    .line 270
    :catchall_14
    move-exception v0

    invoke-virtual {p3}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    throw v0
.end method

.method public call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    .registers 14
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "m"    # Lcom/mongodb/OutMessage;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;
    .param p5, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    .line 233
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_17

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 234
    const/4 v5, 0x2

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/mongodb/DBTCPConnector;->call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v0

    return-object v0

    .line 233
    :cond_17
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public close()V
    .registers 2

    .prologue
    .line 589
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    .line 590
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    if-eqz v0, :cond_f

    .line 591
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    invoke-interface {v0}, Lcom/mongodb/Cluster;->close()V

    .line 592
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    .line 594
    :cond_f
    return-void
.end method

.method public debugString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 585
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getShortDescription()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;
    .registers 9
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/mongodb/DB;",
            "Lcom/mongodb/DBPort;",
            "Lcom/mongodb/DBPort$Operation",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 206
    .local p3, "operation":Lcom/mongodb/DBPort$Operation;, "Lcom/mongodb/DBPort$Operation<TT;>;"
    :try_start_0
    invoke-virtual {p1}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/mongodb/DBPort;->checkAuth(Lcom/mongodb/Mongo;)V

    .line 207
    invoke-virtual {p2, p3}, Lcom/mongodb/DBPort;->doOperation(Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;
    :try_end_a
    .catch Lcom/mongodb/MongoException; {:try_start_0 .. :try_end_a} :catch_c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_a} :catch_e
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_a} :catch_37

    move-result-object v2

    return-object v2

    .line 209
    :catch_c
    move-exception v1

    .line 210
    .local v1, "re":Lcom/mongodb/MongoException;
    throw v1

    .line 212
    .end local v1    # "re":Lcom/mongodb/MongoException;
    :catch_e
    move-exception v0

    .line 213
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, p2, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V

    .line 214
    new-instance v2, Lcom/mongodb/MongoException$Network;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Operation on server "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " failed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v2

    .line 216
    .end local v0    # "ioe":Ljava/io/IOException;
    :catch_37
    move-exception v1

    .line 217
    .local v1, "re":Ljava/lang/RuntimeException;
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, p2, v1}, Lcom/mongodb/DBTCPConnector$MyPort;->error(Lcom/mongodb/DBPort;Ljava/lang/Exception;)V

    .line 218
    throw v1
.end method

.method public getAddress()Lcom/mongodb/ServerAddress;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 323
    const-string v3, "open"

    iget-boolean v1, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v1, :cond_24

    const/4 v1, 0x1

    :goto_8
    invoke-static {v3, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 324
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    .line 325
    .local v0, "clusterDescription":Lcom/mongodb/ClusterDescription;
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    sget-object v3, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    if-ne v1, v3, :cond_26

    .line 326
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getAny()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    .line 331
    :goto_23
    return-object v1

    .end local v0    # "clusterDescription":Lcom/mongodb/ClusterDescription;
    :cond_24
    move v1, v2

    .line 323
    goto :goto_8

    .line 328
    .restart local v0    # "clusterDescription":Lcom/mongodb/ClusterDescription;
    :cond_26
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 329
    const/4 v1, 0x0

    goto :goto_23

    .line 331
    :cond_32
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    goto :goto_23
.end method

.method public getAllAddress()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 339
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 340
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    iget-object v0, v0, Lcom/mongodb/Mongo;->_authority:Lcom/mongodb/MongoAuthority;

    invoke-virtual {v0}, Lcom/mongodb/MongoAuthority;->getServerAddresses()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 339
    :cond_13
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getConnectPoint()Ljava/lang/String;
    .registers 4

    .prologue
    .line 371
    const-string v2, "open"

    iget-boolean v1, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v1, :cond_15

    const/4 v1, 0x1

    :goto_7
    invoke-static {v2, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 372
    invoke-virtual {p0}, Lcom/mongodb/DBTCPConnector;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    .line 373
    .local v0, "master":Lcom/mongodb/ServerAddress;
    if-eqz v0, :cond_17

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_14
    return-object v1

    .line 371
    .end local v0    # "master":Lcom/mongodb/ServerAddress;
    :cond_15
    const/4 v1, 0x0

    goto :goto_7

    .line 373
    .restart local v0    # "master":Lcom/mongodb/ServerAddress;
    :cond_17
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public getDBPortPool(Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPortPool;
    .registers 3
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 611
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getMaxBsonObjectSize()I
    .registers 4

    .prologue
    .line 637
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    .line 638
    .local v0, "clusterDescription":Lcom/mongodb/ClusterDescription;
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 639
    const/high16 v1, 0x400000

    .line 641
    :goto_10
    return v1

    :cond_11
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ServerDescription;

    invoke-virtual {v1}, Lcom/mongodb/ServerDescription;->getMaxDocumentSize()I

    move-result v1

    goto :goto_10
.end method

.method getMyPort()Lcom/mongodb/DBTCPConnector$MyPort;
    .registers 2

    .prologue
    .line 646
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    return-object v0
.end method

.method getPrimaryPort()Lcom/mongodb/DBPort;
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 405
    const-string v2, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_17

    move v0, v1

    :goto_8
    invoke-static {v2, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 406
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/mongodb/DBTCPConnector$MyPort;->get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;

    move-result-object v0

    return-object v0

    .line 405
    :cond_17
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getReplicaSetStatus()Lcom/mongodb/ReplicaSetStatus;
    .registers 3

    .prologue
    .line 360
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_22

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 361
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    if-ne v0, v1, :cond_24

    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    sget-object v1, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    if-ne v0, v1, :cond_24

    new-instance v0, Lcom/mongodb/ReplicaSetStatus;

    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/ReplicaSetStatus;-><init>(Lcom/mongodb/ClusterDescription;)V

    :goto_21
    return-object v0

    .line 360
    :cond_22
    const/4 v0, 0x0

    goto :goto_7

    .line 361
    :cond_24
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public getServerAddressList()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 350
    const-string v5, "open"

    iget-boolean v4, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v4, :cond_2f

    const/4 v4, 0x1

    :goto_7
    invoke-static {v5, v4}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 351
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 352
    .local v2, "serverAddressList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    .line 353
    .local v0, "clusterDescription":Lcom/mongodb/ClusterDescription;
    invoke-virtual {v0}, Lcom/mongodb/ClusterDescription;->getAll()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_31

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/ServerDescription;

    .line 354
    .local v3, "serverDescription":Lcom/mongodb/ServerDescription;
    invoke-virtual {v3}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1b

    .line 350
    .end local v0    # "clusterDescription":Lcom/mongodb/ClusterDescription;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "serverAddressList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    .end local v3    # "serverDescription":Lcom/mongodb/ServerDescription;
    :cond_2f
    const/4 v4, 0x0

    goto :goto_7

    .line 356
    .restart local v0    # "clusterDescription":Lcom/mongodb/ClusterDescription;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "serverAddressList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    :cond_31
    return-object v2
.end method

.method getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;
    .registers 4
    .param p1, "address"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 414
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 415
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getClusterDescription()Lcom/mongodb/ClusterDescription;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/ClusterDescription;->getByServerAddress(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    return-object v0

    .line 414
    :cond_13
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isMongosConnection()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 366
    const-string v3, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_15

    move v0, v1

    :goto_9
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 367
    invoke-direct {p0}, Lcom/mongodb/DBTCPConnector;->getType()Lcom/mongodb/ClusterType;

    move-result-object v0

    sget-object v3, Lcom/mongodb/ClusterType;->Sharded:Lcom/mongodb/ClusterType;

    if-ne v0, v3, :cond_17

    :goto_14
    return v1

    :cond_15
    move v0, v2

    .line 366
    goto :goto_9

    :cond_17
    move v1, v2

    .line 367
    goto :goto_14
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 615
    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method releasePort(Lcom/mongodb/DBPort;)V
    .registers 3
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 410
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v0, p1}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    .line 411
    return-void
.end method

.method public requestDone()V
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector$MyPort;->requestDone()V

    .line 119
    return-void
.end method

.method public requestEnsureConnection()V
    .registers 3

    .prologue
    .line 126
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 127
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector$MyPort;->requestEnsureConnection()V

    .line 128
    return-void

    .line 126
    :cond_10
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public requestStart()V
    .registers 3

    .prologue
    .line 105
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 106
    iget-object v0, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector$MyPort;->requestStart()V

    .line 107
    return-void

    .line 105
    :cond_10
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .registers 6
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "m"    # Lcom/mongodb/OutMessage;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 147
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 148
    const/4 v0, 0x0

    check-cast v0, Lcom/mongodb/ServerAddress;

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0

    .line 147
    :cond_12
    const/4 v0, 0x0

    goto :goto_7
.end method

.method say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
    .registers 13
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "m"    # Lcom/mongodb/OutMessage;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .param p4, "port"    # Lcom/mongodb/DBPort;

    .prologue
    const/4 v0, 0x0

    .line 173
    const-string v1, "open"

    iget-boolean v2, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v2, :cond_8

    const/4 v0, 0x1

    :cond_8
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 175
    if-nez p3, :cond_15

    .line 176
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Write concern is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    :cond_15
    :try_start_15
    new-instance v0, Lcom/mongodb/DBTCPConnector$1;

    move-object v1, p0

    move-object v2, p4

    move-object v3, p2

    move-object v4, p3

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBTCPConnector$1;-><init>(Lcom/mongodb/DBTCPConnector;Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DB;)V

    invoke-virtual {p0, p1, p4, v0}, Lcom/mongodb/DBTCPConnector;->doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/WriteResult;
    :try_end_25
    .catch Lcom/mongodb/MongoException$Network; {:try_start_15 .. :try_end_25} :catch_29
    .catchall {:try_start_15 .. :try_end_25} :catchall_31

    .line 200
    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    :goto_28
    return-object v0

    .line 191
    :catch_29
    move-exception v6

    .line 192
    .local v6, "e":Lcom/mongodb/MongoException$Network;
    :try_start_2a
    invoke-virtual {p3}, Lcom/mongodb/WriteConcern;->raiseNetworkErrors()Z

    move-result v0

    if-eqz v0, :cond_36

    .line 193
    throw v6
    :try_end_31
    .catchall {:try_start_2a .. :try_end_31} :catchall_31

    .line 200
    .end local v6    # "e":Lcom/mongodb/MongoException$Network;
    :catchall_31
    move-exception v0

    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    throw v0

    .line 195
    .restart local v6    # "e":Lcom/mongodb/MongoException$Network;
    :cond_36
    :try_start_36
    new-instance v7, Lcom/mongodb/CommandResult;

    invoke-virtual {p4}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 196
    .local v7, "res":Lcom/mongodb/CommandResult;
    const-string v0, "ok"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    const-string v0, "$err"

    const-string v1, "NETWORK ERROR"

    invoke-virtual {v7, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    new-instance v0, Lcom/mongodb/WriteResult;

    invoke-direct {v0, v7, p3}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V
    :try_end_55
    .catchall {:try_start_36 .. :try_end_55} :catchall_31

    .line 200
    invoke-virtual {p2}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    goto :goto_28
.end method

.method public say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    .registers 9
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "m"    # Lcom/mongodb/OutMessage;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .param p4, "hostNeeded"    # Lcom/mongodb/ServerAddress;

    .prologue
    const/4 v2, 0x1

    .line 161
    const-string v3, "open"

    iget-boolean v1, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v1, :cond_1f

    move v1, v2

    :goto_8
    invoke-static {v3, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 162
    iget-object v1, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v3

    invoke-virtual {v1, v2, v3, p4}, Lcom/mongodb/DBTCPConnector$MyPort;->get(ZLcom/mongodb/ReadPreference;Lcom/mongodb/ServerAddress;)Lcom/mongodb/DBPort;

    move-result-object v0

    .line 165
    .local v0, "port":Lcom/mongodb/DBPort;
    :try_start_15
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_21

    move-result-object v1

    .line 168
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    return-object v1

    .line 161
    .end local v0    # "port":Lcom/mongodb/DBPort;
    :cond_1f
    const/4 v1, 0x0

    goto :goto_8

    .line 168
    .restart local v0    # "port":Lcom/mongodb/DBPort;
    :catchall_21
    move-exception v1

    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_myPort:Lcom/mongodb/DBTCPConnector$MyPort;

    invoke-virtual {v2, v0}, Lcom/mongodb/DBTCPConnector$MyPort;->done(Lcom/mongodb/DBPort;)V

    throw v1
.end method

.method public start()V
    .registers 8

    .prologue
    .line 67
    const-string v3, "open"

    iget-boolean v2, p0, Lcom/mongodb/DBTCPConnector;->_closed:Z

    if-nez v2, :cond_92

    const/4 v2, 0x1

    :goto_7
    invoke-static {v3, v2}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 69
    iget-object v2, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v1

    .line 71
    .local v1, "options":Lcom/mongodb/MongoOptions;
    sget-object v2, Lcom/mongodb/DBTCPConnector;->NEXT_CLUSTER_ID:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "clusterId":Ljava/lang/String;
    invoke-static {}, Lcom/mongodb/ClusterSettings;->builder()Lcom/mongodb/ClusterSettings$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v3}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/MongoAuthority;->getServerAddresses()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mongodb/ClusterSettings$Builder;->hosts(Ljava/util/List;)Lcom/mongodb/ClusterSettings$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    invoke-virtual {v2, v3}, Lcom/mongodb/ClusterSettings$Builder;->mode(Lcom/mongodb/ClusterConnectionMode;)Lcom/mongodb/ClusterSettings$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v3}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/MongoOptions;->getRequiredReplicaSetName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/mongodb/ClusterSettings$Builder;->requiredReplicaSetName(Ljava/lang/String;)Lcom/mongodb/ClusterSettings$Builder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ClusterSettings$Builder;->build()Lcom/mongodb/ClusterSettings;

    move-result-object v2

    invoke-static {}, Lcom/mongodb/ServerSettings;->builder()Lcom/mongodb/ServerSettings$Builder;

    move-result-object v3

    iget v4, v1, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Lcom/mongodb/ServerSettings$Builder;->heartbeatFrequency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ServerSettings$Builder;

    move-result-object v3

    iget v4, v1, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Lcom/mongodb/ServerSettings$Builder;->heartbeatConnectRetryFrequency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ServerSettings$Builder;

    move-result-object v3

    invoke-static {}, Lcom/mongodb/SocketSettings;->builder()Lcom/mongodb/SocketSettings$Builder;

    move-result-object v4

    iget v5, v1, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6}, Lcom/mongodb/SocketSettings$Builder;->connectTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/mongodb/SocketSettings$Builder;

    move-result-object v4

    iget v5, v1, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6}, Lcom/mongodb/SocketSettings$Builder;->readTimeout(ILjava/util/concurrent/TimeUnit;)Lcom/mongodb/SocketSettings$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v5}, Lcom/mongodb/Mongo;->getMongoOptions()Lcom/mongodb/MongoOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mongodb/MongoOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mongodb/SocketSettings$Builder;->socketFactory(Ljavax/net/SocketFactory;)Lcom/mongodb/SocketSettings$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mongodb/SocketSettings$Builder;->build()Lcom/mongodb/SocketSettings;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerSettings$Builder;->heartbeatSocketSettings(Lcom/mongodb/SocketSettings;)Lcom/mongodb/ServerSettings$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/ServerSettings$Builder;->build()Lcom/mongodb/ServerSettings;

    move-result-object v3

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/mongodb/DBTCPConnector;->_mongo:Lcom/mongodb/Mongo;

    invoke-static {v0, v2, v3, v4, v5}, Lcom/mongodb/Clusters;->create(Ljava/lang/String;Lcom/mongodb/ClusterSettings;Lcom/mongodb/ServerSettings;Lcom/mongodb/ClusterListener;Lcom/mongodb/Mongo;)Lcom/mongodb/Cluster;

    move-result-object v2

    iput-object v2, p0, Lcom/mongodb/DBTCPConnector;->cluster:Lcom/mongodb/Cluster;

    .line 90
    return-void

    .line 67
    .end local v0    # "clusterId":Ljava/lang/String;
    .end local v1    # "options":Lcom/mongodb/MongoOptions;
    :cond_92
    const/4 v2, 0x0

    goto/16 :goto_7
.end method

.method public updatePortPool(Lcom/mongodb/ServerAddress;)V
    .registers 2
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 603
    return-void
.end method
