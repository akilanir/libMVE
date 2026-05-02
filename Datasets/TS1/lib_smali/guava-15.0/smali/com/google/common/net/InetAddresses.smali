.class public final Lcom/google/common/net/InetAddresses;
.super Ljava/lang/Object;
.source "InetAddresses.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/net/InetAddresses$TeredoInfo;
    }
.end annotation


# static fields
.field private static final ANY4:Ljava/net/Inet4Address;

.field private static final IPV4_PART_COUNT:I = 0x4

.field private static final IPV6_PART_COUNT:I = 0x8

.field private static final LOOPBACK4:Ljava/net/Inet4Address;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 117
    const-string v0, "127.0.0.1"

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->forString(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    sput-object v0, Lcom/google/common/net/InetAddresses;->LOOPBACK4:Ljava/net/Inet4Address;

    .line 118
    const-string v0, "0.0.0.0"

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->forString(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    sput-object v0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/net/Inet4Address;
    .registers 1

    .prologue
    .line 114
    sget-object v0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    return-object v0
.end method

.method private static bytesToInetAddress([B)Ljava/net/InetAddress;
    .registers 3
    .param p0, "addr"    # [B

    .prologue
    .line 331
    :try_start_0
    invoke-static {p0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;
    :try_end_3
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 332
    :catch_5
    move-exception v0

    .line 333
    .local v0, "e":Ljava/net/UnknownHostException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public static coerceToInteger(Ljava/net/InetAddress;)I
    .registers 2
    .param p0, "ip"    # Ljava/net/InetAddress;

    .prologue
    .line 938
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getCoercedIPv4Address(Ljava/net/InetAddress;)Ljava/net/Inet4Address;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->newDataInput([B)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/io/ByteArrayDataInput;->readInt()I

    move-result v0

    return v0
.end method

.method private static compressLongestRunOfZeroes([I)V
    .registers 8
    .param p0, "hextets"    # [I

    .prologue
    .line 381
    const/4 v1, -0x1

    .line 382
    .local v1, "bestRunStart":I
    const/4 v0, -0x1

    .line 383
    .local v0, "bestRunLength":I
    const/4 v4, -0x1

    .line 384
    .local v4, "runStart":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    array-length v5, p0

    add-int/lit8 v5, v5, 0x1

    if-ge v2, v5, :cond_20

    .line 385
    array-length v5, p0

    if-ge v2, v5, :cond_16

    aget v5, p0, v2

    if-nez v5, :cond_16

    .line 386
    if-gez v4, :cond_13

    .line 387
    move v4, v2

    .line 384
    :cond_13
    :goto_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 389
    :cond_16
    if-ltz v4, :cond_13

    .line 390
    sub-int v3, v2, v4

    .line 391
    .local v3, "runLength":I
    if-le v3, v0, :cond_1e

    .line 392
    move v1, v4

    .line 393
    move v0, v3

    .line 395
    :cond_1e
    const/4 v4, -0x1

    goto :goto_13

    .line 398
    .end local v3    # "runLength":I
    :cond_20
    const/4 v5, 0x2

    if-lt v0, v5, :cond_29

    .line 399
    add-int v5, v1, v0

    const/4 v6, -0x1

    invoke-static {p0, v1, v5, v6}, Ljava/util/Arrays;->fill([IIII)V

    .line 401
    :cond_29
    return-void
.end method

.method private static convertDottedQuadToHex(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "ipString"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 286
    const/16 v6, 0x3a

    invoke-virtual {p0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 287
    .local v2, "lastColon":I
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 288
    .local v1, "initialPart":Ljava/lang/String;
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 289
    .local v0, "dottedQuad":Ljava/lang/String;
    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV4(Ljava/lang/String;)[B

    move-result-object v4

    .line 290
    .local v4, "quad":[B
    if-nez v4, :cond_1b

    .line 291
    const/4 v6, 0x0

    .line 295
    :goto_1a
    return-object v6

    .line 293
    :cond_1b
    aget-byte v6, v4, v7

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    const/4 v7, 0x1

    aget-byte v7, v4, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    .line 294
    .local v3, "penultimate":Ljava/lang/String;
    const/4 v6, 0x2

    aget-byte v6, v4, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    const/4 v7, 0x3

    aget-byte v7, v4, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    .line 295
    .local v5, "ultimate":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1a
.end method

.method public static forString(Ljava/lang/String;)Ljava/net/InetAddress;
    .registers 6
    .param p0, "ipString"    # Ljava/lang/String;

    .prologue
    .line 149
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 152
    .local v0, "addr":[B
    if-nez v0, :cond_18

    .line 153
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'%s\' is not an IP string literal."

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 157
    :cond_18
    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([B)Ljava/net/InetAddress;

    move-result-object v1

    return-object v1
.end method

.method public static forUriString(Ljava/lang/String;)Ljava/net/InetAddress;
    .registers 8
    .param p0, "hostAddr"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 485
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    const-string v3, "["

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3a

    const-string v3, "]"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 491
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 492
    .local v2, "ipString":Ljava/lang/String;
    const/16 v1, 0x10

    .line 499
    .local v1, "expectBytes":I
    :goto_20
    invoke-static {v2}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 500
    .local v0, "addr":[B
    if-eqz v0, :cond_29

    array-length v3, v0

    if-eq v3, v1, :cond_3d

    .line 501
    :cond_29
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Not a valid URI IP literal: \'%s\'"

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 494
    .end local v0    # "addr":[B
    .end local v1    # "expectBytes":I
    .end local v2    # "ipString":Ljava/lang/String;
    :cond_3a
    move-object v2, p0

    .line 495
    .restart local v2    # "ipString":Ljava/lang/String;
    const/4 v1, 0x4

    .restart local v1    # "expectBytes":I
    goto :goto_20

    .line 505
    .restart local v0    # "addr":[B
    :cond_3d
    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([B)Ljava/net/InetAddress;

    move-result-object v3

    return-object v3
.end method

.method public static fromInteger(I)Ljava/net/Inet4Address;
    .registers 2
    .param p0, "address"    # I

    .prologue
    .line 949
    invoke-static {p0}, Lcom/google/common/primitives/Ints;->toByteArray(I)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    return-object v0
.end method

.method public static fromLittleEndianByteArray([B)Ljava/net/InetAddress;
    .registers 4
    .param p0, "addr"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 964
    array-length v2, p0

    new-array v1, v2, [B

    .line 965
    .local v1, "reversed":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_12

    .line 966
    array-length v2, p0

    sub-int/2addr v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p0, v2

    aput-byte v2, v1, v0

    .line 965
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 968
    :cond_12
    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v2

    return-object v2
.end method

.method public static get6to4IPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .registers 6
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    .line 603
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not a 6to4 address."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 606
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x6

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    return-object v0
.end method

.method public static getCoercedIPv4Address(Ljava/net/InetAddress;)Ljava/net/Inet4Address;
    .registers 11
    .param p0, "ip"    # Ljava/net/InetAddress;

    .prologue
    const/16 v9, 0xf

    .line 872
    instance-of v7, p0, Ljava/net/Inet4Address;

    if-eqz v7, :cond_9

    .line 873
    check-cast p0, Ljava/net/Inet4Address;

    .line 913
    .end local p0    # "ip":Ljava/net/InetAddress;
    .local v2, "bytes":[B
    .local v4, "i":I
    .local v6, "leadingBytesOfZero":Z
    :goto_8
    return-object p0

    .line 877
    .end local v2    # "bytes":[B
    .end local v4    # "i":I
    .end local v6    # "leadingBytesOfZero":Z
    .restart local p0    # "ip":Ljava/net/InetAddress;
    :cond_9
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v2

    .line 878
    .restart local v2    # "bytes":[B
    const/4 v6, 0x1

    .line 879
    .restart local v6    # "leadingBytesOfZero":Z
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_f
    if-ge v4, v9, :cond_16

    .line 880
    aget-byte v7, v2, v4

    if-eqz v7, :cond_20

    .line 881
    const/4 v6, 0x0

    .line 885
    :cond_16
    if-eqz v6, :cond_23

    aget-byte v7, v2, v9

    const/4 v8, 0x1

    if-ne v7, v8, :cond_23

    .line 886
    sget-object p0, Lcom/google/common/net/InetAddresses;->LOOPBACK4:Ljava/net/Inet4Address;

    goto :goto_8

    .line 879
    :cond_20
    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    .line 887
    :cond_23
    if-eqz v6, :cond_2c

    aget-byte v7, v2, v9

    if-nez v7, :cond_2c

    .line 888
    sget-object p0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    goto :goto_8

    :cond_2c
    move-object v5, p0

    .line 891
    check-cast v5, Ljava/net/Inet6Address;

    .line 892
    .local v5, "ip6":Ljava/net/Inet6Address;
    const-wide/16 v0, 0x0

    .line 893
    .local v0, "addressAsLong":J
    invoke-static {v5}, Lcom/google/common/net/InetAddresses;->hasEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 894
    invoke-static {v5}, Lcom/google/common/net/InetAddresses;->getEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/Inet4Address;->hashCode()I

    move-result v7

    int-to-long v0, v7

    .line 902
    :goto_40
    invoke-static {}, Lcom/google/common/hash/Hashing;->murmur3_32()Lcom/google/common/hash/HashFunction;

    move-result-object v7

    invoke-interface {v7, v0, v1}, Lcom/google/common/hash/HashFunction;->hashLong(J)Lcom/google/common/hash/HashCode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/common/hash/HashCode;->asInt()I

    move-result v3

    .line 905
    .local v3, "coercedHash":I
    const/high16 v7, -0x20000000

    or-int/2addr v3, v7

    .line 909
    const/4 v7, -0x1

    if-ne v3, v7, :cond_53

    .line 910
    const/4 v3, -0x2

    .line 913
    :cond_53
    invoke-static {v3}, Lcom/google/common/primitives/Ints;->toByteArray(I)[B

    move-result-object v7

    invoke-static {v7}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object p0

    goto :goto_8

    .line 898
    .end local v3    # "coercedHash":I
    :cond_5c
    invoke-virtual {v5}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v7

    const/4 v8, 0x0

    const/16 v9, 0x8

    invoke-static {v7, v8, v9}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    goto :goto_40
.end method

.method public static getCompatIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .registers 6
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    .line 570
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not IPv4-compatible."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 573
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    const/16 v1, 0xc

    const/16 v2, 0x10

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    return-object v0
.end method

.method public static getEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .registers 6
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    .line 795
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 796
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getCompatIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object v0

    .line 804
    :goto_a
    return-object v0

    .line 799
    :cond_b
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 800
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->get6to4IPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object v0

    goto :goto_a

    .line 803
    :cond_16
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 804
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getTeredoInfo(Ljava/net/Inet6Address;)Lcom/google/common/net/InetAddresses$TeredoInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/net/InetAddresses$TeredoInfo;->getClient()Ljava/net/Inet4Address;

    move-result-object v0

    goto :goto_a

    .line 807
    :cond_25
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'%s\' has no embedded IPv4 address."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getInet4Address([B)Ljava/net/Inet4Address;
    .registers 6
    .param p0, "bytes"    # [B

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 130
    array-length v0, p0

    const/4 v3, 0x4

    if-ne v0, v3, :cond_1c

    move v0, v1

    :goto_7
    const-string v3, "Byte array has invalid length for an IPv4 address: %s != 4."

    new-array v1, v1, [Ljava/lang/Object;

    array-length v4, p0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 135
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([B)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    return-object v0

    :cond_1c
    move v0, v2

    .line 130
    goto :goto_7
.end method

.method public static getIsatapIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .registers 6
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    .line 759
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isIsatapAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not an ISATAP address."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 762
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    const/16 v1, 0xc

    const/16 v2, 0x10

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    return-object v0
.end method

.method public static getTeredoInfo(Ljava/net/Inet6Address;)Lcom/google/common/net/InetAddresses$TeredoInfo;
    .registers 15
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    const v13, 0xffff

    const/16 v12, 0x8

    .line 694
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v7

    const-string v8, "Address \'%s\' is not a Teredo address."

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 697
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 698
    .local v0, "bytes":[B
    const/4 v7, 0x4

    invoke-static {v0, v7, v12}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v7

    invoke-static {v7}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v6

    .line 700
    .local v6, "server":Ljava/net/Inet4Address;
    invoke-static {v0, v12}, Lcom/google/common/io/ByteStreams;->newDataInput([BI)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object v7

    invoke-interface {v7}, Lcom/google/common/io/ByteArrayDataInput;->readShort()S

    move-result v7

    and-int v3, v7, v13

    .line 703
    .local v3, "flags":I
    const/16 v7, 0xa

    invoke-static {v0, v7}, Lcom/google/common/io/ByteStreams;->newDataInput([BI)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object v7

    invoke-interface {v7}, Lcom/google/common/io/ByteArrayDataInput;->readShort()S

    move-result v7

    xor-int/lit8 v7, v7, -0x1

    and-int v5, v7, v13

    .line 705
    .local v5, "port":I
    const/16 v7, 0xc

    const/16 v8, 0x10

    invoke-static {v0, v7, v8}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v2

    .line 706
    .local v2, "clientBytes":[B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_46
    array-length v7, v2

    if-ge v4, v7, :cond_53

    .line 708
    aget-byte v7, v2, v4

    xor-int/lit8 v7, v7, -0x1

    int-to-byte v7, v7

    aput-byte v7, v2, v4

    .line 706
    add-int/lit8 v4, v4, 0x1

    goto :goto_46

    .line 710
    :cond_53
    invoke-static {v2}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v1

    .line 712
    .local v1, "client":Ljava/net/Inet4Address;
    new-instance v7, Lcom/google/common/net/InetAddresses$TeredoInfo;

    invoke-direct {v7, v6, v1, v5, v3}, Lcom/google/common/net/InetAddresses$TeredoInfo;-><init>(Ljava/net/Inet4Address;Ljava/net/Inet4Address;II)V

    return-object v7
.end method

.method public static hasEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Z
    .registers 2
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    .line 778
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

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

.method private static hextetsToIPv6String([I)Ljava/lang/String;
    .registers 6
    .param p0, "hextets"    # [I

    .prologue
    .line 418
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v4, 0x27

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 419
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 420
    .local v2, "lastWasNumber":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    array-length v4, p0

    if-ge v1, v4, :cond_33

    .line 421
    aget v4, p0, v1

    if-ltz v4, :cond_27

    const/4 v3, 0x1

    .line 422
    .local v3, "thisIsNumber":Z
    :goto_11
    if-eqz v3, :cond_29

    .line 423
    if-eqz v2, :cond_1a

    .line 424
    const/16 v4, 0x3a

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 426
    :cond_1a
    aget v4, p0, v1

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    :cond_23
    :goto_23
    move v2, v3

    .line 420
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 421
    .end local v3    # "thisIsNumber":Z
    :cond_27
    const/4 v3, 0x0

    goto :goto_11

    .line 428
    .restart local v3    # "thisIsNumber":Z
    :cond_29
    if-eqz v1, :cond_2d

    if-eqz v2, :cond_23

    .line 429
    :cond_2d
    const-string v4, "::"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_23

    .line 434
    .end local v3    # "thisIsNumber":Z
    :cond_33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static increment(Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .registers 7
    .param p0, "address"    # Ljava/net/InetAddress;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 981
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 982
    .local v0, "addr":[B
    array-length v2, v0

    add-int/lit8 v1, v2, -0x1

    .line 983
    .local v1, "i":I
    :goto_9
    if-ltz v1, :cond_15

    aget-byte v2, v0, v1

    const/4 v5, -0x1

    if-ne v2, v5, :cond_15

    .line 984
    aput-byte v4, v0, v1

    .line 985
    add-int/lit8 v1, v1, -0x1

    goto :goto_9

    .line 988
    :cond_15
    if-ltz v1, :cond_2d

    move v2, v3

    :goto_18
    const-string v5, "Incrementing %s would wrap."

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v4

    invoke-static {v2, v5, v3}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 990
    aget-byte v2, v0, v1

    add-int/lit8 v2, v2, 0x1

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 991
    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([B)Ljava/net/InetAddress;

    move-result-object v2

    return-object v2

    :cond_2d
    move v2, v4

    .line 988
    goto :goto_18
.end method

.method private static ipStringToBytes(Ljava/lang/String;)[B
    .registers 8
    .param p0, "ipString"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 173
    const/4 v1, 0x0

    .line 174
    .local v1, "hasColon":Z
    const/4 v2, 0x0

    .line 175
    .local v2, "hasDot":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_29

    .line 176
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 177
    .local v0, "c":C
    const/16 v5, 0x2e

    if-ne v0, v5, :cond_16

    .line 178
    const/4 v2, 0x1

    .line 175
    :cond_13
    :goto_13
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 179
    :cond_16
    const/16 v5, 0x3a

    if-ne v0, v5, :cond_1f

    .line 180
    if-eqz v2, :cond_1d

    .line 201
    .end local v0    # "c":C
    :cond_1c
    :goto_1c
    return-object v4

    .line 183
    .restart local v0    # "c":C
    :cond_1d
    const/4 v1, 0x1

    goto :goto_13

    .line 184
    :cond_1f
    const/16 v5, 0x10

    invoke-static {v0, v5}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_13

    goto :goto_1c

    .line 190
    .end local v0    # "c":C
    :cond_29
    if-eqz v1, :cond_38

    .line 191
    if-eqz v2, :cond_33

    .line 192
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->convertDottedQuadToHex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 193
    if-eqz p0, :cond_1c

    .line 197
    :cond_33
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV6(Ljava/lang/String;)[B

    move-result-object v4

    goto :goto_1c

    .line 198
    :cond_38
    if-eqz v2, :cond_1c

    .line 199
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV4(Ljava/lang/String;)[B

    move-result-object v4

    goto :goto_1c
.end method

.method public static is6to4Address(Ljava/net/Inet6Address;)Z
    .registers 6
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 591
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 592
    .local v0, "bytes":[B
    aget-byte v3, v0, v2

    const/16 v4, 0x20

    if-ne v3, v4, :cond_12

    aget-byte v3, v0, v1

    const/4 v4, 0x2

    if-ne v3, v4, :cond_12

    :goto_11
    return v1

    :cond_12
    move v1, v2

    goto :goto_11
.end method

.method public static isCompatIPv4Address(Ljava/net/Inet6Address;)Z
    .registers 6
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    const/16 v4, 0xf

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 549
    invoke-virtual {p0}, Ljava/net/Inet6Address;->isIPv4CompatibleAddress()Z

    move-result v3

    if-nez v3, :cond_b

    .line 559
    :cond_a
    :goto_a
    return v1

    .line 553
    :cond_b
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 554
    .local v0, "bytes":[B
    const/16 v3, 0xc

    aget-byte v3, v0, v3

    if-nez v3, :cond_29

    const/16 v3, 0xd

    aget-byte v3, v0, v3

    if-nez v3, :cond_29

    const/16 v3, 0xe

    aget-byte v3, v0, v3

    if-nez v3, :cond_29

    aget-byte v3, v0, v4

    if-eqz v3, :cond_a

    aget-byte v3, v0, v4

    if-eq v3, v2, :cond_a

    :cond_29
    move v1, v2

    .line 559
    goto :goto_a
.end method

.method public static isInetAddress(Ljava/lang/String;)Z
    .registers 2
    .param p0, "ipString"    # Ljava/lang/String;

    .prologue
    .line 168
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isIsatapAddress(Ljava/net/Inet6Address;)Z
    .registers 5
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    const/4 v1, 0x0

    .line 734
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 747
    :cond_7
    :goto_7
    return v1

    .line 738
    :cond_8
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 740
    .local v0, "bytes":[B
    const/16 v2, 0x8

    aget-byte v2, v0, v2

    or-int/lit8 v2, v2, 0x3

    const/4 v3, 0x3

    if-ne v2, v3, :cond_7

    .line 747
    const/16 v2, 0x9

    aget-byte v2, v0, v2

    if-nez v2, :cond_7

    const/16 v2, 0xa

    aget-byte v2, v0, v2

    const/16 v3, 0x5e

    if-ne v2, v3, :cond_7

    const/16 v2, 0xb

    aget-byte v2, v0, v2

    const/4 v3, -0x2

    if-ne v2, v3, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method public static isMappedIPv4Address(Ljava/lang/String;)Z
    .registers 6
    .param p0, "ipString"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 834
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 835
    .local v0, "bytes":[B
    if-eqz v0, :cond_15

    array-length v3, v0

    const/16 v4, 0x10

    if-ne v3, v4, :cond_15

    .line 836
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    const/16 v3, 0xa

    if-ge v1, v3, :cond_19

    .line 837
    aget-byte v3, v0, v1

    if-eqz v3, :cond_16

    .line 848
    .end local v1    # "i":I
    :cond_15
    :goto_15
    return v2

    .line 836
    .restart local v1    # "i":I
    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 841
    :cond_19
    const/16 v1, 0xa

    :goto_1b
    const/16 v3, 0xc

    if-ge v1, v3, :cond_27

    .line 842
    aget-byte v3, v0, v1

    const/4 v4, -0x1

    if-ne v3, v4, :cond_15

    .line 841
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 846
    :cond_27
    const/4 v2, 0x1

    goto :goto_15
.end method

.method public static isMaximum(Ljava/net/InetAddress;)Z
    .registers 5
    .param p0, "address"    # Ljava/net/InetAddress;

    .prologue
    .line 1003
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 1004
    .local v0, "addr":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v2, v0

    if-ge v1, v2, :cond_12

    .line 1005
    aget-byte v2, v0, v1

    const/4 v3, -0x1

    if-eq v2, v3, :cond_f

    .line 1006
    const/4 v2, 0x0

    .line 1009
    :goto_e
    return v2

    .line 1004
    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1009
    :cond_12
    const/4 v2, 0x1

    goto :goto_e
.end method

.method public static isTeredoAddress(Ljava/net/Inet6Address;)Z
    .registers 6
    .param p0, "ip"    # Ljava/net/Inet6Address;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 681
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object v0

    .line 682
    .local v0, "bytes":[B
    aget-byte v3, v0, v2

    const/16 v4, 0x20

    if-ne v3, v4, :cond_1b

    aget-byte v3, v0, v1

    if-ne v3, v1, :cond_1b

    const/4 v3, 0x2

    aget-byte v3, v0, v3

    if-nez v3, :cond_1b

    const/4 v3, 0x3

    aget-byte v3, v0, v3

    if-nez v3, :cond_1b

    :goto_1a
    return v1

    :cond_1b
    move v1, v2

    goto :goto_1a
.end method

.method public static isUriInetAddress(Ljava/lang/String;)Z
    .registers 3
    .param p0, "ipString"    # Ljava/lang/String;

    .prologue
    .line 517
    :try_start_0
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->forUriString(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_3} :catch_5

    .line 518
    const/4 v1, 0x1

    .line 520
    :goto_4
    return v1

    .line 519
    :catch_5
    move-exception v0

    .line 520
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method private static parseHextet(Ljava/lang/String;)S
    .registers 3
    .param p0, "ipPart"    # Ljava/lang/String;

    .prologue
    .line 311
    const/16 v1, 0x10

    invoke-static {p0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 312
    .local v0, "hextet":I
    const v1, 0xffff

    if-le v0, v1, :cond_11

    .line 313
    new-instance v1, Ljava/lang/NumberFormatException;

    invoke-direct {v1}, Ljava/lang/NumberFormatException;-><init>()V

    throw v1

    .line 315
    :cond_11
    int-to-short v1, v0

    return v1
.end method

.method private static parseOctet(Ljava/lang/String;)B
    .registers 4
    .param p0, "ipPart"    # Ljava/lang/String;

    .prologue
    .line 300
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 303
    .local v0, "octet":I
    const/16 v1, 0xff

    if-gt v0, v1, :cond_17

    const-string v1, "0"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_1d

    .line 304
    :cond_17
    new-instance v1, Ljava/lang/NumberFormatException;

    invoke-direct {v1}, Ljava/lang/NumberFormatException;-><init>()V

    throw v1

    .line 306
    :cond_1d
    int-to-byte v1, v0

    return v1
.end method

.method private static textToNumericFormatV4(Ljava/lang/String;)[B
    .registers 9
    .param p0, "ipString"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x4

    .line 205
    const-string v5, "\\."

    const/4 v6, 0x5

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "address":[Ljava/lang/String;
    array-length v5, v0

    if-eq v5, v7, :cond_e

    move-object v1, v4

    .line 219
    :cond_d
    :goto_d
    return-object v1

    .line 210
    :cond_e
    new-array v1, v7, [B

    .line 212
    .local v1, "bytes":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_11
    :try_start_11
    array-length v5, v1

    if-ge v3, v5, :cond_d

    .line 213
    aget-object v5, v0, v3

    invoke-static {v5}, Lcom/google/common/net/InetAddresses;->parseOctet(Ljava/lang/String;)B

    move-result v5

    aput-byte v5, v1, v3
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_11 .. :try_end_1c} :catch_1f

    .line 212
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 215
    :catch_1f
    move-exception v2

    .local v2, "ex":Ljava/lang/NumberFormatException;
    move-object v1, v4

    .line 216
    goto :goto_d
.end method

.method private static textToNumericFormatV6(Ljava/lang/String;)[B
    .registers 13
    .param p0, "ipString"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x0

    const/4 v8, 0x0

    .line 224
    const-string v9, ":"

    const/16 v10, 0xa

    invoke-virtual {p0, v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 225
    .local v2, "parts":[Ljava/lang/String;
    array-length v9, v2

    const/4 v10, 0x3

    if-lt v9, v10, :cond_13

    array-length v9, v2

    const/16 v10, 0x9

    if-le v9, v10, :cond_14

    .line 282
    :cond_13
    :goto_13
    return-object v8

    .line 231
    :cond_14
    const/4 v7, -0x1

    .line 232
    .local v7, "skipIndex":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_16
    array-length v9, v2

    add-int/lit8 v9, v9, -0x1

    if-ge v1, v9, :cond_29

    .line 233
    aget-object v9, v2, v1

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_26

    .line 234
    if-gez v7, :cond_13

    .line 237
    move v7, v1

    .line 232
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 243
    :cond_29
    if-ltz v7, :cond_69

    .line 245
    move v3, v7

    .line 246
    .local v3, "partsHi":I
    array-length v9, v2

    sub-int/2addr v9, v7

    add-int/lit8 v4, v9, -0x1

    .line 247
    .local v4, "partsLo":I
    aget-object v9, v2, v11

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_3c

    add-int/lit8 v3, v3, -0x1

    if-nez v3, :cond_13

    .line 250
    :cond_3c
    array-length v9, v2

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v2, v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_4b

    add-int/lit8 v4, v4, -0x1

    if-nez v4, :cond_13

    .line 262
    :cond_4b
    :goto_4b
    add-int v9, v3, v4

    rsub-int/lit8 v5, v9, 0x8

    .line 263
    .local v5, "partsSkipped":I
    if-ltz v7, :cond_6c

    const/4 v9, 0x1

    if-lt v5, v9, :cond_13

    .line 268
    :cond_54
    const/16 v9, 0x10

    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 270
    .local v6, "rawBytes":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    :goto_5b
    if-ge v1, v3, :cond_6f

    .line 271
    :try_start_5d
    aget-object v9, v2, v1

    invoke-static {v9}, Lcom/google/common/net/InetAddresses;->parseHextet(Ljava/lang/String;)S

    move-result v9

    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;
    :try_end_66
    .catch Ljava/lang/NumberFormatException; {:try_start_5d .. :try_end_66} :catch_8a

    .line 270
    add-int/lit8 v1, v1, 0x1

    goto :goto_5b

    .line 256
    .end local v3    # "partsHi":I
    .end local v4    # "partsLo":I
    .end local v5    # "partsSkipped":I
    .end local v6    # "rawBytes":Ljava/nio/ByteBuffer;
    :cond_69
    array-length v3, v2

    .line 257
    .restart local v3    # "partsHi":I
    const/4 v4, 0x0

    .restart local v4    # "partsLo":I
    goto :goto_4b

    .line 263
    .restart local v5    # "partsSkipped":I
    :cond_6c
    if-eqz v5, :cond_54

    goto :goto_13

    .line 273
    .restart local v6    # "rawBytes":Ljava/nio/ByteBuffer;
    :cond_6f
    const/4 v1, 0x0

    :goto_70
    if-ge v1, v5, :cond_79

    .line 274
    const/4 v9, 0x0

    :try_start_73
    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 273
    add-int/lit8 v1, v1, 0x1

    goto :goto_70

    .line 276
    :cond_79
    move v1, v4

    :goto_7a
    if-lez v1, :cond_8c

    .line 277
    array-length v9, v2

    sub-int/2addr v9, v1

    aget-object v9, v2, v9

    invoke-static {v9}, Lcom/google/common/net/InetAddresses;->parseHextet(Ljava/lang/String;)S

    move-result v9

    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;
    :try_end_87
    .catch Ljava/lang/NumberFormatException; {:try_start_73 .. :try_end_87} :catch_8a

    .line 276
    add-int/lit8 v1, v1, -0x1

    goto :goto_7a

    .line 279
    :catch_8a
    move-exception v0

    .line 280
    .local v0, "ex":Ljava/lang/NumberFormatException;
    goto :goto_13

    .line 282
    .end local v0    # "ex":Ljava/lang/NumberFormatException;
    :cond_8c
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v8

    goto :goto_13
.end method

.method public static toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;
    .registers 7
    .param p0, "ip"    # Ljava/net/InetAddress;

    .prologue
    const/4 v5, 0x0

    .line 355
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    instance-of v3, p0, Ljava/net/Inet4Address;

    if-eqz v3, :cond_d

    .line 358
    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    .line 368
    :goto_c
    return-object v3

    .line 360
    :cond_d
    instance-of v3, p0, Ljava/net/Inet6Address;

    invoke-static {v3}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 361
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 362
    .local v0, "bytes":[B
    const/16 v3, 0x8

    new-array v1, v3, [I

    .line 363
    .local v1, "hextets":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1b
    array-length v3, v1

    if-ge v2, v3, :cond_31

    .line 364
    mul-int/lit8 v3, v2, 0x2

    aget-byte v3, v0, v3

    mul-int/lit8 v4, v2, 0x2

    add-int/lit8 v4, v4, 0x1

    aget-byte v4, v0, v4

    invoke-static {v5, v5, v3, v4}, Lcom/google/common/primitives/Ints;->fromBytes(BBBB)I

    move-result v3

    aput v3, v1, v2

    .line 363
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 367
    :cond_31
    invoke-static {v1}, Lcom/google/common/net/InetAddresses;->compressLongestRunOfZeroes([I)V

    .line 368
    invoke-static {v1}, Lcom/google/common/net/InetAddresses;->hextetsToIPv6String([I)Ljava/lang/String;

    move-result-object v3

    goto :goto_c
.end method

.method public static toUriString(Ljava/net/InetAddress;)Ljava/lang/String;
    .registers 3
    .param p0, "ip"    # Ljava/net/InetAddress;

    .prologue
    .line 463
    instance-of v0, p0, Ljava/net/Inet6Address;

    if-eqz v0, :cond_22

    .line 464
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 466
    :goto_21
    return-object v0

    :cond_22
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v0

    goto :goto_21
.end method
