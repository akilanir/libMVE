.class public Lcom/koushikdutta/async/http/Multimap;
.super Ljava/util/LinkedHashMap;
.source "Multimap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/Multimap$StringDecoder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/util/List",
        "<",
        "Ljava/lang/String;",
        ">;>;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/koushikdutta/async/http/NameValuePair;",
        ">;"
    }
.end annotation


# static fields
.field private static final QUERY_DECODER:Lcom/koushikdutta/async/http/Multimap$StringDecoder;

.field private static final URL_DECODER:Lcom/koushikdutta/async/http/Multimap$StringDecoder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 87
    new-instance v0, Lcom/koushikdutta/async/http/Multimap$1;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Multimap$1;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/http/Multimap;->QUERY_DECODER:Lcom/koushikdutta/async/http/Multimap$StringDecoder;

    .line 98
    new-instance v0, Lcom/koushikdutta/async/http/Multimap$2;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Multimap$2;-><init>()V

    sput-object v0, Lcom/koushikdutta/async/http/Multimap;->URL_DECODER:Lcom/koushikdutta/async/http/Multimap$StringDecoder;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/async/http/Multimap;)V
    .registers 2
    .param p1, "m"    # Lcom/koushikdutta/async/http/Multimap;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 50
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/Multimap;->putAll(Ljava/util/Map;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/koushikdutta/async/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/koushikdutta/async/http/NameValuePair;>;"
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 45
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/http/NameValuePair;

    .line 46
    .local v1, "pair":Lcom/koushikdutta/async/http/NameValuePair;
    invoke-interface {v1}, Lcom/koushikdutta/async/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1}, Lcom/koushikdutta/async/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/koushikdutta/async/http/Multimap;->add(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    .line 47
    .end local v1    # "pair":Lcom/koushikdutta/async/http/NameValuePair;
    :cond_1f
    return-void
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;ZLcom/koushikdutta/async/http/Multimap$StringDecoder;)Lcom/koushikdutta/async/http/Multimap;
    .registers 16
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "delimiter"    # Ljava/lang/String;
    .param p2, "unquote"    # Z
    .param p3, "decoder"    # Lcom/koushikdutta/async/http/Multimap$StringDecoder;

    .prologue
    const/4 v11, 0x1

    .line 58
    new-instance v4, Lcom/koushikdutta/async/http/Multimap;

    invoke-direct {v4}, Lcom/koushikdutta/async/http/Multimap;-><init>()V

    .line 59
    .local v4, "map":Lcom/koushikdutta/async/http/Multimap;
    if-nez p0, :cond_9

    .line 76
    :cond_8
    return-object v4

    .line 61
    :cond_9
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 62
    .local v7, "parts":[Ljava/lang/String;
    move-object v0, v7

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_10
    if-ge v1, v3, :cond_8

    aget-object v6, v0, v1

    .line 63
    .local v6, "part":Ljava/lang/String;
    const-string v9, "="

    const/4 v10, 0x2

    invoke-virtual {v6, v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    .line 64
    .local v5, "pair":[Ljava/lang/String;
    const/4 v9, 0x0

    aget-object v9, v5, v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 65
    .local v2, "key":Ljava/lang/String;
    const/4 v8, 0x0

    .line 66
    .local v8, "v":Ljava/lang/String;
    array-length v9, v5

    if-le v9, v11, :cond_28

    .line 67
    aget-object v8, v5, v11

    .line 68
    :cond_28
    if-eqz p2, :cond_46

    if-eqz v8, :cond_46

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_46

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_46

    .line 69
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v11, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 70
    :cond_46
    if-eqz p3, :cond_50

    .line 71
    invoke-interface {p3, v2}, Lcom/koushikdutta/async/http/Multimap$StringDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 72
    invoke-interface {p3, v8}, Lcom/koushikdutta/async/http/Multimap$StringDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 74
    :cond_50
    invoke-virtual {v4, v2, v8}, Lcom/koushikdutta/async/http/Multimap;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    add-int/lit8 v1, v1, 0x1

    goto :goto_10
.end method

.method public static parseCommaDelimited(Ljava/lang/String;)Lcom/koushikdutta/async/http/Multimap;
    .registers 4
    .param p0, "header"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string v0, ","

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcom/koushikdutta/async/http/Multimap;->parse(Ljava/lang/String;Ljava/lang/String;ZLcom/koushikdutta/async/http/Multimap$StringDecoder;)Lcom/koushikdutta/async/http/Multimap;

    move-result-object v0

    return-object v0
.end method

.method public static parseQuery(Ljava/lang/String;)Lcom/koushikdutta/async/http/Multimap;
    .registers 4
    .param p0, "query"    # Ljava/lang/String;

    .prologue
    .line 95
    const-string v0, "&"

    const/4 v1, 0x0

    sget-object v2, Lcom/koushikdutta/async/http/Multimap;->QUERY_DECODER:Lcom/koushikdutta/async/http/Multimap$StringDecoder;

    invoke-static {p0, v0, v1, v2}, Lcom/koushikdutta/async/http/Multimap;->parse(Ljava/lang/String;Ljava/lang/String;ZLcom/koushikdutta/async/http/Multimap$StringDecoder;)Lcom/koushikdutta/async/http/Multimap;

    move-result-object v0

    return-object v0
.end method

.method public static parseSemicolonDelimited(Ljava/lang/String;)Lcom/koushikdutta/async/http/Multimap;
    .registers 4
    .param p0, "header"    # Ljava/lang/String;

    .prologue
    .line 80
    const-string v0, ";"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcom/koushikdutta/async/http/Multimap;->parse(Ljava/lang/String;Ljava/lang/String;ZLcom/koushikdutta/async/http/Multimap$StringDecoder;)Lcom/koushikdutta/async/http/Multimap;

    move-result-object v0

    return-object v0
.end method

.method public static parseUrlEncoded(Ljava/lang/String;)Lcom/koushikdutta/async/http/Multimap;
    .registers 4
    .param p0, "query"    # Ljava/lang/String;

    .prologue
    .line 106
    const-string v0, "&"

    const/4 v1, 0x0

    sget-object v2, Lcom/koushikdutta/async/http/Multimap;->URL_DECODER:Lcom/koushikdutta/async/http/Multimap$StringDecoder;

    invoke-static {p0, v0, v1, v2}, Lcom/koushikdutta/async/http/Multimap;->parse(Ljava/lang/String;Ljava/lang/String;ZLcom/koushikdutta/async/http/Multimap$StringDecoder;)Lcom/koushikdutta/async/http/Multimap;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 31
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_f

    .line 32
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/Multimap;->newList()Ljava/util/List;

    move-result-object v0

    .line 33
    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/http/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    :cond_f
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    return-void
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 24
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_e

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_10

    .line 25
    :cond_e
    const/4 v1, 0x0

    .line 26
    :goto_f
    return-object v1

    :cond_10
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_f
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/koushikdutta/async/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .local v3, "ret":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/http/NameValuePair;>;"
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/Multimap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_38

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 113
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 114
    .local v5, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_23
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 115
    .local v4, "value":Ljava/lang/String;
    new-instance v6, Lcom/koushikdutta/async/http/BasicNameValuePair;

    invoke-direct {v6, v2, v4}, Lcom/koushikdutta/async/http/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_23

    .line 118
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    .end local v5    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_38
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    return-object v6
.end method

.method protected newList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/Multimap;->newList()Ljava/util/List;

    move-result-object v0

    .line 40
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/http/Multimap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    return-void
.end method
