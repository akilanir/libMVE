.class public Ljavassist/scopedpool/SoftValueHashMap;
.super Ljava/util/AbstractMap;
.source "SoftValueHashMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;
    }
.end annotation


# instance fields
.field private hash:Ljava/util/Map;

.field private queue:Ljava/lang/ref/ReferenceQueue;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 64
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->queue:Ljava/lang/ref/ReferenceQueue;

    .line 120
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    .line 121
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "initialCapacity"    # I

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 64
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->queue:Ljava/lang/ref/ReferenceQueue;

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    .line 113
    return-void
.end method

.method public constructor <init>(IF)V
    .registers 4
    .param p1, "initialCapacity"    # I
    .param p2, "loadFactor"    # F

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 64
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->queue:Ljava/lang/ref/ReferenceQueue;

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1, p2}, Ljava/util/HashMap;-><init>(IF)V

    iput-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    .line 99
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .registers 4
    .param p1, "t"    # Ljava/util/Map;

    .prologue
    .line 133
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    const/16 v1, 0xb

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/high16 v1, 0x3f400000    # 0.75f

    invoke-direct {p0, v0, v1}, Ljavassist/scopedpool/SoftValueHashMap;-><init>(IF)V

    .line 134
    invoke-virtual {p0, p1}, Ljavassist/scopedpool/SoftValueHashMap;->putAll(Ljava/util/Map;)V

    .line 135
    return-void
.end method

.method private processQueue()V
    .registers 4

    .prologue
    .line 72
    :cond_0
    :goto_0
    iget-object v1, p0, Ljavassist/scopedpool/SoftValueHashMap;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;

    .local v0, "ref":Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;
    if-eqz v0, :cond_1e

    .line 73
    iget-object v1, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    iget-object v2, v0, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;->key:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;

    if-ne v0, v1, :cond_0

    .line 76
    iget-object v1, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    iget-object v2, v0, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;->key:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 79
    :cond_1e
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 230
    invoke-direct {p0}, Ljavassist/scopedpool/SoftValueHashMap;->processQueue()V

    .line 231
    iget-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 232
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 166
    invoke-direct {p0}, Ljavassist/scopedpool/SoftValueHashMap;->processQueue()V

    .line 167
    iget-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 56
    invoke-direct {p0}, Ljavassist/scopedpool/SoftValueHashMap;->processQueue()V

    .line 57
    iget-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 181
    invoke-direct {p0}, Ljavassist/scopedpool/SoftValueHashMap;->processQueue()V

    .line 182
    iget-object v1, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/SoftReference;

    .line 183
    .local v0, "ref":Ljava/lang/ref/SoftReference;
    if-eqz v0, :cond_12

    .line 184
    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 185
    :goto_11
    return-object v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 154
    invoke-direct {p0}, Ljavassist/scopedpool/SoftValueHashMap;->processQueue()V

    .line 155
    iget-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 204
    invoke-direct {p0}, Ljavassist/scopedpool/SoftValueHashMap;->processQueue()V

    .line 205
    iget-object v1, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    iget-object v2, p0, Ljavassist/scopedpool/SoftValueHashMap;->queue:Ljava/lang/ref/ReferenceQueue;

    # invokes: Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;->create(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;
    invoke-static {p1, p2, v2}, Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;->access$000(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)Ljavassist/scopedpool/SoftValueHashMap$SoftValueRef;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 206
    .local v0, "rtn":Ljava/lang/Object;
    if-eqz v0, :cond_17

    .line 207
    check-cast v0, Ljava/lang/ref/SoftReference;

    .end local v0    # "rtn":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 208
    .restart local v0    # "rtn":Ljava/lang/Object;
    :cond_17
    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 222
    invoke-direct {p0}, Ljavassist/scopedpool/SoftValueHashMap;->processQueue()V

    .line 223
    iget-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 146
    invoke-direct {p0}, Ljavassist/scopedpool/SoftValueHashMap;->processQueue()V

    .line 147
    iget-object v0, p0, Ljavassist/scopedpool/SoftValueHashMap;->hash:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method
