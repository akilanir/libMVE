.class public Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;
.super Ljava/lang/Object;
.source "OpenBSDBCrypt.java"


# static fields
.field private static final decodingTable:[B

.field private static final encodingTable:[B

.field private static final version:Ljava/lang/String; = "2a"


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 17
    const/16 v1, 0x40

    new-array v1, v1, [B

    fill-array-data v1, :array_30

    sput-object v1, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    .line 34
    const/16 v1, 0x80

    new-array v1, v1, [B

    sput-object v1, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    .line 39
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    sget-object v1, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    array-length v1, v1

    if-ge v0, v1, :cond_1d

    .line 41
    sget-object v1, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    const/4 v2, -0x1

    aput-byte v2, v1, v0

    .line 39
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 44
    :cond_1d
    const/4 v0, 0x0

    :goto_1e
    sget-object v1, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    array-length v1, v1

    if-ge v0, v1, :cond_2f

    .line 46
    sget-object v1, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    sget-object v2, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    aget-byte v2, v2, v0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 48
    :cond_2f
    return-void

    .line 17
    :array_30
    .array-data 1
        0x2et
        0x2ft
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public static checkPassword(Ljava/lang/String;[C)Z
    .registers 12
    .param p0, "bcryptString"    # Ljava/lang/String;
    .param p1, "password"    # [C

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x6

    const/4 v7, 0x4

    const/16 v6, 0x24

    .line 154
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x3c

    if-eq v4, v5, :cond_30

    .line 156
    new-instance v4, Lorg/spongycastle/crypto/DataLengthException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bcrypt String length: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 157
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", 60 required."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 159
    :cond_30
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_43

    .line 160
    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_43

    .line 161
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v6, :cond_4b

    .line 163
    :cond_43
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Invalid Bcrypt String format."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 165
    :cond_4b
    const/4 v4, 0x1

    invoke-virtual {p0, v4, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v5, "2a"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_60

    .line 167
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Wrong Bcrypt version, 2a expected."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 169
    :cond_60
    const/4 v0, 0x0

    .line 172
    .local v0, "cost":I
    const/4 v4, 0x4

    const/4 v5, 0x6

    :try_start_63
    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6a
    .catch Ljava/lang/NumberFormatException; {:try_start_63 .. :try_end_6a} :catch_90

    move-result v0

    .line 179
    if-lt v0, v7, :cond_71

    const/16 v4, 0x1f

    if-le v0, v4, :cond_ae

    .line 181
    :cond_71
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid cost factor: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", 4 < cost < 31 expected."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 174
    :catch_90
    move-exception v2

    .line 176
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid cost factor:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 177
    invoke-virtual {p0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 185
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    :cond_ae
    if-nez p1, :cond_b8

    .line 187
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Missing password."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 190
    :cond_b8
    invoke-virtual {p0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    .line 191
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1f

    .line 190
    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 189
    invoke-static {v4}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodeSaltString(Ljava/lang/String;)[B

    move-result-object v3

    .line 193
    .local v3, "salt":[B
    invoke-static {p1, v3, v0}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->generate([C[BI)Ljava/lang/String;

    move-result-object v1

    .line 195
    .local v1, "newBcryptString":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    return v4
.end method

.method private static createBcryptString([B[BI)Ljava/lang/String;
    .registers 8
    .param p0, "password"    # [B
    .param p1, "salt"    # [B
    .param p2, "cost"    # I

    .prologue
    const/16 v4, 0x24

    .line 69
    new-instance v1, Ljava/lang/StringBuffer;

    const/16 v2, 0x3c

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 70
    .local v1, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 71
    const-string v2, "2a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 72
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 73
    const/16 v2, 0xa

    if-ge p2, v2, :cond_48

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_2b
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 74
    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 75
    invoke-static {p1}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodeData([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 77
    invoke-static {p0, p1, p2}, Lorg/spongycastle/crypto/generators/BCrypt;->generate([B[BI)[B

    move-result-object v0

    .line 79
    .local v0, "key":[B
    invoke-static {v0}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodeData([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 73
    .end local v0    # "key":[B
    :cond_48
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_2b
.end method

.method private static decodeSaltString(Ljava/lang/String;)[B
    .registers 16
    .param p0, "saltString"    # Ljava/lang/String;

    .prologue
    .line 267
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v8

    .line 269
    .local v8, "saltChars":[C
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    const/16 v12, 0x10

    invoke-direct {v6, v12}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 272
    .local v6, "out":Ljava/io/ByteArrayOutputStream;
    array-length v12, v8

    const/16 v13, 0x16

    if-eq v12, v13, :cond_30

    .line 274
    new-instance v12, Lorg/spongycastle/crypto/DataLengthException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Invalid base64 salt length: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    array-length v14, v8

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " , 22 required."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 278
    :cond_30
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_31
    array-length v12, v8

    if-ge v4, v12, :cond_62

    .line 280
    aget-char v11, v8, v4

    .line 281
    .local v11, "value":I
    const/16 v12, 0x7a

    if-gt v11, v12, :cond_46

    const/16 v12, 0x2e

    if-lt v11, v12, :cond_46

    const/16 v12, 0x39

    if-le v11, v12, :cond_5f

    const/16 v12, 0x41

    if-ge v11, v12, :cond_5f

    .line 283
    :cond_46
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Salt string contains invalid character: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 278
    :cond_5f
    add-int/lit8 v4, v4, 0x1

    goto :goto_31

    .line 288
    .end local v11    # "value":I
    :cond_62
    const/16 v12, 0x18

    new-array v9, v12, [C

    .line 289
    .local v9, "tmp":[C
    const/4 v12, 0x0

    const/4 v13, 0x0

    array-length v14, v8

    invoke-static {v8, v12, v9, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 290
    move-object v8, v9

    .line 292
    array-length v5, v8

    .line 294
    .local v5, "len":I
    const/4 v4, 0x0

    :goto_6f
    if-ge v4, v5, :cond_a8

    .line 296
    sget-object v12, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    aget-char v13, v8, v4

    aget-byte v0, v12, v13

    .line 297
    .local v0, "b1":B
    sget-object v12, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    add-int/lit8 v13, v4, 0x1

    aget-char v13, v8, v13

    aget-byte v1, v12, v13

    .line 298
    .local v1, "b2":B
    sget-object v12, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    add-int/lit8 v13, v4, 0x2

    aget-char v13, v8, v13

    aget-byte v2, v12, v13

    .line 299
    .local v2, "b3":B
    sget-object v12, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->decodingTable:[B

    add-int/lit8 v13, v4, 0x3

    aget-char v13, v8, v13

    aget-byte v3, v12, v13

    .line 301
    .local v3, "b4":B
    shl-int/lit8 v12, v0, 0x2

    shr-int/lit8 v13, v1, 0x4

    or-int/2addr v12, v13

    invoke-virtual {v6, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 302
    shl-int/lit8 v12, v1, 0x4

    shr-int/lit8 v13, v2, 0x2

    or-int/2addr v12, v13

    invoke-virtual {v6, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 303
    shl-int/lit8 v12, v2, 0x6

    or-int/2addr v12, v3

    invoke-virtual {v6, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 294
    add-int/lit8 v4, v4, 0x4

    goto :goto_6f

    .line 306
    .end local v0    # "b1":B
    .end local v1    # "b2":B
    .end local v2    # "b3":B
    .end local v3    # "b4":B
    :cond_a8
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    .line 309
    .local v7, "saltBytes":[B
    const/16 v12, 0x10

    new-array v10, v12, [B

    .line 310
    .local v10, "tmpSalt":[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    array-length v14, v10

    invoke-static {v7, v12, v10, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 311
    move-object v7, v10

    .line 313
    return-object v7
.end method

.method private static encodeData([B)Ljava/lang/String;
    .registers 14
    .param p0, "data"    # [B

    .prologue
    const/16 v11, 0x10

    const/4 v12, 0x0

    .line 208
    array-length v9, p0

    const/16 v10, 0x18

    if-eq v9, v10, :cond_2b

    array-length v9, p0

    if-eq v9, v11, :cond_2b

    .line 210
    new-instance v9, Lorg/spongycastle/crypto/DataLengthException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Invalid length: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    array-length v11, p0

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", 24 for key or 16 for salt expected"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 212
    :cond_2b
    const/4 v7, 0x0

    .line 213
    .local v7, "salt":Z
    array-length v9, p0

    if-ne v9, v11, :cond_85

    .line 215
    const/4 v7, 0x1

    .line 216
    const/16 v9, 0x12

    new-array v8, v9, [B

    .line 217
    .local v8, "tmp":[B
    array-length v9, p0

    invoke-static {p0, v12, v8, v12, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 218
    move-object p0, v8

    .line 225
    .end local v8    # "tmp":[B
    :goto_39
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 226
    .local v5, "out":Ljava/io/ByteArrayOutputStream;
    array-length v4, p0

    .line 230
    .local v4, "len":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_40
    if-ge v3, v4, :cond_8b

    .line 232
    aget-byte v9, p0, v3

    and-int/lit16 v0, v9, 0xff

    .line 233
    .local v0, "a1":I
    add-int/lit8 v9, v3, 0x1

    aget-byte v9, p0, v9

    and-int/lit16 v1, v9, 0xff

    .line 234
    .local v1, "a2":I
    add-int/lit8 v9, v3, 0x2

    aget-byte v9, p0, v9

    and-int/lit16 v2, v9, 0xff

    .line 236
    .local v2, "a3":I
    sget-object v9, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    ushr-int/lit8 v10, v0, 0x2

    and-int/lit8 v10, v10, 0x3f

    aget-byte v9, v9, v10

    invoke-virtual {v5, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 237
    sget-object v9, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    shl-int/lit8 v10, v0, 0x4

    ushr-int/lit8 v11, v1, 0x4

    or-int/2addr v10, v11

    and-int/lit8 v10, v10, 0x3f

    aget-byte v9, v9, v10

    invoke-virtual {v5, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 238
    sget-object v9, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    shl-int/lit8 v10, v1, 0x2

    ushr-int/lit8 v11, v2, 0x6

    or-int/2addr v10, v11

    and-int/lit8 v10, v10, 0x3f

    aget-byte v9, v9, v10

    invoke-virtual {v5, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 239
    sget-object v9, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->encodingTable:[B

    and-int/lit8 v10, v2, 0x3f

    aget-byte v9, v9, v10

    invoke-virtual {v5, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 230
    add-int/lit8 v3, v3, 0x3

    goto :goto_40

    .line 222
    .end local v0    # "a1":I
    .end local v1    # "a2":I
    .end local v2    # "a3":I
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v5    # "out":Ljava/io/ByteArrayOutputStream;
    :cond_85
    array-length v9, p0

    add-int/lit8 v9, v9, -0x1

    aput-byte v12, p0, v9

    goto :goto_39

    .line 242
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    .restart local v5    # "out":Ljava/io/ByteArrayOutputStream;
    :cond_8b
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    invoke-static {v9}, Lorg/spongycastle/util/Strings;->fromByteArray([B)Ljava/lang/String;

    move-result-object v6

    .line 243
    .local v6, "result":Ljava/lang/String;
    const/4 v9, 0x1

    if-ne v7, v9, :cond_9d

    .line 245
    const/16 v9, 0x16

    invoke-virtual {v6, v12, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 249
    :goto_9c
    return-object v9

    :cond_9d
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v6, v12, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    goto :goto_9c
.end method

.method public static generate([C[BI)Ljava/lang/String;
    .registers 10
    .param p0, "password"    # [C
    .param p1, "salt"    # [B
    .param p2, "cost"    # I

    .prologue
    const/16 v3, 0x48

    const/4 v6, 0x0

    .line 98
    if-nez p0, :cond_d

    .line 100
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Password required."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 102
    :cond_d
    if-nez p1, :cond_17

    .line 104
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Salt required."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 106
    :cond_17
    array-length v4, p1

    const/16 v5, 0x10

    if-eq v4, v5, :cond_36

    .line 108
    new-instance v3, Lorg/spongycastle/crypto/DataLengthException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "16 byte salt required: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 110
    :cond_36
    const/4 v4, 0x4

    if-lt p2, v4, :cond_3d

    const/16 v4, 0x1f

    if-le p2, v4, :cond_45

    .line 112
    :cond_3d
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Invalid cost factor."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 115
    :cond_45
    invoke-static {p0}, Lorg/spongycastle/util/Strings;->toUTF8ByteArray([C)[B

    move-result-object v0

    .line 119
    .local v0, "psw":[B
    array-length v4, v0

    if-lt v4, v3, :cond_61

    :goto_4c
    new-array v2, v3, [B

    .line 121
    .local v2, "tmp":[B
    array-length v3, v2

    array-length v4, v0

    if-le v3, v4, :cond_65

    .line 123
    array-length v3, v0

    invoke-static {v0, v6, v2, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    :goto_56
    invoke-static {v0, v6}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 132
    invoke-static {v2, p1, p2}, Lorg/spongycastle/crypto/generators/OpenBSDBCrypt;->createBcryptString([B[BI)Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "rv":Ljava/lang/String;
    invoke-static {v2, v6}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 136
    return-object v1

    .line 119
    .end local v1    # "rv":Ljava/lang/String;
    .end local v2    # "tmp":[B
    :cond_61
    array-length v3, v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_4c

    .line 127
    .restart local v2    # "tmp":[B
    :cond_65
    array-length v3, v2

    invoke-static {v0, v6, v2, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_56
.end method
