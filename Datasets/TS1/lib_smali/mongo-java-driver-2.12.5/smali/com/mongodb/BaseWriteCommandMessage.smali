.class abstract Lcom/mongodb/BaseWriteCommandMessage;
.super Lcom/mongodb/RequestMessage;
.source "BaseWriteCommandMessage.java"


# static fields
.field private static final HEADROOM:I = 0x4000


# instance fields
.field private final commandEncoder:Lcom/mongodb/DBEncoder;

.field private final writeConcern:Lcom/mongodb/WriteConcern;

.field private final writeNamespace:Lcom/mongodb/MongoNamespace;


# direct methods
.method public constructor <init>(Lcom/mongodb/MongoNamespace;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;Lcom/mongodb/MessageSettings;)V
    .registers 8
    .param p1, "writeNamespace"    # Lcom/mongodb/MongoNamespace;
    .param p2, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .param p3, "commandEncoder"    # Lcom/mongodb/DBEncoder;
    .param p4, "settings"    # Lcom/mongodb/MessageSettings;

    .prologue
    .line 33
    new-instance v0, Lcom/mongodb/MongoNamespace;

    invoke-virtual {p1}, Lcom/mongodb/MongoNamespace;->getDatabaseName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "$cmd"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/MongoNamespace;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/mongodb/MongoNamespace;->getFullName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/mongodb/RequestMessage$OpCode;->OP_QUERY:Lcom/mongodb/RequestMessage$OpCode;

    invoke-direct {p0, v0, v1, p4}, Lcom/mongodb/RequestMessage;-><init>(Ljava/lang/String;Lcom/mongodb/RequestMessage$OpCode;Lcom/mongodb/MessageSettings;)V

    .line 35
    iput-object p1, p0, Lcom/mongodb/BaseWriteCommandMessage;->writeNamespace:Lcom/mongodb/MongoNamespace;

    .line 36
    iput-object p2, p0, Lcom/mongodb/BaseWriteCommandMessage;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 37
    iput-object p3, p0, Lcom/mongodb/BaseWriteCommandMessage;->commandEncoder:Lcom/mongodb/DBEncoder;

    .line 38
    return-void
.end method

.method private exceedsBatchItemCountLimit(I)Z
    .registers 3
    .param p1, "batchItemCount"    # I

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MessageSettings;->getMaxWriteBatchSize()I

    move-result v0

    if-le p1, v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private exceedsBatchLengthLimit(II)Z
    .registers 5
    .param p1, "batchLength"    # I
    .param p2, "batchItemCount"    # I

    .prologue
    const/4 v0, 0x1

    .line 98
    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/MessageSettings;->getMaxDocumentSize()I

    move-result v1

    if-le p1, v1, :cond_e

    if-le p2, v0, :cond_e

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private writeCommandHeader(Lorg/bson/io/OutputBuffer;)V
    .registers 4
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-virtual {p1, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 79
    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getCollectionName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;)I

    .line 81
    invoke-virtual {p1, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 82
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 83
    return-void
.end method

.method private writeCommandPrologue(Lcom/mongodb/BSONBinaryWriter;)V
    .registers 4
    .param p1, "writer"    # Lcom/mongodb/BSONBinaryWriter;

    .prologue
    .line 108
    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getCommandName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getWriteNamespace()Lcom/mongodb/MongoNamespace;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/MongoNamespace;->getCollectionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    const-string v1, "ordered"

    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/WriteConcern;->getContinueOnError()Z

    move-result v0

    if-nez v0, :cond_3e

    const/4 v0, 0x1

    :goto_1c
    invoke-virtual {p1, v1, v0}, Lcom/mongodb/BSONBinaryWriter;->writeBoolean(Ljava/lang/String;Z)V

    .line 110
    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/WriteConcern;->useServerDefault()Z

    move-result v0

    if-nez v0, :cond_3d

    .line 111
    const-string v0, "writeConcern"

    invoke-virtual {p1, v0}, Lcom/mongodb/BSONBinaryWriter;->writeName(Ljava/lang/String;)V

    .line 112
    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getCommandEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/WriteConcern;->asDBObject()Lcom/mongodb/BasicDBObject;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/mongodb/BSONBinaryWriter;->encodeDocument(Lcom/mongodb/DBEncoder;Lcom/mongodb/DBObject;)V

    .line 114
    :cond_3d
    return-void

    .line 109
    :cond_3e
    const/4 v0, 0x0

    goto :goto_1c
.end method


# virtual methods
.method public encode(Lorg/bson/io/OutputBuffer;)Lcom/mongodb/BaseWriteCommandMessage;
    .registers 3
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;

    .prologue
    .line 53
    invoke-super {p0, p1}, Lcom/mongodb/RequestMessage;->encode(Lorg/bson/io/OutputBuffer;)Lcom/mongodb/RequestMessage;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BaseWriteCommandMessage;

    return-object v0
.end method

.method public bridge synthetic encode(Lorg/bson/io/OutputBuffer;)Lcom/mongodb/RequestMessage;
    .registers 3
    .param p1, "x0"    # Lorg/bson/io/OutputBuffer;

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Lcom/mongodb/BaseWriteCommandMessage;->encode(Lorg/bson/io/OutputBuffer;)Lcom/mongodb/BaseWriteCommandMessage;

    move-result-object v0

    return-object v0
.end method

.method protected encodeMessageBody(Lorg/bson/io/OutputBuffer;I)Lcom/mongodb/BaseWriteCommandMessage;
    .registers 9
    .param p1, "buffer"    # Lorg/bson/io/OutputBuffer;
    .param p2, "messageStartPosition"    # I

    .prologue
    .line 58
    const/4 v1, 0x0

    .line 60
    .local v1, "nextMessage":Lcom/mongodb/BaseWriteCommandMessage;
    invoke-direct {p0, p1}, Lcom/mongodb/BaseWriteCommandMessage;->writeCommandHeader(Lorg/bson/io/OutputBuffer;)V

    .line 62
    invoke-virtual {p1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    .line 63
    .local v0, "commandStartPosition":I
    new-instance v2, Lcom/mongodb/BSONBinaryWriter;

    new-instance v3, Lcom/mongodb/BSONWriterSettings;

    invoke-direct {v3}, Lcom/mongodb/BSONWriterSettings;-><init>()V

    new-instance v4, Lcom/mongodb/BSONBinaryWriterSettings;

    invoke-virtual {p0}, Lcom/mongodb/BaseWriteCommandMessage;->getSettings()Lcom/mongodb/MessageSettings;

    move-result-object v5

    invoke-virtual {v5}, Lcom/mongodb/MessageSettings;->getMaxDocumentSize()I

    move-result v5

    add-int/lit16 v5, v5, 0x4000

    invoke-direct {v4, v5}, Lcom/mongodb/BSONBinaryWriterSettings;-><init>(I)V

    invoke-direct {v2, v3, v4, p1}, Lcom/mongodb/BSONBinaryWriter;-><init>(Lcom/mongodb/BSONWriterSettings;Lcom/mongodb/BSONBinaryWriterSettings;Lorg/bson/io/OutputBuffer;)V

    .line 67
    .local v2, "writer":Lcom/mongodb/BSONBinaryWriter;
    :try_start_21
    invoke-virtual {v2}, Lcom/mongodb/BSONBinaryWriter;->writeStartDocument()V

    .line 68
    invoke-direct {p0, v2}, Lcom/mongodb/BaseWriteCommandMessage;->writeCommandPrologue(Lcom/mongodb/BSONBinaryWriter;)V

    .line 69
    invoke-virtual {p0, p1, v0, v2}, Lcom/mongodb/BaseWriteCommandMessage;->writeTheWrites(Lorg/bson/io/OutputBuffer;ILcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/BaseWriteCommandMessage;

    move-result-object v1

    .line 70
    invoke-virtual {v2}, Lcom/mongodb/BSONBinaryWriter;->writeEndDocument()V
    :try_end_2e
    .catchall {:try_start_21 .. :try_end_2e} :catchall_32

    .line 72
    invoke-virtual {v2}, Lcom/mongodb/BSONBinaryWriter;->close()V

    .line 74
    return-object v1

    .line 72
    :catchall_32
    move-exception v3

    invoke-virtual {v2}, Lcom/mongodb/BSONBinaryWriter;->close()V

    throw v3
.end method

.method protected bridge synthetic encodeMessageBody(Lorg/bson/io/OutputBuffer;I)Lcom/mongodb/RequestMessage;
    .registers 4
    .param p1, "x0"    # Lorg/bson/io/OutputBuffer;
    .param p2, "x1"    # I

    .prologue
    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/BaseWriteCommandMessage;->encodeMessageBody(Lorg/bson/io/OutputBuffer;I)Lcom/mongodb/BaseWriteCommandMessage;

    move-result-object v0

    return-object v0
.end method

.method protected exceedsLimits(II)Z
    .registers 4
    .param p1, "batchLength"    # I
    .param p2, "batchItemCount"    # I

    .prologue
    .line 91
    invoke-direct {p0, p1, p2}, Lcom/mongodb/BaseWriteCommandMessage;->exceedsBatchLengthLimit(II)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-direct {p0, p2}, Lcom/mongodb/BaseWriteCommandMessage;->exceedsBatchItemCountLimit(I)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getCommandEncoder()Lcom/mongodb/DBEncoder;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/mongodb/BaseWriteCommandMessage;->commandEncoder:Lcom/mongodb/DBEncoder;

    return-object v0
.end method

.method protected abstract getCommandName()Ljava/lang/String;
.end method

.method public abstract getItemCount()I
.end method

.method public getWriteConcern()Lcom/mongodb/WriteConcern;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/mongodb/BaseWriteCommandMessage;->writeConcern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method public getWriteNamespace()Lcom/mongodb/MongoNamespace;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/mongodb/BaseWriteCommandMessage;->writeNamespace:Lcom/mongodb/MongoNamespace;

    return-object v0
.end method

.method protected abstract writeTheWrites(Lorg/bson/io/OutputBuffer;ILcom/mongodb/BSONBinaryWriter;)Lcom/mongodb/BaseWriteCommandMessage;
.end method
