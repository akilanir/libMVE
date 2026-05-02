.class public final Lcom/google/android/exoplayer/util/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field public static final DEVICE:Ljava/lang/String;

.field private static final ESCAPED_CHARACTER_PATTERN:Ljava/util/regex/Pattern;

.field public static final MANUFACTURER:Ljava/lang/String;

.field private static final MAX_BYTES_TO_DRAIN:J = 0x800L

.field public static final MODEL:Ljava/lang/String;

.field public static final SDK_INT:I

.field public static final TYPE_DASH:I = 0x0

.field public static final TYPE_HLS:I = 0x2

.field public static final TYPE_OTHER:I = 0x3

.field public static final TYPE_SS:I = 0x1

.field private static final XS_DATE_TIME_PATTERN:Ljava/util/regex/Pattern;

.field private static final XS_DURATION_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 65
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ne v0, v1, :cond_3a

    sget-object v0, Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x4e

    if-ne v0, v1, :cond_3a

    const/16 v0, 0x18

    :goto_13
    sput v0, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    .line 73
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    sput-object v0, Lcom/google/android/exoplayer/util/Util;->DEVICE:Ljava/lang/String;

    .line 79
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sput-object v0, Lcom/google/android/exoplayer/util/Util;->MANUFACTURER:Ljava/lang/String;

    .line 85
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sput-object v0, Lcom/google/android/exoplayer/util/Util;->MODEL:Ljava/lang/String;

    .line 108
    const-string v0, "(\\d\\d\\d\\d)\\-(\\d\\d)\\-(\\d\\d)[Tt](\\d\\d):(\\d\\d):(\\d\\d)(\\.(\\d+))?([Zz]|((\\+|\\-)(\\d\\d):(\\d\\d)))?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/util/Util;->XS_DATE_TIME_PATTERN:Ljava/util/regex/Pattern;

    .line 113
    const-string v0, "^(-)?P(([0-9]*)Y)?(([0-9]*)M)?(([0-9]*)D)?(T(([0-9]*)H)?(([0-9]*)M)?(([0-9.]*)S)?)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/util/Util;->XS_DURATION_PATTERN:Ljava/util/regex/Pattern;

    .line 117
    const-string v0, "%([A-Fa-f0-9]{2})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/util/Util;->ESCAPED_CHARACTER_PATTERN:Ljava/util/regex/Pattern;

    return-void

    .line 65
    :cond_3a
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    goto :goto_13
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "o1"    # Ljava/lang/Object;
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 171
    if-nez p0, :cond_8

    if-nez p1, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5

    :cond_8
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public static binarySearchCeil(Ljava/util/List;Ljava/lang/Object;ZZ)I
    .registers 6
    .param p2, "inclusive"    # Z
    .param p3, "stayInBounds"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/Comparable",
            "<-TT;>;>;TT;ZZ)I"
        }
    .end annotation

    .prologue
    .line 360
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/Comparable<-TT;>;>;"
    .local p1, "key":Ljava/lang/Object;, "TT;"
    invoke-static {p0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 361
    .local v0, "index":I
    if-gez v0, :cond_15

    xor-int/lit8 v0, v0, -0x1

    .line 362
    :cond_8
    :goto_8
    if-eqz p3, :cond_14

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .end local v0    # "index":I
    :cond_14
    return v0

    .line 361
    .restart local v0    # "index":I
    :cond_15
    if-nez p2, :cond_8

    add-int/lit8 v0, v0, 0x1

    goto :goto_8
.end method

.method public static binarySearchCeil([JJZZ)I
    .registers 7
    .param p0, "a"    # [J
    .param p1, "key"    # J
    .param p3, "inclusive"    # Z
    .param p4, "stayInBounds"    # Z

    .prologue
    .line 317
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v0

    .line 318
    .local v0, "index":I
    if-gez v0, :cond_12

    xor-int/lit8 v0, v0, -0x1

    .line 319
    :cond_8
    :goto_8
    if-eqz p4, :cond_11

    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .end local v0    # "index":I
    :cond_11
    return v0

    .line 318
    .restart local v0    # "index":I
    :cond_12
    if-nez p3, :cond_8

    add-int/lit8 v0, v0, 0x1

    goto :goto_8
.end method

.method public static binarySearchFloor(Ljava/util/List;Ljava/lang/Object;ZZ)I
    .registers 6
    .param p2, "inclusive"    # Z
    .param p3, "stayInBounds"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/Comparable",
            "<-TT;>;>;TT;ZZ)I"
        }
    .end annotation

    .prologue
    .line 338
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/Comparable<-TT;>;>;"
    .local p1, "key":Ljava/lang/Object;, "TT;"
    invoke-static {p0, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 339
    .local v0, "index":I
    if-gez v0, :cond_11

    add-int/lit8 v1, v0, 0x2

    neg-int v0, v1

    .line 340
    :cond_9
    :goto_9
    if-eqz p3, :cond_10

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .end local v0    # "index":I
    :cond_10
    return v0

    .line 339
    .restart local v0    # "index":I
    :cond_11
    if-nez p2, :cond_9

    add-int/lit8 v0, v0, -0x1

    goto :goto_9
.end method

.method public static binarySearchFloor([JJZZ)I
    .registers 7
    .param p0, "a"    # [J
    .param p1, "key"    # J
    .param p3, "inclusive"    # Z
    .param p4, "stayInBounds"    # Z

    .prologue
    .line 296
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v0

    .line 297
    .local v0, "index":I
    if-gez v0, :cond_11

    add-int/lit8 v1, v0, 0x2

    neg-int v0, v1

    .line 298
    :cond_9
    :goto_9
    if-eqz p4, :cond_10

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .end local v0    # "index":I
    :cond_10
    return v0

    .line 297
    .restart local v0    # "index":I
    :cond_11
    if-nez p3, :cond_9

    add-int/lit8 v0, v0, -0x1

    goto :goto_9
.end method

.method public static ceilDivide(II)I
    .registers 3
    .param p0, "numerator"    # I
    .param p1, "denominator"    # I

    .prologue
    .line 267
    add-int v0, p0, p1

    add-int/lit8 v0, v0, -0x1

    div-int/2addr v0, p1

    return v0
.end method

.method public static ceilDivide(JJ)J
    .registers 8
    .param p0, "numerator"    # J
    .param p2, "denominator"    # J

    .prologue
    .line 278
    add-long v0, p0, p2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    div-long/2addr v0, p2

    return-wide v0
.end method

.method public static closeQuietly(Lcom/google/android/exoplayer/upstream/DataSource;)V
    .registers 2
    .param p0, "dataSource"    # Lcom/google/android/exoplayer/upstream/DataSource;

    .prologue
    .line 230
    :try_start_0
    invoke-interface {p0}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 234
    :goto_3
    return-void

    .line 231
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static closeQuietly(Ljava/io/OutputStream;)V
    .registers 2
    .param p0, "outputStream"    # Ljava/io/OutputStream;

    .prologue
    .line 243
    :try_start_0
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 247
    :goto_3
    return-void

    .line 244
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static contains([Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "items"    # [Ljava/lang/Object;
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    .line 185
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_11

    .line 186
    aget-object v1, p0, v0

    invoke-static {v1, p1}, Lcom/google/android/exoplayer/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 187
    const/4 v1, 0x1

    .line 190
    :goto_d
    return v1

    .line 185
    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 190
    :cond_11
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public static escapeFileName(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    .line 805
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 806
    .local v5, "length":I
    const/4 v2, 0x0

    .line 807
    .local v2, "charactersToEscapeCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v5, :cond_17

    .line 808
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/google/android/exoplayer/util/Util;->shouldEscapeCharacter(C)Z

    move-result v6

    if-eqz v6, :cond_14

    .line 809
    add-int/lit8 v2, v2, 0x1

    .line 807
    :cond_14
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 812
    :cond_17
    if-nez v2, :cond_1a

    .line 830
    .end local p0    # "fileName":Ljava/lang/String;
    :goto_19
    return-object p0

    .line 816
    .restart local p0    # "fileName":Ljava/lang/String;
    :cond_1a
    const/4 v3, 0x0

    .line 817
    new-instance v0, Ljava/lang/StringBuilder;

    mul-int/lit8 v6, v2, 0x2

    add-int/2addr v6, v5

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .local v0, "builder":Ljava/lang/StringBuilder;
    move v4, v3

    .line 818
    .end local v3    # "i":I
    .local v4, "i":I
    :goto_24
    if-lez v2, :cond_47

    .line 819
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 820
    .local v1, "c":C
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Util;->shouldEscapeCharacter(C)Z

    move-result v6

    if-eqz v6, :cond_43

    .line 821
    const/16 v6, 0x25

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 822
    add-int/lit8 v2, v2, -0x1

    :goto_41
    move v4, v3

    .line 826
    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_24

    .line 824
    .end local v4    # "i":I
    .restart local v3    # "i":I
    :cond_43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_41

    .line 827
    .end local v1    # "c":C
    .end local v3    # "i":I
    .restart local v4    # "i":I
    :cond_47
    if-ge v4, v5, :cond_4c

    .line 828
    invoke-virtual {v0, p0, v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 830
    :cond_4c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0    # "fileName":Ljava/lang/String;
    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto :goto_19
.end method

.method public static executePost(Ljava/lang/String;[BLjava/util/Map;)[B
    .registers 11
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, "requestProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v7, 0x1

    .line 738
    const/4 v5, 0x0

    .line 740
    .local v5, "urlConnection":Ljava/net/HttpURLConnection;
    :try_start_2
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v5, v0

    .line 741
    const-string v6, "POST"

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 742
    if-eqz p1, :cond_4b

    move v6, v7

    :goto_17
    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 743
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 744
    if-eqz p2, :cond_4d

    .line 745
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_28
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 746
    .local v4, "requestProperty":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_43
    .catchall {:try_start_2 .. :try_end_43} :catchall_44

    goto :goto_28

    .line 766
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v4    # "requestProperty":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_44
    move-exception v6

    if-eqz v5, :cond_4a

    .line 767
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_4a
    throw v6

    .line 742
    :cond_4b
    const/4 v6, 0x0

    goto :goto_17

    .line 750
    :cond_4d
    if-eqz p1, :cond_59

    .line 751
    :try_start_4f
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;
    :try_end_52
    .catchall {:try_start_4f .. :try_end_52} :catchall_44

    move-result-object v3

    .line 753
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_53
    invoke-virtual {v3, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_6a

    .line 755
    :try_start_56
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 759
    .end local v3    # "out":Ljava/io/OutputStream;
    :cond_59
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_5c
    .catchall {:try_start_56 .. :try_end_5c} :catchall_44

    move-result-object v2

    .line 761
    .local v2, "inputStream":Ljava/io/InputStream;
    :try_start_5d
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->toByteArray(Ljava/io/InputStream;)[B
    :try_end_60
    .catchall {:try_start_5d .. :try_end_60} :catchall_6f

    move-result-object v6

    .line 763
    :try_start_61
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_64
    .catchall {:try_start_61 .. :try_end_64} :catchall_44

    .line 766
    if-eqz v5, :cond_69

    .line 767
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_69
    return-object v6

    .line 755
    .end local v2    # "inputStream":Ljava/io/InputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_6a
    move-exception v6

    :try_start_6b
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    throw v6

    .line 763
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "inputStream":Ljava/io/InputStream;
    :catchall_6f
    move-exception v6

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v6
    :try_end_74
    .catchall {:try_start_6b .. :try_end_74} :catchall_44
.end method

.method public static firstIntegersArray(I)[I
    .registers 3
    .param p0, "length"    # I

    .prologue
    .line 372
    new-array v0, p0, [I

    .line 373
    .local v0, "firstIntegers":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-ge v1, p0, :cond_a

    .line 374
    aput v1, v0, v1

    .line 373
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 376
    :cond_a
    return-object v0
.end method

.method public static getBottomInt(J)I
    .registers 3
    .param p0, "value"    # J

    .prologue
    .line 647
    long-to-int v0, p0

    return v0
.end method

.method public static getBytesFromHexString(Ljava/lang/String;)[B
    .registers 7
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x10

    .line 680
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    new-array v0, v3, [B

    .line 681
    .local v0, "data":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    array-length v3, v0

    if-ge v1, v3, :cond_2b

    .line 682
    mul-int/lit8 v2, v1, 0x2

    .line 683
    .local v2, "stringOffset":I
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3, v5}, Ljava/lang/Character;->digit(CI)I

    move-result v3

    shl-int/lit8 v3, v3, 0x4

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v5}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    add-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v0, v1

    .line 681
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 686
    .end local v2    # "stringOffset":I
    :cond_2b
    return-object v0
.end method

.method public static getCommaDelimitedSimpleClassNames([Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 696
    .local p0, "objects":[Ljava/lang/Object;, "[TT;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 697
    .local v1, "stringBuilder":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v2, p0

    if-ge v0, v2, :cond_23

    .line 698
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 699
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_20

    .line 700
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 697
    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 703
    :cond_23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getHexStringFromBytes([BII)Ljava/lang/String;
    .registers 10
    .param p0, "data"    # [B
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 666
    new-instance v0, Ljava/lang/StringBuilder;

    sub-int v2, p2, p1

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 667
    .local v0, "dataStringBuilder":Ljava/lang/StringBuilder;
    move v1, p1

    .local v1, "i":I
    :goto_8
    if-ge v1, p2, :cond_24

    .line 668
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%02X"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aget-byte v6, p0, v1

    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 667
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 670
    :cond_24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getIntegerCodeForString(Ljava/lang/String;)I
    .registers 5
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 626
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 627
    .local v1, "length":I
    const/4 v3, 0x4

    if-gt v1, v3, :cond_19

    const/4 v3, 0x1

    :goto_8
    invoke-static {v3}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 628
    const/4 v2, 0x0

    .line 629
    .local v2, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v1, :cond_1b

    .line 630
    shl-int/lit8 v2, v2, 0x8

    .line 631
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    or-int/2addr v2, v3

    .line 629
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 627
    .end local v0    # "i":I
    .end local v2    # "result":I
    :cond_19
    const/4 v3, 0x0

    goto :goto_8

    .line 633
    .restart local v0    # "i":I
    .restart local v2    # "result":I
    :cond_1b
    return v2
.end method

.method public static getLong(II)J
    .registers 8
    .param p0, "topInteger"    # I
    .param p1, "bottomInteger"    # I

    .prologue
    .line 654
    int-to-long v0, p0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    int-to-long v2, p1

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static getRemainderDataSpec(Lcom/google/android/exoplayer/upstream/DataSpec;I)Lcom/google/android/exoplayer/upstream/DataSpec;
    .registers 10
    .param p0, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .param p1, "bytesLoaded"    # I

    .prologue
    const-wide/16 v4, -0x1

    .line 611
    if-nez p1, :cond_5

    .line 616
    .end local p0    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :goto_4
    return-object p0

    .line 614
    .restart local p0    # "dataSpec":Lcom/google/android/exoplayer/upstream/DataSpec;
    :cond_5
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    cmp-long v0, v0, v4

    if-nez v0, :cond_1c

    .line 616
    .local v4, "remainingLength":J
    :goto_b
    new-instance v0, Lcom/google/android/exoplayer/upstream/DataSpec;

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    iget-wide v2, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    int-to-long v6, p1

    add-long/2addr v2, v6

    iget-object v6, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    iget v7, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->flags:I

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;I)V

    move-object p0, v0

    goto :goto_4

    .line 614
    .end local v4    # "remainingLength":J
    :cond_1c
    iget-wide v0, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    int-to-long v2, p1

    sub-long v4, v0, v2

    goto :goto_b
.end method

.method public static getTopInt(J)I
    .registers 4
    .param p0, "value"    # J

    .prologue
    .line 640
    const/16 v0, 0x20

    ushr-long v0, p0, v0

    long-to-int v0, v0

    return v0
.end method

.method public static getUserAgent(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "applicationName"    # Ljava/lang/String;

    .prologue
    .line 716
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 717
    .local v2, "packageName":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 718
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget-object v3, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_f} :catch_45

    .line 722
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "packageName":Ljava/lang/String;
    .local v3, "versionName":Ljava/lang/String;
    :goto_f
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " (Linux;Android "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "ExoPlayerLib/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "1.5.7"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 719
    .end local v3    # "versionName":Ljava/lang/String;
    :catch_45
    move-exception v0

    .line 720
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "?"

    .restart local v3    # "versionName":Ljava/lang/String;
    goto :goto_f
.end method

.method public static inferContentType(Ljava/lang/String;)I
    .registers 3
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x3

    .line 779
    if-nez p0, :cond_4

    .line 788
    :cond_3
    :goto_3
    return v0

    .line 781
    :cond_4
    const-string v1, ".mpd"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 782
    const/4 v0, 0x0

    goto :goto_3

    .line 783
    :cond_e
    const-string v1, ".ism"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 784
    const/4 v0, 0x1

    goto :goto_3

    .line 785
    :cond_18
    const-string v1, ".m3u8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 786
    const/4 v0, 0x2

    goto :goto_3
.end method

.method public static isAndroidTv(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 131
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.software.leanback"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isLocalFileUri(Landroid/net/Uri;)Z
    .registers 3
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 158
    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "scheme":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_12

    const-string v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    :cond_12
    const/4 v1, 0x1

    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public static maybeTerminateInputStream(Ljava/net/HttpURLConnection;J)V
    .registers 9
    .param p0, "connection"    # Ljava/net/HttpURLConnection;
    .param p1, "bytesRemaining"    # J

    .prologue
    .line 570
    sget v4, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v5, 0x13

    if-eq v4, v5, :cond_d

    sget v4, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v5, 0x14

    if-eq v4, v5, :cond_d

    .line 600
    :cond_c
    :goto_c
    return-void

    .line 575
    :cond_d
    :try_start_d
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 576
    .local v1, "inputStream":Ljava/io/InputStream;
    const-wide/16 v4, -0x1

    cmp-long v4, p1, v4

    if-nez v4, :cond_54

    .line 578
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_c

    .line 586
    :cond_1e
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 587
    .local v0, "className":Ljava/lang/String;
    const-string v4, "com.android.okhttp.internal.http.HttpTransport$ChunkedInputStream"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_36

    const-string v4, "com.android.okhttp.internal.http.HttpTransport$FixedLengthInputStream"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 590
    :cond_36
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    .line 591
    .local v2, "superclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "unexpectedEndOfInput"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 592
    .local v3, "unexpectedEndOfInput":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 593
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_51} :catch_52
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_51} :catch_5b

    goto :goto_c

    .line 595
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "inputStream":Ljava/io/InputStream;
    .end local v2    # "superclass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "unexpectedEndOfInput":Ljava/lang/reflect/Method;
    :catch_52
    move-exception v4

    goto :goto_c

    .line 581
    .restart local v1    # "inputStream":Ljava/io/InputStream;
    :cond_54
    const-wide/16 v4, 0x800

    cmp-long v4, p1, v4

    if-gtz v4, :cond_1e

    goto :goto_c

    .line 597
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :catch_5b
    move-exception v4

    goto :goto_c
.end method

.method public static newSingleThreadExecutor(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;
    .registers 2
    .param p0, "threadName"    # Ljava/lang/String;

    .prologue
    .line 200
    new-instance v0, Lcom/google/android/exoplayer/util/Util$1;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer/util/Util$1;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public static newSingleThreadScheduledExecutor(Ljava/lang/String;)Ljava/util/concurrent/ScheduledExecutorService;
    .registers 2
    .param p0, "threadName"    # Ljava/lang/String;

    .prologue
    .line 215
    new-instance v0, Lcom/google/android/exoplayer/util/Util$2;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer/util/Util$2;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public static parseXsDateTime(Ljava/lang/String;)J
    .registers 15
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x9

    const/16 v13, 0x8

    const/4 v12, 0x3

    .line 418
    sget-object v1, Lcom/google/android/exoplayer/util/Util;->XS_DATE_TIME_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    .line 419
    .local v8, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 420
    new-instance v1, Ljava/text/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid date/time format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 424
    :cond_2b
    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_ba

    .line 426
    const/4 v11, 0x0

    .line 437
    .local v11, "timezoneShift":I
    :cond_32
    :goto_32
    new-instance v0, Ljava/util/GregorianCalendar;

    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 439
    .local v0, "dateTime":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    .line 441
    const/4 v1, 0x1

    invoke-virtual {v8, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x2

    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v8, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x4

    invoke-virtual {v8, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x5

    invoke-virtual {v8, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x6

    invoke-virtual {v8, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 447
    invoke-virtual {v8, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_ad

    .line 448
    new-instance v7, Ljava/math/BigDecimal;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "0."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v8, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 450
    .local v7, "bd":Ljava/math/BigDecimal;
    const/16 v1, 0xe

    invoke-virtual {v7, v12}, Ljava/math/BigDecimal;->movePointRight(I)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigDecimal;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 453
    .end local v7    # "bd":Ljava/math/BigDecimal;
    :cond_ad
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v9

    .line 454
    .local v9, "time":J
    if-eqz v11, :cond_b9

    .line 455
    const v1, 0xea60

    mul-int/2addr v1, v11

    int-to-long v1, v1

    sub-long/2addr v9, v1

    .line 458
    :cond_b9
    return-wide v9

    .line 427
    .end local v0    # "dateTime":Ljava/util/Calendar;
    .end local v9    # "time":J
    .end local v11    # "timezoneShift":I
    :cond_ba
    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Z"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c9

    .line 428
    const/4 v11, 0x0

    .restart local v11    # "timezoneShift":I
    goto/16 :goto_32

    .line 430
    .end local v11    # "timezoneShift":I
    :cond_c9
    const/16 v1, 0xc

    invoke-virtual {v8, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    mul-int/lit8 v1, v1, 0x3c

    const/16 v2, 0xd

    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    add-int v11, v1, v2

    .line 432
    .restart local v11    # "timezoneShift":I
    const/16 v1, 0xb

    invoke-virtual {v8, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 433
    mul-int/lit8 v11, v11, -0x1

    goto/16 :goto_32
.end method

.method public static parseXsDuration(Ljava/lang/String;)J
    .registers 18
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 386
    sget-object v13, Lcom/google/android/exoplayer/util/Util;->XS_DURATION_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 387
    .local v7, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v13

    if-eqz v13, :cond_9f

    .line 388
    const/4 v13, 0x1

    invoke-virtual {v7, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_8b

    const/4 v10, 0x1

    .line 391
    .local v10, "negated":Z
    :goto_1a
    const/4 v13, 0x3

    invoke-virtual {v7, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    .line 392
    .local v12, "years":Ljava/lang/String;
    if-eqz v12, :cond_8d

    invoke-static {v12}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v13

    const-wide v15, 0x417e1852c0000000L    # 3.1556908E7

    mul-double v4, v13, v15

    .line 393
    .local v4, "durationSeconds":D
    :goto_2c
    const/4 v13, 0x5

    invoke-virtual {v7, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    .line 394
    .local v9, "months":Ljava/lang/String;
    if-eqz v9, :cond_90

    invoke-static {v9}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v13

    const-wide v15, 0x4144103580000000L    # 2629739.0

    mul-double/2addr v13, v15

    :goto_3d
    add-double/2addr v4, v13

    .line 395
    const/4 v13, 0x7

    invoke-virtual {v7, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 396
    .local v1, "days":Ljava/lang/String;
    if-eqz v1, :cond_93

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v13

    const-wide v15, 0x40f5180000000000L    # 86400.0

    mul-double/2addr v13, v15

    :goto_4f
    add-double/2addr v4, v13

    .line 397
    const/16 v13, 0xa

    invoke-virtual {v7, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 398
    .local v6, "hours":Ljava/lang/String;
    if-eqz v6, :cond_96

    invoke-static {v6}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v13

    const-wide v15, 0x40ac200000000000L    # 3600.0

    mul-double/2addr v13, v15

    :goto_62
    add-double/2addr v4, v13

    .line 399
    const/16 v13, 0xc

    invoke-virtual {v7, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 400
    .local v8, "minutes":Ljava/lang/String;
    if-eqz v8, :cond_99

    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v13

    const-wide/high16 v15, 0x404e000000000000L    # 60.0

    mul-double/2addr v13, v15

    :goto_72
    add-double/2addr v4, v13

    .line 401
    const/16 v13, 0xe

    invoke-virtual {v7, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    .line 402
    .local v11, "seconds":Ljava/lang/String;
    if-eqz v11, :cond_9c

    invoke-static {v11}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v13

    :goto_7f
    add-double/2addr v4, v13

    .line 403
    const-wide v13, 0x408f400000000000L    # 1000.0

    mul-double/2addr v13, v4

    double-to-long v2, v13

    .line 404
    .local v2, "durationMillis":J
    if-eqz v10, :cond_8a

    neg-long v2, v2

    .line 406
    .end local v1    # "days":Ljava/lang/String;
    .end local v2    # "durationMillis":J
    .end local v4    # "durationSeconds":D
    .end local v6    # "hours":Ljava/lang/String;
    .end local v8    # "minutes":Ljava/lang/String;
    .end local v9    # "months":Ljava/lang/String;
    .end local v10    # "negated":Z
    .end local v11    # "seconds":Ljava/lang/String;
    .end local v12    # "years":Ljava/lang/String;
    :cond_8a
    :goto_8a
    return-wide v2

    .line 388
    :cond_8b
    const/4 v10, 0x0

    goto :goto_1a

    .line 392
    .restart local v10    # "negated":Z
    .restart local v12    # "years":Ljava/lang/String;
    :cond_8d
    const-wide/16 v4, 0x0

    goto :goto_2c

    .line 394
    .restart local v4    # "durationSeconds":D
    .restart local v9    # "months":Ljava/lang/String;
    :cond_90
    const-wide/16 v13, 0x0

    goto :goto_3d

    .line 396
    .restart local v1    # "days":Ljava/lang/String;
    :cond_93
    const-wide/16 v13, 0x0

    goto :goto_4f

    .line 398
    .restart local v6    # "hours":Ljava/lang/String;
    :cond_96
    const-wide/16 v13, 0x0

    goto :goto_62

    .line 400
    .restart local v8    # "minutes":Ljava/lang/String;
    :cond_99
    const-wide/16 v13, 0x0

    goto :goto_72

    .line 402
    .restart local v11    # "seconds":Ljava/lang/String;
    :cond_9c
    const-wide/16 v13, 0x0

    goto :goto_7f

    .line 406
    .end local v1    # "days":Ljava/lang/String;
    .end local v4    # "durationSeconds":D
    .end local v6    # "hours":Ljava/lang/String;
    .end local v8    # "minutes":Ljava/lang/String;
    .end local v9    # "months":Ljava/lang/String;
    .end local v10    # "negated":Z
    .end local v11    # "seconds":Ljava/lang/String;
    .end local v12    # "years":Ljava/lang/String;
    :cond_9f
    invoke-static/range {p0 .. p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v13

    const-wide v15, 0x40ac200000000000L    # 3600.0

    mul-double/2addr v13, v15

    const-wide v15, 0x408f400000000000L    # 1000.0

    mul-double/2addr v13, v15

    double-to-long v2, v13

    goto :goto_8a
.end method

.method public static scaleLargeTimestamp(JJJ)J
    .registers 14
    .param p0, "timestamp"    # J
    .param p2, "multiplier"    # J
    .param p4, "divisor"    # J

    .prologue
    const-wide/16 v6, 0x0

    .line 473
    cmp-long v4, p4, p2

    if-ltz v4, :cond_11

    rem-long v4, p4, p2

    cmp-long v4, v4, v6

    if-nez v4, :cond_11

    .line 474
    div-long v0, p4, p2

    .line 475
    .local v0, "divisionFactor":J
    div-long v4, p0, v0

    .line 481
    .end local v0    # "divisionFactor":J
    :goto_10
    return-wide v4

    .line 476
    :cond_11
    cmp-long v4, p4, p2

    if-gez v4, :cond_20

    rem-long v4, p2, p4

    cmp-long v4, v4, v6

    if-nez v4, :cond_20

    .line 477
    div-long v2, p2, p4

    .line 478
    .local v2, "multiplicationFactor":J
    mul-long v4, p0, v2

    goto :goto_10

    .line 480
    .end local v2    # "multiplicationFactor":J
    :cond_20
    long-to-double v4, p2

    long-to-double v6, p4

    div-double v2, v4, v6

    .line 481
    .local v2, "multiplicationFactor":D
    long-to-double v4, p0

    mul-double/2addr v4, v2

    double-to-long v4, v4

    goto :goto_10
.end method

.method public static scaleLargeTimestamps(Ljava/util/List;JJ)[J
    .registers 15
    .param p1, "multiplier"    # J
    .param p3, "divisor"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;JJ)[J"
        }
    .end annotation

    .prologue
    .local p0, "timestamps":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const-wide/16 v8, 0x0

    .line 494
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v6

    new-array v5, v6, [J

    .line 495
    .local v5, "scaledTimestamps":[J
    cmp-long v6, p3, p1

    if-ltz v6, :cond_28

    rem-long v6, p3, p1

    cmp-long v6, v6, v8

    if-nez v6, :cond_28

    .line 496
    div-long v0, p3, p1

    .line 497
    .local v0, "divisionFactor":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_15
    array-length v6, v5

    if-ge v2, v6, :cond_62

    .line 498
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    div-long/2addr v6, v0

    aput-wide v6, v5, v2

    .line 497
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 500
    .end local v0    # "divisionFactor":J
    .end local v2    # "i":I
    :cond_28
    cmp-long v6, p3, p1

    if-gez v6, :cond_48

    rem-long v6, p1, p3

    cmp-long v6, v6, v8

    if-nez v6, :cond_48

    .line 501
    div-long v3, p1, p3

    .line 502
    .local v3, "multiplicationFactor":J
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_35
    array-length v6, v5

    if-ge v2, v6, :cond_62

    .line 503
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    mul-long/2addr v6, v3

    aput-wide v6, v5, v2

    .line 502
    add-int/lit8 v2, v2, 0x1

    goto :goto_35

    .line 506
    .end local v2    # "i":I
    .end local v3    # "multiplicationFactor":J
    :cond_48
    long-to-double v6, p1

    long-to-double v8, p3

    div-double v3, v6, v8

    .line 507
    .local v3, "multiplicationFactor":D
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_4d
    array-length v6, v5

    if-ge v2, v6, :cond_62

    .line 508
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    long-to-double v6, v6

    mul-double/2addr v6, v3

    double-to-long v6, v6

    aput-wide v6, v5, v2

    .line 507
    add-int/lit8 v2, v2, 0x1

    goto :goto_4d

    .line 511
    .end local v3    # "multiplicationFactor":D
    :cond_62
    return-object v5
.end method

.method public static scaleLargeTimestampsInPlace([JJJ)V
    .registers 14
    .param p0, "timestamps"    # [J
    .param p1, "multiplier"    # J
    .param p3, "divisor"    # J

    .prologue
    const-wide/16 v7, 0x0

    .line 522
    cmp-long v5, p3, p1

    if-ltz v5, :cond_1a

    rem-long v5, p3, p1

    cmp-long v5, v5, v7

    if-nez v5, :cond_1a

    .line 523
    div-long v0, p3, p1

    .line 524
    .local v0, "divisionFactor":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_f
    array-length v5, p0

    if-ge v2, v5, :cond_44

    .line 525
    aget-wide v5, p0, v2

    div-long/2addr v5, v0

    aput-wide v5, p0, v2

    .line 524
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 527
    .end local v0    # "divisionFactor":J
    .end local v2    # "i":I
    :cond_1a
    cmp-long v5, p3, p1

    if-gez v5, :cond_32

    rem-long v5, p1, p3

    cmp-long v5, v5, v7

    if-nez v5, :cond_32

    .line 528
    div-long v3, p1, p3

    .line 529
    .local v3, "multiplicationFactor":J
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_27
    array-length v5, p0

    if-ge v2, v5, :cond_44

    .line 530
    aget-wide v5, p0, v2

    mul-long/2addr v5, v3

    aput-wide v5, p0, v2

    .line 529
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 533
    .end local v2    # "i":I
    .end local v3    # "multiplicationFactor":J
    :cond_32
    long-to-double v5, p1

    long-to-double v7, p3

    div-double v3, v5, v7

    .line 534
    .local v3, "multiplicationFactor":D
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_37
    array-length v5, p0

    if-ge v2, v5, :cond_44

    .line 535
    aget-wide v5, p0, v2

    long-to-double v5, v5

    mul-double/2addr v5, v3

    double-to-long v5, v5

    aput-wide v5, p0, v2

    .line 534
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .line 538
    .end local v3    # "multiplicationFactor":D
    :cond_44
    return-void
.end method

.method private static shouldEscapeCharacter(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 834
    sparse-switch p0, :sswitch_data_8

    .line 847
    const/4 v0, 0x0

    :goto_4
    return v0

    .line 845
    :sswitch_5
    const/4 v0, 0x1

    goto :goto_4

    .line 834
    nop

    :sswitch_data_8
    .sparse-switch
        0x22 -> :sswitch_5
        0x25 -> :sswitch_5
        0x2a -> :sswitch_5
        0x2f -> :sswitch_5
        0x3a -> :sswitch_5
        0x3c -> :sswitch_5
        0x3e -> :sswitch_5
        0x3f -> :sswitch_5
        0x5c -> :sswitch_5
        0x7c -> :sswitch_5
    .end sparse-switch
.end method

.method public static toArray(Ljava/util/List;)[I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)[I"
        }
    .end annotation

    .prologue
    .line 547
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-nez p0, :cond_4

    .line 548
    const/4 v1, 0x0

    .line 555
    :cond_3
    return-object v1

    .line 550
    :cond_4
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .line 551
    .local v2, "length":I
    new-array v1, v2, [I

    .line 552
    .local v1, "intArray":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v2, :cond_3

    .line 553
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v1, v0

    .line 552
    add-int/lit8 v0, v0, 0x1

    goto :goto_b
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .registers 5
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    const/16 v3, 0x1000

    new-array v0, v3, [B

    .line 144
    .local v0, "buffer":[B
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 146
    .local v2, "outputStream":Ljava/io/ByteArrayOutputStream;
    :goto_9
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "bytesRead":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_15

    .line 147
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_9

    .line 149
    :cond_15
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method public static toLowerInvariant(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 256
    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public static unescapeFileName(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    .line 861
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 862
    .local v4, "length":I
    const/4 v6, 0x0

    .line 863
    .local v6, "percentCharacterCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    if-ge v3, v4, :cond_15

    .line 864
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x25

    if-ne v8, v9, :cond_12

    .line 865
    add-int/lit8 v6, v6, 0x1

    .line 863
    :cond_12
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 868
    :cond_15
    if-nez v6, :cond_18

    .line 888
    .end local p0    # "fileName":Ljava/lang/String;
    :goto_17
    return-object p0

    .line 872
    .restart local p0    # "fileName":Ljava/lang/String;
    :cond_18
    mul-int/lit8 v8, v6, 0x2

    sub-int v2, v4, v8

    .line 873
    .local v2, "expectedLength":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 874
    .local v0, "builder":Ljava/lang/StringBuilder;
    sget-object v8, Lcom/google/android/exoplayer/util/Util;->ESCAPED_CHARACTER_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v8, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 875
    .local v5, "matcher":Ljava/util/regex/Matcher;
    const/4 v1, 0x0

    .line 876
    .local v1, "endOfLastMatch":I
    :goto_28
    if-lez v6, :cond_4e

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_4e

    .line 877
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x10

    invoke-static {v8, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v8

    int-to-char v7, v8

    .line 878
    .local v7, "unescapedCharacter":C
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->start()I

    move-result v8

    invoke-virtual {v0, p0, v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 879
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->end()I

    move-result v1

    .line 880
    add-int/lit8 v6, v6, -0x1

    .line 881
    goto :goto_28

    .line 882
    .end local v7    # "unescapedCharacter":C
    :cond_4e
    if-ge v1, v4, :cond_53

    .line 883
    invoke-virtual {v0, p0, v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 885
    :cond_53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-eq v8, v2, :cond_5b

    .line 886
    const/4 p0, 0x0

    goto :goto_17

    .line 888
    :cond_5b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_17
.end method
