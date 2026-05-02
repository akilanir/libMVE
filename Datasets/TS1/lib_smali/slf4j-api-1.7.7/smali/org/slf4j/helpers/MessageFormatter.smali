.class public final Lorg/slf4j/helpers/MessageFormatter;
.super Ljava/lang/Object;
.source "MessageFormatter.java"


# static fields
.field static final DELIM_START:C = '{'

.field static final DELIM_STOP:C = '}'

.field static final DELIM_STR:Ljava/lang/String; = "{}"

.field private static final ESCAPE_CHAR:C = '\\'


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final arrayFormat(Ljava/lang/String;[Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;
    .registers 10
    .param p0, "messagePattern"    # Ljava/lang/String;
    .param p1, "argArray"    # [Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 182
    invoke-static {p1}, Lorg/slf4j/helpers/MessageFormatter;->getThrowableCandidate([Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    .line 184
    .local v4, "throwableCandidate":Ljava/lang/Throwable;
    if-nez p0, :cond_d

    .line 185
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-direct {v5, v7, p1, v4}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 241
    :goto_c
    return-object v5

    .line 188
    :cond_d
    if-nez p1, :cond_15

    .line 189
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-direct {v5, p0}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;)V

    goto :goto_c

    .line 192
    :cond_15
    const/4 v1, 0x0

    .line 195
    .local v1, "i":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x32

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 198
    .local v3, "sbuf":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "L":I
    :goto_22
    array-length v5, p1

    if-ge v0, v5, :cond_96

    .line 200
    const-string v5, "{}"

    invoke-virtual {p0, v5, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 202
    .local v2, "j":I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_4b

    .line 204
    if-nez v1, :cond_36

    .line 205
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-direct {v5, p0, p1, v4}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_c

    .line 209
    :cond_36
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p1, v4}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_c

    .line 214
    :cond_4b
    invoke-static {p0, v2}, Lorg/slf4j/helpers/MessageFormatter;->isEscapedDelimeter(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_82

    .line 215
    invoke-static {p0, v2}, Lorg/slf4j/helpers/MessageFormatter;->isDoubleEscaped(Ljava/lang/String;I)Z

    move-result v5

    if-nez v5, :cond_6c

    .line 216
    add-int/lit8 v0, v0, -0x1

    .line 217
    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    const/16 v5, 0x7b

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 219
    add-int/lit8 v1, v2, 0x1

    .line 198
    :goto_69
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 224
    :cond_6c
    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    aget-object v5, p1, v0

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-static {v3, v5, v6}, Lorg/slf4j/helpers/MessageFormatter;->deeplyAppendParameter(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/util/Map;)V

    .line 226
    add-int/lit8 v1, v2, 0x2

    goto :goto_69

    .line 230
    :cond_82
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    aget-object v5, p1, v0

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-static {v3, v5, v6}, Lorg/slf4j/helpers/MessageFormatter;->deeplyAppendParameter(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/util/Map;)V

    .line 232
    add-int/lit8 v1, v2, 0x2

    goto :goto_69

    .line 237
    .end local v2    # "j":I
    :cond_96
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    if-ge v0, v5, :cond_b1

    .line 239
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p1, v4}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 241
    :cond_b1
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p1, v7}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_c
.end method

.method private static booleanArrayAppend(Ljava/lang/StringBuilder;[Z)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [Z

    .prologue
    .line 337
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 338
    array-length v1, p1

    .line 339
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 340
    aget-boolean v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 341
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 342
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 344
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 345
    return-void
.end method

.method private static byteArrayAppend(Ljava/lang/StringBuilder;[B)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [B

    .prologue
    .line 348
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 349
    array-length v1, p1

    .line 350
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 351
    aget-byte v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 352
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 353
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 355
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 356
    return-void
.end method

.method private static charArrayAppend(Ljava/lang/StringBuilder;[C)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [C

    .prologue
    .line 359
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 360
    array-length v1, p1

    .line 361
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 362
    aget-char v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 363
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 364
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 366
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 367
    return-void
.end method

.method private static deeplyAppendParameter(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/util/Map;)V
    .registers 4
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/lang/Object;",
            "Ljava/util/Map",
            "<[",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 272
    .local p2, "seenMap":Ljava/util/Map;, "Ljava/util/Map<[Ljava/lang/Object;Ljava/lang/Object;>;"
    if-nez p1, :cond_8

    .line 273
    const-string v0, "null"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .end local p1    # "o":Ljava/lang/Object;
    :goto_7
    return-void

    .line 276
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_16

    .line 277
    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->safeObjectAppend(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    goto :goto_7

    .line 281
    :cond_16
    instance-of v0, p1, [Z

    if-eqz v0, :cond_22

    .line 282
    check-cast p1, [Z

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [Z

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->booleanArrayAppend(Ljava/lang/StringBuilder;[Z)V

    goto :goto_7

    .line 283
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_22
    instance-of v0, p1, [B

    if-eqz v0, :cond_2e

    .line 284
    check-cast p1, [B

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [B

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->byteArrayAppend(Ljava/lang/StringBuilder;[B)V

    goto :goto_7

    .line 285
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_2e
    instance-of v0, p1, [C

    if-eqz v0, :cond_3a

    .line 286
    check-cast p1, [C

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [C

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->charArrayAppend(Ljava/lang/StringBuilder;[C)V

    goto :goto_7

    .line 287
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_3a
    instance-of v0, p1, [S

    if-eqz v0, :cond_46

    .line 288
    check-cast p1, [S

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [S

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->shortArrayAppend(Ljava/lang/StringBuilder;[S)V

    goto :goto_7

    .line 289
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_46
    instance-of v0, p1, [I

    if-eqz v0, :cond_52

    .line 290
    check-cast p1, [I

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [I

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->intArrayAppend(Ljava/lang/StringBuilder;[I)V

    goto :goto_7

    .line 291
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_52
    instance-of v0, p1, [J

    if-eqz v0, :cond_5e

    .line 292
    check-cast p1, [J

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [J

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->longArrayAppend(Ljava/lang/StringBuilder;[J)V

    goto :goto_7

    .line 293
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_5e
    instance-of v0, p1, [F

    if-eqz v0, :cond_6a

    .line 294
    check-cast p1, [F

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [F

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->floatArrayAppend(Ljava/lang/StringBuilder;[F)V

    goto :goto_7

    .line 295
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_6a
    instance-of v0, p1, [D

    if-eqz v0, :cond_76

    .line 296
    check-cast p1, [D

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [D

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->doubleArrayAppend(Ljava/lang/StringBuilder;[D)V

    goto :goto_7

    .line 298
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_76
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [Ljava/lang/Object;

    invoke-static {p0, p1, p2}, Lorg/slf4j/helpers/MessageFormatter;->objectArrayAppend(Ljava/lang/StringBuilder;[Ljava/lang/Object;Ljava/util/Map;)V

    goto :goto_7
.end method

.method private static doubleArrayAppend(Ljava/lang/StringBuilder;[D)V
    .registers 6
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [D

    .prologue
    .line 414
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 415
    array-length v1, p1

    .line 416
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 417
    aget-wide v2, p1, v0

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 418
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 419
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 421
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 422
    return-void
.end method

.method private static floatArrayAppend(Ljava/lang/StringBuilder;[F)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [F

    .prologue
    .line 403
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 404
    array-length v1, p1

    .line 405
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 406
    aget v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 407
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 408
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 405
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 410
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 411
    return-void
.end method

.method public static final format(Ljava/lang/String;Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;
    .registers 4
    .param p0, "messagePattern"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 124
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {p0, v0}, Lorg/slf4j/helpers/MessageFormatter;->arrayFormat(Ljava/lang/String;[Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;

    move-result-object v0

    return-object v0
.end method

.method public static final format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;
    .registers 5
    .param p0, "messagePattern"    # Ljava/lang/String;
    .param p1, "arg1"    # Ljava/lang/Object;
    .param p2, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 152
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {p0, v0}, Lorg/slf4j/helpers/MessageFormatter;->arrayFormat(Ljava/lang/String;[Ljava/lang/Object;)Lorg/slf4j/helpers/FormattingTuple;

    move-result-object v0

    return-object v0
.end method

.method static final getThrowableCandidate([Ljava/lang/Object;)Ljava/lang/Throwable;
    .registers 4
    .param p0, "argArray"    # [Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 156
    if-eqz p0, :cond_6

    array-length v2, p0

    if-nez v2, :cond_8

    :cond_6
    move-object v0, v1

    .line 164
    :goto_7
    return-object v0

    .line 160
    :cond_8
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    aget-object v0, p0, v2

    .line 161
    .local v0, "lastEntry":Ljava/lang/Object;
    instance-of v2, v0, Ljava/lang/Throwable;

    if-eqz v2, :cond_14

    .line 162
    check-cast v0, Ljava/lang/Throwable;

    goto :goto_7

    :cond_14
    move-object v0, v1

    .line 164
    goto :goto_7
.end method

.method private static intArrayAppend(Ljava/lang/StringBuilder;[I)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [I

    .prologue
    .line 381
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 382
    array-length v1, p1

    .line 383
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 384
    aget v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 385
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 386
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 388
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 389
    return-void
.end method

.method static final isDoubleEscaped(Ljava/lang/String;I)Z
    .registers 4
    .param p0, "messagePattern"    # Ljava/lang/String;
    .param p1, "delimeterStartIndex"    # I

    .prologue
    .line 261
    const/4 v0, 0x2

    if-lt p1, v0, :cond_f

    add-int/lit8 v0, p1, -0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_f

    .line 263
    const/4 v0, 0x1

    .line 265
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method static final isEscapedDelimeter(Ljava/lang/String;I)Z
    .registers 5
    .param p0, "messagePattern"    # Ljava/lang/String;
    .param p1, "delimeterStartIndex"    # I

    .prologue
    const/4 v1, 0x0

    .line 248
    if-nez p1, :cond_4

    .line 255
    :cond_3
    :goto_3
    return v1

    .line 251
    :cond_4
    add-int/lit8 v2, p1, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 252
    .local v0, "potentialEscape":C
    const/16 v2, 0x5c

    if-ne v0, v2, :cond_3

    .line 253
    const/4 v1, 0x1

    goto :goto_3
.end method

.method private static longArrayAppend(Ljava/lang/StringBuilder;[J)V
    .registers 6
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [J

    .prologue
    .line 392
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 393
    array-length v1, p1

    .line 394
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 395
    aget-wide v2, p1, v0

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 396
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 397
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 399
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 400
    return-void
.end method

.method private static objectArrayAppend(Ljava/lang/StringBuilder;[Ljava/lang/Object;Ljava/util/Map;)V
    .registers 6
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "[",
            "Ljava/lang/Object;",
            "Ljava/util/Map",
            "<[",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 319
    .local p2, "seenMap":Ljava/util/Map;, "Ljava/util/Map<[Ljava/lang/Object;Ljava/lang/Object;>;"
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 320
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2d

    .line 321
    const/4 v2, 0x0

    invoke-interface {p2, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    array-length v1, p1

    .line 323
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    if-ge v0, v1, :cond_24

    .line 324
    aget-object v2, p1, v0

    invoke-static {p0, v2, p2}, Lorg/slf4j/helpers/MessageFormatter;->deeplyAppendParameter(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/util/Map;)V

    .line 325
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_21

    .line 326
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 329
    :cond_24
    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .end local v0    # "i":I
    .end local v1    # "len":I
    :goto_27
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 334
    return-void

    .line 331
    :cond_2d
    const-string v2, "..."

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_27
.end method

.method private static safeObjectAppend(Ljava/lang/StringBuilder;Ljava/lang/Object;)V
    .registers 7
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 305
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "oAsString":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_7} :catch_8

    .line 315
    .end local v0    # "oAsString":Ljava/lang/String;
    :goto_7
    return-void

    .line 307
    :catch_8
    move-exception v1

    .line 308
    .local v1, "t":Ljava/lang/Throwable;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SLF4J: Failed toString() invocation on an object of type ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 311
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 312
    const-string v2, "[FAILED toString()]"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7
.end method

.method private static shortArrayAppend(Ljava/lang/StringBuilder;[S)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuilder;
    .param p1, "a"    # [S

    .prologue
    .line 370
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 371
    array-length v1, p1

    .line 372
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 373
    aget-short v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 374
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 375
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 377
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 378
    return-void
.end method
