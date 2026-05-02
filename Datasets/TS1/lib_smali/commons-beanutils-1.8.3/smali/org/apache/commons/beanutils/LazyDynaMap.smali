.class public Lorg/apache/commons/beanutils/LazyDynaMap;
.super Lorg/apache/commons/beanutils/LazyDynaBean;
.source "LazyDynaMap.java"

# interfaces
.implements Lorg/apache/commons/beanutils/MutableDynaClass;


# instance fields
.field protected name:Ljava/lang/String;

.field protected restricted:Z

.field protected returnNull:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 77
    move-object v0, v1

    check-cast v0, Ljava/util/Map;

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Map;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "values"    # Ljava/util/Map;

    .prologue
    .line 104
    invoke-direct {p0}, Lorg/apache/commons/beanutils/LazyDynaBean;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->returnNull:Z

    .line 105
    if-nez p1, :cond_a

    const-string p1, "LazyDynaMap"

    .end local p1    # "name":Ljava/lang/String;
    :cond_a
    iput-object p1, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->name:Ljava/lang/String;

    .line 106
    if-nez p2, :cond_12

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaMap;->newMap()Ljava/util/Map;

    move-result-object p2

    .end local p2    # "values":Ljava/util/Map;
    :cond_12
    iput-object p2, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    .line 107
    iput-object p0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Lorg/apache/commons/beanutils/DynaProperty;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "properties"    # [Lorg/apache/commons/beanutils/DynaProperty;

    .prologue
    .line 126
    const/4 v1, 0x0

    check-cast v1, Ljava/util/Map;

    invoke-direct {p0, p1, v1}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 127
    if-eqz p2, :cond_14

    .line 128
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v1, p2

    if-ge v0, v1, :cond_14

    .line 129
    aget-object v1, p2, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaMap;->add(Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 128
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 132
    .end local v0    # "i":I
    :cond_14
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 3
    .param p1, "values"    # Ljava/util/Map;

    .prologue
    .line 95
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/beanutils/DynaClass;)V
    .registers 4
    .param p1, "dynaClass"    # Lorg/apache/commons/beanutils/DynaClass;

    .prologue
    .line 140
    invoke-interface {p1}, Lorg/apache/commons/beanutils/DynaClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/lang/String;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 141
    return-void
.end method

.method public constructor <init>([Lorg/apache/commons/beanutils/DynaProperty;)V
    .registers 3
    .param p1, "properties"    # [Lorg/apache/commons/beanutils/DynaProperty;

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/lang/String;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 117
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 326
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/beanutils/LazyDynaMap;->add(Ljava/lang/String;Ljava/lang/Class;)V

    .line 327
    return-void
.end method

.method public add(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 343
    if-nez p1, :cond_a

    .line 344
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Property name is missing."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 347
    :cond_a
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaMap;->isRestricted()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 348
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "DynaClass is currently restricted. No new properties can be added."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 351
    :cond_18
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 354
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_28

    .line 355
    iget-object v2, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    if-nez p2, :cond_29

    const/4 v1, 0x0

    :goto_25
    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    :cond_28
    return-void

    .line 355
    :cond_29
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/LazyDynaMap;->createProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_25
.end method

.method public add(Ljava/lang/String;Ljava/lang/Class;ZZ)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;
    .param p3, "readable"    # Z
    .param p4, "writeable"    # Z

    .prologue
    .line 382
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "readable/writable properties not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected add(Lorg/apache/commons/beanutils/DynaProperty;)V
    .registers 4
    .param p1, "property"    # Lorg/apache/commons/beanutils/DynaProperty;

    .prologue
    .line 393
    invoke-virtual {p1}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/beanutils/LazyDynaMap;->add(Ljava/lang/String;Ljava/lang/Class;)V

    .line 394
    return-void
.end method

.method public getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;
    .registers 9

    .prologue
    .line 251
    const/4 v0, 0x0

    .line 252
    .local v0, "i":I
    iget-object v6, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v6

    new-array v4, v6, [Lorg/apache/commons/beanutils/DynaProperty;

    .line 253
    .local v4, "properties":[Lorg/apache/commons/beanutils/DynaProperty;
    iget-object v6, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 255
    .local v2, "iterator":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_38

    .line 256
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 257
    .local v3, "name":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 258
    .local v5, "value":Ljava/lang/Object;
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    new-instance v7, Lorg/apache/commons/beanutils/DynaProperty;

    if-nez v5, :cond_33

    const/4 v6, 0x0

    :goto_2c
    invoke-direct {v7, v3, v6}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    aput-object v7, v4, v0

    move v0, v1

    .line 259
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_13

    .line 258
    .end local v0    # "i":I
    .restart local v1    # "i":I
    :cond_33
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    goto :goto_2c

    .line 261
    .end local v1    # "i":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/Object;
    .restart local v0    # "i":I
    :cond_38
    return-object v4
.end method

.method public getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 219
    if-nez p1, :cond_a

    .line 220
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Property name is missing."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 225
    :cond_a
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaMap;->isReturnNull()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 226
    const/4 v1, 0x0

    .line 234
    :goto_19
    return-object v1

    .line 229
    :cond_1a
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 231
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_28

    .line 232
    new-instance v1, Lorg/apache/commons/beanutils/DynaProperty;

    invoke-direct {v1, p1}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;)V

    goto :goto_19

    .line 234
    :cond_28
    new-instance v1, Lorg/apache/commons/beanutils/DynaProperty;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    goto :goto_19
.end method

.method public getMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 160
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected isDynaProperty(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 473
    if-nez p1, :cond_a

    .line 474
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Property name is missing."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 477
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isRestricted()Z
    .registers 2

    .prologue
    .line 303
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->restricted:Z

    return v0
.end method

.method public isReturnNull()Z
    .registers 2

    .prologue
    .line 439
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->returnNull:Z

    return v0
.end method

.method public newInstance()Lorg/apache/commons/beanutils/DynaBean;
    .registers 7

    .prologue
    .line 273
    const/4 v3, 0x0

    .line 275
    .local v3, "newMap":Ljava/util/Map;
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaMap;->getMap()Ljava/util/Map;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "newMap":Ljava/util/Map;
    check-cast v3, Ljava/util/Map;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_f} :catch_26

    .line 281
    .restart local v3    # "newMap":Ljava/util/Map;
    :goto_f
    new-instance v2, Lorg/apache/commons/beanutils/LazyDynaMap;

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/util/Map;)V

    .line 282
    .local v2, "lazyMap":Lorg/apache/commons/beanutils/LazyDynaMap;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaMap;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v4

    .line 283
    .local v4, "properties":[Lorg/apache/commons/beanutils/DynaProperty;
    if-eqz v4, :cond_2c

    .line 284
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    array-length v5, v4

    if-ge v1, v5, :cond_2c

    .line 285
    aget-object v5, v4, v1

    invoke-virtual {v2, v5}, Lorg/apache/commons/beanutils/LazyDynaMap;->add(Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 284
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 276
    .end local v1    # "i":I
    .end local v2    # "lazyMap":Lorg/apache/commons/beanutils/LazyDynaMap;
    .end local v3    # "newMap":Ljava/util/Map;
    .end local v4    # "properties":[Lorg/apache/commons/beanutils/DynaProperty;
    :catch_26
    move-exception v0

    .line 277
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaMap;->newMap()Ljava/util/Map;

    move-result-object v3

    .restart local v3    # "newMap":Ljava/util/Map;
    goto :goto_f

    .line 288
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v2    # "lazyMap":Lorg/apache/commons/beanutils/LazyDynaMap;
    .restart local v4    # "properties":[Lorg/apache/commons/beanutils/DynaProperty;
    :cond_2c
    return-object v2
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 411
    if-nez p1, :cond_a

    .line 412
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Property name is missing."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 415
    :cond_a
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaMap;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 416
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "DynaClass is currently restricted. No properties can be removed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 420
    :cond_18
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 421
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    :cond_25
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 173
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaMap;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 174
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid property name \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' (DynaClass is restricted)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 178
    :cond_2d
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    return-void
.end method

.method public setMap(Ljava/util/Map;)V
    .registers 2
    .param p1, "values"    # Ljava/util/Map;

    .prologue
    .line 151
    iput-object p1, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->values:Ljava/util/Map;

    .line 152
    return-void
.end method

.method public setRestricted(Z)V
    .registers 2
    .param p1, "restricted"    # Z

    .prologue
    .line 314
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->restricted:Z

    .line 315
    return-void
.end method

.method public setReturnNull(Z)V
    .registers 2
    .param p1, "returnNull"    # Z

    .prologue
    .line 452
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/LazyDynaMap;->returnNull:Z

    .line 453
    return-void
.end method
