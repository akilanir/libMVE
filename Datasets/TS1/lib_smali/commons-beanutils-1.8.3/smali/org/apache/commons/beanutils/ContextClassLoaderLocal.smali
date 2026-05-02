.class public Lorg/apache/commons/beanutils/ContextClassLoaderLocal;
.super Ljava/lang/Object;
.source "ContextClassLoaderLocal.java"


# instance fields
.field private globalValue:Ljava/lang/Object;

.field private globalValueInitialized:Z

.field private valueByClassLoader:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->valueByClassLoader:Ljava/util/Map;

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->globalValueInitialized:Z

    .line 113
    return-void
.end method


# virtual methods
.method public declared-synchronized get()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 144
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->valueByClassLoader:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_3c

    .line 147
    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 148
    .local v0, "contextClassLoader":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_2c

    .line 150
    iget-object v2, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->valueByClassLoader:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 151
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_29

    iget-object v2, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->valueByClassLoader:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_29

    .line 153
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->initialValue()Ljava/lang/Object;

    move-result-object v1

    .line 154
    iget-object v2, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->valueByClassLoader:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_29
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_29} :catch_2b
    .catchall {:try_start_6 .. :try_end_29} :catchall_3c

    .line 167
    .end local v0    # "contextClassLoader":Ljava/lang/ClassLoader;
    .end local v1    # "value":Ljava/lang/Object;
    :cond_29
    :goto_29
    monitor-exit p0

    return-object v1

    .line 160
    :catch_2b
    move-exception v2

    .line 163
    :cond_2c
    :try_start_2c
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->globalValueInitialized:Z

    if-nez v2, :cond_39

    .line 164
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->initialValue()Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->globalValue:Ljava/lang/Object;

    .line 165
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->globalValueInitialized:Z

    .line 167
    :cond_39
    iget-object v1, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->globalValue:Ljava/lang/Object;
    :try_end_3b
    .catchall {:try_start_2c .. :try_end_3b} :catchall_3c

    goto :goto_29

    .line 144
    :catchall_3c
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected initialValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 129
    const/4 v0, 0x0

    return-object v0
.end method

.method public declared-synchronized set(Ljava/lang/Object;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 181
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->valueByClassLoader:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_1e

    .line 184
    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 185
    .local v0, "contextClassLoader":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_18

    .line 186
    iget-object v1, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->valueByClassLoader:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_15} :catch_17
    .catchall {:try_start_6 .. :try_end_15} :catchall_1e

    .line 195
    .end local v0    # "contextClassLoader":Ljava/lang/ClassLoader;
    :goto_15
    monitor-exit p0

    return-void

    .line 190
    :catch_17
    move-exception v1

    .line 193
    :cond_18
    :try_start_18
    iput-object p1, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->globalValue:Ljava/lang/Object;

    .line 194
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->globalValueInitialized:Z
    :try_end_1d
    .catchall {:try_start_18 .. :try_end_1d} :catchall_1e

    goto :goto_15

    .line 181
    :catchall_1e
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized unset()V
    .registers 3

    .prologue
    .line 203
    monitor-enter p0

    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 204
    .local v0, "contextClassLoader":Ljava/lang/ClassLoader;
    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->unset(Ljava/lang/ClassLoader;)V
    :try_end_c
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_c} :catch_11
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 207
    .end local v0    # "contextClassLoader":Ljava/lang/ClassLoader;
    :goto_c
    monitor-exit p0

    return-void

    .line 203
    :catchall_e
    move-exception v1

    monitor-exit p0

    throw v1

    .line 206
    :catch_11
    move-exception v1

    goto :goto_c
.end method

.method public declared-synchronized unset(Ljava/lang/ClassLoader;)V
    .registers 3
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 214
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->valueByClassLoader:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 215
    monitor-exit p0

    return-void

    .line 214
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method
