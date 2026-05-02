.class public Lnl/siegmann/epublib/util/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static defaultIfNull(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 80
    const-string v0, ""

    invoke-static {p0, v0}, Lnl/siegmann/epublib/util/StringUtil;->defaultIfNull(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static defaultIfNull(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 91
    if-nez p0, :cond_3

    .line 94
    .end local p1    # "defaultValue":Ljava/lang/String;
    :goto_2
    return-object p1

    .restart local p1    # "defaultValue":Ljava/lang/String;
    :cond_3
    move-object p1, p0

    goto :goto_2
.end method

.method public static endsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p0, "source"    # Ljava/lang/String;
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-static {p1}, Lnl/siegmann/epublib/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 62
    const/4 v0, 0x1

    .line 70
    :cond_8
    :goto_8
    return v0

    .line 64
    :cond_9
    invoke-static {p0}, Lnl/siegmann/epublib/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 67
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v1, v2, :cond_8

    .line 70
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    goto :goto_8
.end method

.method public static equals(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .param p0, "text1"    # Ljava/lang/String;
    .param p1, "text2"    # Ljava/lang/String;

    .prologue
    .line 105
    if-nez p0, :cond_8

    .line 106
    if-nez p1, :cond_6

    const/4 v0, 0x1

    .line 108
    :goto_5
    return v0

    .line 106
    :cond_6
    const/4 v0, 0x0

    goto :goto_5

    .line 108
    :cond_8
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public static varargs hashCode([Ljava/lang/String;)I
    .registers 4
    .param p0, "values"    # [Ljava/lang/String;

    .prologue
    .line 143
    const/16 v1, 0x1f

    .line 144
    .local v1, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    array-length v2, p0

    if-ge v0, v2, :cond_14

    .line 145
    aget-object v2, p0, v0

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v1, v2

    .line 144
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 147
    :cond_14
    return v1
.end method

.method public static isBlank(Ljava/lang/String;)Z
    .registers 4
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 32
    invoke-static {p0}, Lnl/siegmann/epublib/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 40
    :cond_7
    :goto_7
    return v1

    .line 35
    :cond_8
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_7

    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_1b

    .line 37
    const/4 v1, 0x0

    goto :goto_7

    .line 35
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_9
.end method

.method public static isEmpty(Ljava/lang/String;)Z
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 50
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isNotBlank(Ljava/lang/String;)Z
    .registers 2
    .param p0, "text"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-static {p0}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static substringAfter(Ljava/lang/String;C)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "c"    # C

    .prologue
    .line 220
    invoke-static {p0}, Lnl/siegmann/epublib/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 227
    .end local p0    # "text":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 223
    .restart local p0    # "text":Ljava/lang/String;
    :cond_7
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 224
    .local v0, "cPos":I
    if-gez v0, :cond_10

    .line 225
    const-string p0, ""

    goto :goto_6

    .line 227
    :cond_10
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static substringAfterLast(Ljava/lang/String;C)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "separator"    # C

    .prologue
    .line 200
    invoke-static {p0}, Lnl/siegmann/epublib/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 207
    .end local p0    # "text":Ljava/lang/String;
    :goto_6
    return-object p0

    .line 203
    .restart local p0    # "text":Ljava/lang/String;
    :cond_7
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 204
    .local v0, "cPos":I
    if-gez v0, :cond_10

    .line 205
    const-string p0, ""

    goto :goto_6

    .line 207
    :cond_10
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static substringBefore(Ljava/lang/String;C)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "separator"    # C

    .prologue
    .line 160
    invoke-static {p0}, Lnl/siegmann/epublib/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 167
    .end local p0    # "text":Ljava/lang/String;
    :cond_6
    :goto_6
    return-object p0

    .line 163
    .restart local p0    # "text":Ljava/lang/String;
    :cond_7
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 164
    .local v0, "sepPos":I
    if-ltz v0, :cond_6

    .line 167
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static substringBeforeLast(Ljava/lang/String;C)Ljava/lang/String;
    .registers 4
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "separator"    # C

    .prologue
    .line 180
    invoke-static {p0}, Lnl/siegmann/epublib/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 187
    .end local p0    # "text":Ljava/lang/String;
    :cond_6
    :goto_6
    return-object p0

    .line 183
    .restart local p0    # "text":Ljava/lang/String;
    :cond_7
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 184
    .local v0, "cPos":I
    if-ltz v0, :cond_6

    .line 187
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_6
.end method

.method public static varargs toString([Ljava/lang/Object;)Ljava/lang/String;
    .registers 7
    .param p0, "keyValues"    # [Ljava/lang/Object;

    .prologue
    const/16 v5, 0x27

    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .local v1, "result":Ljava/lang/StringBuilder;
    const/16 v3, 0x5b

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 120
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    array-length v3, p0

    if-ge v0, v3, :cond_3f

    .line 121
    if-lez v0, :cond_17

    .line 122
    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    :cond_17
    aget-object v3, p0, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 125
    const-string v3, ": "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    const/4 v2, 0x0

    .line 127
    .local v2, "value":Ljava/lang/Object;
    add-int/lit8 v3, v0, 0x1

    array-length v4, p0

    if-ge v3, v4, :cond_2b

    .line 128
    add-int/lit8 v3, v0, 0x1

    aget-object v2, p0, v3

    .line 130
    .end local v2    # "value":Ljava/lang/Object;
    :cond_2b
    if-nez v2, :cond_35

    .line 131
    const-string v3, "<null>"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    :goto_32
    add-int/lit8 v0, v0, 0x2

    goto :goto_d

    .line 133
    :cond_35
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 134
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_32

    .line 138
    :cond_3f
    const/16 v3, 0x5d

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
