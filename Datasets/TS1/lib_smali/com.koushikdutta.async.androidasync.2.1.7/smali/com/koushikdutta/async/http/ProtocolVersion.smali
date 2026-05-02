.class public Lcom/koushikdutta/async/http/ProtocolVersion;
.super Ljava/lang/Object;
.source "ProtocolVersion.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final serialVersionUID:J = 0x7c37246eac22717cL


# instance fields
.field protected final major:I

.field protected final minor:I

.field protected final protocol:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .registers 6
    .param p1, "protocol"    # Ljava/lang/String;
    .param p2, "major"    # I
    .param p3, "minor"    # I

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    if-nez p1, :cond_d

    .line 79
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Protocol name must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_d
    if-gez p2, :cond_17

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Protocol major version number must not be negative."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_17
    if-gez p3, :cond_21

    .line 87
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Protocol minor version number may not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_21
    iput-object p1, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    .line 91
    iput p2, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->major:I

    .line 92
    iput p3, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->minor:I

    .line 93
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 283
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public compareToVersion(Lcom/koushikdutta/async/http/ProtocolVersion;)I
    .registers 6
    .param p1, "that"    # Lcom/koushikdutta/async/http/ProtocolVersion;

    .prologue
    .line 219
    if-nez p1, :cond_a

    .line 220
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Protocol version must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 223
    :cond_a
    iget-object v1, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    iget-object v2, p1, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_37

    .line 224
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Versions for different protocols cannot be compared. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 229
    :cond_37
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/ProtocolVersion;->getMajor()I

    move-result v1

    invoke-virtual {p1}, Lcom/koushikdutta/async/http/ProtocolVersion;->getMajor()I

    move-result v2

    sub-int v0, v1, v2

    .line 230
    .local v0, "delta":I
    if-nez v0, :cond_4d

    .line 231
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/ProtocolVersion;->getMinor()I

    move-result v1

    invoke-virtual {p1}, Lcom/koushikdutta/async/http/ProtocolVersion;->getMinor()I

    move-result v2

    sub-int v0, v1, v2

    .line 233
    :cond_4d
    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 173
    if-ne p0, p1, :cond_5

    .line 181
    :cond_4
    :goto_4
    return v1

    .line 176
    :cond_5
    instance-of v3, p1, Lcom/koushikdutta/async/http/ProtocolVersion;

    if-nez v3, :cond_b

    move v1, v2

    .line 177
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 179
    check-cast v0, Lcom/koushikdutta/async/http/ProtocolVersion;

    .line 181
    .local v0, "that":Lcom/koushikdutta/async/http/ProtocolVersion;
    iget-object v3, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    iget-object v4, v0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    iget v3, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->major:I

    iget v4, v0, Lcom/koushikdutta/async/http/ProtocolVersion;->major:I

    if-ne v3, v4, :cond_24

    iget v3, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->minor:I

    iget v4, v0, Lcom/koushikdutta/async/http/ProtocolVersion;->minor:I

    if-eq v3, v4, :cond_4

    :cond_24
    move v1, v2

    goto :goto_4
.end method

.method public forVersion(II)Lcom/koushikdutta/async/http/ProtocolVersion;
    .registers 5
    .param p1, "major"    # I
    .param p2, "minor"    # I

    .prologue
    .line 140
    iget v0, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->major:I

    if-ne p1, v0, :cond_9

    iget v0, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->minor:I

    if-ne p2, v0, :cond_9

    .line 145
    .end local p0    # "this":Lcom/koushikdutta/async/http/ProtocolVersion;
    :goto_8
    return-object p0

    .restart local p0    # "this":Lcom/koushikdutta/async/http/ProtocolVersion;
    :cond_9
    new-instance v0, Lcom/koushikdutta/async/http/ProtocolVersion;

    iget-object v1, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    invoke-direct {v0, v1, p1, p2}, Lcom/koushikdutta/async/http/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    move-object p0, v0

    goto :goto_8
.end method

.method public final getMajor()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->major:I

    return v0
.end method

.method public final getMinor()I
    .registers 2

    .prologue
    .line 119
    iget v0, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->minor:I

    return v0
.end method

.method public final getProtocol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    return-object v0
.end method

.method public final greaterEquals(Lcom/koushikdutta/async/http/ProtocolVersion;)Z
    .registers 3
    .param p1, "version"    # Lcom/koushikdutta/async/http/ProtocolVersion;

    .prologue
    .line 248
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/ProtocolVersion;->isComparable(Lcom/koushikdutta/async/http/ProtocolVersion;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/ProtocolVersion;->compareToVersion(Lcom/koushikdutta/async/http/ProtocolVersion;)I

    move-result v0

    if-ltz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public final hashCode()I
    .registers 4

    .prologue
    .line 155
    iget-object v0, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->major:I

    const v2, 0x186a0

    mul-int/2addr v1, v2

    xor-int/2addr v0, v1

    iget v1, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->minor:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public isComparable(Lcom/koushikdutta/async/http/ProtocolVersion;)Z
    .registers 4
    .param p1, "that"    # Lcom/koushikdutta/async/http/ProtocolVersion;

    .prologue
    .line 198
    if-eqz p1, :cond_e

    iget-object v0, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    iget-object v1, p1, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public final lessEquals(Lcom/koushikdutta/async/http/ProtocolVersion;)Z
    .registers 3
    .param p1, "version"    # Lcom/koushikdutta/async/http/ProtocolVersion;

    .prologue
    .line 263
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/ProtocolVersion;->isComparable(Lcom/koushikdutta/async/http/ProtocolVersion;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/ProtocolVersion;->compareToVersion(Lcom/koushikdutta/async/http/ProtocolVersion;)I

    move-result v0

    if-gtz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 273
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 274
    .local v0, "buffer":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->protocol:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 276
    iget v1, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->major:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 278
    iget v1, p0, Lcom/koushikdutta/async/http/ProtocolVersion;->minor:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
