.class public final Lcom/fasterxml/jackson/databind/util/ContainerBuilder;
.super Ljava/lang/Object;
.source "ContainerBuilder.java"


# static fields
.field private static final MAX_BUF:I = 0x3e8


# instance fields
.field private b:[Ljava/lang/Object;

.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private start:I

.field private tail:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "bufSize"    # I

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    and-int/lit8 v0, p1, -0x2

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    .line 48
    return-void
.end method

.method private _buildList(Z)Ljava/util/List;
    .registers 7
    .param p1, "isComplete"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 186
    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    iget v4, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    sub-int v0, v3, v4

    .line 187
    .local v0, "currLen":I
    if-eqz p1, :cond_21

    .line 188
    const/4 v3, 0x2

    if-ge v0, v3, :cond_c

    .line 189
    const/4 v0, 0x2

    .line 200
    :cond_c
    :goto_c
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 201
    .local v2, "l":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .local v1, "i":I
    :goto_13
    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    if-ge v1, v3, :cond_34

    .line 202
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    aget-object v3, v3, v1

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 192
    .end local v1    # "i":I
    .end local v2    # "l":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_21
    const/16 v3, 0x14

    if-ge v0, v3, :cond_28

    .line 193
    const/16 v0, 0x14

    goto :goto_c

    .line 194
    :cond_28
    const/16 v3, 0x3e8

    if-ge v0, v3, :cond_30

    .line 195
    shr-int/lit8 v3, v0, 0x1

    add-int/2addr v0, v3

    goto :goto_c

    .line 197
    :cond_30
    shr-int/lit8 v3, v0, 0x2

    add-int/2addr v0, v3

    goto :goto_c

    .line 204
    .restart local v1    # "i":I
    .restart local v2    # "l":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_34
    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    iput v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    .line 205
    return-object v2
.end method

.method private _buildMap(Z)Ljava/util/Map;
    .registers 8
    .param p1, "isComplete"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 221
    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    iget v4, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    sub-int/2addr v3, v4

    shr-int/lit8 v2, v3, 0x1

    .line 222
    .local v2, "size":I
    if-eqz p1, :cond_3c

    .line 223
    const/4 v3, 0x3

    if-gt v2, v3, :cond_2d

    .line 224
    const/4 v2, 0x4

    .line 239
    :goto_d
    new-instance v1, Ljava/util/LinkedHashMap;

    const v3, 0x3f4ccccd    # 0.8f

    invoke-direct {v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IF)V

    .line 240
    .local v1, "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .local v0, "i":I
    :goto_17
    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    if-ge v0, v3, :cond_4f

    .line 241
    iget-object v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    aget-object v3, v3, v0

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    add-int/lit8 v5, v0, 0x1

    aget-object v4, v4, v5

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    add-int/lit8 v0, v0, 0x2

    goto :goto_17

    .line 225
    .end local v0    # "i":I
    .end local v1    # "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2d
    const/16 v3, 0x28

    if-gt v2, v3, :cond_35

    .line 226
    shr-int/lit8 v3, v2, 0x1

    add-int/2addr v2, v3

    goto :goto_d

    .line 228
    :cond_35
    shr-int/lit8 v3, v2, 0x2

    shr-int/lit8 v4, v2, 0x4

    add-int/2addr v3, v4

    add-int/2addr v2, v3

    goto :goto_d

    .line 231
    :cond_3c
    const/16 v3, 0xa

    if-ge v2, v3, :cond_43

    .line 232
    const/16 v2, 0x10

    goto :goto_d

    .line 233
    :cond_43
    const/16 v3, 0x3e8

    if-ge v2, v3, :cond_4b

    .line 234
    shr-int/lit8 v3, v2, 0x1

    add-int/2addr v2, v3

    goto :goto_d

    .line 236
    :cond_4b
    div-int/lit8 v3, v2, 0x3

    add-int/2addr v2, v3

    goto :goto_d

    .line 243
    .restart local v0    # "i":I
    .restart local v1    # "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_4f
    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    iput v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    .line 244
    return-object v1
.end method

.method private _expandList(Ljava/lang/Object;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 175
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    array-length v0, v0

    const/16 v1, 0x3e8

    if-ge v0, v1, :cond_1f

    .line 176
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    .line 177
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    aput-object p1, v0, v1

    .line 182
    :goto_1e
    return-void

    .line 179
    :cond_1f
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->_buildList(Z)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    .line 180
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e
.end method

.method private _expandMap(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    array-length v0, v0

    const/16 v1, 0x3e8

    if-ge v0, v1, :cond_29

    .line 210
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    .line 211
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    aput-object p1, v0, v1

    .line 212
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    aput-object p2, v0, v1

    .line 217
    :goto_28
    return-void

    .line 214
    :cond_29
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->_buildMap(Z)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    .line 215
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_28
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    if-eqz v0, :cond_a

    .line 95
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    :goto_9
    return-void

    .line 96
    :cond_a
    iget v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    array-length v1, v1

    if-lt v0, v1, :cond_15

    .line 97
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->_expandList(Ljava/lang/Object;)V

    goto :goto_9

    .line 99
    :cond_15
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    aput-object p1, v0, v1

    goto :goto_9
.end method

.method public bufferLength()I
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    array-length v0, v0

    return v0
.end method

.method public canReuse()Z
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public finishArray(I)[Ljava/lang/Object;
    .registers 6
    .param p1, "prevStart"    # I

    .prologue
    .line 129
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    if-nez v1, :cond_11

    .line 130
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    invoke-static {v1, v2, v3}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v0

    .line 135
    .local v0, "result":[Ljava/lang/Object;
    :goto_e
    iput p1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 136
    return-object v0

    .line 132
    .end local v0    # "result":[Ljava/lang/Object;
    :cond_11
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    iget v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    sub-int/2addr v2, v3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 133
    .restart local v0    # "result":[Ljava/lang/Object;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    goto :goto_e
.end method

.method public finishArray(ILjava/lang/Class;)[Ljava/lang/Object;
    .registers 8
    .param p1, "prevStart"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Ljava/lang/Class",
            "<TT;>;)[",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 141
    .local p2, "elemType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    sub-int v1, v2, v3

    .line 143
    .local v1, "size":I
    invoke-static {p2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, [Ljava/lang/Object;

    .line 145
    .local v0, "result":[Ljava/lang/Object;, "[TT;"
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    if-nez v2, :cond_1e

    .line 146
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget v3, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 151
    :goto_1b
    iput p1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 152
    return-object v0

    .line 148
    :cond_1e
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    .line 149
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    goto :goto_1b
.end method

.method public finishList(I)Ljava/util/List;
    .registers 4
    .param p1, "prevStart"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    .line 117
    .local v0, "l":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-nez v0, :cond_c

    .line 118
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->_buildList(Z)Ljava/util/List;

    move-result-object v0

    .line 122
    :goto_9
    iput p1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 123
    return-object v0

    .line 120
    :cond_c
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    goto :goto_9
.end method

.method public finishMap(I)Ljava/util/Map;
    .registers 4
    .param p1, "prevStart"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    .line 159
    .local v0, "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v0, :cond_c

    .line 160
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->_buildMap(Z)Ljava/util/Map;

    move-result-object v0

    .line 164
    :goto_9
    iput p1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 165
    return-object v0

    .line 162
    :cond_c
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    goto :goto_9
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    if-eqz v0, :cond_a

    .line 105
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    :goto_9
    return-void

    .line 106
    :cond_a
    iget v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    add-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    array-length v1, v1

    if-le v0, v1, :cond_17

    .line 107
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->_expandMap(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_9

    .line 109
    :cond_17
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    aput-object p1, v0, v1

    .line 110
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->b:[Ljava/lang/Object;

    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    aput-object p2, v0, v1

    goto :goto_9
.end method

.method public start()I
    .registers 3

    .prologue
    .line 65
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    if-nez v1, :cond_8

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    if-eqz v1, :cond_e

    .line 66
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 68
    :cond_e
    iget v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 69
    .local v0, "prevStart":I
    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    iput v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 70
    return v0
.end method

.method public startList(Ljava/lang/Object;)I
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 74
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    if-nez v1, :cond_8

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    if-eqz v1, :cond_e

    .line 75
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 77
    :cond_e
    iget v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 78
    .local v0, "prevStart":I
    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    iput v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 79
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->add(Ljava/lang/Object;)V

    .line 80
    return v0
.end method

.method public startMap(Ljava/lang/String;Ljava/lang/Object;)I
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 84
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->list:Ljava/util/List;

    if-nez v1, :cond_8

    iget-object v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->map:Ljava/util/Map;

    if-eqz v1, :cond_e

    .line 85
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 87
    :cond_e
    iget v0, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 88
    .local v0, "prevStart":I
    iget v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->tail:I

    iput v1, p0, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->start:I

    .line 89
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/util/ContainerBuilder;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 90
    return v0
.end method
