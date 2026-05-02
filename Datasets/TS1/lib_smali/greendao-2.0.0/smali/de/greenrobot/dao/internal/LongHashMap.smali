.class public final Lde/greenrobot/dao/internal/LongHashMap;
.super Ljava/lang/Object;
.source "LongHashMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/greenrobot/dao/internal/LongHashMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private capacity:I

.field private size:I

.field private table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lde/greenrobot/dao/internal/LongHashMap$Entry",
            "<TT;>;"
        }
    .end annotation
.end field

.field private threshold:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 49
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lde/greenrobot/dao/internal/LongHashMap;-><init>(I)V

    .line 50
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "capacity"    # I

    .prologue
    .line 53
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput p1, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    .line 55
    mul-int/lit8 v0, p1, 0x4

    div-int/lit8 v0, v0, 0x3

    iput v0, p0, Lde/greenrobot/dao/internal/LongHashMap;->threshold:I

    .line 56
    new-array v0, p1, [Lde/greenrobot/dao/internal/LongHashMap$Entry;

    iput-object v0, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    .line 57
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 120
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    const/4 v0, 0x0

    iput v0, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    .line 121
    iget-object v0, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 122
    return-void
.end method

.method public containsKey(J)Z
    .registers 7
    .param p1, "key"    # J

    .prologue
    .line 60
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    const/16 v2, 0x20

    ushr-long v2, p1, v2

    long-to-int v2, v2

    long-to-int v3, p1

    xor-int/2addr v2, v3

    const v3, 0x7fffffff

    and-int/2addr v2, v3

    iget v3, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    rem-int v1, v2, v3

    .line 62
    .local v1, "index":I
    iget-object v2, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    aget-object v0, v2, v1

    .local v0, "entry":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :goto_13
    if-eqz v0, :cond_20

    .line 63
    iget-wide v2, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->key:J

    cmp-long v2, v2, p1

    if-nez v2, :cond_1d

    .line 64
    const/4 v2, 0x1

    .line 67
    :goto_1c
    return v2

    .line 62
    :cond_1d
    iget-object v0, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    goto :goto_13

    .line 67
    :cond_20
    const/4 v2, 0x0

    goto :goto_1c
.end method

.method public get(J)Ljava/lang/Object;
    .registers 7
    .param p1, "key"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    const/16 v2, 0x20

    ushr-long v2, p1, v2

    long-to-int v2, v2

    long-to-int v3, p1

    xor-int/2addr v2, v3

    const v3, 0x7fffffff

    and-int/2addr v2, v3

    iget v3, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    rem-int v1, v2, v3

    .line 72
    .local v1, "index":I
    iget-object v2, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    aget-object v0, v2, v1

    .local v0, "entry":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :goto_13
    if-eqz v0, :cond_21

    .line 73
    iget-wide v2, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->key:J

    cmp-long v2, v2, p1

    if-nez v2, :cond_1e

    .line 74
    iget-object v2, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->value:Ljava/lang/Object;

    .line 77
    :goto_1d
    return-object v2

    .line 72
    :cond_1e
    iget-object v0, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    goto :goto_13

    .line 77
    :cond_21
    const/4 v2, 0x0

    goto :goto_1d
.end method

.method public logStats()V
    .registers 9

    .prologue
    .line 155
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    const/4 v1, 0x0

    .line 156
    .local v1, "collisions":I
    iget-object v0, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    .local v0, "arr$":[Lde/greenrobot/dao/internal/LongHashMap$Entry;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_5
    if-ge v3, v4, :cond_17

    aget-object v2, v0, v3

    .line 157
    .local v2, "entry":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :goto_9
    if-eqz v2, :cond_14

    iget-object v5, v2, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    if-eqz v5, :cond_14

    .line 158
    add-int/lit8 v1, v1, 0x1

    .line 159
    iget-object v2, v2, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    goto :goto_9

    .line 156
    :cond_14
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 162
    .end local v2    # "entry":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :cond_17
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "load: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    int-to-float v6, v6

    iget v7, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    int-to-float v7, v7

    div-float/2addr v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", capa: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", collisions: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", collision ratio: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    int-to-float v6, v1

    iget v7, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    int-to-float v7, v7

    div-float/2addr v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lde/greenrobot/dao/DaoLog;->d(Ljava/lang/String;)I

    .line 164
    return-void
.end method

.method public put(JLjava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "key"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTT;)TT;"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    .local p3, "value":Ljava/lang/Object;, "TT;"
    const/16 v4, 0x20

    ushr-long v4, p1, v4

    long-to-int v4, v4

    long-to-int v5, p1

    xor-int/2addr v4, v5

    const v5, 0x7fffffff

    and-int/2addr v4, v5

    iget v5, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    rem-int v2, v4, v5

    .line 82
    .local v2, "index":I
    iget-object v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    aget-object v1, v4, v2

    .line 83
    .local v1, "entryOriginal":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    move-object v0, v1

    .local v0, "entry":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :goto_14
    if-eqz v0, :cond_24

    .line 84
    iget-wide v4, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->key:J

    cmp-long v4, v4, p1

    if-nez v4, :cond_21

    .line 85
    iget-object v3, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->value:Ljava/lang/Object;

    .line 86
    .local v3, "oldValue":Ljava/lang/Object;, "TT;"
    iput-object p3, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->value:Ljava/lang/Object;

    .line 95
    .end local v3    # "oldValue":Ljava/lang/Object;, "TT;"
    :goto_20
    return-object v3

    .line 83
    :cond_21
    iget-object v0, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    goto :goto_14

    .line 90
    :cond_24
    iget-object v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    new-instance v5, Lde/greenrobot/dao/internal/LongHashMap$Entry;

    invoke-direct {v5, p1, p2, p3, v1}, Lde/greenrobot/dao/internal/LongHashMap$Entry;-><init>(JLjava/lang/Object;Lde/greenrobot/dao/internal/LongHashMap$Entry;)V

    aput-object v5, v4, v2

    .line 91
    iget v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    .line 92
    iget v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    iget v5, p0, Lde/greenrobot/dao/internal/LongHashMap;->threshold:I

    if-le v4, v5, :cond_40

    .line 93
    iget v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    mul-int/lit8 v4, v4, 0x2

    invoke-virtual {p0, v4}, Lde/greenrobot/dao/internal/LongHashMap;->setCapacity(I)V

    .line 95
    :cond_40
    const/4 v3, 0x0

    goto :goto_20
.end method

.method public remove(J)Ljava/lang/Object;
    .registers 9
    .param p1, "key"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 99
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    const/16 v4, 0x20

    ushr-long v4, p1, v4

    long-to-int v4, v4

    long-to-int v5, p1

    xor-int/2addr v4, v5

    const v5, 0x7fffffff

    and-int/2addr v4, v5

    iget v5, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    rem-int v1, v4, v5

    .line 100
    .local v1, "index":I
    const/4 v3, 0x0

    .line 101
    .local v3, "previous":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    iget-object v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    aget-object v0, v4, v1

    .line 102
    .local v0, "entry":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :goto_14
    if-eqz v0, :cond_33

    .line 103
    iget-object v2, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    .line 104
    .local v2, "next":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    iget-wide v4, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->key:J

    cmp-long v4, v4, p1

    if-nez v4, :cond_30

    .line 105
    if-nez v3, :cond_2d

    .line 106
    iget-object v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    aput-object v2, v4, v1

    .line 110
    :goto_24
    iget v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    .line 111
    iget-object v4, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->value:Ljava/lang/Object;

    .line 116
    .end local v2    # "next":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :goto_2c
    return-object v4

    .line 108
    .restart local v2    # "next":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :cond_2d
    iput-object v2, v3, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    goto :goto_24

    .line 113
    :cond_30
    move-object v3, v0

    .line 114
    move-object v0, v2

    .line 115
    goto :goto_14

    .line 116
    .end local v2    # "next":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :cond_33
    const/4 v4, 0x0

    goto :goto_2c
.end method

.method public reserveRoom(I)V
    .registers 3
    .param p1, "entryCount"    # I

    .prologue
    .line 151
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    mul-int/lit8 v0, p1, 0x5

    div-int/lit8 v0, v0, 0x3

    invoke-virtual {p0, v0}, Lde/greenrobot/dao/internal/LongHashMap;->setCapacity(I)V

    .line 152
    return-void
.end method

.method public setCapacity(I)V
    .registers 12
    .param p1, "newCapacity"    # I

    .prologue
    .line 130
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    new-array v6, p1, [Lde/greenrobot/dao/internal/LongHashMap$Entry;

    .line 131
    .local v6, "newTable":[Lde/greenrobot/dao/internal/LongHashMap$Entry;, "[Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    iget-object v8, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    array-length v5, v8

    .line 132
    .local v5, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    if-ge v1, v5, :cond_2a

    .line 133
    iget-object v8, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    aget-object v0, v8, v1

    .line 134
    .local v0, "entry":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :goto_c
    if-eqz v0, :cond_27

    .line 135
    iget-wide v3, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->key:J

    .line 136
    .local v3, "key":J
    const/16 v8, 0x20

    ushr-long v8, v3, v8

    long-to-int v8, v8

    long-to-int v9, v3

    xor-int/2addr v8, v9

    const v9, 0x7fffffff

    and-int/2addr v8, v9

    rem-int v2, v8, p1

    .line 138
    .local v2, "index":I
    iget-object v7, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    .line 139
    .local v7, "originalNext":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    aget-object v8, v6, v2

    iput-object v8, v0, Lde/greenrobot/dao/internal/LongHashMap$Entry;->next:Lde/greenrobot/dao/internal/LongHashMap$Entry;

    .line 140
    aput-object v0, v6, v2

    .line 141
    move-object v0, v7

    .line 142
    goto :goto_c

    .line 132
    .end local v2    # "index":I
    .end local v3    # "key":J
    .end local v7    # "originalNext":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 144
    .end local v0    # "entry":Lde/greenrobot/dao/internal/LongHashMap$Entry;, "Lde/greenrobot/dao/internal/LongHashMap$Entry<TT;>;"
    :cond_2a
    iput-object v6, p0, Lde/greenrobot/dao/internal/LongHashMap;->table:[Lde/greenrobot/dao/internal/LongHashMap$Entry;

    .line 145
    iput p1, p0, Lde/greenrobot/dao/internal/LongHashMap;->capacity:I

    .line 146
    mul-int/lit8 v8, p1, 0x4

    div-int/lit8 v8, v8, 0x3

    iput v8, p0, Lde/greenrobot/dao/internal/LongHashMap;->threshold:I

    .line 147
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 125
    .local p0, "this":Lde/greenrobot/dao/internal/LongHashMap;, "Lde/greenrobot/dao/internal/LongHashMap<TT;>;"
    iget v0, p0, Lde/greenrobot/dao/internal/LongHashMap;->size:I

    return v0
.end method
