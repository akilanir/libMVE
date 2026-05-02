.class public Lfreemarker/template/SimpleHash;
.super Lfreemarker/template/WrappingTemplateModel;
.source "SimpleHash.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/SimpleHash$1;,
        Lfreemarker/template/SimpleHash$SynchronizedHash;
    }
.end annotation


# instance fields
.field private map:Ljava/util/Map;

.field private putFailed:Z

.field private unwrappedMap:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 91
    const/4 v0, 0x0

    check-cast v0, Lfreemarker/template/ObjectWrapper;

    invoke-direct {p0, v0}, Lfreemarker/template/SimpleHash;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Lfreemarker/template/ObjectWrapper;)V
    .registers 3
    .param p1, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 115
    invoke-direct {p0, p1}, Lfreemarker/template/WrappingTemplateModel;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 116
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    .line 117
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 3
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 104
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfreemarker/template/SimpleHash;-><init>(Ljava/util/Map;Lfreemarker/template/ObjectWrapper;)V

    .line 105
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Lfreemarker/template/ObjectWrapper;)V
    .registers 6
    .param p1, "map"    # Ljava/util/Map;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 133
    invoke-direct {p0, p2}, Lfreemarker/template/WrappingTemplateModel;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 135
    :try_start_3
    invoke-virtual {p0, p1}, Lfreemarker/template/SimpleHash;->copyMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;
    :try_end_9
    .catch Ljava/util/ConcurrentModificationException; {:try_start_3 .. :try_end_9} :catch_a

    .line 150
    :goto_9
    return-void

    .line 136
    :catch_a
    move-exception v0

    .line 143
    .local v0, "cme":Ljava/util/ConcurrentModificationException;
    const-wide/16 v1, 0x5

    :try_start_d
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_10
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_10} :catch_1c

    .line 146
    :goto_10
    monitor-enter p1

    .line 147
    :try_start_11
    invoke-virtual {p0, p1}, Lfreemarker/template/SimpleHash;->copyMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    .line 148
    monitor-exit p1

    goto :goto_9

    :catchall_19
    move-exception v1

    monitor-exit p1
    :try_end_1b
    .catchall {:try_start_11 .. :try_end_1b} :catchall_19

    throw v1

    .line 144
    :catch_1c
    move-exception v1

    goto :goto_10
.end method


# virtual methods
.method public containsKey(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 240
    iget-object v0, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected copyMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 3
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 153
    instance-of v0, p1, Ljava/util/HashMap;

    if-eqz v0, :cond_d

    .line 154
    check-cast p1, Ljava/util/HashMap;

    .end local p1    # "map":Ljava/util/Map;
    invoke-virtual {p1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 164
    :goto_c
    return-object v0

    .line 156
    .restart local p1    # "map":Ljava/util/Map;
    :cond_d
    instance-of v0, p1, Ljava/util/SortedMap;

    if-eqz v0, :cond_26

    .line 157
    instance-of v0, p1, Ljava/util/TreeMap;

    if-eqz v0, :cond_1e

    .line 158
    check-cast p1, Ljava/util/TreeMap;

    .end local p1    # "map":Ljava/util/Map;
    invoke-virtual {p1}, Ljava/util/TreeMap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    goto :goto_c

    .line 161
    .restart local p1    # "map":Ljava/util/Map;
    :cond_1e
    new-instance v0, Ljava/util/TreeMap;

    check-cast p1, Ljava/util/SortedMap;

    .end local p1    # "map":Ljava/util/Map;
    invoke-direct {v0, p1}, Ljava/util/TreeMap;-><init>(Ljava/util/SortedMap;)V

    goto :goto_c

    .line 164
    .restart local p1    # "map":Ljava/util/Map;
    :cond_26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    goto :goto_c
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 10
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x1

    .line 191
    iget-object v6, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 198
    .local v3, "result":Ljava/lang/Object;
    if-nez v3, :cond_46

    .line 199
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v6, v7, :cond_3c

    .line 201
    new-instance v0, Ljava/lang/Character;

    const/4 v6, 0x0

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-direct {v0, v6}, Ljava/lang/Character;-><init>(C)V

    .line 202
    .local v0, "charKey":Ljava/lang/Character;
    iget-object v6, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 203
    if-nez v3, :cond_33

    iget-object v6, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_33

    iget-object v6, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_33

    .line 232
    .end local v0    # "charKey":Ljava/lang/Character;
    :cond_32
    :goto_32
    return-object v5

    .line 207
    .restart local v0    # "charKey":Ljava/lang/Character;
    :cond_33
    move-object v2, v0

    .line 220
    .end local v0    # "charKey":Ljava/lang/Character;
    :goto_34
    instance-of v5, v3, Lfreemarker/template/TemplateModel;

    if-eqz v5, :cond_48

    move-object v5, v3

    .line 221
    check-cast v5, Lfreemarker/template/TemplateModel;

    goto :goto_32

    .line 210
    :cond_3c
    iget-object v6, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 214
    move-object v2, p1

    .local v2, "putKey":Ljava/lang/String;
    goto :goto_34

    .line 218
    .end local v2    # "putKey":Ljava/lang/String;
    :cond_46
    move-object v2, p1

    .restart local v2    # "putKey":Ljava/lang/String;
    goto :goto_34

    .line 223
    .end local v2    # "putKey":Ljava/lang/String;
    :cond_48
    invoke-virtual {p0, v3}, Lfreemarker/template/SimpleHash;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 224
    .local v4, "tm":Lfreemarker/template/TemplateModel;
    iget-boolean v5, p0, Lfreemarker/template/SimpleHash;->putFailed:Z

    if-nez v5, :cond_55

    .line 226
    :try_start_50
    iget-object v5, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v5, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_55} :catch_57

    :cond_55
    :goto_55
    move-object v5, v4

    .line 232
    goto :goto_32

    .line 227
    :catch_57
    move-exception v1

    .line 229
    .local v1, "e":Ljava/lang/Exception;
    iput-boolean v7, p0, Lfreemarker/template/SimpleHash;->putFailed:Z

    goto :goto_55
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 4

    .prologue
    .line 314
    new-instance v0, Lfreemarker/template/SimpleCollection;

    iget-object v1, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p0}, Lfreemarker/template/SimpleHash;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 175
    iget-object v0, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/template/SimpleHash;->unwrappedMap:Ljava/util/Map;

    .line 177
    return-void
.end method

.method public put(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "b"    # Z

    .prologue
    .line 187
    if-eqz p2, :cond_8

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_4
    invoke-virtual {p0, p1, v0}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 188
    return-void

    .line 187
    :cond_8
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_4
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 6
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 258
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 259
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 260
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_8

    .line 262
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_22
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 249
    iget-object v0, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 306
    iget-object v0, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public synchronizedWrapper()Lfreemarker/template/SimpleHash;
    .registers 3

    .prologue
    .line 322
    new-instance v0, Lfreemarker/template/SimpleHash$SynchronizedHash;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfreemarker/template/SimpleHash$SynchronizedHash;-><init>(Lfreemarker/template/SimpleHash;Lfreemarker/template/SimpleHash$1;)V

    return-object v0
.end method

.method public toMap()Ljava/util/Map;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 272
    iget-object v8, p0, Lfreemarker/template/SimpleHash;->unwrappedMap:Ljava/util/Map;

    if-nez v8, :cond_6f

    .line 273
    iget-object v8, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    .line 274
    .local v6, "mapClass":Ljava/lang/Class;
    const/4 v5, 0x0

    .line 276
    .local v5, "m":Ljava/util/Map;
    :try_start_b
    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "m":Ljava/util/Map;
    check-cast v5, Ljava/util/Map;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_11} :catch_41

    .line 282
    .restart local v5    # "m":Ljava/util/Map;
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v0

    .line 283
    .local v0, "bw":Lfreemarker/ext/beans/BeansWrapper;
    iget-object v8, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :goto_1f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6d

    .line 284
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 285
    .local v2, "entry":Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 286
    .local v4, "key":Ljava/lang/Object;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    .line 287
    .local v7, "value":Ljava/lang/Object;
    instance-of v8, v7, Lfreemarker/template/TemplateModel;

    if-eqz v8, :cond_3d

    .line 288
    check-cast v7, Lfreemarker/template/TemplateModel;

    .end local v7    # "value":Ljava/lang/Object;
    invoke-virtual {v0, v7}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v7

    .line 290
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_3d
    invoke-interface {v5, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 277
    .end local v0    # "bw":Lfreemarker/ext/beans/BeansWrapper;
    .end local v2    # "entry":Ljava/util/Map$Entry;
    .end local v3    # "it":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/Object;
    .end local v5    # "m":Ljava/util/Map;
    .end local v7    # "value":Ljava/lang/Object;
    :catch_41
    move-exception v1

    .line 278
    .local v1, "e":Ljava/lang/Exception;
    new-instance v8, Lfreemarker/template/TemplateModelException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Error instantiating map of type "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 292
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "bw":Lfreemarker/ext/beans/BeansWrapper;
    .restart local v3    # "it":Ljava/util/Iterator;
    .restart local v5    # "m":Ljava/util/Map;
    :cond_6d
    iput-object v5, p0, Lfreemarker/template/SimpleHash;->unwrappedMap:Ljava/util/Map;

    .line 294
    .end local v0    # "bw":Lfreemarker/ext/beans/BeansWrapper;
    .end local v3    # "it":Ljava/util/Iterator;
    .end local v5    # "m":Ljava/util/Map;
    .end local v6    # "mapClass":Ljava/lang/Class;
    :cond_6f
    iget-object v8, p0, Lfreemarker/template/SimpleHash;->unwrappedMap:Ljava/util/Map;

    return-object v8
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 302
    iget-object v0, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 4

    .prologue
    .line 318
    new-instance v0, Lfreemarker/template/SimpleCollection;

    iget-object v1, p0, Lfreemarker/template/SimpleHash;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {p0}, Lfreemarker/template/SimpleHash;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    return-object v0
.end method
