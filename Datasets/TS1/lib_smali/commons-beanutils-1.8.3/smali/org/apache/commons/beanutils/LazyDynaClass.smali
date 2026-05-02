.class public Lorg/apache/commons/beanutils/LazyDynaClass;
.super Lorg/apache/commons/beanutils/BasicDynaClass;
.source "LazyDynaClass.java"

# interfaces
.implements Lorg/apache/commons/beanutils/MutableDynaClass;


# static fields
.field static class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;


# instance fields
.field protected restricted:Z

.field protected returnNull:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 64
    move-object v0, v1

    check-cast v0, [Lorg/apache/commons/beanutils/DynaProperty;

    invoke-direct {p0, v1, v0}, Lorg/apache/commons/beanutils/LazyDynaClass;-><init>(Ljava/lang/String;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 73
    const/4 v0, 0x0

    check-cast v0, [Lorg/apache/commons/beanutils/DynaProperty;

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/LazyDynaClass;-><init>(Ljava/lang/String;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "dynaBeanClass"    # Ljava/lang/Class;

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/LazyDynaClass;-><init>(Ljava/lang/String;Ljava/lang/Class;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;[Lorg/apache/commons/beanutils/DynaProperty;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "dynaBeanClass"    # Ljava/lang/Class;
    .param p3, "properties"    # [Lorg/apache/commons/beanutils/DynaProperty;

    .prologue
    .line 104
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/BasicDynaClass;-><init>(Ljava/lang/String;Ljava/lang/Class;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->returnNull:Z

    .line 105
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Lorg/apache/commons/beanutils/DynaProperty;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "properties"    # [Lorg/apache/commons/beanutils/DynaProperty;

    .prologue
    .line 93
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaClass;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    if-nez v0, :cond_10

    const-string v0, "org.apache.commons.beanutils.LazyDynaBean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaClass;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    :goto_c
    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/LazyDynaClass;-><init>(Ljava/lang/String;Ljava/lang/Class;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 94
    return-void

    .line 93
    :cond_10
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaClass;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    goto :goto_c
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 93
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 165
    new-instance v0, Lorg/apache/commons/beanutils/DynaProperty;

    invoke-direct {v0, p1}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/LazyDynaClass;->add(Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 166
    return-void
.end method

.method public add(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 181
    if-nez p2, :cond_6

    .line 182
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaClass;->add(Ljava/lang/String;)V

    .line 186
    :goto_5
    return-void

    .line 184
    :cond_6
    new-instance v0, Lorg/apache/commons/beanutils/DynaProperty;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/LazyDynaClass;->add(Lorg/apache/commons/beanutils/DynaProperty;)V

    goto :goto_5
.end method

.method public add(Ljava/lang/String;Ljava/lang/Class;ZZ)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;
    .param p3, "readable"    # Z
    .param p4, "writeable"    # Z

    .prologue
    .line 210
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "readable/writable properties not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected add(Lorg/apache/commons/beanutils/DynaProperty;)V
    .registers 7
    .param p1, "property"    # Lorg/apache/commons/beanutils/DynaProperty;

    .prologue
    const/4 v4, 0x0

    .line 224
    invoke-virtual {p1}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_f

    .line 225
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Property name is missing."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 228
    :cond_f
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaClass;->isRestricted()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 229
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "DynaClass is currently restricted. No new properties can be added."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 233
    :cond_1d
    iget-object v2, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->propertiesMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2a

    .line 246
    :goto_29
    return-void

    .line 238
    :cond_2a
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    .line 239
    .local v1, "oldProperties":[Lorg/apache/commons/beanutils/DynaProperty;
    array-length v2, v1

    add-int/lit8 v2, v2, 0x1

    new-array v0, v2, [Lorg/apache/commons/beanutils/DynaProperty;

    .line 240
    .local v0, "newProperties":[Lorg/apache/commons/beanutils/DynaProperty;
    array-length v2, v1

    invoke-static {v1, v4, v0, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 241
    array-length v2, v1

    aput-object p1, v0, v2

    .line 244
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/LazyDynaClass;->setProperties([Lorg/apache/commons/beanutils/DynaProperty;)V

    goto :goto_29
.end method

.method public getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 318
    if-nez p1, :cond_a

    .line 319
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Property name is missing."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 322
    :cond_a
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->propertiesMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/DynaProperty;

    .line 326
    .local v0, "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_25

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaClass;->isReturnNull()Z

    move-result v1

    if-nez v1, :cond_25

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaClass;->isRestricted()Z

    move-result v1

    if-nez v1, :cond_25

    .line 327
    new-instance v0, Lorg/apache/commons/beanutils/DynaProperty;

    .end local v0    # "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    invoke-direct {v0, p1}, Lorg/apache/commons/beanutils/DynaProperty;-><init>(Ljava/lang/String;)V

    .line 330
    .restart local v0    # "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_25
    return-object v0
.end method

.method public isDynaProperty(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 349
    if-nez p1, :cond_a

    .line 350
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Property name is missing."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 353
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->propertiesMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_14

    const/4 v0, 0x0

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x1

    goto :goto_13
.end method

.method public isRestricted()Z
    .registers 2

    .prologue
    .line 115
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->restricted:Z

    return v0
.end method

.method public isReturnNull()Z
    .registers 2

    .prologue
    .line 139
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->returnNull:Z

    return v0
.end method

.method public remove(Ljava/lang/String;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 263
    if-nez p1, :cond_a

    .line 264
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Property name is missing."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 267
    :cond_a
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaClass;->isRestricted()Z

    move-result v4

    if-eqz v4, :cond_18

    .line 268
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "DynaClass is currently restricted. No properties can be removed."

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 272
    :cond_18
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->propertiesMap:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_21

    .line 291
    :goto_20
    return-void

    .line 278
    :cond_21
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v3

    .line 279
    .local v3, "oldProperties":[Lorg/apache/commons/beanutils/DynaProperty;
    array-length v4, v3

    add-int/lit8 v4, v4, -0x1

    new-array v2, v4, [Lorg/apache/commons/beanutils/DynaProperty;

    .line 280
    .local v2, "newProperties":[Lorg/apache/commons/beanutils/DynaProperty;
    const/4 v1, 0x0

    .line 281
    .local v1, "j":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2c
    array-length v4, v3

    if-ge v0, v4, :cond_44

    .line 282
    aget-object v4, v3, v0

    invoke-virtual {v4}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_41

    .line 283
    aget-object v4, v3, v0

    aput-object v4, v2, v1

    .line 284
    add-int/lit8 v1, v1, 0x1

    .line 281
    :cond_41
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 289
    :cond_44
    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaClass;->setProperties([Lorg/apache/commons/beanutils/DynaProperty;)V

    goto :goto_20
.end method

.method public setRestricted(Z)V
    .registers 2
    .param p1, "restricted"    # Z

    .prologue
    .line 126
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->restricted:Z

    .line 127
    return-void
.end method

.method public setReturnNull(Z)V
    .registers 2
    .param p1, "returnNull"    # Z

    .prologue
    .line 151
    iput-boolean p1, p0, Lorg/apache/commons/beanutils/LazyDynaClass;->returnNull:Z

    .line 152
    return-void
.end method
