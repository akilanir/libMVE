.class public Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "ASN1ObjectIdentifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/asn1/ASN1ObjectIdentifier$OidHandle;
    }
.end annotation


# static fields
.field private static final LONG_LIMIT:J = 0xffffffffffff80L

.field private static final pool:Ljava/util/Map;


# instance fields
.field private body:[B

.field private final identifier:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 440
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->pool:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 168
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 169
    if-nez p1, :cond_d

    .line 171
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'identifier\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_d
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->isValidIdentifier(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_32

    .line 175
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "string "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not an OID"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 178
    :cond_32
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->identifier:Ljava/lang/String;

    .line 179
    return-void
.end method

.method constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;)V
    .registers 6
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "branchID"    # Ljava/lang/String;

    .prologue
    .line 188
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 189
    const/4 v0, 0x0

    invoke-static {p2, v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->isValidBranchID(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_29

    .line 191
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "string "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not a valid OID branch"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 194
    :cond_29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->identifier:Ljava/lang/String;

    .line 195
    return-void
.end method

.method constructor <init>([B)V
    .registers 11
    .param p1, "bytes"    # [B

    .prologue
    .line 86
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 87
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 88
    .local v4, "objId":Ljava/lang/StringBuffer;
    const-wide/16 v5, 0x0

    .line 89
    .local v5, "value":J
    const/4 v1, 0x0

    .line 90
    .local v1, "bigValue":Ljava/math/BigInteger;
    const/4 v2, 0x1

    .line 92
    .local v2, "first":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    array-length v7, p1

    if-eq v3, v7, :cond_94

    .line 94
    aget-byte v7, p1, v3

    and-int/lit16 v0, v7, 0xff

    .line 96
    .local v0, "b":I
    const-wide v7, 0xffffffffffff80L

    cmp-long v7, v5, v7

    if-gtz v7, :cond_5b

    .line 98
    and-int/lit8 v7, v0, 0x7f

    int-to-long v7, v7

    add-long/2addr v5, v7

    .line 99
    and-int/lit16 v7, v0, 0x80

    if-nez v7, :cond_58

    .line 101
    if-eqz v2, :cond_33

    .line 103
    const-wide/16 v7, 0x28

    cmp-long v7, v5, v7

    if-gez v7, :cond_40

    .line 105
    const/16 v7, 0x30

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 117
    :goto_32
    const/4 v2, 0x0

    .line 120
    :cond_33
    const/16 v7, 0x2e

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 121
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 122
    const-wide/16 v5, 0x0

    .line 92
    :goto_3d
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 107
    :cond_40
    const-wide/16 v7, 0x50

    cmp-long v7, v5, v7

    if-gez v7, :cond_4f

    .line 109
    const/16 v7, 0x31

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 110
    const-wide/16 v7, 0x28

    sub-long/2addr v5, v7

    goto :goto_32

    .line 114
    :cond_4f
    const/16 v7, 0x32

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 115
    const-wide/16 v7, 0x50

    sub-long/2addr v5, v7

    goto :goto_32

    .line 126
    :cond_58
    const/4 v7, 0x7

    shl-long/2addr v5, v7

    goto :goto_3d

    .line 131
    :cond_5b
    if-nez v1, :cond_61

    .line 133
    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 135
    :cond_61
    and-int/lit8 v7, v0, 0x7f

    int-to-long v7, v7

    invoke-static {v7, v8}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/math/BigInteger;->or(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 136
    and-int/lit16 v7, v0, 0x80

    if-nez v7, :cond_8e

    .line 138
    if-eqz v2, :cond_82

    .line 140
    const/16 v7, 0x32

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 141
    const-wide/16 v7, 0x50

    invoke-static {v7, v8}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 142
    const/4 v2, 0x0

    .line 145
    :cond_82
    const/16 v7, 0x2e

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 146
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 147
    const/4 v1, 0x0

    .line 148
    const-wide/16 v5, 0x0

    goto :goto_3d

    .line 152
    :cond_8e
    const/4 v7, 0x7

    invoke-virtual {v1, v7}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_3d

    .line 157
    .end local v0    # "b":I
    :cond_94
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->identifier:Ljava/lang/String;

    .line 158
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v7

    iput-object v7, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->body:[B

    .line 159
    return-void
.end method

.method private doOutput(Ljava/io/ByteArrayOutputStream;)V
    .registers 11
    .param p1, "aOut"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    const/16 v8, 0x12

    .line 270
    new-instance v2, Lorg/spongycastle/asn1/OIDTokenizer;

    iget-object v4, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->identifier:Ljava/lang/String;

    invoke-direct {v2, v4}, Lorg/spongycastle/asn1/OIDTokenizer;-><init>(Ljava/lang/String;)V

    .line 271
    .local v2, "tok":Lorg/spongycastle/asn1/OIDTokenizer;
    invoke-virtual {v2}, Lorg/spongycastle/asn1/OIDTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    mul-int/lit8 v0, v4, 0x28

    .line 273
    .local v0, "first":I
    invoke-virtual {v2}, Lorg/spongycastle/asn1/OIDTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 274
    .local v1, "secondToken":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v4, v8, :cond_3e

    .line 276
    int-to-long v4, v0

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    add-long/2addr v4, v6

    invoke-direct {p0, p1, v4, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->writeField(Ljava/io/ByteArrayOutputStream;J)V

    .line 283
    :goto_26
    invoke-virtual {v2}, Lorg/spongycastle/asn1/OIDTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_59

    .line 285
    invoke-virtual {v2}, Lorg/spongycastle/asn1/OIDTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 286
    .local v3, "token":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v4, v8, :cond_50

    .line 288
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-direct {p0, p1, v4, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->writeField(Ljava/io/ByteArrayOutputStream;J)V

    goto :goto_26

    .line 280
    .end local v3    # "token":Ljava/lang/String;
    :cond_3e
    new-instance v4, Ljava/math/BigInteger;

    invoke-direct {v4, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    int-to-long v5, v0

    invoke-static {v5, v6}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-direct {p0, p1, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->writeField(Ljava/io/ByteArrayOutputStream;Ljava/math/BigInteger;)V

    goto :goto_26

    .line 292
    .restart local v3    # "token":Ljava/lang/String;
    :cond_50
    new-instance v4, Ljava/math/BigInteger;

    invoke-direct {v4, v3}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->writeField(Ljava/io/ByteArrayOutputStream;Ljava/math/BigInteger;)V

    goto :goto_26

    .line 295
    .end local v3    # "token":Ljava/lang/String;
    :cond_59
    return-void
.end method

.method static fromOctetString([B)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 5
    .param p0, "enc"    # [B

    .prologue
    .line 471
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier$OidHandle;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier$OidHandle;-><init>([B)V

    .line 473
    .local v0, "hdl":Lorg/spongycastle/asn1/ASN1ObjectIdentifier$OidHandle;
    sget-object v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->pool:Ljava/util/Map;

    monitor-enter v3

    .line 475
    :try_start_8
    sget-object v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->pool:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 476
    .local v1, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    if-eqz v1, :cond_14

    .line 478
    monitor-exit v3

    .line 482
    .end local v1    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :goto_13
    return-object v1

    .line 480
    .restart local v1    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_14
    monitor-exit v3
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_1b

    .line 482
    new-instance v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .end local v1    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    invoke-direct {v1, p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>([B)V

    goto :goto_13

    .line 480
    :catchall_1b
    move-exception v2

    :try_start_1c
    monitor-exit v3
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1b

    throw v2
.end method

.method private declared-synchronized getBody()[B
    .registers 3

    .prologue
    .line 299
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->body:[B

    if-nez v1, :cond_13

    .line 301
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 303
    .local v0, "bOut":Ljava/io/ByteArrayOutputStream;
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->doOutput(Ljava/io/ByteArrayOutputStream;)V

    .line 305
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->body:[B

    .line 308
    .end local v0    # "bOut":Ljava/io/ByteArrayOutputStream;
    :cond_13
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->body:[B
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_17

    monitor-exit p0

    return-object v1

    .line 299
    :catchall_17
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 30
    if-eqz p0, :cond_6

    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v2, :cond_a

    .line 32
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v2, p0

    .line 45
    .local v1, "enc":[B
    :goto_9
    return-object v2

    .line 35
    .end local v1    # "enc":[B
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_a
    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v2, :cond_22

    move-object v2, p0

    check-cast v2, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-interface {v2}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    instance-of v2, v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v2, :cond_22

    .line 37
    check-cast p0, Lorg/spongycastle/asn1/ASN1Encodable;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    goto :goto_9

    .line 40
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_22
    instance-of v2, p0, [B

    if-eqz v2, :cond_50

    .line 42
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    check-cast v1, [B

    .line 45
    .restart local v1    # "enc":[B
    :try_start_2b
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_31} :catch_32

    goto :goto_9

    .line 47
    :catch_32
    move-exception v0

    .line 49
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to construct object identifier from byte[]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 53
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "enc":[B
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_50
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "illegal object in getInstance: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 4
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 70
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 72
    .local v0, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez p1, :cond_a

    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v1, :cond_f

    .line 74
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    .line 78
    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->fromOctetString([B)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    goto :goto_e
.end method

.method private static isValidBranchID(Ljava/lang/String;I)Z
    .registers 7
    .param p0, "branchID"    # Ljava/lang/String;
    .param p1, "start"    # I

    .prologue
    const/4 v3, 0x0

    .line 364
    const/4 v1, 0x0

    .line 366
    .local v1, "periodAllowed":Z
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 367
    .local v2, "pos":I
    :goto_6
    add-int/lit8 v2, v2, -0x1

    if-lt v2, p1, :cond_1f

    .line 369
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 372
    .local v0, "ch":C
    const/16 v4, 0x30

    if-gt v4, v0, :cond_18

    const/16 v4, 0x39

    if-gt v0, v4, :cond_18

    .line 374
    const/4 v1, 0x1

    .line 375
    goto :goto_6

    .line 378
    :cond_18
    const/16 v4, 0x2e

    if-ne v0, v4, :cond_22

    .line 380
    if-nez v1, :cond_20

    move v1, v3

    .line 392
    .end local v0    # "ch":C
    .end local v1    # "periodAllowed":Z
    :cond_1f
    :goto_1f
    return v1

    .line 385
    .restart local v0    # "ch":C
    .restart local v1    # "periodAllowed":Z
    :cond_20
    const/4 v1, 0x0

    .line 386
    goto :goto_6

    :cond_22
    move v1, v3

    .line 389
    goto :goto_1f
.end method

.method private static isValidIdentifier(Ljava/lang/String;)Z
    .registers 5
    .param p0, "identifier"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 398
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_11

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-eq v2, v3, :cond_12

    .line 409
    :cond_11
    :goto_11
    return v1

    .line 403
    :cond_12
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 404
    .local v0, "first":C
    const/16 v2, 0x30

    if-lt v0, v2, :cond_11

    const/16 v2, 0x32

    if-gt v0, v2, :cond_11

    .line 409
    const/4 v1, 0x2

    invoke-static {p0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->isValidBranchID(Ljava/lang/String;I)Z

    move-result v1

    goto :goto_11
.end method

.method private writeField(Ljava/io/ByteArrayOutputStream;J)V
    .registers 8
    .param p1, "out"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "fieldValue"    # J

    .prologue
    .line 234
    const/16 v2, 0x9

    new-array v1, v2, [B

    .line 235
    .local v1, "result":[B
    const/16 v0, 0x8

    .line 236
    .local v0, "pos":I
    long-to-int v2, p2

    and-int/lit8 v2, v2, 0x7f

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    .line 237
    :goto_c
    const-wide/16 v2, 0x80

    cmp-long v2, p2, v2

    if-ltz v2, :cond_1f

    .line 239
    const/4 v2, 0x7

    shr-long/2addr p2, v2

    .line 240
    add-int/lit8 v0, v0, -0x1

    long-to-int v2, p2

    and-int/lit8 v2, v2, 0x7f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    goto :goto_c

    .line 242
    :cond_1f
    rsub-int/lit8 v2, v0, 0x9

    invoke-virtual {p1, v1, v0, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 243
    return-void
.end method

.method private writeField(Ljava/io/ByteArrayOutputStream;Ljava/math/BigInteger;)V
    .registers 10
    .param p1, "out"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "fieldValue"    # Ljava/math/BigInteger;

    .prologue
    const/4 v6, 0x0

    .line 249
    invoke-virtual {p2}, Ljava/math/BigInteger;->bitLength()I

    move-result v4

    add-int/lit8 v4, v4, 0x6

    div-int/lit8 v0, v4, 0x7

    .line 250
    .local v0, "byteCount":I
    if-nez v0, :cond_f

    .line 252
    invoke-virtual {p1, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 266
    :goto_e
    return-void

    .line 256
    :cond_f
    move-object v3, p2

    .line 257
    .local v3, "tmpValue":Ljava/math/BigInteger;
    new-array v2, v0, [B

    .line 258
    .local v2, "tmp":[B
    add-int/lit8 v1, v0, -0x1

    .local v1, "i":I
    :goto_14
    if-ltz v1, :cond_29

    .line 260
    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    and-int/lit8 v4, v4, 0x7f

    or-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    aput-byte v4, v2, v1

    .line 261
    const/4 v4, 0x7

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    move-result-object v3

    .line 258
    add-int/lit8 v1, v1, -0x1

    goto :goto_14

    .line 263
    :cond_29
    add-int/lit8 v4, v0, -0x1

    aget-byte v5, v2, v4

    and-int/lit8 v5, v5, 0x7f

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 264
    array-length v4, v2

    invoke-virtual {p1, v2, v6, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_e
.end method


# virtual methods
.method asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 4
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    .line 343
    if-ne p1, p0, :cond_4

    .line 345
    const/4 v0, 0x1

    .line 353
    .end local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :goto_3
    return v0

    .line 348
    .restart local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_4
    instance-of v0, p1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-nez v0, :cond_a

    .line 350
    const/4 v0, 0x0

    goto :goto_3

    .line 353
    :cond_a
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->identifier:Ljava/lang/String;

    check-cast p1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .end local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    iget-object v1, p1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 3
    .param p1, "branchID"    # Ljava/lang/String;

    .prologue
    .line 215
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-direct {v0, p0, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;)V

    return-object v0
.end method

.method encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .registers 4
    .param p1, "out"    # Lorg/spongycastle/asn1/ASN1OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 328
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getBody()[B

    move-result-object v0

    .line 330
    .local v0, "enc":[B
    const/4 v1, 0x6

    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->write(I)V

    .line 331
    array-length v1, v0

    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeLength(I)V

    .line 332
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1OutputStream;->write([B)V

    .line 333
    return-void
.end method

.method encodedLength()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 319
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getBody()[B

    move-result-object v1

    array-length v0, v1

    .line 321
    .local v0, "length":I
    invoke-static {v0}, Lorg/spongycastle/asn1/StreamUtil;->calculateBodyLength(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v1, v0

    return v1
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 337
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->identifier:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 5

    .prologue
    .line 423
    sget-object v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->pool:Ljava/util/Map;

    monitor-enter v3

    .line 425
    :try_start_3
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier$OidHandle;

    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getBody()[B

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier$OidHandle;-><init>([B)V

    .line 426
    .local v0, "hdl":Lorg/spongycastle/asn1/ASN1ObjectIdentifier$OidHandle;
    sget-object v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->pool:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 428
    .local v1, "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    if-eqz v1, :cond_18

    .line 430
    monitor-exit v3

    .line 435
    .end local v1    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :goto_17
    return-object v1

    .line 434
    .restart local v1    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_18
    sget-object v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->pool:Ljava/util/Map;

    invoke-interface {v2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    monitor-exit v3

    move-object v1, p0

    goto :goto_17

    .line 437
    .end local v0    # "hdl":Lorg/spongycastle/asn1/ASN1ObjectIdentifier$OidHandle;
    .end local v1    # "oid":Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :catchall_20
    move-exception v2

    monitor-exit v3
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_20

    throw v2
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 313
    const/4 v0, 0x0

    return v0
.end method

.method public on(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Z
    .registers 6
    .param p1, "stem"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 226
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    .local v0, "id":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    .line 227
    .local v1, "stemId":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v2, v3, :cond_26

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-ne v2, v3, :cond_26

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_26

    const/4 v2, 0x1

    :goto_25
    return v2

    :cond_26
    const/4 v2, 0x0

    goto :goto_25
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 358
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
