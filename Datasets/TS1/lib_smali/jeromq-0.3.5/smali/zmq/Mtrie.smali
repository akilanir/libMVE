.class public Lzmq/Mtrie;
.super Ljava/lang/Object;
.source "Mtrie.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Mtrie$IMtrieHandler;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private count:I

.field private liveNodes:I

.field private min:I

.field private next:[Lzmq/Mtrie;

.field private pipes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lzmq/Pipe;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const-class v0, Lzmq/Mtrie;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Mtrie;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput v0, p0, Lzmq/Mtrie;->min:I

    .line 43
    iput v0, p0, Lzmq/Mtrie;->count:I

    .line 44
    iput v0, p0, Lzmq/Mtrie;->liveNodes:I

    .line 46
    iput-object v1, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    .line 47
    iput-object v1, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 48
    return-void
.end method

.method private addHelper([BILzmq/Pipe;)Z
    .registers 11
    .param p1, "prefix"    # [B
    .param p2, "start"    # I
    .param p3, "pipe"    # Lzmq/Pipe;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 65
    if-eqz p1, :cond_7

    array-length v5, p1

    if-ne v5, p2, :cond_1e

    .line 66
    :cond_7
    iget-object v5, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    if-nez v5, :cond_1c

    .line 67
    .local v3, "result":Z
    :goto_b
    iget-object v4, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    if-nez v4, :cond_16

    .line 68
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iput-object v4, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    .line 70
    :cond_16
    iget-object v4, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    invoke-interface {v4, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 120
    .end local v3    # "result":Z
    :goto_1b
    return v3

    :cond_1c
    move v3, v4

    .line 66
    goto :goto_b

    .line 74
    :cond_1e
    aget-byte v0, p1, p2

    .line 75
    .local v0, "c":B
    iget v5, p0, Lzmq/Mtrie;->min:I

    if-lt v0, v5, :cond_2b

    iget v5, p0, Lzmq/Mtrie;->min:I

    iget v6, p0, Lzmq/Mtrie;->count:I

    add-int/2addr v5, v6

    if-lt v0, v5, :cond_36

    .line 78
    :cond_2b
    iget v5, p0, Lzmq/Mtrie;->count:I

    if-nez v5, :cond_5c

    .line 79
    iput v0, p0, Lzmq/Mtrie;->min:I

    .line 80
    iput v3, p0, Lzmq/Mtrie;->count:I

    .line 81
    const/4 v5, 0x0

    iput-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 105
    :cond_36
    :goto_36
    iget v5, p0, Lzmq/Mtrie;->count:I

    if-ne v5, v3, :cond_ba

    .line 106
    iget-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    if-nez v5, :cond_51

    .line 107
    new-array v5, v3, [Lzmq/Mtrie;

    iput-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 108
    iget-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    new-instance v6, Lzmq/Mtrie;

    invoke-direct {v6}, Lzmq/Mtrie;-><init>()V

    aput-object v6, v5, v4

    .line 109
    iget v5, p0, Lzmq/Mtrie;->liveNodes:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lzmq/Mtrie;->liveNodes:I

    .line 112
    :cond_51
    iget-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v4, v5, v4

    add-int/lit8 v5, p2, 0x1

    invoke-direct {v4, p1, v5, p3}, Lzmq/Mtrie;->addHelper([BILzmq/Pipe;)Z

    move-result v3

    goto :goto_1b

    .line 83
    :cond_5c
    iget v5, p0, Lzmq/Mtrie;->count:I

    if-ne v5, v3, :cond_8d

    .line 84
    iget v1, p0, Lzmq/Mtrie;->min:I

    .line 85
    .local v1, "oldc":I
    iget-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v2, v5, v4

    .line 86
    .local v2, "oldp":Lzmq/Mtrie;
    iget v5, p0, Lzmq/Mtrie;->min:I

    if-ge v5, v0, :cond_89

    iget v5, p0, Lzmq/Mtrie;->min:I

    sub-int v5, v0, v5

    :goto_6e
    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lzmq/Mtrie;->count:I

    .line 87
    iget v5, p0, Lzmq/Mtrie;->count:I

    new-array v5, v5, [Lzmq/Mtrie;

    iput-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 88
    iget v5, p0, Lzmq/Mtrie;->min:I

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    iput v5, p0, Lzmq/Mtrie;->min:I

    .line 89
    iget-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v6, p0, Lzmq/Mtrie;->min:I

    sub-int v6, v1, v6

    aput-object v2, v5, v6

    goto :goto_36

    .line 86
    :cond_89
    iget v5, p0, Lzmq/Mtrie;->min:I

    sub-int/2addr v5, v0

    goto :goto_6e

    .line 91
    .end local v1    # "oldc":I
    .end local v2    # "oldp":Lzmq/Mtrie;
    :cond_8d
    iget v5, p0, Lzmq/Mtrie;->min:I

    if-ge v5, v0, :cond_a4

    .line 93
    iget v5, p0, Lzmq/Mtrie;->min:I

    sub-int v5, v0, v5

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lzmq/Mtrie;->count:I

    .line 94
    iget-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v6, p0, Lzmq/Mtrie;->count:I

    invoke-direct {p0, v5, v6, v3}, Lzmq/Mtrie;->realloc([Lzmq/Mtrie;IZ)[Lzmq/Mtrie;

    move-result-object v5

    iput-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    goto :goto_36

    .line 98
    :cond_a4
    iget v5, p0, Lzmq/Mtrie;->min:I

    iget v6, p0, Lzmq/Mtrie;->count:I

    add-int/2addr v5, v6

    sub-int/2addr v5, v0

    iput v5, p0, Lzmq/Mtrie;->count:I

    .line 99
    iget-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v6, p0, Lzmq/Mtrie;->count:I

    invoke-direct {p0, v5, v6, v4}, Lzmq/Mtrie;->realloc([Lzmq/Mtrie;IZ)[Lzmq/Mtrie;

    move-result-object v5

    iput-object v5, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 100
    iput v0, p0, Lzmq/Mtrie;->min:I

    goto/16 :goto_36

    .line 115
    :cond_ba
    iget-object v4, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v5, p0, Lzmq/Mtrie;->min:I

    sub-int v5, v0, v5

    aget-object v4, v4, v5

    if-nez v4, :cond_d7

    .line 116
    iget-object v4, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v5, p0, Lzmq/Mtrie;->min:I

    sub-int v5, v0, v5

    new-instance v6, Lzmq/Mtrie;

    invoke-direct {v6}, Lzmq/Mtrie;-><init>()V

    aput-object v6, v4, v5

    .line 117
    iget v4, p0, Lzmq/Mtrie;->liveNodes:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lzmq/Mtrie;->liveNodes:I

    .line 120
    :cond_d7
    iget-object v4, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v5, p0, Lzmq/Mtrie;->min:I

    sub-int v5, v0, v5

    aget-object v4, v4, v5

    add-int/lit8 v5, p2, 0x1

    invoke-direct {v4, p1, v5, p3}, Lzmq/Mtrie;->addHelper([BILzmq/Pipe;)Z

    move-result v3

    goto/16 :goto_1b
.end method

.method private isRedundant()Z
    .registers 2

    .prologue
    .line 399
    iget-object v0, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    if-nez v0, :cond_a

    iget v0, p0, Lzmq/Mtrie;->liveNodes:I

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private realloc([Lzmq/Mtrie;IZ)[Lzmq/Mtrie;
    .registers 5
    .param p1, "table"    # [Lzmq/Mtrie;
    .param p2, "size"    # I
    .param p3, "ended"    # Z

    .prologue
    .line 126
    const-class v0, Lzmq/Mtrie;

    invoke-static {v0, p1, p2, p3}, Lzmq/Utils;->realloc(Ljava/lang/Class;[Ljava/lang/Object;IZ)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzmq/Mtrie;

    return-object v0
.end method

.method private rmHelper(Lzmq/Pipe;[BIILzmq/Mtrie$IMtrieHandler;Ljava/lang/Object;)Z
    .registers 23
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "buff"    # [B
    .param p3, "buffsize"    # I
    .param p4, "maxBuffSize"    # I
    .param p5, "func"    # Lzmq/Mtrie$IMtrieHandler;
    .param p6, "arg"    # Ljava/lang/Object;

    .prologue
    .line 141
    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    if-eqz v4, :cond_2d

    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    move-object/from16 v0, p1

    invoke-interface {v4, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 142
    const/4 v4, 0x0

    move-object/from16 v0, p5

    move-object/from16 v1, p2

    move/from16 v2, p3

    move-object/from16 v3, p6

    invoke-interface {v0, v4, v1, v2, v3}, Lzmq/Mtrie$IMtrieHandler;->invoke(Lzmq/Pipe;[BILjava/lang/Object;)V

    .line 143
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    .line 147
    :cond_2d
    move/from16 v0, p3

    move/from16 v1, p4

    if-lt v0, v1, :cond_41

    .line 148
    move/from16 v0, p3

    add-int/lit16 v0, v0, 0x100

    move/from16 p4, v0

    .line 149
    move-object/from16 v0, p2

    move/from16 v1, p4

    invoke-static {v0, v1}, Lzmq/Utils;->realloc([BI)[B

    move-result-object p2

    .line 153
    :cond_41
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->count:I

    if-nez v4, :cond_49

    .line 154
    const/4 v4, 0x1

    .line 247
    :goto_48
    return v4

    .line 158
    :cond_49
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->count:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_a2

    .line 159
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    int-to-byte v4, v4

    aput-byte v4, p2, p3

    .line 160
    add-int/lit8 p3, p3, 0x1

    .line 161
    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    invoke-direct/range {v4 .. v10}, Lzmq/Mtrie;->rmHelper(Lzmq/Pipe;[BIILzmq/Mtrie$IMtrieHandler;Ljava/lang/Object;)Z

    .line 165
    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-direct {v4}, Lzmq/Mtrie;->isRedundant()Z

    move-result v4

    if-eqz v4, :cond_a0

    .line 166
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 167
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lzmq/Mtrie;->count:I

    .line 168
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->liveNodes:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, p0

    iput v4, v0, Lzmq/Mtrie;->liveNodes:I

    .line 169
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_a0

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->liveNodes:I

    if-eqz v4, :cond_a0

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 171
    :cond_a0
    const/4 v4, 0x1

    goto :goto_48

    .line 177
    :cond_a2
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    move-object/from16 v0, p0

    iget v5, v0, Lzmq/Mtrie;->count:I

    add-int/2addr v4, v5

    add-int/lit8 v13, v4, -0x1

    .line 179
    .local v13, "newMin":I
    move-object/from16 v0, p0

    iget v12, v0, Lzmq/Mtrie;->min:I

    .line 180
    .local v12, "newMax":I
    const/4 v11, 0x0

    .local v11, "c":I
    :goto_b2
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->count:I

    if-eq v11, v4, :cond_128

    .line 181
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    add-int/2addr v4, v11

    int-to-byte v4, v4

    aput-byte v4, p2, p3

    .line 182
    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v4, v4, v11

    if-eqz v4, :cond_10a

    .line 183
    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v4, v4, v11

    add-int/lit8 v7, p3, 0x1

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move/from16 v8, p4

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    invoke-direct/range {v4 .. v10}, Lzmq/Mtrie;->rmHelper(Lzmq/Pipe;[BIILzmq/Mtrie$IMtrieHandler;Ljava/lang/Object;)Z

    .line 187
    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v4, v4, v11

    invoke-direct {v4}, Lzmq/Mtrie;->isRedundant()Z

    move-result v4

    if-eqz v4, :cond_10d

    .line 188
    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    const/4 v5, 0x0

    aput-object v5, v4, v11

    .line 190
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_100

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->liveNodes:I

    if-gtz v4, :cond_100

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 191
    :cond_100
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->liveNodes:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, p0

    iput v4, v0, Lzmq/Mtrie;->liveNodes:I

    .line 180
    :cond_10a
    :goto_10a
    add-int/lit8 v11, v11, 0x1

    goto :goto_b2

    .line 201
    :cond_10d
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    add-int/2addr v4, v11

    if-ge v4, v13, :cond_11a

    .line 202
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    add-int v13, v11, v4

    .line 204
    :cond_11a
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    add-int/2addr v4, v11

    if-le v4, v12, :cond_10a

    .line 205
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    add-int v12, v11, v4

    goto :goto_10a

    .line 211
    :cond_128
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_139

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->count:I

    const/4 v5, 0x1

    if-gt v4, v5, :cond_139

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 214
    :cond_139
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->liveNodes:I

    if-nez v4, :cond_14c

    .line 215
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 216
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput v4, v0, Lzmq/Mtrie;->count:I

    .line 247
    :cond_149
    :goto_149
    const/4 v4, 0x1

    goto/16 :goto_48

    .line 219
    :cond_14c
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->liveNodes:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1ab

    .line 223
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_15f

    if-eq v13, v12, :cond_15f

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 224
    :cond_15f
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_17a

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    if-lt v13, v4, :cond_174

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    move-object/from16 v0, p0

    iget v5, v0, Lzmq/Mtrie;->count:I

    add-int/2addr v4, v5

    if-lt v13, v4, :cond_17a

    :cond_174
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 225
    :cond_17a
    move-object/from16 v0, p0

    iget-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    move-object/from16 v0, p0

    iget v5, v0, Lzmq/Mtrie;->min:I

    sub-int v5, v13, v5

    aget-object v14, v4, v5

    .line 226
    .local v14, "node":Lzmq/Mtrie;
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_192

    if-nez v14, :cond_192

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 227
    :cond_192
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 228
    const/4 v4, 0x1

    new-array v4, v4, [Lzmq/Mtrie;

    const/4 v5, 0x0

    aput-object v14, v4, v5

    move-object/from16 v0, p0

    iput-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 229
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lzmq/Mtrie;->count:I

    .line 230
    move-object/from16 v0, p0

    iput v13, v0, Lzmq/Mtrie;->min:I

    goto :goto_149

    .line 232
    .end local v14    # "node":Lzmq/Mtrie;
    :cond_1ab
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    if-gt v13, v4, :cond_1be

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    move-object/from16 v0, p0

    iget v5, v0, Lzmq/Mtrie;->count:I

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    if-ge v12, v4, :cond_149

    .line 233
    :cond_1be
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_1cf

    sub-int v4, v12, v13

    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x1

    if-gt v4, v5, :cond_1cf

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 235
    :cond_1cf
    move-object/from16 v0, p0

    iget-object v15, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 236
    .local v15, "oldTable":[Lzmq/Mtrie;
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_1f0

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    if-gt v13, v4, :cond_1f0

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    move-object/from16 v0, p0

    iget v5, v0, Lzmq/Mtrie;->count:I

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    if-lt v12, v4, :cond_1f0

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 237
    :cond_1f0
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_200

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    if-ge v13, v4, :cond_200

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 238
    :cond_200
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_217

    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    move-object/from16 v0, p0

    iget v5, v0, Lzmq/Mtrie;->count:I

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    if-le v12, v4, :cond_217

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 239
    :cond_217
    sget-boolean v4, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v4, :cond_22b

    sub-int v4, v12, v13

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iget v5, v0, Lzmq/Mtrie;->count:I

    if-lt v4, v5, :cond_22b

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 240
    :cond_22b
    sub-int v4, v12, v13

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lzmq/Mtrie;->count:I

    .line 241
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->count:I

    new-array v4, v4, [Lzmq/Mtrie;

    move-object/from16 v0, p0

    iput-object v4, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 243
    move-object/from16 v0, p0

    iget v4, v0, Lzmq/Mtrie;->min:I

    sub-int v4, v13, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v7, v0, Lzmq/Mtrie;->count:I

    invoke-static {v15, v4, v5, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 245
    move-object/from16 v0, p0

    iput v13, v0, Lzmq/Mtrie;->min:I

    goto/16 :goto_149
.end method

.method private rmHelper([BILzmq/Pipe;)Z
    .registers 15
    .param p1, "prefix"    # [B
    .param p2, "start"    # I
    .param p3, "pipe"    # Lzmq/Pipe;

    .prologue
    const/4 v10, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 259
    if-eqz p1, :cond_8

    array-length v8, p1

    if-ne v8, p2, :cond_30

    .line 260
    :cond_8
    iget-object v8, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    if-eqz v8, :cond_28

    .line 261
    iget-object v8, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    invoke-interface {v8, p3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    .line 262
    .local v1, "erased":Z
    sget-boolean v8, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v8, :cond_1e

    if-nez v1, :cond_1e

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 263
    :cond_1e
    iget-object v8, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    invoke-interface {v8}, Ljava/util/Set;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_28

    .line 264
    iput-object v10, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    .line 267
    .end local v1    # "erased":Z
    :cond_28
    iget-object v8, p0, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    if-nez v8, :cond_2e

    :goto_2c
    move v7, v6

    .line 344
    :cond_2d
    :goto_2d
    return v7

    :cond_2e
    move v6, v7

    .line 267
    goto :goto_2c

    .line 270
    :cond_30
    aget-byte v0, p1, p2

    .line 271
    .local v0, "c":B
    iget v8, p0, Lzmq/Mtrie;->count:I

    if-eqz v8, :cond_2d

    iget v8, p0, Lzmq/Mtrie;->min:I

    if-lt v0, v8, :cond_2d

    iget v8, p0, Lzmq/Mtrie;->min:I

    iget v9, p0, Lzmq/Mtrie;->count:I

    add-int/2addr v8, v9

    if-ge v0, v8, :cond_2d

    .line 275
    iget v8, p0, Lzmq/Mtrie;->count:I

    if-ne v8, v6, :cond_65

    iget-object v8, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v3, v8, v7

    .line 278
    .local v3, "nextNode":Lzmq/Mtrie;
    :goto_49
    if-eqz v3, :cond_2d

    .line 282
    add-int/lit8 v8, p2, 0x1

    invoke-direct {v3, p1, v8, p3}, Lzmq/Mtrie;->rmHelper([BILzmq/Pipe;)Z

    move-result v5

    .line 283
    .local v5, "ret":Z
    invoke-direct {v3}, Lzmq/Mtrie;->isRedundant()Z

    move-result v8

    if-eqz v8, :cond_d7

    .line 284
    sget-boolean v8, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v8, :cond_6e

    iget v8, p0, Lzmq/Mtrie;->count:I

    if-gtz v8, :cond_6e

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 275
    .end local v3    # "nextNode":Lzmq/Mtrie;
    .end local v5    # "ret":Z
    :cond_65
    iget-object v8, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v9, p0, Lzmq/Mtrie;->min:I

    sub-int v9, v0, v9

    aget-object v3, v8, v9

    goto :goto_49

    .line 286
    .restart local v3    # "nextNode":Lzmq/Mtrie;
    .restart local v5    # "ret":Z
    :cond_6e
    iget v8, p0, Lzmq/Mtrie;->count:I

    if-ne v8, v6, :cond_8a

    .line 287
    iput-object v10, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .line 288
    iput v7, p0, Lzmq/Mtrie;->count:I

    .line 289
    iget v6, p0, Lzmq/Mtrie;->liveNodes:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lzmq/Mtrie;->liveNodes:I

    .line 290
    sget-boolean v6, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v6, :cond_d7

    iget v6, p0, Lzmq/Mtrie;->liveNodes:I

    if-eqz v6, :cond_d7

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 293
    :cond_8a
    iget-object v8, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v9, p0, Lzmq/Mtrie;->min:I

    sub-int v9, v0, v9

    aput-object v10, v8, v9

    .line 294
    sget-boolean v8, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v8, :cond_a0

    iget v8, p0, Lzmq/Mtrie;->liveNodes:I

    if-gt v8, v6, :cond_a0

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 295
    :cond_a0
    iget v8, p0, Lzmq/Mtrie;->liveNodes:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p0, Lzmq/Mtrie;->liveNodes:I

    .line 298
    iget v8, p0, Lzmq/Mtrie;->liveNodes:I

    if-ne v8, v6, :cond_da

    .line 303
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_ab
    iget v8, p0, Lzmq/Mtrie;->count:I

    if-ge v2, v8, :cond_b5

    .line 304
    iget-object v8, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v8, v8, v2

    if-eqz v8, :cond_c3

    .line 309
    :cond_b5
    sget-boolean v8, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v8, :cond_c6

    iget v8, p0, Lzmq/Mtrie;->count:I

    if-lt v2, v8, :cond_c6

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 303
    :cond_c3
    add-int/lit8 v2, v2, 0x1

    goto :goto_ab

    .line 310
    :cond_c6
    iget v8, p0, Lzmq/Mtrie;->min:I

    add-int/2addr v8, v2

    iput v8, p0, Lzmq/Mtrie;->min:I

    .line 311
    iput v6, p0, Lzmq/Mtrie;->count:I

    .line 312
    iget-object v8, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v4, v8, v2

    .line 313
    .local v4, "old":Lzmq/Mtrie;
    new-array v6, v6, [Lzmq/Mtrie;

    aput-object v4, v6, v7

    iput-object v6, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    .end local v2    # "i":I
    .end local v4    # "old":Lzmq/Mtrie;
    :cond_d7
    :goto_d7
    move v7, v5

    .line 344
    goto/16 :goto_2d

    .line 315
    :cond_da
    iget v8, p0, Lzmq/Mtrie;->min:I

    if-ne v0, v8, :cond_10f

    .line 318
    const/4 v2, 0x1

    .restart local v2    # "i":I
    :goto_df
    iget v7, p0, Lzmq/Mtrie;->count:I

    if-ge v2, v7, :cond_e9

    .line 319
    iget-object v7, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v7, v7, v2

    if-eqz v7, :cond_f7

    .line 324
    :cond_e9
    sget-boolean v7, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v7, :cond_fa

    iget v7, p0, Lzmq/Mtrie;->count:I

    if-lt v2, v7, :cond_fa

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 318
    :cond_f7
    add-int/lit8 v2, v2, 0x1

    goto :goto_df

    .line 325
    :cond_fa
    iget v7, p0, Lzmq/Mtrie;->min:I

    add-int/2addr v7, v2

    iput v7, p0, Lzmq/Mtrie;->min:I

    .line 326
    iget v7, p0, Lzmq/Mtrie;->count:I

    sub-int/2addr v7, v2

    iput v7, p0, Lzmq/Mtrie;->count:I

    .line 327
    iget-object v7, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v8, p0, Lzmq/Mtrie;->count:I

    invoke-direct {p0, v7, v8, v6}, Lzmq/Mtrie;->realloc([Lzmq/Mtrie;IZ)[Lzmq/Mtrie;

    move-result-object v6

    iput-object v6, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    goto :goto_d7

    .line 329
    .end local v2    # "i":I
    :cond_10f
    iget v6, p0, Lzmq/Mtrie;->min:I

    iget v8, p0, Lzmq/Mtrie;->count:I

    add-int/2addr v6, v8

    add-int/lit8 v6, v6, -0x1

    if-ne v0, v6, :cond_d7

    .line 332
    const/4 v2, 0x1

    .restart local v2    # "i":I
    :goto_119
    iget v6, p0, Lzmq/Mtrie;->count:I

    if-ge v2, v6, :cond_128

    .line 333
    iget-object v6, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v8, p0, Lzmq/Mtrie;->count:I

    add-int/lit8 v8, v8, -0x1

    sub-int/2addr v8, v2

    aget-object v6, v6, v8

    if-eqz v6, :cond_136

    .line 337
    :cond_128
    sget-boolean v6, Lzmq/Mtrie;->$assertionsDisabled:Z

    if-nez v6, :cond_139

    iget v6, p0, Lzmq/Mtrie;->count:I

    if-lt v2, v6, :cond_139

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 332
    :cond_136
    add-int/lit8 v2, v2, 0x1

    goto :goto_119

    .line 338
    :cond_139
    iget v6, p0, Lzmq/Mtrie;->count:I

    sub-int/2addr v6, v2

    iput v6, p0, Lzmq/Mtrie;->count:I

    .line 339
    iget-object v6, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v8, p0, Lzmq/Mtrie;->count:I

    invoke-direct {p0, v6, v8, v7}, Lzmq/Mtrie;->realloc([Lzmq/Mtrie;IZ)[Lzmq/Mtrie;

    move-result-object v6

    iput-object v6, p0, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    goto :goto_d7
.end method


# virtual methods
.method public add([BILzmq/Pipe;)Z
    .registers 5
    .param p1, "prefix"    # [B
    .param p2, "start"    # I
    .param p3, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 59
    invoke-direct {p0, p1, p2, p3}, Lzmq/Mtrie;->addHelper([BILzmq/Pipe;)Z

    move-result v0

    return v0
.end method

.method public add([BLzmq/Pipe;)Z
    .registers 4
    .param p1, "prefix"    # [B
    .param p2, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lzmq/Mtrie;->addHelper([BILzmq/Pipe;)Z

    move-result v0

    return v0
.end method

.method public match([BILzmq/Mtrie$IMtrieHandler;Ljava/lang/Object;)V
    .registers 13
    .param p1, "data"    # [B
    .param p2, "size"    # I
    .param p3, "func"    # Lzmq/Mtrie$IMtrieHandler;
    .param p4, "arg"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 350
    move-object v1, p0

    .line 351
    .local v1, "current":Lzmq/Mtrie;
    const/4 v3, 0x0

    .line 355
    .local v3, "idx":I
    :goto_3
    iget-object v5, v1, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    if-eqz v5, :cond_1e

    .line 356
    iget-object v5, v1, Lzmq/Mtrie;->pipes:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lzmq/Pipe;

    .line 357
    .local v4, "it":Lzmq/Pipe;
    const/4 v5, 0x0

    invoke-interface {p3, v4, v5, v7, p4}, Lzmq/Mtrie$IMtrieHandler;->invoke(Lzmq/Pipe;[BILjava/lang/Object;)V

    goto :goto_d

    .line 362
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "it":Lzmq/Pipe;
    :cond_1e
    if-nez p2, :cond_21

    .line 395
    :cond_20
    return-void

    .line 367
    :cond_21
    iget v5, v1, Lzmq/Mtrie;->count:I

    if-eqz v5, :cond_20

    .line 371
    aget-byte v0, p1, v3

    .line 373
    .local v0, "c":B
    iget v5, v1, Lzmq/Mtrie;->count:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_39

    .line 374
    iget v5, v1, Lzmq/Mtrie;->min:I

    if-ne v0, v5, :cond_20

    .line 377
    iget-object v5, v1, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    aget-object v1, v5, v7

    .line 378
    add-int/lit8 v3, v3, 0x1

    .line 379
    add-int/lit8 p2, p2, -0x1

    .line 380
    goto :goto_3

    .line 384
    :cond_39
    iget v5, v1, Lzmq/Mtrie;->min:I

    if-lt v0, v5, :cond_20

    iget v5, v1, Lzmq/Mtrie;->min:I

    iget v6, v1, Lzmq/Mtrie;->count:I

    add-int/2addr v5, v6

    if-ge v0, v5, :cond_20

    .line 388
    iget-object v5, v1, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v6, v1, Lzmq/Mtrie;->min:I

    sub-int v6, v0, v6

    aget-object v5, v5, v6

    if-eqz v5, :cond_20

    .line 391
    iget-object v5, v1, Lzmq/Mtrie;->next:[Lzmq/Mtrie;

    iget v6, v1, Lzmq/Mtrie;->min:I

    sub-int v6, v0, v6

    aget-object v1, v5, v6

    .line 392
    add-int/lit8 v3, v3, 0x1

    .line 393
    add-int/lit8 p2, p2, -0x1

    .line 394
    goto :goto_3
.end method

.method public rm(Lzmq/Pipe;Lzmq/Mtrie$IMtrieHandler;Ljava/lang/Object;)Z
    .registers 11
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "func"    # Lzmq/Mtrie$IMtrieHandler;
    .param p3, "arg"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 134
    new-array v2, v3, [B

    move-object v0, p0

    move-object v1, p1

    move v4, v3

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lzmq/Mtrie;->rmHelper(Lzmq/Pipe;[BIILzmq/Mtrie$IMtrieHandler;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public rm([BILzmq/Pipe;)Z
    .registers 5
    .param p1, "prefix"    # [B
    .param p2, "start"    # I
    .param p3, "pipe"    # Lzmq/Pipe;

    .prologue
    .line 254
    invoke-direct {p0, p1, p2, p3}, Lzmq/Mtrie;->rmHelper([BILzmq/Pipe;)Z

    move-result v0

    return v0
.end method
