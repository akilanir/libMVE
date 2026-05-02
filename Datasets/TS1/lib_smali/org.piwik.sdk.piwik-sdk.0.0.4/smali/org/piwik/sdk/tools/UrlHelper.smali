.class public Lorg/piwik/sdk/tools/UrlHelper;
.super Ljava/lang/Object;
.source "UrlHelper.java"


# static fields
.field private static final NAME_VALUE_SEPARATOR:Ljava/lang/String; = "="

.field private static final PARAMETER_SEPARATOR:Ljava/lang/String; = "&"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "content"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "encoding"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 62
    if-eqz p1, :cond_4

    move-object v0, p1

    goto :goto_6

    :cond_4
    :try_start_4
    const-string v0, "UTF-8"

    :goto_6
    invoke-static {p0, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_a} :catch_b

    return-object v0

    .line 63
    :catch_b
    move-exception v0

    .line 64
    .local v0, "problem":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static parse(Ljava/net/URI;Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p0, "uri"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "encoding"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 35
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 36
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v1

    .line 37
    .local v1, "query":Ljava/lang/String;
    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1e

    .line 38
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v2

    .line 39
    new-instance v2, Ljava/util/Scanner;

    invoke-direct {v2, v1}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2, p1}, Lorg/piwik/sdk/tools/UrlHelper;->parse(Ljava/util/List;Ljava/util/Scanner;Ljava/lang/String;)V

    .line 41
    :cond_1e
    return-object v0
.end method

.method public static parse(Ljava/util/List;Ljava/util/Scanner;Ljava/lang/String;)V
    .registers 8
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "scanner"    # Ljava/util/Scanner;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "encoding"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/util/Scanner;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 45
    .local p0, "parameters":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    const-string v0, "&"

    invoke-virtual {p1, v0}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 46
    :goto_5
    invoke-virtual {p1}, Ljava/util/Scanner;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 47
    invoke-virtual {p1}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "nameValue":[Ljava/lang/String;
    array-length v1, v0

    if-eqz v1, :cond_38

    array-length v1, v0

    const/4 v2, 0x2

    if-le v1, v2, :cond_1d

    goto :goto_38

    .line 51
    :cond_1d
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-static {v1, p2}, Lorg/piwik/sdk/tools/UrlHelper;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 53
    .local v3, "value":Ljava/lang/String;
    array-length v4, v0

    if-ne v4, v2, :cond_2f

    .line 54
    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v2, p2}, Lorg/piwik/sdk/tools/UrlHelper;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 55
    :cond_2f
    new-instance v2, Landroid/util/Pair;

    invoke-direct {v2, v1, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .end local v0    # "nameValue":[Ljava/lang/String;
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    goto :goto_5

    .line 49
    .restart local v0    # "nameValue":[Ljava/lang/String;
    :cond_38
    :goto_38
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "bad parameter"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 57
    .end local v0    # "nameValue":[Ljava/lang/String;
    :cond_40
    return-void
.end method
