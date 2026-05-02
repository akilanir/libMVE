.class public Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;
.super Ljava/lang/Object;
.source "ScopedClassPoolRepositoryImpl.java"

# interfaces
.implements Ljavassist/scopedpool/ScopedClassPoolRepository;


# static fields
.field private static final instance:Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;


# instance fields
.field protected classpool:Ljavassist/ClassPool;

.field protected factory:Ljavassist/scopedpool/ScopedClassPoolFactory;

.field private prune:Z

.field pruneWhenCached:Z

.field protected registeredCLs:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    new-instance v0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;

    invoke-direct {v0}, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;-><init>()V

    sput-object v0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->instance:Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;

    return-void
.end method

.method private constructor <init>()V
    .registers 4

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v1, 0x1

    iput-boolean v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->prune:Z

    .line 46
    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    .line 53
    new-instance v1, Ljavassist/scopedpool/ScopedClassPoolFactoryImpl;

    invoke-direct {v1}, Ljavassist/scopedpool/ScopedClassPoolFactoryImpl;-><init>()V

    iput-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->factory:Ljavassist/scopedpool/ScopedClassPoolFactory;

    .line 68
    invoke-static {}, Ljavassist/ClassPool;->getDefault()Ljavassist/ClassPool;

    move-result-object v1

    iput-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->classpool:Ljavassist/ClassPool;

    .line 70
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 71
    .local v0, "cl":Ljava/lang/ClassLoader;
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->classpool:Ljavassist/ClassPool;

    new-instance v2, Ljavassist/LoaderClassPath;

    invoke-direct {v2, v0}, Ljavassist/LoaderClassPath;-><init>(Ljava/lang/ClassLoader;)V

    invoke-virtual {v1, v2}, Ljavassist/ClassPool;->insertClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;

    .line 72
    return-void
.end method

.method public static getInstance()Ljavassist/scopedpool/ScopedClassPoolRepository;
    .registers 1

    .prologue
    .line 61
    sget-object v0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->instance:Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;

    return-object v0
.end method


# virtual methods
.method public clearUnregisteredClassLoaders()V
    .registers 9

    .prologue
    .line 145
    const/4 v4, 0x0

    .line 146
    .local v4, "toUnregister":Ljava/util/ArrayList;
    iget-object v7, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    monitor-enter v7

    .line 147
    :try_start_4
    iget-object v6, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    :try_end_d
    .catchall {:try_start_4 .. :try_end_d} :catchall_4d

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    move-object v5, v4

    .line 148
    .end local v4    # "toUnregister":Ljava/util/ArrayList;
    .local v5, "toUnregister":Ljava/util/ArrayList;
    :goto_f
    :try_start_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_36

    .line 149
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavassist/scopedpool/ScopedClassPool;

    .line 150
    .local v3, "pool":Ljavassist/scopedpool/ScopedClassPool;
    invoke-virtual {v3}, Ljavassist/scopedpool/ScopedClassPool;->isUnloadedClassLoader()Z

    move-result v6

    if-eqz v6, :cond_55

    .line 151
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 152
    invoke-virtual {v3}, Ljavassist/scopedpool/ScopedClassPool;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 153
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_55

    .line 154
    if-nez v5, :cond_53

    .line 155
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    :try_end_31
    .catchall {:try_start_f .. :try_end_31} :catchall_50

    .line 157
    .end local v5    # "toUnregister":Ljava/util/ArrayList;
    .restart local v4    # "toUnregister":Ljava/util/ArrayList;
    :goto_31
    :try_start_31
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_34
    .catchall {:try_start_31 .. :try_end_34} :catchall_4d

    .end local v0    # "cl":Ljava/lang/ClassLoader;
    :goto_34
    move-object v5, v4

    .line 160
    .end local v4    # "toUnregister":Ljava/util/ArrayList;
    .restart local v5    # "toUnregister":Ljava/util/ArrayList;
    goto :goto_f

    .line 161
    .end local v3    # "pool":Ljavassist/scopedpool/ScopedClassPool;
    :cond_36
    if-eqz v5, :cond_4b

    .line 162
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_39
    :try_start_39
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_4b

    .line 163
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/ClassLoader;

    invoke-virtual {p0, v6}, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->unregisterClassLoader(Ljava/lang/ClassLoader;)V

    .line 162
    add-int/lit8 v1, v1, 0x1

    goto :goto_39

    .line 166
    .end local v1    # "i":I
    :cond_4b
    monitor-exit v7
    :try_end_4c
    .catchall {:try_start_39 .. :try_end_4c} :catchall_50

    .line 167
    return-void

    .line 166
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v5    # "toUnregister":Ljava/util/ArrayList;
    .restart local v4    # "toUnregister":Ljava/util/ArrayList;
    :catchall_4d
    move-exception v6

    :goto_4e
    :try_start_4e
    monitor-exit v7
    :try_end_4f
    .catchall {:try_start_4e .. :try_end_4f} :catchall_4d

    throw v6

    .end local v4    # "toUnregister":Ljava/util/ArrayList;
    .restart local v2    # "it":Ljava/util/Iterator;
    .restart local v5    # "toUnregister":Ljava/util/ArrayList;
    :catchall_50
    move-exception v6

    move-object v4, v5

    .end local v5    # "toUnregister":Ljava/util/ArrayList;
    .restart local v4    # "toUnregister":Ljava/util/ArrayList;
    goto :goto_4e

    .end local v4    # "toUnregister":Ljava/util/ArrayList;
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    .restart local v3    # "pool":Ljavassist/scopedpool/ScopedClassPool;
    .restart local v5    # "toUnregister":Ljava/util/ArrayList;
    :cond_53
    move-object v4, v5

    .end local v5    # "toUnregister":Ljava/util/ArrayList;
    .restart local v4    # "toUnregister":Ljava/util/ArrayList;
    goto :goto_31

    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v4    # "toUnregister":Ljava/util/ArrayList;
    .restart local v5    # "toUnregister":Ljava/util/ArrayList;
    :cond_55
    move-object v4, v5

    .end local v5    # "toUnregister":Ljava/util/ArrayList;
    .restart local v4    # "toUnregister":Ljava/util/ArrayList;
    goto :goto_34
.end method

.method public createScopedClassPool(Ljava/lang/ClassLoader;Ljavassist/ClassPool;)Ljavassist/scopedpool/ScopedClassPool;
    .registers 4
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "src"    # Ljavassist/ClassPool;

    .prologue
    .line 100
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->factory:Ljavassist/scopedpool/ScopedClassPoolFactory;

    invoke-interface {v0, p1, p2, p0}, Ljavassist/scopedpool/ScopedClassPoolFactory;->create(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljavassist/scopedpool/ScopedClassPoolRepository;)Ljavassist/scopedpool/ScopedClassPool;

    move-result-object v0

    return-object v0
.end method

.method public findClassPool(Ljava/lang/ClassLoader;)Ljavassist/ClassPool;
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 104
    if-nez p1, :cond_b

    .line 105
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registerClassLoader(Ljava/lang/ClassLoader;)Ljavassist/ClassPool;

    move-result-object v0

    .line 107
    :goto_a
    return-object v0

    :cond_b
    invoke-virtual {p0, p1}, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registerClassLoader(Ljava/lang/ClassLoader;)Ljavassist/ClassPool;

    move-result-object v0

    goto :goto_a
.end method

.method public getClassPoolFactory()Ljavassist/scopedpool/ScopedClassPoolFactory;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->factory:Ljavassist/scopedpool/ScopedClassPoolFactory;

    return-object v0
.end method

.method public getRegisteredCLs()Ljava/util/Map;
    .registers 2

    .prologue
    .line 136
    invoke-virtual {p0}, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->clearUnregisteredClassLoaders()V

    .line 137
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    return-object v0
.end method

.method public insertDelegate(Ljavassist/scopedpool/ScopedClassPoolRepository;)V
    .registers 2
    .param p1, "delegate"    # Ljavassist/scopedpool/ScopedClassPoolRepository;

    .prologue
    .line 179
    return-void
.end method

.method public isPrune()Z
    .registers 2

    .prologue
    .line 80
    iget-boolean v0, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->prune:Z

    return v0
.end method

.method public registerClassLoader(Ljava/lang/ClassLoader;)Ljavassist/ClassPool;
    .registers 5
    .param p1, "ucl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 117
    iget-object v2, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    monitor-enter v2

    .line 123
    :try_start_3
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 124
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/ClassPool;

    monitor-exit v2

    .line 128
    :goto_14
    return-object v1

    .line 126
    :cond_15
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->classpool:Ljavassist/ClassPool;

    invoke-virtual {p0, p1, v1}, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->createScopedClassPool(Ljava/lang/ClassLoader;Ljavassist/ClassPool;)Ljavassist/scopedpool/ScopedClassPool;

    move-result-object v0

    .line 127
    .local v0, "pool":Ljavassist/scopedpool/ScopedClassPool;
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    monitor-exit v2

    move-object v1, v0

    goto :goto_14

    .line 129
    .end local v0    # "pool":Ljavassist/scopedpool/ScopedClassPool;
    :catchall_23
    move-exception v1

    monitor-exit v2
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_23

    throw v1
.end method

.method public setClassPoolFactory(Ljavassist/scopedpool/ScopedClassPoolFactory;)V
    .registers 2
    .param p1, "factory"    # Ljavassist/scopedpool/ScopedClassPoolFactory;

    .prologue
    .line 182
    iput-object p1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->factory:Ljavassist/scopedpool/ScopedClassPoolFactory;

    .line 183
    return-void
.end method

.method public setPrune(Z)V
    .registers 2
    .param p1, "prune"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->prune:Z

    .line 90
    return-void
.end method

.method public unregisterClassLoader(Ljava/lang/ClassLoader;)V
    .registers 5
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 170
    iget-object v2, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    monitor-enter v2

    .line 171
    :try_start_3
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPoolRepositoryImpl;->registeredCLs:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/scopedpool/ScopedClassPool;

    .line 172
    .local v0, "pool":Ljavassist/scopedpool/ScopedClassPool;
    if-eqz v0, :cond_10

    .line 173
    invoke-virtual {v0}, Ljavassist/scopedpool/ScopedClassPool;->close()V

    .line 174
    :cond_10
    monitor-exit v2

    .line 175
    return-void

    .line 174
    .end local v0    # "pool":Ljavassist/scopedpool/ScopedClassPool;
    :catchall_12
    move-exception v1

    monitor-exit v2
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v1
.end method
