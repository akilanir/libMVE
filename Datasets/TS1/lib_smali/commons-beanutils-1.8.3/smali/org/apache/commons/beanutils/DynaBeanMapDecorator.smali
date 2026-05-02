.class public Lorg/apache/commons/beanutils/DynaBeanMapDecorator;
.super Ljava/lang/Object;
.source "DynaBeanMapDecorator.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;
    }
.end annotation


# instance fields
.field private dynaBean:Lorg/apache/commons/beanutils/DynaBean;

.field private transient keySet:Ljava/util/Set;

.field private readOnly:Z


# direct methods
.method public constructor <init>(Lorg/apache/commons/beanutils/DynaBean;)V
    .registers 3
    .param p1, "dynaBean"    # Lorg/apache/commons/beanutils/DynaBean;

    .prologue
    .line 89
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;-><init>(Lorg/apache/commons/beanutils/DynaBean;Z)V

    .line 90
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/beanutils/DynaBean;Z)V
    .registers 5
    .param p1, "dynaBean"    # Lorg/apache/commons/beanutils/DynaBean;
    .param p2, "readOnly"    # Z

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    if-nez p1, :cond_d

    .line 102
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DynaBean is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_d
    iput-object p1, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->dynaBean:Lorg/apache/commons/beanutils/DynaBean;

    .line 105
    iput-boolean p2, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->readOnly:Z

    .line 106
    return-void
.end method

.method private getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;
    .registers 2

    .prologue
    .line 347
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    return-object v0
.end method

.method private toString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 358
    if-nez p1, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 130
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v0

    .line 143
    .local v0, "dynaClass":Lorg/apache/commons/beanutils/DynaClass;
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    .line 144
    .local v1, "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v1, :cond_14

    const/4 v2, 0x0

    :goto_13
    return v2

    :cond_14
    const/4 v2, 0x1

    goto :goto_13
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    .line 157
    invoke-direct {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v3

    .line 158
    .local v3, "properties":[Lorg/apache/commons/beanutils/DynaProperty;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v5, v3

    if-ge v0, v5, :cond_25

    .line 159
    aget-object v5, v3, v0

    invoke-virtual {v5}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v1

    .line 160
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v5

    invoke-interface {v5, v1}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 161
    .local v2, "prop":Ljava/lang/Object;
    if-nez p1, :cond_1c

    .line 162
    if-nez v2, :cond_22

    .line 171
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "prop":Ljava/lang/Object;
    :cond_1b
    :goto_1b
    return v4

    .line 166
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v2    # "prop":Ljava/lang/Object;
    :cond_1c
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1b

    .line 158
    :cond_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 171
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "prop":Ljava/lang/Object;
    :cond_25
    const/4 v4, 0x0

    goto :goto_1b
.end method

.method public entrySet()Ljava/util/Set;
    .registers 7

    .prologue
    .line 185
    invoke-direct {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v2

    .line 186
    .local v2, "properties":[Lorg/apache/commons/beanutils/DynaProperty;
    new-instance v3, Ljava/util/HashSet;

    array-length v5, v2

    invoke-direct {v3, v5}, Ljava/util/HashSet;-><init>(I)V

    .line 187
    .local v3, "set":Ljava/util/Set;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    array-length v5, v2

    if-ge v0, v5, :cond_27

    .line 188
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v5

    invoke-interface {v5, v1}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 190
    .local v4, "value":Ljava/lang/Object;
    new-instance v5, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;

    invoke-direct {v5, v1, v4}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 187
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 192
    .end local v1    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_27
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    return-object v5
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 203
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getDynaBean()Lorg/apache/commons/beanutils/DynaBean;
    .registers 2

    .prologue
    .line 335
    iget-object v0, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->dynaBean:Lorg/apache/commons/beanutils/DynaBean;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 214
    invoke-direct {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isReadOnly()Z
    .registers 2

    .prologue
    .line 119
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->readOnly:Z

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 6

    .prologue
    .line 229
    iget-object v4, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->keySet:Ljava/util/Set;

    if-eqz v4, :cond_7

    .line 230
    iget-object v3, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->keySet:Ljava/util/Set;

    .line 247
    :cond_6
    :goto_6
    return-object v3

    .line 234
    :cond_7
    invoke-direct {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v2

    .line 235
    .local v2, "properties":[Lorg/apache/commons/beanutils/DynaProperty;
    new-instance v3, Ljava/util/HashSet;

    array-length v4, v2

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 236
    .local v3, "set":Ljava/util/Set;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    array-length v4, v2

    if-ge v1, v4, :cond_21

    .line 237
    aget-object v4, v2, v1

    invoke-virtual {v4}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 236
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 239
    :cond_21
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    .line 242
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v0

    .line 243
    .local v0, "dynaClass":Lorg/apache/commons/beanutils/DynaClass;
    instance-of v4, v0, Lorg/apache/commons/beanutils/MutableDynaClass;

    if-nez v4, :cond_6

    .line 244
    iput-object v3, p0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->keySet:Ljava/util/Set;

    goto :goto_6
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 262
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->isReadOnly()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 263
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    const-string v3, "Map is read only"

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 265
    :cond_e
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 266
    .local v1, "property":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 267
    .local v0, "previous":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v2

    invoke-interface {v2, v1, p2}, Lorg/apache/commons/beanutils/DynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 268
    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 6
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 279
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->isReadOnly()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 280
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    const-string v3, "Map is read only"

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 282
    :cond_e
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 283
    .local v1, "keys":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    .line 284
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 285
    .local v0, "key":Ljava/lang/Object;
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    .line 287
    .end local v0    # "key":Ljava/lang/Object;
    :cond_28
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 297
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 306
    invoke-direct {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 7

    .prologue
    .line 316
    invoke-direct {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v2

    .line 317
    .local v2, "properties":[Lorg/apache/commons/beanutils/DynaProperty;
    new-instance v4, Ljava/util/ArrayList;

    array-length v5, v2

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 318
    .local v4, "values":Ljava/util/List;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    array-length v5, v2

    if-ge v0, v5, :cond_22

    .line 319
    aget-object v5, v2, v0

    invoke-virtual {v5}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v1

    .line 320
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;->getDynaBean()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v5

    invoke-interface {v5, v1}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 321
    .local v3, "value":Ljava/lang/Object;
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 323
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    :cond_22
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    return-object v5
.end method
