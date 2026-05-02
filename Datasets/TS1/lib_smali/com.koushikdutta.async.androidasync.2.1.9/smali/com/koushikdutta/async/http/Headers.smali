.class public Lcom/koushikdutta/async/http/Headers;
.super Ljava/lang/Object;
.source "Headers.java"


# instance fields
.field final map:Lcom/koushikdutta/async/http/Multimap;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/koushikdutta/async/http/Headers$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/Headers$1;-><init>(Lcom/koushikdutta/async/http/Headers;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p1, "mm":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/koushikdutta/async/http/Headers$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/Headers$1;-><init>(Lcom/koushikdutta/async/http/Headers;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    .line 20
    iget-object v0, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/http/Multimap;->putAll(Ljava/util/Map;)V

    .line 21
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;
    .registers 8
    .param p0, "payload"    # Ljava/lang/String;

    .prologue
    .line 139
    const-string v6, "\n"

    invoke-virtual {p0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 141
    .local v5, "lines":[Ljava/lang/String;
    new-instance v1, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v1}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    .line 142
    .local v1, "headers":Lcom/koushikdutta/async/http/Headers;
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v3, :cond_23

    aget-object v4, v0, v2

    .line 143
    .local v4, "line":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 144
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1f

    .line 142
    :goto_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 147
    :cond_1f
    invoke-virtual {v1, v4}, Lcom/koushikdutta/async/http/Headers;->addLine(Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_1c

    .line 149
    .end local v4    # "line":Ljava/lang/String;
    :cond_23
    return-object v1
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;
    .registers 6
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "lc":Ljava/lang/String;
    iget-object v2, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v2, v0, p2}, Lcom/koushikdutta/async/http/Multimap;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    iget-object v2, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v2, v0}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/util/TaggedList;

    .line 55
    .local v1, "list":Lcom/koushikdutta/async/util/TaggedList;, "Lcom/koushikdutta/async/util/TaggedList<Ljava/lang/String;>;"
    invoke-virtual {v1, p1}, Lcom/koushikdutta/async/util/TaggedList;->tagNull(Ljava/lang/Object;)V

    .line 56
    return-object p0
.end method

.method public addAll(Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/Headers;
    .registers 4
    .param p1, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    iget-object v1, p1, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Multimap;->putAll(Ljava/util/Map;)V

    .line 90
    return-object p0
.end method

.method public addAll(Ljava/lang/String;Ljava/util/List;)Lcom/koushikdutta/async/http/Headers;
    .registers 6
    .param p1, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/koushikdutta/async/http/Headers;"
        }
    .end annotation

    .prologue
    .line 72
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 73
    .local v1, "v":Ljava/lang/String;
    invoke-virtual {p0, p1, v1}, Lcom/koushikdutta/async/http/Headers;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_4

    .line 75
    .end local v1    # "v":Ljava/lang/String;
    :cond_14
    return-object p0
.end method

.method public addAll(Ljava/util/Map;)Lcom/koushikdutta/async/http/Headers;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/koushikdutta/async/http/Headers;"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 80
    .local v2, "key":Ljava/lang/String;
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 81
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {p0, v2, v3}, Lcom/koushikdutta/async/http/Headers;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_1e

    .line 84
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_2e
    return-object p0
.end method

.method public addLine(Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;
    .registers 6
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 60
    if-eqz p1, :cond_21

    .line 61
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 62
    const-string v1, ":"

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "parts":[Ljava/lang/String;
    array-length v1, v0

    if-ne v1, v3, :cond_22

    .line 64
    aget-object v1, v0, v2

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 68
    .end local v0    # "parts":[Ljava/lang/String;
    :cond_21
    :goto_21
    return-object p0

    .line 66
    .restart local v0    # "parts":[Ljava/lang/String;
    :cond_22
    aget-object v1, v0, v2

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    goto :goto_21
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "header"    # Ljava/lang/String;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Multimap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAll(Ljava/lang/String;)Ljava/util/List;
    .registers 4
    .param p1, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    iget-object v0, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getMultiMap()Lcom/koushikdutta/async/http/Multimap;
    .registers 2

    .prologue
    .line 30
    iget-object v0, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    return-object v0
.end method

.method public remove(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "header"    # Ljava/lang/String;

    .prologue
    .line 98
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/http/Headers;->removeAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 99
    .local v0, "r":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_10

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_12

    .line 100
    :cond_10
    const/4 v1, 0x0

    .line 101
    :goto_11
    return-object v1

    :cond_12
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_11
.end method

.method public removeAll(Ljava/util/Collection;)Lcom/koushikdutta/async/http/Headers;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/koushikdutta/async/http/Headers;"
        }
    .end annotation

    .prologue
    .line 105
    .local p1, "headers":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 106
    .local v0, "header":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/Headers;->remove(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_4

    .line 108
    .end local v0    # "header":Ljava/lang/String;
    :cond_14
    return-object p0
.end method

.method public removeAll(Ljava/lang/String;)Ljava/util/List;
    .registers 4
    .param p1, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Multimap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;
    .registers 7
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 42
    if-eqz p2, :cond_1a

    const-string v2, "\n"

    invoke-virtual {p2, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12

    const-string v2, "\r"

    invoke-virtual {p2, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 43
    :cond_12
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "value must not contain a new line or line feed"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 44
    :cond_1a
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "lc":Ljava/lang/String;
    iget-object v2, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v2, v0, p2}, Lcom/koushikdutta/async/http/Multimap;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    iget-object v2, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v2, v0}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/async/util/TaggedList;

    .line 47
    .local v1, "list":Lcom/koushikdutta/async/util/TaggedList;, "Lcom/koushikdutta/async/util/TaggedList<Ljava/lang/String;>;"
    invoke-virtual {v1, p1}, Lcom/koushikdutta/async/util/TaggedList;->tagNull(Ljava/lang/Object;)V

    .line 48
    return-object p0
.end method

.method public toPrefixString(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/Headers;->toStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 134
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/Headers;->toStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringBuilder()Ljava/lang/StringBuilder;
    .registers 9

    .prologue
    .line 112
    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v6, 0x100

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 113
    .local v4, "result":Ljava/lang/StringBuilder;
    iget-object v6, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v6}, Lcom/koushikdutta/async/http/Multimap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 114
    .local v2, "key":Ljava/lang/String;
    iget-object v6, p0, Lcom/koushikdutta/async/http/Headers;->map:Lcom/koushikdutta/async/http/Multimap;

    invoke-virtual {v6, v2}, Lcom/koushikdutta/async/http/Multimap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/koushikdutta/async/util/TaggedList;

    .line 115
    .local v3, "list":Lcom/koushikdutta/async/util/TaggedList;, "Lcom/koushikdutta/async/util/TaggedList<Ljava/lang/String;>;"
    invoke-virtual {v3}, Lcom/koushikdutta/async/util/TaggedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_29
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_11

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 116
    .local v5, "v":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/koushikdutta/async/util/TaggedList;->tag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": "

    .line 117
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 118
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\r\n"

    .line 119
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_29

    .line 122
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "list":Lcom/koushikdutta/async/util/TaggedList;, "Lcom/koushikdutta/async/util/TaggedList<Ljava/lang/String;>;"
    .end local v5    # "v":Ljava/lang/String;
    :cond_4f
    const-string v6, "\r\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    return-object v4
.end method
