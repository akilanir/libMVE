.class Lcom/mongodb/UnacknowledgedBulkWriteResult;
.super Lcom/mongodb/BulkWriteResult;
.source "UnacknowledgedBulkWriteResult.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/mongodb/BulkWriteResult;-><init>()V

    .line 24
    return-void
.end method

.method private getUnacknowledgedWriteException()Lcom/mongodb/UnacknowledgedWriteException;
    .registers 3

    .prologue
    .line 62
    new-instance v0, Lcom/mongodb/UnacknowledgedWriteException;

    const-string v1, "Can not get information about an unacknowledged write"

    invoke-direct {v0, v1}, Lcom/mongodb/UnacknowledgedWriteException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 67
    if-ne p0, p1, :cond_4

    .line 74
    :cond_3
    :goto_3
    return v0

    .line 70
    :cond_4
    if-eqz p1, :cond_10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_3

    .line 71
    :cond_10
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public getInsertedCount()I
    .registers 2

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/mongodb/UnacknowledgedBulkWriteResult;->getUnacknowledgedWriteException()Lcom/mongodb/UnacknowledgedWriteException;

    move-result-object v0

    throw v0
.end method

.method public getMatchedCount()I
    .registers 2

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/mongodb/UnacknowledgedBulkWriteResult;->getUnacknowledgedWriteException()Lcom/mongodb/UnacknowledgedWriteException;

    move-result-object v0

    throw v0
.end method

.method public getModifiedCount()I
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/mongodb/UnacknowledgedBulkWriteResult;->getUnacknowledgedWriteException()Lcom/mongodb/UnacknowledgedWriteException;

    move-result-object v0

    throw v0
.end method

.method public getRemovedCount()I
    .registers 2

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/mongodb/UnacknowledgedBulkWriteResult;->getUnacknowledgedWriteException()Lcom/mongodb/UnacknowledgedWriteException;

    move-result-object v0

    throw v0
.end method

.method public getUpserts()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/mongodb/UnacknowledgedBulkWriteResult;->getUnacknowledgedWriteException()Lcom/mongodb/UnacknowledgedWriteException;

    move-result-object v0

    throw v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 79
    const/4 v0, 0x0

    return v0
.end method

.method public isAcknowledged()Z
    .registers 2

    .prologue
    .line 28
    const/4 v0, 0x0

    return v0
.end method

.method public isModifiedCountAvailable()Z
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/mongodb/UnacknowledgedBulkWriteResult;->getUnacknowledgedWriteException()Lcom/mongodb/UnacknowledgedWriteException;

    move-result-object v0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    const-string v0, "UnacknowledgedBulkWriteResult{}"

    return-object v0
.end method
