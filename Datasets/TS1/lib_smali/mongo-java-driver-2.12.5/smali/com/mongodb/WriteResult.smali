.class public Lcom/mongodb/WriteResult;
.super Ljava/lang/Object;
.source "WriteResult.java"


# instance fields
.field private final _db:Lcom/mongodb/DB;

.field private _lastCall:J

.field private _lastConcern:Lcom/mongodb/WriteConcern;

.field private _lastErrorResult:Lcom/mongodb/CommandResult;

.field private final _lazy:Z

.field private final _port:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/CommandResult;Lcom/mongodb/WriteConcern;)V
    .registers 5
    .param p1, "o"    # Lcom/mongodb/CommandResult;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    const/4 v1, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    .line 35
    iput-object p2, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/WriteResult;->_lazy:Z

    .line 37
    iput-object v1, p0, Lcom/mongodb/WriteResult;->_port:Lcom/mongodb/DBPort;

    .line 38
    iput-object v1, p0, Lcom/mongodb/WriteResult;->_db:Lcom/mongodb/DB;

    .line 39
    return-void
.end method

.method constructor <init>(Lcom/mongodb/DB;Lcom/mongodb/DBPort;Lcom/mongodb/WriteConcern;)V
    .registers 6
    .param p1, "db"    # Lcom/mongodb/DB;
    .param p2, "p"    # Lcom/mongodb/DBPort;
    .param p3, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/mongodb/WriteResult;->_db:Lcom/mongodb/DB;

    .line 43
    iput-object p2, p0, Lcom/mongodb/WriteResult;->_port:Lcom/mongodb/DBPort;

    .line 44
    invoke-virtual {p2}, Lcom/mongodb/DBPort;->getUsageCount()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/WriteResult;->_lastCall:J

    .line 45
    iput-object p3, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/WriteResult;->_lazy:Z

    .line 47
    return-void
.end method


# virtual methods
.method public getCachedLastError()Lcom/mongodb/CommandResult;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    return-object v0
.end method

.method public getError()Ljava/lang/String;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 143
    const-string v1, "err"

    invoke-virtual {p0, v1}, Lcom/mongodb/WriteResult;->getField(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 144
    .local v0, "foo":Ljava/lang/Object;
    if-nez v0, :cond_a

    .line 145
    const/4 v1, 0x0

    .line 146
    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_9
.end method

.method public getField(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 196
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getLastConcern()Lcom/mongodb/WriteConcern;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method public declared-synchronized getLastError()Lcom/mongodb/CommandResult;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 88
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, v0}, Lcom/mongodb/WriteResult;->getLastError(Lcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_8

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLastError(Lcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;
    .registers 8
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 106
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    if-eqz v1, :cond_1b

    .line 108
    if-eqz p1, :cond_17

    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    if-eqz v1, :cond_1b

    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v1}, Lcom/mongodb/WriteConcern;->getW()I

    move-result v1

    invoke-virtual {p1}, Lcom/mongodb/WriteConcern;->getW()I

    move-result v2

    if-lt v1, v2, :cond_1b

    .line 109
    :cond_17
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_3e

    .line 129
    :goto_19
    monitor-exit p0

    return-object v1

    .line 113
    :cond_1b
    :try_start_1b
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_port:Lcom/mongodb/DBPort;
    :try_end_1d
    .catchall {:try_start_1b .. :try_end_1d} :catchall_3e

    if-eqz v1, :cond_5a

    .line 115
    :try_start_1f
    iget-object v2, p0, Lcom/mongodb/WriteResult;->_port:Lcom/mongodb/DBPort;

    iget-object v3, p0, Lcom/mongodb/WriteResult;->_db:Lcom/mongodb/DB;

    iget-wide v4, p0, Lcom/mongodb/WriteResult;->_lastCall:J

    if-nez p1, :cond_41

    new-instance v1, Lcom/mongodb/WriteConcern;

    invoke-direct {v1}, Lcom/mongodb/WriteConcern;-><init>()V

    :goto_2c
    invoke-virtual {v2, v3, v4, v5, v1}, Lcom/mongodb/DBPort;->tryGetLastError(Lcom/mongodb/DB;JLcom/mongodb/WriteConcern;)Lcom/mongodb/CommandResult;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_32} :catch_43
    .catchall {:try_start_1f .. :try_end_32} :catchall_3e

    .line 120
    :try_start_32
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    if-nez v1, :cond_4e

    .line 121
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "The connection may have been used since this write, cannot obtain a result"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_3e
    .catchall {:try_start_32 .. :try_end_3e} :catchall_3e

    .line 106
    :catchall_3e
    move-exception v1

    monitor-exit p0

    throw v1

    :cond_41
    move-object v1, p1

    .line 115
    goto :goto_2c

    .line 116
    :catch_43
    move-exception v0

    .line 117
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_44
    new-instance v1, Lcom/mongodb/MongoException$Network;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v1

    .line 122
    .end local v0    # "ioe":Ljava/io/IOException;
    :cond_4e
    iput-object p1, p0, Lcom/mongodb/WriteResult;->_lastConcern:Lcom/mongodb/WriteConcern;

    .line 123
    iget-wide v1, p0, Lcom/mongodb/WriteResult;->_lastCall:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/mongodb/WriteResult;->_lastCall:J

    .line 129
    iget-object v1, p0, Lcom/mongodb/WriteResult;->_lastErrorResult:Lcom/mongodb/CommandResult;

    goto :goto_19

    .line 126
    :cond_5a
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Don\'t have a port to obtain a write result, and existing one is not good enough."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_62
    .catchall {:try_start_44 .. :try_end_62} :catchall_3e
.end method

.method public getN()I
    .registers 3

    .prologue
    .line 156
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    const-string v1, "n"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getUpsertedId()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 167
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    const-string v1, "upserted"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isLazy()Z
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 206
    iget-boolean v0, p0, Lcom/mongodb/WriteResult;->_lazy:Z

    return v0
.end method

.method public isUpdateOfExisting()Z
    .registers 3

    .prologue
    .line 178
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    const-string v1, "updatedExisting"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 211
    invoke-virtual {p0}, Lcom/mongodb/WriteResult;->getCachedLastError()Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 212
    .local v0, "res":Lcom/mongodb/CommandResult;
    if-eqz v0, :cond_b

    .line 213
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->toString()Ljava/lang/String;

    move-result-object v1

    .line 214
    :goto_a
    return-object v1

    :cond_b
    const-string v1, "N/A"

    goto :goto_a
.end method
