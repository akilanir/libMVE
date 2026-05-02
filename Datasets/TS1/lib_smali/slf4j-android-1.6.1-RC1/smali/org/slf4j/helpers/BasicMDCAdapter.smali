.class public Lorg/slf4j/helpers/BasicMDCAdapter;
.super Ljava/lang/Object;
.source "BasicMDCAdapter.java"

# interfaces
.implements Lorg/slf4j/spi/MDCAdapter;


# instance fields
.field private inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/lang/InheritableThreadLocal;

    invoke-direct {v0}, Ljava/lang/InheritableThreadLocal;-><init>()V

    iput-object v0, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 99
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 100
    .local v0, "hashMap":Ljava/util/HashMap;
    if-eqz v0, :cond_12

    .line 101
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 104
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->remove()V

    .line 106
    :cond_12
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 78
    .local v0, "hashMap":Ljava/util/HashMap;
    if-eqz v0, :cond_13

    if-eqz p1, :cond_13

    .line 79
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 81
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getCopyOfContextMap()Ljava/util/Map;
    .registers 3

    .prologue
    .line 128
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 129
    .local v0, "hashMap":Ljava/util/HashMap;
    if-eqz v0, :cond_10

    .line 130
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 132
    :goto_f
    return-object v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public getKeys()Ljava/util/Set;
    .registers 3

    .prologue
    .line 115
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 116
    .local v0, "hashMap":Ljava/util/HashMap;
    if-eqz v0, :cond_f

    .line 117
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 119
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
    .line 62
    if-nez p1, :cond_a

    .line 63
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "key cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    :cond_a
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 66
    .local v0, "map":Ljava/util/HashMap;
    if-nez v0, :cond_1e

    .line 67
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "map":Ljava/util/HashMap;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 68
    .restart local v0    # "map":Ljava/util/HashMap;
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/InheritableThreadLocal;->set(Ljava/lang/Object;)V

    .line 70
    :cond_1e
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 89
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 90
    .local v0, "map":Ljava/util/HashMap;
    if-eqz v0, :cond_d

    .line 91
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    :cond_d
    return-void
.end method

.method public setContextMap(Ljava/util/Map;)V
    .registers 4
    .param p1, "contextMap"    # Ljava/util/Map;

    .prologue
    .line 137
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1}, Ljava/lang/InheritableThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 138
    .local v0, "hashMap":Ljava/util/HashMap;
    if-eqz v0, :cond_11

    .line 139
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 140
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 145
    :goto_10
    return-void

    .line 142
    :cond_11
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "hashMap":Ljava/util/HashMap;
    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 143
    .restart local v0    # "hashMap":Ljava/util/HashMap;
    iget-object v1, p0, Lorg/slf4j/helpers/BasicMDCAdapter;->inheritableThreadLocal:Ljava/lang/InheritableThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/InheritableThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_10
.end method
