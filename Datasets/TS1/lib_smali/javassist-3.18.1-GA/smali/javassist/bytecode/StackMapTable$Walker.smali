.class public Ljavassist/bytecode/StackMapTable$Walker;
.super Ljava/lang/Object;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMapTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Walker"
.end annotation


# instance fields
.field info:[B

.field numOfEntries:I


# direct methods
.method public constructor <init>(Ljavassist/bytecode/StackMapTable;)V
    .registers 3
    .param p1, "smt"    # Ljavassist/bytecode/StackMapTable;

    .prologue
    .line 153
    invoke-virtual {p1}, Ljavassist/bytecode/StackMapTable;->get()[B

    move-result-object v0

    invoke-direct {p0, v0}, Ljavassist/bytecode/StackMapTable$Walker;-><init>([B)V

    .line 154
    return-void
.end method

.method public constructor <init>([B)V
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    iput-object p1, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    .line 166
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/StackMapTable$Walker;->numOfEntries:I

    .line 167
    return-void
.end method

.method private appendFrame(II)I
    .registers 12
    .param p1, "pos"    # I
    .param p2, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 280
    add-int/lit16 v2, p2, -0xfb

    .line 281
    .local v2, "k":I
    iget-object v7, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v8, p1, 0x1

    invoke-static {v7, v8}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 282
    .local v3, "offset":I
    new-array v6, v2, [I

    .line 283
    .local v6, "tags":[I
    new-array v0, v2, [I

    .line 284
    .local v0, "data":[I
    add-int/lit8 v4, p1, 0x3

    .line 285
    .local v4, "p":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    if-ge v1, v2, :cond_3e

    .line 286
    iget-object v7, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    aget-byte v7, v7, v4

    and-int/lit16 v5, v7, 0xff

    .line 287
    .local v5, "tag":I
    aput v5, v6, v1

    .line 288
    const/4 v7, 0x7

    if-eq v5, v7, :cond_22

    const/16 v7, 0x8

    if-ne v5, v7, :cond_38

    .line 289
    :cond_22
    iget-object v7, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v8, v4, 0x1

    invoke-static {v7, v8}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v7

    aput v7, v0, v1

    .line 290
    aget v7, v0, v1

    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p0, v5, v7, v8}, Ljavassist/bytecode/StackMapTable$Walker;->objectOrUninitialized(III)V

    .line 291
    add-int/lit8 v4, v4, 0x3

    .line 285
    :goto_35
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 294
    :cond_38
    const/4 v7, 0x0

    aput v7, v0, v1

    .line 295
    add-int/lit8 v4, v4, 0x1

    goto :goto_35

    .line 299
    .end local v5    # "tag":I
    :cond_3e
    invoke-virtual {p0, p1, v3, v6, v0}, Ljavassist/bytecode/StackMapTable$Walker;->appendFrame(II[I[I)V

    .line 300
    return v4
.end method

.method private fullFrame(I)I
    .registers 12
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 316
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v1, p1, 0x1

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v2

    .line 317
    .local v2, "offset":I
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v1, p1, 0x3

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v8

    .line 318
    .local v8, "numOfLocals":I
    new-array v3, v8, [I

    .line 319
    .local v3, "localsTags":[I
    new-array v4, v8, [I

    .line 320
    .local v4, "localsData":[I
    add-int/lit8 v0, p1, 0x5

    invoke-direct {p0, v0, v8, v3, v4}, Ljavassist/bytecode/StackMapTable$Walker;->verifyTypeInfo(II[I[I)I

    move-result v9

    .line 321
    .local v9, "p":I
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    invoke-static {v0, v9}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v7

    .line 322
    .local v7, "numOfItems":I
    new-array v5, v7, [I

    .line 323
    .local v5, "itemsTags":[I
    new-array v6, v7, [I

    .line 324
    .local v6, "itemsData":[I
    add-int/lit8 v0, v9, 0x2

    invoke-direct {p0, v0, v7, v5, v6}, Ljavassist/bytecode/StackMapTable$Walker;->verifyTypeInfo(II[I[I)I

    move-result v9

    move-object v0, p0

    move v1, p1

    .line 325
    invoke-virtual/range {v0 .. v6}, Ljavassist/bytecode/StackMapTable$Walker;->fullFrame(II[I[I[I[I)V

    .line 326
    return v9
.end method

.method private sameLocals(II)I
    .registers 9
    .param p1, "pos"    # I
    .param p2, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 234
    move v3, p1

    .line 236
    .local v3, "top":I
    const/16 v4, 0x80

    if-ge p2, v4, :cond_2c

    .line 237
    add-int/lit8 v1, p2, -0x40

    .line 243
    .local v1, "offset":I
    :goto_7
    iget-object v4, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v5, p1, 0x1

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 244
    .local v2, "tag":I
    const/4 v0, 0x0

    .line 245
    .local v0, "data":I
    const/4 v4, 0x7

    if-eq v2, v4, :cond_17

    const/16 v4, 0x8

    if-ne v2, v4, :cond_26

    .line 246
    :cond_17
    iget-object v4, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v5, p1, 0x2

    invoke-static {v4, v5}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 247
    add-int/lit8 v4, p1, 0x2

    invoke-virtual {p0, v2, v0, v4}, Ljavassist/bytecode/StackMapTable$Walker;->objectOrUninitialized(III)V

    .line 248
    add-int/lit8 p1, p1, 0x2

    .line 251
    :cond_26
    invoke-virtual {p0, v3, v1, v2, v0}, Ljavassist/bytecode/StackMapTable$Walker;->sameLocals(IIII)V

    .line 252
    add-int/lit8 v4, p1, 0x2

    return v4

    .line 239
    .end local v0    # "data":I
    .end local v1    # "offset":I
    .end local v2    # "tag":I
    :cond_2c
    iget-object v4, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v5, p1, 0x1

    invoke-static {v4, v5}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    .line 240
    .restart local v1    # "offset":I
    add-int/lit8 p1, p1, 0x2

    goto :goto_7
.end method

.method private verifyTypeInfo(II[I[I)I
    .registers 9
    .param p1, "pos"    # I
    .param p2, "n"    # I
    .param p3, "tags"    # [I
    .param p4, "data"    # [I

    .prologue
    .line 346
    const/4 v0, 0x0

    .local v0, "i":I
    move v1, p1

    .end local p1    # "pos":I
    .local v1, "pos":I
    :goto_2
    if-ge v0, p2, :cond_28

    .line 347
    iget-object v3, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 p1, v1, 0x1

    .end local v1    # "pos":I
    .restart local p1    # "pos":I
    aget-byte v3, v3, v1

    and-int/lit16 v2, v3, 0xff

    .line 348
    .local v2, "tag":I
    aput v2, p3, v0

    .line 349
    const/4 v3, 0x7

    if-eq v2, v3, :cond_15

    const/16 v3, 0x8

    if-ne v2, v3, :cond_24

    .line 350
    :cond_15
    iget-object v3, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    invoke-static {v3, p1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    aput v3, p4, v0

    .line 351
    aget v3, p4, v0

    invoke-virtual {p0, v2, v3, p1}, Ljavassist/bytecode/StackMapTable$Walker;->objectOrUninitialized(III)V

    .line 352
    add-int/lit8 p1, p1, 0x2

    .line 346
    :cond_24
    add-int/lit8 v0, v0, 0x1

    move v1, p1

    .end local p1    # "pos":I
    .restart local v1    # "pos":I
    goto :goto_2

    .line 356
    .end local v2    # "tag":I
    :cond_28
    return v1
.end method


# virtual methods
.method public appendFrame(II[I[I)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "tags"    # [I
    .param p4, "data"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 313
    return-void
.end method

.method public chopFrame(III)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "k"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 277
    return-void
.end method

.method public fullFrame(II[I[I[I[I)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "localTags"    # [I
    .param p4, "localData"    # [I
    .param p5, "stackTags"    # [I
    .param p6, "stackData"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 343
    return-void
.end method

.method public objectOrUninitialized(III)V
    .registers 4
    .param p1, "tag"    # I
    .param p2, "data"    # I
    .param p3, "pos"    # I

    .prologue
    .line 367
    return-void
.end method

.method public parse()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 178
    iget v1, p0, Ljavassist/bytecode/StackMapTable$Walker;->numOfEntries:I

    .line 179
    .local v1, "n":I
    const/4 v2, 0x2

    .line 180
    .local v2, "pos":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v1, :cond_d

    .line 181
    invoke-virtual {p0, v2, v0}, Ljavassist/bytecode/StackMapTable$Walker;->stackMapFrames(II)I

    move-result v2

    .line 180
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 182
    :cond_d
    return-void
.end method

.method public sameFrame(II)V
    .registers 3
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 231
    return-void
.end method

.method public sameLocals(IIII)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "stackTag"    # I
    .param p4, "stackData"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 268
    return-void
.end method

.method public final size()I
    .registers 2

    .prologue
    .line 172
    iget v0, p0, Ljavassist/bytecode/StackMapTable$Walker;->numOfEntries:I

    return v0
.end method

.method stackMapFrames(II)I
    .registers 8
    .param p1, "pos"    # I
    .param p2, "nth"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/16 v4, 0xfb

    const/16 v3, 0xf7

    .line 194
    iget-object v2, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    aget-byte v2, v2, p1

    and-int/lit16 v1, v2, 0xff

    .line 195
    .local v1, "type":I
    const/16 v2, 0x40

    if-ge v1, v2, :cond_14

    .line 196
    invoke-virtual {p0, p1, v1}, Ljavassist/bytecode/StackMapTable$Walker;->sameFrame(II)V

    .line 197
    add-int/lit8 p1, p1, 0x1

    .line 220
    :goto_13
    return p1

    .line 199
    :cond_14
    const/16 v2, 0x80

    if-ge v1, v2, :cond_1d

    .line 200
    invoke-direct {p0, p1, v1}, Ljavassist/bytecode/StackMapTable$Walker;->sameLocals(II)I

    move-result p1

    goto :goto_13

    .line 201
    :cond_1d
    if-ge v1, v3, :cond_27

    .line 202
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    const-string v3, "bad frame_type in StackMapTable"

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 203
    :cond_27
    if-ne v1, v3, :cond_2e

    .line 204
    invoke-direct {p0, p1, v1}, Ljavassist/bytecode/StackMapTable$Walker;->sameLocals(II)I

    move-result p1

    goto :goto_13

    .line 205
    :cond_2e
    if-ge v1, v4, :cond_40

    .line 206
    iget-object v2, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v3, p1, 0x1

    invoke-static {v2, v3}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 207
    .local v0, "offset":I
    rsub-int v2, v1, 0xfb

    invoke-virtual {p0, p1, v0, v2}, Ljavassist/bytecode/StackMapTable$Walker;->chopFrame(III)V

    .line 208
    add-int/lit8 p1, p1, 0x3

    .line 209
    goto :goto_13

    .line 210
    .end local v0    # "offset":I
    :cond_40
    if-ne v1, v4, :cond_50

    .line 211
    iget-object v2, p0, Ljavassist/bytecode/StackMapTable$Walker;->info:[B

    add-int/lit8 v3, p1, 0x1

    invoke-static {v2, v3}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 212
    .restart local v0    # "offset":I
    invoke-virtual {p0, p1, v0}, Ljavassist/bytecode/StackMapTable$Walker;->sameFrame(II)V

    .line 213
    add-int/lit8 p1, p1, 0x3

    .line 214
    goto :goto_13

    .line 215
    .end local v0    # "offset":I
    :cond_50
    const/16 v2, 0xff

    if-ge v1, v2, :cond_59

    .line 216
    invoke-direct {p0, p1, v1}, Ljavassist/bytecode/StackMapTable$Walker;->appendFrame(II)I

    move-result p1

    goto :goto_13

    .line 218
    :cond_59
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMapTable$Walker;->fullFrame(I)I

    move-result p1

    goto :goto_13
.end method
