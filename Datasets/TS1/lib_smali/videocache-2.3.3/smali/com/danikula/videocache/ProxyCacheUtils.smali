.class public Lcom/danikula/videocache/ProxyCacheUtils;
.super Ljava/lang/Object;
.source "ProxyCacheUtils.java"


# static fields
.field static final DEFAULT_BUFFER_SIZE:I = 0x2000

.field static final LOG_TAG:Ljava/lang/String; = "ProxyCache"

.field static final MAX_ARRAY_PREVIEW:I = 0x10


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static assertBuffer([BJI)V
    .registers 9
    .param p0, "buffer"    # [B
    .param p1, "offset"    # J
    .param p3, "length"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 37
    const-string v0, "Buffer must be not null!"

    invoke-static {p0, v0}, Lcom/danikula/videocache/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 38
    const-wide/16 v3, 0x0

    cmp-long v0, p1, v3

    if-ltz v0, :cond_1e

    move v0, v1

    :goto_e
    const-string v3, "Data offset must be positive!"

    invoke-static {v0, v3}, Lcom/danikula/videocache/Preconditions;->checkArgument(ZLjava/lang/String;)V

    .line 39
    if-ltz p3, :cond_20

    array-length v0, p0

    if-gt p3, v0, :cond_20

    :goto_18
    const-string v0, "Length must be in range [0..buffer.length]"

    invoke-static {v1, v0}, Lcom/danikula/videocache/Preconditions;->checkArgument(ZLjava/lang/String;)V

    .line 40
    return-void

    :cond_1e
    move v0, v2

    .line 38
    goto :goto_e

    :cond_20
    move v1, v2

    .line 39
    goto :goto_18
.end method

.method private static bytesToHexString([B)Ljava/lang/String;
    .registers 10
    .param p0, "bytes"    # [B

    .prologue
    .line 89
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 90
    .local v4, "sb":Ljava/lang/StringBuffer;
    move-object v0, p0

    .local v0, "arr$":[B
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_8
    if-ge v2, v3, :cond_22

    aget-byte v1, v0, v2

    .line 91
    .local v1, "b":B
    const-string v5, "%02x"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 93
    .end local v1    # "b":B
    :cond_22
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method static close(Ljava/io/Closeable;)V
    .registers 4
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 69
    if-eqz p0, :cond_5

    .line 71
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 76
    :cond_5
    :goto_5
    return-void

    .line 72
    :catch_6
    move-exception v0

    .line 73
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "ProxyCache"

    const-string v2, "Error closing resource"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method

.method public static computeMD5(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 80
    :try_start_0
    const-string v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 81
    .local v2, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    .line 82
    .local v0, "digestBytes":[B
    invoke-static {v0}, Lcom/danikula/videocache/ProxyCacheUtils;->bytesToHexString([B)Ljava/lang/String;
    :try_end_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_11} :catch_13

    move-result-object v3

    return-object v3

    .line 83
    .end local v0    # "digestBytes":[B
    .end local v2    # "messageDigest":Ljava/security/MessageDigest;
    :catch_13
    move-exception v1

    .line 84
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method static decode(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 62
    :try_start_0
    const-string v1, "utf-8"

    invoke-static {p0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 63
    :catch_7
    move-exception v0

    .line 64
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Error decoding url"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 54
    :try_start_0
    const-string v1, "utf-8"

    invoke-static {p0, v1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 55
    :catch_7
    move-exception v0

    .line 56
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Error encoding url"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static getSupposablyMime(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v1

    .line 32
    .local v1, "mimes":Landroid/webkit/MimeTypeMap;
    invoke-static {p0}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "extension":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_10

    const/4 v2, 0x0

    :goto_f
    return-object v2

    :cond_10
    invoke-virtual {v1, v0}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_f
.end method

.method static preview([BI)Ljava/lang/String;
    .registers 8
    .param p0, "data"    # [B
    .param p1, "length"    # I

    .prologue
    const/4 v5, 0x0

    .line 43
    const/16 v3, 0x10

    invoke-static {p1, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 44
    .local v2, "previewLength":I
    invoke-static {p0, v5, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    .line 45
    .local v0, "dataRange":[B
    invoke-static {v0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, "preview":Ljava/lang/String;
    if-ge v2, p1, :cond_32

    .line 47
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", ...]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 49
    :cond_32
    return-object v1
.end method
