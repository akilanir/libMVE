.class public Lfreemarker/cache/MruCacheStorage;
.super Ljava/lang/Object;
.source "MruCacheStorage.java"

# interfaces
.implements Lfreemarker/cache/CacheStorage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/cache/MruCacheStorage$MruReference;,
        Lfreemarker/cache/MruCacheStorage$MruEntry;
    }
.end annotation


# instance fields
.field private final map:Ljava/util/Map;

.field private final maxSoftSize:I

.field private final maxStrongSize:I

.field private final refQueue:Ljava/lang/ref/ReferenceQueue;

.field private final softHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

.field private softSize:I

.field private final strongHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

.field private strongSize:I


# direct methods
.method public constructor <init>(II)V
    .registers 6
    .param p1, "maxStrongSize"    # I
    .param p2, "maxSoftSize"    # I

    .prologue
    const/4 v2, 0x0

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    new-instance v0, Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-direct {v0}, Lfreemarker/cache/MruCacheStorage$MruEntry;-><init>()V

    iput-object v0, p0, Lfreemarker/cache/MruCacheStorage;->strongHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 94
    new-instance v0, Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-direct {v0}, Lfreemarker/cache/MruCacheStorage$MruEntry;-><init>()V

    iput-object v0, p0, Lfreemarker/cache/MruCacheStorage;->softHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 96
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage;->softHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iget-object v1, p0, Lfreemarker/cache/MruCacheStorage;->strongHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-virtual {v0, v1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->linkAfter(Lfreemarker/cache/MruCacheStorage$MruEntry;)V

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    .line 99
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v0, p0, Lfreemarker/cache/MruCacheStorage;->refQueue:Ljava/lang/ref/ReferenceQueue;

    .line 102
    iput v2, p0, Lfreemarker/cache/MruCacheStorage;->strongSize:I

    .line 103
    iput v2, p0, Lfreemarker/cache/MruCacheStorage;->softSize:I

    .line 112
    if-gez p1, :cond_35

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxStrongSize < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_35
    if-gez p2, :cond_3f

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxSoftSize < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_3f
    iput p1, p0, Lfreemarker/cache/MruCacheStorage;->maxStrongSize:I

    .line 115
    iput p2, p0, Lfreemarker/cache/MruCacheStorage;->maxSoftSize:I

    .line 116
    return-void
.end method

.method private linkAfterStrongHead(Lfreemarker/cache/MruCacheStorage$MruEntry;)V
    .registers 6
    .param p1, "entry"    # Lfreemarker/cache/MruCacheStorage$MruEntry;

    .prologue
    .line 188
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->strongHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-virtual {p1, v2}, Lfreemarker/cache/MruCacheStorage$MruEntry;->linkAfter(Lfreemarker/cache/MruCacheStorage$MruEntry;)V

    .line 189
    iget v2, p0, Lfreemarker/cache/MruCacheStorage;->strongSize:I

    iget v3, p0, Lfreemarker/cache/MruCacheStorage;->maxStrongSize:I

    if-ne v2, v3, :cond_55

    .line 191
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->softHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-virtual {v2}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getPrevious()Lfreemarker/cache/MruCacheStorage$MruEntry;

    move-result-object v1

    .line 195
    .local v1, "lruStrong":Lfreemarker/cache/MruCacheStorage$MruEntry;
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->strongHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    if-eq v1, v2, :cond_43

    .line 196
    invoke-virtual {v1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->unlink()V

    .line 197
    iget v2, p0, Lfreemarker/cache/MruCacheStorage;->maxSoftSize:I

    if-lez v2, :cond_4b

    .line 198
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->softHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-virtual {v1, v2}, Lfreemarker/cache/MruCacheStorage$MruEntry;->linkAfter(Lfreemarker/cache/MruCacheStorage$MruEntry;)V

    .line 199
    new-instance v2, Lfreemarker/cache/MruCacheStorage$MruReference;

    iget-object v3, p0, Lfreemarker/cache/MruCacheStorage;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v2, v1, v3}, Lfreemarker/cache/MruCacheStorage$MruReference;-><init>(Lfreemarker/cache/MruCacheStorage$MruEntry;Ljava/lang/ref/ReferenceQueue;)V

    invoke-virtual {v1, v2}, Lfreemarker/cache/MruCacheStorage$MruEntry;->setValue(Ljava/lang/Object;)V

    .line 200
    iget v2, p0, Lfreemarker/cache/MruCacheStorage;->softSize:I

    iget v3, p0, Lfreemarker/cache/MruCacheStorage;->maxSoftSize:I

    if-ne v2, v3, :cond_44

    .line 202
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->strongHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-virtual {v2}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getPrevious()Lfreemarker/cache/MruCacheStorage$MruEntry;

    move-result-object v0

    .line 203
    .local v0, "lruSoft":Lfreemarker/cache/MruCacheStorage$MruEntry;
    invoke-virtual {v0}, Lfreemarker/cache/MruCacheStorage$MruEntry;->unlink()V

    .line 204
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    invoke-virtual {v0}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    .end local v0    # "lruSoft":Lfreemarker/cache/MruCacheStorage$MruEntry;
    .end local v1    # "lruStrong":Lfreemarker/cache/MruCacheStorage$MruEntry;
    :cond_43
    :goto_43
    return-void

    .line 207
    .restart local v1    # "lruStrong":Lfreemarker/cache/MruCacheStorage$MruEntry;
    :cond_44
    iget v2, p0, Lfreemarker/cache/MruCacheStorage;->softSize:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lfreemarker/cache/MruCacheStorage;->softSize:I

    goto :goto_43

    .line 211
    :cond_4b
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    invoke-virtual {v1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_43

    .line 216
    .end local v1    # "lruStrong":Lfreemarker/cache/MruCacheStorage$MruEntry;
    :cond_55
    iget v2, p0, Lfreemarker/cache/MruCacheStorage;->strongSize:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lfreemarker/cache/MruCacheStorage;->strongSize:I

    goto :goto_43
.end method

.method private relinkEntryAfterStrongHead(Lfreemarker/cache/MruCacheStorage$MruEntry;Ljava/lang/Object;)V
    .registers 7
    .param p1, "entry"    # Lfreemarker/cache/MruCacheStorage$MruEntry;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 169
    invoke-direct {p0, p1}, Lfreemarker/cache/MruCacheStorage;->unlinkEntryAndInspectIfSoft(Lfreemarker/cache/MruCacheStorage$MruEntry;)Z

    move-result v2

    if-eqz v2, :cond_25

    if-nez p2, :cond_25

    .line 171
    invoke-virtual {p1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/cache/MruCacheStorage$MruReference;

    .line 172
    .local v0, "mref":Lfreemarker/cache/MruCacheStorage$MruReference;
    invoke-virtual {v0}, Lfreemarker/cache/MruCacheStorage$MruReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 173
    .local v1, "strongValue":Ljava/lang/Object;
    if-eqz v1, :cond_1b

    .line 174
    invoke-virtual {p1, v1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->setValue(Ljava/lang/Object;)V

    .line 175
    invoke-direct {p0, p1}, Lfreemarker/cache/MruCacheStorage;->linkAfterStrongHead(Lfreemarker/cache/MruCacheStorage$MruEntry;)V

    .line 185
    .end local v0    # "mref":Lfreemarker/cache/MruCacheStorage$MruReference;
    .end local v1    # "strongValue":Ljava/lang/Object;
    :goto_1a
    return-void

    .line 177
    .restart local v0    # "mref":Lfreemarker/cache/MruCacheStorage$MruReference;
    .restart local v1    # "strongValue":Ljava/lang/Object;
    :cond_1b
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    invoke-virtual {v0}, Lfreemarker/cache/MruCacheStorage$MruReference;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a

    .line 180
    .end local v0    # "mref":Lfreemarker/cache/MruCacheStorage$MruReference;
    .end local v1    # "strongValue":Ljava/lang/Object;
    :cond_25
    if-eqz p2, :cond_2a

    .line 181
    invoke-virtual {p1, p2}, Lfreemarker/cache/MruCacheStorage$MruEntry;->setValue(Ljava/lang/Object;)V

    .line 183
    :cond_2a
    invoke-direct {p0, p1}, Lfreemarker/cache/MruCacheStorage;->linkAfterStrongHead(Lfreemarker/cache/MruCacheStorage$MruEntry;)V

    goto :goto_1a
.end method

.method private removeClearedReferences()V
    .registers 3

    .prologue
    .line 234
    :goto_0
    iget-object v1, p0, Lfreemarker/cache/MruCacheStorage;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lfreemarker/cache/MruCacheStorage$MruReference;

    .line 235
    .local v0, "ref":Lfreemarker/cache/MruCacheStorage$MruReference;
    if-nez v0, :cond_b

    .line 240
    return-void

    .line 238
    :cond_b
    invoke-virtual {v0}, Lfreemarker/cache/MruCacheStorage$MruReference;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1}, Lfreemarker/cache/MruCacheStorage;->removeInternal(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private removeInternal(Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 153
    iget-object v1, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 154
    .local v0, "entry":Lfreemarker/cache/MruCacheStorage$MruEntry;
    if-eqz v0, :cond_d

    .line 155
    invoke-direct {p0, v0}, Lfreemarker/cache/MruCacheStorage;->unlinkEntryAndInspectIfSoft(Lfreemarker/cache/MruCacheStorage$MruEntry;)Z

    .line 157
    :cond_d
    return-void
.end method

.method private unlinkEntryAndInspectIfSoft(Lfreemarker/cache/MruCacheStorage$MruEntry;)Z
    .registers 3
    .param p1, "entry"    # Lfreemarker/cache/MruCacheStorage$MruEntry;

    .prologue
    .line 221
    invoke-virtual {p1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->unlink()V

    .line 222
    invoke-virtual {p1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getValue()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lfreemarker/cache/MruCacheStorage$MruReference;

    if-eqz v0, :cond_13

    .line 223
    iget v0, p0, Lfreemarker/cache/MruCacheStorage;->softSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lfreemarker/cache/MruCacheStorage;->softSize:I

    .line 224
    const/4 v0, 0x1

    .line 228
    :goto_12
    return v0

    .line 227
    :cond_13
    iget v0, p0, Lfreemarker/cache/MruCacheStorage;->strongSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lfreemarker/cache/MruCacheStorage;->strongSize:I

    .line 228
    const/4 v0, 0x0

    goto :goto_12
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 160
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage;->strongHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-virtual {v0}, Lfreemarker/cache/MruCacheStorage$MruEntry;->makeHead()V

    .line 161
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage;->softHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    iget-object v1, p0, Lfreemarker/cache/MruCacheStorage;->strongHead:Lfreemarker/cache/MruCacheStorage$MruEntry;

    invoke-virtual {v0, v1}, Lfreemarker/cache/MruCacheStorage$MruEntry;->linkAfter(Lfreemarker/cache/MruCacheStorage$MruEntry;)V

    .line 162
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 163
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/cache/MruCacheStorage;->softSize:I

    iput v0, p0, Lfreemarker/cache/MruCacheStorage;->strongSize:I

    .line 165
    :cond_16
    iget-object v0, p0, Lfreemarker/cache/MruCacheStorage;->refQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    if-nez v0, :cond_16

    .line 166
    return-void
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 119
    invoke-direct {p0}, Lfreemarker/cache/MruCacheStorage;->removeClearedReferences()V

    .line 120
    iget-object v2, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 121
    .local v0, "entry":Lfreemarker/cache/MruCacheStorage$MruEntry;
    if-nez v0, :cond_f

    .line 130
    :cond_e
    :goto_e
    return-object v1

    .line 124
    :cond_f
    invoke-direct {p0, v0, v1}, Lfreemarker/cache/MruCacheStorage;->relinkEntryAfterStrongHead(Lfreemarker/cache/MruCacheStorage$MruEntry;Ljava/lang/Object;)V

    .line 125
    invoke-virtual {v0}, Lfreemarker/cache/MruCacheStorage$MruEntry;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 126
    .local v1, "value":Ljava/lang/Object;
    instance-of v2, v1, Lfreemarker/cache/MruCacheStorage$MruReference;

    if-eqz v2, :cond_e

    .line 128
    check-cast v1, Lfreemarker/cache/MruCacheStorage$MruReference;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-virtual {v1}, Lfreemarker/cache/MruCacheStorage$MruReference;->get()Ljava/lang/Object;

    move-result-object v1

    goto :goto_e
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 134
    invoke-direct {p0}, Lfreemarker/cache/MruCacheStorage;->removeClearedReferences()V

    .line 135
    iget-object v1, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/cache/MruCacheStorage$MruEntry;

    .line 136
    .local v0, "entry":Lfreemarker/cache/MruCacheStorage$MruEntry;
    if-nez v0, :cond_1b

    .line 137
    new-instance v0, Lfreemarker/cache/MruCacheStorage$MruEntry;

    .end local v0    # "entry":Lfreemarker/cache/MruCacheStorage$MruEntry;
    invoke-direct {v0, p1, p2}, Lfreemarker/cache/MruCacheStorage$MruEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    .restart local v0    # "entry":Lfreemarker/cache/MruCacheStorage$MruEntry;
    iget-object v1, p0, Lfreemarker/cache/MruCacheStorage;->map:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    invoke-direct {p0, v0}, Lfreemarker/cache/MruCacheStorage;->linkAfterStrongHead(Lfreemarker/cache/MruCacheStorage$MruEntry;)V

    .line 145
    :goto_1a
    return-void

    .line 142
    :cond_1b
    invoke-direct {p0, v0, p2}, Lfreemarker/cache/MruCacheStorage;->relinkEntryAfterStrongHead(Lfreemarker/cache/MruCacheStorage$MruEntry;Ljava/lang/Object;)V

    goto :goto_1a
.end method

.method public remove(Ljava/lang/Object;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 148
    invoke-direct {p0}, Lfreemarker/cache/MruCacheStorage;->removeClearedReferences()V

    .line 149
    invoke-direct {p0, p1}, Lfreemarker/cache/MruCacheStorage;->removeInternal(Ljava/lang/Object;)V

    .line 150
    return-void
.end method
