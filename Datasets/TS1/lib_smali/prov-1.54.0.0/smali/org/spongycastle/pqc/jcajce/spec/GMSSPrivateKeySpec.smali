.class public Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;
.super Ljava/lang/Object;
.source "GMSSPrivateKeySpec.java"

# interfaces
.implements Ljava/security/spec/KeySpec;


# instance fields
.field private currentAuthPath:[[[B

.field private currentRetain:[[Ljava/util/Vector;

.field private currentRootSig:[[B

.field private currentSeed:[[B

.field private currentStack:[Ljava/util/Vector;

.field private currentTreehash:[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

.field private gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

.field private index:[I

.field private keep:[[[B

.field private minTreehash:[I

.field private nextAuthPath:[[[B

.field private nextNextLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

.field private nextNextRoot:[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

.field private nextNextSeed:[[B

.field private nextRetain:[[Ljava/util/Vector;

.field private nextRoot:[[B

.field private nextRootSig:[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;

.field private nextStack:[Ljava/util/Vector;

.field private nextTreehash:[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

.field private upperLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

.field private upperTreehashLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;


# direct methods
.method public constructor <init>([I[[B[[B[[[B[[[B[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;[Ljava/util/Vector;[Ljava/util/Vector;[[Ljava/util/Vector;[[Ljava/util/Vector;[[[B[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;[I[[B[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;[[B[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;)V
    .registers 23
    .param p1, "index"    # [I
    .param p2, "currentSeed"    # [[B
    .param p3, "nextNextSeed"    # [[B
    .param p4, "currentAuthPath"    # [[[B
    .param p5, "nextAuthPath"    # [[[B
    .param p6, "currentTreehash"    # [[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    .param p7, "nextTreehash"    # [[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    .param p8, "currentStack"    # [Ljava/util/Vector;
    .param p9, "nextStack"    # [Ljava/util/Vector;
    .param p10, "currentRetain"    # [[Ljava/util/Vector;
    .param p11, "nextRetain"    # [[Ljava/util/Vector;
    .param p12, "keep"    # [[[B
    .param p13, "nextNextLeaf"    # [Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;
    .param p14, "upperLeaf"    # [Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;
    .param p15, "upperTreehashLeaf"    # [Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;
    .param p16, "minTreehash"    # [I
    .param p17, "nextRoot"    # [[B
    .param p18, "nextNextRoot"    # [Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;
    .param p19, "currentRootSig"    # [[B
    .param p20, "nextRootSig"    # [Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;
    .param p21, "gmssParameterset"    # Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->index:[I

    .line 95
    iput-object p2, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentSeed:[[B

    .line 96
    iput-object p3, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextNextSeed:[[B

    .line 97
    iput-object p4, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentAuthPath:[[[B

    .line 98
    iput-object p5, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextAuthPath:[[[B

    .line 99
    iput-object p6, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentTreehash:[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 100
    iput-object p7, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextTreehash:[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 101
    iput-object p8, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentStack:[Ljava/util/Vector;

    .line 102
    iput-object p9, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextStack:[Ljava/util/Vector;

    .line 103
    iput-object p10, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentRetain:[[Ljava/util/Vector;

    .line 104
    iput-object p11, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextRetain:[[Ljava/util/Vector;

    .line 105
    iput-object p12, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->keep:[[[B

    .line 106
    iput-object p13, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextNextLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    .line 107
    iput-object p14, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->upperLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    .line 108
    move-object/from16 v0, p15

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->upperTreehashLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    .line 109
    move-object/from16 v0, p16

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->minTreehash:[I

    .line 110
    move-object/from16 v0, p17

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextRoot:[[B

    .line 111
    move-object/from16 v0, p18

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextNextRoot:[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .line 112
    move-object/from16 v0, p19

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentRootSig:[[B

    .line 113
    move-object/from16 v0, p20

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextRootSig:[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;

    .line 114
    move-object/from16 v0, p21

    iput-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    .line 115
    return-void
.end method

.method private static clone([Ljava/util/Vector;)[Ljava/util/Vector;
    .registers 5
    .param p0, "data"    # [Ljava/util/Vector;

    .prologue
    .line 324
    if-nez p0, :cond_4

    .line 326
    const/4 v0, 0x0

    .line 335
    :cond_3
    return-object v0

    .line 328
    :cond_4
    array-length v2, p0

    new-array v0, v2, [Ljava/util/Vector;

    .line 330
    .local v0, "copy":[Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    array-length v2, p0

    if-eq v1, v2, :cond_3

    .line 332
    new-instance v2, Ljava/util/Vector;

    aget-object v3, p0, v1

    invoke-direct {v2, v3}, Ljava/util/Vector;-><init>(Ljava/util/Collection;)V

    aput-object v2, v0, v1

    .line 330
    add-int/lit8 v1, v1, 0x1

    goto :goto_8
.end method

.method private static clone([Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;)[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;
    .registers 4
    .param p0, "data"    # [Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    .prologue
    const/4 v2, 0x0

    .line 224
    if-nez p0, :cond_5

    .line 226
    const/4 v0, 0x0

    .line 232
    :goto_4
    return-object v0

    .line 228
    :cond_5
    array-length v1, p0

    new-array v0, v1, [Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    .line 230
    .local v0, "copy":[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method private static clone([Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;)[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;
    .registers 4
    .param p0, "data"    # [Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .prologue
    const/4 v2, 0x0

    .line 237
    if-nez p0, :cond_5

    .line 239
    const/4 v0, 0x0

    .line 245
    :goto_4
    return-object v0

    .line 241
    :cond_5
    array-length v1, p0

    new-array v0, v1, [Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    .line 243
    .local v0, "copy":[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method private static clone([Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;)[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;
    .registers 4
    .param p0, "data"    # [Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;

    .prologue
    const/4 v2, 0x0

    .line 250
    if-nez p0, :cond_5

    .line 252
    const/4 v0, 0x0

    .line 258
    :goto_4
    return-object v0

    .line 254
    :cond_5
    array-length v1, p0

    new-array v0, v1, [Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;

    .line 256
    .local v0, "copy":[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method private static clone([Lorg/spongycastle/pqc/crypto/gmss/Treehash;)[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    .registers 4
    .param p0, "data"    # [Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .prologue
    const/4 v2, 0x0

    .line 295
    if-nez p0, :cond_5

    .line 297
    const/4 v0, 0x0

    .line 303
    :goto_4
    return-object v0

    .line 299
    :cond_5
    array-length v1, p0

    new-array v0, v1, [Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 301
    .local v0, "copy":[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method private static clone([[B)[[B
    .registers 4
    .param p0, "data"    # [[B

    .prologue
    .line 263
    if-nez p0, :cond_6

    .line 265
    const/4 v2, 0x0

    check-cast v2, [[B

    .line 274
    :goto_5
    return-object v2

    .line 267
    :cond_6
    array-length v2, p0

    new-array v0, v2, [[B

    .line 269
    .local v0, "copy":[[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v2, p0

    if-eq v1, v2, :cond_18

    .line 271
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v2

    aput-object v2, v0, v1

    .line 269
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_18
    move-object v2, v0

    .line 274
    goto :goto_5
.end method

.method private static clone([[Ljava/util/Vector;)[[Ljava/util/Vector;
    .registers 4
    .param p0, "data"    # [[Ljava/util/Vector;

    .prologue
    .line 340
    if-nez p0, :cond_6

    .line 342
    const/4 v2, 0x0

    check-cast v2, [[Ljava/util/Vector;

    .line 351
    :goto_5
    return-object v2

    .line 344
    :cond_6
    array-length v2, p0

    new-array v0, v2, [[Ljava/util/Vector;

    .line 346
    .local v0, "copy":[[Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v2, p0

    if-eq v1, v2, :cond_18

    .line 348
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Ljava/util/Vector;)[Ljava/util/Vector;

    move-result-object v2

    aput-object v2, v0, v1

    .line 346
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_18
    move-object v2, v0

    .line 351
    goto :goto_5
.end method

.method private static clone([[Lorg/spongycastle/pqc/crypto/gmss/Treehash;)[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    .registers 4
    .param p0, "data"    # [[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .prologue
    .line 308
    if-nez p0, :cond_6

    .line 310
    const/4 v2, 0x0

    check-cast v2, [[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 319
    :goto_5
    return-object v2

    .line 312
    :cond_6
    array-length v2, p0

    new-array v0, v2, [[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    .line 314
    .local v0, "copy":[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v2, p0

    if-eq v1, v2, :cond_18

    .line 316
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Lorg/spongycastle/pqc/crypto/gmss/Treehash;)[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    move-result-object v2

    aput-object v2, v0, v1

    .line 314
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_18
    move-object v2, v0

    .line 319
    goto :goto_5
.end method

.method private static clone([[[B)[[[B
    .registers 4
    .param p0, "data"    # [[[B

    .prologue
    .line 279
    if-nez p0, :cond_6

    .line 281
    const/4 v2, 0x0

    check-cast v2, [[[B

    .line 290
    :goto_5
    return-object v2

    .line 283
    :cond_6
    array-length v2, p0

    new-array v0, v2, [[[B

    .line 285
    .local v0, "copy":[[[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v2, p0

    if-eq v1, v2, :cond_18

    .line 287
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[B)[[B

    move-result-object v2

    aput-object v2, v0, v1

    .line 285
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_18
    move-object v2, v0

    .line 290
    goto :goto_5
.end method


# virtual methods
.method public getCurrentAuthPath()[[[B
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentAuthPath:[[[B

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[[B)[[[B

    move-result-object v0

    return-object v0
.end method

.method public getCurrentRetain()[[Ljava/util/Vector;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentRetain:[[Ljava/util/Vector;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[Ljava/util/Vector;)[[Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentRootSig()[[B
    .registers 2

    .prologue
    .line 219
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentRootSig:[[B

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[B)[[B

    move-result-object v0

    return-object v0
.end method

.method public getCurrentSeed()[[B
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentSeed:[[B

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[B)[[B

    move-result-object v0

    return-object v0
.end method

.method public getCurrentStack()[Ljava/util/Vector;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentStack:[Ljava/util/Vector;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Ljava/util/Vector;)[Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentTreehash()[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->currentTreehash:[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[Lorg/spongycastle/pqc/crypto/gmss/Treehash;)[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    move-result-object v0

    return-object v0
.end method

.method public getGmssPS()Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->gmssPS:Lorg/spongycastle/pqc/crypto/gmss/GMSSParameters;

    return-object v0
.end method

.method public getIndex()[I
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->index:[I

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    return-object v0
.end method

.method public getKeep()[[[B
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->keep:[[[B

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[[B)[[[B

    move-result-object v0

    return-object v0
.end method

.method public getMinTreehash()[I
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->minTreehash:[I

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    return-object v0
.end method

.method public getNextAuthPath()[[[B
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextAuthPath:[[[B

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[[B)[[[B

    move-result-object v0

    return-object v0
.end method

.method public getNextNextLeaf()[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextNextLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;)[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    move-result-object v0

    return-object v0
.end method

.method public getNextNextRoot()[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextNextRoot:[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;)[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootCalc;

    move-result-object v0

    return-object v0
.end method

.method public getNextNextSeed()[[B
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextNextSeed:[[B

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[B)[[B

    move-result-object v0

    return-object v0
.end method

.method public getNextRetain()[[Ljava/util/Vector;
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextRetain:[[Ljava/util/Vector;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[Ljava/util/Vector;)[[Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public getNextRoot()[[B
    .registers 2

    .prologue
    .line 209
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextRoot:[[B

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[B)[[B

    move-result-object v0

    return-object v0
.end method

.method public getNextRootSig()[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextRootSig:[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;)[Lorg/spongycastle/pqc/crypto/gmss/GMSSRootSig;

    move-result-object v0

    return-object v0
.end method

.method public getNextStack()[Ljava/util/Vector;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextStack:[Ljava/util/Vector;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Ljava/util/Vector;)[Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public getNextTreehash()[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->nextTreehash:[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([[Lorg/spongycastle/pqc/crypto/gmss/Treehash;)[[Lorg/spongycastle/pqc/crypto/gmss/Treehash;

    move-result-object v0

    return-object v0
.end method

.method public getUpperLeaf()[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->upperLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;)[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    move-result-object v0

    return-object v0
.end method

.method public getUpperTreehashLeaf()[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->upperTreehashLeaf:[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    invoke-static {v0}, Lorg/spongycastle/pqc/jcajce/spec/GMSSPrivateKeySpec;->clone([Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;)[Lorg/spongycastle/pqc/crypto/gmss/GMSSLeaf;

    move-result-object v0

    return-object v0
.end method
