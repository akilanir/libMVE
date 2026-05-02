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

    .line 240
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

    .line 194
    .local v1, "i":I
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x32

    invoke-direct {v3, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 197
    .local v3, "sbuf":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "L":I
    :goto_22
    array-length v5, p1

    if-ge v0, v5, :cond_96

    .line 199
    const-string v5, "{}"

    invoke-virtual {p0, v5, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 201
    .local v2, "j":I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_4b

    .line 203
    if-nez v1, :cond_36

    .line 204
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-direct {v5, p0, p1, v4}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_c

    .line 208
    :cond_36
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 209
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p1, v4}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_c

    .line 213
    :cond_4b
    invoke-static {p0, v2}, Lorg/slf4j/helpers/MessageFormatter;->isEscapedDelimeter(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_82

    .line 214
    invoke-static {p0, v2}, Lorg/slf4j/helpers/MessageFormatter;->isDoubleEscaped(Ljava/lang/String;I)Z

    move-result v5

    if-nez v5, :cond_6c

    .line 215
    add-int/lit8 v0, v0, -0x1

    .line 216
    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 217
    const/16 v5, 0x7b

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 218
    add-int/lit8 v1, v2, 0x1

    .line 197
    :goto_69
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 223
    :cond_6c
    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 224
    aget-object v5, p1, v0

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-static {v3, v5, v6}, Lorg/slf4j/helpers/MessageFormatter;->deeplyAppendParameter(Ljava/lang/StringBuffer;Ljava/lang/Object;Ljava/util/Map;)V

    .line 225
    add-int/lit8 v1, v2, 0x2

    goto :goto_69

    .line 229
    :cond_82
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 230
    aget-object v5, p1, v0

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-static {v3, v5, v6}, Lorg/slf4j/helpers/MessageFormatter;->deeplyAppendParameter(Ljava/lang/StringBuffer;Ljava/lang/Object;Ljava/util/Map;)V

    .line 231
    add-int/lit8 v1, v2, 0x2

    goto :goto_69

    .line 236
    .end local v2    # "j":I
    :cond_96
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 237
    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    if-ge v0, v5, :cond_b1

    .line 238
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p1, v4}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 240
    :cond_b1
    new-instance v5, Lorg/slf4j/helpers/FormattingTuple;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p1, v7}, Lorg/slf4j/helpers/FormattingTuple;-><init>(Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_c
.end method

.method private static booleanArrayAppend(Ljava/lang/StringBuffer;[Z)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [Z

    .prologue
    .line 336
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 337
    array-length v1, p1

    .line 338
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 339
    aget-boolean v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 340
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 341
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 338
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 343
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 344
    return-void
.end method

.method private static byteArrayAppend(Ljava/lang/StringBuffer;[B)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [B

    .prologue
    .line 347
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 348
    array-length v1, p1

    .line 349
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 350
    aget-byte v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 351
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 352
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 349
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 354
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 355
    return-void
.end method

.method private static charArrayAppend(Ljava/lang/StringBuffer;[C)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [C

    .prologue
    .line 358
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 359
    array-length v1, p1

    .line 360
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 361
    aget-char v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 362
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 363
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 360
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 365
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 366
    return-void
.end method

.method private static deeplyAppendParameter(Ljava/lang/StringBuffer;Ljava/lang/Object;Ljava/util/Map;)V
    .registers 4
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "seenMap"    # Ljava/util/Map;

    .prologue
    .line 271
    if-nez p1, :cond_8

    .line 272
    const-string v0, "null"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 300
    .end local p1    # "o":Ljava/lang/Object;
    :goto_7
    return-void

    .line 275
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_16

    .line 276
    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->safeObjectAppend(Ljava/lang/StringBuffer;Ljava/lang/Object;)V

    goto :goto_7

    .line 280
    :cond_16
    instance-of v0, p1, [Z

    if-eqz v0, :cond_22

    .line 281
    check-cast p1, [Z

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [Z

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->booleanArrayAppend(Ljava/lang/StringBuffer;[Z)V

    goto :goto_7

    .line 282
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_22
    instance-of v0, p1, [B

    if-eqz v0, :cond_2e

    .line 283
    check-cast p1, [B

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [B

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->byteArrayAppend(Ljava/lang/StringBuffer;[B)V

    goto :goto_7

    .line 284
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_2e
    instance-of v0, p1, [C

    if-eqz v0, :cond_3a

    .line 285
    check-cast p1, [C

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [C

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->charArrayAppend(Ljava/lang/StringBuffer;[C)V

    goto :goto_7

    .line 286
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_3a
    instance-of v0, p1, [S

    if-eqz v0, :cond_46

    .line 287
    check-cast p1, [S

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [S

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->shortArrayAppend(Ljava/lang/StringBuffer;[S)V

    goto :goto_7

    .line 288
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_46
    instance-of v0, p1, [I

    if-eqz v0, :cond_52

    .line 289
    check-cast p1, [I

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [I

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->intArrayAppend(Ljava/lang/StringBuffer;[I)V

    goto :goto_7

    .line 290
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_52
    instance-of v0, p1, [J

    if-eqz v0, :cond_5e

    .line 291
    check-cast p1, [J

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [J

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->longArrayAppend(Ljava/lang/StringBuffer;[J)V

    goto :goto_7

    .line 292
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_5e
    instance-of v0, p1, [F

    if-eqz v0, :cond_6a

    .line 293
    check-cast p1, [F

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [F

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->floatArrayAppend(Ljava/lang/StringBuffer;[F)V

    goto :goto_7

    .line 294
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_6a
    instance-of v0, p1, [D

    if-eqz v0, :cond_76

    .line 295
    check-cast p1, [D

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [D

    invoke-static {p0, p1}, Lorg/slf4j/helpers/MessageFormatter;->doubleArrayAppend(Ljava/lang/StringBuffer;[D)V

    goto :goto_7

    .line 297
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_76
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [Ljava/lang/Object;

    invoke-static {p0, p1, p2}, Lorg/slf4j/helpers/MessageFormatter;->objectArrayAppend(Ljava/lang/StringBuffer;[Ljava/lang/Object;Ljava/util/Map;)V

    goto :goto_7
.end method

.method private static doubleArrayAppend(Ljava/lang/StringBuffer;[D)V
    .registers 6
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [D

    .prologue
    .line 413
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 414
    array-length v1, p1

    .line 415
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 416
    aget-wide v2, p1, v0

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    .line 417
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 418
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 415
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 420
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 421
    return-void
.end method

.method private static floatArrayAppend(Ljava/lang/StringBuffer;[F)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [F

    .prologue
    .line 402
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 403
    array-length v1, p1

    .line 404
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 405
    aget v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 406
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 407
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 404
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 409
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 410
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

.method private static intArrayAppend(Ljava/lang/StringBuffer;[I)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [I

    .prologue
    .line 380
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 381
    array-length v1, p1

    .line 382
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 383
    aget v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 384
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 385
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 382
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 387
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 388
    return-void
.end method

.method static final isDoubleEscaped(Ljava/lang/String;I)Z
    .registers 4
    .param p0, "messagePattern"    # Ljava/lang/String;
    .param p1, "delimeterStartIndex"    # I

    .prologue
    .line 260
    const/4 v0, 0x2

    if-lt p1, v0, :cond_f

    add-int/lit8 v0, p1, -0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_f

    .line 262
    const/4 v0, 0x1

    .line 264
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

    .line 247
    if-nez p1, :cond_4

    .line 254
    :cond_3
    :goto_3
    return v1

    .line 250
    :cond_4
    add-int/lit8 v2, p1, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 251
    .local v0, "potentialEscape":C
    const/16 v2, 0x5c

    if-ne v0, v2, :cond_3

    .line 252
    const/4 v1, 0x1

    goto :goto_3
.end method

.method private static longArrayAppend(Ljava/lang/StringBuffer;[J)V
    .registers 6
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [J

    .prologue
    .line 391
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 392
    array-length v1, p1

    .line 393
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 394
    aget-wide v2, p1, v0

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 395
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 396
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 393
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 398
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 399
    return-void
.end method

.method private static objectArrayAppend(Ljava/lang/StringBuffer;[Ljava/lang/Object;Ljava/util/Map;)V
    .registers 6
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [Ljava/lang/Object;
    .param p2, "seenMap"    # Ljava/util/Map;

    .prologue
    .line 318
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 319
    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2d

    .line 320
    const/4 v2, 0x0

    invoke-interface {p2, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    array-length v1, p1

    .line 322
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    if-ge v0, v1, :cond_24

    .line 323
    aget-object v2, p1, v0

    invoke-static {p0, v2, p2}, Lorg/slf4j/helpers/MessageFormatter;->deeplyAppendParameter(Ljava/lang/StringBuffer;Ljava/lang/Object;Ljava/util/Map;)V

    .line 324
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_21

    .line 325
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 322
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 328
    :cond_24
    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    .end local v0    # "i":I
    .end local v1    # "len":I
    :goto_27
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 333
    return-void

    .line 330
    :cond_2d
    const-string v2, "..."

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_27
.end method

.method private static safeObjectAppend(Ljava/lang/StringBuffer;Ljava/lang/Object;)V
    .registers 7
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 304
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 305
    .local v0, "oAsString":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_7} :catch_8

    .line 314
    .end local v0    # "oAsString":Ljava/lang/String;
    :goto_7
    return-void

    .line 306
    :catch_8
    move-exception v1

    .line 307
    .local v1, "t":Ljava/lang/Throwable;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "SLF4J: Failed toString() invocation on an object of type ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 310
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 311
    const-string v2, "[FAILED toString()]"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_7
.end method

.method private static shortArrayAppend(Ljava/lang/StringBuffer;[S)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "a"    # [S

    .prologue
    .line 369
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 370
    array-length v1, p1

    .line 371
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 372
    aget-short v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 373
    add-int/lit8 v2, v1, -0x1

    if-eq v0, v2, :cond_17

    .line 374
    const-string v2, ", "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 371
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 376
    :cond_1a
    const/16 v2, 0x5d

    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 377
    return-void
.end method
