.class public Lcom/mongodb/DBPort;
.super Ljava/lang/Object;
.source "DBPort.java"

# interfaces
.implements Lcom/mongodb/Connection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBPort$Operation;,
        Lcom/mongodb/DBPort$Authenticator;,
        Lcom/mongodb/DBPort$NativeAuthenticator;,
        Lcom/mongodb/DBPort$X509Authenticator;,
        Lcom/mongodb/DBPort$SaslAuthenticator;,
        Lcom/mongodb/DBPort$GSSAPIAuthenticator;,
        Lcom/mongodb/DBPort$PlainAuthenticator;,
        Lcom/mongodb/DBPort$ActiveState;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final CONN_RETRY_TIME_MS:J = 0x3a98L

.field public static final PORT:I = 0x6989

.field static final USE_NAGLE:Z

.field private static _rootLogger:Ljava/util/logging/Logger;


# instance fields
.field private volatile _activeState:Lcom/mongodb/DBPort$ActiveState;

.field private final _addr:Lcom/mongodb/ServerAddress;

.field private final _decoder:Lcom/mongodb/DBDecoder;

.field private volatile _in:Ljava/io/InputStream;

.field private final _logger:Ljava/util/logging/Logger;

.field private final _options:Lcom/mongodb/MongoOptions;

.field private volatile _out:Ljava/io/OutputStream;

.field private final _sa:Lcom/mongodb/ServerAddress;

.field private volatile _socket:Ljava/net/Socket;

.field private final authenticatedDatabases:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile closed:Z

.field private final generation:I

.field private volatile lastUsedAt:J

.field private final openedAt:J

.field private final provider:Lcom/mongodb/PooledConnectionProvider;

.field private volatile usageCount:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 399
    const-string v0, "com.mongodb.port"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/DBPort;->_rootLogger:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;)V
    .registers 5
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 77
    const/4 v0, 0x0

    new-instance v1, Lcom/mongodb/MongoOptions;

    invoke-direct {v1}, Lcom/mongodb/MongoOptions;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/mongodb/DBPort;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/MongoOptions;I)V

    .line 78
    return-void
.end method

.method constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/MongoOptions;I)V
    .registers 8
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .param p2, "pool"    # Lcom/mongodb/PooledConnectionProvider;
    .param p3, "options"    # Lcom/mongodb/MongoOptions;
    .param p4, "generation"    # I

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 418
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/DBPort;->authenticatedDatabases:Ljava/util/Set;

    .line 81
    iput-object p3, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    .line 82
    iput-object p1, p0, Lcom/mongodb/DBPort;->_sa:Lcom/mongodb/ServerAddress;

    .line 83
    iput-object p1, p0, Lcom/mongodb/DBPort;->_addr:Lcom/mongodb/ServerAddress;

    .line 84
    iput-object p2, p0, Lcom/mongodb/DBPort;->provider:Lcom/mongodb/PooledConnectionProvider;

    .line 85
    iput p4, p0, Lcom/mongodb/DBPort;->generation:I

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/mongodb/DBPort;->_rootLogger:Ljava/util/logging/Logger;

    invoke-virtual {v2}, Ljava/util/logging/Logger;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/DBPort;->_logger:Ljava/util/logging/Logger;

    .line 89
    :try_start_3f
    invoke-virtual {p0}, Lcom/mongodb/DBPort;->ensureOpen()V

    .line 90
    iget-object v1, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    iget-object v1, v1, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    invoke-interface {v1}, Lcom/mongodb/DBDecoderFactory;->create()Lcom/mongodb/DBDecoder;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/DBPort;->_decoder:Lcom/mongodb/DBDecoder;

    .line 91
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/mongodb/DBPort;->openedAt:J

    .line 92
    iget-wide v1, p0, Lcom/mongodb/DBPort;->openedAt:J

    iput-wide v1, p0, Lcom/mongodb/DBPort;->lastUsedAt:J
    :try_end_56
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_56} :catch_57

    .line 96
    return-void

    .line 93
    :catch_57
    move-exception v0

    .line 94
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/mongodb/MongoException$Network;

    const-string v2, "Exception opening the socket"

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v1
.end method

.method static synthetic access$000(Lcom/mongodb/DBPort;)Ljava/io/OutputStream;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBPort;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mongodb/DBPort;->_out:Ljava/io/OutputStream;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mongodb/DBPort;)Lcom/mongodb/ServerAddress;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBPort;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mongodb/DBPort;->_sa:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/DBPort;)Ljava/io/InputStream;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBPort;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mongodb/DBPort;->_in:Ljava/io/InputStream;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/DBPort;)Lcom/mongodb/DBDecoder;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBPort;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mongodb/DBPort;->_decoder:Lcom/mongodb/DBDecoder;

    return-object v0
.end method

.method private convertToCommandResult(Lcom/mongodb/DBObject;Lcom/mongodb/Response;)Lcom/mongodb/CommandResult;
    .registers 8
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "res"    # Lcom/mongodb/Response;

    .prologue
    .line 202
    invoke-virtual {p2}, Lcom/mongodb/Response;->size()I

    move-result v2

    if-nez v2, :cond_8

    .line 203
    const/4 v0, 0x0

    .line 213
    :goto_7
    return-object v0

    .line 204
    :cond_8
    invoke-virtual {p2}, Lcom/mongodb/Response;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_2c

    .line 205
    new-instance v2, Lcom/mongodb/MongoInternalException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "something is wrong.  size:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/mongodb/Response;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 207
    :cond_2c
    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Lcom/mongodb/Response;->get(I)Lcom/mongodb/DBObject;

    move-result-object v1

    .line 208
    .local v1, "data":Lcom/mongodb/DBObject;
    if-nez v1, :cond_3b

    .line 209
    new-instance v2, Lcom/mongodb/MongoInternalException;

    const-string v3, "something is wrong, no command result"

    invoke-direct {v2, v3}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 211
    :cond_3b
    new-instance v0, Lcom/mongodb/CommandResult;

    invoke-virtual {p2}, Lcom/mongodb/Response;->serverUsed()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 212
    .local v0, "cr":Lcom/mongodb/CommandResult;
    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->putAll(Lorg/bson/BSONObject;)V

    goto :goto_7
.end method

.method private declared-synchronized findOne(Lcom/mongodb/DB;Ljava/lang/String;Lcom/mongodb/DBObject;)Lcom/mongodb/Response;
    .registers 12
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "coll"    # Ljava/lang/String;
    .param p3, "q"    # Lcom/mongodb/DBObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    monitor-enter p0

    :try_start_1
    invoke-virtual {p1, p2}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v5, 0x0

    const/high16 v6, 0x400000

    move-object v4, p3

    invoke-static/range {v0 .. v6}, Lcom/mongodb/OutMessage;->query(Lcom/mongodb/DBCollection;IIILcom/mongodb/DBObject;Lcom/mongodb/DBObject;I)Lcom/mongodb/OutMessage;
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_23

    move-result-object v7

    .line 189
    .local v7, "msg":Lcom/mongodb/OutMessage;
    :try_start_10
    invoke-virtual {p1, p2}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v7, v0, v1}, Lcom/mongodb/DBPort;->call(Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_1e

    move-result-object v0

    .line 191
    :try_start_19
    invoke-virtual {v7}, Lcom/mongodb/OutMessage;->doneWithMessage()V
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_23

    monitor-exit p0

    return-object v0

    :catchall_1e
    move-exception v0

    :try_start_1f
    invoke-virtual {v7}, Lcom/mongodb/OutMessage;->doneWithMessage()V

    throw v0
    :try_end_23
    .catchall {:try_start_1f .. :try_end_23} :catchall_23

    .line 187
    .end local v7    # "msg":Lcom/mongodb/OutMessage;
    :catchall_23
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method authenticate(Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;
    .registers 8
    .param p1, "mongo"    # Lcom/mongodb/Mongo;
    .param p2, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 353
    invoke-virtual {p2}, Lcom/mongodb/MongoCredential;->getMechanism()Ljava/lang/String;

    move-result-object v2

    const-string v3, "MONGODB-CR"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 354
    new-instance v0, Lcom/mongodb/DBPort$NativeAuthenticator;

    invoke-direct {v0, p0, p1, p2}, Lcom/mongodb/DBPort$NativeAuthenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .line 364
    .local v0, "authenticator":Lcom/mongodb/DBPort$Authenticator;
    :goto_11
    invoke-virtual {v0}, Lcom/mongodb/DBPort$Authenticator;->authenticate()Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 365
    .local v1, "res":Lcom/mongodb/CommandResult;
    iget-object v2, p0, Lcom/mongodb/DBPort;->authenticatedDatabases:Ljava/util/Set;

    invoke-virtual {p2}, Lcom/mongodb/MongoCredential;->getSource()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 366
    return-object v1

    .line 355
    .end local v0    # "authenticator":Lcom/mongodb/DBPort$Authenticator;
    .end local v1    # "res":Lcom/mongodb/CommandResult;
    :cond_1f
    invoke-virtual {p2}, Lcom/mongodb/MongoCredential;->getMechanism()Ljava/lang/String;

    move-result-object v2

    const-string v3, "GSSAPI"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 356
    new-instance v0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;

    invoke-direct {v0, p0, p1, p2}, Lcom/mongodb/DBPort$GSSAPIAuthenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .restart local v0    # "authenticator":Lcom/mongodb/DBPort$Authenticator;
    goto :goto_11

    .line 357
    .end local v0    # "authenticator":Lcom/mongodb/DBPort$Authenticator;
    :cond_31
    invoke-virtual {p2}, Lcom/mongodb/MongoCredential;->getMechanism()Ljava/lang/String;

    move-result-object v2

    const-string v3, "PLAIN"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_43

    .line 358
    new-instance v0, Lcom/mongodb/DBPort$PlainAuthenticator;

    invoke-direct {v0, p0, p1, p2}, Lcom/mongodb/DBPort$PlainAuthenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .restart local v0    # "authenticator":Lcom/mongodb/DBPort$Authenticator;
    goto :goto_11

    .line 359
    .end local v0    # "authenticator":Lcom/mongodb/DBPort$Authenticator;
    :cond_43
    invoke-virtual {p2}, Lcom/mongodb/MongoCredential;->getMechanism()Ljava/lang/String;

    move-result-object v2

    const-string v3, "MONGODB-X509"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    .line 360
    new-instance v0, Lcom/mongodb/DBPort$X509Authenticator;

    invoke-direct {v0, p0, p1, p2}, Lcom/mongodb/DBPort$X509Authenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .restart local v0    # "authenticator":Lcom/mongodb/DBPort$Authenticator;
    goto :goto_11

    .line 362
    .end local v0    # "authenticator":Lcom/mongodb/DBPort$Authenticator;
    :cond_55
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsupported authentication protocol: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/mongodb/MongoCredential;->getMechanism()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method call(Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;)Lcom/mongodb/Response;
    .registers 5
    .param p1, "msg"    # Lcom/mongodb/OutMessage;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 130
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBPort;->call(Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v0

    return-object v0

    .line 129
    :cond_10
    const/4 v0, 0x0

    goto :goto_7
.end method

.method call(Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
    .registers 6
    .param p1, "msg"    # Lcom/mongodb/OutMessage;
    .param p2, "coll"    # Lcom/mongodb/DBCollection;
    .param p3, "decoder"    # Lcom/mongodb/DBDecoder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_16

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 135
    new-instance v0, Lcom/mongodb/DBPort$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/mongodb/DBPort$1;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;Lcom/mongodb/DBCollection;Lcom/mongodb/DBDecoder;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DBPort;->doOperation(Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/Response;

    return-object v0

    .line 134
    :cond_16
    const/4 v0, 0x0

    goto :goto_7
.end method

.method checkAuth(Lcom/mongodb/Mongo;)V
    .registers 6
    .param p1, "mongo"    # Lcom/mongodb/Mongo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 371
    new-instance v2, Ljava/util/HashSet;

    invoke-virtual {p1}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/MongoAuthority;->getCredentialsStore()Lcom/mongodb/MongoCredentialsStore;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/MongoCredentialsStore;->getDatabases()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 372
    .local v2, "unauthenticatedDatabases":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/mongodb/DBPort;->authenticatedDatabases:Ljava/util/Set;

    invoke-interface {v2, v3}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 374
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 375
    .local v0, "databaseName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/mongodb/Mongo;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/MongoAuthority;->getCredentialsStore()Lcom/mongodb/MongoCredentialsStore;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/mongodb/MongoCredentialsStore;->get(Ljava/lang/String;)Lcom/mongodb/MongoCredential;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lcom/mongodb/DBPort;->authenticate(Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;

    goto :goto_1a

    .line 377
    .end local v0    # "databaseName":Ljava/lang/String;
    :cond_36
    return-void
.end method

.method public close()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 334
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    .line 335
    iget-object v0, p0, Lcom/mongodb/DBPort;->authenticatedDatabases:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 337
    iget-object v0, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    if-eqz v0, :cond_12

    .line 339
    :try_start_d
    iget-object v0, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_12} :catch_19

    .line 346
    :cond_12
    :goto_12
    iput-object v1, p0, Lcom/mongodb/DBPort;->_in:Ljava/io/InputStream;

    .line 347
    iput-object v1, p0, Lcom/mongodb/DBPort;->_out:Ljava/io/OutputStream;

    .line 348
    iput-object v1, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    .line 349
    return-void

    .line 341
    :catch_19
    move-exception v0

    goto :goto_12
.end method

.method declared-synchronized doOperation(Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/mongodb/DBPort$Operation",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    .local p1, "operation":Lcom/mongodb/DBPort$Operation;, "Lcom/mongodb/DBPort$Operation<TT;>;"
    monitor-enter p0

    :try_start_1
    const-string v2, "open"

    iget-boolean v1, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v1, :cond_21

    const/4 v1, 0x1

    :goto_8
    invoke-static {v2, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 161
    iget-wide v1, p0, Lcom/mongodb/DBPort;->usageCount:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/mongodb/DBPort;->usageCount:J
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_33

    .line 164
    :try_start_12
    invoke-interface {p1}, Lcom/mongodb/DBPort$Operation;->execute()Ljava/lang/Object;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_15} :catch_23
    .catchall {:try_start_12 .. :try_end_15} :catchall_28

    move-result-object v1

    .line 171
    :try_start_16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mongodb/DBPort;->lastUsedAt:J

    .line 172
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mongodb/DBPort;->_activeState:Lcom/mongodb/DBPort$ActiveState;
    :try_end_1f
    .catchall {:try_start_16 .. :try_end_1f} :catchall_33

    monitor-exit p0

    return-object v1

    .line 160
    :cond_21
    const/4 v1, 0x0

    goto :goto_8

    .line 166
    :catch_23
    move-exception v0

    .line 167
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_24
    invoke-virtual {p0}, Lcom/mongodb/DBPort;->close()V

    .line 168
    throw v0
    :try_end_28
    .catchall {:try_start_24 .. :try_end_28} :catchall_28

    .line 171
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_28
    move-exception v1

    :try_start_29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/mongodb/DBPort;->lastUsedAt:J

    .line 172
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mongodb/DBPort;->_activeState:Lcom/mongodb/DBPort$ActiveState;

    throw v1
    :try_end_33
    .catchall {:try_start_29 .. :try_end_33} :catchall_33

    .line 160
    :catchall_33
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized ensureOpen()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 240
    monitor-enter p0

    :try_start_1
    iget-object v10, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_7f

    if-eqz v10, :cond_7

    .line 284
    :goto_5
    monitor-exit p0

    return-void

    .line 243
    :cond_7
    const-wide/16 v3, 0x64

    .line 245
    .local v3, "sleepTime":J
    const-wide/16 v1, 0x3a98

    .line 246
    .local v1, "maxAutoConnectRetryTime":J
    :try_start_b
    iget-object v10, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    iget-wide v10, v10, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-lez v10, :cond_19

    .line 247
    iget-object v10, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    iget-wide v1, v10, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    .line 250
    :cond_19
    const/4 v7, 0x0

    .line 251
    .local v7, "successfullyConnected":Z
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_1d
    .catchall {:try_start_b .. :try_end_1d} :catchall_7f

    move-result-wide v5

    .line 254
    .local v5, "start":J
    :cond_1e
    :try_start_1e
    iget-object v10, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    iget-object v10, v10, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v10}, Ljavax/net/SocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v10

    iput-object v10, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    .line 255
    iget-object v10, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    iget-object v11, p0, Lcom/mongodb/DBPort;->_addr:Lcom/mongodb/ServerAddress;

    invoke-virtual {v11}, Lcom/mongodb/ServerAddress;->getSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v11

    iget-object v12, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    iget v12, v12, Lcom/mongodb/MongoOptions;->connectTimeout:I

    invoke-virtual {v10, v11, v12}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 257
    iget-object v10, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 258
    iget-object v10, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    iget-object v11, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    iget-boolean v11, v11, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    invoke-virtual {v10, v11}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 259
    iget-object v10, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    iget-object v11, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    iget v11, v11, Lcom/mongodb/MongoOptions;->socketTimeout:I

    invoke-virtual {v10, v11}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 260
    new-instance v10, Ljava/io/BufferedInputStream;

    iget-object v11, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    invoke-virtual {v11}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v10, p0, Lcom/mongodb/DBPort;->_in:Ljava/io/InputStream;

    .line 261
    iget-object v10, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    iput-object v10, p0, Lcom/mongodb/DBPort;->_out:Ljava/io/OutputStream;
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_64} :catch_68
    .catchall {:try_start_1e .. :try_end_64} :catchall_7f

    .line 262
    const/4 v7, 0x1

    .line 283
    :goto_65
    if-eqz v7, :cond_1e

    goto :goto_5

    .line 264
    :catch_68
    move-exception v0

    .line 265
    .local v0, "e":Ljava/io/IOException;
    :try_start_69
    invoke-virtual {p0}, Lcom/mongodb/DBPort;->close()V

    .line 267
    iget-object v10, p0, Lcom/mongodb/DBPort;->_options:Lcom/mongodb/MongoOptions;

    iget-boolean v10, v10, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    if-eqz v10, :cond_7e

    iget-object v10, p0, Lcom/mongodb/DBPort;->provider:Lcom/mongodb/PooledConnectionProvider;

    if-eqz v10, :cond_82

    iget-object v10, p0, Lcom/mongodb/DBPort;->provider:Lcom/mongodb/PooledConnectionProvider;

    invoke-virtual {v10}, Lcom/mongodb/PooledConnectionProvider;->hasWorked()Z

    move-result v10

    if-nez v10, :cond_82

    .line 268
    :cond_7e
    throw v0
    :try_end_7f
    .catchall {:try_start_69 .. :try_end_7f} :catchall_7f

    .line 240
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "maxAutoConnectRetryTime":J
    .end local v3    # "sleepTime":J
    .end local v5    # "start":J
    .end local v7    # "successfullyConnected":Z
    :catchall_7f
    move-exception v10

    monitor-exit p0

    throw v10

    .line 270
    .restart local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "maxAutoConnectRetryTime":J
    .restart local v3    # "sleepTime":J
    .restart local v5    # "start":J
    .restart local v7    # "successfullyConnected":Z
    :cond_82
    :try_start_82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long v8, v10, v5

    .line 272
    .local v8, "waitSoFar":J
    cmp-long v10, v8, v1

    if-ltz v10, :cond_8d

    .line 273
    throw v0

    .line 275
    :cond_8d
    add-long v10, v3, v8

    cmp-long v10, v10, v1

    if-lez v10, :cond_95

    .line 276
    sub-long v3, v1, v8

    .line 278
    :cond_95
    iget-object v10, p0, Lcom/mongodb/DBPort;->_logger:Ljava/util/logging/Logger;

    sget-object v11, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Exception connecting to "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {p0}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v13

    invoke-virtual {v13}, Lcom/mongodb/ServerAddress;->getHost()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ": "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ".  Total wait time so far is "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " ms.  Will retry after sleeping for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " ms."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 280
    invoke-static {v3, v4}, Lcom/mongodb/util/ThreadUtil;->sleep(J)V
    :try_end_de
    .catchall {:try_start_82 .. :try_end_de} :catchall_7f

    .line 281
    const-wide/16 v10, 0x2

    mul-long/2addr v3, v10

    goto :goto_65
.end method

.method getActiveState()Lcom/mongodb/DBPort$ActiveState;
    .registers 3

    .prologue
    .line 312
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_d

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 313
    iget-object v0, p0, Lcom/mongodb/DBPort;->_activeState:Lcom/mongodb/DBPort$ActiveState;

    return-object v0

    .line 312
    :cond_d
    const/4 v0, 0x0

    goto :goto_7
.end method

.method getAddress()Lcom/mongodb/ServerAddress;
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lcom/mongodb/DBPort;->_addr:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method getAuthenticatedDatabases()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 396
    iget-object v0, p0, Lcom/mongodb/DBPort;->authenticatedDatabases:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getGeneration()I
    .registers 2

    .prologue
    .line 105
    iget v0, p0, Lcom/mongodb/DBPort;->generation:I

    return v0
.end method

.method getInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_d

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 231
    iget-object v0, p0, Lcom/mongodb/DBPort;->_in:Ljava/io/InputStream;

    return-object v0

    .line 230
    :cond_d
    const/4 v0, 0x0

    goto :goto_7
.end method

.method declared-synchronized getLastError(Lcom/mongodb/DB;Lcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;
    .registers 5
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    monitor-enter p0

    :try_start_1
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_8
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 183
    invoke-virtual {p2}, Lcom/mongodb/WriteConcern;->getCommand()Lcom/mongodb/BasicDBObject;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_17

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 182
    :cond_15
    const/4 v0, 0x0

    goto :goto_8

    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getLastUsedAt()J
    .registers 3

    .prologue
    .line 125
    iget-wide v0, p0, Lcom/mongodb/DBPort;->lastUsedAt:J

    return-wide v0
.end method

.method getLocalPort()I
    .registers 3

    .prologue
    .line 317
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 318
    iget-object v0, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/mongodb/DBPort;->_socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalPort()I

    move-result v0

    :goto_14
    return v0

    .line 317
    :cond_15
    const/4 v0, 0x0

    goto :goto_7

    .line 318
    :cond_17
    const/4 v0, -0x1

    goto :goto_14
.end method

.method public getOpenedAt()J
    .registers 3

    .prologue
    .line 115
    iget-wide v0, p0, Lcom/mongodb/DBPort;->openedAt:J

    return-wide v0
.end method

.method getOutputStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 225
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_d

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 226
    iget-object v0, p0, Lcom/mongodb/DBPort;->_out:Ljava/io/OutputStream;

    return-object v0

    .line 225
    :cond_d
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getPool()Lcom/mongodb/DBPortPool;
    .registers 2

    .prologue
    .line 384
    const/4 v0, 0x0

    return-object v0
.end method

.method getProvider()Lcom/mongodb/PooledConnectionProvider;
    .registers 2

    .prologue
    .line 392
    iget-object v0, p0, Lcom/mongodb/DBPort;->provider:Lcom/mongodb/PooledConnectionProvider;

    return-object v0
.end method

.method public getUsageCount()J
    .registers 3

    .prologue
    .line 388
    iget-wide v0, p0, Lcom/mongodb/DBPort;->usageCount:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 288
    iget-object v0, p0, Lcom/mongodb/DBPort;->_addr:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->hashCode()I

    move-result v0

    return v0
.end method

.method public host()Ljava/lang/String;
    .registers 2

    .prologue
    .line 296
    iget-object v0, p0, Lcom/mongodb/DBPort;->_addr:Lcom/mongodb/ServerAddress;

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isClosed()Z
    .registers 2

    .prologue
    .line 327
    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    return v0
.end method

.method declared-synchronized runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;
    .registers 6
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "cmd"    # Lcom/mongodb/DBObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    monitor-enter p0

    :try_start_1
    const-string v2, "open"

    iget-boolean v1, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v1, :cond_17

    const/4 v1, 0x1

    :goto_8
    invoke-static {v2, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 197
    const-string v1, "$cmd"

    invoke-direct {p0, p1, v1, p2}, Lcom/mongodb/DBPort;->findOne(Lcom/mongodb/DB;Ljava/lang/String;Lcom/mongodb/DBObject;)Lcom/mongodb/Response;

    move-result-object v0

    .line 198
    .local v0, "res":Lcom/mongodb/Response;
    invoke-direct {p0, p2, v0}, Lcom/mongodb/DBPort;->convertToCommandResult(Lcom/mongodb/DBObject;Lcom/mongodb/Response;)Lcom/mongodb/CommandResult;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_19

    move-result-object v1

    monitor-exit p0

    return-object v1

    .line 196
    .end local v0    # "res":Lcom/mongodb/Response;
    :cond_17
    const/4 v1, 0x0

    goto :goto_8

    :catchall_19
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method say(Lcom/mongodb/OutMessage;)V
    .registers 4
    .param p1, "msg"    # Lcom/mongodb/OutMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_13

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 148
    new-instance v0, Lcom/mongodb/DBPort$2;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/DBPort$2;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/OutMessage;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DBPort;->doOperation(Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;

    .line 157
    return-void

    .line 147
    :cond_13
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public serverAddress()Lcom/mongodb/ServerAddress;
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/mongodb/DBPort;->_sa:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method setActiveState(Lcom/mongodb/DBPort$ActiveState;)V
    .registers 4
    .param p1, "activeState"    # Lcom/mongodb/DBPort$ActiveState;

    .prologue
    .line 177
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_d

    const/4 v0, 0x1

    :goto_7
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 178
    iput-object p1, p0, Lcom/mongodb/DBPort;->_activeState:Lcom/mongodb/DBPort$ActiveState;

    .line 179
    return-void

    .line 177
    :cond_d
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 308
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{DBPort  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/DBPort;->host()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method declared-synchronized tryGetLastError(Lcom/mongodb/DB;JLcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;
    .registers 7
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "last"    # J
    .param p4, "concern"    # Lcom/mongodb/WriteConcern;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    monitor-enter p0

    :try_start_1
    const-string v1, "open"

    iget-boolean v0, p0, Lcom/mongodb/DBPort;->closed:Z

    if-nez v0, :cond_14

    const/4 v0, 0x1

    :goto_8
    invoke-static {v1, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 218
    iget-wide v0, p0, Lcom/mongodb/DBPort;->usageCount:J
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_1b

    cmp-long v0, p2, v0

    if-eqz v0, :cond_16

    .line 219
    const/4 v0, 0x0

    .line 221
    :goto_12
    monitor-exit p0

    return-object v0

    .line 217
    :cond_14
    const/4 v0, 0x0

    goto :goto_8

    .line 221
    :cond_16
    :try_start_16
    invoke-virtual {p0, p1, p4}, Lcom/mongodb/DBPort;->getLastError(Lcom/mongodb/DB;Lcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;
    :try_end_19
    .catchall {:try_start_16 .. :try_end_19} :catchall_1b

    move-result-object v0

    goto :goto_12

    .line 217
    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method
