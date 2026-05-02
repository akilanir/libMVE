.class public Lorg/bson/types/Binary;
.super Ljava/lang/Object;
.source "Binary.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x6dad165878699ebbL


# instance fields
.field final _data:[B

.field final _type:B


# direct methods
.method public constructor <init>(B[B)V
    .registers 3
    .param p1, "type"    # B
    .param p2, "data"    # [B

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-byte p1, p0, Lorg/bson/types/Binary;->_type:B

    .line 50
    iput-object p2, p0, Lorg/bson/types/Binary;->_data:[B

    .line 51
    return-void
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/bson/types/Binary;-><init>(B[B)V

    .line 40
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 67
    if-ne p0, p1, :cond_5

    .line 83
    :cond_4
    :goto_4
    return v1

    .line 70
    :cond_5
    instance-of v3, p1, Lorg/bson/types/Binary;

    if-nez v3, :cond_b

    move v1, v2

    .line 71
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 74
    check-cast v0, Lorg/bson/types/Binary;

    .line 76
    .local v0, "binary":Lorg/bson/types/Binary;
    iget-byte v3, p0, Lorg/bson/types/Binary;->_type:B

    iget-byte v4, v0, Lorg/bson/types/Binary;->_type:B

    if-eq v3, v4, :cond_16

    move v1, v2

    .line 77
    goto :goto_4

    .line 79
    :cond_16
    iget-object v3, p0, Lorg/bson/types/Binary;->_data:[B

    iget-object v4, v0, Lorg/bson/types/Binary;->_data:[B

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 80
    goto :goto_4
.end method

.method public getData()[B
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lorg/bson/types/Binary;->_data:[B

    return-object v0
.end method

.method public getType()B
    .registers 2

    .prologue
    .line 54
    iget-byte v0, p0, Lorg/bson/types/Binary;->_type:B

    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 88
    iget-byte v0, p0, Lorg/bson/types/Binary;->_type:B

    .line 89
    .local v0, "result":I
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lorg/bson/types/Binary;->_data:[B

    if-eqz v1, :cond_11

    iget-object v1, p0, Lorg/bson/types/Binary;->_data:[B

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v1

    :goto_e
    add-int v0, v2, v1

    .line 90
    return v0

    .line 89
    :cond_11
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public length()I
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lorg/bson/types/Binary;->_data:[B

    array-length v0, v0

    return v0
.end method
