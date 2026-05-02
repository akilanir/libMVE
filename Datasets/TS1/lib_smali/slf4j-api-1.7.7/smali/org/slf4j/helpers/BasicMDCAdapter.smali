.class public Lorg/slf4j/helpers/BasicMDCAdapter;
.super Ljava/lang/Object;
.source "BasicMDCAdapter.java"

# interfaces
.implements Lorg/slf4j/spi/MDCAdapter;


# static fields
.field static IS_JDK14:Z


# instance fields
.field private inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/InheritableThreadLocal",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 59
    invoke-static {}, Lorg/slf4j/helpers/BasicMDCAdapter;->isJDK14()Z

    move-result v0

    sput-boolean v0, Lorg/slf4j/helpers/BasicMDCAdapter;->IS_JDK14:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/lang/InheritableThreadLocal;

    invoke-direct {v0}, Ljava/lang/InheritableThreadLocal;-><init>()V

    iput-object v0, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    return-void
.end method

.method static isJDK14()Z
    .registers 3

    .prologue
    .line 51
    :try_start_0
    const-string v2, "java.version"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "javaVersion":Ljava/lang/String;
    const-string v2, "1.4"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_b
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_b} :catch_d

    move-result v2

    .line 55
    :goto_c
    return v2

    .line 53
    :catch_d
    move-exception v1

    .line 55
    .local v1, "se":Ljava/lang/SecurityException;
    const/4 v2, 0x0

    goto :goto_c
.end method


# virtual methods
.method public clear()V
    .registers 4

    .prologue
    .line 112
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 113
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_19

    .line 114
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 117
    invoke-static {}, Lorg/slf4j/helpers/BasicMDCAdapter;->isJDK14()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 118
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/InheritableThreadLocal;->set(Ljava/lang/Object;)V

    .line 123
    :cond_19
    :goto_19
    return-void

    .line 120
    :cond_1a
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->remove()V

    goto :goto_19
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 90
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 91
    .local v0, "Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_13

    if-eqz p1, :cond_13

    .line 92
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 94
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getCopyOfContextMap()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    iget-object v2, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v2}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 146
    .local v1, "oldMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v1, :cond_1c

    .line 147
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-static {v2}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 148
    .local v0, "newMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    monitor-enter v1

    .line 149
    :try_start_14
    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 150
    monitor-exit v1

    .line 153
    .end local v0    # "newMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_18
    return-object v0

    .line 150
    .restart local v0    # "newMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_19
    move-exception v2

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_14 .. :try_end_1b} :catchall_19

    throw v2

    .line 153
    .end local v0    # "newMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1c
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public getKeys()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 132
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 133
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_f

    .line 134
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 136
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;

    .prologue
    .line 75
    if-nez p1, :cond_a

    .line 76
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "key cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 78
    :cond_a
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 79
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v0, :cond_22

    .line 80
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 81
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/InheritableThreadLocal;->set(Ljava/lang/Object;)V

    .line 83
    :cond_22
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 102
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 103
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_d

    .line 104
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    :cond_d
    return-void
.end method

.method public setContextMap(Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, "contextMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 159
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/InheritableThreadLocal;->set(Ljava/lang/Object;)V

    .line 160
    return-void
.end method
