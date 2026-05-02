.class public Lcom/drew/lang/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compare(Ljava/lang/String;Ljava/lang/String;)I
    .registers 6
    .param p0, "s1"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param
    .param p1, "s2"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 95
    if-nez p0, :cond_d

    move v0, v3

    .line 96
    .local v0, "null1":Z
    :goto_5
    if-nez p1, :cond_f

    move v1, v3

    .line 98
    .local v1, "null2":Z
    :goto_8
    if-eqz v0, :cond_11

    if-eqz v1, :cond_11

    .line 105
    :goto_c
    return v2

    .end local v0    # "null1":Z
    .end local v1    # "null2":Z
    :cond_d
    move v0, v2

    .line 95
    goto :goto_5

    .restart local v0    # "null1":Z
    :cond_f
    move v1, v2

    .line 96
    goto :goto_8

    .line 100
    .restart local v1    # "null2":Z
    :cond_11
    if-eqz v0, :cond_15

    .line 101
    const/4 v2, -0x1

    goto :goto_c

    .line 102
    :cond_15
    if-eqz v1, :cond_19

    move v2, v3

    .line 103
    goto :goto_c

    .line 105
    :cond_19
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    goto :goto_c
.end method

.method public static fromStream(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 5
    .param p0, "stream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 85
    .local v1, "reader":Ljava/io/BufferedReader;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .local v2, "sb":Ljava/lang/StringBuilder;
    :goto_f
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_19

    .line 88
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_f

    .line 90
    :cond_19
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static join(Ljava/lang/Iterable;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0    # Ljava/lang/Iterable;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "delimiter"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Ljava/lang/CharSequence;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "strings":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Ljava/lang/CharSequence;>;"
    const/4 v1, 0x0

    .line 42
    .local v1, "capacity":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 44
    .local v2, "delimLength":I
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 45
    .local v3, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<+Ljava/lang/CharSequence;>;"
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 46
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    add-int/2addr v4, v2

    add-int/2addr v1, v4

    .line 48
    :cond_1b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 49
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 50
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_46

    .line 51
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 52
    :goto_33
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_46

    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_33

    .line 57
    :cond_46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static join([Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p0    # [Ljava/lang/CharSequence;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "delimiter"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/CharSequence;",
            ">([TT;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 63
    .local p0, "strings":[Ljava/lang/CharSequence;, "[TT;"
    const/4 v2, 0x0

    .line 64
    .local v2, "capacity":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 65
    .local v3, "delimLength":I
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/CharSequence;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_8
    if-ge v5, v6, :cond_15

    aget-object v7, v0, v5

    .line 66
    .local v7, "value":Ljava/lang/CharSequence;, "TT;"
    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v8

    add-int/2addr v8, v3

    add-int/2addr v2, v8

    .line 65
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 68
    .end local v7    # "value":Ljava/lang/CharSequence;, "TT;"
    :cond_15
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 69
    .local v1, "buffer":Ljava/lang/StringBuilder;
    const/4 v4, 0x1

    .line 70
    .local v4, "first":Z
    move-object v0, p0

    array-length v6, v0

    const/4 v5, 0x0

    :goto_1e
    if-ge v5, v6, :cond_2f

    aget-object v7, v0, v5

    .line 71
    .restart local v7    # "value":Ljava/lang/CharSequence;, "TT;"
    if-nez v4, :cond_2d

    .line 72
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    :goto_27
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 70
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    .line 74
    :cond_2d
    const/4 v4, 0x0

    goto :goto_27

    .line 78
    .end local v7    # "value":Ljava/lang/CharSequence;, "TT;"
    :cond_2f
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public static urlEncode(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 113
    const-string v0, " "

    const-string v1, "%20"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
