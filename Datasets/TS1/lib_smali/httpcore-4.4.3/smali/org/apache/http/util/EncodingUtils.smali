.class public final Lorg/apache/http/util/EncodingUtils;
.super Ljava/lang/Object;
.source "EncodingUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 142
    return-void
.end method

.method public static getAsciiBytes(Ljava/lang/String;)[B
    .registers 2
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 106
    const-string v0, "Input"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    return-object v0
.end method

.method public static getAsciiString([B)Ljava/lang/String;
    .registers 3
    .param p0, "data"    # [B

    .prologue
    .line 134
    const-string v0, "Input"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 135
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/apache/http/util/EncodingUtils;->getAsciiString([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAsciiString([BII)Ljava/lang/String;
    .registers 5
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 121
    const-string v0, "Input"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 122
    new-instance v0, Ljava/lang/String;

    sget-object v1, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, p1, p2, v1}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object v0
.end method

.method public static getBytes(Ljava/lang/String;Ljava/lang/String;)[B
    .registers 4
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 90
    const-string v1, "Input"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    const-string v1, "Charset"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notEmpty(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 93
    :try_start_a
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v1

    .line 95
    :goto_e
    return-object v1

    .line 94
    :catch_f
    move-exception v0

    .line 95
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    goto :goto_e
.end method

.method public static getString([BIILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "charset"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string v1, "Input"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 58
    const-string v1, "Charset"

    invoke-static {p3, v1}, Lorg/apache/http/util/Args;->notEmpty(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 60
    :try_start_a
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2, p3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_f} :catch_10

    .line 62
    :goto_f
    return-object v1

    .line 61
    :catch_10
    move-exception v0

    .line 62
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2}, Ljava/lang/String;-><init>([BII)V

    goto :goto_f
.end method

.method public static getString([BLjava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "data"    # [B
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 77
    const-string v0, "Input"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 78
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/apache/http/util/EncodingUtils;->getString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
