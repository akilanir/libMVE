.class public Lcom/mongodb/WriteConcernError;
.super Ljava/lang/Object;
.source "WriteConcernError.java"


# instance fields
.field private final code:I

.field private final details:Lcom/mongodb/DBObject;

.field private final message:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/mongodb/DBObject;)V
    .registers 5
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "details"    # Lcom/mongodb/DBObject;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p1, p0, Lcom/mongodb/WriteConcernError;->code:I

    .line 41
    const-string v0, "message"

    invoke-static {v0, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/mongodb/WriteConcernError;->message:Ljava/lang/String;

    .line 42
    const-string v0, "details"

    invoke-static {v0, p3}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    iput-object v0, p0, Lcom/mongodb/WriteConcernError;->details:Lcom/mongodb/DBObject;

    .line 43
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 74
    if-ne p0, p1, :cond_5

    .line 93
    :cond_4
    :goto_4
    return v1

    .line 77
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 78
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 81
    check-cast v0, Lcom/mongodb/WriteConcernError;

    .line 83
    .local v0, "that":Lcom/mongodb/WriteConcernError;
    iget v3, p0, Lcom/mongodb/WriteConcernError;->code:I

    iget v4, v0, Lcom/mongodb/WriteConcernError;->code:I

    if-eq v3, v4, :cond_1e

    move v1, v2

    .line 84
    goto :goto_4

    .line 86
    :cond_1e
    iget-object v3, p0, Lcom/mongodb/WriteConcernError;->details:Lcom/mongodb/DBObject;

    iget-object v4, v0, Lcom/mongodb/WriteConcernError;->details:Lcom/mongodb/DBObject;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    move v1, v2

    .line 87
    goto :goto_4

    .line 89
    :cond_2a
    iget-object v3, p0, Lcom/mongodb/WriteConcernError;->message:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/WriteConcernError;->message:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 90
    goto :goto_4
.end method

.method public getCode()I
    .registers 2

    .prologue
    .line 51
    iget v0, p0, Lcom/mongodb/WriteConcernError;->code:I

    return v0
.end method

.method public getDetails()Lcom/mongodb/DBObject;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mongodb/WriteConcernError;->details:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/mongodb/WriteConcernError;->message:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 98
    iget v0, p0, Lcom/mongodb/WriteConcernError;->code:I

    .line 99
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/WriteConcernError;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 100
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/WriteConcernError;->details:Lcom/mongodb/DBObject;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 101
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BulkWriteConcernError{code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/WriteConcernError;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", message=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/WriteConcernError;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", details="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/WriteConcernError;->details:Lcom/mongodb/DBObject;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
