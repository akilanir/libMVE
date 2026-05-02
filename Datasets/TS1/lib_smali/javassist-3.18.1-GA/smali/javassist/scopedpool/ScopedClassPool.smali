.class public Ljavassist/scopedpool/ScopedClassPool;
.super Ljavassist/ClassPool;
.source "ScopedClassPool.java"


# instance fields
.field protected classLoader:Ljava/lang/ref/WeakReference;

.field protected classPath:Ljavassist/LoaderClassPath;

.field isBootstrapCl:Z

.field protected repository:Ljavassist/scopedpool/ScopedClassPoolRepository;

.field protected softcache:Ljavassist/scopedpool/SoftValueHashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 49
    sput-boolean v0, Ljavassist/ClassPool;->doPruning:Z

    .line 50
    sput-boolean v0, Ljavassist/ClassPool;->releaseUnmodifiedClassFile:Z

    .line 51
    return-void
.end method

.method protected constructor <init>(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljavassist/scopedpool/ScopedClassPoolRepository;)V
    .registers 5
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "src"    # Ljavassist/ClassPool;
    .param p3, "repository"    # Ljavassist/scopedpool/ScopedClassPoolRepository;

    .prologue
    .line 66
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Ljavassist/scopedpool/ScopedClassPool;-><init>(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljavassist/scopedpool/ScopedClassPoolRepository;Z)V

    .line 67
    return-void
.end method

.method protected constructor <init>(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljavassist/scopedpool/ScopedClassPoolRepository;Z)V
    .registers 7
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "src"    # Ljavassist/ClassPool;
    .param p3, "repository"    # Ljavassist/scopedpool/ScopedClassPoolRepository;
    .param p4, "isTemp"    # Z

    .prologue
    const/4 v1, 0x1

    .line 83
    invoke-direct {p0, p2}, Ljavassist/ClassPool;-><init>(Ljavassist/ClassPool;)V

    .line 44
    new-instance v0, Ljavassist/scopedpool/SoftValueHashMap;

    invoke-direct {v0}, Ljavassist/scopedpool/SoftValueHashMap;-><init>()V

    iput-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->softcache:Ljavassist/scopedpool/SoftValueHashMap;

    .line 46
    iput-boolean v1, p0, Ljavassist/scopedpool/ScopedClassPool;->isBootstrapCl:Z

    .line 84
    iput-object p3, p0, Ljavassist/scopedpool/ScopedClassPool;->repository:Ljavassist/scopedpool/ScopedClassPoolRepository;

    .line 85
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classLoader:Ljava/lang/ref/WeakReference;

    .line 86
    if-eqz p1, :cond_24

    .line 87
    new-instance v0, Ljavassist/LoaderClassPath;

    invoke-direct {v0, p1}, Ljavassist/LoaderClassPath;-><init>(Ljava/lang/ClassLoader;)V

    iput-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classPath:Ljavassist/LoaderClassPath;

    .line 88
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classPath:Ljavassist/LoaderClassPath;

    invoke-virtual {p0, v0}, Ljavassist/scopedpool/ScopedClassPool;->insertClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;

    .line 90
    :cond_24
    iput-boolean v1, p0, Ljavassist/scopedpool/ScopedClassPool;->childFirstLookup:Z

    .line 91
    if-nez p4, :cond_2c

    if-nez p1, :cond_2c

    .line 93
    iput-boolean v1, p0, Ljavassist/scopedpool/ScopedClassPool;->isBootstrapCl:Z

    .line 95
    :cond_2c
    return-void
.end method


# virtual methods
.method protected cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "c"    # Ljavassist/CtClass;
    .param p3, "dynamic"    # Z

    .prologue
    .line 223
    if-eqz p3, :cond_6

    .line 224
    invoke-super {p0, p1, p2, p3}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V

    .line 231
    :goto_5
    return-void

    .line 227
    :cond_6
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->repository:Ljavassist/scopedpool/ScopedClassPoolRepository;

    invoke-interface {v0}, Ljavassist/scopedpool/ScopedClassPoolRepository;->isPrune()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 228
    invoke-virtual {p2}, Ljavassist/CtClass;->prune()V

    .line 229
    :cond_11
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->softcache:Ljavassist/scopedpool/SoftValueHashMap;

    invoke-virtual {v0, p1, p2}, Ljavassist/scopedpool/SoftValueHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5
.end method

.method public close()V
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classPath:Ljavassist/LoaderClassPath;

    invoke-virtual {p0, v0}, Ljavassist/scopedpool/ScopedClassPool;->removeClassPath(Ljavassist/ClassPath;)V

    .line 121
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classPath:Ljavassist/LoaderClassPath;

    invoke-virtual {v0}, Ljavassist/LoaderClassPath;->close()V

    .line 122
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 123
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->softcache:Ljavassist/scopedpool/SoftValueHashMap;

    invoke-virtual {v0}, Ljavassist/scopedpool/SoftValueHashMap;->clear()V

    .line 124
    return-void
.end method

.method public declared-synchronized flushClass(Ljava/lang/String;)V
    .registers 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 133
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->softcache:Ljavassist/scopedpool/SoftValueHashMap;

    invoke-virtual {v0, p1}, Ljavassist/scopedpool/SoftValueHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 135
    monitor-exit p0

    return-void

    .line 133
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getCached(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 16
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 167
    invoke-virtual {p0, p1}, Ljavassist/scopedpool/ScopedClassPool;->getCachedLocally(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    .line 168
    .local v1, "clazz":Ljavassist/CtClass;
    if-nez v1, :cond_9d

    .line 169
    const/4 v4, 0x0

    .line 171
    .local v4, "isLocal":Z
    invoke-virtual {p0}, Ljavassist/scopedpool/ScopedClassPool;->getClassLoader0()Ljava/lang/ClassLoader;

    move-result-object v3

    .line 172
    .local v3, "dcl":Ljava/lang/ClassLoader;
    if-eqz v3, :cond_39

    .line 173
    const/16 v10, 0x24

    invoke-virtual {p1, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 174
    .local v6, "lastIndex":I
    const/4 v0, 0x0

    .line 175
    .local v0, "classResourceName":Ljava/lang/String;
    if-gez v6, :cond_69

    .line 176
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "[\\.]"

    const-string v12, "/"

    invoke-virtual {p1, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".class"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 185
    :goto_32
    invoke-virtual {v3, v0}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v10

    if-eqz v10, :cond_91

    const/4 v4, 0x1

    .line 188
    .end local v0    # "classResourceName":Ljava/lang/String;
    .end local v6    # "lastIndex":I
    :cond_39
    :goto_39
    if-nez v4, :cond_9d

    .line 189
    iget-object v9, p0, Ljavassist/scopedpool/ScopedClassPool;->repository:Ljavassist/scopedpool/ScopedClassPoolRepository;

    invoke-interface {v9}, Ljavassist/scopedpool/ScopedClassPoolRepository;->getRegisteredCLs()Ljava/util/Map;

    move-result-object v8

    .line 190
    .local v8, "registeredCLs":Ljava/util/Map;
    monitor-enter v8

    .line 191
    :try_start_42
    invoke-interface {v8}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 192
    .local v5, "it":Ljava/util/Iterator;
    :cond_4a
    :goto_4a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9c

    .line 193
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljavassist/scopedpool/ScopedClassPool;

    .line 194
    .local v7, "pool":Ljavassist/scopedpool/ScopedClassPool;
    invoke-virtual {v7}, Ljavassist/scopedpool/ScopedClassPool;->isUnloadedClassLoader()Z

    move-result v9

    if-eqz v9, :cond_93

    .line 195
    iget-object v9, p0, Ljavassist/scopedpool/ScopedClassPool;->repository:Ljavassist/scopedpool/ScopedClassPoolRepository;

    invoke-virtual {v7}, Ljavassist/scopedpool/ScopedClassPool;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v10

    invoke-interface {v9, v10}, Ljavassist/scopedpool/ScopedClassPoolRepository;->unregisterClassLoader(Ljava/lang/ClassLoader;)V

    goto :goto_4a

    .line 205
    .end local v5    # "it":Ljava/util/Iterator;
    .end local v7    # "pool":Ljavassist/scopedpool/ScopedClassPool;
    :catchall_66
    move-exception v9

    monitor-exit v8
    :try_end_68
    .catchall {:try_start_42 .. :try_end_68} :catchall_66

    throw v9

    .line 180
    .end local v8    # "registeredCLs":Ljava/util/Map;
    .restart local v0    # "classResourceName":Ljava/lang/String;
    .restart local v6    # "lastIndex":I
    :cond_69
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v9, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    const-string v12, "[\\.]"

    const-string v13, "/"

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".class"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_32

    :cond_91
    move v4, v9

    .line 185
    goto :goto_39

    .line 200
    .end local v0    # "classResourceName":Ljava/lang/String;
    .end local v6    # "lastIndex":I
    .restart local v5    # "it":Ljava/util/Iterator;
    .restart local v7    # "pool":Ljavassist/scopedpool/ScopedClassPool;
    .restart local v8    # "registeredCLs":Ljava/util/Map;
    :cond_93
    :try_start_93
    invoke-virtual {v7, p1}, Ljavassist/scopedpool/ScopedClassPool;->getCachedLocally(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    .line 201
    if-eqz v1, :cond_4a

    .line 202
    monitor-exit v8

    move-object v2, v1

    .line 209
    .end local v1    # "clazz":Ljavassist/CtClass;
    .end local v3    # "dcl":Ljava/lang/ClassLoader;
    .end local v4    # "isLocal":Z
    .end local v5    # "it":Ljava/util/Iterator;
    .end local v7    # "pool":Ljavassist/scopedpool/ScopedClassPool;
    .end local v8    # "registeredCLs":Ljava/util/Map;
    .local v2, "clazz":Ljavassist/CtClass;
    :goto_9b
    return-object v2

    .line 205
    .end local v2    # "clazz":Ljavassist/CtClass;
    .restart local v1    # "clazz":Ljavassist/CtClass;
    .restart local v3    # "dcl":Ljava/lang/ClassLoader;
    .restart local v4    # "isLocal":Z
    .restart local v5    # "it":Ljava/util/Iterator;
    .restart local v8    # "registeredCLs":Ljava/util/Map;
    :cond_9c
    monitor-exit v8
    :try_end_9d
    .catchall {:try_start_93 .. :try_end_9d} :catchall_66

    .end local v3    # "dcl":Ljava/lang/ClassLoader;
    .end local v4    # "isLocal":Z
    .end local v5    # "it":Ljava/util/Iterator;
    .end local v8    # "registeredCLs":Ljava/util/Map;
    :cond_9d
    move-object v2, v1

    .line 209
    .end local v1    # "clazz":Ljavassist/CtClass;
    .restart local v2    # "clazz":Ljavassist/CtClass;
    goto :goto_9b
.end method

.method protected getCachedLocally(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 251
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/CtClass;

    .line 252
    .local v0, "cached":Ljavassist/CtClass;
    if-eqz v0, :cond_b

    .line 255
    .end local v0    # "cached":Ljavassist/CtClass;
    :goto_a
    return-object v0

    .line 254
    .restart local v0    # "cached":Ljavassist/CtClass;
    :cond_b
    iget-object v2, p0, Ljavassist/scopedpool/ScopedClassPool;->softcache:Ljavassist/scopedpool/SoftValueHashMap;

    monitor-enter v2

    .line 255
    :try_start_e
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPool;->softcache:Ljavassist/scopedpool/SoftValueHashMap;

    invoke-virtual {v1, p1}, Ljavassist/scopedpool/SoftValueHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/CtClass;

    monitor-exit v2

    move-object v0, v1

    goto :goto_a

    .line 256
    :catchall_19
    move-exception v1

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_e .. :try_end_1b} :catchall_19

    throw v1
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 4

    .prologue
    .line 103
    invoke-virtual {p0}, Ljavassist/scopedpool/ScopedClassPool;->getClassLoader0()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 104
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-nez v0, :cond_12

    iget-boolean v1, p0, Ljavassist/scopedpool/ScopedClassPool;->isBootstrapCl:Z

    if-nez v1, :cond_12

    .line 106
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "ClassLoader has been garbage collected"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :cond_12
    return-object v0
.end method

.method protected getClassLoader0()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classLoader:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public declared-synchronized getLocally(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 270
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPool;->softcache:Ljavassist/scopedpool/SoftValueHashMap;

    invoke-virtual {v1, p1}, Ljavassist/scopedpool/SoftValueHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    iget-object v1, p0, Ljavassist/scopedpool/ScopedClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/CtClass;

    .line 272
    .local v0, "clazz":Ljavassist/CtClass;
    if-nez v0, :cond_24

    .line 273
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Ljavassist/scopedpool/ScopedClassPool;->createCtClass(Ljava/lang/String;Z)Ljavassist/CtClass;

    move-result-object v0

    .line 274
    if-nez v0, :cond_20

    .line 275
    new-instance v1, Ljavassist/NotFoundException;

    invoke-direct {v1, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_1d

    .line 270
    .end local v0    # "clazz":Ljavassist/CtClass;
    :catchall_1d
    move-exception v1

    monitor-exit p0

    throw v1

    .line 276
    .restart local v0    # "clazz":Ljavassist/CtClass;
    :cond_20
    const/4 v1, 0x0

    :try_start_21
    invoke-super {p0, p1, v0, v1}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_1d

    .line 279
    :cond_24
    monitor-exit p0

    return-object v0
.end method

.method public isUnloadedClassLoader()Z
    .registers 2

    .prologue
    .line 156
    const/4 v0, 0x0

    return v0
.end method

.method public lockInCache(Ljavassist/CtClass;)V
    .registers 4
    .param p1, "c"    # Ljavassist/CtClass;

    .prologue
    .line 240
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-super {p0, v0, p1, v1}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V

    .line 241
    return-void
.end method

.method public declared-synchronized soften(Ljavassist/CtClass;)V
    .registers 4
    .param p1, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 144
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->repository:Ljavassist/scopedpool/ScopedClassPoolRepository;

    invoke-interface {v0}, Ljavassist/scopedpool/ScopedClassPoolRepository;->isPrune()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 145
    invoke-virtual {p1}, Ljavassist/CtClass;->prune()V

    .line 146
    :cond_c
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->classes:Ljava/util/Hashtable;

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    iget-object v0, p0, Ljavassist/scopedpool/ScopedClassPool;->softcache:Ljavassist/scopedpool/SoftValueHashMap;

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljavassist/scopedpool/SoftValueHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_20

    .line 148
    monitor-exit p0

    return-void

    .line 144
    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toClass(Ljavassist/CtClass;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;
    .registers 5
    .param p1, "ct"    # Ljavassist/CtClass;
    .param p2, "loader"    # Ljava/lang/ClassLoader;
    .param p3, "domain"    # Ljava/security/ProtectionDomain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 306
    invoke-virtual {p0, p1}, Ljavassist/scopedpool/ScopedClassPool;->lockInCache(Ljavassist/CtClass;)V

    .line 307
    invoke-virtual {p0}, Ljavassist/scopedpool/ScopedClassPool;->getClassLoader0()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-super {p0, p1, v0, p3}, Ljavassist/ClassPool;->toClass(Ljavassist/CtClass;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method
