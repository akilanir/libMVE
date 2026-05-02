.class public Lorg/kore/kolab/notes/AuditInformation;
.super Ljava/lang/Object;
.source "AuditInformation.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/kore/kolab/notes/AuditInformation;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private creationDate:Ljava/sql/Timestamp;

.field private lastModificationDate:Ljava/sql/Timestamp;


# direct methods
.method public constructor <init>(Ljava/sql/Timestamp;Ljava/sql/Timestamp;)V
    .registers 6
    .param p1, "creationDate"    # Ljava/sql/Timestamp;
    .param p2, "lastModificationDate"    # Ljava/sql/Timestamp;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    if-eqz p1, :cond_7

    if-nez p2, :cond_f

    .line 33
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "given parameters must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_f
    new-instance v0, Ljava/sql/Timestamp;

    invoke-virtual {p1}, Ljava/sql/Timestamp;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/sql/Timestamp;-><init>(J)V

    iput-object v0, p0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    .line 36
    new-instance v0, Ljava/sql/Timestamp;

    invoke-virtual {p2}, Ljava/sql/Timestamp;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/sql/Timestamp;-><init>(J)V

    iput-object v0, p0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    .line 37
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 26
    check-cast p1, Lorg/kore/kolab/notes/AuditInformation;

    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/AuditInformation;->compareTo(Lorg/kore/kolab/notes/AuditInformation;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/kore/kolab/notes/AuditInformation;)I
    .registers 5
    .param p1, "o"    # Lorg/kore/kolab/notes/AuditInformation;

    .prologue
    .line 100
    invoke-virtual {p0}, Lorg/kore/kolab/notes/AuditInformation;->getLastModificationDate()Ljava/sql/Timestamp;

    move-result-object v1

    invoke-virtual {p1}, Lorg/kore/kolab/notes/AuditInformation;->getLastModificationDate()Ljava/sql/Timestamp;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/sql/Timestamp;->compareTo(Ljava/sql/Timestamp;)I

    move-result v0

    .line 101
    .local v0, "first":I
    if-nez v0, :cond_1a

    invoke-virtual {p0}, Lorg/kore/kolab/notes/AuditInformation;->getCreationDate()Ljava/sql/Timestamp;

    move-result-object v1

    invoke-virtual {p1}, Lorg/kore/kolab/notes/AuditInformation;->getCreationDate()Ljava/sql/Timestamp;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/sql/Timestamp;->compareTo(Ljava/sql/Timestamp;)I

    move-result v0

    .end local v0    # "first":I
    :cond_1a
    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 66
    if-ne p0, p1, :cond_5

    .line 90
    :cond_4
    :goto_4
    return v1

    .line 69
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 70
    goto :goto_4

    .line 72
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 73
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 75
    check-cast v0, Lorg/kore/kolab/notes/AuditInformation;

    .line 76
    .local v0, "other":Lorg/kore/kolab/notes/AuditInformation;
    iget-object v3, p0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    if-nez v3, :cond_22

    .line 77
    iget-object v3, v0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    if-eqz v3, :cond_2e

    move v1, v2

    .line 78
    goto :goto_4

    .line 80
    :cond_22
    iget-object v3, p0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    iget-object v4, v0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    invoke-virtual {v3, v4}, Ljava/sql/Timestamp;->equals(Ljava/sql/Timestamp;)Z

    move-result v3

    if-nez v3, :cond_2e

    move v1, v2

    .line 81
    goto :goto_4

    .line 83
    :cond_2e
    iget-object v3, p0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    if-nez v3, :cond_38

    .line 84
    iget-object v3, v0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    if-eqz v3, :cond_4

    move v1, v2

    .line 85
    goto :goto_4

    .line 87
    :cond_38
    iget-object v3, p0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    iget-object v4, v0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    invoke-virtual {v3, v4}, Ljava/sql/Timestamp;->equals(Ljava/sql/Timestamp;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 88
    goto :goto_4
.end method

.method public getCreationDate()Ljava/sql/Timestamp;
    .registers 4

    .prologue
    .line 40
    new-instance v0, Ljava/sql/Timestamp;

    iget-object v1, p0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    invoke-virtual {v1}, Ljava/sql/Timestamp;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/sql/Timestamp;-><init>(J)V

    return-object v0
.end method

.method public getLastModificationDate()Ljava/sql/Timestamp;
    .registers 4

    .prologue
    .line 44
    new-instance v0, Ljava/sql/Timestamp;

    iget-object v1, p0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    invoke-virtual {v1}, Ljava/sql/Timestamp;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/sql/Timestamp;-><init>(J)V

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 57
    const/16 v0, 0x1f

    .line 58
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 59
    .local v1, "result":I
    iget-object v2, p0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    if-nez v2, :cond_14

    move v2, v3

    :goto_9
    add-int/lit8 v1, v2, 0x1f

    .line 60
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    if-nez v4, :cond_1b

    :goto_11
    add-int v1, v2, v3

    .line 61
    return v1

    .line 59
    :cond_14
    iget-object v2, p0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    invoke-virtual {v2}, Ljava/sql/Timestamp;->hashCode()I

    move-result v2

    goto :goto_9

    .line 60
    :cond_1b
    iget-object v3, p0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    invoke-virtual {v3}, Ljava/sql/Timestamp;->hashCode()I

    move-result v3

    goto :goto_11
.end method

.method public setCreationDate(J)V
    .registers 4
    .param p1, "millis"    # J

    .prologue
    .line 52
    new-instance v0, Ljava/sql/Timestamp;

    invoke-direct {v0, p1, p2}, Ljava/sql/Timestamp;-><init>(J)V

    iput-object v0, p0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    .line 53
    return-void
.end method

.method public setLastModificationDate(J)V
    .registers 4
    .param p1, "millis"    # J

    .prologue
    .line 48
    new-instance v0, Ljava/sql/Timestamp;

    invoke-direct {v0, p1, p2}, Ljava/sql/Timestamp;-><init>(J)V

    iput-object v0, p0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    .line 49
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Audit [creationDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/AuditInformation;->creationDate:Ljava/sql/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", lastModificationDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/AuditInformation;->lastModificationDate:Ljava/sql/Timestamp;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
