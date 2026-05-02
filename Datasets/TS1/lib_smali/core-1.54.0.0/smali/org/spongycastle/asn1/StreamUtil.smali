.class Lorg/spongycastle/asn1/StreamUtil;
.super Ljava/lang/Object;
.source "StreamUtil.java"


# static fields
.field private static final MAX_MEMORY:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 11
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    sput-wide v0, Lorg/spongycastle/asn1/StreamUtil;->MAX_MEMORY:J

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static calculateBodyLength(I)I
    .registers 6
    .param p0, "length"    # I

    .prologue
    .line 62
    const/4 v0, 0x1

    .line 64
    .local v0, "count":I
    const/16 v4, 0x7f

    if-le p0, v4, :cond_19

    .line 66
    const/4 v2, 0x1

    .line 67
    .local v2, "size":I
    move v3, p0

    .line 69
    .local v3, "val":I
    :goto_7
    ushr-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_e

    .line 71
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 74
    :cond_e
    add-int/lit8 v4, v2, -0x1

    mul-int/lit8 v1, v4, 0x8

    .local v1, "i":I
    :goto_12
    if-ltz v1, :cond_19

    .line 76
    add-int/lit8 v0, v0, 0x1

    .line 74
    add-int/lit8 v1, v1, -0x8

    goto :goto_12

    .line 80
    .end local v1    # "i":I
    .end local v2    # "size":I
    .end local v3    # "val":I
    :cond_19
    return v0
.end method

.method static calculateTagLength(I)I
    .registers 5
    .param p0, "tagNo"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    const/4 v0, 0x1

    .line 88
    .local v0, "length":I
    const/16 v3, 0x1f

    if-lt p0, v3, :cond_b

    .line 90
    const/16 v3, 0x80

    if-ge p0, v3, :cond_c

    .line 92
    add-int/lit8 v0, v0, 0x1

    .line 112
    :cond_b
    :goto_b
    return v0

    .line 96
    :cond_c
    const/4 v3, 0x5

    new-array v2, v3, [B

    .line 97
    .local v2, "stack":[B
    array-length v1, v2

    .line 99
    .local v1, "pos":I
    add-int/lit8 v1, v1, -0x1

    and-int/lit8 v3, p0, 0x7f

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 103
    :cond_17
    shr-int/lit8 p0, p0, 0x7

    .line 104
    add-int/lit8 v1, v1, -0x1

    and-int/lit8 v3, p0, 0x7f

    or-int/lit16 v3, v3, 0x80

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 106
    const/16 v3, 0x7f

    if-gt p0, v3, :cond_17

    .line 108
    array-length v3, v2

    sub-int/2addr v3, v1

    add-int/2addr v0, v3

    goto :goto_b
.end method

.method static findLimit(Ljava/io/InputStream;)I
    .registers 8
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    const-wide/32 v3, 0x7fffffff

    .line 21
    instance-of v5, p0, Lorg/spongycastle/asn1/LimitedInputStream;

    if-eqz v5, :cond_e

    .line 23
    check-cast p0, Lorg/spongycastle/asn1/LimitedInputStream;

    .end local p0    # "in":Ljava/io/InputStream;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/LimitedInputStream;->getRemaining()I

    move-result v3

    .line 56
    .local v0, "channel":Ljava/nio/channels/FileChannel;
    :goto_d
    return v3

    .line 25
    .end local v0    # "channel":Ljava/nio/channels/FileChannel;
    .restart local p0    # "in":Ljava/io/InputStream;
    :cond_e
    instance-of v5, p0, Lorg/spongycastle/asn1/ASN1InputStream;

    if-eqz v5, :cond_19

    .line 27
    check-cast p0, Lorg/spongycastle/asn1/ASN1InputStream;

    .end local p0    # "in":Ljava/io/InputStream;
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1InputStream;->getLimit()I

    move-result v3

    goto :goto_d

    .line 29
    .restart local p0    # "in":Ljava/io/InputStream;
    :cond_19
    instance-of v5, p0, Ljava/io/ByteArrayInputStream;

    if-eqz v5, :cond_24

    .line 31
    check-cast p0, Ljava/io/ByteArrayInputStream;

    .end local p0    # "in":Ljava/io/InputStream;
    invoke-virtual {p0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v3

    goto :goto_d

    .line 33
    .restart local p0    # "in":Ljava/io/InputStream;
    :cond_24
    instance-of v5, p0, Ljava/io/FileInputStream;

    if-eqz v5, :cond_3d

    .line 37
    :try_start_28
    check-cast p0, Ljava/io/FileInputStream;

    .end local p0    # "in":Ljava/io/InputStream;
    invoke-virtual {p0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 38
    .restart local v0    # "channel":Ljava/nio/channels/FileChannel;
    if-eqz v0, :cond_3a

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_33} :catch_3c

    move-result-wide v1

    .line 40
    .local v1, "size":J
    :goto_34
    cmp-long v5, v1, v3

    if-gez v5, :cond_3d

    .line 42
    long-to-int v3, v1

    goto :goto_d

    .end local v1    # "size":J
    :cond_3a
    move-wide v1, v3

    .line 38
    goto :goto_34

    .line 45
    :catch_3c
    move-exception v5

    .line 51
    :cond_3d
    sget-wide v5, Lorg/spongycastle/asn1/StreamUtil;->MAX_MEMORY:J

    cmp-long v3, v5, v3

    if-lez v3, :cond_47

    .line 53
    const v3, 0x7fffffff

    goto :goto_d

    .line 56
    :cond_47
    sget-wide v3, Lorg/spongycastle/asn1/StreamUtil;->MAX_MEMORY:J

    long-to-int v3, v3

    goto :goto_d
.end method
