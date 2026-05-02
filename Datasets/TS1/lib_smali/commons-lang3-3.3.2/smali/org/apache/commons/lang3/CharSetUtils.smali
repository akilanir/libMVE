.class public Lorg/apache/commons/lang3/CharSetUtils;
.super Ljava/lang/Object;
.source "CharSetUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static varargs containsAny(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 9
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 108
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_d

    invoke-static {p1}, Lorg/apache/commons/lang3/CharSetUtils;->deepEmpty([Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 117
    :cond_d
    :goto_d
    return v5

    .line 111
    :cond_e
    invoke-static {p1}, Lorg/apache/commons/lang3/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;

    move-result-object v2

    .line 112
    .local v2, "chars":Lorg/apache/commons/lang3/CharSet;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .local v0, "arr$":[C
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_18
    if-ge v3, v4, :cond_d

    aget-char v1, v0, v3

    .line 113
    .local v1, "c":C
    invoke-virtual {v2, v1}, Lorg/apache/commons/lang3/CharSet;->contains(C)Z

    move-result v6

    if-eqz v6, :cond_24

    .line 114
    const/4 v5, 0x1

    goto :goto_d

    .line 112
    :cond_24
    add-int/lit8 v3, v3, 0x1

    goto :goto_18
.end method

.method public static varargs count(Ljava/lang/String;[Ljava/lang/String;)I
    .registers 9
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    .line 141
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_c

    invoke-static {p1}, Lorg/apache/commons/lang3/CharSetUtils;->deepEmpty([Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 142
    :cond_c
    const/4 v3, 0x0

    .line 151
    :cond_d
    return v3

    .line 144
    :cond_e
    invoke-static {p1}, Lorg/apache/commons/lang3/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;

    move-result-object v2

    .line 145
    .local v2, "chars":Lorg/apache/commons/lang3/CharSet;
    const/4 v3, 0x0

    .line 146
    .local v3, "count":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .local v0, "arr$":[C
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_19
    if-ge v4, v5, :cond_d

    aget-char v1, v0, v4

    .line 147
    .local v1, "c":C
    invoke-virtual {v2, v1}, Lorg/apache/commons/lang3/CharSet;->contains(C)Z

    move-result v6

    if-eqz v6, :cond_25

    .line 148
    add-int/lit8 v3, v3, 0x1

    .line 146
    :cond_25
    add-int/lit8 v4, v4, 0x1

    goto :goto_19
.end method

.method private static deepEmpty([Ljava/lang/String;)Z
    .registers 6
    .param p0, "strings"    # [Ljava/lang/String;

    .prologue
    .line 242
    if-eqz p0, :cond_14

    .line 243
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_5
    if-ge v1, v2, :cond_14

    aget-object v3, v0, v1

    .line 244
    .local v3, "s":Ljava/lang/String;
    invoke-static {v3}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 245
    const/4 v4, 0x0

    .line 249
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "s":Ljava/lang/String;
    :goto_10
    return v4

    .line 243
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v3    # "s":Ljava/lang/String;
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 249
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "s":Ljava/lang/String;
    :cond_14
    const/4 v4, 0x1

    goto :goto_10
.end method

.method public static varargs delete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    .line 206
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p1}, Lorg/apache/commons/lang3/CharSetUtils;->deepEmpty([Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 209
    .end local p0    # "str":Ljava/lang/String;
    :cond_c
    :goto_c
    return-object p0

    .restart local p0    # "str":Ljava/lang/String;
    :cond_d
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/CharSetUtils;->modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    goto :goto_c
.end method

.method public static varargs keep(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    .line 176
    if-nez p0, :cond_4

    .line 177
    const/4 v0, 0x0

    .line 182
    :goto_3
    return-object v0

    .line 179
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-static {p1}, Lorg/apache/commons/lang3/CharSetUtils;->deepEmpty([Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 180
    :cond_10
    const-string v0, ""

    goto :goto_3

    .line 182
    :cond_13
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/CharSetUtils;->modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method private static modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;
    .registers 9
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;
    .param p2, "expect"    # Z

    .prologue
    .line 222
    invoke-static {p1}, Lorg/apache/commons/lang3/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;

    move-result-object v1

    .line 223
    .local v1, "chars":Lorg/apache/commons/lang3/CharSet;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 224
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 225
    .local v2, "chrs":[C
    array-length v4, v2

    .line 226
    .local v4, "sz":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_13
    if-ge v3, v4, :cond_25

    .line 227
    aget-char v5, v2, v3

    invoke-virtual {v1, v5}, Lorg/apache/commons/lang3/CharSet;->contains(C)Z

    move-result v5

    if-ne v5, p2, :cond_22

    .line 228
    aget-char v5, v2, v3

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 226
    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 231
    :cond_25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static varargs squeeze(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    .line 65
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_c

    invoke-static {p1}, Lorg/apache/commons/lang3/CharSetUtils;->deepEmpty([Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 83
    .end local p0    # "str":Ljava/lang/String;
    :cond_c
    :goto_c
    return-object p0

    .line 68
    .restart local p0    # "str":Ljava/lang/String;
    :cond_d
    invoke-static {p1}, Lorg/apache/commons/lang3/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;

    move-result-object v2

    .line 69
    .local v2, "chars":Lorg/apache/commons/lang3/CharSet;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 70
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    .line 71
    .local v3, "chrs":[C
    array-length v6, v3

    .line 72
    .local v6, "sz":I
    const/16 v5, 0x20

    .line 73
    .local v5, "lastChar":C
    const/16 v1, 0x20

    .line 74
    .local v1, "ch":C
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_24
    if-ge v4, v6, :cond_3a

    .line 75
    aget-char v1, v3, v4

    .line 77
    if-ne v1, v5, :cond_35

    if-eqz v4, :cond_35

    invoke-virtual {v2, v1}, Lorg/apache/commons/lang3/CharSet;->contains(C)Z

    move-result v7

    if-eqz v7, :cond_35

    .line 74
    :goto_32
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    .line 80
    :cond_35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 81
    move v5, v1

    goto :goto_32

    .line 83
    :cond_3a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_c
.end method
