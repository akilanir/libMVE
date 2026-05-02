.class public Lorg/mozilla/javascript/NativeObject;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeObject.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/NativeObject$ValueCollection;,
        Lorg/mozilla/javascript/NativeObject$KeySet;,
        Lorg/mozilla/javascript/NativeObject$EntrySet;
    }
.end annotation


# static fields
.field private static final ConstructorId_create:I = -0x9

.field private static final ConstructorId_defineProperties:I = -0x8

.field private static final ConstructorId_defineProperty:I = -0x5

.field private static final ConstructorId_freeze:I = -0xd

.field private static final ConstructorId_getOwnPropertyDescriptor:I = -0x4

.field private static final ConstructorId_getOwnPropertyNames:I = -0x3

.field private static final ConstructorId_getPrototypeOf:I = -0x1

.field private static final ConstructorId_isExtensible:I = -0x6

.field private static final ConstructorId_isFrozen:I = -0xb

.field private static final ConstructorId_isSealed:I = -0xa

.field private static final ConstructorId_keys:I = -0x2

.field private static final ConstructorId_preventExtensions:I = -0x7

.field private static final ConstructorId_seal:I = -0xc

.field private static final Id___defineGetter__:I = 0x9

.field private static final Id___defineSetter__:I = 0xa

.field private static final Id___lookupGetter__:I = 0xb

.field private static final Id___lookupSetter__:I = 0xc

.field private static final Id_constructor:I = 0x1

.field private static final Id_hasOwnProperty:I = 0x5

.field private static final Id_isPrototypeOf:I = 0x7

.field private static final Id_propertyIsEnumerable:I = 0x6

.field private static final Id_toLocaleString:I = 0x3

.field private static final Id_toSource:I = 0x8

.field private static final Id_toString:I = 0x2

.field private static final Id_valueOf:I = 0x4

.field private static final MAX_PROTOTYPE_ID:I = 0xc

.field private static final OBJECT_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = -0x580f0dd5006845f4L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const-string v0, "Object"

    sput-object v0, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 591
    return-void
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 30
    new-instance v0, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 31
    .local v0, "obj":Lorg/mozilla/javascript/NativeObject;
    const/16 v1, 0xc

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeObject;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 32
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 477
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 427
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 428
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p0, p1, p0}, Lorg/mozilla/javascript/NativeObject;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    .line 432
    :goto_a
    return v0

    .line 429
    .restart local p1    # "key":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_1a

    .line 430
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p0, v0, p0}, Lorg/mozilla/javascript/NativeObject;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    goto :goto_a

    .line 432
    .restart local p1    # "key":Ljava/lang/Object;
    :cond_1a
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 436
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeObject;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 437
    .local v1, "obj":Ljava/lang/Object;
    if-eq p1, v1, :cond_1c

    if-eqz p1, :cond_8

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 439
    :cond_1c
    const/4 v2, 0x1

    .line 442
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_1d
    return v2

    :cond_1e
    const/4 v2, 0x0

    goto :goto_1d
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 465
    new-instance v0, Lorg/mozilla/javascript/NativeObject$EntrySet;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/NativeObject$EntrySet;-><init>(Lorg/mozilla/javascript/NativeObject;)V

    return-object v0
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 42
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 110
    sget-object v33, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_11

    .line 111
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    .line 415
    :goto_10
    return-object v25

    .line 113
    :cond_11
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v17

    .line 114
    .local v17, "id":I
    packed-switch v17, :pswitch_data_69c

    .line 420
    :pswitch_18
    new-instance v33, Ljava/lang/IllegalArgumentException;

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 116
    :pswitch_22
    if-eqz p4, :cond_31

    .line 118
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/IdFunctionObject;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v25

    goto :goto_10

    .line 120
    :cond_31
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    if-eqz v33, :cond_4a

    const/16 v33, 0x0

    aget-object v33, p5, v33

    if-eqz v33, :cond_4a

    const/16 v33, 0x0

    aget-object v33, p5, v33

    sget-object v34, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    if-ne v0, v1, :cond_50

    .line 123
    :cond_4a
    new-instance v25, Lorg/mozilla/javascript/NativeObject;

    invoke-direct/range {v25 .. v25}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    goto :goto_10

    .line 125
    :cond_50
    const/16 v33, 0x0

    aget-object v33, p5, v33

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, v33

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v25

    goto :goto_10

    .line 129
    :pswitch_5f
    const-string v33, "toString"

    move-object/from16 v0, p4

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v31

    .line 130
    .local v31, "toString":Ljava/lang/Object;
    move-object/from16 v0, v31

    instance-of v0, v0, Lorg/mozilla/javascript/Callable;

    move/from16 v33, v0

    if-nez v33, :cond_76

    .line 131
    invoke-static/range {v31 .. v31}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v33

    throw v33

    :cond_76
    move-object/from16 v12, v31

    .line 133
    check-cast v12, Lorg/mozilla/javascript/Callable;

    .line 134
    .local v12, "fun":Lorg/mozilla/javascript/Callable;
    sget-object v33, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, v33

    invoke-interface {v12, v0, v1, v2, v3}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    goto :goto_10

    .line 138
    .end local v12    # "fun":Lorg/mozilla/javascript/Callable;
    .end local v31    # "toString":Ljava/lang/Object;
    :pswitch_89
    const/16 v33, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v33

    if-eqz v33, :cond_d5

    .line 139
    invoke-static/range {p2 .. p5}, Lorg/mozilla/javascript/ScriptRuntime;->defaultObjectToSource(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v29

    .line 141
    .local v29, "s":Ljava/lang/String;
    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v4

    .line 142
    .local v4, "L":I
    if-eqz v4, :cond_d1

    const/16 v33, 0x0

    move-object/from16 v0, v29

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v33

    const/16 v34, 0x28

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_d1

    add-int/lit8 v33, v4, -0x1

    move-object/from16 v0, v29

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v33

    const/16 v34, 0x29

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_d1

    .line 144
    const/16 v33, 0x1

    add-int/lit8 v34, v4, -0x1

    move-object/from16 v0, v29

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v29

    :cond_d1
    move-object/from16 v25, v29

    .line 146
    goto/16 :goto_10

    .line 148
    .end local v4    # "L":I
    .end local v29    # "s":Ljava/lang/String;
    :cond_d5
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->defaultObjectToString(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/String;

    move-result-object v25

    goto/16 :goto_10

    :pswitch_db
    move-object/from16 v25, p4

    .line 152
    goto/16 :goto_10

    .line 156
    :pswitch_df
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_10a

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 157
    .local v5, "arg":Ljava/lang/Object;
    :goto_ee
    move-object/from16 v0, p2

    invoke-static {v0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v29

    .line 158
    .restart local v29    # "s":Ljava/lang/String;
    if-nez v29, :cond_10f

    .line 159
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v19

    .line 160
    .local v19, "index":I
    move-object/from16 v0, p4

    move/from16 v1, v19

    move-object/from16 v2, p4

    invoke-interface {v0, v1, v2}, Lorg/mozilla/javascript/Scriptable;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v28

    .line 164
    .end local v19    # "index":I
    .local v28, "result":Z
    :goto_104
    invoke-static/range {v28 .. v28}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v25

    goto/16 :goto_10

    .line 156
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v28    # "result":Z
    .end local v29    # "s":Ljava/lang/String;
    :cond_10a
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_ee

    .line 162
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v29    # "s":Ljava/lang/String;
    :cond_10f
    move-object/from16 v0, p4

    move-object/from16 v1, v29

    move-object/from16 v2, p4

    invoke-interface {v0, v1, v2}, Lorg/mozilla/javascript/Scriptable;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v28

    .restart local v28    # "result":Z
    goto :goto_104

    .line 169
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v28    # "result":Z
    .end local v29    # "s":Ljava/lang/String;
    :pswitch_11a
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_161

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 170
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_129
    move-object/from16 v0, p2

    invoke-static {v0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v29

    .line 171
    .restart local v29    # "s":Ljava/lang/String;
    if-nez v29, :cond_169

    .line 172
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v19

    .line 173
    .restart local v19    # "index":I
    move-object/from16 v0, p4

    move/from16 v1, v19

    move-object/from16 v2, p4

    invoke-interface {v0, v1, v2}, Lorg/mozilla/javascript/Scriptable;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v28

    .line 174
    .restart local v28    # "result":Z
    if-eqz v28, :cond_15b

    move-object/from16 v0, p4

    instance-of v0, v0, Lorg/mozilla/javascript/ScriptableObject;

    move/from16 v33, v0

    if-eqz v33, :cond_15b

    move-object/from16 v30, p4

    .line 175
    check-cast v30, Lorg/mozilla/javascript/ScriptableObject;

    .line 176
    .local v30, "so":Lorg/mozilla/javascript/ScriptableObject;
    move-object/from16 v0, v30

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getAttributes(I)I

    move-result v7

    .line 177
    .local v7, "attrs":I
    and-int/lit8 v33, v7, 0x2

    if-nez v33, :cond_166

    const/16 v28, 0x1

    .line 187
    .end local v7    # "attrs":I
    .end local v19    # "index":I
    .end local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    :cond_15b
    :goto_15b
    invoke-static/range {v28 .. v28}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v25

    goto/16 :goto_10

    .line 169
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v28    # "result":Z
    .end local v29    # "s":Ljava/lang/String;
    :cond_161
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_129

    .line 177
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v7    # "attrs":I
    .restart local v19    # "index":I
    .restart local v28    # "result":Z
    .restart local v29    # "s":Ljava/lang/String;
    .restart local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    :cond_166
    const/16 v28, 0x0

    goto :goto_15b

    .line 180
    .end local v7    # "attrs":I
    .end local v19    # "index":I
    .end local v28    # "result":Z
    .end local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    :cond_169
    move-object/from16 v0, p4

    move-object/from16 v1, v29

    move-object/from16 v2, p4

    invoke-interface {v0, v1, v2}, Lorg/mozilla/javascript/Scriptable;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v28

    .line 181
    .restart local v28    # "result":Z
    if-eqz v28, :cond_15b

    move-object/from16 v0, p4

    instance-of v0, v0, Lorg/mozilla/javascript/ScriptableObject;

    move/from16 v33, v0

    if-eqz v33, :cond_15b

    move-object/from16 v30, p4

    .line 182
    check-cast v30, Lorg/mozilla/javascript/ScriptableObject;

    .line 183
    .restart local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    move-object/from16 v0, v30

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getAttributes(Ljava/lang/String;)I

    move-result v7

    .line 184
    .restart local v7    # "attrs":I
    and-int/lit8 v33, v7, 0x2

    if-nez v33, :cond_190

    const/16 v28, 0x1

    :goto_18f
    goto :goto_15b

    :cond_190
    const/16 v28, 0x0

    goto :goto_18f

    .line 191
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v7    # "attrs":I
    .end local v28    # "result":Z
    .end local v29    # "s":Ljava/lang/String;
    .end local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_193
    const/16 v28, 0x0

    .line 192
    .restart local v28    # "result":Z
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    if-eqz v33, :cond_1ba

    const/16 v33, 0x0

    aget-object v33, p5, v33

    move-object/from16 v0, v33

    instance-of v0, v0, Lorg/mozilla/javascript/Scriptable;

    move/from16 v33, v0

    if-eqz v33, :cond_1ba

    .line 193
    const/16 v33, 0x0

    aget-object v32, p5, v33

    check-cast v32, Lorg/mozilla/javascript/Scriptable;

    .line 195
    .local v32, "v":Lorg/mozilla/javascript/Scriptable;
    :cond_1ae
    invoke-interface/range {v32 .. v32}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v32

    .line 196
    move-object/from16 v0, v32

    move-object/from16 v1, p4

    if-ne v0, v1, :cond_1c0

    .line 197
    const/16 v28, 0x1

    .line 202
    .end local v32    # "v":Lorg/mozilla/javascript/Scriptable;
    :cond_1ba
    :goto_1ba
    invoke-static/range {v28 .. v28}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v25

    goto/16 :goto_10

    .line 200
    .restart local v32    # "v":Lorg/mozilla/javascript/Scriptable;
    :cond_1c0
    if-nez v32, :cond_1ae

    goto :goto_1ba

    .line 206
    .end local v28    # "result":Z
    .end local v32    # "v":Lorg/mozilla/javascript/Scriptable;
    :pswitch_1c3
    invoke-static/range {p2 .. p5}, Lorg/mozilla/javascript/ScriptRuntime;->defaultObjectToSource(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    goto/16 :goto_10

    .line 211
    :pswitch_1c9
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x2

    move/from16 v0, v33

    move/from16 v1, v34

    if-lt v0, v1, :cond_1e2

    const/16 v33, 0x1

    aget-object v33, p5, v33

    move-object/from16 v0, v33

    instance-of v0, v0, Lorg/mozilla/javascript/Callable;

    move/from16 v33, v0

    if-nez v33, :cond_1fb

    .line 212
    :cond_1e2
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x2

    move/from16 v0, v33

    move/from16 v1, v34

    if-lt v0, v1, :cond_1f8

    const/16 v33, 0x1

    aget-object v8, p5, v33

    .line 214
    .local v8, "badArg":Ljava/lang/Object;
    :goto_1f3
    invoke-static {v8}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v33

    throw v33

    .line 212
    .end local v8    # "badArg":Ljava/lang/Object;
    :cond_1f8
    sget-object v8, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_1f3

    .line 216
    :cond_1fb
    move-object/from16 v0, p4

    instance-of v0, v0, Lorg/mozilla/javascript/ScriptableObject;

    move/from16 v33, v0

    if-nez v33, :cond_21a

    .line 217
    const-string v33, "msg.extend.scriptable"

    invoke-virtual/range {p4 .. p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v34

    const/16 v35, 0x0

    aget-object v35, p5, v35

    invoke-static/range {v35 .. v35}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v35

    invoke-static/range {v33 .. v35}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v33

    throw v33

    :cond_21a
    move-object/from16 v30, p4

    .line 222
    check-cast v30, Lorg/mozilla/javascript/ScriptableObject;

    .line 223
    .restart local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    const/16 v33, 0x0

    aget-object v33, p5, v33

    move-object/from16 v0, p2

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 224
    .local v22, "name":Ljava/lang/String;
    if-eqz v22, :cond_260

    const/16 v19, 0x0

    .line 226
    .restart local v19    # "index":I
    :goto_22e
    const/16 v33, 0x1

    aget-object v13, p5, v33

    check-cast v13, Lorg/mozilla/javascript/Callable;

    .line 227
    .local v13, "getterOrSetter":Lorg/mozilla/javascript/Callable;
    const/16 v33, 0xa

    move/from16 v0, v17

    move/from16 v1, v33

    if-ne v0, v1, :cond_265

    const/16 v20, 0x1

    .line 228
    .local v20, "isSetter":Z
    :goto_23e
    move-object/from16 v0, v30

    move-object/from16 v1, v22

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v13, v3}, Lorg/mozilla/javascript/ScriptableObject;->setGetterOrSetter(Ljava/lang/String;ILorg/mozilla/javascript/Callable;Z)V

    .line 229
    move-object/from16 v0, v30

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v33, v0

    if-eqz v33, :cond_25c

    .line 230
    check-cast v30, Lorg/mozilla/javascript/NativeArray;

    .end local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    const/16 v33, 0x0

    move-object/from16 v0, v30

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeArray;->setDenseOnly(Z)V

    .line 232
    :cond_25c
    sget-object v25, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 224
    .end local v13    # "getterOrSetter":Lorg/mozilla/javascript/Callable;
    .end local v19    # "index":I
    .end local v20    # "isSetter":Z
    .restart local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    :cond_260
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v19

    goto :goto_22e

    .line 227
    .restart local v13    # "getterOrSetter":Lorg/mozilla/javascript/Callable;
    .restart local v19    # "index":I
    :cond_265
    const/16 v20, 0x0

    goto :goto_23e

    .line 237
    .end local v13    # "getterOrSetter":Lorg/mozilla/javascript/Callable;
    .end local v19    # "index":I
    .end local v22    # "name":Ljava/lang/String;
    .end local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_268
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-lt v0, v1, :cond_27d

    move-object/from16 v0, p4

    instance-of v0, v0, Lorg/mozilla/javascript/ScriptableObject;

    move/from16 v33, v0

    if-nez v33, :cond_281

    .line 239
    :cond_27d
    sget-object v25, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    :cond_281
    move-object/from16 v30, p4

    .line 241
    check-cast v30, Lorg/mozilla/javascript/ScriptableObject;

    .line 242
    .restart local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    const/16 v33, 0x0

    aget-object v33, p5, v33

    move-object/from16 v0, p2

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toStringIdOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 243
    .restart local v22    # "name":Ljava/lang/String;
    if-eqz v22, :cond_2b3

    const/16 v19, 0x0

    .line 245
    .restart local v19    # "index":I
    :goto_295
    const/16 v33, 0xc

    move/from16 v0, v17

    move/from16 v1, v33

    if-ne v0, v1, :cond_2b8

    const/16 v20, 0x1

    .line 248
    .restart local v20    # "isSetter":Z
    :goto_29f
    move-object/from16 v0, v30

    move-object/from16 v1, v22

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptableObject;->getGetterOrSetter(Ljava/lang/String;IZ)Ljava/lang/Object;

    move-result-object v14

    .line 249
    .local v14, "gs":Ljava/lang/Object;
    if-eqz v14, :cond_2bb

    .line 261
    :cond_2ad
    if-eqz v14, :cond_2ce

    move-object/from16 v25, v14

    .line 262
    goto/16 :goto_10

    .line 243
    .end local v14    # "gs":Ljava/lang/Object;
    .end local v19    # "index":I
    .end local v20    # "isSetter":Z
    :cond_2b3
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastIndexResult(Lorg/mozilla/javascript/Context;)I

    move-result v19

    goto :goto_295

    .line 245
    .restart local v19    # "index":I
    :cond_2b8
    const/16 v20, 0x0

    goto :goto_29f

    .line 253
    .restart local v14    # "gs":Ljava/lang/Object;
    .restart local v20    # "isSetter":Z
    :cond_2bb
    invoke-virtual/range {v30 .. v30}, Lorg/mozilla/javascript/ScriptableObject;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v32

    .line 254
    .restart local v32    # "v":Lorg/mozilla/javascript/Scriptable;
    if-eqz v32, :cond_2ad

    .line 256
    move-object/from16 v0, v32

    instance-of v0, v0, Lorg/mozilla/javascript/ScriptableObject;

    move/from16 v33, v0

    if-eqz v33, :cond_2ad

    move-object/from16 v30, v32

    .line 257
    check-cast v30, Lorg/mozilla/javascript/ScriptableObject;

    .line 260
    goto :goto_29f

    .line 264
    .end local v32    # "v":Lorg/mozilla/javascript/Scriptable;
    :cond_2ce
    sget-object v25, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 268
    .end local v14    # "gs":Ljava/lang/Object;
    .end local v19    # "index":I
    .end local v20    # "isSetter":Z
    .end local v22    # "name":Ljava/lang/String;
    .end local v30    # "so":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_2d2
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_2eb

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 269
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_2e1
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptable(Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v25

    .line 270
    .local v25, "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-interface/range {v25 .. v25}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v25

    goto/16 :goto_10

    .line 268
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_2eb
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_2e1

    .line 274
    :pswitch_2f0
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_31c

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 275
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_2ff
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptable(Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v25

    .line 276
    .restart local v25    # "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-interface/range {v25 .. v25}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v18

    .line 277
    .local v18, "ids":[Ljava/lang/Object;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_308
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    if-ge v15, v0, :cond_321

    .line 278
    aget-object v33, v18, v15

    invoke-static/range {v33 .. v33}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v33

    aput-object v33, v18, v15

    .line 277
    add-int/lit8 v15, v15, 0x1

    goto :goto_308

    .line 274
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v15    # "i":I
    .end local v18    # "ids":[Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_31c
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_2ff

    .line 280
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v15    # "i":I
    .restart local v18    # "ids":[Ljava/lang/Object;
    .restart local v25    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_321
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v25

    goto/16 :goto_10

    .line 284
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v15    # "i":I
    .end local v18    # "ids":[Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/Scriptable;
    :pswitch_32d
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_359

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 285
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_33c
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 286
    .local v25, "obj":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v18

    .line 287
    .restart local v18    # "ids":[Ljava/lang/Object;
    const/4 v15, 0x0

    .restart local v15    # "i":I
    :goto_345
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    if-ge v15, v0, :cond_35e

    .line 288
    aget-object v33, v18, v15

    invoke-static/range {v33 .. v33}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v33

    aput-object v33, v18, v15

    .line 287
    add-int/lit8 v15, v15, 0x1

    goto :goto_345

    .line 284
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v15    # "i":I
    .end local v18    # "ids":[Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_359
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_33c

    .line 290
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v15    # "i":I
    .restart local v18    # "ids":[Ljava/lang/Object;
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_35e
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v25

    goto/16 :goto_10

    .line 294
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v15    # "i":I
    .end local v18    # "ids":[Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_36a
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_3a2

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 298
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_379
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 299
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x2

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_3a7

    sget-object v23, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 300
    .local v23, "nameArg":Ljava/lang/Object;
    :goto_38c
    invoke-static/range {v23 .. v23}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 301
    .restart local v22    # "name":Ljava/lang/String;
    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v10

    .line 302
    .local v10, "desc":Lorg/mozilla/javascript/Scriptable;
    if-nez v10, :cond_39e

    sget-object v10, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .end local v10    # "desc":Lorg/mozilla/javascript/Scriptable;
    :cond_39e
    move-object/from16 v25, v10

    goto/16 :goto_10

    .line 294
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v22    # "name":Ljava/lang/String;
    .end local v23    # "nameArg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_3a2
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_379

    .line 299
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_3a7
    const/16 v33, 0x1

    aget-object v23, p5, v33

    goto :goto_38c

    .line 306
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_3ac
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_3ec

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 307
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_3bb
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 308
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x2

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_3f1

    sget-object v22, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 309
    .local v22, "name":Ljava/lang/Object;
    :goto_3ce
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x3

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_3f6

    sget-object v11, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 310
    .local v11, "descArg":Ljava/lang/Object;
    :goto_3dd
    invoke-static {v11}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v10

    .line 311
    .local v10, "desc":Lorg/mozilla/javascript/ScriptableObject;
    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2, v10}, Lorg/mozilla/javascript/ScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;)V

    goto/16 :goto_10

    .line 306
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v10    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    .end local v11    # "descArg":Ljava/lang/Object;
    .end local v22    # "name":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_3ec
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_3bb

    .line 308
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_3f1
    const/16 v33, 0x1

    aget-object v22, p5, v33

    goto :goto_3ce

    .line 309
    .restart local v22    # "name":Ljava/lang/Object;
    :cond_3f6
    const/16 v33, 0x2

    aget-object v11, p5, v33

    goto :goto_3dd

    .line 316
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v22    # "name":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_3fb
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_418

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 317
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_40a
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 318
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->isExtensible()Z

    move-result v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v25

    goto/16 :goto_10

    .line 316
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_418
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_40a

    .line 322
    :pswitch_41d
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_435

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 323
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_42c
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 324
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->preventExtensions()V

    goto/16 :goto_10

    .line 322
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_435
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_42c

    .line 329
    :pswitch_43a
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_477

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 330
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_449
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 331
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x2

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_47c

    sget-object v27, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 332
    .local v27, "propsObj":Ljava/lang/Object;
    :goto_45c
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/NativeObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v33

    move-object/from16 v0, v27

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Context;->toObject(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v26

    .line 333
    .local v26, "props":Lorg/mozilla/javascript/Scriptable;
    invoke-static/range {v26 .. v26}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v33

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->defineOwnProperties(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/ScriptableObject;)V

    goto/16 :goto_10

    .line 329
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    .end local v26    # "props":Lorg/mozilla/javascript/Scriptable;
    .end local v27    # "propsObj":Ljava/lang/Object;
    :cond_477
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_449

    .line 331
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_47c
    const/16 v33, 0x1

    aget-object v27, p5, v33

    goto :goto_45c

    .line 338
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_481
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_4dd

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 339
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_490
    if-nez v5, :cond_4e2

    const/16 v25, 0x0

    .line 341
    .local v25, "obj":Lorg/mozilla/javascript/Scriptable;
    :goto_494
    new-instance v24, Lorg/mozilla/javascript/NativeObject;

    invoke-direct/range {v24 .. v24}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 342
    .local v24, "newObject":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/NativeObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v33

    move-object/from16 v0, v24

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 343
    invoke-virtual/range {v24 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 345
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_4d9

    const/16 v33, 0x1

    aget-object v33, p5, v33

    sget-object v34, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    if-eq v0, v1, :cond_4d9

    .line 346
    const/16 v33, 0x1

    aget-object v33, p5, v33

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/NativeObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lorg/mozilla/javascript/Context;->toObject(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v26

    .line 347
    .restart local v26    # "props":Lorg/mozilla/javascript/Scriptable;
    invoke-static/range {v26 .. v26}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v33

    move-object/from16 v0, v24

    move-object/from16 v1, p2

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->defineOwnProperties(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/ScriptableObject;)V

    .end local v26    # "props":Lorg/mozilla/javascript/Scriptable;
    :cond_4d9
    move-object/from16 v25, v24

    .line 350
    goto/16 :goto_10

    .line 338
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v24    # "newObject":Lorg/mozilla/javascript/ScriptableObject;
    .end local v25    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_4dd
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_490

    .line 339
    .restart local v5    # "arg":Ljava/lang/Object;
    :cond_4e2
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptable(Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v25

    goto :goto_494

    .line 354
    .end local v5    # "arg":Ljava/lang/Object;
    :pswitch_4e7
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_504

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 355
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_4f6
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 357
    .local v25, "obj":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->isExtensible()Z

    move-result v33

    if-eqz v33, :cond_509

    sget-object v25, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_10

    .line 354
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_504
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_4f6

    .line 359
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_509
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v6

    .local v6, "arr$":[Ljava/lang/Object;
    array-length v0, v6

    move/from16 v21, v0

    .local v21, "len$":I
    const/16 v16, 0x0

    .local v16, "i$":I
    :goto_512
    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_53b

    aget-object v22, v6, v16

    .line 360
    .restart local v22    # "name":Ljava/lang/Object;
    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v33

    const-string v34, "configurable"

    invoke-virtual/range {v33 .. v34}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 361
    .local v9, "configurable":Ljava/lang/Object;
    sget-object v33, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_538

    .line 362
    sget-object v25, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_10

    .line 359
    :cond_538
    add-int/lit8 v16, v16, 0x1

    goto :goto_512

    .line 365
    .end local v9    # "configurable":Ljava/lang/Object;
    .end local v22    # "name":Ljava/lang/Object;
    :cond_53b
    sget-object v25, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_10

    .line 369
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v6    # "arr$":[Ljava/lang/Object;
    .end local v16    # "i$":I
    .end local v21    # "len$":I
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_53f
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_55c

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 370
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_54e
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 372
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->isExtensible()Z

    move-result v33

    if-eqz v33, :cond_561

    sget-object v25, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_10

    .line 369
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_55c
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_54e

    .line 374
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_561
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "arr$":[Ljava/lang/Object;
    array-length v0, v6

    move/from16 v21, v0

    .restart local v21    # "len$":I
    const/16 v16, 0x0

    .restart local v16    # "i$":I
    :goto_56a
    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_5af

    aget-object v22, v6, v16

    .line 375
    .restart local v22    # "name":Ljava/lang/Object;
    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v10

    .line 376
    .restart local v10    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    sget-object v33, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v34, "configurable"

    move-object/from16 v0, v34

    invoke-virtual {v10, v0}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_590

    .line 377
    sget-object v25, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_10

    .line 378
    :cond_590
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/NativeObject;->isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v33

    if-eqz v33, :cond_5ac

    sget-object v33, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v34, "writable"

    move-object/from16 v0, v34

    invoke-virtual {v10, v0}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_5ac

    .line 379
    sget-object v25, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_10

    .line 374
    :cond_5ac
    add-int/lit8 v16, v16, 0x1

    goto :goto_56a

    .line 382
    .end local v10    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    .end local v22    # "name":Ljava/lang/Object;
    :cond_5af
    sget-object v25, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_10

    .line 386
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v6    # "arr$":[Ljava/lang/Object;
    .end local v16    # "i$":I
    .end local v21    # "len$":I
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_5b3
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_60c

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 387
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_5c2
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 389
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "arr$":[Ljava/lang/Object;
    array-length v0, v6

    move/from16 v21, v0

    .restart local v21    # "len$":I
    const/16 v16, 0x0

    .restart local v16    # "i$":I
    :goto_5cf
    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_611

    aget-object v22, v6, v16

    .line 390
    .restart local v22    # "name":Ljava/lang/Object;
    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v10

    .line 391
    .restart local v10    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    sget-object v33, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v34, "configurable"

    move-object/from16 v0, v34

    invoke-virtual {v10, v0}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_609

    .line 392
    const-string v33, "configurable"

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-virtual {v10, v0, v10, v1}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 393
    const/16 v33, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    move/from16 v3, v33

    invoke-virtual {v0, v1, v2, v10, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V

    .line 389
    :cond_609
    add-int/lit8 v16, v16, 0x1

    goto :goto_5cf

    .line 386
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v6    # "arr$":[Ljava/lang/Object;
    .end local v10    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    .end local v16    # "i$":I
    .end local v21    # "len$":I
    .end local v22    # "name":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_60c
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_5c2

    .line 396
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v6    # "arr$":[Ljava/lang/Object;
    .restart local v16    # "i$":I
    .restart local v21    # "len$":I
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_611
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->preventExtensions()V

    goto/16 :goto_10

    .line 402
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v6    # "arr$":[Ljava/lang/Object;
    .end local v16    # "i$":I
    .end local v21    # "len$":I
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :pswitch_616
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_692

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 403
    .restart local v5    # "arg":Ljava/lang/Object;
    :goto_625
    invoke-static {v5}, Lorg/mozilla/javascript/NativeObject;->ensureScriptableObject(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v25

    .line 405
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v6

    .restart local v6    # "arr$":[Ljava/lang/Object;
    array-length v0, v6

    move/from16 v21, v0

    .restart local v21    # "len$":I
    const/16 v16, 0x0

    .restart local v16    # "i$":I
    :goto_632
    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_697

    aget-object v22, v6, v16

    .line 406
    .restart local v22    # "name":Ljava/lang/Object;
    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v10

    .line 407
    .restart local v10    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/mozilla/javascript/NativeObject;->isDataDescriptor(Lorg/mozilla/javascript/ScriptableObject;)Z

    move-result v33

    if-eqz v33, :cond_667

    sget-object v33, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v34, "writable"

    move-object/from16 v0, v34

    invoke-virtual {v10, v0}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_667

    .line 408
    const-string v33, "writable"

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-virtual {v10, v0, v10, v1}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 409
    :cond_667
    sget-object v33, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v34, "configurable"

    move-object/from16 v0, v34

    invoke-virtual {v10, v0}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_682

    .line 410
    const-string v33, "configurable"

    sget-object v34, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-virtual {v10, v0, v10, v1}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 411
    :cond_682
    const/16 v33, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    move/from16 v3, v33

    invoke-virtual {v0, v1, v2, v10, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V

    .line 405
    add-int/lit8 v16, v16, 0x1

    goto :goto_632

    .line 402
    .end local v5    # "arg":Ljava/lang/Object;
    .end local v6    # "arr$":[Ljava/lang/Object;
    .end local v10    # "desc":Lorg/mozilla/javascript/ScriptableObject;
    .end local v16    # "i$":I
    .end local v21    # "len$":I
    .end local v22    # "name":Ljava/lang/Object;
    .end local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_692
    const/16 v33, 0x0

    aget-object v5, p5, v33

    goto :goto_625

    .line 413
    .restart local v5    # "arg":Ljava/lang/Object;
    .restart local v6    # "arr$":[Ljava/lang/Object;
    .restart local v16    # "i$":I
    .restart local v21    # "len$":I
    .restart local v25    # "obj":Lorg/mozilla/javascript/ScriptableObject;
    :cond_697
    invoke-virtual/range {v25 .. v25}, Lorg/mozilla/javascript/ScriptableObject;->preventExtensions()V

    goto/16 :goto_10

    .line 114
    :pswitch_data_69c
    .packed-switch -0xd
        :pswitch_616
        :pswitch_5b3
        :pswitch_53f
        :pswitch_4e7
        :pswitch_481
        :pswitch_43a
        :pswitch_41d
        :pswitch_3fb
        :pswitch_3ac
        :pswitch_36a
        :pswitch_32d
        :pswitch_2f0
        :pswitch_2d2
        :pswitch_18
        :pswitch_22
        :pswitch_89
        :pswitch_5f
        :pswitch_db
        :pswitch_df
        :pswitch_11a
        :pswitch_193
        :pswitch_1c3
        :pswitch_1c9
        :pswitch_1c9
        :pswitch_268
        :pswitch_268
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .registers 8
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 49
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x1

    const-string v4, "getPrototypeOf"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 51
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x2

    const-string v4, "keys"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 53
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x3

    const-string v4, "getOwnPropertyNames"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 55
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x4

    const-string v4, "getOwnPropertyDescriptor"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 57
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "defineProperty"

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 59
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x6

    const-string v4, "isExtensible"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 61
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x7

    const-string v4, "preventExtensions"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 63
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/4 v3, -0x8

    const-string v4, "defineProperties"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 65
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v3, -0x9

    const-string v4, "create"

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 67
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v3, -0xa

    const-string v4, "isSealed"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 69
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v3, -0xb

    const-string v4, "isFrozen"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 71
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v3, -0xc

    const-string v4, "seal"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 73
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    const/16 v3, -0xd

    const-string v4, "freeze"

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeObject;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 75
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 76
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 10
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x74

    const/16 v6, 0x53

    const/16 v5, 0x47

    const/16 v4, 0x8

    .line 632
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 633
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_86

    .line 659
    :cond_11
    :goto_11
    :pswitch_11
    if-eqz v0, :cond_1c

    if-eq v0, p1, :cond_1c

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c

    const/4 v2, 0x0

    .line 663
    :cond_1c
    return v2

    .line 634
    :pswitch_1d
    const-string v0, "valueOf"

    const/4 v2, 0x4

    goto :goto_11

    .line 635
    :pswitch_21
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 636
    .local v1, "c":I
    const/16 v3, 0x6f

    if-ne v1, v3, :cond_2f

    const-string v0, "toSource"

    const/16 v2, 0x8

    goto :goto_11

    .line 637
    :cond_2f
    if-ne v1, v7, :cond_11

    const-string v0, "toString"

    const/4 v2, 0x2

    goto :goto_11

    .line 639
    .end local v1    # "c":I
    :pswitch_35
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_11

    .line 640
    :pswitch_39
    const-string v0, "isPrototypeOf"

    const/4 v2, 0x7

    goto :goto_11

    .line 641
    :pswitch_3d
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 642
    .restart local v1    # "c":I
    const/16 v3, 0x68

    if-ne v1, v3, :cond_4a

    const-string v0, "hasOwnProperty"

    const/4 v2, 0x5

    goto :goto_11

    .line 643
    :cond_4a
    if-ne v1, v7, :cond_11

    const-string v0, "toLocaleString"

    const/4 v2, 0x3

    goto :goto_11

    .line 645
    .end local v1    # "c":I
    :pswitch_50
    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 646
    .restart local v1    # "c":I
    const/16 v3, 0x64

    if-ne v1, v3, :cond_6b

    .line 647
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 648
    if-ne v1, v5, :cond_64

    const-string v0, "__defineGetter__"

    const/16 v2, 0x9

    goto :goto_11

    .line 649
    :cond_64
    if-ne v1, v6, :cond_11

    const-string v0, "__defineSetter__"

    const/16 v2, 0xa

    goto :goto_11

    .line 651
    :cond_6b
    const/16 v3, 0x6c

    if-ne v1, v3, :cond_11

    .line 652
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 653
    if-ne v1, v5, :cond_7a

    const-string v0, "__lookupGetter__"

    const/16 v2, 0xb

    goto :goto_11

    .line 654
    :cond_7a
    if-ne v1, v6, :cond_11

    const-string v0, "__lookupSetter__"

    const/16 v2, 0xc

    goto :goto_11

    .line 657
    .end local v1    # "c":I
    :pswitch_81
    const-string v0, "propertyIsEnumerable"

    const/4 v2, 0x6

    goto :goto_11

    .line 633
    nop

    :pswitch_data_86
    .packed-switch 0x7
        :pswitch_1d
        :pswitch_21
        :pswitch_11
        :pswitch_11
        :pswitch_35
        :pswitch_11
        :pswitch_39
        :pswitch_3d
        :pswitch_11
        :pswitch_50
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_81
    .end packed-switch
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    const-string v0, "Object"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 83
    packed-switch p1, :pswitch_data_42

    .line 101
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 84
    :pswitch_d
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 103
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/NativeObject;->OBJECT_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeObject;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 104
    return-void

    .line 85
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 86
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 87
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 88
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "hasOwnProperty"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 90
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "propertyIsEnumerable"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 91
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "isPrototypeOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 92
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 94
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_32
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "__defineGetter__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 96
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_36
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "__defineSetter__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 98
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "__lookupGetter__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 100
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "__lookupSetter__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 83
    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
        :pswitch_1e
        :pswitch_22
        :pswitch_26
        :pswitch_2a
        :pswitch_2e
        :pswitch_32
        :pswitch_36
        :pswitch_3a
        :pswitch_3e
    .end packed-switch
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 457
    new-instance v0, Lorg/mozilla/javascript/NativeObject$KeySet;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/NativeObject$KeySet;-><init>(Lorg/mozilla/javascript/NativeObject;)V

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 469
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 3
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 473
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 446
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/NativeObject;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 447
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_e

    .line 448
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/NativeObject;->delete(Ljava/lang/String;)V

    .line 452
    :cond_d
    :goto_d
    return-object v0

    .line 449
    .restart local p1    # "key":Ljava/lang/Object;
    :cond_e
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_d

    .line 450
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/NativeObject;->delete(I)V

    goto :goto_d
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->defaultObjectToString(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 461
    new-instance v0, Lorg/mozilla/javascript/NativeObject$ValueCollection;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/NativeObject$ValueCollection;-><init>(Lorg/mozilla/javascript/NativeObject;)V

    return-object v0
.end method
