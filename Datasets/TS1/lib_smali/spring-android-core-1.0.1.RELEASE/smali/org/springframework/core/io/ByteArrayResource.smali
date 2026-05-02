.class public Lorg/springframework/core/io/ByteArrayResource;
.super Lorg/springframework/core/io/AbstractResource;
.source "ByteArrayResource.java"


# instance fields
.field private final byteArray:[B

.field private final description:Ljava/lang/String;


# direct methods
.method public constructor <init>([B)V
    .registers 3
    .param p1, "byteArray"    # [B

    .prologue
    .line 48
    const-string v0, "resource loaded from byte array"

    invoke-direct {p0, p1, v0}, Lorg/springframework/core/io/ByteArrayResource;-><init>([BLjava/lang/String;)V

    .line 49
    return-void
.end method

.method public constructor <init>([BLjava/lang/String;)V
    .registers 5
    .param p1, "byteArray"    # [B
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/springframework/core/io/AbstractResource;-><init>()V

    .line 57
    if-nez p1, :cond_d

    .line 58
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Byte array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_d
    iput-object p1, p0, Lorg/springframework/core/io/ByteArrayResource;->byteArray:[B

    .line 61
    if-eqz p2, :cond_14

    .end local p2    # "description":Ljava/lang/String;
    :goto_11
    iput-object p2, p0, Lorg/springframework/core/io/ByteArrayResource;->description:Ljava/lang/String;

    .line 62
    return-void

    .line 61
    .restart local p2    # "description":Ljava/lang/String;
    :cond_14
    const-string p2, ""

    goto :goto_11
.end method


# virtual methods
.method public contentLength()J
    .registers 3

    .prologue
    .line 85
    iget-object v0, p0, Lorg/springframework/core/io/ByteArrayResource;->byteArray:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 110
    if-eq p1, p0, :cond_12

    instance-of v0, p1, Lorg/springframework/core/io/ByteArrayResource;

    if-eqz v0, :cond_14

    check-cast p1, Lorg/springframework/core/io/ByteArrayResource;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-object v0, p1, Lorg/springframework/core/io/ByteArrayResource;->byteArray:[B

    iget-object v1, p0, Lorg/springframework/core/io/ByteArrayResource;->byteArray:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public exists()Z
    .registers 2

    .prologue
    .line 77
    const/4 v0, 0x1

    return v0
.end method

.method public final getByteArray()[B
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lorg/springframework/core/io/ByteArrayResource;->byteArray:[B

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lorg/springframework/core/io/ByteArrayResource;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/springframework/core/io/ByteArrayResource;->byteArray:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 118
    const-class v0, [B

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1d

    iget-object v1, p0, Lorg/springframework/core/io/ByteArrayResource;->byteArray:[B

    array-length v1, v1

    mul-int/2addr v0, v1

    return v0
.end method
