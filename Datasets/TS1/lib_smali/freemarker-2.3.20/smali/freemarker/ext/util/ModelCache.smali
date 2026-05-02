.class public abstract Lfreemarker/ext/util/ModelCache;
.super Ljava/lang/Object;
.source "ModelCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/util/ModelCache$ModelReference;
    }
.end annotation


# instance fields
.field private modelCache:Ljava/util/Map;

.field private refQueue:Ljava/lang/ref/ReferenceQueue;

.field private useCache:Z


# direct methods
.method protected constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/ext/util/ModelCache;->useCache:Z

    .line 70
    iput-object v1, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    .line 71
    iput-object v1, p0, Lfreemarker/ext/util/ModelCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    .line 75
    return-void
.end method

.method private final lookup(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 134
    const/4 v1, 0x0

    .line 138
    .local v1, "ref":Lfreemarker/ext/util/ModelCache$ModelReference;
    iget-object v3, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    monitor-enter v3

    .line 140
    :try_start_4
    iget-object v2, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lfreemarker/ext/util/ModelCache$ModelReference;

    move-object v1, v0

    .line 141
    monitor-exit v3
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_16

    .line 143
    if-eqz v1, :cond_19

    .line 144
    invoke-virtual {v1}, Lfreemarker/ext/util/ModelCache$ModelReference;->getModel()Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 146
    :goto_15
    return-object v2

    .line 141
    :catchall_16
    move-exception v2

    :try_start_17
    monitor-exit v3
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v2

    .line 146
    :cond_19
    const/4 v2, 0x0

    goto :goto_15
.end method

.method private final register(Lfreemarker/template/TemplateModel;Ljava/lang/Object;)V
    .registers 8
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 151
    iget-object v2, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    monitor-enter v2

    .line 154
    :goto_3
    :try_start_3
    iget-object v1, p0, Lfreemarker/ext/util/ModelCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/util/ModelCache$ModelReference;

    .line 155
    .local v0, "queuedRef":Lfreemarker/ext/util/ModelCache$ModelReference;
    if-nez v0, :cond_1b

    .line 160
    iget-object v1, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    new-instance v3, Lfreemarker/ext/util/ModelCache$ModelReference;

    iget-object v4, p0, Lfreemarker/ext/util/ModelCache;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v3, p1, p2, v4}, Lfreemarker/ext/util/ModelCache$ModelReference;-><init>(Lfreemarker/template/TemplateModel;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-interface {v1, p2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    monitor-exit v2

    .line 162
    return-void

    .line 157
    :cond_1b
    iget-object v1, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    iget-object v3, v0, Lfreemarker/ext/util/ModelCache$ModelReference;->object:Ljava/lang/Object;

    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 161
    .end local v0    # "queuedRef":Lfreemarker/ext/util/ModelCache$ModelReference;
    :catchall_23
    move-exception v1

    monitor-exit v2
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_23

    throw v1
.end method


# virtual methods
.method public clearCache()V
    .registers 3

    .prologue
    .line 123
    iget-object v0, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    if-eqz v0, :cond_d

    .line 125
    iget-object v1, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    monitor-enter v1

    .line 127
    :try_start_7
    iget-object v0, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 128
    monitor-exit v1

    .line 130
    :cond_d
    return-void

    .line 128
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_7 .. :try_end_10} :catchall_e

    throw v0
.end method

.method protected abstract create(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
.end method

.method public getInstance(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 99
    instance-of v1, p1, Lfreemarker/template/TemplateModel;

    if-eqz v1, :cond_7

    .line 100
    check-cast p1, Lfreemarker/template/TemplateModel;

    .line 114
    .end local p1    # "object":Ljava/lang/Object;
    :goto_6
    return-object p1

    .line 102
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_7
    instance-of v1, p1, Lfreemarker/template/TemplateModelAdapter;

    if-eqz v1, :cond_12

    .line 103
    check-cast p1, Lfreemarker/template/TemplateModelAdapter;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-interface {p1}, Lfreemarker/template/TemplateModelAdapter;->getTemplateModel()Lfreemarker/template/TemplateModel;

    move-result-object p1

    goto :goto_6

    .line 105
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_12
    iget-boolean v1, p0, Lfreemarker/ext/util/ModelCache;->useCache:Z

    if-eqz v1, :cond_2b

    invoke-virtual {p0, p1}, Lfreemarker/ext/util/ModelCache;->isCacheable(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 106
    invoke-direct {p0, p1}, Lfreemarker/ext/util/ModelCache;->lookup(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 107
    .local v0, "model":Lfreemarker/template/TemplateModel;
    if-nez v0, :cond_29

    .line 108
    invoke-virtual {p0, p1}, Lfreemarker/ext/util/ModelCache;->create(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 109
    invoke-direct {p0, v0, p1}, Lfreemarker/ext/util/ModelCache;->register(Lfreemarker/template/TemplateModel;Ljava/lang/Object;)V

    :cond_29
    move-object p1, v0

    .line 111
    goto :goto_6

    .line 114
    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_2b
    invoke-virtual {p0, p1}, Lfreemarker/ext/util/ModelCache;->create(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object p1

    goto :goto_6
.end method

.method protected abstract isCacheable(Ljava/lang/Object;)Z
.end method

.method public declared-synchronized setUseCache(Z)V
    .registers 3
    .param p1, "useCache"    # Z

    .prologue
    .line 84
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lfreemarker/ext/util/ModelCache;->useCache:Z

    .line 85
    if-eqz p1, :cond_15

    .line 87
    new-instance v0, Lfreemarker/ext/util/IdentityHashMap;

    invoke-direct {v0}, Lfreemarker/ext/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    .line 88
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/util/ModelCache;->refQueue:Ljava/lang/ref/ReferenceQueue;
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_1c

    .line 95
    :goto_13
    monitor-exit p0

    return-void

    .line 92
    :cond_15
    const/4 v0, 0x0

    :try_start_16
    iput-object v0, p0, Lfreemarker/ext/util/ModelCache;->modelCache:Ljava/util/Map;

    .line 93
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/ext/util/ModelCache;->refQueue:Ljava/lang/ref/ReferenceQueue;
    :try_end_1b
    .catchall {:try_start_16 .. :try_end_1b} :catchall_1c

    goto :goto_13

    .line 84
    :catchall_1c
    move-exception v0

    monitor-exit p0

    throw v0
.end method
