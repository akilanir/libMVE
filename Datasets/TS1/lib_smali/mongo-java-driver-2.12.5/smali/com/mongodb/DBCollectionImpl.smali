.class Lcom/mongodb/DBCollectionImpl;
.super Lcom/mongodb/DBCollection;
.source "DBCollectionImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DBCollectionImpl$Run;,
        Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;,
        Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;
    }
.end annotation


# static fields
.field private static final QUERY_DOCUMENT_HEADROOM:I = 0x4000

.field private static final TRACE_LEVEL:Ljava/util/logging/Level;

.field private static final TRACE_LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private final db:Lcom/mongodb/DBApiLayer;

.field private final namespace:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 543
    const-string v0, "com.mongodb.TRACE"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LOGGER:Ljava/util/logging/Logger;

    .line 544
    const-string v0, "DB.TRACE"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    sget-object v0, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    :goto_12
    sput-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LEVEL:Ljava/util/logging/Level;

    return-void

    :cond_15
    sget-object v0, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    goto :goto_12
.end method

.method constructor <init>(Lcom/mongodb/DBApiLayer;Ljava/lang/String;)V
    .registers 5
    .param p1, "db"    # Lcom/mongodb/DBApiLayer;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Lcom/mongodb/DBCollection;-><init>(Lcom/mongodb/DB;Ljava/lang/String;)V

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/mongodb/DBApiLayer;->_root:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    .line 60
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    .line 61
    return-void
.end method

.method static synthetic access$100(Lcom/mongodb/DBCollectionImpl;)Lcom/mongodb/DBApiLayer;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .registers 6
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/mongodb/WriteConcern;
    .param p3, "x3"    # Lcom/mongodb/DBEncoder;
    .param p4, "x4"    # Lcom/mongodb/DBPort;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mongodb/DBCollectionImpl;->updateWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1900(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .registers 6
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/mongodb/WriteConcern;
    .param p3, "x3"    # Lcom/mongodb/DBEncoder;
    .param p4, "x4"    # Lcom/mongodb/DBPort;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mongodb/DBCollectionImpl;->removeWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/BaseWriteCommandMessage;ILcom/mongodb/DBPort;)Lcom/mongodb/BaseWriteCommandMessage;
    .registers 5
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Lcom/mongodb/BaseWriteCommandMessage;
    .param p2, "x2"    # I
    .param p3, "x3"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBCollectionImpl;->sendWriteCommandMessage(Lcom/mongodb/BaseWriteCommandMessage;ILcom/mongodb/DBPort;)Lcom/mongodb/BaseWriteCommandMessage;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2000(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;
    .registers 7
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/mongodb/WriteConcern;
    .param p3, "x3"    # Lcom/mongodb/DBEncoder;
    .param p4, "x4"    # Lcom/mongodb/DBPort;
    .param p5, "x5"    # Z

    .prologue
    .line 48
    invoke-direct/range {p0 .. p5}, Lcom/mongodb/DBCollectionImpl;->insertWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2100(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    .registers 4
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Lcom/mongodb/WriteConcern;
    .param p2, "x2"    # Lcom/mongodb/DBPort;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/mongodb/DBCollectionImpl;->useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;)Lcom/mongodb/CommandResult;
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl;->receiveWriteCommandMessage(Lcom/mongodb/DBPort;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/mongodb/DBCollectionImpl;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/mongodb/DBCollectionImpl;)Ljava/util/logging/Logger;
    .registers 2
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getLogger()Ljava/util/logging/Logger;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;)I
    .registers 3
    .param p0, "x0"    # Lcom/mongodb/DBCollectionImpl;
    .param p1, "x1"    # Lcom/mongodb/DBPort;

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl;->getMaxWriteBatchSize(Lcom/mongodb/DBPort;)I

    move-result v0

    return v0
.end method

.method private addBulkWriteResultToCommandResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)V
    .registers 9
    .param p1, "bulkWriteResult"    # Lcom/mongodb/BulkWriteResult;
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p3, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 321
    const-string v0, "ok"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    if-ne p2, v0, :cond_19

    .line 323
    const-string v0, "n"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    :cond_18
    :goto_18
    return-void

    .line 324
    :cond_19
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    if-ne p2, v0, :cond_2b

    .line 325
    const-string v0, "n"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getRemovedCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18

    .line 326
    :cond_2b
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    if-eq p2, v0, :cond_33

    sget-object v0, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    if-ne p2, v0, :cond_18

    .line 327
    :cond_33
    const-string v0, "n"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getMatchedCount()I

    move-result v1

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getUpserts()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getMatchedCount()I

    move-result v0

    if-lez v0, :cond_76

    .line 329
    const-string v0, "updatedExisting"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    :goto_58
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getUpserts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_18

    .line 334
    const-string v1, "upserted"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteResult;->getUpserts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BulkWriteUpsert;

    invoke-virtual {v0}, Lcom/mongodb/BulkWriteUpsert;->getId()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p3, v1, v0}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18

    .line 331
    :cond_76
    const-string v0, "updatedExisting"

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p3, v0, v1}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_58
.end method

.method private applyRulesForInsert(Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    const/4 v4, 0x0

    .line 393
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_5
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/DBObject;

    .line 394
    .local v2, "o":Lcom/mongodb/DBObject;
    invoke-virtual {p0, v2, v4, v4}, Lcom/mongodb/DBCollectionImpl;->_checkObject(Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    .line 395
    invoke-virtual {p0, v2}, Lcom/mongodb/DBCollectionImpl;->apply(Lcom/mongodb/DBObject;)Ljava/lang/Object;

    .line 396
    const-string v3, "_id"

    invoke-interface {v2, v3}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 397
    .local v1, "id":Ljava/lang/Object;
    instance-of v3, v1, Lorg/bson/types/ObjectId;

    if-eqz v3, :cond_5

    .line 398
    check-cast v1, Lorg/bson/types/ObjectId;

    .end local v1    # "id":Ljava/lang/Object;
    invoke-virtual {v1}, Lorg/bson/types/ObjectId;->notNew()V

    goto :goto_5

    .line 401
    .end local v2    # "o":Lcom/mongodb/DBObject;
    :cond_27
    return-void
.end method

.method private getLogger()Ljava/util/logging/Logger;
    .registers 2

    .prologue
    .line 555
    sget-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LOGGER:Ljava/util/logging/Logger;

    return-object v0
.end method

.method private getMaxWriteBatchSize(Lcom/mongodb/DBPort;)I
    .registers 4
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 472
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getMaxWriteBatchSize()I

    move-result v0

    return v0
.end method

.method private getMessageSettings(Lcom/mongodb/DBPort;)Lcom/mongodb/MessageSettings;
    .registers 5
    .param p1, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 463
    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    .line 464
    .local v0, "serverDescription":Lcom/mongodb/ServerDescription;
    invoke-static {}, Lcom/mongodb/MessageSettings;->builder()Lcom/mongodb/MessageSettings$Builder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getMaxDocumentSize()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mongodb/MessageSettings$Builder;->maxDocumentSize(I)Lcom/mongodb/MessageSettings$Builder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getMaxMessageSize()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mongodb/MessageSettings$Builder;->maxMessageSize(I)Lcom/mongodb/MessageSettings$Builder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getMaxWriteBatchSize()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mongodb/MessageSettings$Builder;->maxWriteBatchSize(I)Lcom/mongodb/MessageSettings$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/MessageSettings$Builder;->build()Lcom/mongodb/MessageSettings;

    move-result-object v1

    return-object v1
.end method

.method private getNamespace()Lcom/mongodb/MongoNamespace;
    .registers 4

    .prologue
    .line 476
    new-instance v0, Lcom/mongodb/MongoNamespace;

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getDB()Lcom/mongodb/DB;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/DB;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/MongoNamespace;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private getRunGenerator(ZLjava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Ljava/lang/Iterable;
    .registers 12
    .param p1, "ordered"    # Z
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p5, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/mongodb/DBCollectionImpl$Run;",
            ">;"
        }
    .end annotation

    .prologue
    .line 536
    .local p2, "writeRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/WriteRequest;>;"
    if-eqz p1, :cond_d

    .line 537
    new-instance v0, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl$OrderedRunGenerator;-><init>(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)V

    .line 539
    :goto_c
    return-object v0

    :cond_d
    new-instance v0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator;-><init>(Lcom/mongodb/DBCollectionImpl;Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)V

    goto :goto_c
.end method

.method private insertWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;
    .registers 13
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "port"    # Lcom/mongodb/DBPort;
    .param p5, "shouldApply"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            "Z)",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 382
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-eqz p5, :cond_5

    .line 383
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl;->applyRulesForInsert(Ljava/util/List;)V

    .line 386
    :cond_5
    new-instance v0, Lcom/mongodb/InsertCommandMessage;

    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    sget-object v2, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v2}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v4

    invoke-direct {p0, p4}, Lcom/mongodb/DBCollectionImpl;->getMessageSettings(Lcom/mongodb/DBPort;)Lcom/mongodb/MessageSettings;

    move-result-object v6

    move-object v2, p2

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/InsertCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 389
    .local v0, "message":Lcom/mongodb/BaseWriteCommandMessage;
    sget-object v1, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, p4, v1, v0, p2}, Lcom/mongodb/DBCollectionImpl;->writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;

    move-result-object v1

    return-object v1
.end method

.method private insertWithWriteProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/WriteResult;
    .registers 13
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "port"    # Lcom/mongodb/DBPort;
    .param p5, "shouldApply"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            "Z)",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation

    .prologue
    .line 505
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-eqz p5, :cond_5

    .line 506
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollectionImpl;->applyRulesForInsert(Ljava/util/List;)V

    .line 509
    :cond_5
    const/4 v1, 0x0

    .line 511
    .local v1, "last":Lcom/mongodb/WriteResult;
    const/4 v0, 0x0

    .line 512
    .local v0, "cur":I
    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    iget-object v5, v5, Lcom/mongodb/DBApiLayer;->_mongo:Lcom/mongodb/Mongo;

    invoke-virtual {v5}, Lcom/mongodb/Mongo;->getMaxBsonObjectSize()I

    move-result v2

    .line 513
    .local v2, "maxsize":I
    :goto_f
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_42

    .line 515
    invoke-static {p0, p3, p2}, Lcom/mongodb/OutMessage;->insert(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;Lcom/mongodb/WriteConcern;)Lcom/mongodb/OutMessage;

    move-result-object v4

    .line 517
    .local v4, "om":Lcom/mongodb/OutMessage;
    :goto_19
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_32

    .line 518
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mongodb/DBObject;

    .line 519
    .local v3, "o":Lcom/mongodb/DBObject;
    invoke-virtual {v4, v3}, Lcom/mongodb/OutMessage;->putObject(Lorg/bson/BSONObject;)I

    .line 522
    invoke-virtual {v4}, Lcom/mongodb/OutMessage;->size()I

    move-result v5

    mul-int/lit8 v6, v2, 0x2

    if-le v5, v6, :cond_3f

    .line 523
    add-int/lit8 v0, v0, 0x1

    .line 528
    .end local v3    # "o":Lcom/mongodb/DBObject;
    :cond_32
    iget-object v5, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v5}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v5

    iget-object v6, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    invoke-virtual {v5, v6, v4, p2, p4}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;

    move-result-object v1

    .line 529
    goto :goto_f

    .line 517
    .restart local v3    # "o":Lcom/mongodb/DBObject;
    :cond_3f
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 531
    .end local v3    # "o":Lcom/mongodb/DBObject;
    .end local v4    # "om":Lcom/mongodb/OutMessage;
    :cond_42
    return-object v1
.end method

.method private receiveWriteCommandMessage(Lcom/mongodb/DBPort;)Lcom/mongodb/CommandResult;
    .registers 8
    .param p1, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 495
    new-instance v0, Lcom/mongodb/Response;

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    sget-object v5, Lcom/mongodb/DefaultDBDecoder;->FACTORY:Lcom/mongodb/DBDecoderFactory;

    invoke-interface {v5}, Lcom/mongodb/DBDecoderFactory;->create()Lcom/mongodb/DBDecoder;

    move-result-object v5

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/mongodb/Response;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/DBCollection;Ljava/io/InputStream;Lcom/mongodb/DBDecoder;)V

    .line 496
    .local v0, "response":Lcom/mongodb/Response;
    new-instance v1, Lcom/mongodb/CommandResult;

    invoke-virtual {p1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 497
    .local v1, "writeCommandResult":Lcom/mongodb/CommandResult;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/mongodb/Response;->get(I)Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/CommandResult;->putAll(Lorg/bson/BSONObject;)V

    .line 498
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 499
    return-object v1
.end method

.method private removeWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .registers 12
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/RemoveRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 406
    .local p1, "removeList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/RemoveRequest;>;"
    new-instance v0, Lcom/mongodb/DeleteCommandMessage;

    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    sget-object v2, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v2}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v4

    invoke-direct {p0, p4}, Lcom/mongodb/DBCollectionImpl;->getMessageSettings(Lcom/mongodb/DBPort;)Lcom/mongodb/MessageSettings;

    move-result-object v6

    move-object v2, p2

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/DeleteCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 409
    .local v0, "message":Lcom/mongodb/BaseWriteCommandMessage;
    sget-object v1, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, p4, v1, v0, p2}, Lcom/mongodb/DBCollectionImpl;->writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;

    move-result-object v1

    return-object v1
.end method

.method private sendWriteCommandMessage(Lcom/mongodb/BaseWriteCommandMessage;ILcom/mongodb/DBPort;)Lcom/mongodb/BaseWriteCommandMessage;
    .registers 11
    .param p1, "message"    # Lcom/mongodb/BaseWriteCommandMessage;
    .param p2, "batchNum"    # I
    .param p3, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 481
    new-instance v0, Lorg/bson/io/PoolOutputBuffer;

    invoke-direct {v0}, Lorg/bson/io/PoolOutputBuffer;-><init>()V

    .line 483
    .local v0, "buffer":Lorg/bson/io/PoolOutputBuffer;
    :try_start_6
    invoke-virtual {p1, v0}, Lcom/mongodb/BaseWriteCommandMessage;->encode(Lorg/bson/io/OutputBuffer;)Lcom/mongodb/BaseWriteCommandMessage;

    move-result-object v1

    .line 484
    .local v1, "nextMessage":Lcom/mongodb/BaseWriteCommandMessage;
    if-nez v1, :cond_e

    if-le p2, v2, :cond_25

    .line 485
    :cond_e
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getLogger()Ljava/util/logging/Logger;

    move-result-object v2

    const-string v3, "Sending batch %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 487
    :cond_25
    invoke-virtual {p3}, Lcom/mongodb/DBPort;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/bson/io/PoolOutputBuffer;->pipe(Ljava/io/OutputStream;)I
    :try_end_2c
    .catchall {:try_start_6 .. :try_end_2c} :catchall_30

    .line 490
    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    return-object v1

    .end local v1    # "nextMessage":Lcom/mongodb/BaseWriteCommandMessage;
    :catchall_30
    move-exception v2

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    throw v2
.end method

.method private trace(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 551
    sget-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LOGGER:Ljava/util/logging/Logger;

    sget-object v1, Lcom/mongodb/DBCollectionImpl;->TRACE_LEVEL:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 552
    return-void
.end method

.method private translateBulkWriteException(Lcom/mongodb/BulkWriteException;Lcom/mongodb/WriteRequest$Type;)Lcom/mongodb/MongoException;
    .registers 7
    .param p1, "e"    # Lcom/mongodb/BulkWriteException;
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;

    .prologue
    .line 301
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteErrors()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_50

    const/4 v1, 0x0

    .line 302
    .local v1, "lastError":Lcom/mongodb/BulkWriteError;
    :goto_b
    new-instance v0, Lcom/mongodb/CommandResult;

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getServerAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 303
    .local v0, "commandResult":Lcom/mongodb/CommandResult;
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteResult()Lcom/mongodb/BulkWriteResult;

    move-result-object v2

    invoke-direct {p0, v2, p2, v0}, Lcom/mongodb/DBCollectionImpl;->addBulkWriteResultToCommandResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)V

    .line 304
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v2

    if-eqz v2, :cond_2c

    .line 305
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/WriteConcernError;->getDetails()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/mongodb/CommandResult;->putAll(Lorg/bson/BSONObject;)V

    .line 308
    :cond_2c
    if-eqz v1, :cond_66

    .line 309
    const-string v2, "err"

    invoke-virtual {v1}, Lcom/mongodb/BulkWriteError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    const-string v2, "code"

    invoke-virtual {v1}, Lcom/mongodb/BulkWriteError;->getCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    invoke-virtual {v1}, Lcom/mongodb/BulkWriteError;->getDetails()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/mongodb/CommandResult;->putAll(Lorg/bson/BSONObject;)V

    .line 316
    :cond_4b
    :goto_4b
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->getException()Lcom/mongodb/MongoException;

    move-result-object v2

    return-object v2

    .line 301
    .end local v0    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v1    # "lastError":Lcom/mongodb/BulkWriteError;
    :cond_50
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteErrors()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteErrors()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/BulkWriteError;

    move-object v1, v2

    goto :goto_b

    .line 312
    .restart local v0    # "commandResult":Lcom/mongodb/CommandResult;
    .restart local v1    # "lastError":Lcom/mongodb/BulkWriteError;
    :cond_66
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v2

    if-eqz v2, :cond_4b

    .line 313
    const-string v2, "err"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/WriteConcernError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    const-string v2, "code"

    invoke-virtual {p1}, Lcom/mongodb/BulkWriteException;->getWriteConcernError()Lcom/mongodb/WriteConcernError;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/WriteConcernError;->getCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/CommandResult;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4b
.end method

.method private translateBulkWriteResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    .registers 7
    .param p1, "bulkWriteResult"    # Lcom/mongodb/BulkWriteResult;
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 295
    new-instance v0, Lcom/mongodb/CommandResult;

    invoke-direct {v0, p4}, Lcom/mongodb/CommandResult;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 296
    .local v0, "commandResult":Lcom/mongodb/CommandResult;
    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/DBCollectionImpl;->addBulkWriteResultToCommandResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/CommandResult;)V

    .line 297
    new-instance v1, Lcom/mongodb/WriteResult;

    invoke-direct {v1, v0, p3}, Lcom/mongodb/WriteResult;-><init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V

    return-object v1
.end method

.method private updateWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;
    .registers 12
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "port"    # Lcom/mongodb/DBPort;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ModifyRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            "Lcom/mongodb/DBPort;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 416
    .local p1, "updates":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ModifyRequest;>;"
    new-instance v0, Lcom/mongodb/UpdateCommandMessage;

    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->getNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    sget-object v2, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v2}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v4

    invoke-direct {p0, p4}, Lcom/mongodb/DBCollectionImpl;->getMessageSettings(Lcom/mongodb/DBPort;)Lcom/mongodb/MessageSettings;

    move-result-object v6

    move-object v2, p2

    move-object v3, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/UpdateCommandMessage;-><init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Ljava/util/List;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V

    .line 419
    .local v0, "message":Lcom/mongodb/BaseWriteCommandMessage;
    sget-object v1, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, p4, v1, v0, p2}, Lcom/mongodb/DBCollectionImpl;->writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;

    move-result-object v1

    return-object v1
.end method

.method private useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    .registers 7
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;
    .param p2, "port"    # Lcom/mongodb/DBPort;

    .prologue
    .line 458
    invoke-virtual {p1}, Lcom/mongodb/WriteConcern;->callGetLastError()Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {p2}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getVersion()Lcom/mongodb/ServerVersion;

    move-result-object v0

    new-instance v1, Lcom/mongodb/ServerVersion;

    const/4 v2, 0x2

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ServerVersion;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerVersion;->compareTo(Lcom/mongodb/ServerVersion;)I

    move-result v0

    if-ltz v0, :cond_27

    const/4 v0, 0x1

    :goto_26
    return v0

    :cond_27
    const/4 v0, 0x0

    goto :goto_26
.end method

.method private willTrace()Z
    .registers 3

    .prologue
    .line 547
    sget-object v0, Lcom/mongodb/DBCollectionImpl;->TRACE_LOGGER:Ljava/util/logging/Logger;

    sget-object v1, Lcom/mongodb/DBCollectionImpl;->TRACE_LEVEL:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method private writeWithCommandProtocol(Lcom/mongodb/DBPort;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;
    .registers 13
    .param p1, "port"    # Lcom/mongodb/DBPort;
    .param p2, "type"    # Lcom/mongodb/WriteRequest$Type;
    .param p3, "message"    # Lcom/mongodb/BaseWriteCommandMessage;
    .param p4, "writeConcern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 424
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v6

    iget-object v7, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    new-instance v0, Lcom/mongodb/DBCollectionImpl$2;

    move-object v1, p0

    move-object v2, p3

    move-object v3, p1

    move-object v4, p4

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl$2;-><init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/BaseWriteCommandMessage;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;Lcom/mongodb/WriteRequest$Type;)V

    invoke-virtual {v6, v7, p1, v0}, Lcom/mongodb/DBTCPConnector;->doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BulkWriteResult;

    return-object v0
.end method


# virtual methods
.method public aggregate(Ljava/util/List;Lcom/mongodb/AggregationOptions;Lcom/mongodb/ReadPreference;)Lcom/mongodb/Cursor;
    .registers 16
    .param p2, "options"    # Lcom/mongodb/AggregationOptions;
    .param p3, "readPreference"    # Lcom/mongodb/ReadPreference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/AggregationOptions;",
            "Lcom/mongodb/ReadPreference;",
            ")",
            "Lcom/mongodb/Cursor;"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-nez p2, :cond_a

    .line 93
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "options can not be null"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_a
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mongodb/DBObject;

    .line 97
    .local v10, "last":Lcom/mongodb/DBObject;
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DBCollectionImpl;->prepareCommand(Ljava/util/List;Lcom/mongodb/AggregationOptions;)Lcom/mongodb/DBObject;

    move-result-object v9

    .line 99
    .local v9, "command":Lcom/mongodb/DBObject;
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getOptions()I

    move-result v2

    invoke-virtual {v0, v9, v2, p3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 100
    .local v1, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 102
    const-string v0, "$out"

    invoke-interface {v10, v0}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 103
    .local v11, "outCollection":Ljava/lang/String;
    if-eqz v11, :cond_47

    .line 104
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    invoke-virtual {v0, v11}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v8

    .line 105
    .local v8, "collection":Lcom/mongodb/DBCollection;
    new-instance v0, Lcom/mongodb/DBCursor;

    new-instance v2, Lcom/mongodb/BasicDBObject;

    invoke-direct {v2}, Lcom/mongodb/BasicDBObject;-><init>()V

    const/4 v3, 0x0

    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v4

    invoke-direct {v0, v8, v2, v3, v4}, Lcom/mongodb/DBCursor;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)V

    .line 108
    .end local v8    # "collection":Lcom/mongodb/DBCollection;
    :goto_46
    return-object v0

    .line 107
    :cond_47
    invoke-virtual {p2}, Lcom/mongodb/AggregationOptions;->getBatchSize()Ljava/lang/Integer;

    move-result-object v7

    .line 108
    .local v7, "batchSize":Ljava/lang/Integer;
    new-instance v0, Lcom/mongodb/QueryResultIterator;

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    if-nez v7, :cond_5f

    const/4 v4, 0x0

    :goto_52
    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getDecoder()Lcom/mongodb/DBDecoder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->getServerUsed()Lcom/mongodb/ServerAddress;

    move-result-object v6

    move-object v3, p0

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/QueryResultIterator;-><init>(Lcom/mongodb/DBObject;Lcom/mongodb/DBApiLayer;Lcom/mongodb/DBCollectionImpl;ILcom/mongodb/DBDecoder;Lcom/mongodb/ServerAddress;)V

    goto :goto_46

    :cond_5f
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v4

    goto :goto_52
.end method

.method public createIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBEncoder;)V
    .registers 16
    .param p1, "keys"    # Lcom/mongodb/DBObject;
    .param p2, "options"    # Lcom/mongodb/DBObject;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 340
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v7

    .line 341
    .local v7, "connector":Lcom/mongodb/DBTCPConnector;
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v4

    .line 344
    .local v4, "port":Lcom/mongodb/DBPort;
    :try_start_10
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollectionImpl;->defaultOptions(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v10

    .line 345
    .local v10, "index":Lcom/mongodb/DBObject;
    invoke-interface {v10, p2}, Lcom/mongodb/DBObject;->putAll(Lorg/bson/BSONObject;)V

    .line 346
    const-string v0, "key"

    invoke-interface {v10, v0, p1}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    invoke-virtual {v4}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-virtual {v7, v0}, Lcom/mongodb/DBTCPConnector;->getServerDescription(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getVersion()Lcom/mongodb/ServerVersion;

    move-result-object v0

    new-instance v1, Lcom/mongodb/ServerVersion;

    const/4 v2, 0x2

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Lcom/mongodb/ServerVersion;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/mongodb/ServerVersion;->compareTo(Lcom/mongodb/ServerVersion;)I

    move-result v0

    if-ltz v0, :cond_76

    .line 349
    new-instance v8, Lcom/mongodb/BasicDBObject;

    const-string v0, "createIndexes"

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v0, v1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 351
    .local v8, "createIndexes":Lcom/mongodb/BasicDBObject;
    new-instance v11, Lcom/mongodb/BasicDBList;

    invoke-direct {v11}, Lcom/mongodb/BasicDBList;-><init>()V

    .line 352
    .local v11, "list":Lcom/mongodb/BasicDBList;
    invoke-virtual {v11, v10}, Lcom/mongodb/BasicDBList;->add(Ljava/lang/Object;)Z

    .line 353
    const-string v0, "indexes"

    invoke-virtual {v8, v0, v11}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    new-instance v1, Lcom/mongodb/DBCollectionImpl$1;

    invoke-direct {v1, p0, v4, v8}, Lcom/mongodb/DBCollectionImpl$1;-><init>(Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/DBPort;Lcom/mongodb/BasicDBObject;)V

    invoke-virtual {v7, v0, v4, v1}, Lcom/mongodb/DBTCPConnector;->doOperation(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/DBPort$Operation;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mongodb/CommandResult;
    :try_end_5a
    .catchall {:try_start_10 .. :try_end_5a} :catchall_70

    .line 362
    .local v6, "commandResult":Lcom/mongodb/CommandResult;
    :try_start_5a
    invoke-virtual {v6}, Lcom/mongodb/CommandResult;->throwOnError()V
    :try_end_5d
    .catch Lcom/mongodb/CommandFailureException; {:try_start_5a .. :try_end_5d} :catch_61
    .catchall {:try_start_5a .. :try_end_5d} :catchall_70

    .line 375
    .end local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .end local v11    # "list":Lcom/mongodb/BasicDBList;
    :goto_5d
    invoke-virtual {v7, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    .line 377
    return-void

    .line 363
    .restart local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .restart local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .restart local v11    # "list":Lcom/mongodb/BasicDBList;
    :catch_61
    move-exception v9

    .line 364
    .local v9, "e":Lcom/mongodb/CommandFailureException;
    :try_start_62
    invoke-virtual {v9}, Lcom/mongodb/CommandFailureException;->getCode()I

    move-result v0

    const/16 v1, 0x2af8

    if-ne v0, v1, :cond_75

    .line 365
    new-instance v0, Lcom/mongodb/MongoException$DuplicateKey;

    invoke-direct {v0, v6}, Lcom/mongodb/MongoException$DuplicateKey;-><init>(Lcom/mongodb/CommandResult;)V

    throw v0
    :try_end_70
    .catchall {:try_start_62 .. :try_end_70} :catchall_70

    .line 375
    .end local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .end local v9    # "e":Lcom/mongodb/CommandFailureException;
    .end local v10    # "index":Lcom/mongodb/DBObject;
    .end local v11    # "list":Lcom/mongodb/BasicDBList;
    :catchall_70
    move-exception v0

    invoke-virtual {v7, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v0

    .line 367
    .restart local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .restart local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .restart local v9    # "e":Lcom/mongodb/CommandFailureException;
    .restart local v10    # "index":Lcom/mongodb/DBObject;
    .restart local v11    # "list":Lcom/mongodb/BasicDBList;
    :cond_75
    :try_start_75
    throw v9

    .line 371
    .end local v6    # "commandResult":Lcom/mongodb/CommandResult;
    .end local v8    # "createIndexes":Lcom/mongodb/BasicDBObject;
    .end local v9    # "e":Lcom/mongodb/CommandFailureException;
    .end local v11    # "list":Lcom/mongodb/BasicDBList;
    :cond_76
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    const-string v1, "system.indexes"

    invoke-virtual {v0, v1}, Lcom/mongodb/DBApiLayer;->doGetCollection(Ljava/lang/String;)Lcom/mongodb/DBCollectionImpl;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/mongodb/DBObject;

    const/4 v2, 0x0

    aput-object v10, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/mongodb/WriteConcern;->SAFE:Lcom/mongodb/WriteConcern;

    sget-object v3, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v3}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v3

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->insertWithWriteProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/WriteResult;
    :try_end_94
    .catchall {:try_start_75 .. :try_end_94} :catchall_70

    goto :goto_5d
.end method

.method public doapply(Lcom/mongodb/DBObject;)V
    .registers 2
    .param p1, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 291
    return-void
.end method

.method public drop()V
    .registers 3

    .prologue
    .line 286
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    iget-object v0, v0, Lcom/mongodb/DBApiLayer;->_collections:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    invoke-super {p0}, Lcom/mongodb/DBCollection;->drop()V

    .line 288
    return-void
.end method

.method executeBulkWriteOperation(ZLjava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/BulkWriteResult;
    .registers 16
    .param p1, "ordered"    # Z
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .local p2, "writeRequests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/WriteRequest;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 132
    const-string v3, "no operations"

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_18

    move v0, v1

    :goto_b
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 134
    if-nez p3, :cond_1a

    .line 135
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Write concern can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_18
    move v0, v2

    .line 132
    goto :goto_b

    .line 138
    :cond_1a
    if-nez p1, :cond_82

    :goto_1c
    invoke-virtual {p3, v1}, Lcom/mongodb/WriteConcern;->continueOnError(Z)Lcom/mongodb/WriteConcern;

    move-result-object p3

    .line 140
    if-nez p4, :cond_28

    .line 141
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object p4

    .line 144
    :cond_28
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v5

    .line 146
    .local v5, "port":Lcom/mongodb/DBPort;
    :try_start_32
    new-instance v6, Lcom/mongodb/BulkWriteBatchCombiner;

    invoke-virtual {v5}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-direct {v6, v0, p3}, Lcom/mongodb/BulkWriteBatchCombiner;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/WriteConcern;)V

    .local v6, "bulkWriteBatchCombiner":Lcom/mongodb/BulkWriteBatchCombiner;
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 147
    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->getRunGenerator(ZLjava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Ljava/lang/Iterable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_48
    :goto_48
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_74

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mongodb/DBCollectionImpl$Run;
    :try_end_54
    .catchall {:try_start_32 .. :try_end_54} :catchall_84

    .line 149
    .local v10, "run":Lcom/mongodb/DBCollectionImpl$Run;
    :try_start_54
    invoke-virtual {v10, v5}, Lcom/mongodb/DBCollectionImpl$Run;->execute(Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v9

    .line 150
    .local v9, "result":Lcom/mongodb/BulkWriteResult;
    invoke-virtual {v9}, Lcom/mongodb/BulkWriteResult;->isAcknowledged()Z

    move-result v0

    if-eqz v0, :cond_48

    .line 151
    # getter for: Lcom/mongodb/DBCollectionImpl$Run;->indexMap:Lcom/mongodb/IndexMap;
    invoke-static {v10}, Lcom/mongodb/DBCollectionImpl$Run;->access$000(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/IndexMap;

    move-result-object v0

    invoke-virtual {v6, v9, v0}, Lcom/mongodb/BulkWriteBatchCombiner;->addResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/IndexMap;)V
    :try_end_65
    .catch Lcom/mongodb/BulkWriteException; {:try_start_54 .. :try_end_65} :catch_66
    .catchall {:try_start_54 .. :try_end_65} :catchall_84

    goto :goto_48

    .line 153
    .end local v9    # "result":Lcom/mongodb/BulkWriteResult;
    :catch_66
    move-exception v7

    .line 154
    .local v7, "e":Lcom/mongodb/BulkWriteException;
    :try_start_67
    # getter for: Lcom/mongodb/DBCollectionImpl$Run;->indexMap:Lcom/mongodb/IndexMap;
    invoke-static {v10}, Lcom/mongodb/DBCollectionImpl$Run;->access$000(Lcom/mongodb/DBCollectionImpl$Run;)Lcom/mongodb/IndexMap;

    move-result-object v0

    invoke-virtual {v6, v7, v0}, Lcom/mongodb/BulkWriteBatchCombiner;->addErrorResult(Lcom/mongodb/BulkWriteException;Lcom/mongodb/IndexMap;)V

    .line 155
    invoke-virtual {v6}, Lcom/mongodb/BulkWriteBatchCombiner;->shouldStopSendingMoreBatches()Z

    move-result v0

    if-eqz v0, :cond_48

    .line 160
    .end local v7    # "e":Lcom/mongodb/BulkWriteException;
    .end local v10    # "run":Lcom/mongodb/DBCollectionImpl$Run;
    :cond_74
    invoke-virtual {v6}, Lcom/mongodb/BulkWriteBatchCombiner;->getResult()Lcom/mongodb/BulkWriteResult;
    :try_end_77
    .catchall {:try_start_67 .. :try_end_77} :catchall_84

    move-result-object v0

    .line 162
    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    return-object v0

    .end local v5    # "port":Lcom/mongodb/DBPort;
    .end local v6    # "bulkWriteBatchCombiner":Lcom/mongodb/BulkWriteBatchCombiner;
    .end local v8    # "i$":Ljava/util/Iterator;
    :cond_82
    move v1, v2

    .line 138
    goto :goto_1c

    .line 162
    .restart local v5    # "port":Lcom/mongodb/DBPort;
    :catchall_84
    move-exception v0

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v0
.end method

.method find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/QueryResultIterator;
    .registers 19
    .param p1, "ref"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "numToSkip"    # I
    .param p4, "batchSize"    # I
    .param p5, "limit"    # I
    .param p6, "options"    # I
    .param p7, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p8, "decoder"    # Lcom/mongodb/DBDecoder;

    .prologue
    .line 66
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v9

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-virtual/range {v0 .. v9}, Lcom/mongodb/DBCollectionImpl;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;Lcom/mongodb/DBEncoder;)Lcom/mongodb/QueryResultIterator;

    move-result-object v0

    return-object v0
.end method

.method find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;Lcom/mongodb/DBEncoder;)Lcom/mongodb/QueryResultIterator;
    .registers 24
    .param p1, "ref"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "numToSkip"    # I
    .param p4, "batchSize"    # I
    .param p5, "limit"    # I
    .param p6, "options"    # I
    .param p7, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p8, "decoder"    # Lcom/mongodb/DBDecoder;
    .param p9, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 73
    if-nez p1, :cond_7

    .line 74
    new-instance p1, Lcom/mongodb/BasicDBObject;

    .end local p1    # "ref":Lcom/mongodb/DBObject;
    invoke-direct {p1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 77
    .restart local p1    # "ref":Lcom/mongodb/DBObject;
    :cond_7
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "find: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mongodb/DBCollectionImpl;->trace(Ljava/lang/String;)V

    .line 81
    :cond_33
    const/4 v2, 0x0

    move/from16 v0, p4

    move/from16 v1, p5

    invoke-static {v0, v1, v2}, Lcom/mongodb/QueryResultIterator;->chooseBatchSize(III)I

    move-result v5

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/Mongo;->getMaxBsonObjectSize()I

    move-result v2

    add-int/lit16 v10, v2, 0x4000

    move-object v2, p0

    move/from16 v3, p6

    move/from16 v4, p3

    move-object v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p7

    move-object/from16 v9, p9

    invoke-static/range {v2 .. v10}, Lcom/mongodb/OutMessage;->query(Lcom/mongodb/DBCollection;IIILcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;Lcom/mongodb/DBEncoder;I)Lcom/mongodb/OutMessage;

    move-result-object v5

    .line 84
    .local v5, "query":Lcom/mongodb/OutMessage;
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    const/4 v6, 0x0

    const/4 v7, 0x2

    move-object v4, p0

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v2 .. v9}, Lcom/mongodb/DBTCPConnector;->call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;

    move-result-object v9

    .line 86
    .local v9, "res":Lcom/mongodb/Response;
    new-instance v6, Lcom/mongodb/QueryResultIterator;

    iget-object v7, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    move-object v8, p0

    move/from16 v10, p4

    move/from16 v11, p5

    move/from16 v12, p6

    move-object/from16 v13, p8

    invoke-direct/range {v6 .. v13}, Lcom/mongodb/QueryResultIterator;-><init>(Lcom/mongodb/DBApiLayer;Lcom/mongodb/DBCollectionImpl;Lcom/mongodb/Response;IIILcom/mongodb/DBDecoder;)V

    return-object v6
.end method

.method public insert(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .registers 5
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            ")",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation

    .prologue
    .line 167
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/mongodb/DBCollectionImpl;->insert(Ljava/util/List;ZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method protected insert(Ljava/util/List;ZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .registers 14
    .param p2, "shouldApply"    # Z
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;Z",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            ")",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation

    .prologue
    .line 171
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    if-nez p3, :cond_a

    .line 172
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Write concern can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 175
    :cond_a
    if-nez p4, :cond_12

    .line 176
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object p4

    .line 178
    :cond_12
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 179
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mongodb/DBObject;

    .line 180
    .local v8, "o":Lcom/mongodb/DBObject;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "save:  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v8}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/DBCollectionImpl;->trace(Ljava/lang/String;)V

    goto :goto_1c

    .line 184
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "o":Lcom/mongodb/DBObject;
    :cond_4f
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v0}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v4

    .line 186
    .local v4, "port":Lcom/mongodb/DBPort;
    :try_start_59
    invoke-direct {p0, p3, v4}, Lcom/mongodb/DBCollectionImpl;->useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    :try_end_5c
    .catchall {:try_start_59 .. :try_end_5c} :catchall_84

    move-result v0

    if-eqz v0, :cond_8f

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move v5, p2

    .line 188
    :try_start_64
    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->insertWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    invoke-virtual {v4}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-direct {p0, v0, v1, p3, v2}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    :try_end_71
    .catch Lcom/mongodb/BulkWriteException; {:try_start_64 .. :try_end_71} :catch_7c
    .catchall {:try_start_64 .. :try_end_71} :catchall_84

    move-result-object v0

    .line 198
    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    :goto_7b
    return-object v0

    .line 190
    :catch_7c
    move-exception v6

    .line 191
    .local v6, "e":Lcom/mongodb/BulkWriteException;
    :try_start_7d
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, v6, v0}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteException(Lcom/mongodb/BulkWriteException;Lcom/mongodb/WriteRequest$Type;)Lcom/mongodb/MongoException;

    move-result-object v0

    throw v0
    :try_end_84
    .catchall {:try_start_7d .. :try_end_84} :catchall_84

    .line 198
    .end local v6    # "e":Lcom/mongodb/BulkWriteException;
    :catchall_84
    move-exception v0

    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v0

    :cond_8f
    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move v5, p2

    .line 195
    :try_start_94
    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBCollectionImpl;->insertWithWriteProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;Z)Lcom/mongodb/WriteResult;
    :try_end_97
    .catchall {:try_start_94 .. :try_end_97} :catchall_84

    move-result-object v0

    .line 198
    iget-object v1, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v1}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    goto :goto_7b
.end method

.method public parallelScan(Lcom/mongodb/ParallelScanOptions;)Ljava/util/List;
    .registers 12
    .param p1, "options"    # Lcom/mongodb/ParallelScanOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ParallelScanOptions;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    new-instance v2, Lcom/mongodb/BasicDBObject;

    const-string v3, "parallelCollectionScan"

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "numCursors"

    invoke-virtual {p1}, Lcom/mongodb/ParallelScanOptions;->getNumCursors()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v2

    invoke-virtual {p1}, Lcom/mongodb/ParallelScanOptions;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v9

    .line 118
    .local v9, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v9}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 120
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v7, "cursors":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/Cursor;>;"
    const-string v0, "cursors"

    invoke-virtual {v9, v0}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_37
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    .line 122
    .local v1, "cursorDocument":Lcom/mongodb/DBObject;
    new-instance v0, Lcom/mongodb/QueryResultIterator;

    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {p1}, Lcom/mongodb/ParallelScanOptions;->getBatchSize()I

    move-result v4

    invoke-virtual {p0}, Lcom/mongodb/DBCollectionImpl;->getDecoder()Lcom/mongodb/DBDecoder;

    move-result-object v5

    invoke-virtual {v9}, Lcom/mongodb/CommandResult;->getServerUsed()Lcom/mongodb/ServerAddress;

    move-result-object v6

    move-object v3, p0

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/QueryResultIterator;-><init>(Lcom/mongodb/DBObject;Lcom/mongodb/DBApiLayer;Lcom/mongodb/DBCollectionImpl;ILcom/mongodb/DBDecoder;Lcom/mongodb/ServerAddress;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_37

    .line 125
    .end local v1    # "cursorDocument":Lcom/mongodb/DBObject;
    :cond_5b
    return-object v7
.end method

.method public remove(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .registers 5
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 203
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/mongodb/DBCollectionImpl;->remove(Lcom/mongodb/DBObject;ZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lcom/mongodb/DBObject;ZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .registers 10
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "multi"    # Z
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;
    .param p4, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 207
    if-nez p3, :cond_a

    .line 208
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Write concern can not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 211
    :cond_a
    if-nez p4, :cond_12

    .line 212
    sget-object v2, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v2}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object p4

    .line 215
    :cond_12
    invoke-direct {p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 216
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "remove: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mongodb/DBCollectionImpl;->trace(Ljava/lang/String;)V

    .line 219
    :cond_3e
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v1

    .line 221
    .local v1, "port":Lcom/mongodb/DBPort;
    :try_start_48
    invoke-direct {p0, p3, v1}, Lcom/mongodb/DBCollectionImpl;->useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_7d

    move-result v2

    if-eqz v2, :cond_88

    .line 223
    const/4 v2, 0x1

    :try_start_4f
    new-array v2, v2, [Lcom/mongodb/RemoveRequest;

    const/4 v3, 0x0

    new-instance v4, Lcom/mongodb/RemoveRequest;

    invoke-direct {v4, p1, p2}, Lcom/mongodb/RemoveRequest;-><init>(Lcom/mongodb/DBObject;Z)V

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {p0, v2, p3, p4, v1}, Lcom/mongodb/DBCollectionImpl;->removeWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v2

    sget-object v3, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    invoke-virtual {v1}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-direct {p0, v2, v3, p3, v4}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    :try_end_6a
    .catch Lcom/mongodb/BulkWriteException; {:try_start_4f .. :try_end_6a} :catch_75
    .catchall {:try_start_4f .. :try_end_6a} :catchall_7d

    move-result-object v2

    .line 235
    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v3}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    :goto_74
    return-object v2

    .line 227
    :catch_75
    move-exception v0

    .line 228
    .local v0, "e":Lcom/mongodb/BulkWriteException;
    :try_start_76
    sget-object v2, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    invoke-direct {p0, v0, v2}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteException(Lcom/mongodb/BulkWriteException;Lcom/mongodb/WriteRequest$Type;)Lcom/mongodb/MongoException;

    move-result-object v2

    throw v2
    :try_end_7d
    .catchall {:try_start_76 .. :try_end_7d} :catchall_7d

    .line 235
    .end local v0    # "e":Lcom/mongodb/BulkWriteException;
    :catchall_7d
    move-exception v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v3}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v2

    .line 232
    :cond_88
    :try_start_88
    iget-object v2, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v2}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    invoke-static {p0, p4, p1, p2}, Lcom/mongodb/OutMessage;->remove(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;Z)Lcom/mongodb/OutMessage;

    move-result-object v4

    invoke-virtual {v2, v3, v4, p3, v1}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
    :try_end_97
    .catchall {:try_start_88 .. :try_end_97} :catchall_7d

    move-result-object v2

    .line 235
    iget-object v3, p0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v3}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    goto :goto_74
.end method

.method public update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .registers 23
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "o"    # Lcom/mongodb/DBObject;
    .param p3, "upsert"    # Z
    .param p4, "multi"    # Z
    .param p5, "concern"    # Lcom/mongodb/WriteConcern;
    .param p6, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 243
    if-nez p2, :cond_a

    .line 244
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "update can not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 247
    :cond_a
    if-nez p5, :cond_14

    .line 248
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Write concern can not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 251
    :cond_14
    if-nez p6, :cond_1c

    .line 252
    sget-object v4, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    invoke-interface {v4}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object p6

    .line 254
    :cond_1c
    invoke-interface/range {p2 .. p2}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_45

    .line 256
    invoke-interface/range {p2 .. p2}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 257
    .local v12, "key":Ljava/lang/String;
    const-string v4, "$"

    invoke-virtual {v12, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_45

    .line 258
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v4, v5}, Lcom/mongodb/DBCollectionImpl;->_checkObject(Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    .line 261
    .end local v12    # "key":Ljava/lang/String;
    :cond_45
    invoke-direct/range {p0 .. p0}, Lcom/mongodb/DBCollectionImpl;->willTrace()Z

    move-result v4

    if-eqz v4, :cond_83

    .line 262
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "update: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBCollectionImpl;->namespace:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p1 .. p1}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static/range {p2 .. p2}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/mongodb/DBCollectionImpl;->trace(Ljava/lang/String;)V

    .line 265
    :cond_83
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v4}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mongodb/DBTCPConnector;->getPrimaryPort()Lcom/mongodb/DBPort;

    move-result-object v13

    .line 267
    .local v13, "port":Lcom/mongodb/DBPort;
    :try_start_8f
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1, v13}, Lcom/mongodb/DBCollectionImpl;->useWriteCommands(Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Z
    :try_end_96
    .catchall {:try_start_8f .. :try_end_96} :catchall_de

    move-result v4

    if-eqz v4, :cond_eb

    .line 269
    const/4 v4, 0x1

    :try_start_9a
    new-array v4, v4, [Lcom/mongodb/ModifyRequest;

    const/4 v5, 0x0

    new-instance v6, Lcom/mongodb/UpdateRequest;

    move-object/from16 v0, p1

    move/from16 v1, p3

    move-object/from16 v2, p2

    move/from16 v3, p4

    invoke-direct {v6, v0, v1, v2, v3}, Lcom/mongodb/UpdateRequest;-><init>(Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;Z)V

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    invoke-direct {v0, v4, v1, v2, v13}, Lcom/mongodb/DBCollectionImpl;->updateWithCommandProtocol(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/DBPort;)Lcom/mongodb/BulkWriteResult;

    move-result-object v10

    .line 272
    .local v10, "bulkWriteResult":Lcom/mongodb/BulkWriteResult;
    sget-object v4, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    invoke-virtual {v13}, Lcom/mongodb/DBPort;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v10, v4, v1, v5}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteResult(Lcom/mongodb/BulkWriteResult;Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
    :try_end_c7
    .catch Lcom/mongodb/BulkWriteException; {:try_start_9a .. :try_end_c7} :catch_d4
    .catchall {:try_start_9a .. :try_end_c7} :catchall_de

    move-result-object v4

    .line 280
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v5}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v5

    invoke-virtual {v5, v13}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    .end local v10    # "bulkWriteResult":Lcom/mongodb/BulkWriteResult;
    :goto_d3
    return-object v4

    .line 273
    :catch_d4
    move-exception v11

    .line 274
    .local v11, "e":Lcom/mongodb/BulkWriteException;
    :try_start_d5
    sget-object v4, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v4}, Lcom/mongodb/DBCollectionImpl;->translateBulkWriteException(Lcom/mongodb/BulkWriteException;Lcom/mongodb/WriteRequest$Type;)Lcom/mongodb/MongoException;

    move-result-object v4

    throw v4
    :try_end_de
    .catchall {:try_start_d5 .. :try_end_de} :catchall_de

    .line 280
    .end local v11    # "e":Lcom/mongodb/BulkWriteException;
    :catchall_de
    move-exception v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v5}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v5

    invoke-virtual {v5, v13}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    throw v4

    .line 277
    :cond_eb
    :try_start_eb
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v4}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mongodb/DBCollectionImpl;->_db:Lcom/mongodb/DB;

    move-object/from16 v4, p0

    move-object/from16 v5, p6

    move/from16 v6, p3

    move/from16 v7, p4

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    invoke-static/range {v4 .. v9}, Lcom/mongodb/OutMessage;->update(Lcom/mongodb/DBCollection;Lcom/mongodb/DBEncoder;ZZLcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/OutMessage;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-virtual {v14, v15, v4, v0, v13}, Lcom/mongodb/DBTCPConnector;->say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBPort;)Lcom/mongodb/WriteResult;
    :try_end_10c
    .catchall {:try_start_eb .. :try_end_10c} :catchall_de

    move-result-object v4

    .line 280
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/mongodb/DBCollectionImpl;->db:Lcom/mongodb/DBApiLayer;

    invoke-virtual {v5}, Lcom/mongodb/DBApiLayer;->getConnector()Lcom/mongodb/DBTCPConnector;

    move-result-object v5

    invoke-virtual {v5, v13}, Lcom/mongodb/DBTCPConnector;->releasePort(Lcom/mongodb/DBPort;)V

    goto :goto_d3
.end method
