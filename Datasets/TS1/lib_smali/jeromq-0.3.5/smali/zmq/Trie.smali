.class public Lzmq/Trie;
.super Ljava/lang/Object;
.source "Trie.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Trie$ITrieHandler;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private count:I

.field private liveNodes:I

.field private min:B

.field next:[Lzmq/Trie;

.field private refcnt:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lzmq/Trie;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Trie;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-byte v0, p0, Lzmq/Trie;->min:B

    .line 39
    iput v0, p0, Lzmq/Trie;->count:I

    .line 40
    iput v0, p0, Lzmq/Trie;->liveNodes:I

    .line 42
    iput v0, p0, Lzmq/Trie;->refcnt:I

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 44
    return-void
.end method

.method private applyHelper([BIILzmq/Trie$ITrieHandler;Ljava/lang/Object;)V
    .registers 13
    .param p1, "buff"    # [B
    .param p2, "buffsize"    # I
    .param p3, "maxBuffsize"    # I
    .param p4, "func"    # Lzmq/Trie$ITrieHandler;
    .param p5, "arg"    # Ljava/lang/Object;

    .prologue
    .line 264
    iget v0, p0, Lzmq/Trie;->refcnt:I

    if-lez v0, :cond_7

    .line 265
    invoke-interface {p4, p1, p2, p5}, Lzmq/Trie$ITrieHandler;->added([BILjava/lang/Object;)V

    .line 269
    :cond_7
    if-lt p2, p3, :cond_1b

    .line 270
    add-int/lit16 p3, p2, 0x100

    .line 271
    invoke-static {p1, p3}, Lzmq/Utils;->realloc([BI)[B

    move-result-object p1

    .line 272
    sget-boolean v0, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v0, :cond_1b

    if-nez p1, :cond_1b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 276
    :cond_1b
    iget v0, p0, Lzmq/Trie;->count:I

    if-nez v0, :cond_20

    .line 296
    :cond_1f
    :goto_1f
    return-void

    .line 281
    :cond_20
    iget v0, p0, Lzmq/Trie;->count:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_39

    .line 282
    iget-byte v0, p0, Lzmq/Trie;->min:B

    aput-byte v0, p1, p2

    .line 283
    add-int/lit8 p2, p2, 0x1

    .line 284
    iget-object v0, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lzmq/Trie;->applyHelper([BIILzmq/Trie$ITrieHandler;Ljava/lang/Object;)V

    goto :goto_1f

    .line 289
    :cond_39
    const/4 v6, 0x0

    .local v6, "c":I
    :goto_3a
    iget v0, p0, Lzmq/Trie;->count:I

    if-eq v6, v0, :cond_1f

    .line 290
    iget-byte v0, p0, Lzmq/Trie;->min:B

    add-int/2addr v0, v6

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 291
    iget-object v0, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v0, v0, v6

    if-eqz v0, :cond_57

    .line 292
    iget-object v0, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v0, v0, v6

    add-int/lit8 v2, p2, 0x1

    move-object v1, p1

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lzmq/Trie;->applyHelper([BIILzmq/Trie$ITrieHandler;Ljava/lang/Object;)V

    .line 289
    :cond_57
    add-int/lit8 v6, v6, 0x1

    goto :goto_3a
.end method

.method private isRedundant()Z
    .registers 2

    .prologue
    .line 300
    iget v0, p0, Lzmq/Trie;->refcnt:I

    if-nez v0, :cond_a

    iget v0, p0, Lzmq/Trie;->liveNodes:I

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private realloc([Lzmq/Trie;IZ)[Lzmq/Trie;
    .registers 5
    .param p1, "table"    # [Lzmq/Trie;
    .param p2, "size"    # I
    .param p3, "ended"    # Z

    .prologue
    .line 113
    const-class v0, Lzmq/Trie;

    invoke-static {v0, p1, p2, p3}, Lzmq/Utils;->realloc(Ljava/lang/Class;[Ljava/lang/Object;IZ)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzmq/Trie;

    return-object v0
.end method


# virtual methods
.method public add([B)Z
    .registers 3
    .param p1, "prefix"    # [B

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lzmq/Trie;->add([BI)Z

    move-result v0

    return v0
.end method

.method public add([BI)Z
    .registers 10
    .param p1, "prefix"    # [B
    .param p2, "start"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 56
    if-eqz p1, :cond_7

    array-length v5, p1

    if-ne v5, p2, :cond_14

    .line 57
    :cond_7
    iget v5, p0, Lzmq/Trie;->refcnt:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lzmq/Trie;->refcnt:I

    .line 58
    iget v5, p0, Lzmq/Trie;->refcnt:I

    if-ne v5, v3, :cond_12

    .line 107
    :goto_11
    return v3

    :cond_12
    move v3, v4

    .line 58
    goto :goto_11

    .line 61
    :cond_14
    aget-byte v0, p1, p2

    .line 62
    .local v0, "c":B
    iget-byte v5, p0, Lzmq/Trie;->min:B

    if-lt v0, v5, :cond_21

    iget-byte v5, p0, Lzmq/Trie;->min:B

    iget v6, p0, Lzmq/Trie;->count:I

    add-int/2addr v5, v6

    if-lt v0, v5, :cond_2c

    .line 65
    :cond_21
    iget v5, p0, Lzmq/Trie;->count:I

    if-nez v5, :cond_52

    .line 66
    iput-byte v0, p0, Lzmq/Trie;->min:B

    .line 67
    iput v3, p0, Lzmq/Trie;->count:I

    .line 68
    const/4 v5, 0x0

    iput-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 92
    :cond_2c
    :goto_2c
    iget v5, p0, Lzmq/Trie;->count:I

    if-ne v5, v3, :cond_b1

    .line 93
    iget-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    if-nez v5, :cond_47

    .line 94
    new-array v3, v3, [Lzmq/Trie;

    iput-object v3, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 95
    iget-object v3, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    new-instance v5, Lzmq/Trie;

    invoke-direct {v5}, Lzmq/Trie;-><init>()V

    aput-object v5, v3, v4

    .line 96
    iget v3, p0, Lzmq/Trie;->liveNodes:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lzmq/Trie;->liveNodes:I

    .line 99
    :cond_47
    iget-object v3, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v3, v3, v4

    add-int/lit8 v4, p2, 0x1

    invoke-virtual {v3, p1, v4}, Lzmq/Trie;->add([BI)Z

    move-result v3

    goto :goto_11

    .line 70
    :cond_52
    iget v5, p0, Lzmq/Trie;->count:I

    if-ne v5, v3, :cond_84

    .line 71
    iget-byte v1, p0, Lzmq/Trie;->min:B

    .line 72
    .local v1, "oldc":B
    iget-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v2, v5, v4

    .line 73
    .local v2, "oldp":Lzmq/Trie;
    iget-byte v5, p0, Lzmq/Trie;->min:B

    if-ge v5, v0, :cond_80

    iget-byte v5, p0, Lzmq/Trie;->min:B

    sub-int v5, v0, v5

    :goto_64
    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lzmq/Trie;->count:I

    .line 74
    iget v5, p0, Lzmq/Trie;->count:I

    new-array v5, v5, [Lzmq/Trie;

    iput-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 75
    iget-byte v5, p0, Lzmq/Trie;->min:B

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    int-to-byte v5, v5

    iput-byte v5, p0, Lzmq/Trie;->min:B

    .line 76
    iget-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget-byte v6, p0, Lzmq/Trie;->min:B

    sub-int v6, v1, v6

    aput-object v2, v5, v6

    goto :goto_2c

    .line 73
    :cond_80
    iget-byte v5, p0, Lzmq/Trie;->min:B

    sub-int/2addr v5, v0

    goto :goto_64

    .line 78
    .end local v1    # "oldc":B
    .end local v2    # "oldp":Lzmq/Trie;
    :cond_84
    iget-byte v5, p0, Lzmq/Trie;->min:B

    if-ge v5, v0, :cond_9b

    .line 80
    iget-byte v5, p0, Lzmq/Trie;->min:B

    sub-int v5, v0, v5

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lzmq/Trie;->count:I

    .line 81
    iget-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget v6, p0, Lzmq/Trie;->count:I

    invoke-direct {p0, v5, v6, v3}, Lzmq/Trie;->realloc([Lzmq/Trie;IZ)[Lzmq/Trie;

    move-result-object v5

    iput-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    goto :goto_2c

    .line 85
    :cond_9b
    iget-byte v5, p0, Lzmq/Trie;->min:B

    iget v6, p0, Lzmq/Trie;->count:I

    add-int/2addr v5, v6

    sub-int/2addr v5, v0

    iput v5, p0, Lzmq/Trie;->count:I

    .line 86
    iget-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget v6, p0, Lzmq/Trie;->count:I

    invoke-direct {p0, v5, v6, v4}, Lzmq/Trie;->realloc([Lzmq/Trie;IZ)[Lzmq/Trie;

    move-result-object v5

    iput-object v5, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 87
    iput-byte v0, p0, Lzmq/Trie;->min:B

    goto/16 :goto_2c

    .line 102
    :cond_b1
    iget-object v3, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget-byte v4, p0, Lzmq/Trie;->min:B

    sub-int v4, v0, v4

    aget-object v3, v3, v4

    if-nez v3, :cond_ce

    .line 103
    iget-object v3, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget-byte v4, p0, Lzmq/Trie;->min:B

    sub-int v4, v0, v4

    new-instance v5, Lzmq/Trie;

    invoke-direct {v5}, Lzmq/Trie;-><init>()V

    aput-object v5, v3, v4

    .line 104
    iget v3, p0, Lzmq/Trie;->liveNodes:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lzmq/Trie;->liveNodes:I

    .line 107
    :cond_ce
    iget-object v3, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget-byte v4, p0, Lzmq/Trie;->min:B

    sub-int v4, v0, v4

    aget-object v3, v3, v4

    add-int/lit8 v4, p2, 0x1

    invoke-virtual {v3, p1, v4}, Lzmq/Trie;->add([BI)Z

    move-result v3

    goto/16 :goto_11
.end method

.method public apply(Lzmq/Trie$ITrieHandler;Ljava/lang/Object;)V
    .registers 9
    .param p1, "func"    # Lzmq/Trie$ITrieHandler;
    .param p2, "arg"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 257
    const/4 v1, 0x0

    move-object v0, p0

    move v3, v2

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lzmq/Trie;->applyHelper([BIILzmq/Trie$ITrieHandler;Ljava/lang/Object;)V

    .line 258
    return-void
.end method

.method public check([B)Z
    .registers 9
    .param p1, "data"    # [B

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 220
    move-object v1, p0

    .line 221
    .local v1, "current":Lzmq/Trie;
    const/4 v2, 0x0

    .line 224
    .local v2, "start":I
    :goto_4
    iget v5, v1, Lzmq/Trie;->refcnt:I

    if-lez v5, :cond_9

    .line 247
    :goto_8
    return v3

    .line 229
    :cond_9
    array-length v5, p1

    if-ne v5, v2, :cond_e

    move v3, v4

    .line 230
    goto :goto_8

    .line 235
    :cond_e
    aget-byte v0, p1, v2

    .line 236
    .local v0, "c":B
    iget-byte v5, v1, Lzmq/Trie;->min:B

    if-lt v0, v5, :cond_1b

    iget-byte v5, v1, Lzmq/Trie;->min:B

    iget v6, v1, Lzmq/Trie;->count:I

    add-int/2addr v5, v6

    if-lt v0, v5, :cond_1d

    :cond_1b
    move v3, v4

    .line 237
    goto :goto_8

    .line 241
    :cond_1d
    iget v5, v1, Lzmq/Trie;->count:I

    if-ne v5, v3, :cond_28

    .line 242
    iget-object v5, v1, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v1, v5, v4

    .line 250
    :cond_25
    add-int/lit8 v2, v2, 0x1

    .line 251
    goto :goto_4

    .line 245
    :cond_28
    iget-object v5, v1, Lzmq/Trie;->next:[Lzmq/Trie;

    iget-byte v6, v1, Lzmq/Trie;->min:B

    sub-int v6, v0, v6

    aget-object v1, v5, v6

    .line 246
    if-nez v1, :cond_25

    move v3, v4

    .line 247
    goto :goto_8
.end method

.method public rm([BI)Z
    .registers 15
    .param p1, "prefix"    # [B
    .param p2, "start"    # I

    .prologue
    const/4 v11, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 120
    if-eqz p1, :cond_8

    array-length v9, p1

    if-ne v9, p2, :cond_1b

    .line 121
    :cond_8
    iget v9, p0, Lzmq/Trie;->refcnt:I

    if-nez v9, :cond_d

    .line 212
    :cond_c
    :goto_c
    return v8

    .line 124
    :cond_d
    iget v9, p0, Lzmq/Trie;->refcnt:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lzmq/Trie;->refcnt:I

    .line 125
    iget v9, p0, Lzmq/Trie;->refcnt:I

    if-nez v9, :cond_19

    :goto_17
    move v8, v7

    goto :goto_c

    :cond_19
    move v7, v8

    goto :goto_17

    .line 128
    :cond_1b
    aget-byte v0, p1, p2

    .line 129
    .local v0, "c":B
    iget v9, p0, Lzmq/Trie;->count:I

    if-eqz v9, :cond_c

    iget-byte v9, p0, Lzmq/Trie;->min:B

    if-lt v0, v9, :cond_c

    iget-byte v9, p0, Lzmq/Trie;->min:B

    iget v10, p0, Lzmq/Trie;->count:I

    add-int/2addr v9, v10

    if-ge v0, v9, :cond_c

    .line 133
    iget v9, p0, Lzmq/Trie;->count:I

    if-ne v9, v7, :cond_50

    iget-object v9, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v4, v9, v8

    .line 136
    .local v4, "nextNode":Lzmq/Trie;
    :goto_34
    if-eqz v4, :cond_c

    .line 140
    add-int/lit8 v9, p2, 0x1

    invoke-virtual {v4, p1, v9}, Lzmq/Trie;->rm([BI)Z

    move-result v6

    .line 141
    .local v6, "ret":Z
    invoke-direct {v4}, Lzmq/Trie;->isRedundant()Z

    move-result v9

    if-eqz v9, :cond_c4

    .line 143
    sget-boolean v9, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v9, :cond_59

    iget v9, p0, Lzmq/Trie;->count:I

    if-gtz v9, :cond_59

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 133
    .end local v4    # "nextNode":Lzmq/Trie;
    .end local v6    # "ret":Z
    :cond_50
    iget-object v9, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget-byte v10, p0, Lzmq/Trie;->min:B

    sub-int v10, v0, v10

    aget-object v4, v9, v10

    goto :goto_34

    .line 145
    .restart local v4    # "nextNode":Lzmq/Trie;
    .restart local v6    # "ret":Z
    :cond_59
    iget v9, p0, Lzmq/Trie;->count:I

    if-ne v9, v7, :cond_75

    .line 146
    iput-object v11, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 147
    iput v8, p0, Lzmq/Trie;->count:I

    .line 148
    iget v7, p0, Lzmq/Trie;->liveNodes:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lzmq/Trie;->liveNodes:I

    .line 149
    sget-boolean v7, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v7, :cond_c4

    iget v7, p0, Lzmq/Trie;->liveNodes:I

    if-eqz v7, :cond_c4

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 152
    :cond_75
    iget-object v9, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget-byte v10, p0, Lzmq/Trie;->min:B

    sub-int v10, v0, v10

    aput-object v11, v9, v10

    .line 153
    sget-boolean v9, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v9, :cond_8b

    iget v9, p0, Lzmq/Trie;->liveNodes:I

    if-gt v9, v7, :cond_8b

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 154
    :cond_8b
    iget v9, p0, Lzmq/Trie;->liveNodes:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lzmq/Trie;->liveNodes:I

    .line 157
    iget v9, p0, Lzmq/Trie;->liveNodes:I

    if-ne v9, v7, :cond_c7

    .line 161
    const/4 v5, 0x0

    .line 162
    .local v5, "node":Lzmq/Trie;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_97
    iget v9, p0, Lzmq/Trie;->count:I

    if-ge v1, v9, :cond_ab

    .line 163
    iget-object v9, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v9, v9, v1

    if-eqz v9, :cond_b7

    .line 164
    iget-object v9, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v5, v9, v1

    .line 165
    iget-byte v9, p0, Lzmq/Trie;->min:B

    add-int/2addr v9, v1

    int-to-byte v9, v9

    iput-byte v9, p0, Lzmq/Trie;->min:B

    .line 170
    :cond_ab
    sget-boolean v9, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v9, :cond_ba

    if-nez v5, :cond_ba

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 162
    :cond_b7
    add-int/lit8 v1, v1, 0x1

    goto :goto_97

    .line 172
    :cond_ba
    iput-object v11, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 173
    new-array v9, v7, [Lzmq/Trie;

    aput-object v5, v9, v8

    iput-object v9, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 174
    iput v7, p0, Lzmq/Trie;->count:I

    .end local v1    # "i":I
    .end local v5    # "node":Lzmq/Trie;
    :cond_c4
    :goto_c4
    move v8, v6

    .line 212
    goto/16 :goto_c

    .line 176
    :cond_c7
    iget-byte v9, p0, Lzmq/Trie;->min:B

    if-ne v0, v9, :cond_123

    .line 178
    iget-byte v3, p0, Lzmq/Trie;->min:B

    .line 179
    .local v3, "newMin":B
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_ce
    iget v8, p0, Lzmq/Trie;->count:I

    if-ge v1, v8, :cond_dc

    .line 180
    iget-object v8, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    aget-object v8, v8, v1

    if-eqz v8, :cond_ea

    .line 181
    iget-byte v8, p0, Lzmq/Trie;->min:B

    add-int/2addr v8, v1

    int-to-byte v3, v8

    .line 185
    :cond_dc
    sget-boolean v8, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v8, :cond_ed

    iget-byte v8, p0, Lzmq/Trie;->min:B

    if-ne v3, v8, :cond_ed

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 179
    :cond_ea
    add-int/lit8 v1, v1, 0x1

    goto :goto_ce

    .line 187
    :cond_ed
    sget-boolean v8, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v8, :cond_fb

    iget-byte v8, p0, Lzmq/Trie;->min:B

    if-gt v3, v8, :cond_fb

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 188
    :cond_fb
    sget-boolean v8, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v8, :cond_10d

    iget v8, p0, Lzmq/Trie;->count:I

    iget-byte v9, p0, Lzmq/Trie;->min:B

    sub-int v9, v3, v9

    if-gt v8, v9, :cond_10d

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 189
    :cond_10d
    iget v8, p0, Lzmq/Trie;->count:I

    iget-byte v9, p0, Lzmq/Trie;->min:B

    sub-int v9, v3, v9

    sub-int/2addr v8, v9

    iput v8, p0, Lzmq/Trie;->count:I

    .line 191
    iget-object v8, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget v9, p0, Lzmq/Trie;->count:I

    invoke-direct {p0, v8, v9, v7}, Lzmq/Trie;->realloc([Lzmq/Trie;IZ)[Lzmq/Trie;

    move-result-object v7

    iput-object v7, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    .line 193
    iput-byte v3, p0, Lzmq/Trie;->min:B

    goto :goto_c4

    .line 195
    .end local v1    # "i":I
    .end local v3    # "newMin":B
    :cond_123
    iget-byte v7, p0, Lzmq/Trie;->min:B

    iget v9, p0, Lzmq/Trie;->count:I

    add-int/2addr v7, v9

    add-int/lit8 v7, v7, -0x1

    if-ne v0, v7, :cond_c4

    .line 197
    iget v2, p0, Lzmq/Trie;->count:I

    .line 198
    .local v2, "newCount":I
    const/4 v1, 0x1

    .restart local v1    # "i":I
    :goto_12f
    iget v7, p0, Lzmq/Trie;->count:I

    if-ge v1, v7, :cond_142

    .line 199
    iget-object v7, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget v9, p0, Lzmq/Trie;->count:I

    add-int/lit8 v9, v9, -0x1

    sub-int/2addr v9, v1

    aget-object v7, v7, v9

    if-eqz v7, :cond_150

    .line 200
    iget v7, p0, Lzmq/Trie;->count:I

    sub-int v2, v7, v1

    .line 204
    :cond_142
    sget-boolean v7, Lzmq/Trie;->$assertionsDisabled:Z

    if-nez v7, :cond_153

    iget v7, p0, Lzmq/Trie;->count:I

    if-ne v2, v7, :cond_153

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 198
    :cond_150
    add-int/lit8 v1, v1, 0x1

    goto :goto_12f

    .line 205
    :cond_153
    iput v2, p0, Lzmq/Trie;->count:I

    .line 207
    iget-object v7, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    iget v9, p0, Lzmq/Trie;->count:I

    invoke-direct {p0, v7, v9, v8}, Lzmq/Trie;->realloc([Lzmq/Trie;IZ)[Lzmq/Trie;

    move-result-object v7

    iput-object v7, p0, Lzmq/Trie;->next:[Lzmq/Trie;

    goto/16 :goto_c4
.end method
