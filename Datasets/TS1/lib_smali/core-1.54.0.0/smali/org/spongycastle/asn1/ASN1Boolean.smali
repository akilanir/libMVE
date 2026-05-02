.class public Lorg/spongycastle/asn1/ASN1Boolean;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "ASN1Boolean.java"


# static fields
.field public static final FALSE:Lorg/spongycastle/asn1/ASN1Boolean;

.field private static final FALSE_VALUE:[B

.field public static final TRUE:Lorg/spongycastle/asn1/ASN1Boolean;

.field private static final TRUE_VALUE:[B


# instance fields
.field private final value:[B


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    new-array v0, v3, [B

    const/4 v1, -0x1

    aput-byte v1, v0, v2

    sput-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->TRUE_VALUE:[B

    .line 23
    new-array v0, v3, [B

    aput-byte v2, v0, v2

    sput-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->FALSE_VALUE:[B

    .line 27
    new-instance v0, Lorg/spongycastle/asn1/ASN1Boolean;

    invoke-direct {v0, v2}, Lorg/spongycastle/asn1/ASN1Boolean;-><init>(Z)V

    sput-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->FALSE:Lorg/spongycastle/asn1/ASN1Boolean;

    .line 28
    new-instance v0, Lorg/spongycastle/asn1/ASN1Boolean;

    invoke-direct {v0, v3}, Lorg/spongycastle/asn1/ASN1Boolean;-><init>(Z)V

    sput-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->TRUE:Lorg/spongycastle/asn1/ASN1Boolean;

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 137
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 138
    if-eqz p1, :cond_a

    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->TRUE_VALUE:[B

    :goto_7
    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    .line 139
    return-void

    .line 138
    :cond_a
    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->FALSE_VALUE:[B

    goto :goto_7
.end method

.method constructor <init>([B)V
    .registers 5
    .param p1, "value"    # [B

    .prologue
    const/4 v2, 0x0

    .line 111
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 112
    array-length v0, p1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_10

    .line 114
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "byte value should have 1 byte in it"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_10
    aget-byte v0, p1, v2

    if-nez v0, :cond_19

    .line 119
    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->FALSE_VALUE:[B

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    .line 129
    :goto_18
    return-void

    .line 121
    :cond_19
    aget-byte v0, p1, v2

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0xff

    if-ne v0, v1, :cond_26

    .line 123
    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->TRUE_VALUE:[B

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    goto :goto_18

    .line 127
    :cond_26
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    goto :goto_18
.end method

.method static fromOctetString([B)Lorg/spongycastle/asn1/ASN1Boolean;
    .registers 4
    .param p0, "value"    # [B

    .prologue
    const/4 v2, 0x0

    .line 187
    array-length v0, p0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_d

    .line 189
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "BOOLEAN value should have 1 byte in it"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_d
    aget-byte v0, p0, v2

    if-nez v0, :cond_14

    .line 194
    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->FALSE:Lorg/spongycastle/asn1/ASN1Boolean;

    .line 202
    :goto_13
    return-object v0

    .line 196
    :cond_14
    aget-byte v0, p0, v2

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0xff

    if-ne v0, v1, :cond_1f

    .line 198
    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->TRUE:Lorg/spongycastle/asn1/ASN1Boolean;

    goto :goto_13

    .line 202
    :cond_1f
    new-instance v0, Lorg/spongycastle/asn1/ASN1Boolean;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ASN1Boolean;-><init>([B)V

    goto :goto_13
.end method

.method public static getInstance(I)Lorg/spongycastle/asn1/ASN1Boolean;
    .registers 2
    .param p0, "value"    # I

    .prologue
    .line 80
    if-eqz p0, :cond_5

    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->TRUE:Lorg/spongycastle/asn1/ASN1Boolean;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->FALSE:Lorg/spongycastle/asn1/ASN1Boolean;

    goto :goto_4
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Boolean;
    .registers 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 40
    if-eqz p0, :cond_6

    instance-of v2, p0, Lorg/spongycastle/asn1/ASN1Boolean;

    if-eqz v2, :cond_a

    .line 42
    :cond_6
    check-cast p0, Lorg/spongycastle/asn1/ASN1Boolean;

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v2, p0

    .line 50
    .local v1, "enc":[B
    :goto_9
    return-object v2

    .line 45
    .end local v1    # "enc":[B
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_a
    instance-of v2, p0, [B

    if-eqz v2, :cond_38

    .line 47
    check-cast p0, [B

    .end local p0    # "obj":Ljava/lang/Object;
    move-object v1, p0

    check-cast v1, [B

    .line 50
    .restart local v1    # "enc":[B
    :try_start_13
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Boolean;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1Boolean;
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_19} :catch_1a

    goto :goto_9

    .line 52
    :catch_1a
    move-exception v0

    .line 54
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed to construct boolean from byte[]: "

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

    .line 58
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "enc":[B
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_38
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

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Boolean;
    .registers 4
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 97
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    .line 99
    .local v0, "o":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez p1, :cond_a

    instance-of v1, v0, Lorg/spongycastle/asn1/ASN1Boolean;

    if-eqz v1, :cond_f

    .line 101
    :cond_a
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Boolean;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Boolean;

    move-result-object v1

    .line 105
    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :goto_e
    return-object v1

    .restart local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_f
    check-cast v0, Lorg/spongycastle/asn1/ASN1OctetString;

    .end local v0    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Boolean;->fromOctetString([B)Lorg/spongycastle/asn1/ASN1Boolean;

    move-result-object v1

    goto :goto_e
.end method

.method public static getInstance(Z)Lorg/spongycastle/asn1/ASN1Boolean;
    .registers 2
    .param p0, "value"    # Z

    .prologue
    .line 69
    if-eqz p0, :cond_5

    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->TRUE:Lorg/spongycastle/asn1/ASN1Boolean;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lorg/spongycastle/asn1/ASN1Boolean;->FALSE:Lorg/spongycastle/asn1/ASN1Boolean;

    goto :goto_4
.end method


# virtual methods
.method protected asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .registers 5
    .param p1, "o"    # Lorg/spongycastle/asn1/ASN1Primitive;

    .prologue
    const/4 v0, 0x0

    .line 166
    instance-of v1, p1, Lorg/spongycastle/asn1/ASN1Boolean;

    if-eqz v1, :cond_12

    .line 168
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    aget-byte v1, v1, v0

    check-cast p1, Lorg/spongycastle/asn1/ASN1Boolean;

    .end local p1    # "o":Lorg/spongycastle/asn1/ASN1Primitive;
    iget-object v2, p1, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    aget-byte v2, v2, v0

    if-ne v1, v2, :cond_12

    const/4 v0, 0x1

    .line 171
    :cond_12
    return v0
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
    .line 160
    const/4 v0, 0x1

    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    invoke-virtual {p1, v0, v1}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeEncoded(I[B)V

    .line 161
    return-void
.end method

.method encodedLength()I
    .registers 2

    .prologue
    .line 153
    const/4 v0, 0x3

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 176
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    return v0
.end method

.method isConstructed()Z
    .registers 2

    .prologue
    .line 148
    const/4 v0, 0x0

    return v0
.end method

.method public isTrue()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 143
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    aget-byte v1, v1, v0

    if-eqz v1, :cond_8

    const/4 v0, 0x1

    :cond_8
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 182
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1Boolean;->value:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    if-eqz v0, :cond_a

    const-string v0, "TRUE"

    :goto_9
    return-object v0

    :cond_a
    const-string v0, "FALSE"

    goto :goto_9
.end method
