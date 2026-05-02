.class public Lorg/kore/kolab/notes/Identification;
.super Ljava/lang/Object;
.source "Identification.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final productId:Ljava/lang/String;

.field private final uid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "productId"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    if-eqz p1, :cond_7

    if-nez p2, :cond_f

    .line 32
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "given parameters must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_f
    iput-object p1, p0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 62
    if-ne p0, p1, :cond_5

    .line 86
    :cond_4
    :goto_4
    return v1

    .line 65
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 66
    goto :goto_4

    .line 68
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 69
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 71
    check-cast v0, Lorg/kore/kolab/notes/Identification;

    .line 72
    .local v0, "other":Lorg/kore/kolab/notes/Identification;
    iget-object v3, p0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    if-nez v3, :cond_22

    .line 73
    iget-object v3, v0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    if-eqz v3, :cond_2e

    move v1, v2

    .line 74
    goto :goto_4

    .line 76
    :cond_22
    iget-object v3, p0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    iget-object v4, v0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    move v1, v2

    .line 77
    goto :goto_4

    .line 79
    :cond_2e
    iget-object v3, p0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    if-nez v3, :cond_38

    .line 80
    iget-object v3, v0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    .line 81
    goto :goto_4

    .line 83
    :cond_38
    iget-object v3, p0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    iget-object v4, v0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 84
    goto :goto_4
.end method

.method public getProductId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    return-object v0
.end method

.method public getUid()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 53
    const/16 v0, 0x1f

    .line 54
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 55
    .local v1, "result":I
    iget-object v2, p0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    if-nez v2, :cond_14

    move v2, v3

    :goto_9
    add-int/lit8 v1, v2, 0x1f

    .line 56
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    if-nez v4, :cond_1b

    :goto_11
    add-int v1, v2, v3

    .line 57
    return v1

    .line 55
    :cond_14
    iget-object v2, p0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_9

    .line 56
    :cond_1b
    iget-object v3, p0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    goto :goto_11
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Identification [uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Identification;->uid:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", productId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/Identification;->productId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
