.class public final Lcom/google/zxing/aztec/encoder/HighLevelEncoder;
.super Ljava/lang/Object;
.source "HighLevelEncoder.java"


# static fields
.field private static final CHAR_MAP:[[I

.field static final LATCH_TABLE:[[I

.field static final MODE_DIGIT:I = 0x2

.field static final MODE_LOWER:I = 0x1

.field static final MODE_MIXED:I = 0x3

.field static final MODE_NAMES:[Ljava/lang/String;

.field static final MODE_PUNCT:I = 0x4

.field static final MODE_UPPER:I

.field static final SHIFT_TABLE:[[I


# instance fields
.field private final text:[B


# direct methods
.method static constructor <clinit>()V
    .registers 13

    .prologue
    const/4 v12, 0x4

    const/4 v9, 0x5

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v6, 0x0

    .line 43
    new-array v5, v9, [Ljava/lang/String;

    const-string v7, "UPPER"

    aput-object v7, v5, v6

    const-string v7, "LOWER"

    aput-object v7, v5, v10

    const-string v7, "DIGIT"

    aput-object v7, v5, v11

    const/4 v7, 0x3

    const-string v8, "MIXED"

    aput-object v8, v5, v7

    const-string v7, "PUNCT"

    aput-object v7, v5, v12

    sput-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->MODE_NAMES:[Ljava/lang/String;

    .line 56
    new-array v5, v9, [[I

    new-array v7, v9, [I

    fill-array-data v7, :array_136

    aput-object v7, v5, v6

    new-array v7, v9, [I

    fill-array-data v7, :array_144

    aput-object v7, v5, v10

    new-array v7, v9, [I

    fill-array-data v7, :array_152

    aput-object v7, v5, v11

    const/4 v7, 0x3

    new-array v8, v9, [I

    fill-array-data v8, :array_160

    aput-object v8, v5, v7

    new-array v7, v9, [I

    fill-array-data v7, :array_16e

    aput-object v7, v5, v12

    sput-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->LATCH_TABLE:[[I

    .line 97
    const/16 v5, 0x100

    filled-new-array {v9, v5}, [I

    move-result-object v5

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v7, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[I

    sput-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    .line 99
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v6

    const/16 v7, 0x20

    aput v10, v5, v7

    .line 100
    const/16 v0, 0x41

    .local v0, "c":I
    :goto_60
    const/16 v5, 0x5a

    if-gt v0, v5, :cond_71

    .line 101
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v6

    add-int/lit8 v7, v0, -0x41

    add-int/lit8 v7, v7, 0x2

    aput v7, v5, v0

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto :goto_60

    .line 103
    :cond_71
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v10

    const/16 v7, 0x20

    aput v10, v5, v7

    .line 104
    const/16 v0, 0x61

    :goto_7b
    const/16 v5, 0x7a

    if-gt v0, v5, :cond_8c

    .line 105
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v10

    add-int/lit8 v7, v0, -0x61

    add-int/lit8 v7, v7, 0x2

    aput v7, v5, v0

    .line 104
    add-int/lit8 v0, v0, 0x1

    goto :goto_7b

    .line 107
    :cond_8c
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v11

    const/16 v7, 0x20

    aput v10, v5, v7

    .line 108
    const/16 v0, 0x30

    :goto_96
    const/16 v5, 0x39

    if-gt v0, v5, :cond_a7

    .line 109
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v11

    add-int/lit8 v7, v0, -0x30

    add-int/lit8 v7, v7, 0x2

    aput v7, v5, v0

    .line 108
    add-int/lit8 v0, v0, 0x1

    goto :goto_96

    .line 111
    :cond_a7
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v11

    const/16 v7, 0x2c

    const/16 v8, 0xc

    aput v8, v5, v7

    .line 112
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v11

    const/16 v7, 0x2e

    const/16 v8, 0xd

    aput v8, v5, v7

    .line 113
    const/16 v5, 0x1c

    new-array v2, v5, [I

    fill-array-data v2, :array_17c

    .line 118
    .local v2, "mixedTable":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c3
    array-length v5, v2

    if-ge v1, v5, :cond_d2

    .line 119
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    const/4 v7, 0x3

    aget-object v5, v5, v7

    aget v7, v2, v1

    aput v1, v5, v7

    .line 118
    add-int/lit8 v1, v1, 0x1

    goto :goto_c3

    .line 121
    :cond_d2
    const/16 v5, 0x1f

    new-array v3, v5, [I

    fill-array-data v3, :array_1b8

    .line 126
    .local v3, "punctTable":[I
    const/4 v1, 0x0

    :goto_da
    array-length v5, v3

    if-ge v1, v5, :cond_ec

    .line 127
    aget v5, v3, v1

    if-lez v5, :cond_e9

    .line 128
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v5, v5, v12

    aget v7, v3, v1

    aput v1, v5, v7

    .line 126
    :cond_e9
    add-int/lit8 v1, v1, 0x1

    goto :goto_da

    .line 135
    :cond_ec
    const/4 v5, 0x6

    const/4 v7, 0x6

    filled-new-array {v5, v7}, [I

    move-result-object v5

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v7, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[I

    sput-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    .line 137
    sget-object v7, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    array-length v8, v7

    move v5, v6

    :goto_100
    if-ge v5, v8, :cond_10b

    aget-object v4, v7, v5

    .line 138
    .local v4, "table":[I
    const/4 v9, -0x1

    invoke-static {v4, v9}, Ljava/util/Arrays;->fill([II)V

    .line 137
    add-int/lit8 v5, v5, 0x1

    goto :goto_100

    .line 140
    .end local v4    # "table":[I
    :cond_10b
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v5, v5, v6

    aput v6, v5, v12

    .line 142
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v5, v5, v10

    aput v6, v5, v12

    .line 143
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v5, v5, v10

    const/16 v7, 0x1c

    aput v7, v5, v6

    .line 145
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    const/4 v7, 0x3

    aget-object v5, v5, v7

    aput v6, v5, v12

    .line 147
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v5, v5, v11

    aput v6, v5, v12

    .line 148
    sget-object v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    aget-object v5, v5, v11

    const/16 v7, 0xf

    aput v7, v5, v6

    .line 149
    return-void

    .line 56
    nop

    :array_136
    .array-data 4
        0x0
        0x5001c
        0x5001e
        0x5001d
        0xa03be
    .end array-data

    :array_144
    .array-data 4
        0x901ee
        0x0
        0x5001e
        0x5001d
        0xa03be
    .end array-data

    :array_152
    .array-data 4
        0x4000e
        0x901dc
        0x0
        0x901dd
        0xe3bbe
    .end array-data

    :array_160
    .array-data 4
        0x5001d
        0x5001c
        0xa03be
        0x0
        0x5001e
    .end array-data

    :array_16e
    .array-data 4
        0x5001f
        0xa03fc
        0xa03fe
        0xa03fd
        0x0
    .end array-data

    .line 113
    :array_17c
    .array-data 4
        0x0
        0x20
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0x1b
        0x1c
        0x1d
        0x1e
        0x1f
        0x40
        0x5c
        0x5e
        0x5f
        0x60
        0x7c
        0x7e
        0x7f
    .end array-data

    .line 121
    :array_1b8
    .array-data 4
        0x0
        0xd
        0x0
        0x0
        0x0
        0x0
        0x21
        0x27
        0x23
        0x24
        0x25
        0x26
        0x27
        0x28
        0x29
        0x2a
        0x2b
        0x2c
        0x2d
        0x2e
        0x2f
        0x3a
        0x3b
        0x3c
        0x3d
        0x3e
        0x3f
        0x5b
        0x5d
        0x7b
        0x7d
    .end array-data
.end method

.method public constructor <init>([B)V
    .registers 2
    .param p1, "text"    # [B

    .prologue
    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    iput-object p1, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    .line 155
    return-void
.end method

.method private static simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    .prologue
    .line 287
    .local p0, "states":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/aztec/encoder/State;>;"
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 288
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/aztec/encoder/State;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_9
    :goto_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/aztec/encoder/State;

    .line 289
    .local v2, "newState":Lcom/google/zxing/aztec/encoder/State;
    const/4 v0, 0x1

    .line 290
    .local v0, "add":Z
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/aztec/encoder/State;>;"
    :cond_1a
    :goto_1a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2d

    .line 291
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/aztec/encoder/State;

    .line 292
    .local v3, "oldState":Lcom/google/zxing/aztec/encoder/State;
    invoke-virtual {v3, v2}, Lcom/google/zxing/aztec/encoder/State;->isBetterThanOrEqualTo(Lcom/google/zxing/aztec/encoder/State;)Z

    move-result v6

    if-eqz v6, :cond_33

    .line 293
    const/4 v0, 0x0

    .line 300
    .end local v3    # "oldState":Lcom/google/zxing/aztec/encoder/State;
    :cond_2d
    if-eqz v0, :cond_9

    .line 301
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 296
    .restart local v3    # "oldState":Lcom/google/zxing/aztec/encoder/State;
    :cond_33
    invoke-virtual {v2, v3}, Lcom/google/zxing/aztec/encoder/State;->isBetterThanOrEqualTo(Lcom/google/zxing/aztec/encoder/State;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 297
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1a

    .line 304
    .end local v0    # "add":Z
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/google/zxing/aztec/encoder/State;>;"
    .end local v2    # "newState":Lcom/google/zxing/aztec/encoder/State;
    .end local v3    # "oldState":Lcom/google/zxing/aztec/encoder/State;
    :cond_3d
    return-object v4
.end method

.method private updateStateForChar(Lcom/google/zxing/aztec/encoder/State;ILjava/util/Collection;)V
    .registers 14
    .param p1, "state"    # Lcom/google/zxing/aztec/encoder/State;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/aztec/encoder/State;",
            "I",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 217
    .local p3, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    iget-object v8, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    aget-byte v8, v8, p2

    and-int/lit16 v8, v8, 0xff

    int-to-char v1, v8

    .line 218
    .local v1, "ch":C
    sget-object v8, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v9

    aget-object v8, v8, v9

    aget v8, v8, v1

    if-lez v8, :cond_51

    const/4 v2, 0x1

    .line 219
    .local v2, "charInCurrentTable":Z
    :goto_14
    const/4 v7, 0x0

    .line 220
    .local v7, "stateNoBinary":Lcom/google/zxing/aztec/encoder/State;
    const/4 v5, 0x0

    .local v5, "mode":I
    :goto_16
    const/4 v8, 0x4

    if-gt v5, v8, :cond_53

    .line 221
    sget-object v8, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    aget-object v8, v8, v5

    aget v3, v8, v1

    .line 222
    .local v3, "charInMode":I
    if-lez v3, :cond_4e

    .line 223
    if-nez v7, :cond_27

    .line 225
    invoke-virtual {p1, p2}, Lcom/google/zxing/aztec/encoder/State;->endBinaryShift(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v7

    .line 228
    :cond_27
    if-eqz v2, :cond_32

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v8

    if-eq v5, v8, :cond_32

    const/4 v8, 0x2

    if-ne v5, v8, :cond_39

    .line 233
    :cond_32
    invoke-virtual {v7, v5, v3}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v4

    .line 234
    .local v4, "latchState":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 237
    .end local v4    # "latchState":Lcom/google/zxing/aztec/encoder/State;
    :cond_39
    if-nez v2, :cond_4e

    sget-object v8, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->SHIFT_TABLE:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v9

    aget-object v8, v8, v9

    aget v8, v8, v5

    if-ltz v8, :cond_4e

    .line 240
    invoke-virtual {v7, v5, v3}, Lcom/google/zxing/aztec/encoder/State;->shiftAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v6

    .line 241
    .local v6, "shiftState":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 220
    .end local v6    # "shiftState":Lcom/google/zxing/aztec/encoder/State;
    :cond_4e
    add-int/lit8 v5, v5, 0x1

    goto :goto_16

    .line 218
    .end local v2    # "charInCurrentTable":Z
    .end local v3    # "charInMode":I
    .end local v5    # "mode":I
    .end local v7    # "stateNoBinary":Lcom/google/zxing/aztec/encoder/State;
    :cond_51
    const/4 v2, 0x0

    goto :goto_14

    .line 245
    .restart local v2    # "charInCurrentTable":Z
    .restart local v5    # "mode":I
    .restart local v7    # "stateNoBinary":Lcom/google/zxing/aztec/encoder/State;
    :cond_53
    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getBinaryShiftByteCount()I

    move-result v8

    if-gtz v8, :cond_65

    sget-object v8, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->CHAR_MAP:[[I

    invoke-virtual {p1}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v9

    aget-object v8, v8, v9

    aget v8, v8, v1

    if-nez v8, :cond_6c

    .line 249
    :cond_65
    invoke-virtual {p1, p2}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v0

    .line 250
    .local v0, "binaryState":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 252
    .end local v0    # "binaryState":Lcom/google/zxing/aztec/encoder/State;
    :cond_6c
    return-void
.end method

.method private static updateStateForPair(Lcom/google/zxing/aztec/encoder/State;IILjava/util/Collection;)V
    .registers 10
    .param p0, "state"    # Lcom/google/zxing/aztec/encoder/State;
    .param p1, "index"    # I
    .param p2, "pairCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/aztec/encoder/State;",
            "II",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    const/4 v5, 0x2

    const/4 v4, 0x4

    .line 263
    invoke-virtual {p0, p1}, Lcom/google/zxing/aztec/encoder/State;->endBinaryShift(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v2

    .line 265
    .local v2, "stateNoBinary":Lcom/google/zxing/aztec/encoder/State;
    invoke-virtual {v2, v4, p2}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 266
    invoke-virtual {p0}, Lcom/google/zxing/aztec/encoder/State;->getMode()I

    move-result v3

    if-eq v3, v4, :cond_1a

    .line 269
    invoke-virtual {v2, v4, p2}, Lcom/google/zxing/aztec/encoder/State;->shiftAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 271
    :cond_1a
    const/4 v3, 0x3

    if-eq p2, v3, :cond_1f

    if-ne p2, v4, :cond_2d

    .line 273
    :cond_1f
    rsub-int/lit8 v3, p2, 0x10

    .line 274
    invoke-virtual {v2, v5, v3}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v3

    const/4 v4, 0x1

    .line 275
    invoke-virtual {v3, v5, v4}, Lcom/google/zxing/aztec/encoder/State;->latchAndAppend(II)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v1

    .line 276
    .local v1, "digitState":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 278
    .end local v1    # "digitState":Lcom/google/zxing/aztec/encoder/State;
    :cond_2d
    invoke-virtual {p0}, Lcom/google/zxing/aztec/encoder/State;->getBinaryShiftByteCount()I

    move-result v3

    if-lez v3, :cond_40

    .line 281
    invoke-virtual {p0, p1}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v3

    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lcom/google/zxing/aztec/encoder/State;->addBinaryShiftChar(I)Lcom/google/zxing/aztec/encoder/State;

    move-result-object v0

    .line 282
    .local v0, "binaryState":Lcom/google/zxing/aztec/encoder/State;
    invoke-interface {p3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 284
    .end local v0    # "binaryState":Lcom/google/zxing/aztec/encoder/State;
    :cond_40
    return-void
.end method

.method private updateStateListForChar(Ljava/lang/Iterable;I)Ljava/util/Collection;
    .registers 7
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;I)",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    .prologue
    .line 206
    .local p1, "states":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/aztec/encoder/State;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 207
    .local v0, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_19

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/aztec/encoder/State;

    .line 208
    .local v1, "state":Lcom/google/zxing/aztec/encoder/State;
    invoke-direct {p0, v1, p2, v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateForChar(Lcom/google/zxing/aztec/encoder/State;ILjava/util/Collection;)V

    goto :goto_9

    .line 210
    .end local v1    # "state":Lcom/google/zxing/aztec/encoder/State;
    :cond_19
    invoke-static {v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v2

    return-object v2
.end method

.method private static updateStateListForPair(Ljava/lang/Iterable;II)Ljava/util/Collection;
    .registers 7
    .param p1, "index"    # I
    .param p2, "pairCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;II)",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/aztec/encoder/State;",
            ">;"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, "states":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/google/zxing/aztec/encoder/State;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 256
    .local v0, "result":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_19

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/aztec/encoder/State;

    .line 257
    .local v1, "state":Lcom/google/zxing/aztec/encoder/State;
    invoke-static {v1, p1, p2, v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateForPair(Lcom/google/zxing/aztec/encoder/State;IILjava/util/Collection;)V

    goto :goto_9

    .line 259
    .end local v1    # "state":Lcom/google/zxing/aztec/encoder/State;
    :cond_19
    invoke-static {v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->simplifyStates(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public encode()Lcom/google/zxing/common/BitArray;
    .registers 10

    .prologue
    const/16 v8, 0x20

    const/4 v5, 0x0

    .line 161
    sget-object v6, Lcom/google/zxing/aztec/encoder/State;->INITIAL_STATE:Lcom/google/zxing/aztec/encoder/State;

    invoke-static {v6}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 162
    .local v4, "states":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/aztec/encoder/State;>;"
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_a
    iget-object v6, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    array-length v6, v6

    if-ge v0, v6, :cond_50

    .line 164
    add-int/lit8 v6, v0, 0x1

    iget-object v7, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    array-length v7, v7

    if-ge v6, v7, :cond_2f

    iget-object v6, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    add-int/lit8 v7, v0, 0x1

    aget-byte v2, v6, v7

    .line 165
    .local v2, "nextChar":I
    :goto_1c
    iget-object v6, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    aget-byte v6, v6, v0

    sparse-switch v6, :sswitch_data_62

    .line 179
    const/4 v3, 0x0

    .line 181
    .local v3, "pairCode":I
    :goto_24
    if-lez v3, :cond_4b

    .line 184
    invoke-static {v4, v0, v3}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateListForPair(Ljava/lang/Iterable;II)Ljava/util/Collection;

    move-result-object v4

    .line 185
    add-int/lit8 v0, v0, 0x1

    .line 162
    :goto_2c
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .end local v2    # "nextChar":I
    .end local v3    # "pairCode":I
    :cond_2f
    move v2, v5

    .line 164
    goto :goto_1c

    .line 167
    .restart local v2    # "nextChar":I
    :sswitch_31
    const/16 v6, 0xa

    if-ne v2, v6, :cond_37

    const/4 v3, 0x2

    .line 168
    .restart local v3    # "pairCode":I
    :goto_36
    goto :goto_24

    .end local v3    # "pairCode":I
    :cond_37
    move v3, v5

    .line 167
    goto :goto_36

    .line 170
    :sswitch_39
    if-ne v2, v8, :cond_3d

    const/4 v3, 0x3

    .line 171
    .restart local v3    # "pairCode":I
    :goto_3c
    goto :goto_24

    .end local v3    # "pairCode":I
    :cond_3d
    move v3, v5

    .line 170
    goto :goto_3c

    .line 173
    :sswitch_3f
    if-ne v2, v8, :cond_43

    const/4 v3, 0x4

    .line 174
    .restart local v3    # "pairCode":I
    :goto_42
    goto :goto_24

    .end local v3    # "pairCode":I
    :cond_43
    move v3, v5

    .line 173
    goto :goto_42

    .line 176
    :sswitch_45
    if-ne v2, v8, :cond_49

    const/4 v3, 0x5

    .line 177
    .restart local v3    # "pairCode":I
    :goto_48
    goto :goto_24

    .end local v3    # "pairCode":I
    :cond_49
    move v3, v5

    .line 176
    goto :goto_48

    .line 188
    .restart local v3    # "pairCode":I
    :cond_4b
    invoke-direct {p0, v4, v0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->updateStateListForChar(Ljava/lang/Iterable;I)Ljava/util/Collection;

    move-result-object v4

    goto :goto_2c

    .line 192
    .end local v2    # "nextChar":I
    .end local v3    # "pairCode":I
    :cond_50
    new-instance v5, Lcom/google/zxing/aztec/encoder/HighLevelEncoder$1;

    invoke-direct {v5, p0}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder$1;-><init>(Lcom/google/zxing/aztec/encoder/HighLevelEncoder;)V

    invoke-static {v4, v5}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/aztec/encoder/State;

    .line 199
    .local v1, "minState":Lcom/google/zxing/aztec/encoder/State;
    iget-object v5, p0, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->text:[B

    invoke-virtual {v1, v5}, Lcom/google/zxing/aztec/encoder/State;->toBitArray([B)Lcom/google/zxing/common/BitArray;

    move-result-object v5

    return-object v5

    .line 165
    :sswitch_data_62
    .sparse-switch
        0xd -> :sswitch_31
        0x2c -> :sswitch_3f
        0x2e -> :sswitch_39
        0x3a -> :sswitch_45
    .end sparse-switch
.end method
