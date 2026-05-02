.class public abstract Lcom/google/common/hash/HashCode;
.super Ljava/lang/Object;
.source "HashCode.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/hash/HashCode$BytesHashCode;,
        Lcom/google/common/hash/HashCode$LongHashCode;,
        Lcom/google/common/hash/HashCode$IntHashCode;
    }
.end annotation


# static fields
.field private static final hexDigits:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 354
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/common/hash/HashCode;->hexDigits:[C

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decode(C)I
    .registers 4
    .param p0, "ch"    # C

    .prologue
    .line 273
    const/16 v0, 0x30

    if-lt p0, v0, :cond_b

    const/16 v0, 0x39

    if-gt p0, v0, :cond_b

    .line 274
    add-int/lit8 v0, p0, -0x30

    .line 277
    :goto_a
    return v0

    .line 276
    :cond_b
    const/16 v0, 0x61

    if-lt p0, v0, :cond_18

    const/16 v0, 0x66

    if-gt p0, v0, :cond_18

    .line 277
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    .line 279
    :cond_18
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Illegal hexadecimal character: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static fromBytes([B)Lcom/google/common/hash/HashCode;
    .registers 3
    .param p0, "bytes"    # [B

    .prologue
    const/4 v0, 0x1

    .line 184
    array-length v1, p0

    if-lt v1, v0, :cond_14

    :goto_4
    const-string v1, "A HashCode must contain at least 1 byte."

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 185
    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    invoke-static {v0}, Lcom/google/common/hash/HashCode;->fromBytesNoCopy([B)Lcom/google/common/hash/HashCode;

    move-result-object v0

    return-object v0

    .line 184
    :cond_14
    const/4 v0, 0x0

    goto :goto_4
.end method

.method static fromBytesNoCopy([B)Lcom/google/common/hash/HashCode;
    .registers 2
    .param p0, "bytes"    # [B

    .prologue
    .line 193
    new-instance v0, Lcom/google/common/hash/HashCode$BytesHashCode;

    invoke-direct {v0, p0}, Lcom/google/common/hash/HashCode$BytesHashCode;-><init>([B)V

    return-object v0
.end method

.method public static fromInt(I)Lcom/google/common/hash/HashCode;
    .registers 2
    .param p0, "hash"    # I

    .prologue
    .line 82
    new-instance v0, Lcom/google/common/hash/HashCode$IntHashCode;

    invoke-direct {v0, p0}, Lcom/google/common/hash/HashCode$IntHashCode;-><init>(I)V

    return-object v0
.end method

.method public static fromLong(J)Lcom/google/common/hash/HashCode;
    .registers 3
    .param p0, "hash"    # J

    .prologue
    .line 131
    new-instance v0, Lcom/google/common/hash/HashCode$LongHashCode;

    invoke-direct {v0, p0, p1}, Lcom/google/common/hash/HashCode$LongHashCode;-><init>(J)V

    return-object v0
.end method

.method public static fromString(Ljava/lang/String;)Lcom/google/common/hash/HashCode;
    .registers 10
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 258
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v7, 0x2

    if-lt v4, v7, :cond_52

    move v4, v5

    :goto_a
    const-string v7, "input string (%s) must have at least 2 characters"

    new-array v8, v5, [Ljava/lang/Object;

    aput-object p0, v8, v6

    invoke-static {v4, v7, v8}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 260
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    rem-int/lit8 v4, v4, 0x2

    if-nez v4, :cond_54

    move v4, v5

    :goto_1c
    const-string v7, "input string (%s) must have an even number of characters"

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p0, v5, v6

    invoke-static {v4, v7, v5}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 263
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    new-array v0, v4, [B

    .line 264
    .local v0, "bytes":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_56

    .line 265
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/google/common/hash/HashCode;->decode(C)I

    move-result v4

    shl-int/lit8 v1, v4, 0x4

    .line 266
    .local v1, "ch1":I
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/google/common/hash/HashCode;->decode(C)I

    move-result v2

    .line 267
    .local v2, "ch2":I
    div-int/lit8 v4, v3, 0x2

    add-int v5, v1, v2

    int-to-byte v5, v5

    aput-byte v5, v0, v4

    .line 264
    add-int/lit8 v3, v3, 0x2

    goto :goto_2e

    .end local v0    # "bytes":[B
    .end local v1    # "ch1":I
    .end local v2    # "ch2":I
    .end local v3    # "i":I
    :cond_52
    move v4, v6

    .line 258
    goto :goto_a

    :cond_54
    move v4, v6

    .line 260
    goto :goto_1c

    .line 269
    .restart local v0    # "bytes":[B
    .restart local v3    # "i":I
    :cond_56
    invoke-static {v0}, Lcom/google/common/hash/HashCode;->fromBytesNoCopy([B)Lcom/google/common/hash/HashCode;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public abstract asBytes()[B
.end method

.method public abstract asInt()I
.end method

.method public abstract asLong()J
.end method

.method public abstract bits()I
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 303
    instance-of v1, p1, Lcom/google/common/hash/HashCode;

    if-eqz v1, :cond_14

    move-object v0, p1

    .line 304
    check-cast v0, Lcom/google/common/hash/HashCode;

    .line 307
    .local v0, "that":Lcom/google/common/hash/HashCode;
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asBytes()[B

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/common/hash/HashCode;->asBytes()[B

    move-result-object v2

    invoke-static {v1, v2}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result v1

    .line 309
    .end local v0    # "that":Lcom/google/common/hash/HashCode;
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public final hashCode()I
    .registers 6

    .prologue
    .line 321
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->bits()I

    move-result v3

    const/16 v4, 0x20

    if-lt v3, v4, :cond_d

    .line 322
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asInt()I

    move-result v2

    .line 330
    :cond_c
    return v2

    .line 325
    :cond_d
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asBytes()[B

    move-result-object v0

    .line 326
    .local v0, "bytes":[B
    const/4 v3, 0x0

    aget-byte v3, v0, v3

    and-int/lit16 v2, v3, 0xff

    .line 327
    .local v2, "val":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_17
    array-length v3, v0

    if-ge v1, v3, :cond_c

    .line 328
    aget-byte v3, v0, v1

    and-int/lit16 v3, v3, 0xff

    mul-int/lit8 v4, v1, 0x8

    shl-int/2addr v3, v4

    or-int/2addr v2, v3

    .line 327
    add-int/lit8 v1, v1, 0x1

    goto :goto_17
.end method

.method public abstract padToLong()J
.end method

.method public final toString()Ljava/lang/String;
    .registers 10

    .prologue
    .line 346
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asBytes()[B

    move-result-object v2

    .line 347
    .local v2, "bytes":[B
    new-instance v5, Ljava/lang/StringBuilder;

    array-length v6, v2

    mul-int/lit8 v6, v6, 0x2

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 348
    .local v5, "sb":Ljava/lang/StringBuilder;
    move-object v0, v2

    .local v0, "arr$":[B
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_f
    if-ge v3, v4, :cond_2b

    aget-byte v1, v0, v3

    .line 349
    .local v1, "b":B
    sget-object v6, Lcom/google/common/hash/HashCode;->hexDigits:[C

    shr-int/lit8 v7, v1, 0x4

    and-int/lit8 v7, v7, 0xf

    aget-char v6, v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lcom/google/common/hash/HashCode;->hexDigits:[C

    and-int/lit8 v8, v1, 0xf

    aget-char v7, v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 348
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 351
    .end local v1    # "b":B
    :cond_2b
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public final writeBytesTo([BII)I
    .registers 9
    .param p1, "dest"    # [B
    .param p2, "offset"    # I
    .param p3, "maxLength"    # I

    .prologue
    const/4 v4, 0x0

    .line 292
    const/4 v1, 0x2

    new-array v1, v1, [I

    aput p3, v1, v4

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->bits()I

    move-result v3

    div-int/lit8 v3, v3, 0x8

    aput v3, v1, v2

    invoke-static {v1}, Lcom/google/common/primitives/Ints;->min([I)I

    move-result p3

    .line 293
    add-int v1, p2, p3

    array-length v2, p1

    invoke-static {p2, v1, v2}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 296
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asBytes()[B

    move-result-object v0

    .line 297
    .local v0, "hash":[B
    invoke-static {v0, v4, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 298
    return p3
.end method
