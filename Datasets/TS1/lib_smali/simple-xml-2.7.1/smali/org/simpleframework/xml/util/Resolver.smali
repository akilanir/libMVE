.class public Lorg/simpleframework/xml/util/Resolver;
.super Ljava/util/AbstractSet;
.source "Resolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/simpleframework/xml/util/Resolver$1;,
        Lorg/simpleframework/xml/util/Resolver$Stack;,
        Lorg/simpleframework/xml/util/Resolver$Cache;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M::",
        "Lorg/simpleframework/xml/util/Match;",
        ">",
        "Ljava/util/AbstractSet",
        "<TM;>;"
    }
.end annotation


# instance fields
.field protected final cache:Lorg/simpleframework/xml/util/Resolver$Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/simpleframework/xml/util/Resolver",
            "<TM;>.Cache;"
        }
    .end annotation
.end field

.field protected final stack:Lorg/simpleframework/xml/util/Resolver$Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/simpleframework/xml/util/Resolver",
            "<TM;>.Stack;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 82
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 83
    new-instance v0, Lorg/simpleframework/xml/util/Resolver$Stack;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/simpleframework/xml/util/Resolver$Stack;-><init>(Lorg/simpleframework/xml/util/Resolver;Lorg/simpleframework/xml/util/Resolver$1;)V

    iput-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->stack:Lorg/simpleframework/xml/util/Resolver$Stack;

    .line 84
    new-instance v0, Lorg/simpleframework/xml/util/Resolver$Cache;

    invoke-direct {v0, p0}, Lorg/simpleframework/xml/util/Resolver$Cache;-><init>(Lorg/simpleframework/xml/util/Resolver;)V

    iput-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->cache:Lorg/simpleframework/xml/util/Resolver$Cache;

    .line 85
    return-void
.end method

.method private match([CI[CI)Z
    .registers 13
    .param p1, "text"    # [C
    .param p2, "off"    # I
    .param p3, "wild"    # [C
    .param p4, "pos"    # I

    .prologue
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    const/16 v7, 0x2a

    const/16 v6, 0x3f

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 251
    :goto_6
    array-length v4, p3

    if-ge p4, v4, :cond_58

    array-length v4, p1

    if-ge p2, v4, :cond_58

    .line 252
    aget-char v4, p3, p4

    if-ne v4, v7, :cond_44

    .line 253
    :cond_10
    aget-char v4, p3, p4

    if-ne v4, v7, :cond_1a

    .line 254
    add-int/lit8 p4, p4, 0x1

    array-length v4, p3

    if-lt p4, v4, :cond_10

    .line 286
    :cond_19
    :goto_19
    return v2

    .line 257
    :cond_1a
    aget-char v4, p3, p4

    if-ne v4, v6, :cond_23

    .line 258
    add-int/lit8 p4, p4, 0x1

    array-length v4, p3

    if-ge p4, v4, :cond_19

    .line 261
    :cond_23
    :goto_23
    array-length v4, p1

    if-ge p2, v4, :cond_3f

    .line 262
    aget-char v4, p1, p2

    aget-char v5, p3, p4

    if-eq v4, v5, :cond_30

    aget-char v4, p3, p4

    if-ne v4, v6, :cond_3c

    .line 263
    :cond_30
    add-int/lit8 v4, p4, -0x1

    aget-char v4, p3, v4

    if-eq v4, v6, :cond_3f

    .line 264
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/simpleframework/xml/util/Resolver;->match([CI[CI)Z

    move-result v4

    if-nez v4, :cond_19

    .line 261
    :cond_3c
    add-int/lit8 p2, p2, 0x1

    goto :goto_23

    .line 271
    :cond_3f
    array-length v4, p1

    if-ne v4, p2, :cond_44

    move v2, v3

    .line 272
    goto :goto_19

    .line 274
    :cond_44
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "off":I
    .local v0, "off":I
    aget-char v4, p1, p2

    add-int/lit8 v1, p4, 0x1

    .end local p4    # "pos":I
    .local v1, "pos":I
    aget-char v5, p3, p4

    if-eq v4, v5, :cond_6c

    .line 275
    add-int/lit8 v4, v1, -0x1

    aget-char v4, p3, v4

    if-eq v4, v6, :cond_6c

    move p4, v1

    .end local v1    # "pos":I
    .restart local p4    # "pos":I
    move p2, v0

    .end local v0    # "off":I
    .restart local p2    # "off":I
    move v2, v3

    .line 276
    goto :goto_19

    .line 279
    :cond_58
    array-length v4, p3

    if-ne v4, p4, :cond_60

    .line 280
    array-length v4, p1

    if-eq v4, p2, :cond_19

    move v2, v3

    goto :goto_19

    .line 282
    :cond_60
    aget-char v4, p3, p4

    if-ne v4, v7, :cond_6a

    .line 283
    add-int/lit8 p4, p4, 0x1

    array-length v4, p3

    if-lt p4, v4, :cond_60

    goto :goto_19

    :cond_6a
    move v2, v3

    .line 286
    goto :goto_19

    .end local p2    # "off":I
    .end local p4    # "pos":I
    .restart local v0    # "off":I
    .restart local v1    # "pos":I
    :cond_6c
    move p4, v1

    .end local v1    # "pos":I
    .restart local p4    # "pos":I
    move p2, v0

    .end local v0    # "off":I
    .restart local p2    # "off":I
    goto :goto_6
.end method

.method private match([C[C)Z
    .registers 4
    .param p1, "text"    # [C
    .param p2, "wild"    # [C

    .prologue
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    const/4 v0, 0x0

    .line 235
    invoke-direct {p0, p1, v0, p2, v0}, Lorg/simpleframework/xml/util/Resolver;->match([CI[CI)Z

    move-result v0

    return v0
.end method

.method private resolveAll(Ljava/lang/String;[C)Ljava/util/List;
    .registers 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "array"    # [C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[C)",
            "Ljava/util/List",
            "<TM;>;"
        }
    .end annotation

    .prologue
    .line 148
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<TM;>;"
    iget-object v4, p0, Lorg/simpleframework/xml/util/Resolver;->stack:Lorg/simpleframework/xml/util/Resolver$Stack;

    invoke-virtual {v4}, Lorg/simpleframework/xml/util/Resolver$Stack;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/simpleframework/xml/util/Match;

    .line 151
    .local v2, "match":Lorg/simpleframework/xml/util/Match;, "TM;"
    invoke-interface {v2}, Lorg/simpleframework/xml/util/Match;->getPattern()Ljava/lang/String;

    move-result-object v3

    .line 153
    .local v3, "wild":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    invoke-direct {p0, p2, v4}, Lorg/simpleframework/xml/util/Resolver;->match([C[C)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 154
    iget-object v4, p0, Lorg/simpleframework/xml/util/Resolver;->cache:Lorg/simpleframework/xml/util/Resolver$Cache;

    invoke-virtual {v4, p1, v1}, Lorg/simpleframework/xml/util/Resolver$Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 158
    .end local v2    # "match":Lorg/simpleframework/xml/util/Match;, "TM;"
    .end local v3    # "wild":Ljava/lang/String;
    :cond_2e
    return-object v1
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 62
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    check-cast p1, Lorg/simpleframework/xml/util/Match;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/simpleframework/xml/util/Resolver;->add(Lorg/simpleframework/xml/util/Match;)Z

    move-result v0

    return v0
.end method

.method public add(Lorg/simpleframework/xml/util/Match;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;)Z"
        }
    .end annotation

    .prologue
    .line 172
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    .local p1, "match":Lorg/simpleframework/xml/util/Match;, "TM;"
    iget-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->stack:Lorg/simpleframework/xml/util/Resolver$Stack;

    invoke-virtual {v0, p1}, Lorg/simpleframework/xml/util/Resolver$Stack;->push(Lorg/simpleframework/xml/util/Match;)V

    .line 173
    const/4 v0, 0x1

    return v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 221
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    iget-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->cache:Lorg/simpleframework/xml/util/Resolver$Cache;

    invoke-virtual {v0}, Lorg/simpleframework/xml/util/Resolver$Cache;->clear()V

    .line 222
    iget-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->stack:Lorg/simpleframework/xml/util/Resolver$Stack;

    invoke-virtual {v0}, Lorg/simpleframework/xml/util/Resolver$Stack;->clear()V

    .line 223
    return-void
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TM;>;"
        }
    .end annotation

    .prologue
    .line 185
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    iget-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->stack:Lorg/simpleframework/xml/util/Resolver$Stack;

    invoke-virtual {v0}, Lorg/simpleframework/xml/util/Resolver$Stack;->sequence()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lorg/simpleframework/xml/util/Match;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;)Z"
        }
    .end annotation

    .prologue
    .line 199
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    .local p1, "match":Lorg/simpleframework/xml/util/Match;, "TM;"
    iget-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->cache:Lorg/simpleframework/xml/util/Resolver$Cache;

    invoke-virtual {v0}, Lorg/simpleframework/xml/util/Resolver$Cache;->clear()V

    .line 200
    iget-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->stack:Lorg/simpleframework/xml/util/Resolver$Stack;

    invoke-virtual {v0, p1}, Lorg/simpleframework/xml/util/Resolver$Stack;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public resolve(Ljava/lang/String;)Lorg/simpleframework/xml/util/Match;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TM;"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    iget-object v1, p0, Lorg/simpleframework/xml/util/Resolver;->cache:Lorg/simpleframework/xml/util/Resolver$Cache;

    invoke-virtual {v1, p1}, Lorg/simpleframework/xml/util/Resolver$Cache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 101
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<TM;>;"
    if-nez v0, :cond_e

    .line 102
    invoke-virtual {p0, p1}, Lorg/simpleframework/xml/util/Resolver;->resolveAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 104
    :cond_e
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 105
    const/4 v1, 0x0

    .line 107
    :goto_15
    return-object v1

    :cond_16
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/util/Match;

    goto :goto_15
.end method

.method public resolveAll(Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TM;>;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    iget-object v2, p0, Lorg/simpleframework/xml/util/Resolver;->cache:Lorg/simpleframework/xml/util/Resolver$Cache;

    invoke-virtual {v2, p1}, Lorg/simpleframework/xml/util/Resolver$Cache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 124
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<TM;>;"
    if-eqz v1, :cond_b

    .line 132
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<TM;>;"
    :goto_a
    return-object v1

    .line 127
    .restart local v1    # "list":Ljava/util/List;, "Ljava/util/List<TM;>;"
    :cond_b
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 129
    .local v0, "array":[C
    if-nez v0, :cond_13

    .line 130
    const/4 v1, 0x0

    goto :goto_a

    .line 132
    :cond_13
    invoke-direct {p0, p1, v0}, Lorg/simpleframework/xml/util/Resolver;->resolveAll(Ljava/lang/String;[C)Ljava/util/List;

    move-result-object v1

    goto :goto_a
.end method

.method public size()I
    .registers 2

    .prologue
    .line 211
    .local p0, "this":Lorg/simpleframework/xml/util/Resolver;, "Lorg/simpleframework/xml/util/Resolver<TM;>;"
    iget-object v0, p0, Lorg/simpleframework/xml/util/Resolver;->stack:Lorg/simpleframework/xml/util/Resolver$Stack;

    invoke-virtual {v0}, Lorg/simpleframework/xml/util/Resolver$Stack;->size()I

    move-result v0

    return v0
.end method
