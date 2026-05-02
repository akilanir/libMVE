.class public Lorg/jsoup/parser/TokenQueue;
.super Ljava/lang/Object;
.source "TokenQueue.java"


# static fields
.field private static final ESC:C = '\\'


# instance fields
.field private pos:I

.field private queue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x0

    iput v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 22
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 23
    iput-object p1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    .line 24
    return-void
.end method

.method private remainingLength()I
    .registers 3

    .prologue
    .line 35
    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x5c

    .line 292
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 293
    .local v2, "out":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 294
    .local v1, "last":C
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    array-length v5, v4

    const/4 v3, 0x0

    :goto_e
    if-ge v3, v5, :cond_23

    aget-char v0, v4, v3

    .line 295
    .local v0, "c":C
    if-ne v0, v6, :cond_1f

    .line 296
    if-eqz v1, :cond_1b

    if-ne v1, v6, :cond_1b

    .line 297
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 301
    :cond_1b
    :goto_1b
    move v1, v0

    .line 294
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 300
    :cond_1f
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1b

    .line 303
    .end local v0    # "c":C
    :cond_23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public addFirst(Ljava/lang/Character;)V
    .registers 3
    .param p1, "c"    # Ljava/lang/Character;

    .prologue
    .line 51
    invoke-virtual {p1}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/TokenQueue;->addFirst(Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public addFirst(Ljava/lang/String;)V
    .registers 5
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    .line 61
    const/4 v0, 0x0

    iput v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 62
    return-void
.end method

.method public advance()V
    .registers 2

    .prologue
    .line 147
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c

    iget v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 148
    :cond_c
    return-void
.end method

.method public chompBalanced(CC)Ljava/lang/String;
    .registers 9
    .param p1, "open"    # C
    .param p2, "close"    # C

    .prologue
    .line 261
    const/4 v4, -0x1

    .line 262
    .local v4, "start":I
    const/4 v2, -0x1

    .line 263
    .local v2, "end":I
    const/4 v1, 0x0

    .line 264
    .local v1, "depth":I
    const/4 v3, 0x0

    .line 267
    .local v3, "last":C
    :cond_4
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_13

    .line 283
    :goto_a
    if-ltz v2, :cond_4c

    iget-object v5, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v5, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    :goto_12
    return-object v5

    .line 268
    :cond_13
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->consume()C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    .line 269
    .local v0, "c":Ljava/lang/Character;
    if-eqz v3, :cond_21

    const/16 v5, 0x5c

    if-eq v3, v5, :cond_32

    .line 270
    :cond_21
    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/Character;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3f

    .line 271
    add-int/lit8 v1, v1, 0x1

    .line 272
    const/4 v5, -0x1

    if-ne v4, v5, :cond_32

    .line 273
    iget v4, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 279
    :cond_32
    :goto_32
    if-lez v1, :cond_38

    if-eqz v3, :cond_38

    .line 280
    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 281
    :cond_38
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    .line 282
    if-gtz v1, :cond_4

    goto :goto_a

    .line 275
    :cond_3f
    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/Character;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 276
    add-int/lit8 v1, v1, -0x1

    goto :goto_32

    .line 283
    .end local v0    # "c":Ljava/lang/Character;
    :cond_4c
    const-string v5, ""

    goto :goto_12
.end method

.method public chompTo(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 240
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/TokenQueue;->consumeTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    .line 242
    return-object v0
.end method

.method public chompToIgnoreCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 246
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/TokenQueue;->consumeToIgnoreCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 247
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    .line 248
    return-object v0
.end method

.method public consume()C
    .registers 4

    .prologue
    .line 155
    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public consume(Ljava/lang/String;)V
    .registers 5
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 166
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 167
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Queue did not match expected sequence"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 168
    :cond_e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 169
    .local v0, "len":I
    invoke-direct {p0}, Lorg/jsoup/parser/TokenQueue;->remainingLength()I

    move-result v1

    if-le v0, v1, :cond_20

    .line 170
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Queue not long enough to consume sequence"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 172
    :cond_20
    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 173
    return-void
.end method

.method public consumeAttributeKey()Ljava/lang/String;
    .registers 4

    .prologue
    .line 374
    iget v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 375
    .local v0, "start":I
    :goto_2
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_21

    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->matchesWord()Z

    move-result v1

    if-nez v1, :cond_1a

    const/4 v1, 0x3

    new-array v1, v1, [C

    fill-array-data v1, :array_2a

    invoke-virtual {p0, v1}, Lorg/jsoup/parser/TokenQueue;->matchesAny([C)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 376
    :cond_1a
    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_2

    .line 378
    :cond_21
    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 375
    :array_2a
    .array-data 2
        0x2ds
        0x5fs
        0x3as
    .end array-data
.end method

.method public consumeCssIdentifier()Ljava/lang/String;
    .registers 4

    .prologue
    .line 362
    iget v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 363
    .local v0, "start":I
    :goto_2
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_21

    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->matchesWord()Z

    move-result v1

    if-nez v1, :cond_1a

    const/4 v1, 0x2

    new-array v1, v1, [C

    fill-array-data v1, :array_2a

    invoke-virtual {p0, v1}, Lorg/jsoup/parser/TokenQueue;->matchesAny([C)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 364
    :cond_1a
    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_2

    .line 366
    :cond_21
    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 363
    :array_2a
    .array-data 2
        0x2ds
        0x5fs
    .end array-data
.end method

.method public consumeElementSelector()Ljava/lang/String;
    .registers 4

    .prologue
    .line 349
    iget v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 350
    .local v0, "start":I
    :goto_2
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_21

    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->matchesWord()Z

    move-result v1

    if-nez v1, :cond_1a

    const/4 v1, 0x3

    new-array v1, v1, [C

    fill-array-data v1, :array_2a

    invoke-virtual {p0, v1}, Lorg/jsoup/parser/TokenQueue;->matchesAny([C)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 351
    :cond_1a
    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_2

    .line 353
    :cond_21
    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 350
    :array_2a
    .array-data 2
        0x7cs
        0x5fs
        0x2ds
    .end array-data
.end method

.method public consumeTagName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 336
    iget v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 337
    .local v0, "start":I
    :goto_2
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_21

    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->matchesWord()Z

    move-result v1

    if-nez v1, :cond_1a

    const/4 v1, 0x3

    new-array v1, v1, [C

    fill-array-data v1, :array_2a

    invoke-virtual {p0, v1}, Lorg/jsoup/parser/TokenQueue;->matchesAny([C)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 338
    :cond_1a
    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_2

    .line 340
    :cond_21
    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 337
    :array_2a
    .array-data 2
        0x3as
        0x5fs
        0x2ds
    .end array-data
.end method

.method public consumeTo(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 181
    iget-object v2, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v3, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v2, p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 182
    .local v1, "offset":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1d

    .line 183
    iget-object v2, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v3, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 184
    .local v0, "consumed":Ljava/lang/String;
    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 187
    .end local v0    # "consumed":Ljava/lang/String;
    :goto_1c
    return-object v0

    :cond_1d
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v0

    goto :goto_1c
.end method

.method public varargs consumeToAny([Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "seq"    # [Ljava/lang/String;

    .prologue
    .line 223
    iget v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 224
    .local v0, "start":I
    :goto_2
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_15

    invoke-virtual {p0, p1}, Lorg/jsoup/parser/TokenQueue;->matchesAny([Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 225
    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_2

    .line 228
    :cond_15
    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public consumeToIgnoreCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 192
    iget v3, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 193
    .local v3, "start":I
    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 194
    .local v1, "first":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 195
    .local v0, "canScan":Z
    :goto_14
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_20

    .line 196
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 212
    :cond_20
    iget-object v4, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v5, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v4, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 199
    :cond_29
    if-eqz v0, :cond_51

    .line 200
    iget-object v4, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v5, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v4, v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    iget v5, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    sub-int v2, v4, v5

    .line 201
    .local v2, "skip":I
    if-nez v2, :cond_40

    .line 202
    iget v4, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_14

    .line 203
    :cond_40
    if-gez v2, :cond_4b

    .line 204
    iget-object v4, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    iput v4, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_14

    .line 206
    :cond_4b
    iget v4, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/2addr v4, v2

    iput v4, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_14

    .line 209
    .end local v2    # "skip":I
    :cond_51
    iget v4, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_14
.end method

.method public consumeWhitespace()Z
    .registers 3

    .prologue
    .line 311
    const/4 v0, 0x0

    .line 312
    .local v0, "seen":Z
    :goto_1
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->matchesWhitespace()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 313
    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 314
    const/4 v0, 0x1

    goto :goto_1

    .line 316
    :cond_f
    return v0
.end method

.method public consumeWord()Ljava/lang/String;
    .registers 4

    .prologue
    .line 324
    iget v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 325
    .local v0, "start":I
    :goto_2
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->matchesWord()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 326
    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    goto :goto_2

    .line 327
    :cond_f
    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/jsoup/parser/TokenQueue;->remainingLength()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public matchChomp(Ljava/lang/String;)Z
    .registers 4
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 119
    invoke-virtual {p0, p1}, Lorg/jsoup/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 120
    iget v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 121
    const/4 v0, 0x1

    .line 123
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public matches(Ljava/lang/String;)Z
    .registers 8
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    const/4 v1, 0x1

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    return v0
.end method

.method public varargs matchesAny([C)Z
    .registers 8
    .param p1, "seq"    # [C

    .prologue
    const/4 v1, 0x0

    .line 97
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 104
    :cond_7
    :goto_7
    return v1

    .line 100
    :cond_8
    array-length v3, p1

    move v2, v1

    :goto_a
    if-ge v2, v3, :cond_7

    aget-char v0, p1, v2

    .line 101
    .local v0, "c":C
    iget-object v4, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v5, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v0, :cond_1a

    .line 102
    const/4 v1, 0x1

    goto :goto_7

    .line 100
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_a
.end method

.method public varargs matchesAny([Ljava/lang/String;)Z
    .registers 7
    .param p1, "seq"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 89
    array-length v3, p1

    move v2, v1

    :goto_3
    if-ge v2, v3, :cond_e

    aget-object v0, p1, v2

    .line 90
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/jsoup/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 91
    const/4 v1, 0x1

    .line 93
    .end local v0    # "s":Ljava/lang/String;
    :cond_e
    return v1

    .line 89
    .restart local v0    # "s":Ljava/lang/String;
    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method public matchesCS(Ljava/lang/String;)Z
    .registers 4
    .param p1, "seq"    # Ljava/lang/String;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v0, p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public matchesStartTag()Z
    .registers 3

    .prologue
    .line 109
    invoke-direct {p0}, Lorg/jsoup/parser/TokenQueue;->remainingLength()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_25

    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x3c

    if-ne v0, v1, :cond_25

    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-eqz v0, :cond_25

    const/4 v0, 0x1

    :goto_24
    return v0

    :cond_25
    const/4 v0, 0x0

    goto :goto_24
.end method

.method public matchesWhitespace()Z
    .registers 3

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lorg/jsoup/helper/StringUtil;->isWhitespace(I)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public matchesWord()Z
    .registers 3

    .prologue
    .line 140
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public peek()C
    .registers 3

    .prologue
    .line 43
    invoke-virtual {p0}, Lorg/jsoup/parser/TokenQueue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_7
.end method

.method public remainder()Ljava/lang/String;
    .registers 5

    .prologue
    .line 386
    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v2, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    iget-object v3, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 387
    .local v0, "remainder":Ljava/lang/String;
    iget-object v1, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    .line 388
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 393
    iget-object v0, p0, Lorg/jsoup/parser/TokenQueue;->queue:Ljava/lang/String;

    iget v1, p0, Lorg/jsoup/parser/TokenQueue;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
