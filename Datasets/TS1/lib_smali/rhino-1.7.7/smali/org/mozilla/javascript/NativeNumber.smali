.class final Lorg/mozilla/javascript/NativeNumber;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeNumber.java"


# static fields
.field private static final ConstructorId_isFinite:I = -0x1

.field private static final ConstructorId_isInteger:I = -0x3

.field private static final ConstructorId_isNaN:I = -0x2

.field private static final ConstructorId_isSafeInteger:I = -0x4

.field private static final ConstructorId_parseFloat:I = -0x5

.field private static final ConstructorId_parseInt:I = -0x6

.field private static final Id_constructor:I = 0x1

.field private static final Id_toExponential:I = 0x7

.field private static final Id_toFixed:I = 0x6

.field private static final Id_toLocaleString:I = 0x3

.field private static final Id_toPrecision:I = 0x8

.field private static final Id_toSource:I = 0x4

.field private static final Id_toString:I = 0x2

.field private static final Id_valueOf:I = 0x5

.field private static final MAX_PRECISION:I = 0x64

.field private static final MAX_PROTOTYPE_ID:I = 0x8

.field private static final MAX_SAFE_INTEGER:D

.field private static final MIN_SAFE_INTEGER:D

.field private static final NUMBER_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = 0x30a28b6f31d79da5L


# instance fields
.field private doubleValue:D


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 20
    const-string v0, "Number"

    sput-object v0, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    .line 23
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    const-wide v2, 0x404a800000000000L    # 53.0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, v2

    sput-wide v0, Lorg/mozilla/javascript/NativeNumber;->MAX_SAFE_INTEGER:D

    .line 24
    sget-wide v0, Lorg/mozilla/javascript/NativeNumber;->MAX_SAFE_INTEGER:D

    neg-double v0, v0

    sput-wide v0, Lorg/mozilla/javascript/NativeNumber;->MIN_SAFE_INTEGER:D

    return-void
.end method

.method constructor <init>(D)V
    .registers 3
    .param p1, "number"    # D

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 34
    iput-wide p1, p0, Lorg/mozilla/javascript/NativeNumber;->doubleValue:D

    .line 35
    return-void
.end method

.method private doubleVal(Ljava/lang/Number;)Ljava/lang/Double;
    .registers 5
    .param p1, "val"    # Ljava/lang/Number;

    .prologue
    .line 317
    instance-of v2, p1, Ljava/lang/Double;

    if-eqz v2, :cond_7

    .line 318
    check-cast p1, Ljava/lang/Double;

    .line 321
    .end local p1    # "val":Ljava/lang/Number;
    :goto_6
    return-object p1

    .line 320
    .restart local p1    # "val":Ljava/lang/Number;
    :cond_7
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 321
    .local v0, "d":D
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    goto :goto_6
.end method

.method private execConstructorCall(I[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "id"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 193
    packed-switch p1, :pswitch_data_a8

    .line 238
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :pswitch_e
    array-length v0, p2

    if-eqz v0, :cond_17

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p2, v2

    if-ne v0, v1, :cond_1c

    .line 196
    :cond_17
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 235
    :goto_1b
    return-object v0

    .line 198
    :cond_1c
    aget-object v0, p2, v2

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_29

    .line 200
    aget-object v0, p2, v2

    invoke-static {v0}, Lorg/mozilla/javascript/NativeNumber;->isFinite(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1b

    .line 202
    :cond_29
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 205
    :pswitch_2e
    array-length v0, p2

    if-eqz v0, :cond_37

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p2, v2

    if-ne v0, v1, :cond_3c

    .line 206
    :cond_37
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 208
    :cond_3c
    aget-object v0, p2, v2

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_4b

    .line 209
    aget-object v0, p2, v2

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isNaN(Ljava/lang/Number;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1b

    .line 211
    :cond_4b
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 214
    :pswitch_50
    array-length v0, p2

    if-eqz v0, :cond_59

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p2, v2

    if-ne v0, v1, :cond_5e

    .line 215
    :cond_59
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 217
    :cond_5e
    aget-object v0, p2, v2

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_71

    .line 218
    aget-object v0, p2, v2

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isInteger(Ljava/lang/Number;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 220
    :cond_71
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 223
    :pswitch_76
    array-length v0, p2

    if-eqz v0, :cond_7f

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v1, p2, v2

    if-ne v0, v1, :cond_84

    .line 224
    :cond_7f
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 226
    :cond_84
    aget-object v0, p2, v2

    instance-of v0, v0, Ljava/lang/Number;

    if-eqz v0, :cond_97

    .line 227
    aget-object v0, p2, v2

    check-cast v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isSafeInteger(Ljava/lang/Number;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 229
    :cond_97
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1b

    .line 232
    :pswitch_9c
    invoke-static {p2}, Lorg/mozilla/javascript/NativeGlobal;->js_parseFloat([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_1b

    .line 235
    :pswitch_a2
    invoke-static {p2}, Lorg/mozilla/javascript/NativeGlobal;->js_parseInt([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_1b

    .line 193
    :pswitch_data_a8
    .packed-switch -0x6
        :pswitch_a2
        :pswitch_9c
        :pswitch_76
        :pswitch_50
        :pswitch_2e
        :pswitch_e
    .end packed-switch
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 5
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 28
    new-instance v0, Lorg/mozilla/javascript/NativeNumber;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/NativeNumber;-><init>(D)V

    .line 29
    .local v0, "obj":Lorg/mozilla/javascript/NativeNumber;
    const/16 v1, 0x8

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeNumber;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 30
    return-void
.end method

.method private isDoubleInteger(Ljava/lang/Double;)Z
    .registers 6
    .param p1, "d"    # Ljava/lang/Double;

    .prologue
    .line 298
    invoke-virtual {p1}, Ljava/lang/Double;->isInfinite()Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-virtual {p1}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    cmpl-double v0, v0, v2

    if-nez v0, :cond_1e

    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method private isDoubleNan(Ljava/lang/Double;)Z
    .registers 3
    .param p1, "d"    # Ljava/lang/Double;

    .prologue
    .line 287
    invoke-virtual {p1}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    return v0
.end method

.method private isDoubleSafeInteger(Ljava/lang/Double;)Z
    .registers 6
    .param p1, "d"    # Ljava/lang/Double;

    .prologue
    .line 310
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NativeNumber;->isDoubleInteger(Ljava/lang/Double;)Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    sget-wide v2, Lorg/mozilla/javascript/NativeNumber;->MAX_SAFE_INTEGER:D

    cmpg-double v0, v0, v2

    if-gtz v0, :cond_1c

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    sget-wide v2, Lorg/mozilla/javascript/NativeNumber;->MIN_SAFE_INTEGER:D

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_1c

    const/4 v0, 0x1

    :goto_1b
    return v0

    :cond_1c
    const/4 v0, 0x0

    goto :goto_1b
.end method

.method static isFinite(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 274
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .line 275
    .local v0, "d":D
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 276
    .local v2, "nd":Ljava/lang/Double;
    invoke-virtual {v2}, Ljava/lang/Double;->isInfinite()Z

    move-result v3

    if-nez v3, :cond_1a

    invoke-virtual {v2}, Ljava/lang/Double;->isNaN()Z

    move-result v3

    if-nez v3, :cond_1a

    const/4 v3, 0x1

    :goto_15
    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    return-object v3

    :cond_1a
    const/4 v3, 0x0

    goto :goto_15
.end method

.method private isInteger(Ljava/lang/Number;)Z
    .registers 4
    .param p1, "val"    # Ljava/lang/Number;

    .prologue
    .line 292
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 293
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isDoubleInteger(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private isNaN(Ljava/lang/Number;)Ljava/lang/Object;
    .registers 4
    .param p1, "val"    # Ljava/lang/Number;

    .prologue
    .line 281
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 282
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isDoubleNan(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method private isSafeInteger(Ljava/lang/Number;)Z
    .registers 4
    .param p1, "val"    # Ljava/lang/Number;

    .prologue
    .line 304
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/NativeNumber;->doubleVal(Ljava/lang/Number;)Ljava/lang/Double;

    move-result-object v0

    .line 305
    .local v0, "nd":Ljava/lang/Double;
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeNumber;->isDoubleSafeInteger(Ljava/lang/Double;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private static num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;
    .registers 15
    .param p0, "val"    # D
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "zeroArgMode"    # I
    .param p4, "oneArgMode"    # I
    .param p5, "precisionMin"    # I
    .param p6, "precisionOffset"    # I

    .prologue
    const/4 v7, 0x0

    .line 253
    array-length v5, p2

    if-nez v5, :cond_15

    .line 254
    const/4 v3, 0x0

    .line 255
    .local v3, "precision":I
    move p4, p3

    .line 267
    :goto_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 268
    .local v4, "sb":Ljava/lang/StringBuilder;
    add-int v5, v3, p6

    invoke-static {v4, p4, v5, p0, p1}, Lorg/mozilla/javascript/DToA;->JS_dtostr(Ljava/lang/StringBuilder;IID)V

    .line 269
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 259
    .end local v3    # "precision":I
    .end local v4    # "sb":Ljava/lang/StringBuilder;
    :cond_15
    aget-object v5, p2, v7

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v1

    .line 260
    .local v1, "p":D
    int-to-double v5, p5

    cmpg-double v5, v1, v5

    if-ltz v5, :cond_26

    const-wide/high16 v5, 0x4059000000000000L    # 100.0

    cmpl-double v5, v1, v5

    if-lez v5, :cond_39

    .line 261
    :cond_26
    const-string v5, "msg.bad.precision"

    aget-object v6, p2, v7

    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage1(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 263
    .local v0, "msg":Ljava/lang/String;
    const-string v5, "RangeError"

    invoke-static {v5, v0}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v5

    throw v5

    .line 265
    .end local v0    # "msg":Ljava/lang/String;
    :cond_39
    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(D)I

    move-result v3

    .restart local v3    # "precision":I
    goto :goto_6
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 18
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 103
    sget-object v3, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    .line 104
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 183
    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :goto_c
    return-object v3

    .line 106
    .restart local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :cond_d
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v9

    .line 107
    .local v9, "id":I
    const/4 v3, 0x1

    if-ne v9, v3, :cond_31

    .line 108
    move-object/from16 v0, p5

    array-length v3, v0

    const/4 v4, 0x1

    if-lt v3, v4, :cond_29

    const/4 v3, 0x0

    aget-object v3, p5, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v10

    .line 110
    .local v10, "val":D
    :goto_21
    if-nez p4, :cond_2c

    .line 112
    new-instance v3, Lorg/mozilla/javascript/NativeNumber;

    invoke-direct {v3, v10, v11}, Lorg/mozilla/javascript/NativeNumber;-><init>(D)V

    goto :goto_c

    .line 108
    .end local v10    # "val":D
    :cond_29
    const-wide/16 v10, 0x0

    goto :goto_21

    .line 115
    .restart local v10    # "val":D
    :cond_2c
    invoke-static {v10, v11}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    goto :goto_c

    .line 117
    .end local v10    # "val":D
    :cond_31
    const/4 v3, 0x1

    if-ge v9, v3, :cond_3b

    .line 118
    move-object/from16 v0, p5

    invoke-direct {p0, v9, v0}, Lorg/mozilla/javascript/NativeNumber;->execConstructorCall(I[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_c

    .line 123
    :cond_3b
    move-object/from16 v0, p4

    instance-of v3, v0, Lorg/mozilla/javascript/NativeNumber;

    if-nez v3, :cond_46

    .line 124
    invoke-static {p1}, Lorg/mozilla/javascript/NativeNumber;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 125
    :cond_46
    check-cast p4, Lorg/mozilla/javascript/NativeNumber;

    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p4

    iget-wide v1, v0, Lorg/mozilla/javascript/NativeNumber;->doubleValue:D

    .line 127
    .local v1, "value":D
    packed-switch v9, :pswitch_data_10e

    .line 187
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 133
    :pswitch_59
    move-object/from16 v0, p5

    array-length v3, v0

    if-eqz v3, :cond_65

    const/4 v3, 0x0

    aget-object v3, p5, v3

    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v3, v4, :cond_6c

    :cond_65
    const/16 v8, 0xa

    .line 135
    .local v8, "base":I
    :goto_67
    invoke-static {v1, v2, v8}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v3

    goto :goto_c

    .line 133
    .end local v8    # "base":I
    :cond_6c
    const/4 v3, 0x0

    aget-object v3, p5, v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v8

    goto :goto_67

    .line 139
    :pswitch_74
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "(new Number("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "))"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 142
    :pswitch_93
    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    goto/16 :goto_c

    .line 145
    :pswitch_99
    const/4 v4, 0x2

    const/4 v5, 0x2

    const/16 v6, -0x14

    const/4 v7, 0x0

    move-object/from16 v3, p5

    invoke-static/range {v1 .. v7}, Lorg/mozilla/javascript/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 150
    :pswitch_a6
    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_b0

    .line 151
    const-string v3, "NaN"

    goto/16 :goto_c

    .line 153
    :cond_b0
    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v3

    if-eqz v3, :cond_c4

    .line 154
    const-wide/16 v3, 0x0

    cmpl-double v3, v1, v3

    if-ltz v3, :cond_c0

    .line 155
    const-string v3, "Infinity"

    goto/16 :goto_c

    .line 158
    :cond_c0
    const-string v3, "-Infinity"

    goto/16 :goto_c

    .line 162
    :cond_c4
    const/4 v4, 0x1

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object/from16 v3, p5

    invoke-static/range {v1 .. v7}, Lorg/mozilla/javascript/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 168
    :pswitch_d0
    move-object/from16 v0, p5

    array-length v3, v0

    if-eqz v3, :cond_dc

    const/4 v3, 0x0

    aget-object v3, p5, v3

    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v3, v4, :cond_e4

    .line 169
    :cond_dc
    const/16 v3, 0xa

    invoke-static {v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 172
    :cond_e4
    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_ee

    .line 173
    const-string v3, "NaN"

    goto/16 :goto_c

    .line 175
    :cond_ee
    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v3

    if-eqz v3, :cond_102

    .line 176
    const-wide/16 v3, 0x0

    cmpl-double v3, v1, v3

    if-ltz v3, :cond_fe

    .line 177
    const-string v3, "Infinity"

    goto/16 :goto_c

    .line 180
    :cond_fe
    const-string v3, "-Infinity"

    goto/16 :goto_c

    .line 183
    :cond_102
    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v3, p5

    invoke-static/range {v1 .. v7}, Lorg/mozilla/javascript/NativeNumber;->num_to(D[Ljava/lang/Object;IIII)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 127
    :pswitch_data_10e
    .packed-switch 0x2
        :pswitch_59
        :pswitch_59
        :pswitch_74
        :pswitch_93
        :pswitch_99
        :pswitch_a6
        :pswitch_d0
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .registers 9
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x7

    .line 46
    const/4 v6, 0x7

    .line 50
    .local v6, "attr":I
    const-string v0, "NaN"

    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->NaNobj:Ljava/lang/Double;

    invoke-virtual {p1, v0, v1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 51
    const-string v0, "POSITIVE_INFINITY"

    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 54
    const-string v0, "NEGATIVE_INFINITY"

    const-wide/high16 v1, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 57
    const-string v0, "MAX_VALUE"

    const-wide v1, 0x7fefffffffffffffL    # Double.MAX_VALUE

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 60
    const-string v0, "MIN_VALUE"

    const-wide/16 v1, 0x1

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 63
    const-string v0, "MAX_SAFE_INTEGER"

    sget-wide v1, Lorg/mozilla/javascript/NativeNumber;->MAX_SAFE_INTEGER:D

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 66
    const-string v0, "MIN_SAFE_INTEGER"

    sget-wide v1, Lorg/mozilla/javascript/NativeNumber;->MIN_SAFE_INTEGER:D

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v0, v1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 70
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "isFinite"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 71
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x2

    const-string v4, "isNaN"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 72
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x3

    const-string v4, "isInteger"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 73
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x4

    const-string v4, "isSafeInteger"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 74
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "parseFloat"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 75
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    const/4 v3, -0x6

    const-string v4, "parseInt"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeNumber;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 77
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 78
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 8
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x74

    .line 332
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 333
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_58

    .line 349
    :cond_c
    :goto_c
    :pswitch_c
    if-eqz v0, :cond_17

    if-eq v0, p1, :cond_17

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    const/4 v2, 0x0

    .line 353
    :cond_17
    return v2

    .line 334
    :pswitch_18
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 335
    .local v1, "c":I
    if-ne v1, v4, :cond_22

    const-string v0, "toFixed"

    const/4 v2, 0x6

    goto :goto_c

    .line 336
    :cond_22
    const/16 v3, 0x76

    if-ne v1, v3, :cond_c

    const-string v0, "valueOf"

    const/4 v2, 0x5

    goto :goto_c

    .line 338
    .end local v1    # "c":I
    :pswitch_2a
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 339
    .restart local v1    # "c":I
    const/16 v3, 0x6f

    if-ne v1, v3, :cond_37

    const-string v0, "toSource"

    const/4 v2, 0x4

    goto :goto_c

    .line 340
    :cond_37
    if-ne v1, v4, :cond_c

    const-string v0, "toString"

    const/4 v2, 0x2

    goto :goto_c

    .line 342
    .end local v1    # "c":I
    :pswitch_3d
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 343
    .restart local v1    # "c":I
    const/16 v3, 0x63

    if-ne v1, v3, :cond_49

    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_c

    .line 344
    :cond_49
    if-ne v1, v4, :cond_c

    const-string v0, "toPrecision"

    const/16 v2, 0x8

    goto :goto_c

    .line 346
    .end local v1    # "c":I
    :pswitch_50
    const-string v0, "toExponential"

    const/4 v2, 0x7

    goto :goto_c

    .line 347
    :pswitch_54
    const-string v0, "toLocaleString"

    const/4 v2, 0x3

    goto :goto_c

    .line 333
    :pswitch_data_58
    .packed-switch 0x7
        :pswitch_18
        :pswitch_2a
        :pswitch_c
        :pswitch_c
        :pswitch_3d
        :pswitch_c
        :pswitch_50
        :pswitch_54
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    const-string v0, "Number"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 85
    packed-switch p1, :pswitch_data_32

    .line 94
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 86
    :pswitch_d
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 96
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/NativeNumber;->NUMBER_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeNumber;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 97
    return-void

    .line 87
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 88
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toLocaleString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 89
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 90
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 91
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toFixed"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 92
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toExponential"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 93
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toPrecision"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 85
    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
        :pswitch_1e
        :pswitch_22
        :pswitch_26
        :pswitch_2a
        :pswitch_2e
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 244
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeNumber;->doubleValue:D

    const/16 v2, 0xa

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->numberToString(DI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
