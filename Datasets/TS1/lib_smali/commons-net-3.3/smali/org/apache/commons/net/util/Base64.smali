.class public Lorg/apache/commons/net/util/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field private static final CHUNK_SEPARATOR:[B

.field static final CHUNK_SIZE:I = 0x4c

.field private static final DECODE_TABLE:[B

.field private static final DEFAULT_BUFFER_RESIZE_FACTOR:I = 0x2

.field private static final DEFAULT_BUFFER_SIZE:I = 0x2000

.field private static final EMPTY_BYTE_ARRAY:[B

.field private static final MASK_6BITS:I = 0x3f

.field private static final MASK_8BITS:I = 0xff

.field private static final PAD:B = 0x3dt

.field private static final STANDARD_ENCODE_TABLE:[B

.field private static final URL_SAFE_ENCODE_TABLE:[B


# instance fields
.field private buffer:[B

.field private currentLinePos:I

.field private final decodeSize:I

.field private final encodeSize:I

.field private final encodeTable:[B

.field private eof:Z

.field private final lineLength:I

.field private final lineSeparator:[B

.field private modulus:I

.field private pos:I

.field private readPos:I

.field private x:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x40

    .line 73
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_28

    sput-object v0, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    .line 75
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/apache/commons/net/util/Base64;->EMPTY_BYTE_ARRAY:[B

    .line 84
    new-array v0, v1, [B

    fill-array-data v0, :array_2e

    sput-object v0, Lorg/apache/commons/net/util/Base64;->STANDARD_ENCODE_TABLE:[B

    .line 97
    new-array v0, v1, [B

    fill-array-data v0, :array_52

    sput-object v0, Lorg/apache/commons/net/util/Base64;->URL_SAFE_ENCODE_TABLE:[B

    .line 121
    const/16 v0, 0x7b

    new-array v0, v0, [B

    fill-array-data v0, :array_76

    sput-object v0, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    return-void

    .line 73
    nop

    :array_28
    .array-data 1
        0xdt
        0xat
    .end array-data

    .line 84
    nop

    :array_2e
    .array-data 1
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
        0x2bt
        0x2ft
    .end array-data

    .line 97
    :array_52
    .array-data 1
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
        0x2dt
        0x5ft
    .end array-data

    .line 121
    :array_76
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x3et
        -0x1t
        0x3et
        -0x1t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x1t
        -0x1t
        -0x1t
        -0x1t
        0x3ft
        -0x1t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 221
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/Base64;-><init>(Z)V

    .line 222
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "lineLength"    # I

    .prologue
    .line 262
    sget-object v0, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/util/Base64;-><init>(I[B)V

    .line 263
    return-void
.end method

.method public constructor <init>(I[B)V
    .registers 4
    .param p1, "lineLength"    # I
    .param p2, "lineSeparator"    # [B

    .prologue
    .line 288
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/net/util/Base64;-><init>(I[BZ)V

    .line 289
    return-void
.end method

.method public constructor <init>(I[BZ)V
    .registers 8
    .param p1, "lineLength"    # I
    .param p2, "lineSeparator"    # [B
    .param p3, "urlSafe"    # Z

    .prologue
    const/4 v2, 0x0

    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 317
    if-nez p2, :cond_9

    .line 318
    const/4 p1, 0x0

    .line 319
    sget-object p2, Lorg/apache/commons/net/util/Base64;->EMPTY_BYTE_ARRAY:[B

    .line 321
    :cond_9
    if-lez p1, :cond_52

    div-int/lit8 v1, p1, 0x4

    mul-int/lit8 v1, v1, 0x4

    :goto_f
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    .line 322
    array-length v1, p2

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    .line 323
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v3, p2

    invoke-static {p2, v2, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 324
    if-lez p1, :cond_54

    .line 325
    array-length v1, p2

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    .line 329
    :goto_23
    iget v1, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/commons/net/util/Base64;->decodeSize:I

    .line 330
    invoke-static {p2}, Lorg/apache/commons/net/util/Base64;->containsBase64Byte([B)Z

    move-result v1

    if-eqz v1, :cond_58

    .line 331
    invoke-static {p2}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    .line 332
    .local v0, "sep":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "lineSeperator must not contain base64 characters: ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .end local v0    # "sep":Ljava/lang/String;
    :cond_52
    move v1, v2

    .line 321
    goto :goto_f

    .line 327
    :cond_54
    const/4 v1, 0x4

    iput v1, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    goto :goto_23

    .line 334
    :cond_58
    if-eqz p3, :cond_5f

    sget-object v1, Lorg/apache/commons/net/util/Base64;->URL_SAFE_ENCODE_TABLE:[B

    :goto_5c
    iput-object v1, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    .line 335
    return-void

    .line 334
    :cond_5f
    sget-object v1, Lorg/apache/commons/net/util/Base64;->STANDARD_ENCODE_TABLE:[B

    goto :goto_5c
.end method

.method public constructor <init>(Z)V
    .registers 4
    .param p1, "urlSafe"    # Z

    .prologue
    .line 240
    const/16 v0, 0x4c

    sget-object v1, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    invoke-direct {p0, v0, v1, p1}, Lorg/apache/commons/net/util/Base64;-><init>(I[BZ)V

    .line 241
    return-void
.end method

.method private static containsBase64Byte([B)Z
    .registers 6
    .param p0, "arrayOctet"    # [B

    .prologue
    .line 626
    move-object v0, p0

    .local v0, "arr$":[B
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_12

    aget-byte v1, v0, v2

    .line 628
    .local v1, "element":B
    invoke-static {v1}, Lorg/apache/commons/net/util/Base64;->isBase64(B)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 629
    const/4 v4, 0x1

    .line 632
    .end local v1    # "element":B
    :goto_e
    return v4

    .line 626
    .restart local v1    # "element":B
    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 632
    .end local v1    # "element":B
    :cond_12
    const/4 v4, 0x0

    goto :goto_e
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .registers 2
    .param p0, "base64String"    # Ljava/lang/String;

    .prologue
    .line 848
    new-instance v0, Lorg/apache/commons/net/util/Base64;

    invoke-direct {v0}, Lorg/apache/commons/net/util/Base64;-><init>()V

    invoke-virtual {v0, p0}, Lorg/apache/commons/net/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static decodeBase64([B)[B
    .registers 2
    .param p0, "base64Data"    # [B

    .prologue
    .line 859
    new-instance v0, Lorg/apache/commons/net/util/Base64;

    invoke-direct {v0}, Lorg/apache/commons/net/util/Base64;-><init>()V

    invoke-virtual {v0, p0}, Lorg/apache/commons/net/util/Base64;->decode([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static decodeInteger([B)Ljava/math/BigInteger;
    .registers 4
    .param p0, "pArray"    # [B

    .prologue
    .line 976
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    invoke-static {p0}, Lorg/apache/commons/net/util/Base64;->decodeBase64([B)[B

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v0
.end method

.method public static encodeBase64([B)[B
    .registers 2
    .param p0, "binaryData"    # [B

    .prologue
    .line 643
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BZ)[B
    .registers 3
    .param p0, "binaryData"    # [B
    .param p1, "isChunked"    # Z

    .prologue
    .line 785
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZZ)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BZZ)[B
    .registers 4
    .param p0, "binaryData"    # [B
    .param p1, "isChunked"    # Z
    .param p2, "urlSafe"    # Z

    .prologue
    .line 803
    const v0, 0x7fffffff

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZZI)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64([BZZI)[B
    .registers 10
    .param p0, "binaryData"    # [B
    .param p1, "isChunked"    # Z
    .param p2, "urlSafe"    # Z
    .param p3, "maxResultSize"    # I

    .prologue
    const/4 v5, 0x0

    .line 823
    if-eqz p0, :cond_6

    array-length v3, p0

    if-nez v3, :cond_7

    .line 836
    .end local p0    # "binaryData":[B
    :cond_6
    :goto_6
    return-object p0

    .line 827
    .restart local p0    # "binaryData":[B
    :cond_7
    if-eqz p1, :cond_3c

    const/16 v3, 0x4c

    move v4, v3

    :goto_c
    if-eqz p1, :cond_3e

    sget-object v3, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    :goto_10
    invoke-static {p0, v4, v3}, Lorg/apache/commons/net/util/Base64;->getEncodeLength([BI[B)J

    move-result-wide v1

    .line 828
    .local v1, "len":J
    int-to-long v3, p3

    cmp-long v3, v1, v3

    if-lez v3, :cond_41

    .line 829
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Input array too big, the output array would be bigger ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") than the specified maxium size of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .end local v1    # "len":J
    :cond_3c
    move v4, v5

    .line 827
    goto :goto_c

    :cond_3e
    sget-object v3, Lorg/apache/commons/net/util/Base64;->EMPTY_BYTE_ARRAY:[B

    goto :goto_10

    .line 835
    .restart local v1    # "len":J
    :cond_41
    if-eqz p1, :cond_4d

    new-instance v0, Lorg/apache/commons/net/util/Base64;

    invoke-direct {v0, p2}, Lorg/apache/commons/net/util/Base64;-><init>(Z)V

    .line 836
    .local v0, "b64":Lorg/apache/commons/net/util/Base64;
    :goto_48
    invoke-virtual {v0, p0}, Lorg/apache/commons/net/util/Base64;->encode([B)[B

    move-result-object p0

    goto :goto_6

    .line 835
    .end local v0    # "b64":Lorg/apache/commons/net/util/Base64;
    :cond_4d
    new-instance v0, Lorg/apache/commons/net/util/Base64;

    sget-object v3, Lorg/apache/commons/net/util/Base64;->CHUNK_SEPARATOR:[B

    invoke-direct {v0, v5, v3, p2}, Lorg/apache/commons/net/util/Base64;-><init>(I[BZ)V

    goto :goto_48
.end method

.method public static encodeBase64Chunked([B)[B
    .registers 2
    .param p0, "binaryData"    # [B

    .prologue
    .line 721
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64String([B)Ljava/lang/String;
    .registers 2
    .param p0, "binaryData"    # [B

    .prologue
    .line 657
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64String([BZ)Ljava/lang/String;
    .registers 3
    .param p0, "binaryData"    # [B
    .param p1, "useChunking"    # Z

    .prologue
    .line 684
    invoke-static {p0, p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64StringUnChunked([B)Ljava/lang/String;
    .registers 2
    .param p0, "binaryData"    # [B

    .prologue
    .line 671
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64URLSafe([B)[B
    .registers 3
    .param p0, "binaryData"    # [B

    .prologue
    .line 697
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZZ)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeBase64URLSafeString([B)Ljava/lang/String;
    .registers 3
    .param p0, "binaryData"    # [B

    .prologue
    .line 710
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZZ)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeInteger(Ljava/math/BigInteger;)[B
    .registers 3
    .param p0, "bigInt"    # Ljava/math/BigInteger;

    .prologue
    .line 990
    if-nez p0, :cond_a

    .line 991
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "encodeInteger called with null parameter"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 993
    :cond_a
    invoke-static {p0}, Lorg/apache/commons/net/util/Base64;->toIntegerBytes(Ljava/math/BigInteger;)[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    return-object v0
.end method

.method private getBytesUtf8(Ljava/lang/String;)[B
    .registers 4
    .param p1, "pArray"    # Ljava/lang/String;

    .prologue
    .line 738
    :try_start_0
    const-string v1, "UTF8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 739
    :catch_7
    move-exception v0

    .line 740
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getEncodeLength([BI[B)J
    .registers 14
    .param p0, "pArray"    # [B
    .param p1, "chunkSize"    # I
    .param p2, "chunkSeparator"    # [B

    .prologue
    const-wide/16 v9, 0x4

    const-wide/16 v7, 0x0

    .line 949
    div-int/lit8 v5, p1, 0x4

    mul-int/lit8 p1, v5, 0x4

    .line 951
    array-length v5, p0

    mul-int/lit8 v5, v5, 0x4

    div-int/lit8 v5, v5, 0x3

    int-to-long v0, v5

    .line 952
    .local v0, "len":J
    rem-long v3, v0, v9

    .line 953
    .local v3, "mod":J
    cmp-long v5, v3, v7

    if-eqz v5, :cond_17

    .line 954
    sub-long v5, v9, v3

    add-long/2addr v0, v5

    .line 956
    :cond_17
    if-lez p1, :cond_2d

    .line 957
    int-to-long v5, p1

    rem-long v5, v0, v5

    cmp-long v5, v5, v7

    if-nez v5, :cond_2e

    const/4 v2, 0x1

    .line 958
    .local v2, "lenChunksPerfectly":Z
    :goto_21
    int-to-long v5, p1

    div-long v5, v0, v5

    array-length v7, p2

    int-to-long v7, v7

    mul-long/2addr v5, v7

    add-long/2addr v0, v5

    .line 959
    if-nez v2, :cond_2d

    .line 960
    array-length v5, p2

    int-to-long v5, v5

    add-long/2addr v0, v5

    .line 963
    .end local v2    # "lenChunksPerfectly":Z
    :cond_2d
    return-wide v0

    .line 957
    :cond_2e
    const/4 v2, 0x0

    goto :goto_21
.end method

.method public static isArrayByteBase64([B)Z
    .registers 3
    .param p0, "arrayOctet"    # [B

    .prologue
    .line 610
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_19

    .line 611
    aget-byte v1, p0, v0

    invoke-static {v1}, Lorg/apache/commons/net/util/Base64;->isBase64(B)Z

    move-result v1

    if-nez v1, :cond_16

    aget-byte v1, p0, v0

    invoke-static {v1}, Lorg/apache/commons/net/util/Base64;->isWhiteSpace(B)Z

    move-result v1

    if-nez v1, :cond_16

    .line 612
    const/4 v1, 0x0

    .line 615
    :goto_15
    return v1

    .line 610
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 615
    :cond_19
    const/4 v1, 0x1

    goto :goto_15
.end method

.method public static isBase64(B)Z
    .registers 3
    .param p0, "octet"    # B

    .prologue
    .line 597
    const/16 v0, 0x3d

    if-eq p0, v0, :cond_12

    if-ltz p0, :cond_14

    sget-object v0, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    array-length v0, v0

    if-ge p0, v0, :cond_14

    sget-object v0, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    aget-byte v0, v0, p0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private static isWhiteSpace(B)Z
    .registers 2
    .param p0, "byteToCheck"    # B

    .prologue
    .line 872
    sparse-switch p0, :sswitch_data_8

    .line 879
    const/4 v0, 0x0

    :goto_4
    return v0

    .line 877
    :sswitch_5
    const/4 v0, 0x1

    goto :goto_4

    .line 872
    nop

    :sswitch_data_8
    .sparse-switch
        0x9 -> :sswitch_5
        0xa -> :sswitch_5
        0xd -> :sswitch_5
        0x20 -> :sswitch_5
    .end sparse-switch
.end method

.method private static newStringUtf8([B)Ljava/lang/String;
    .registers 4
    .param p0, "encode"    # [B

    .prologue
    .line 896
    const/4 v0, 0x0

    .line 898
    .local v0, "str":Ljava/lang/String;
    :try_start_1
    new-instance v0, Ljava/lang/String;

    .end local v0    # "str":Ljava/lang/String;
    const-string v2, "UTF8"

    invoke-direct {v0, p0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_8
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_8} :catch_9

    .line 902
    .restart local v0    # "str":Ljava/lang/String;
    return-object v0

    .line 899
    .end local v0    # "str":Ljava/lang/String;
    :catch_9
    move-exception v1

    .line 900
    .local v1, "ue":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private reset()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1031
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    .line 1032
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    .line 1033
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    .line 1034
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    .line 1035
    iput v1, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    .line 1036
    iput-boolean v1, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    .line 1037
    return-void
.end method

.method private resizeBuffer()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 367
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-nez v1, :cond_10

    .line 368
    const/16 v1, 0x2000

    new-array v1, v1, [B

    iput-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    .line 369
    iput v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    .line 370
    iput v3, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    .line 376
    :goto_f
    return-void

    .line 372
    :cond_10
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [B

    .line 373
    .local v0, "b":[B
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget-object v2, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 374
    iput-object v0, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    goto :goto_f
.end method

.method static toIntegerBytes(Ljava/math/BigInteger;)[B
    .registers 9
    .param p0, "bigInt"    # Ljava/math/BigInteger;

    .prologue
    .line 1004
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    .line 1006
    .local v1, "bitlen":I
    add-int/lit8 v6, v1, 0x7

    shr-int/lit8 v6, v6, 0x3

    shl-int/lit8 v1, v6, 0x3

    .line 1007
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 1009
    .local v0, "bigBytes":[B
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v6

    rem-int/lit8 v6, v6, 0x8

    if-eqz v6, :cond_23

    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v6

    div-int/lit8 v6, v6, 0x8

    add-int/lit8 v6, v6, 0x1

    div-int/lit8 v7, v1, 0x8

    if-ne v6, v7, :cond_23

    .line 1024
    .end local v0    # "bigBytes":[B
    :goto_22
    return-object v0

    .line 1013
    .restart local v0    # "bigBytes":[B
    :cond_23
    const/4 v5, 0x0

    .line 1014
    .local v5, "startSrc":I
    array-length v2, v0

    .line 1017
    .local v2, "len":I
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v6

    rem-int/lit8 v6, v6, 0x8

    if-nez v6, :cond_30

    .line 1018
    const/4 v5, 0x1

    .line 1019
    add-int/lit8 v2, v2, -0x1

    .line 1021
    :cond_30
    div-int/lit8 v6, v1, 0x8

    sub-int v4, v6, v2

    .line 1022
    .local v4, "startDst":I
    div-int/lit8 v6, v1, 0x8

    new-array v3, v6, [B

    .line 1023
    .local v3, "resizedBytes":[B
    invoke-static {v0, v5, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v3

    .line 1024
    goto :goto_22
.end method


# virtual methods
.method avail()I
    .registers 3

    .prologue
    .line 362
    iget-object v0, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v0, :cond_a

    iget v0, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    sub-int/2addr v0, v1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method decode([BII)V
    .registers 12
    .param p1, "in"    # [B
    .param p2, "inPos"    # I
    .param p3, "inAvail"    # I

    .prologue
    const/4 v7, 0x1

    .line 537
    iget-boolean v4, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    if-eqz v4, :cond_6

    .line 586
    :cond_5
    :goto_5
    return-void

    .line 540
    :cond_6
    if-gez p3, :cond_a

    .line 541
    iput-boolean v7, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    .line 543
    :cond_a
    const/4 v1, 0x0

    .local v1, "i":I
    move v2, p2

    .end local p2    # "inPos":I
    .local v2, "inPos":I
    :goto_c
    if-ge v1, p3, :cond_d1

    .line 544
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v4, :cond_1c

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v4, v4

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    sub-int/2addr v4, v5

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->decodeSize:I

    if-ge v4, v5, :cond_1f

    .line 545
    :cond_1c
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->resizeBuffer()V

    .line 547
    :cond_1f
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    aget-byte v0, p1, v2

    .line 548
    .local v0, "b":B
    const/16 v4, 0x3d

    if-ne v0, v4, :cond_55

    .line 550
    iput-boolean v7, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    .line 571
    .end local v0    # "b":B
    :goto_29
    iget-boolean v4, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    if-eqz v4, :cond_5

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    if-eqz v4, :cond_5

    .line 572
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v4, v4, 0x6

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    .line 573
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    packed-switch v4, :pswitch_data_d4

    goto :goto_5

    .line 575
    :pswitch_3d
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v4, v4, 0x6

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    .line 576
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    goto :goto_5

    .line 553
    .restart local v0    # "b":B
    :cond_55
    if-ltz v0, :cond_a8

    sget-object v4, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    array-length v4, v4

    if-ge v0, v4, :cond_a8

    .line 554
    sget-object v4, Lorg/apache/commons/net/util/Base64;->DECODE_TABLE:[B

    aget-byte v3, v4, v0

    .line 555
    .local v3, "result":I
    if-ltz v3, :cond_a8

    .line 556
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    rem-int/lit8 v4, v4, 0x4

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    .line 557
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v4, v4, 0x6

    add-int/2addr v4, v3

    iput v4, p0, Lorg/apache/commons/net/util/Base64;->x:I

    .line 558
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    if-nez v4, :cond_a8

    .line 559
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 560
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 561
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 543
    .end local v3    # "result":I
    :cond_a8
    add-int/lit8 v1, v1, 0x1

    move v2, p2

    .end local p2    # "inPos":I
    .restart local v2    # "inPos":I
    goto/16 :goto_c

    .line 579
    .end local v0    # "b":B
    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    :pswitch_ad
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 580
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    goto/16 :goto_5

    .end local p2    # "inPos":I
    .restart local v2    # "inPos":I
    :cond_d1
    move p2, v2

    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    goto/16 :goto_29

    .line 573
    :pswitch_data_d4
    .packed-switch 0x2
        :pswitch_3d
        :pswitch_ad
    .end packed-switch
.end method

.method public decode(Ljava/lang/String;)[B
    .registers 3
    .param p1, "pArray"    # Ljava/lang/String;

    .prologue
    .line 733
    invoke-direct {p0, p1}, Lorg/apache/commons/net/util/Base64;->getBytesUtf8(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/util/Base64;->decode([B)[B

    move-result-object v0

    return-object v0
.end method

.method public decode([B)[B
    .registers 8
    .param p1, "pArray"    # [B

    .prologue
    const/4 v5, 0x0

    .line 752
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->reset()V

    .line 753
    if-eqz p1, :cond_9

    array-length v4, p1

    if-nez v4, :cond_b

    :cond_9
    move-object v3, p1

    .line 770
    :goto_a
    return-object v3

    .line 756
    :cond_b
    array-length v4, p1

    mul-int/lit8 v4, v4, 0x3

    div-int/lit8 v4, v4, 0x4

    int-to-long v1, v4

    .line 757
    .local v1, "len":J
    long-to-int v4, v1

    new-array v0, v4, [B

    .line 758
    .local v0, "buf":[B
    array-length v4, v0

    invoke-virtual {p0, v0, v5, v4}, Lorg/apache/commons/net/util/Base64;->setInitialBuffer([BII)V

    .line 759
    array-length v4, p1

    invoke-virtual {p0, p1, v5, v4}, Lorg/apache/commons/net/util/Base64;->decode([BII)V

    .line 760
    const/4 v4, -0x1

    invoke-virtual {p0, p1, v5, v4}, Lorg/apache/commons/net/util/Base64;->decode([BII)V

    .line 768
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    new-array v3, v4, [B

    .line 769
    .local v3, "result":[B
    array-length v4, v3

    invoke-virtual {p0, v3, v5, v4}, Lorg/apache/commons/net/util/Base64;->readResults([BII)I

    goto :goto_a
.end method

.method encode([BII)V
    .registers 13
    .param p1, "in"    # [B
    .param p2, "inPos"    # I
    .param p3, "inAvail"    # I

    .prologue
    const/16 v8, 0x3d

    const/4 v7, 0x0

    .line 449
    iget-boolean v3, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    if-eqz v3, :cond_8

    .line 511
    :cond_7
    :goto_7
    return-void

    .line 454
    :cond_8
    if-gez p3, :cond_d1

    .line 455
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    .line 456
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v3, :cond_1b

    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v3, v3

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    sub-int/2addr v3, v4

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    if-ge v3, v4, :cond_1e

    .line 457
    :cond_1b
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->resizeBuffer()V

    .line 459
    :cond_1e
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    packed-switch v3, :pswitch_data_180

    .line 482
    :cond_23
    :goto_23
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    if-lez v3, :cond_7

    iget v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    if-lez v3, :cond_7

    .line 483
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v6, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v6, v6

    invoke-static {v3, v7, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 484
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v4, v4

    add-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    goto :goto_7

    .line 461
    :pswitch_40
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x2

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 462
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 464
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    sget-object v4, Lorg/apache/commons/net/util/Base64;->STANDARD_ENCODE_TABLE:[B

    if-ne v3, v4, :cond_23

    .line 465
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    aput-byte v8, v3, v4

    .line 466
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    aput-byte v8, v3, v4

    goto :goto_23

    .line 471
    :pswitch_83
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0xa

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 472
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 473
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v6, v6, 0x2

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 475
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    sget-object v4, Lorg/apache/commons/net/util/Base64;->STANDARD_ENCODE_TABLE:[B

    if-ne v3, v4, :cond_23

    .line 476
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    aput-byte v8, v3, v4

    goto/16 :goto_23

    .line 487
    :cond_d1
    const/4 v1, 0x0

    .local v1, "i":I
    move v2, p2

    .end local p2    # "inPos":I
    .local v2, "inPos":I
    :goto_d3
    if-ge v1, p3, :cond_17c

    .line 488
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v3, :cond_e3

    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    array-length v3, v3

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    sub-int/2addr v3, v4

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->encodeSize:I

    if-ge v3, v4, :cond_e6

    .line 489
    :cond_e3
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->resizeBuffer()V

    .line 491
    :cond_e6
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    rem-int/lit8 v3, v3, 0x3

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    .line 492
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    aget-byte v0, p1, v2

    .line 493
    .local v0, "b":I
    if-gez v0, :cond_f8

    .line 494
    add-int/lit16 v0, v0, 0x100

    .line 496
    :cond_f8
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shl-int/lit8 v3, v3, 0x8

    add-int/2addr v3, v0

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->x:I

    .line 497
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->modulus:I

    if-nez v3, :cond_177

    .line 498
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x12

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 499
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0xc

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 500
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    shr-int/lit8 v6, v6, 0x6

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 501
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    iget v6, p0, Lorg/apache/commons/net/util/Base64;->x:I

    and-int/lit8 v6, v6, 0x3f

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 502
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    add-int/lit8 v3, v3, 0x4

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    .line 503
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    if-lez v3, :cond_177

    iget v3, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    if-gt v3, v4, :cond_177

    .line 504
    iget-object v3, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v5, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v6, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v6, v6

    invoke-static {v3, v7, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 505
    iget v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    array-length v4, v4

    add-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    .line 506
    iput v7, p0, Lorg/apache/commons/net/util/Base64;->currentLinePos:I

    .line 487
    :cond_177
    add-int/lit8 v1, v1, 0x1

    move v2, p2

    .end local p2    # "inPos":I
    .restart local v2    # "inPos":I
    goto/16 :goto_d3

    .end local v0    # "b":I
    :cond_17c
    move p2, v2

    .end local v2    # "inPos":I
    .restart local p2    # "inPos":I
    goto/16 :goto_7

    .line 459
    nop

    :pswitch_data_180
    .packed-switch 0x1
        :pswitch_40
        :pswitch_83
    .end packed-switch
.end method

.method public encode([B)[B
    .registers 9
    .param p1, "pArray"    # [B

    .prologue
    const/4 v6, 0x0

    .line 913
    invoke-direct {p0}, Lorg/apache/commons/net/util/Base64;->reset()V

    .line 914
    if-eqz p1, :cond_9

    array-length v4, p1

    if-nez v4, :cond_b

    :cond_9
    move-object v0, p1

    .line 933
    :cond_a
    :goto_a
    return-object v0

    .line 917
    :cond_b
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    iget-object v5, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    invoke-static {p1, v4, v5}, Lorg/apache/commons/net/util/Base64;->getEncodeLength([BI[B)J

    move-result-wide v1

    .line 918
    .local v1, "len":J
    long-to-int v4, v1

    new-array v0, v4, [B

    .line 919
    .local v0, "buf":[B
    array-length v4, v0

    invoke-virtual {p0, v0, v6, v4}, Lorg/apache/commons/net/util/Base64;->setInitialBuffer([BII)V

    .line 920
    array-length v4, p1

    invoke-virtual {p0, p1, v6, v4}, Lorg/apache/commons/net/util/Base64;->encode([BII)V

    .line 921
    const/4 v4, -0x1

    invoke-virtual {p0, p1, v6, v4}, Lorg/apache/commons/net/util/Base64;->encode([BII)V

    .line 923
    iget-object v4, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eq v4, v0, :cond_2a

    .line 924
    array-length v4, v0

    invoke-virtual {p0, v0, v6, v4}, Lorg/apache/commons/net/util/Base64;->readResults([BII)I

    .line 928
    :cond_2a
    invoke-virtual {p0}, Lorg/apache/commons/net/util/Base64;->isUrlSafe()Z

    move-result v4

    if-eqz v4, :cond_a

    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    array-length v5, v0

    if-ge v4, v5, :cond_a

    .line 929
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    new-array v3, v4, [B

    .line 930
    .local v3, "smallerBuf":[B
    iget v4, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    invoke-static {v0, v6, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 931
    move-object v0, v3

    goto :goto_a
.end method

.method public encodeToString([B)Ljava/lang/String;
    .registers 3
    .param p1, "pArray"    # [B

    .prologue
    .line 892
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/util/Base64;->encode([B)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->newStringUtf8([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getLineLength()I
    .registers 2

    .prologue
    .line 1042
    iget v0, p0, Lorg/apache/commons/net/util/Base64;->lineLength:I

    return v0
.end method

.method getLineSeparator()[B
    .registers 2

    .prologue
    .line 1046
    iget-object v0, p0, Lorg/apache/commons/net/util/Base64;->lineSeparator:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method hasData()Z
    .registers 2

    .prologue
    .line 353
    iget-object v0, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isUrlSafe()Z
    .registers 3

    .prologue
    .line 344
    iget-object v0, p0, Lorg/apache/commons/net/util/Base64;->encodeTable:[B

    sget-object v1, Lorg/apache/commons/net/util/Base64;->URL_SAFE_ENCODE_TABLE:[B

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method readResults([BII)I
    .registers 8
    .param p1, "b"    # [B
    .param p2, "bPos"    # I
    .param p3, "bAvail"    # I

    .prologue
    const/4 v3, 0x0

    .line 391
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eqz v1, :cond_29

    .line 392
    invoke-virtual {p0}, Lorg/apache/commons/net/util/Base64;->avail()I

    move-result v1

    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 393
    .local v0, "len":I
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    if-eq v1, p1, :cond_26

    .line 394
    iget-object v1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    iget v2, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 395
    iget v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    .line 396
    iget v1, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    iget v2, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    if-lt v1, v2, :cond_25

    .line 397
    iput-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    .line 406
    .end local v0    # "len":I
    :cond_25
    :goto_25
    return v0

    .line 402
    .restart local v0    # "len":I
    :cond_26
    iput-object v3, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    goto :goto_25

    .line 406
    .end local v0    # "len":I
    :cond_29
    iget-boolean v1, p0, Lorg/apache/commons/net/util/Base64;->eof:Z

    if-eqz v1, :cond_30

    const/4 v1, -0x1

    :goto_2e
    move v0, v1

    goto :goto_25

    :cond_30
    const/4 v1, 0x0

    goto :goto_2e
.end method

.method setInitialBuffer([BII)V
    .registers 5
    .param p1, "out"    # [B
    .param p2, "outPos"    # I
    .param p3, "outAvail"    # I

    .prologue
    .line 423
    if-eqz p1, :cond_b

    array-length v0, p1

    if-ne v0, p3, :cond_b

    .line 424
    iput-object p1, p0, Lorg/apache/commons/net/util/Base64;->buffer:[B

    .line 425
    iput p2, p0, Lorg/apache/commons/net/util/Base64;->pos:I

    .line 426
    iput p2, p0, Lorg/apache/commons/net/util/Base64;->readPos:I

    .line 428
    :cond_b
    return-void
.end method
