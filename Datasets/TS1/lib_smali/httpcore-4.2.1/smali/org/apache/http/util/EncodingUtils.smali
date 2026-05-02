.class public final Lorg/apache/http/util/EncodingUtils;
.super Ljava/lang/Object;
.source "EncodingUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 176
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 177
    return-void
.end method

.method public static getAsciiBytes(Ljava/lang/String;)[B
    .registers 4
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 124
    if-nez p0, :cond_a

    .line 125
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Parameter may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 129
    :cond_a
    :try_start_a
    sget-object v1, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_13
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_13} :catch_15

    move-result-object v1

    return-object v1

    .line 130
    :catch_15
    move-exception v0

    .line 131
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/Error;

    const-string v2, "HttpClient requires ASCII support"

    invoke-direct {v1, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getAsciiString([B)Ljava/lang/String;
    .registers 3
    .param p0, "data"    # [B

    .prologue
    .line 167
    if-nez p0, :cond_a

    .line 168
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameter may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 170
    :cond_a
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/apache/http/util/EncodingUtils;->getAsciiString([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAsciiString([BII)Ljava/lang/String;
    .registers 6
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 147
    if-nez p0, :cond_a

    .line 148
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Parameter may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 152
    :cond_a
    :try_start_a
    new-instance v1, Ljava/lang/String;

    sget-object v2, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p0, p1, p2, v2}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_15
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_15} :catch_16

    return-object v1

    .line 153
    :catch_16
    move-exception v0

    .line 154
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/Error;

    const-string v2, "HttpClient requires ASCII support"

    invoke-direct {v1, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getBytes(Ljava/lang/String;Ljava/lang/String;)[B
    .registers 5
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 101
    if-nez p0, :cond_a

    .line 102
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "data may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 105
    :cond_a
    if-eqz p1, :cond_12

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1a

    .line 106
    :cond_12
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "charset may not be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 110
    :cond_1a
    :try_start_1a
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_1d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1a .. :try_end_1d} :catch_1f

    move-result-object v1

    .line 112
    :goto_1e
    return-object v1

    .line 111
    :catch_1f
    move-exception v0

    .line 112
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    goto :goto_1e
.end method

.method public static getString([BIILjava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "charset"    # Ljava/lang/String;

    .prologue
    .line 59
    if-nez p0, :cond_a

    .line 60
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Parameter may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 63
    :cond_a
    if-eqz p3, :cond_12

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1a

    .line 64
    :cond_12
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "charset may not be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 68
    :cond_1a
    :try_start_1a
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2, p3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1a .. :try_end_1f} :catch_20

    .line 70
    :goto_1f
    return-object v1

    .line 69
    :catch_20
    move-exception v0

    .line 70
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2}, Ljava/lang/String;-><init>([BII)V

    goto :goto_1f
.end method

.method public static getString([BLjava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "data"    # [B
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 85
    if-nez p0, :cond_a

    .line 86
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameter may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_a
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/apache/http/util/EncodingUtils;->getString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
