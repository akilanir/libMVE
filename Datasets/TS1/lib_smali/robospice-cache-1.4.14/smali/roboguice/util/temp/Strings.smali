.class public final Lroboguice/util/temp/Strings;
.super Ljava/lang/Object;
.source "Strings.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x1000


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 159
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, "c":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2b

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v0    # "c":Ljava/lang/String;
    :cond_2a
    :goto_2a
    return-object v0

    .restart local v0    # "c":Ljava/lang/String;
    :cond_2b
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v3, :cond_2a

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_2a
.end method

.method public static chunk(Ljava/lang/String;I)[Ljava/lang/String;
    .registers 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "chunkSize"    # I

    .prologue
    .line 172
    invoke-static {p0}, Lroboguice/util/temp/Strings;->isEmpty(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    if-nez p1, :cond_c

    .line 173
    :cond_8
    const/4 v4, 0x0

    new-array v0, v4, [Ljava/lang/String;

    .line 183
    :cond_b
    return-object v0

    .line 176
    :cond_c
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 177
    .local v3, "len":I
    add-int/lit8 v4, v3, -0x1

    div-int/2addr v4, p1

    add-int/lit8 v1, v4, 0x1

    .line 178
    .local v1, "arrayLen":I
    new-array v0, v1, [Ljava/lang/String;

    .line 179
    .local v0, "array":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_18
    if-ge v2, v1, :cond_b

    .line 180
    mul-int v5, v2, p1

    mul-int v4, v2, p1

    add-int/2addr v4, p1

    if-ge v4, v3, :cond_2d

    mul-int v4, v2, p1

    add-int/2addr v4, p1

    :goto_24
    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v2

    .line 179
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    :cond_2d
    move v4, v3

    .line 180
    goto :goto_24
.end method

.method public static copy(Ljava/io/Reader;Ljava/io/Writer;)I
    .registers 6
    .param p0, "input"    # Ljava/io/Reader;
    .param p1, "output"    # Ljava/io/Writer;

    .prologue
    .line 96
    invoke-static {p0, p1}, Lroboguice/util/temp/Strings;->copyLarge(Ljava/io/Reader;Ljava/io/Writer;)J

    move-result-wide v0

    .line 97
    .local v0, "count":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_d

    const/4 v2, -0x1

    :goto_c
    return v2

    :cond_d
    long-to-int v2, v0

    goto :goto_c
.end method

.method public static copyLarge(Ljava/io/Reader;Ljava/io/Writer;)J
    .registers 9
    .param p0, "input"    # Ljava/io/Reader;
    .param p1, "output"    # Ljava/io/Writer;

    .prologue
    .line 102
    const/16 v5, 0x1000

    :try_start_2
    new-array v0, v5, [C

    .line 103
    .local v0, "buffer":[C
    const-wide/16 v1, 0x0

    .line 105
    .local v1, "count":J
    :goto_6
    const/4 v5, -0x1

    invoke-virtual {p0, v0}, Ljava/io/Reader;->read([C)I

    move-result v4

    .local v4, "n":I
    if-eq v5, v4, :cond_1b

    .line 106
    const/4 v5, 0x0

    invoke-virtual {p1, v0, v5, v4}, Ljava/io/Writer;->write([CII)V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_11} :catch_14

    .line 107
    int-to-long v5, v4

    add-long/2addr v1, v5

    goto :goto_6

    .line 110
    .end local v0    # "buffer":[C
    .end local v1    # "count":J
    .end local v4    # "n":I
    :catch_14
    move-exception v3

    .line 111
    .local v3, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 109
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v0    # "buffer":[C
    .restart local v1    # "count":J
    .restart local v4    # "n":I
    :cond_1b
    return-wide v1
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    .line 164
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static equalsIgnoreCase(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    .line 168
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isEmpty(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 125
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public static join(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;
    .registers 7
    .param p0, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "objs":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 64
    :cond_8
    const-string v3, ""

    .line 76
    :goto_a
    return-object v3

    .line 67
    :cond_b
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 68
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .local v0, "buffer":Ljava/lang/StringBuilder;
    :cond_1c
    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_38

    .line 71
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 72
    .local v2, "obj":Ljava/lang/Object;, "TT;"
    invoke-static {v2}, Lroboguice/util/temp/Strings;->notEmpty(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 73
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v2}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 76
    .end local v2    # "obj":Ljava/lang/Object;, "TT;"
    :cond_38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_a
.end method

.method public static varargs join(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p0, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "[TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "objects":[Ljava/lang/Object;, "[TT;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p0, v0}, Lroboguice/util/temp/Strings;->join(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static joinAnd(Ljava/lang/String;Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;
    .registers 9
    .param p0, "delimiter"    # Ljava/lang/String;
    .param p1, "lastDelimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 42
    .local p2, "objs":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    if-eqz p2, :cond_8

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 43
    :cond_8
    const-string v4, ""

    .line 55
    :goto_a
    return-object v4

    .line 46
    :cond_b
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 47
    .local v2, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 49
    .local v1, "i":I
    :cond_1d
    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_44

    .line 50
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 51
    .local v3, "obj":Ljava/lang/Object;, "TT;"
    invoke-static {v3}, Lroboguice/util/temp/Strings;->notEmpty(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 52
    add-int/lit8 v1, v1, 0x1

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v4

    if-ne v1, v4, :cond_42

    move-object v4, p1

    :goto_36
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v3}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1d

    :cond_42
    move-object v4, p0

    goto :goto_36

    .line 55
    .end local v3    # "obj":Ljava/lang/Object;, "TT;"
    :cond_44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_a
.end method

.method public static varargs joinAnd(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p0, "delimiter"    # Ljava/lang/String;
    .param p1, "lastDelimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 59
    .local p2, "objs":[Ljava/lang/Object;, "[TT;"
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lroboguice/util/temp/Strings;->joinAnd(Ljava/lang/String;Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static md5(Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 137
    :try_start_0
    const-string v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    const-string v9, "UTF-8"

    invoke-virtual {p0, v9}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    .line 138
    .local v3, "hash":[B
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .local v4, "hashString":Ljava/lang/StringBuilder;
    move-object v1, v3

    .local v1, "arr$":[B
    array-length v7, v1

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_18
    if-ge v6, v7, :cond_51

    aget-byte v0, v1, v6

    .line 141
    .local v0, "aHash":B
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    .line 143
    .local v5, "hex":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_3c

    .line 144
    const/16 v8, 0x30

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 145
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 140
    :goto_39
    add-int/lit8 v6, v6, 0x1

    goto :goto_18

    .line 147
    :cond_3c
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x2

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_49} :catch_4a

    goto :goto_39

    .line 153
    .end local v0    # "aHash":B
    .end local v1    # "arr$":[B
    .end local v3    # "hash":[B
    .end local v4    # "hashString":Ljava/lang/StringBuilder;
    .end local v5    # "hex":Ljava/lang/String;
    .end local v6    # "i$":I
    .end local v7    # "len$":I
    :catch_4a
    move-exception v2

    .line 154
    .local v2, "e":Ljava/lang/Exception;
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 151
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "arr$":[B
    .restart local v3    # "hash":[B
    .restart local v4    # "hashString":Ljava/lang/StringBuilder;
    .restart local v6    # "i$":I
    .restart local v7    # "len$":I
    :cond_51
    :try_start_51
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_54} :catch_4a

    move-result-object v8

    return-object v8
.end method

.method public static namedFormat(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .registers 6
    .param p0, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 187
    .local p1, "substitutions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 188
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x24

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_8

    .line 191
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_38
    return-object p0
.end method

.method public static varargs namedFormat(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "nameValuePairs"    # [Ljava/lang/Object;

    .prologue
    .line 195
    array-length v2, p1

    rem-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_d

    .line 196
    new-instance v2, Ljava/security/InvalidParameterException;

    const-string v3, "You must include one value for each parameter"

    invoke-direct {v2, v3}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 199
    :cond_d
    new-instance v1, Ljava/util/HashMap;

    array-length v2, p1

    div-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 200
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_16
    array-length v2, p1

    if-ge v0, v2, :cond_2d

    .line 201
    aget-object v2, p1, v0

    invoke-static {v2}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    aget-object v3, p1, v3

    invoke-static {v3}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    add-int/lit8 v0, v0, 0x2

    goto :goto_16

    .line 204
    :cond_2d
    invoke-static {p0, v1}, Lroboguice/util/temp/Strings;->namedFormat(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static notEmpty(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 129
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public static toString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;

    .prologue
    .line 84
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 85
    .local v0, "sw":Ljava/io/StringWriter;
    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-static {v1, v0}, Lroboguice/util/temp/Strings;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    .line 86
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static toString(Ljava/io/Reader;)Ljava/lang/String;
    .registers 3
    .param p0, "input"    # Ljava/io/Reader;

    .prologue
    .line 90
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 91
    .local v0, "sw":Ljava/io/StringWriter;
    invoke-static {p0, v0}, Lroboguice/util/temp/Strings;->copy(Ljava/io/Reader;Ljava/io/Writer;)I

    .line 92
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 116
    const-string v0, ""

    invoke-static {p0, v0}, Lroboguice/util/temp/Strings;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;
    .param p1, "def"    # Ljava/lang/String;

    .prologue
    .line 120
    if-nez p0, :cond_3

    .end local p1    # "def":Ljava/lang/String;
    :goto_2
    return-object p1

    .restart local p1    # "def":Ljava/lang/String;
    :cond_3
    instance-of v0, p0, Ljava/io/InputStream;

    if-eqz v0, :cond_e

    check-cast p0, Ljava/io/InputStream;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .restart local p0    # "o":Ljava/lang/Object;
    :cond_e
    instance-of v0, p0, Ljava/io/Reader;

    if-eqz v0, :cond_19

    check-cast p0, Ljava/io/Reader;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-static {p0}, Lroboguice/util/temp/Strings;->toString(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .restart local p0    # "o":Ljava/lang/Object;
    :cond_19
    instance-of v0, p0, [Ljava/lang/Object;

    if-eqz v0, :cond_28

    const-string v0, ", "

    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "o":Ljava/lang/Object;
    check-cast p0, [Ljava/lang/Object;

    invoke-static {v0, p0}, Lroboguice/util/temp/Strings;->join(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .restart local p0    # "o":Ljava/lang/Object;
    :cond_28
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_35

    const-string v0, ", "

    check-cast p0, Ljava/util/Collection;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-static {v0, p0}, Lroboguice/util/temp/Strings;->join(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    .restart local p0    # "o":Ljava/lang/Object;
    :cond_35
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2
.end method
