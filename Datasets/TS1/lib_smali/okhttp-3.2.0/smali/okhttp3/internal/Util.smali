.class public final Lokhttp3/internal/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field public static final EMPTY_BYTE_ARRAY:[B

.field public static final EMPTY_STRING_ARRAY:[Ljava/lang/String;

.field public static final UTC:Ljava/util/TimeZone;

.field public static final UTF_8:Ljava/nio/charset/Charset;

.field private static final VERIFY_AS_IP_ADDRESS:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 47
    new-array v0, v1, [B

    sput-object v0, Lokhttp3/internal/Util;->EMPTY_BYTE_ARRAY:[B

    .line 48
    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lokhttp3/internal/Util;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 51
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/Util;->UTF_8:Ljava/nio/charset/Charset;

    .line 54
    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/Util;->UTC:Ljava/util/TimeZone;

    .line 66
    const-string v0, "([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lokhttp3/internal/Util;->VERIFY_AS_IP_ADDRESS:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method

.method public static checkOffsetAndCount(JJJ)V
    .registers 10
    .param p0, "arrayLength"    # J
    .param p2, "offset"    # J
    .param p4, "count"    # J

    .prologue
    .line 73
    or-long v0, p2, p4

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_12

    cmp-long v0, p2, p0

    if-gtz v0, :cond_12

    sub-long v0, p0, p2

    cmp-long v0, v0, p4

    if-gez v0, :cond_18

    .line 74
    :cond_12
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 76
    :cond_18
    return-void
.end method

.method public static closeAll(Ljava/io/Closeable;Ljava/io/Closeable;)V
    .registers 5
    .param p0, "a"    # Ljava/io/Closeable;
    .param p1, "b"    # Ljava/io/Closeable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    const/4 v1, 0x0

    .line 137
    .local v1, "thrown":Ljava/lang/Throwable;
    :try_start_1
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_4} :catch_a

    .line 142
    :goto_4
    :try_start_4
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_7} :catch_d

    .line 146
    :cond_7
    :goto_7
    if-nez v1, :cond_12

    return-void

    .line 138
    :catch_a
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/Throwable;
    move-object v1, v0

    goto :goto_4

    .line 143
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_d
    move-exception v0

    .line 144
    .restart local v0    # "e":Ljava/lang/Throwable;
    if-nez v1, :cond_7

    move-object v1, v0

    goto :goto_7

    .line 147
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_12
    instance-of v2, v1, Ljava/io/IOException;

    if-eqz v2, :cond_19

    check-cast v1, Ljava/io/IOException;

    .end local v1    # "thrown":Ljava/lang/Throwable;
    throw v1

    .line 148
    .restart local v1    # "thrown":Ljava/lang/Throwable;
    :cond_19
    instance-of v2, v1, Ljava/lang/RuntimeException;

    if-eqz v2, :cond_20

    check-cast v1, Ljava/lang/RuntimeException;

    .end local v1    # "thrown":Ljava/lang/Throwable;
    throw v1

    .line 149
    .restart local v1    # "thrown":Ljava/lang/Throwable;
    :cond_20
    instance-of v2, v1, Ljava/lang/Error;

    if-eqz v2, :cond_27

    check-cast v1, Ljava/lang/Error;

    .end local v1    # "thrown":Ljava/lang/Throwable;
    throw v1

    .line 150
    .restart local v1    # "thrown":Ljava/lang/Throwable;
    :cond_27
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .registers 3
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 88
    if-eqz p0, :cond_5

    .line 90
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_8

    .line 96
    :cond_5
    :goto_5
    return-void

    .line 91
    :catch_6
    move-exception v0

    .line 92
    .local v0, "rethrown":Ljava/lang/RuntimeException;
    throw v0

    .line 93
    .end local v0    # "rethrown":Ljava/lang/RuntimeException;
    :catch_8
    move-exception v1

    goto :goto_5
.end method

.method public static closeQuietly(Ljava/net/ServerSocket;)V
    .registers 3
    .param p0, "serverSocket"    # Ljava/net/ServerSocket;

    .prologue
    .line 120
    if-eqz p0, :cond_5

    .line 122
    :try_start_2
    invoke-virtual {p0}, Ljava/net/ServerSocket;->close()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_8

    .line 128
    :cond_5
    :goto_5
    return-void

    .line 123
    :catch_6
    move-exception v0

    .line 124
    .local v0, "rethrown":Ljava/lang/RuntimeException;
    throw v0

    .line 125
    .end local v0    # "rethrown":Ljava/lang/RuntimeException;
    :catch_8
    move-exception v1

    goto :goto_5
.end method

.method public static closeQuietly(Ljava/net/Socket;)V
    .registers 4
    .param p0, "socket"    # Ljava/net/Socket;

    .prologue
    .line 103
    if-eqz p0, :cond_5

    .line 105
    :try_start_2
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_5
    .catch Ljava/lang/AssertionError; {:try_start_2 .. :try_end_5} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_5} :catch_e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5} :catch_10

    .line 113
    :cond_5
    :goto_5
    return-void

    .line 106
    :catch_6
    move-exception v0

    .line 107
    .local v0, "e":Ljava/lang/AssertionError;
    invoke-static {v0}, Lokhttp3/internal/Util;->isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z

    move-result v2

    if-nez v2, :cond_5

    throw v0

    .line 108
    .end local v0    # "e":Ljava/lang/AssertionError;
    :catch_e
    move-exception v1

    .line 109
    .local v1, "rethrown":Ljava/lang/RuntimeException;
    throw v1

    .line 110
    .end local v1    # "rethrown":Ljava/lang/RuntimeException;
    :catch_10
    move-exception v2

    goto :goto_5
.end method

.method public static concat([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 5
    .param p0, "array"    # [Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 329
    array-length v1, p0

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 330
    .local v0, "result":[Ljava/lang/String;
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 331
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-object p1, v0, v1

    .line 332
    return-object v0
.end method

.method public static contains([Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "array"    # [Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 325
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static containsInvalidHostnameAsciiCodes(Ljava/lang/String;)Z
    .registers 6
    .param p0, "hostnameAscii"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 427
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_21

    .line 428
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 432
    .local v0, "c":C
    const/16 v3, 0x1f

    if-le v0, v3, :cond_14

    const/16 v3, 0x7f

    if-lt v0, v3, :cond_15

    .line 442
    .end local v0    # "c":C
    :cond_14
    :goto_14
    return v2

    .line 438
    .restart local v0    # "c":C
    :cond_15
    const-string v3, " #%/:?@[\\]"

    invoke-virtual {v3, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_14

    .line 427
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 442
    .end local v0    # "c":C
    :cond_21
    const/4 v2, 0x0

    goto :goto_14
.end method

.method public static delimiterOffset(Ljava/lang/String;IIC)I
    .registers 6
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I
    .param p3, "delimiter"    # C

    .prologue
    .line 398
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_d

    .line 399
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, p3, :cond_a

    .line 401
    .end local v0    # "i":I
    :goto_9
    return v0

    .line 398
    .restart local v0    # "i":I
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_d
    move v0, p2

    .line 401
    goto :goto_9
.end method

.method public static delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I
    .registers 7
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I
    .param p3, "delimiters"    # Ljava/lang/String;

    .prologue
    .line 387
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_12

    .line 388
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p3, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_f

    .line 390
    .end local v0    # "i":I
    :goto_e
    return v0

    .line 387
    .restart local v0    # "i":I
    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_12
    move v0, p2

    .line 390
    goto :goto_e
.end method

.method public static discard(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z
    .registers 5
    .param p0, "source"    # Lokio/Source;
    .param p1, "timeout"    # I
    .param p2, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 160
    :try_start_0
    invoke-static {p0, p1, p2}, Lokhttp3/internal/Util;->skipAll(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result v1

    .line 162
    :goto_4
    return v1

    .line 161
    :catch_5
    move-exception v0

    .line 162
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public static domainToAscii(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 412
    :try_start_1
    invoke-static {p0}, Ljava/net/IDN;->toASCII(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 413
    .local v1, "result":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_13

    move-object v1, v2

    .line 422
    .end local v1    # "result":Ljava/lang/String;
    :cond_12
    :goto_12
    return-object v1

    .line 416
    .restart local v1    # "result":Ljava/lang/String;
    :cond_13
    invoke-static {v1}, Lokhttp3/internal/Util;->containsInvalidHostnameAsciiCodes(Ljava/lang/String;)Z
    :try_end_16
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_16} :catch_1b

    move-result v3

    if-eqz v3, :cond_12

    move-object v1, v2

    .line 417
    goto :goto_12

    .line 421
    .end local v1    # "result":Ljava/lang/String;
    :catch_1b
    move-exception v0

    .local v0, "e":Ljava/lang/IllegalArgumentException;
    move-object v1, v2

    .line 422
    goto :goto_12
.end method

.method public static equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    .line 80
    if-eq p0, p1, :cond_a

    if-eqz p0, :cond_c

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static hostHeader(Lokhttp3/HttpUrl;Z)Ljava/lang/String;
    .registers 5
    .param p0, "url"    # Lokhttp3/HttpUrl;
    .param p1, "includeDefaultPort"    # Z

    .prologue
    .line 290
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_55

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 291
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 293
    .local v0, "host":Ljava/lang/String;
    :goto_29
    if-nez p1, :cond_39

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->port()I

    move-result v1

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lokhttp3/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v2

    if-eq v1, v2, :cond_54

    :cond_39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 294
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->port()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v0    # "host":Ljava/lang/String;
    :cond_54
    return-object v0

    .line 292
    :cond_55
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    goto :goto_29
.end method

.method public static immutableList(Ljava/util/List;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 239
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static varargs immutableList([Ljava/lang/Object;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 244
    .local p0, "elements":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static immutableMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;TV;>;)",
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 249
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private static intersect([Ljava/lang/Object;[Ljava/lang/Object;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;[TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "first":[Ljava/lang/Object;, "[TT;"
    .local p1, "second":[Ljava/lang/Object;, "[TT;"
    const/4 v4, 0x0

    .line 277
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 278
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    array-length v6, p0

    move v5, v4

    :goto_8
    if-ge v5, v6, :cond_22

    aget-object v0, p0, v5

    .line 279
    .local v0, "a":Ljava/lang/Object;, "TT;"
    array-length v7, p1

    move v3, v4

    :goto_e
    if-ge v3, v7, :cond_1b

    aget-object v1, p1, v3

    .line 280
    .local v1, "b":Ljava/lang/Object;, "TT;"
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1f

    .line 281
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 278
    .end local v1    # "b":Ljava/lang/Object;, "TT;"
    :cond_1b
    add-int/lit8 v3, v5, 0x1

    move v5, v3

    goto :goto_8

    .line 279
    .restart local v1    # "b":Ljava/lang/Object;, "TT;"
    :cond_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 286
    .end local v0    # "a":Ljava/lang/Object;, "TT;"
    .end local v1    # "b":Ljava/lang/Object;, "TT;"
    :cond_22
    return-object v2
.end method

.method public static intersect(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[TT;[TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 268
    .local p0, "arrayType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "first":[Ljava/lang/Object;, "[TT;"
    .local p2, "second":[Ljava/lang/Object;, "[TT;"
    invoke-static {p1, p2}, Lokhttp3/internal/Util;->intersect([Ljava/lang/Object;[Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 269
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {p0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static isAndroidGetsocknameError(Ljava/lang/AssertionError;)Z
    .registers 3
    .param p0, "e"    # Ljava/lang/AssertionError;

    .prologue
    .line 320
    invoke-virtual {p0}, Ljava/lang/AssertionError;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Ljava/lang/AssertionError;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1a

    .line 321
    invoke-virtual {p0}, Ljava/lang/AssertionError;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getsockname failed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public static md5Hex(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 196
    :try_start_0
    const-string v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 197
    .local v2, "messageDigest":Ljava/security/MessageDigest;
    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    .line 198
    .local v1, "md5bytes":[B
    invoke-static {v1}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lokio/ByteString;->hex()Ljava/lang/String;
    :try_end_17
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_17} :catch_19
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v3

    return-object v3

    .line 199
    .end local v1    # "md5bytes":[B
    .end local v2    # "messageDigest":Ljava/security/MessageDigest;
    :catch_19
    move-exception v0

    .line 200
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public static sha1(Lokio/ByteString;)Lokio/ByteString;
    .registers 5
    .param p0, "s"    # Lokio/ByteString;

    .prologue
    .line 218
    :try_start_0
    const-string v3, "SHA-1"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 219
    .local v1, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Lokio/ByteString;->toByteArray()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    .line 220
    .local v2, "sha1Bytes":[B
    invoke-static {v2}, Lokio/ByteString;->of([B)Lokio/ByteString;
    :try_end_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_11} :catch_13

    move-result-object v3

    return-object v3

    .line 221
    .end local v1    # "messageDigest":Ljava/security/MessageDigest;
    .end local v2    # "sha1Bytes":[B
    :catch_13
    move-exception v0

    .line 222
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public static sha256(Lokio/ByteString;)Lokio/ByteString;
    .registers 5
    .param p0, "s"    # Lokio/ByteString;

    .prologue
    .line 229
    :try_start_0
    const-string v3, "SHA-256"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 230
    .local v1, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Lokio/ByteString;->toByteArray()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    .line 231
    .local v2, "sha1Bytes":[B
    invoke-static {v2}, Lokio/ByteString;->of([B)Lokio/ByteString;
    :try_end_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_11} :catch_13

    move-result-object v3

    return-object v3

    .line 232
    .end local v1    # "messageDigest":Ljava/security/MessageDigest;
    .end local v2    # "sha1Bytes":[B
    :catch_13
    move-exception v0

    .line 233
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public static shaBase64(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 207
    :try_start_0
    const-string v3, "SHA-1"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 208
    .local v1, "messageDigest":Ljava/security/MessageDigest;
    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    .line 209
    .local v2, "sha1Bytes":[B
    invoke-static {v2}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v3

    invoke-virtual {v3}, Lokio/ByteString;->base64()Ljava/lang/String;
    :try_end_17
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_17} :catch_19
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_17} :catch_19

    move-result-object v3

    return-object v3

    .line 210
    .end local v1    # "messageDigest":Ljava/security/MessageDigest;
    .end local v2    # "sha1Bytes":[B
    :catch_19
    move-exception v0

    .line 211
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3
.end method

.method public static skipAll(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z
    .registers 15
    .param p0, "source"    # Lokio/Source;
    .param p1, "duration"    # I
    .param p2, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide v6, 0x7fffffffffffffffL

    .line 171
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 172
    .local v1, "now":J
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v8

    invoke-virtual {v8}, Lokio/Timeout;->hasDeadline()Z

    move-result v8

    if-eqz v8, :cond_52

    .line 173
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v8

    invoke-virtual {v8}, Lokio/Timeout;->deadlineNanoTime()J

    move-result-wide v8

    sub-long v3, v8, v1

    .line 175
    .local v3, "originalDuration":J
    :goto_1d
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v8

    int-to-long v9, p1

    invoke-virtual {p2, v9, v10}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v9

    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    add-long/2addr v9, v1

    invoke-virtual {v8, v9, v10}, Lokio/Timeout;->deadlineNanoTime(J)Lokio/Timeout;

    .line 177
    :try_start_2e
    new-instance v5, Lokio/Buffer;

    invoke-direct {v5}, Lokio/Buffer;-><init>()V

    .line 178
    .local v5, "skipBuffer":Lokio/Buffer;
    :goto_33
    const-wide/16 v8, 0x800

    invoke-interface {p0, v5, v8, v9}, Lokio/Source;->read(Lokio/Buffer;J)J

    move-result-wide v8

    const-wide/16 v10, -0x1

    cmp-long v8, v8, v10

    if-eqz v8, :cond_54

    .line 179
    invoke-virtual {v5}, Lokio/Buffer;->clear()V
    :try_end_42
    .catch Ljava/io/InterruptedIOException; {:try_start_2e .. :try_end_42} :catch_43
    .catchall {:try_start_2e .. :try_end_42} :catchall_76

    goto :goto_33

    .line 182
    .end local v5    # "skipBuffer":Lokio/Buffer;
    :catch_43
    move-exception v0

    .line 183
    .local v0, "e":Ljava/io/InterruptedIOException;
    const/4 v8, 0x0

    .line 185
    cmp-long v6, v3, v6

    if-nez v6, :cond_6c

    .line 186
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    invoke-virtual {v6}, Lokio/Timeout;->clearDeadline()Lokio/Timeout;

    :goto_50
    move v6, v8

    .line 188
    .end local v0    # "e":Ljava/io/InterruptedIOException;
    :goto_51
    return v6

    .end local v3    # "originalDuration":J
    :cond_52
    move-wide v3, v6

    .line 173
    goto :goto_1d

    .line 181
    .restart local v3    # "originalDuration":J
    .restart local v5    # "skipBuffer":Lokio/Buffer;
    :cond_54
    const/4 v8, 0x1

    .line 185
    cmp-long v6, v3, v6

    if-nez v6, :cond_62

    .line 186
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    invoke-virtual {v6}, Lokio/Timeout;->clearDeadline()Lokio/Timeout;

    :goto_60
    move v6, v8

    .line 188
    goto :goto_51

    :cond_62
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    add-long v9, v1, v3

    invoke-virtual {v6, v9, v10}, Lokio/Timeout;->deadlineNanoTime(J)Lokio/Timeout;

    goto :goto_60

    .end local v5    # "skipBuffer":Lokio/Buffer;
    .restart local v0    # "e":Ljava/io/InterruptedIOException;
    :cond_6c
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    add-long v9, v1, v3

    invoke-virtual {v6, v9, v10}, Lokio/Timeout;->deadlineNanoTime(J)Lokio/Timeout;

    goto :goto_50

    .line 185
    .end local v0    # "e":Ljava/io/InterruptedIOException;
    :catchall_76
    move-exception v8

    cmp-long v6, v3, v6

    if-nez v6, :cond_83

    .line 186
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    invoke-virtual {v6}, Lokio/Timeout;->clearDeadline()Lokio/Timeout;

    .line 188
    :goto_82
    throw v8

    :cond_83
    invoke-interface {p0}, Lokio/Source;->timeout()Lokio/Timeout;

    move-result-object v6

    add-long v9, v1, v3

    invoke-virtual {v6, v9, v10}, Lokio/Timeout;->deadlineNanoTime(J)Lokio/Timeout;

    goto :goto_82
.end method

.method public static skipLeadingAsciiWhitespace(Ljava/lang/String;II)I
    .registers 5
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I

    .prologue
    .line 340
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_e

    .line 341
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    sparse-switch v1, :sswitch_data_10

    .line 352
    .end local v0    # "i":I
    :goto_a
    return v0

    .line 340
    .restart local v0    # "i":I
    :sswitch_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_e
    move v0, p2

    .line 352
    goto :goto_a

    .line 341
    :sswitch_data_10
    .sparse-switch
        0x9 -> :sswitch_b
        0xa -> :sswitch_b
        0xc -> :sswitch_b
        0xd -> :sswitch_b
        0x20 -> :sswitch_b
    .end sparse-switch
.end method

.method public static skipTrailingAsciiWhitespace(Ljava/lang/String;II)I
    .registers 5
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I

    .prologue
    .line 360
    add-int/lit8 v0, p2, -0x1

    .local v0, "i":I
    :goto_2
    if-lt v0, p1, :cond_d

    .line 361
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    sparse-switch v1, :sswitch_data_12

    .line 369
    add-int/lit8 p1, v0, 0x1

    .line 372
    .end local p1    # "pos":I
    :cond_d
    return p1

    .line 360
    .restart local p1    # "pos":I
    :sswitch_e
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 361
    nop

    :sswitch_data_12
    .sparse-switch
        0x9 -> :sswitch_e
        0xa -> :sswitch_e
        0xc -> :sswitch_e
        0xd -> :sswitch_e
        0x20 -> :sswitch_e
    .end sparse-switch
.end method

.method public static threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "daemon"    # Z

    .prologue
    .line 253
    new-instance v0, Lokhttp3/internal/Util$1;

    invoke-direct {v0, p0, p1}, Lokhttp3/internal/Util$1;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method

.method public static toHumanReadableAscii(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x7f

    const/16 v6, 0x1f

    .line 300
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .local v4, "length":I
    :goto_9
    if-ge v2, v4, :cond_3e

    .line 301
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 302
    .local v1, "c":I
    if-le v1, v6, :cond_19

    if-ge v1, v7, :cond_19

    .line 300
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v2, v5

    goto :goto_9

    .line 304
    :cond_19
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 305
    .local v0, "buffer":Lokio/Buffer;
    const/4 v5, 0x0

    invoke-virtual {v0, p0, v5, v2}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    .line 306
    move v3, v2

    .local v3, "j":I
    :goto_23
    if-ge v3, v4, :cond_3a

    .line 307
    invoke-virtual {p0, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 308
    if-le v1, v6, :cond_37

    if-ge v1, v7, :cond_37

    move v5, v1

    :goto_2e
    invoke-virtual {v0, v5}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    .line 306
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v3, v5

    goto :goto_23

    .line 308
    :cond_37
    const/16 v5, 0x3f

    goto :goto_2e

    .line 310
    :cond_3a
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    .line 312
    .end local v0    # "buffer":Lokio/Buffer;
    .end local v1    # "c":I
    .end local v3    # "j":I
    .end local p0    # "s":Ljava/lang/String;
    :cond_3e
    return-object p0
.end method

.method public static trimSubstring(Ljava/lang/String;II)Ljava/lang/String;
    .registers 6
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I

    .prologue
    .line 377
    invoke-static {p0, p1, p2}, Lokhttp3/internal/Util;->skipLeadingAsciiWhitespace(Ljava/lang/String;II)I

    move-result v1

    .line 378
    .local v1, "start":I
    invoke-static {p0, v1, p2}, Lokhttp3/internal/Util;->skipTrailingAsciiWhitespace(Ljava/lang/String;II)I

    move-result v0

    .line 379
    .local v0, "end":I
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static verifyAsIpAddress(Ljava/lang/String;)Z
    .registers 2
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 447
    sget-object v0, Lokhttp3/internal/Util;->VERIFY_AS_IP_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method
