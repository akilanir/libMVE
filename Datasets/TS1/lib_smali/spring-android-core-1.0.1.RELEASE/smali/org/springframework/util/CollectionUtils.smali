.class public abstract Lorg/springframework/util/CollectionUtils;
.super Ljava/lang/Object;
.source "CollectionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/springframework/util/CollectionUtils$MultiValueMapAdapter;,
        Lorg/springframework/util/CollectionUtils$EnumerationIterator;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 379
    return-void
.end method

.method public static arrayToList(Ljava/lang/Object;)Ljava/util/List;
    .registers 2
    .param p0, "source"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 72
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->toObjectArray(Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static contains(Ljava/util/Enumeration;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Enumeration",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 141
    .local p0, "enumeration":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    if-eqz p0, :cond_14

    .line 142
    :cond_2
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 143
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    .line 144
    .local v0, "candidate":Ljava/lang/Object;
    invoke-static {v0, p1}, Lorg/springframework/util/ObjectUtils;->nullSafeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 145
    const/4 v1, 0x1

    .line 149
    .end local v0    # "candidate":Ljava/lang/Object;
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public static contains(Ljava/util/Iterator;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 123
    .local p0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    if-eqz p0, :cond_14

    .line 124
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 125
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 126
    .local v0, "candidate":Ljava/lang/Object;
    invoke-static {v0, p1}, Lorg/springframework/util/ObjectUtils;->nullSafeEquals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 127
    const/4 v1, 0x1

    .line 131
    .end local v0    # "candidate":Ljava/lang/Object;
    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public static containsAny(Ljava/util/Collection;Ljava/util/Collection;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "source":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    .local p1, "candidates":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v2, 0x0

    .line 179
    invoke-static {p0}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_d

    invoke-static {p1}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 187
    :cond_d
    :goto_d
    return v2

    .line 182
    :cond_e
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 183
    .local v0, "candidate":Ljava/lang/Object;
    invoke-interface {p0, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 184
    const/4 v2, 0x1

    goto :goto_d
.end method

.method public static containsInstance(Ljava/util/Collection;Ljava/lang/Object;)Z
    .registers 5
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 161
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    if-eqz p0, :cond_14

    .line 162
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 163
    .local v0, "candidate":Ljava/lang/Object;
    if-ne v0, p1, :cond_6

    .line 164
    const/4 v2, 0x1

    .line 168
    .end local v0    # "candidate":Ljava/lang/Object;
    .end local v1    # "i$":Ljava/util/Iterator;
    :goto_13
    return v2

    :cond_14
    const/4 v2, 0x0

    goto :goto_13
.end method

.method public static findCommonElementType(Ljava/util/Collection;)Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v3, 0x0

    .line 286
    invoke-static {p0}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_9

    move-object v0, v3

    .line 299
    :cond_8
    :goto_8
    return-object v0

    .line 289
    :cond_9
    const/4 v0, 0x0

    .line 290
    .local v0, "candidate":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 291
    .local v2, "val":Ljava/lang/Object;
    if-eqz v2, :cond_e

    .line 292
    if-nez v0, :cond_21

    .line 293
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_e

    .line 294
    :cond_21
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v0, v4, :cond_e

    move-object v0, v3

    .line 295
    goto :goto_8
.end method

.method public static findFirstMatch(Ljava/util/Collection;Ljava/util/Collection;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;",
            "Ljava/util/Collection",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p0, "source":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    .local p1, "candidates":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v2, 0x0

    .line 199
    invoke-static {p0}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_d

    invoke-static {p1}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_f

    :cond_d
    move-object v0, v2

    .line 207
    :goto_e
    return-object v0

    .line 202
    :cond_f
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 203
    .local v0, "candidate":Ljava/lang/Object;
    invoke-interface {p0, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    goto :goto_e

    .end local v0    # "candidate":Ljava/lang/Object;
    :cond_24
    move-object v0, v2

    .line 207
    goto :goto_e
.end method

.method public static findValueOfType(Ljava/util/Collection;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<*>;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v3, 0x0

    .line 219
    invoke-static {p0}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_9

    move-object v2, v3

    .line 232
    :cond_8
    :goto_8
    return-object v2

    .line 222
    :cond_9
    const/4 v2, 0x0

    .line 223
    .local v2, "value":Ljava/lang/Object;, "TT;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local v2    # "value":Ljava/lang/Object;, "TT;"
    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 224
    .local v0, "element":Ljava/lang/Object;
    if-eqz p1, :cond_20

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 225
    :cond_20
    if-eqz v2, :cond_24

    move-object v2, v3

    .line 227
    goto :goto_8

    .line 229
    :cond_24
    move-object v2, v0

    .restart local v2    # "value":Ljava/lang/Object;, "TT;"
    goto :goto_e
.end method

.method public static findValueOfType(Ljava/util/Collection;[Ljava/lang/Class;)Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    .local p1, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    .line 244
    invoke-static {p0}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v6

    if-nez v6, :cond_d

    invoke-static {p1}, Lorg/springframework/util/ObjectUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    :cond_d
    move-object v4, v5

    .line 253
    :cond_e
    :goto_e
    return-object v4

    .line 247
    :cond_f
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_12
    if-ge v1, v2, :cond_1f

    aget-object v3, v0, v1

    .line 248
    .local v3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, v3}, Lorg/springframework/util/CollectionUtils;->findValueOfType(Ljava/util/Collection;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    .line 249
    .local v4, "value":Ljava/lang/Object;
    if-nez v4, :cond_e

    .line 247
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "value":Ljava/lang/Object;
    :cond_1f
    move-object v4, v5

    .line 253
    goto :goto_e
.end method

.method public static hasUniqueObject(Ljava/util/Collection;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v4, 0x0

    .line 263
    invoke-static {p0}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 276
    :goto_7
    return v4

    .line 266
    :cond_8
    const/4 v2, 0x0

    .line 267
    .local v2, "hasCandidate":Z
    const/4 v0, 0x0

    .line 268
    .local v0, "candidate":Ljava/lang/Object;
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .end local v0    # "candidate":Ljava/lang/Object;
    .local v3, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_20

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 269
    .local v1, "elem":Ljava/lang/Object;
    if-nez v2, :cond_1d

    .line 270
    const/4 v2, 0x1

    .line 271
    move-object v0, v1

    .restart local v0    # "candidate":Ljava/lang/Object;
    goto :goto_e

    .line 272
    .end local v0    # "candidate":Ljava/lang/Object;
    :cond_1d
    if-eq v0, v1, :cond_e

    goto :goto_7

    .line 276
    .end local v1    # "elem":Ljava/lang/Object;
    :cond_20
    const/4 v4, 0x1

    goto :goto_7
.end method

.method public static isEmpty(Ljava/util/Collection;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isEmpty(Ljava/util/Map;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<**>;)Z"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<**>;"
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static mergeArrayIntoCollection(Ljava/lang/Object;Ljava/util/Collection;)V
    .registers 9
    .param p0, "array"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    if-nez p1, :cond_a

    .line 82
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Collection must not be null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 84
    :cond_a
    invoke-static {p0}, Lorg/springframework/util/ObjectUtils;->toObjectArray(Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 85
    .local v0, "arr":[Ljava/lang/Object;
    move-object v1, v0

    .local v1, "arr$":[Ljava/lang/Object;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_11
    if-ge v3, v4, :cond_1b

    aget-object v2, v1, v3

    .line 86
    .local v2, "elem":Ljava/lang/Object;
    invoke-interface {p1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 85
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 88
    .end local v2    # "elem":Ljava/lang/Object;
    :cond_1b
    return-void
.end method

.method public static mergePropertiesIntoMap(Ljava/util/Properties;Ljava/util/Map;)V
    .registers 7
    .param p0, "props"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Properties;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez p1, :cond_a

    .line 100
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Map must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 102
    :cond_a
    if-eqz p0, :cond_2a

    .line 103
    invoke-virtual {p0}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    :goto_10
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 104
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 105
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 106
    .local v2, "value":Ljava/lang/String;
    if-nez v2, :cond_26

    .line 108
    invoke-virtual {p0, v1}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 110
    .end local v2    # "value":Ljava/lang/String;
    :cond_26
    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    .line 113
    .end local v0    # "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<*>;"
    .end local v1    # "key":Ljava/lang/String;
    :cond_2a
    return-void
.end method

.method public static toArray(Ljava/util/Enumeration;[Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "E:TA;>(",
            "Ljava/util/Enumeration",
            "<TE;>;[TA;)[TA;"
        }
    .end annotation

    .prologue
    .line 307
    .local p0, "enumeration":Ljava/util/Enumeration;, "Ljava/util/Enumeration<TE;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TA;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 308
    .local v0, "elements":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TA;>;"
    :goto_5
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 309
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 311
    :cond_13
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static toIterator(Ljava/util/Enumeration;)Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Enumeration",
            "<TE;>;)",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 320
    .local p0, "enumeration":Ljava/util/Enumeration;, "Ljava/util/Enumeration<TE;>;"
    new-instance v0, Lorg/springframework/util/CollectionUtils$EnumerationIterator;

    invoke-direct {v0, p0}, Lorg/springframework/util/CollectionUtils$EnumerationIterator;-><init>(Ljava/util/Enumeration;)V

    return-object v0
.end method

.method public static toMultiValueMap(Ljava/util/Map;)Lorg/springframework/util/MultiValueMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/List",
            "<TV;>;>;)",
            "Lorg/springframework/util/MultiValueMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 330
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<TK;Ljava/util/List<TV;>;>;"
    new-instance v0, Lorg/springframework/util/CollectionUtils$MultiValueMapAdapter;

    invoke-direct {v0, p0}, Lorg/springframework/util/CollectionUtils$MultiValueMapAdapter;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public static unmodifiableMultiValueMap(Lorg/springframework/util/MultiValueMap;)Lorg/springframework/util/MultiValueMap;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/springframework/util/MultiValueMap",
            "<+TK;+TV;>;)",
            "Lorg/springframework/util/MultiValueMap",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 341
    .local p0, "map":Lorg/springframework/util/MultiValueMap;, "Lorg/springframework/util/MultiValueMap<+TK;+TV;>;"
    const-string v5, "\'map\' must not be null"

    invoke-static {p0, v5}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 342
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-interface {p0}, Lorg/springframework/util/MultiValueMap;->size()I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 343
    .local v2, "result":Ljava/util/Map;, "Ljava/util/Map<TK;Ljava/util/List<TV;>;>;"
    invoke-interface {p0}, Lorg/springframework/util/MultiValueMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 344
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+Ljava/util/List<+TV;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-static {v5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 345
    .local v4, "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    .line 347
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+Ljava/util/List<+TV;>;>;"
    .end local v4    # "values":Ljava/util/List;, "Ljava/util/List<TV;>;"
    :cond_34
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    .line 348
    .local v3, "unmodifiableMap":Ljava/util/Map;, "Ljava/util/Map<TK;Ljava/util/List<TV;>;>;"
    invoke-static {v3}, Lorg/springframework/util/CollectionUtils;->toMultiValueMap(Ljava/util/Map;)Lorg/springframework/util/MultiValueMap;

    move-result-object v5

    return-object v5
.end method
