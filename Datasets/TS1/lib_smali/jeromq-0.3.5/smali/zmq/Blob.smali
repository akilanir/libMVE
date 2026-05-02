.class public Lzmq/Blob;
.super Ljava/lang/Object;
.source "Blob.java"


# instance fields
.field private final buf:[B


# direct methods
.method private constructor <init>([B)V
    .registers 2
    .param p1, "data"    # [B

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lzmq/Blob;->buf:[B

    .line 31
    return-void
.end method

.method public static createBlob([BZ)Lzmq/Blob;
    .registers 5
    .param p0, "data"    # [B
    .param p1, "copy"    # Z

    .prologue
    const/4 v2, 0x0

    .line 35
    if-eqz p1, :cond_10

    .line 36
    array-length v1, p0

    new-array v0, v1, [B

    .line 37
    .local v0, "b":[B
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    new-instance v1, Lzmq/Blob;

    invoke-direct {v1, v0}, Lzmq/Blob;-><init>([B)V

    .line 41
    .end local v0    # "b":[B
    :goto_f
    return-object v1

    :cond_10
    new-instance v1, Lzmq/Blob;

    invoke-direct {v1, p0}, Lzmq/Blob;-><init>([B)V

    goto :goto_f
.end method


# virtual methods
.method public data()[B
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lzmq/Blob;->buf:[B

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "t"    # Ljava/lang/Object;

    .prologue
    .line 58
    instance-of v0, p1, Lzmq/Blob;

    if-eqz v0, :cond_f

    .line 59
    iget-object v0, p0, Lzmq/Blob;->buf:[B

    check-cast p1, Lzmq/Blob;

    .end local p1    # "t":Ljava/lang/Object;
    iget-object v1, p1, Lzmq/Blob;->buf:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    .line 61
    :goto_e
    return v0

    .restart local p1    # "t":Ljava/lang/Object;
    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lzmq/Blob;->buf:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lzmq/Blob;->buf:[B

    array-length v0, v0

    return v0
.end method
