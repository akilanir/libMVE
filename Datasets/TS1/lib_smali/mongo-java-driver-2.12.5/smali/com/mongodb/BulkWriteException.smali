.class public Lcom/mongodb/BulkWriteException;
.super Lcom/mongodb/MongoException;
.source "BulkWriteException.java"


# static fields
.field private static final serialVersionUID:J = -0x14e635c920a3c941L


# instance fields
.field private final serverAddress:Lcom/mongodb/ServerAddress;

.field private final writeConcernError:Lcom/mongodb/WriteConcernError;

.field private final writeErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteError;",
            ">;"
        }
    .end annotation
.end field

.field private final writeResult:Lcom/mongodb/BulkWriteResult;


# direct methods
.method constructor <init>(Lcom/mongodb/BulkWriteResult;Ljava/util/List;Lcom/mongodb/WriteConcernError;Lcom/mongodb/ServerAddress;)V
    .registers 8
    .param p1, "writeResult"    # Lcom/mongodb/BulkWriteResult;
    .param p3, "writeConcernError"    # Lcom/mongodb/WriteConcernError;
    .param p4, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/BulkWriteResult;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteError;",
            ">;",
            "Lcom/mongodb/WriteConcernError;",
            "Lcom/mongodb/ServerAddress;",
            ")V"
        }
    .end annotation

    .prologue
    .line 44
    .local p2, "writeErrors":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/BulkWriteError;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Bulk write operation error on server "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ". "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_39

    const-string v0, ""

    :goto_1d
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez p3, :cond_53

    const-string v0, ""

    :goto_25
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    .line 47
    iput-object p1, p0, Lcom/mongodb/BulkWriteException;->writeResult:Lcom/mongodb/BulkWriteResult;

    .line 48
    iput-object p2, p0, Lcom/mongodb/BulkWriteException;->writeErrors:Ljava/util/List;

    .line 49
    iput-object p3, p0, Lcom/mongodb/BulkWriteException;->writeConcernError:Lcom/mongodb/WriteConcernError;

    .line 50
    iput-object p4, p0, Lcom/mongodb/BulkWriteException;->serverAddress:Lcom/mongodb/ServerAddress;

    .line 51
    return-void

    .line 44
    :cond_39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Write errors: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ". "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d

    :cond_53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Write concern error: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ". "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_25
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 91
    if-ne p0, p1, :cond_5

    .line 113
    :cond_4
    :goto_4
    return v1

    .line 94
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 95
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 98
    check-cast v0, Lcom/mongodb/BulkWriteException;

    .line 100
    .local v0, "that":Lcom/mongodb/BulkWriteException;
    iget-object v3, p0, Lcom/mongodb/BulkWriteException;->writeErrors:Ljava/util/List;

    iget-object v4, v0, Lcom/mongodb/BulkWriteException;->writeErrors:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    move v1, v2

    .line 101
    goto :goto_4

    .line 103
    :cond_22
    iget-object v3, p0, Lcom/mongodb/BulkWriteException;->serverAddress:Lcom/mongodb/ServerAddress;

    iget-object v4, v0, Lcom/mongodb/BulkWriteException;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v3, v4}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    move v1, v2

    .line 104
    goto :goto_4

    .line 106
    :cond_2e
    iget-object v3, p0, Lcom/mongodb/BulkWriteException;->writeConcernError:Lcom/mongodb/WriteConcernError;

    if-eqz v3, :cond_3e

    iget-object v3, p0, Lcom/mongodb/BulkWriteException;->writeConcernError:Lcom/mongodb/WriteConcernError;

    iget-object v4, v0, Lcom/mongodb/BulkWriteException;->writeConcernError:Lcom/mongodb/WriteConcernError;

    invoke-virtual {v3, v4}, Lcom/mongodb/WriteConcernError;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_42

    :cond_3c
    move v1, v2

    .line 107
    goto :goto_4

    .line 106
    :cond_3e
    iget-object v3, v0, Lcom/mongodb/BulkWriteException;->writeConcernError:Lcom/mongodb/WriteConcernError;

    if-nez v3, :cond_3c

    .line 109
    :cond_42
    iget-object v3, p0, Lcom/mongodb/BulkWriteException;->writeResult:Lcom/mongodb/BulkWriteResult;

    iget-object v4, v0, Lcom/mongodb/BulkWriteException;->writeResult:Lcom/mongodb/BulkWriteResult;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 110
    goto :goto_4
.end method

.method public getServerAddress()Lcom/mongodb/ServerAddress;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/mongodb/BulkWriteException;->serverAddress:Lcom/mongodb/ServerAddress;

    return-object v0
.end method

.method public getWriteConcernError()Lcom/mongodb/WriteConcernError;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/mongodb/BulkWriteException;->writeConcernError:Lcom/mongodb/WriteConcernError;

    return-object v0
.end method

.method public getWriteErrors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteError;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lcom/mongodb/BulkWriteException;->writeErrors:Ljava/util/List;

    return-object v0
.end method

.method public getWriteResult()Lcom/mongodb/BulkWriteResult;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/mongodb/BulkWriteException;->writeResult:Lcom/mongodb/BulkWriteResult;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 118
    iget-object v1, p0, Lcom/mongodb/BulkWriteException;->writeResult:Lcom/mongodb/BulkWriteResult;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 119
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/BulkWriteException;->writeErrors:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 120
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/BulkWriteException;->serverAddress:Lcom/mongodb/ServerAddress;

    invoke-virtual {v2}, Lcom/mongodb/ServerAddress;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 121
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lcom/mongodb/BulkWriteException;->writeConcernError:Lcom/mongodb/WriteConcernError;

    if-eqz v1, :cond_29

    iget-object v1, p0, Lcom/mongodb/BulkWriteException;->writeConcernError:Lcom/mongodb/WriteConcernError;

    invoke-virtual {v1}, Lcom/mongodb/WriteConcernError;->hashCode()I

    move-result v1

    :goto_26
    add-int v0, v2, v1

    .line 122
    return v0

    .line 121
    :cond_29
    const/4 v1, 0x0

    goto :goto_26
.end method
