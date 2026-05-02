.class public Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;
.super Ljava/lang/Object;
.source "ConverterRegistry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;,
        Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;
    }
.end annotation


# instance fields
.field private mCupboard:Lnl/qbusict/cupboard/Cupboard;

.field private mEntityConverterCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final mEntityConverterCalls:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private mEntityConverterFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/EntityConverterFactory;",
            ">;"
        }
    .end annotation
.end field

.field private mFieldConverterCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final mFieldConverterCalls:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Type;",
            "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private mFieldConverterFactories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/qbusict/cupboard/convert/FieldConverterFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lnl/qbusict/cupboard/Cupboard;)V
    .registers 5
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;

    .prologue
    const/16 v2, 0x80

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterFactories:Ljava/util/List;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterFactories:Ljava/util/List;

    .line 46
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCalls:Ljava/lang/ThreadLocal;

    .line 47
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    iput-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCalls:Ljava/lang/ThreadLocal;

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCache:Ljava/util/Map;

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCache:Ljava/util/Map;

    .line 53
    iput-object p1, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    .line 54
    invoke-direct {p0}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->addDefaultEntityConverterFactories()V

    .line 55
    invoke-direct {p0}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->addDefaultFieldConverterFactories()V

    .line 56
    return-void
.end method

.method private addDefaultEntityConverterFactories()V
    .registers 3

    .prologue
    .line 160
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterFactories:Ljava/util/List;

    new-instance v1, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;

    invoke-direct {v1, p0}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;-><init>(Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    return-void
.end method

.method private addDefaultFieldConverterFactories()V
    .registers 3

    .prologue
    .line 154
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterFactories:Ljava/util/List;

    new-instance v1, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;

    invoke-direct {v1}, Lnl/qbusict/cupboard/internal/convert/DefaultFieldConverterFactory;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterFactories:Ljava/util/List;

    new-instance v1, Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory;

    invoke-direct {v1}, Lnl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterFactories:Ljava/util/List;

    new-instance v1, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory;

    invoke-direct {v1}, Lnl/qbusict/cupboard/internal/convert/EntityFieldConverterFactory;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    return-void
.end method


# virtual methods
.method public getDelegateEntityConverter(Lnl/qbusict/cupboard/convert/EntityConverterFactory;Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;
    .registers 10
    .param p1, "skipPast"    # Lnl/qbusict/cupboard/convert/EntityConverterFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnl/qbusict/cupboard/convert/EntityConverterFactory;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 252
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v2, 0x0

    .line 253
    .local v2, "factoryFound":Z
    iget-object v4, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterFactories:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_7
    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_22

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/qbusict/cupboard/convert/EntityConverterFactory;

    .line 254
    .local v1, "factory":Lnl/qbusict/cupboard/convert/EntityConverterFactory;
    if-nez v2, :cond_19

    .line 255
    if-ne v1, p1, :cond_7

    .line 256
    const/4 v2, 0x1

    goto :goto_7

    .line 260
    :cond_19
    iget-object v4, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-interface {v1, v4, p2}, Lnl/qbusict/cupboard/convert/EntityConverterFactory;->create(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    .line 261
    .local v0, "candidate":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    if-eqz v0, :cond_7

    .line 262
    return-object v0

    .line 265
    .end local v0    # "candidate":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    .end local v1    # "factory":Lnl/qbusict/cupboard/convert/EntityConverterFactory;
    :cond_22
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot convert entity of type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public getDelegateFieldConverter(Lnl/qbusict/cupboard/convert/FieldConverterFactory;Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;
    .registers 10
    .param p1, "skipPast"    # Lnl/qbusict/cupboard/convert/FieldConverterFactory;
    .param p2, "fieldType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 269
    const/4 v2, 0x0

    .line 270
    .local v2, "factoryFound":Z
    iget-object v4, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterFactories:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_7
    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_22

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/qbusict/cupboard/convert/FieldConverterFactory;

    .line 271
    .local v1, "factory":Lnl/qbusict/cupboard/convert/FieldConverterFactory;
    if-nez v2, :cond_19

    .line 272
    if-ne v1, p1, :cond_7

    .line 273
    const/4 v2, 0x1

    goto :goto_7

    .line 277
    :cond_19
    iget-object v4, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-interface {v1, v4, p2}, Lnl/qbusict/cupboard/convert/FieldConverterFactory;->create(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;

    move-result-object v0

    .line 278
    .local v0, "candidate":Lnl/qbusict/cupboard/convert/FieldConverter;
    if-eqz v0, :cond_7

    .line 279
    return-object v0

    .line 282
    .end local v0    # "candidate":Lnl/qbusict/cupboard/convert/FieldConverter;
    .end local v1    # "factory":Lnl/qbusict/cupboard/convert/FieldConverterFactory;
    :cond_22
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot convert field of type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public getEntityConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 169
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v8, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCache:Ljava/util/Map;

    invoke-interface {v8, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/qbusict/cupboard/convert/EntityConverter;

    .line 170
    .local v0, "cached":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    if-eqz v0, :cond_b

    .line 202
    .end local v0    # "cached":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    :goto_a
    return-object v0

    .line 173
    .restart local v0    # "cached":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<*>;"
    :cond_b
    const/4 v6, 0x0

    .line 174
    .local v6, "requiresThreadLocalCleanup":Z
    iget-object v8, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v8}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    .line 175
    .local v7, "threadCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lnl/qbusict/cupboard/convert/EntityConverter<*>;>;"
    if-nez v7, :cond_23

    .line 176
    new-instance v7, Ljava/util/HashMap;

    .end local v7    # "threadCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lnl/qbusict/cupboard/convert/EntityConverter<*>;>;"
    const/16 v8, 0x10

    invoke-direct {v7, v8}, Ljava/util/HashMap;-><init>(I)V

    .line 177
    .restart local v7    # "threadCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lnl/qbusict/cupboard/convert/EntityConverter<*>;>;"
    iget-object v8, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v8, v7}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 178
    const/4 v6, 0x1

    .line 181
    :cond_23
    invoke-interface {v7, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;

    .line 182
    .local v5, "ongoingCall":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    if-eqz v5, :cond_2d

    move-object v0, v5

    .line 183
    goto :goto_a

    .line 187
    :cond_2d
    :try_start_2d
    new-instance v1, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;

    const/4 v8, 0x0

    invoke-direct {v1, v8}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;)V

    .line 188
    .local v1, "call":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    invoke-interface {v7, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    iget-object v8, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterFactories:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_3c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_64

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnl/qbusict/cupboard/convert/EntityConverterFactory;

    .line 191
    .local v3, "factory":Lnl/qbusict/cupboard/convert/EntityConverterFactory;
    iget-object v8, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-interface {v3, v8, p1}, Lnl/qbusict/cupboard/convert/EntityConverterFactory;->create(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v2

    .line 192
    .local v2, "candidate":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    if-eqz v2, :cond_3c

    .line 193
    invoke-virtual {v1, v2}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;->setDelegate(Lnl/qbusict/cupboard/convert/EntityConverter;)V

    .line 194
    iget-object v8, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCache:Ljava/util/Map;

    invoke-interface {v8, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_58
    .catchall {:try_start_2d .. :try_end_58} :catchall_7d

    .line 200
    invoke-interface {v7, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    if-eqz v6, :cond_62

    .line 202
    iget-object v8, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v8}, Ljava/lang/ThreadLocal;->remove()V

    :cond_62
    move-object v0, v2

    goto :goto_a

    .line 198
    .end local v2    # "candidate":Lnl/qbusict/cupboard/convert/EntityConverter;, "Lnl/qbusict/cupboard/convert/EntityConverter<TT;>;"
    .end local v3    # "factory":Lnl/qbusict/cupboard/convert/EntityConverterFactory;
    :cond_64
    :try_start_64
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Cannot convert entity of type "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_7d
    .catchall {:try_start_64 .. :try_end_7d} :catchall_7d

    .line 200
    .end local v1    # "call":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter<TT;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    :catchall_7d
    move-exception v8

    invoke-interface {v7, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    if-eqz v6, :cond_88

    .line 202
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v9}, Ljava/lang/ThreadLocal;->remove()V

    :cond_88
    throw v8
.end method

.method public getFieldConverter(Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;
    .registers 14
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 208
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCache:Ljava/util/Map;

    invoke-interface {v9, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/qbusict/cupboard/convert/FieldConverter;

    .line 209
    .local v2, "converter":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    if-eqz v2, :cond_b

    .line 246
    .end local v2    # "converter":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    :goto_a
    return-object v2

    .line 212
    .restart local v2    # "converter":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    :cond_b
    const/4 v7, 0x0

    .line 213
    .local v7, "requiresThreadLocalCleanup":Z
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v9}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map;

    .line 214
    .local v8, "threadCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Type;Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<*>;>;"
    if-nez v8, :cond_23

    .line 215
    new-instance v8, Ljava/util/HashMap;

    .end local v8    # "threadCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Type;Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<*>;>;"
    const/16 v9, 0x10

    invoke-direct {v8, v9}, Ljava/util/HashMap;-><init>(I)V

    .line 216
    .restart local v8    # "threadCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Type;Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<*>;>;"
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v9, v8}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 217
    const/4 v7, 0x1

    .line 220
    :cond_23
    invoke-interface {v8, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;

    .line 221
    .local v6, "ongoingCall":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    if-eqz v6, :cond_4a

    .line 222
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v9}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 225
    .local v3, "entityThreadCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lnl/qbusict/cupboard/convert/EntityConverter<*>;>;"
    instance-of v9, p1, Ljava/lang/Class;

    if-eqz v9, :cond_48

    iget-object v10, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    move-object v9, p1

    check-cast v9, Ljava/lang/Class;

    invoke-virtual {v10, v9}, Lnl/qbusict/cupboard/Cupboard;->isRegisteredEntity(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_48

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4a

    :cond_48
    move-object v2, v6

    .line 226
    goto :goto_a

    .line 231
    .end local v3    # "entityThreadCalls":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lnl/qbusict/cupboard/convert/EntityConverter<*>;>;"
    :cond_4a
    :try_start_4a
    new-instance v0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;

    const/4 v9, 0x0

    invoke-direct {v0, v9}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;-><init>(Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;)V

    .line 232
    .local v0, "call":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    invoke-interface {v8, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterFactories:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_59
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_81

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnl/qbusict/cupboard/convert/FieldConverterFactory;

    .line 235
    .local v4, "factory":Lnl/qbusict/cupboard/convert/FieldConverterFactory;
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-interface {v4, v9, p1}, Lnl/qbusict/cupboard/convert/FieldConverterFactory;->create(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/reflect/Type;)Lnl/qbusict/cupboard/convert/FieldConverter;

    move-result-object v1

    .line 236
    .local v1, "candidate":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    if-eqz v1, :cond_59

    .line 237
    invoke-virtual {v0, v1}, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;->setDelegate(Lnl/qbusict/cupboard/convert/FieldConverter;)V

    .line 238
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCache:Ljava/util/Map;

    invoke-interface {v9, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_75
    .catchall {:try_start_4a .. :try_end_75} :catchall_9a

    .line 244
    invoke-interface {v8, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    if-eqz v7, :cond_7f

    .line 246
    iget-object v9, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v9}, Ljava/lang/ThreadLocal;->remove()V

    :cond_7f
    move-object v2, v1

    goto :goto_a

    .line 242
    .end local v1    # "candidate":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    .end local v4    # "factory":Lnl/qbusict/cupboard/convert/FieldConverterFactory;
    :cond_81
    :try_start_81
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Cannot convert field of type"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_9a
    .catchall {:try_start_81 .. :try_end_9a} :catchall_9a

    .line 244
    .end local v0    # "call":Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter;, "Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter<TT;>;"
    .end local v5    # "i$":Ljava/util/Iterator;
    :catchall_9a
    move-exception v9

    invoke-interface {v8, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    if-eqz v7, :cond_a5

    .line 246
    iget-object v10, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCalls:Ljava/lang/ThreadLocal;

    invoke-virtual {v10}, Ljava/lang/ThreadLocal;->remove()V

    :cond_a5
    throw v9
.end method

.method public registerEntityConverterFactory(Lnl/qbusict/cupboard/convert/EntityConverterFactory;)V
    .registers 4
    .param p1, "factory"    # Lnl/qbusict/cupboard/convert/EntityConverterFactory;

    .prologue
    .line 286
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mEntityConverterFactories:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 287
    return-void
.end method

.method public registerFieldConverter(Ljava/lang/Class;Lnl/qbusict/cupboard/convert/FieldConverter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 294
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "converter":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterCache:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    return-void
.end method

.method public registerFieldConverterFactory(Lnl/qbusict/cupboard/convert/FieldConverterFactory;)V
    .registers 4
    .param p1, "factory"    # Lnl/qbusict/cupboard/convert/FieldConverterFactory;

    .prologue
    .line 290
    iget-object v0, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->mFieldConverterFactories:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 291
    return-void
.end method
