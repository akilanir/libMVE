.class public Lcom/larvalabs/svgandroid/ParserHelper;
.super Ljava/lang/Object;
.source "ParserHelper.java"


# static fields
.field private static final STRING_CHARS:Ljava/lang/reflect/Field;

.field private static final pow10:[D


# instance fields
.field private current:C

.field private final n:I

.field public pos:I

.field private final s:[C


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    .line 24
    :try_start_0
    const-class v2, Ljava/lang/String;

    const-string v3, "value"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    sput-object v2, Lcom/larvalabs/svgandroid/ParserHelper;->STRING_CHARS:Ljava/lang/reflect/Field;

    .line 25
    sget-object v2, Lcom/larvalabs/svgandroid/ParserHelper;->STRING_CHARS:Ljava/lang/reflect/Field;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_2a

    .line 383
    const/16 v2, 0x80

    new-array v2, v2, [D

    sput-object v2, Lcom/larvalabs/svgandroid/ParserHelper;->pow10:[D

    .line 386
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    sget-object v2, Lcom/larvalabs/svgandroid/ParserHelper;->pow10:[D

    array-length v2, v2

    if-ge v1, v2, :cond_31

    .line 387
    sget-object v2, Lcom/larvalabs/svgandroid/ParserHelper;->pow10:[D

    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    int-to-double v5, v1

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    aput-wide v3, v2, v1

    .line 386
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 26
    .end local v1    # "i":I
    :catch_2a
    move-exception v0

    .line 27
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 389
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "i":I
    :cond_31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 5
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "pos"    # I

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    :try_start_3
    sget-object v1, Lcom/larvalabs/svgandroid/ParserHelper;->STRING_CHARS:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [C

    check-cast v1, [C

    iput-object v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->s:[C
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_f} :catch_1d

    .line 42
    iput p2, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    .line 43
    iget-object v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->s:[C

    array-length v1, v1

    iput v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->n:I

    .line 44
    iget-object v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->s:[C

    aget-char v1, v1, p2

    iput-char v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 45
    return-void

    .line 39
    :catch_1d
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static buildFloat(II)F
    .registers 6
    .param p0, "mant"    # I
    .param p1, "exp"    # I

    .prologue
    .line 361
    const/16 v0, -0x7d

    if-lt p1, v0, :cond_6

    if-nez p0, :cond_8

    .line 362
    :cond_6
    const/4 v0, 0x0

    .line 377
    :goto_7
    return v0

    .line 365
    :cond_8
    const/16 v0, 0x80

    if-lt p1, v0, :cond_14

    .line 366
    if-lez p0, :cond_11

    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    goto :goto_7

    :cond_11
    const/high16 v0, -0x800000    # Float.NEGATIVE_INFINITY

    goto :goto_7

    .line 369
    :cond_14
    if-nez p1, :cond_18

    .line 370
    int-to-float v0, p0

    goto :goto_7

    .line 373
    :cond_18
    const/high16 v0, 0x4000000

    if-lt p0, v0, :cond_1e

    .line 374
    add-int/lit8 p0, p0, 0x1

    .line 377
    :cond_1e
    if-lez p1, :cond_28

    int-to-double v0, p0

    sget-object v2, Lcom/larvalabs/svgandroid/ParserHelper;->pow10:[D

    aget-wide v2, v2, p1

    mul-double/2addr v0, v2

    :goto_26
    double-to-float v0, v0

    goto :goto_7

    :cond_28
    int-to-double v0, p0

    sget-object v2, Lcom/larvalabs/svgandroid/ParserHelper;->pow10:[D

    neg-int v3, p1

    aget-wide v2, v2, v3

    div-double/2addr v0, v2

    goto :goto_26
.end method

.method private read()C
    .registers 3

    .prologue
    .line 48
    iget v0, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    iget v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->n:I

    if-ge v0, v1, :cond_c

    .line 49
    iget v0, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    .line 51
    :cond_c
    iget v0, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    iget v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->n:I

    if-ne v0, v1, :cond_14

    .line 52
    const/4 v0, 0x0

    .line 54
    :goto_13
    return v0

    :cond_14
    iget-object v0, p0, Lcom/larvalabs/svgandroid/ParserHelper;->s:[C

    iget v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    aget-char v0, v0, v1

    goto :goto_13
.end method

.method private reportUnexpectedCharacterError(C)V
    .registers 5
    .param p1, "c"    # C

    .prologue
    .line 354
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected char \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public advance()V
    .registers 2

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v0

    iput-char v0, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 86
    return-void
.end method

.method public nextFlag()I
    .registers 3

    .prologue
    .line 399
    invoke-virtual {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->skipWhitespace()V

    .line 400
    iget-char v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    add-int/lit8 v0, v1, -0x30

    .line 401
    .local v0, "flag":I
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v1

    iput-char v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 402
    invoke-virtual {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->skipNumberSeparator()V

    .line 403
    return v0
.end method

.method public nextFloat()F
    .registers 2

    .prologue
    .line 392
    invoke-virtual {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->skipWhitespace()V

    .line 393
    invoke-virtual {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->parseFloat()F

    move-result v0

    .line 394
    .local v0, "f":F
    invoke-virtual {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->skipNumberSeparator()V

    .line 395
    return v0
.end method

.method public parseFloat()F
    .registers 13

    .prologue
    const/16 v11, 0x9

    const/4 v8, 0x0

    .line 92
    const/4 v4, 0x0

    .line 93
    .local v4, "mant":I
    const/4 v5, 0x0

    .line 94
    .local v5, "mantDig":I
    const/4 v6, 0x1

    .line 95
    .local v6, "mantPos":Z
    const/4 v7, 0x0

    .line 97
    .local v7, "mantRead":Z
    const/4 v0, 0x0

    .line 98
    .local v0, "exp":I
    const/4 v2, 0x0

    .line 99
    .local v2, "expDig":I
    const/4 v1, 0x0

    .line 100
    .local v1, "expAdj":I
    const/4 v3, 0x1

    .line 102
    .local v3, "expPos":Z
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v9, :pswitch_data_ee

    .line 110
    :goto_10
    :pswitch_10
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v9, :pswitch_data_f8

    .line 112
    :pswitch_15
    const/high16 v8, 0x7fc00000    # Float.NaN

    .line 350
    :cond_17
    :goto_17
    return v8

    .line 104
    :pswitch_18
    const/4 v6, 0x0

    .line 107
    :pswitch_19
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v9

    iput-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    goto :goto_10

    .line 118
    :pswitch_20
    const/4 v7, 0x1

    .line 120
    :sswitch_21
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v9

    iput-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 121
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    sparse-switch v9, :sswitch_data_114

    goto :goto_17

    .line 177
    :goto_2d
    :pswitch_2d
    :sswitch_2d
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    const/16 v10, 0x2e

    if-ne v9, v10, :cond_73

    .line 178
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v9

    iput-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 179
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v9, :pswitch_data_14a

    .line 183
    if-nez v7, :cond_73

    .line 184
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    invoke-direct {p0, v9}, Lcom/larvalabs/svgandroid/ParserHelper;->reportUnexpectedCharacterError(C)V

    goto :goto_17

    .line 151
    :pswitch_46
    :sswitch_46
    const/4 v7, 0x1

    .line 153
    :pswitch_47
    if-ge v5, v11, :cond_5f

    .line 154
    add-int/lit8 v5, v5, 0x1

    .line 155
    mul-int/lit8 v9, v4, 0xa

    iget-char v10, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    add-int/lit8 v10, v10, -0x30

    add-int v4, v9, v10

    .line 159
    :goto_53
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v9

    iput-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 160
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v9, :pswitch_data_162

    goto :goto_2d

    .line 157
    :cond_5f
    add-int/lit8 v1, v1, 0x1

    goto :goto_53

    .line 190
    :pswitch_62
    if-nez v5, :cond_84

    .line 192
    :pswitch_64
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v9

    iput-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 193
    add-int/lit8 v1, v1, -0x1

    .line 194
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v9, :pswitch_data_17a

    .line 206
    if-eqz v7, :cond_17

    .line 248
    :cond_73
    :goto_73
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    sparse-switch v9, :sswitch_data_192

    .line 342
    :goto_78
    if-nez v3, :cond_7b

    .line 343
    neg-int v0, v0

    .line 345
    :cond_7b
    add-int/2addr v0, v1

    .line 346
    if-nez v6, :cond_7f

    .line 347
    neg-int v4, v4

    .line 350
    :cond_7f
    invoke-static {v4, v0}, Lcom/larvalabs/svgandroid/ParserHelper;->buildFloat(II)F

    move-result v8

    goto :goto_17

    .line 224
    :cond_84
    :pswitch_84
    if-ge v5, v11, :cond_92

    .line 225
    add-int/lit8 v5, v5, 0x1

    .line 226
    mul-int/lit8 v9, v4, 0xa

    iget-char v10, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    add-int/lit8 v10, v10, -0x30

    add-int v4, v9, v10

    .line 227
    add-int/lit8 v1, v1, -0x1

    .line 229
    :cond_92
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v9

    iput-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 230
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v9, :pswitch_data_19c

    goto :goto_73

    .line 251
    :sswitch_9e
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v9

    iput-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 252
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v9, :pswitch_data_1b4

    .line 254
    :pswitch_a9
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    invoke-direct {p0, v9}, Lcom/larvalabs/svgandroid/ParserHelper;->reportUnexpectedCharacterError(C)V

    goto/16 :goto_17

    .line 257
    :pswitch_b0
    const/4 v3, 0x0

    .line 259
    :pswitch_b1
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v9

    iput-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 260
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v9, :pswitch_data_1d6

    .line 262
    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    invoke-direct {p0, v9}, Lcom/larvalabs/svgandroid/ParserHelper;->reportUnexpectedCharacterError(C)V

    goto/16 :goto_17

    .line 287
    :pswitch_c3
    iget-char v8, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v8, :pswitch_data_1ee

    goto :goto_78

    .line 290
    :pswitch_c9
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v8

    iput-char v8, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 291
    iget-char v8, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v8, :pswitch_data_206

    goto :goto_78

    .line 318
    :pswitch_d5
    const/4 v8, 0x3

    if-ge v2, v8, :cond_e2

    .line 319
    add-int/lit8 v2, v2, 0x1

    .line 320
    mul-int/lit8 v8, v0, 0xa

    iget-char v9, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    add-int/lit8 v9, v9, -0x30

    add-int v0, v8, v9

    .line 322
    :cond_e2
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->read()C

    move-result v8

    iput-char v8, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    .line 323
    iget-char v8, p0, Lcom/larvalabs/svgandroid/ParserHelper;->current:C

    packed-switch v8, :pswitch_data_21e

    goto :goto_78

    .line 102
    :pswitch_data_ee
    .packed-switch 0x2b
        :pswitch_19
        :pswitch_10
        :pswitch_18
    .end packed-switch

    .line 110
    :pswitch_data_f8
    .packed-switch 0x2e
        :pswitch_2d
        :pswitch_15
        :pswitch_20
        :pswitch_46
        :pswitch_46
        :pswitch_46
        :pswitch_46
        :pswitch_46
        :pswitch_46
        :pswitch_46
        :pswitch_46
        :pswitch_46
    .end packed-switch

    .line 121
    :sswitch_data_114
    .sparse-switch
        0x2e -> :sswitch_2d
        0x30 -> :sswitch_21
        0x31 -> :sswitch_46
        0x32 -> :sswitch_46
        0x33 -> :sswitch_46
        0x34 -> :sswitch_46
        0x35 -> :sswitch_46
        0x36 -> :sswitch_46
        0x37 -> :sswitch_46
        0x38 -> :sswitch_46
        0x39 -> :sswitch_46
        0x45 -> :sswitch_2d
        0x65 -> :sswitch_2d
    .end sparse-switch

    .line 179
    :pswitch_data_14a
    .packed-switch 0x30
        :pswitch_62
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
    .end packed-switch

    .line 160
    :pswitch_data_162
    .packed-switch 0x30
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
        :pswitch_47
    .end packed-switch

    .line 194
    :pswitch_data_17a
    .packed-switch 0x30
        :pswitch_64
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
    .end packed-switch

    .line 248
    :sswitch_data_192
    .sparse-switch
        0x45 -> :sswitch_9e
        0x65 -> :sswitch_9e
    .end sparse-switch

    .line 230
    :pswitch_data_19c
    .packed-switch 0x30
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
    .end packed-switch

    .line 252
    :pswitch_data_1b4
    .packed-switch 0x2b
        :pswitch_b1
        :pswitch_a9
        :pswitch_b0
        :pswitch_a9
        :pswitch_a9
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
    .end packed-switch

    .line 260
    :pswitch_data_1d6
    .packed-switch 0x30
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
        :pswitch_c3
    .end packed-switch

    .line 287
    :pswitch_data_1ee
    .packed-switch 0x30
        :pswitch_c9
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
    .end packed-switch

    .line 291
    :pswitch_data_206
    .packed-switch 0x30
        :pswitch_c9
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
    .end packed-switch

    .line 323
    :pswitch_data_21e
    .packed-switch 0x30
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
        :pswitch_d5
    .end packed-switch
.end method

.method public skipNumberSeparator()V
    .registers 4

    .prologue
    .line 69
    :goto_0
    iget v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    iget v2, p0, Lcom/larvalabs/svgandroid/ParserHelper;->n:I

    if-ge v1, v2, :cond_f

    .line 70
    iget-object v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->s:[C

    iget v2, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    aget-char v0, v1, v2

    .line 71
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_14

    .line 82
    .end local v0    # "c":C
    :cond_f
    return-void

    .line 76
    .restart local v0    # "c":C
    :sswitch_10
    invoke-virtual {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->advance()V

    goto :goto_0

    .line 71
    :sswitch_data_14
    .sparse-switch
        0x9 -> :sswitch_10
        0xa -> :sswitch_10
        0x20 -> :sswitch_10
        0x2c -> :sswitch_10
    .end sparse-switch
.end method

.method public skipWhitespace()V
    .registers 3

    .prologue
    .line 59
    :goto_0
    iget v0, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    iget v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->n:I

    if-ge v0, v1, :cond_16

    .line 60
    iget-object v0, p0, Lcom/larvalabs/svgandroid/ParserHelper;->s:[C

    iget v1, p0, Lcom/larvalabs/svgandroid/ParserHelper;->pos:I

    aget-char v0, v0, v1

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 61
    invoke-virtual {p0}, Lcom/larvalabs/svgandroid/ParserHelper;->advance()V

    goto :goto_0

    .line 66
    :cond_16
    return-void
.end method
