.class final Lorg/mozilla/javascript/NativeMath;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeMath.java"


# static fields
.field private static final Id_E:I = 0x1e

.field private static final Id_LN10:I = 0x20

.field private static final Id_LN2:I = 0x21

.field private static final Id_LOG10E:I = 0x23

.field private static final Id_LOG2E:I = 0x22

.field private static final Id_PI:I = 0x1f

.field private static final Id_SQRT1_2:I = 0x24

.field private static final Id_SQRT2:I = 0x25

.field private static final Id_abs:I = 0x2

.field private static final Id_acos:I = 0x3

.field private static final Id_asin:I = 0x4

.field private static final Id_atan:I = 0x5

.field private static final Id_atan2:I = 0x6

.field private static final Id_cbrt:I = 0x14

.field private static final Id_ceil:I = 0x7

.field private static final Id_cos:I = 0x8

.field private static final Id_cosh:I = 0x15

.field private static final Id_exp:I = 0x9

.field private static final Id_expm1:I = 0x16

.field private static final Id_floor:I = 0xa

.field private static final Id_hypot:I = 0x17

.field private static final Id_imul:I = 0x1c

.field private static final Id_log:I = 0xb

.field private static final Id_log10:I = 0x19

.field private static final Id_log1p:I = 0x18

.field private static final Id_max:I = 0xc

.field private static final Id_min:I = 0xd

.field private static final Id_pow:I = 0xe

.field private static final Id_random:I = 0xf

.field private static final Id_round:I = 0x10

.field private static final Id_sin:I = 0x11

.field private static final Id_sinh:I = 0x1a

.field private static final Id_sqrt:I = 0x12

.field private static final Id_tan:I = 0x13

.field private static final Id_tanh:I = 0x1b

.field private static final Id_toSource:I = 0x1

.field private static final Id_trunc:I = 0x1d

.field private static final LAST_METHOD_ID:I = 0x1d

.field private static final MATH_TAG:Ljava/lang/Object;

.field private static final MAX_ID:I = 0x25

.field static final serialVersionUID:J = -0x7aa9e4af6da33631L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    const-string v0, "Math"

    sput-object v0, Lorg/mozilla/javascript/NativeMath;->MATH_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 36
    return-void
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 5
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 25
    new-instance v0, Lorg/mozilla/javascript/NativeMath;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeMath;-><init>()V

    .line 26
    .local v0, "obj":Lorg/mozilla/javascript/NativeMath;
    const/16 v1, 0x25

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeMath;->activatePrototypeMap(I)V

    .line 27
    invoke-static {p0}, Lorg/mozilla/javascript/NativeMath;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeMath;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 28
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeMath;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 29
    if-eqz p1, :cond_19

    invoke-virtual {v0}, Lorg/mozilla/javascript/NativeMath;->sealObject()V

    .line 30
    :cond_19
    const-string v1, "Math"

    const/4 v2, 0x2

    invoke-static {p0, v1, v0, v2}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 32
    return-void
.end method

.method private js_hypot([Ljava/lang/Object;)D
    .registers 14
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 343
    if-nez p1, :cond_7

    .line 344
    const-wide/16 v1, 0x0

    .line 358
    :cond_6
    :goto_6
    return-wide v1

    .line 346
    :cond_7
    const-wide/16 v6, 0x0

    .line 348
    .local v6, "y":D
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_c
    if-ge v3, v4, :cond_2c

    aget-object v5, v0, v3

    .line 349
    .local v5, "o":Ljava/lang/Object;
    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    .line 350
    .local v1, "d":D
    sget-wide v10, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    cmpl-double v10, v1, v10

    if-eqz v10, :cond_6

    .line 353
    cmpl-double v10, v1, v8

    if-eqz v10, :cond_24

    const-wide/high16 v10, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v10, v1, v10

    if-nez v10, :cond_26

    :cond_24
    move-wide v1, v8

    .line 354
    goto :goto_6

    .line 356
    :cond_26
    mul-double v10, v1, v1

    add-double/2addr v6, v10

    .line 348
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 358
    .end local v1    # "d":D
    .end local v5    # "o":Ljava/lang/Object;
    :cond_2c
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    goto :goto_6
.end method

.method private js_imul([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    const-wide v10, 0x100000000L

    .line 369
    if-eqz p1, :cond_b

    array-length v8, p1

    const/4 v9, 0x2

    if-ge v8, v9, :cond_12

    .line 370
    :cond_b
    sget-wide v8, Lorg/mozilla/javascript/ScriptRuntime;->NaN:D

    invoke-static {v8, v9}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v8

    .line 377
    :goto_11
    return-object v8

    .line 373
    :cond_12
    const/4 v8, 0x0

    aget-object v8, p1, v8

    invoke-static {v8}, Lorg/mozilla/javascript/typedarrays/Conversions;->toUint32(Ljava/lang/Object;)J

    move-result-wide v4

    .line 374
    .local v4, "x":J
    const/4 v8, 0x1

    aget-object v8, p1, v8

    invoke-static {v8}, Lorg/mozilla/javascript/typedarrays/Conversions;->toUint32(Ljava/lang/Object;)J

    move-result-wide v6

    .line 375
    .local v6, "y":J
    mul-long v8, v4, v6

    rem-long v0, v8, v10

    .line 376
    .local v0, "product":J
    const-wide v8, 0x80000000L

    cmp-long v8, v0, v8

    if-ltz v8, :cond_3c

    sub-long v2, v0, v10

    .line 377
    .local v2, "result":J
    :goto_2f
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    goto :goto_11

    .end local v2    # "result":J
    :cond_3c
    move-wide v2, v0

    .line 376
    goto :goto_2f
.end method

.method private js_pow(DD)D
    .registers 13
    .param p1, "x"    # D
    .param p3, "y"    # D

    .prologue
    .line 288
    cmpl-double v4, p3, p3

    if-eqz v4, :cond_6

    .line 290
    move-wide v0, p3

    .line 337
    .local v0, "result":D
    :cond_5
    :goto_5
    return-wide v0

    .line 291
    .end local v0    # "result":D
    :cond_6
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-nez v4, :cond_f

    .line 293
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .restart local v0    # "result":D
    goto :goto_5

    .line 294
    .end local v0    # "result":D
    :cond_f
    const-wide/16 v4, 0x0

    cmpl-double v4, p1, v4

    if-nez v4, :cond_51

    .line 296
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    div-double/2addr v4, p1

    const-wide/16 v6, 0x0

    cmpl-double v4, v4, v6

    if-lez v4, :cond_2a

    .line 297
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_27

    const-wide/16 v0, 0x0

    .restart local v0    # "result":D
    :goto_26
    goto :goto_5

    .end local v0    # "result":D
    :cond_27
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_26

    .line 300
    :cond_2a
    double-to-long v2, p3

    .line 301
    .local v2, "y_long":J
    long-to-double v4, v2

    cmpl-double v4, v4, p3

    if-nez v4, :cond_45

    const-wide/16 v4, 0x1

    and-long/2addr v4, v2

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_45

    .line 302
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_42

    const-wide/high16 v0, -0x8000000000000000L

    .restart local v0    # "result":D
    :goto_41
    goto :goto_5

    .end local v0    # "result":D
    :cond_42
    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    goto :goto_41

    .line 304
    :cond_45
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_4e

    const-wide/16 v0, 0x0

    .restart local v0    # "result":D
    :goto_4d
    goto :goto_5

    .end local v0    # "result":D
    :cond_4e
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_4d

    .line 308
    .end local v2    # "y_long":J
    :cond_51
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    .line 309
    .restart local v0    # "result":D
    cmpl-double v4, v0, v0

    if-eqz v4, :cond_5

    .line 312
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v4, p3, v4

    if-nez v4, :cond_7d

    .line 313
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpg-double v4, p1, v4

    if-ltz v4, :cond_6b

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, v4, p1

    if-gez v4, :cond_6e

    .line 314
    :cond_6b
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_5

    .line 315
    :cond_6e
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpg-double v4, v4, p1

    if-gez v4, :cond_5

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, p1, v4

    if-gez v4, :cond_5

    .line 316
    const-wide/16 v0, 0x0

    goto :goto_5

    .line 318
    :cond_7d
    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v4, p3, v4

    if-nez v4, :cond_a3

    .line 319
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpg-double v4, p1, v4

    if-ltz v4, :cond_8f

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, v4, p1

    if-gez v4, :cond_93

    .line 320
    :cond_8f
    const-wide/16 v0, 0x0

    goto/16 :goto_5

    .line 321
    :cond_93
    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    cmpg-double v4, v4, p1

    if-gez v4, :cond_5

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, p1, v4

    if-gez v4, :cond_5

    .line 322
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto/16 :goto_5

    .line 324
    :cond_a3
    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v4, p1, v4

    if-nez v4, :cond_b6

    .line 325
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_b3

    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    :goto_b1
    goto/16 :goto_5

    :cond_b3
    const-wide/16 v0, 0x0

    goto :goto_b1

    .line 326
    :cond_b6
    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v4, p1, v4

    if-nez v4, :cond_5

    .line 327
    double-to-long v2, p3

    .line 328
    .restart local v2    # "y_long":J
    long-to-double v4, v2

    cmpl-double v4, v4, p3

    if-nez v4, :cond_d8

    const-wide/16 v4, 0x1

    and-long/2addr v4, v2

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_d8

    .line 330
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_d5

    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    :goto_d3
    goto/16 :goto_5

    :cond_d5
    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_d3

    .line 332
    :cond_d8
    const-wide/16 v4, 0x0

    cmpl-double v4, p3, v4

    if-lez v4, :cond_e2

    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    :goto_e0
    goto/16 :goto_5

    :cond_e2
    const-wide/16 v0, 0x0

    goto :goto_e0
.end method

.method private js_trunc(D)D
    .registers 5
    .param p1, "d"    # D

    .prologue
    .line 363
    const-wide/16 v0, 0x0

    cmpg-double v0, p1, v0

    if-gez v0, :cond_b

    invoke-static {p1, p2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    :goto_a
    return-wide v0

    :cond_b
    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    goto :goto_a
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 103
    sget-object v8, Lorg/mozilla/javascript/NativeMath;->MATH_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v8}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_d

    .line 104
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 282
    :goto_c
    return-object v8

    .line 107
    :cond_d
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v5

    .line 108
    .local v5, "methodId":I
    packed-switch v5, :pswitch_data_1e0

    .line 280
    new-instance v8, Ljava/lang/IllegalStateException;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 110
    :pswitch_1e
    const-string v8, "Math"

    goto :goto_c

    .line 113
    :pswitch_21
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 115
    .local v6, "x":D
    const-wide/16 v8, 0x0

    cmpl-double v8, v6, v8

    if-nez v8, :cond_33

    const-wide/16 v6, 0x0

    .line 282
    :cond_2e
    :goto_2e
    invoke-static {v6, v7}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v8

    goto :goto_c

    .line 115
    :cond_33
    const-wide/16 v8, 0x0

    cmpg-double v8, v6, v8

    if-gez v8, :cond_2e

    neg-double v6, v6

    goto :goto_2e

    .line 120
    .end local v6    # "x":D
    :pswitch_3b
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 121
    .restart local v6    # "x":D
    cmpl-double v8, v6, v6

    if-nez v8, :cond_5d

    const-wide/high16 v8, -0x4010000000000000L    # -1.0

    cmpg-double v8, v8, v6

    if-gtz v8, :cond_5d

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    cmpg-double v8, v6, v8

    if-gtz v8, :cond_5d

    .line 122
    const/4 v8, 0x3

    if-ne v5, v8, :cond_58

    invoke-static {v6, v7}, Ljava/lang/Math;->acos(D)D

    move-result-wide v6

    :goto_57
    goto :goto_2e

    :cond_58
    invoke-static {v6, v7}, Ljava/lang/Math;->asin(D)D

    move-result-wide v6

    goto :goto_57

    .line 124
    :cond_5d
    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 126
    goto :goto_2e

    .line 129
    .end local v6    # "x":D
    :pswitch_60
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 130
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->atan(D)D

    move-result-wide v6

    .line 131
    goto :goto_2e

    .line 134
    .end local v6    # "x":D
    :pswitch_6a
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 135
    .restart local v6    # "x":D
    const/4 v8, 0x1

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v6

    .line 136
    goto :goto_2e

    .line 139
    .end local v6    # "x":D
    :pswitch_79
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 140
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v6

    .line 141
    goto :goto_2e

    .line 144
    .end local v6    # "x":D
    :pswitch_83
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 145
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    .line 146
    goto :goto_2e

    .line 149
    .end local v6    # "x":D
    :pswitch_8d
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 150
    .restart local v6    # "x":D
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_9e

    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v8, v6, v8

    if-nez v8, :cond_a1

    :cond_9e
    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 153
    :goto_a0
    goto :goto_2e

    .line 150
    :cond_a1
    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    goto :goto_a0

    .line 156
    .end local v6    # "x":D
    :pswitch_a6
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 157
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->cosh(D)D

    move-result-wide v6

    .line 158
    goto/16 :goto_2e

    .line 161
    .end local v6    # "x":D
    :pswitch_b1
    invoke-direct {p0, p5}, Lorg/mozilla/javascript/NativeMath;->js_hypot([Ljava/lang/Object;)D

    move-result-wide v6

    .line 162
    .restart local v6    # "x":D
    goto/16 :goto_2e

    .line 165
    .end local v6    # "x":D
    :pswitch_b7
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 166
    .restart local v6    # "x":D
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v6, v8

    if-nez v8, :cond_c4

    .line 169
    :goto_c2
    goto/16 :goto_2e

    .line 166
    :cond_c4
    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v8, v6, v8

    if-nez v8, :cond_cd

    const-wide/16 v6, 0x0

    goto :goto_c2

    :cond_cd
    invoke-static {v6, v7}, Ljava/lang/Math;->exp(D)D

    move-result-wide v6

    goto :goto_c2

    .line 172
    .end local v6    # "x":D
    :pswitch_d2
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 173
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->expm1(D)D

    move-result-wide v6

    .line 174
    goto/16 :goto_2e

    .line 177
    .end local v6    # "x":D
    :pswitch_dd
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 178
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    .line 179
    goto/16 :goto_2e

    .line 182
    .end local v6    # "x":D
    :pswitch_e8
    invoke-direct {p0, p5}, Lorg/mozilla/javascript/NativeMath;->js_imul([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    goto/16 :goto_c

    .line 185
    :pswitch_ee
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 187
    .restart local v6    # "x":D
    const-wide/16 v8, 0x0

    cmpg-double v8, v6, v8

    if-gez v8, :cond_fd

    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 188
    :goto_fb
    goto/16 :goto_2e

    .line 187
    :cond_fd
    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v6

    goto :goto_fb

    .line 191
    .end local v6    # "x":D
    :pswitch_102
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 192
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->log1p(D)D

    move-result-wide v6

    .line 193
    goto/16 :goto_2e

    .line 196
    .end local v6    # "x":D
    :pswitch_10d
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 197
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->log10(D)D

    move-result-wide v6

    .line 198
    goto/16 :goto_2e

    .line 202
    .end local v6    # "x":D
    :pswitch_118
    const/16 v8, 0xc

    if-ne v5, v8, :cond_12f

    const-wide/high16 v6, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 204
    .restart local v6    # "x":D
    :goto_11e
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11f
    array-length v8, p5

    if-eq v2, v8, :cond_2e

    .line 205
    aget-object v8, p5, v2

    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 206
    .local v0, "d":D
    cmpl-double v8, v0, v0

    if-eqz v8, :cond_132

    .line 207
    move-wide v6, v0

    .line 208
    goto/16 :goto_2e

    .line 202
    .end local v0    # "d":D
    .end local v2    # "i":I
    .end local v6    # "x":D
    :cond_12f
    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_11e

    .line 210
    .restart local v0    # "d":D
    .restart local v2    # "i":I
    .restart local v6    # "x":D
    :cond_132
    const/16 v8, 0xc

    if-ne v5, v8, :cond_13d

    .line 212
    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    .line 204
    :goto_13a
    add-int/lit8 v2, v2, 0x1

    goto :goto_11f

    .line 214
    :cond_13d
    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    goto :goto_13a

    .line 220
    .end local v0    # "d":D
    .end local v2    # "i":I
    .end local v6    # "x":D
    :pswitch_142
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 221
    .restart local v6    # "x":D
    const/4 v8, 0x1

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v8

    invoke-direct {p0, v6, v7, v8, v9}, Lorg/mozilla/javascript/NativeMath;->js_pow(DD)D

    move-result-wide v6

    .line 222
    goto/16 :goto_2e

    .line 225
    .end local v6    # "x":D
    :pswitch_152
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    .line 226
    .restart local v6    # "x":D
    goto/16 :goto_2e

    .line 229
    .end local v6    # "x":D
    :pswitch_158
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 230
    .restart local v6    # "x":D
    cmpl-double v8, v6, v6

    if-nez v8, :cond_2e

    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_2e

    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_2e

    .line 234
    invoke-static {v6, v7}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    .line 235
    .local v3, "l":J
    const-wide/16 v8, 0x0

    cmp-long v8, v3, v8

    if-eqz v8, :cond_17a

    .line 236
    long-to-double v6, v3

    goto/16 :goto_2e

    .line 239
    :cond_17a
    const-wide/16 v8, 0x0

    cmpg-double v8, v6, v8

    if-gez v8, :cond_184

    .line 240
    sget-wide v6, Lorg/mozilla/javascript/ScriptRuntime;->negativeZero:D

    goto/16 :goto_2e

    .line 241
    :cond_184
    const-wide/16 v8, 0x0

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_2e

    .line 242
    const-wide/16 v6, 0x0

    goto/16 :goto_2e

    .line 249
    .end local v3    # "l":J
    .end local v6    # "x":D
    :pswitch_18e
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 250
    .restart local v6    # "x":D
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v8, v6, v8

    if-eqz v8, :cond_19f

    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    cmpl-double v8, v6, v8

    if-nez v8, :cond_1a3

    :cond_19f
    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    .line 253
    :goto_1a1
    goto/16 :goto_2e

    .line 250
    :cond_1a3
    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    goto :goto_1a1

    .line 256
    .end local v6    # "x":D
    :pswitch_1a8
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 257
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v6

    .line 258
    goto/16 :goto_2e

    .line 261
    .end local v6    # "x":D
    :pswitch_1b3
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 262
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    .line 263
    goto/16 :goto_2e

    .line 266
    .end local v6    # "x":D
    :pswitch_1be
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 267
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    move-result-wide v6

    .line 268
    goto/16 :goto_2e

    .line 271
    .end local v6    # "x":D
    :pswitch_1c9
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 272
    .restart local v6    # "x":D
    invoke-static {v6, v7}, Ljava/lang/Math;->tanh(D)D

    move-result-wide v6

    .line 273
    goto/16 :goto_2e

    .line 276
    .end local v6    # "x":D
    :pswitch_1d4
    const/4 v8, 0x0

    invoke-static {p5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber([Ljava/lang/Object;I)D

    move-result-wide v6

    .line 277
    .restart local v6    # "x":D
    invoke-direct {p0, v6, v7}, Lorg/mozilla/javascript/NativeMath;->js_trunc(D)D

    move-result-wide v6

    .line 278
    goto/16 :goto_2e

    .line 108
    nop

    :pswitch_data_1e0
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_21
        :pswitch_3b
        :pswitch_3b
        :pswitch_60
        :pswitch_6a
        :pswitch_83
        :pswitch_8d
        :pswitch_b7
        :pswitch_dd
        :pswitch_ee
        :pswitch_118
        :pswitch_118
        :pswitch_142
        :pswitch_152
        :pswitch_158
        :pswitch_18e
        :pswitch_1b3
        :pswitch_1be
        :pswitch_79
        :pswitch_a6
        :pswitch_d2
        :pswitch_b1
        :pswitch_102
        :pswitch_10d
        :pswitch_1a8
        :pswitch_1c9
        :pswitch_e8
        :pswitch_1d4
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 11
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x6f

    const/16 v7, 0x6e

    const/4 v6, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    .line 387
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 388
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_1b0

    .line 439
    :cond_10
    :goto_10
    if-eqz v0, :cond_1b

    if-eq v0, p1, :cond_1b

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    const/4 v2, 0x0

    .line 443
    :cond_1b
    :goto_1b
    return v2

    .line 389
    :pswitch_1c
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x45

    if-ne v3, v4, :cond_10

    const/16 v2, 0x1e

    goto :goto_1b

    .line 390
    :pswitch_27
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x50

    if-ne v3, v4, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x49

    if-ne v3, v4, :cond_10

    const/16 v2, 0x1f

    goto :goto_1b

    .line 391
    :pswitch_3a
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1c4

    goto :goto_10

    .line 392
    :sswitch_42
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x32

    if-ne v3, v4, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x4e

    if-ne v3, v4, :cond_10

    const/16 v2, 0x21

    goto :goto_1b

    .line 393
    :sswitch_55
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x73

    if-ne v3, v4, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x62

    if-ne v3, v4, :cond_10

    const/4 v2, 0x2

    goto :goto_1b

    .line 394
    :sswitch_67
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x73

    if-ne v3, v4, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_10

    const/16 v2, 0x8

    goto :goto_1b

    .line 395
    :sswitch_78
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x70

    if-ne v3, v4, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x78

    if-ne v3, v4, :cond_10

    const/16 v2, 0x9

    goto :goto_1b

    .line 396
    :sswitch_8b
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x67

    if-ne v3, v4, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_10

    const/16 v2, 0xb

    goto :goto_1b

    .line 397
    :sswitch_9c
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 398
    .local v1, "c":I
    if-ne v1, v7, :cond_ae

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x69

    if-ne v3, v4, :cond_10

    const/16 v2, 0xd

    goto/16 :goto_1b

    .line 399
    :cond_ae
    const/16 v3, 0x78

    if-ne v1, v3, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-ne v3, v4, :cond_10

    const/16 v2, 0xc

    goto/16 :goto_1b

    .line 401
    .end local v1    # "c":I
    :sswitch_be
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x77

    if-ne v3, v4, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v8, :cond_10

    const/16 v2, 0xe

    goto/16 :goto_1b

    .line 402
    :sswitch_d0
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x69

    if-ne v3, v4, :cond_10

    const/16 v2, 0x11

    goto/16 :goto_1b

    .line 403
    :sswitch_e2
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-ne v3, v4, :cond_10

    const/16 v2, 0x13

    goto/16 :goto_1b

    .line 405
    :pswitch_f4
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1ea

    goto/16 :goto_10

    .line 406
    :sswitch_fd
    const-string v0, "LN10"

    const/16 v2, 0x20

    goto/16 :goto_10

    .line 407
    :sswitch_103
    const-string v0, "tanh"

    const/16 v2, 0x1b

    goto/16 :goto_10

    .line 408
    :sswitch_109
    const-string v0, "cbrt"

    const/16 v2, 0x14

    goto/16 :goto_10

    .line 409
    :sswitch_10f
    const-string v0, "acos"

    const/4 v2, 0x3

    goto/16 :goto_10

    .line 410
    :sswitch_114
    const-string v0, "ceil"

    const/4 v2, 0x7

    goto/16 :goto_10

    .line 411
    :sswitch_119
    const-string v0, "sinh"

    const/16 v2, 0x1a

    goto/16 :goto_10

    .line 412
    :sswitch_11f
    const-string v0, "imul"

    const/16 v2, 0x1c

    goto/16 :goto_10

    .line 413
    :sswitch_125
    const-string v0, "cosh"

    const/16 v2, 0x15

    goto/16 :goto_10

    .line 414
    :sswitch_12b
    const-string v0, "sqrt"

    const/16 v2, 0x12

    goto/16 :goto_10

    .line 415
    :sswitch_131
    const-string v0, "asin"

    const/4 v2, 0x4

    goto/16 :goto_10

    .line 416
    :sswitch_136
    const-string v0, "atan"

    const/4 v2, 0x5

    goto/16 :goto_10

    .line 418
    :pswitch_13b
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_218

    goto/16 :goto_10

    .line 419
    :sswitch_144
    const-string v0, "LOG2E"

    const/16 v2, 0x22

    goto/16 :goto_10

    .line 420
    :sswitch_14a
    const-string v0, "SQRT2"

    const/16 v2, 0x25

    goto/16 :goto_10

    .line 421
    :sswitch_150
    const-string v0, "atan2"

    const/4 v2, 0x6

    goto/16 :goto_10

    .line 422
    :sswitch_155
    const-string v0, "expm1"

    const/16 v2, 0x16

    goto/16 :goto_10

    .line 423
    :sswitch_15b
    const-string v0, "floor"

    const/16 v2, 0xa

    goto/16 :goto_10

    .line 424
    :sswitch_161
    const-string v0, "hypot"

    const/16 v2, 0x17

    goto/16 :goto_10

    .line 425
    :sswitch_167
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 426
    .restart local v1    # "c":I
    const/16 v3, 0x30

    if-ne v1, v3, :cond_176

    const-string v0, "log10"

    const/16 v2, 0x19

    goto/16 :goto_10

    .line 427
    :cond_176
    const/16 v3, 0x70

    if-ne v1, v3, :cond_10

    const-string v0, "log1p"

    const/16 v2, 0x18

    goto/16 :goto_10

    .line 429
    .end local v1    # "c":I
    :sswitch_180
    const-string v0, "round"

    const/16 v2, 0x10

    goto/16 :goto_10

    .line 430
    :sswitch_186
    const-string v0, "trunc"

    const/16 v2, 0x1d

    goto/16 :goto_10

    .line 432
    :pswitch_18c
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 433
    .restart local v1    # "c":I
    const/16 v3, 0x4c

    if-ne v1, v3, :cond_19a

    const-string v0, "LOG10E"

    const/16 v2, 0x23

    goto/16 :goto_10

    .line 434
    :cond_19a
    const/16 v3, 0x72

    if-ne v1, v3, :cond_10

    const-string v0, "random"

    const/16 v2, 0xf

    goto/16 :goto_10

    .line 436
    .end local v1    # "c":I
    :pswitch_1a4
    const-string v0, "SQRT1_2"

    const/16 v2, 0x24

    goto/16 :goto_10

    .line 437
    :pswitch_1aa
    const-string v0, "toSource"

    const/4 v2, 0x1

    goto/16 :goto_10

    .line 388
    nop

    :pswitch_data_1b0
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_27
        :pswitch_3a
        :pswitch_f4
        :pswitch_13b
        :pswitch_18c
        :pswitch_1a4
        :pswitch_1aa
    .end packed-switch

    .line 391
    :sswitch_data_1c4
    .sparse-switch
        0x4c -> :sswitch_42
        0x61 -> :sswitch_55
        0x63 -> :sswitch_67
        0x65 -> :sswitch_78
        0x6c -> :sswitch_8b
        0x6d -> :sswitch_9c
        0x70 -> :sswitch_be
        0x73 -> :sswitch_d0
        0x74 -> :sswitch_e2
    .end sparse-switch

    .line 405
    :sswitch_data_1ea
    .sparse-switch
        0x4e -> :sswitch_fd
        0x61 -> :sswitch_103
        0x62 -> :sswitch_109
        0x63 -> :sswitch_10f
        0x65 -> :sswitch_114
        0x69 -> :sswitch_119
        0x6d -> :sswitch_11f
        0x6f -> :sswitch_125
        0x71 -> :sswitch_12b
        0x73 -> :sswitch_131
        0x74 -> :sswitch_136
    .end sparse-switch

    .line 418
    :sswitch_data_218
    .sparse-switch
        0x4c -> :sswitch_144
        0x53 -> :sswitch_14a
        0x61 -> :sswitch_150
        0x65 -> :sswitch_155
        0x66 -> :sswitch_15b
        0x68 -> :sswitch_161
        0x6c -> :sswitch_167
        0x72 -> :sswitch_180
        0x74 -> :sswitch_186
    .end sparse-switch
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    const-string v0, "Math"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .registers 8
    .param p1, "id"    # I

    .prologue
    .line 44
    const/16 v4, 0x1d

    if-gt p1, v4, :cond_8a

    .line 47
    packed-switch p1, :pswitch_data_e0

    .line 77
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 48
    :pswitch_11
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "toSource"

    .line 79
    .local v1, "name":Ljava/lang/String;
    :goto_14
    sget-object v4, Lorg/mozilla/javascript/NativeMath;->MATH_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v4, p1, v1, v0}, Lorg/mozilla/javascript/NativeMath;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 97
    .end local v0    # "arity":I
    :goto_19
    return-void

    .line 49
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "abs"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 50
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "acos"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 51
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "asin"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 52
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "atan"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 53
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_2a
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "atan2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 54
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_2e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cbrt"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 55
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_32
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "ceil"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 56
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_36
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cos"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 57
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_3a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "cosh"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 58
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_3e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "exp"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 59
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_42
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "expm1"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 60
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_46
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "floor"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 61
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_4a
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "hypot"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 62
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_4e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "imul"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 63
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_52
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 64
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_56
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log1p"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 65
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_5a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "log10"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 66
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_5e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "max"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 67
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_62
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "min"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 68
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_66
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "pow"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 69
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_6a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "random"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 70
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_6e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "round"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 71
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_72
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sin"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 72
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_76
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sinh"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 73
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_7a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sqrt"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 74
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_7e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "tan"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 75
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_82
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "tanh"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 76
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :pswitch_86
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "trunc"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_14

    .line 83
    .end local v0    # "arity":I
    .end local v1    # "name":Ljava/lang/String;
    :cond_8a
    packed-switch p1, :pswitch_data_11e

    .line 92
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 84
    :pswitch_97
    const-wide v2, 0x4005bf0a8b145769L    # Math.E

    .local v2, "x":D
    const-string v1, "E"

    .line 94
    .restart local v1    # "name":Ljava/lang/String;
    :goto_9e
    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    const/4 v5, 0x7

    invoke-virtual {p0, p1, v1, v4, v5}, Lorg/mozilla/javascript/NativeMath;->initPrototypeValue(ILjava/lang/String;Ljava/lang/Object;I)V

    goto/16 :goto_19

    .line 85
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_a8
    const-wide v2, 0x400921fb54442d18L    # Math.PI

    .restart local v2    # "x":D
    const-string v1, "PI"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_9e

    .line 86
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_b0
    const-wide v2, 0x40026bb1bbb55516L    # 2.302585092994046

    .restart local v2    # "x":D
    const-string v1, "LN10"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_9e

    .line 87
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_b8
    const-wide v2, 0x3fe62e42fefa39efL    # 0.6931471805599453

    .restart local v2    # "x":D
    const-string v1, "LN2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_9e

    .line 88
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_c0
    const-wide v2, 0x3ff71547652b82feL    # 1.4426950408889634

    .restart local v2    # "x":D
    const-string v1, "LOG2E"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_9e

    .line 89
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_c8
    const-wide v2, 0x3fdbcb7b1526e50eL    # 0.4342944819032518

    .restart local v2    # "x":D
    const-string v1, "LOG10E"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_9e

    .line 90
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_d0
    const-wide v2, 0x3fe6a09e667f3bcdL    # 0.7071067811865476

    .restart local v2    # "x":D
    const-string v1, "SQRT1_2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_9e

    .line 91
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "x":D
    :pswitch_d8
    const-wide v2, 0x3ff6a09e667f3bcdL    # 1.4142135623730951

    .restart local v2    # "x":D
    const-string v1, "SQRT2"

    .restart local v1    # "name":Ljava/lang/String;
    goto :goto_9e

    .line 47
    :pswitch_data_e0
    .packed-switch 0x1
        :pswitch_11
        :pswitch_1a
        :pswitch_1e
        :pswitch_22
        :pswitch_26
        :pswitch_2a
        :pswitch_32
        :pswitch_36
        :pswitch_3e
        :pswitch_46
        :pswitch_52
        :pswitch_5e
        :pswitch_62
        :pswitch_66
        :pswitch_6a
        :pswitch_6e
        :pswitch_72
        :pswitch_7a
        :pswitch_7e
        :pswitch_2e
        :pswitch_3a
        :pswitch_42
        :pswitch_4a
        :pswitch_56
        :pswitch_5a
        :pswitch_76
        :pswitch_82
        :pswitch_4e
        :pswitch_86
    .end packed-switch

    .line 83
    :pswitch_data_11e
    .packed-switch 0x1e
        :pswitch_97
        :pswitch_a8
        :pswitch_b0
        :pswitch_b8
        :pswitch_c0
        :pswitch_c8
        :pswitch_d0
        :pswitch_d8
    .end packed-switch
.end method
