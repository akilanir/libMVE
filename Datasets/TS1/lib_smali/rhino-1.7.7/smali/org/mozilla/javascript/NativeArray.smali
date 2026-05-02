.class public Lorg/mozilla/javascript/NativeArray;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeArray.java"

# interfaces
.implements Ljava/util/List;


# static fields
.field private static final ARRAY_TAG:Ljava/lang/Object;

.field private static final ConstructorId_concat:I = -0xd

.field private static final ConstructorId_every:I = -0x11

.field private static final ConstructorId_filter:I = -0x12

.field private static final ConstructorId_find:I = -0x16

.field private static final ConstructorId_findIndex:I = -0x17

.field private static final ConstructorId_forEach:I = -0x13

.field private static final ConstructorId_indexOf:I = -0xf

.field private static final ConstructorId_isArray:I = -0x1a

.field private static final ConstructorId_join:I = -0x5

.field private static final ConstructorId_lastIndexOf:I = -0x10

.field private static final ConstructorId_map:I = -0x14

.field private static final ConstructorId_pop:I = -0x9

.field private static final ConstructorId_push:I = -0x8

.field private static final ConstructorId_reduce:I = -0x18

.field private static final ConstructorId_reduceRight:I = -0x19

.field private static final ConstructorId_reverse:I = -0x6

.field private static final ConstructorId_shift:I = -0xa

.field private static final ConstructorId_slice:I = -0xe

.field private static final ConstructorId_some:I = -0x15

.field private static final ConstructorId_sort:I = -0x7

.field private static final ConstructorId_splice:I = -0xc

.field private static final ConstructorId_unshift:I = -0xb

.field private static final DEFAULT_INITIAL_CAPACITY:I = 0xa

.field private static final GROW_FACTOR:D = 1.5

.field private static final Id_concat:I = 0xd

.field private static final Id_constructor:I = 0x1

.field private static final Id_every:I = 0x11

.field private static final Id_filter:I = 0x12

.field private static final Id_find:I = 0x16

.field private static final Id_findIndex:I = 0x17

.field private static final Id_forEach:I = 0x13

.field private static final Id_indexOf:I = 0xf

.field private static final Id_join:I = 0x5

.field private static final Id_lastIndexOf:I = 0x10

.field private static final Id_length:I = 0x1

.field private static final Id_map:I = 0x14

.field private static final Id_pop:I = 0x9

.field private static final Id_push:I = 0x8

.field private static final Id_reduce:I = 0x18

.field private static final Id_reduceRight:I = 0x19

.field private static final Id_reverse:I = 0x6

.field private static final Id_shift:I = 0xa

.field private static final Id_slice:I = 0xe

.field private static final Id_some:I = 0x15

.field private static final Id_sort:I = 0x7

.field private static final Id_splice:I = 0xc

.field private static final Id_toLocaleString:I = 0x3

.field private static final Id_toSource:I = 0x4

.field private static final Id_toString:I = 0x2

.field private static final Id_unshift:I = 0xb

.field private static final MAX_INSTANCE_ID:I = 0x1

.field private static final MAX_PRE_GROW_SIZE:I = 0x55555554

.field private static final MAX_PROTOTYPE_ID:I = 0x19

.field private static final NEGATIVE_ONE:Ljava/lang/Integer;

.field private static maximumInitialCapacity:I = 0x0

.field static final serialVersionUID:J = 0x65be3f5055db7c6aL


# instance fields
.field private dense:[Ljava/lang/Object;

.field private denseOnly:Z

.field private length:J

.field private lengthAttr:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const-string v0, "Array"

    sput-object v0, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    .line 43
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    .line 2079
    const/16 v0, 0x2710

    sput v0, Lorg/mozilla/javascript/NativeArray;->maximumInitialCapacity:I

    return-void
.end method

.method public constructor <init>(J)V
    .registers 6
    .param p1, "lengthArg"    # J

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 2063
    const/4 v1, 0x6

    iput v1, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    .line 61
    sget v1, Lorg/mozilla/javascript/NativeArray;->maximumInitialCapacity:I

    int-to-long v1, v1

    cmp-long v1, p1, v1

    if-gtz v1, :cond_29

    const/4 v1, 0x1

    :goto_e
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 62
    iget-boolean v1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v1, :cond_26

    .line 63
    long-to-int v0, p1

    .line 64
    .local v0, "intLength":I
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1b

    .line 65
    const/16 v0, 0xa

    .line 66
    :cond_1b
    new-array v1, v0, [Ljava/lang/Object;

    iput-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 67
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    sget-object v2, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 69
    .end local v0    # "intLength":I
    :cond_26
    iput-wide p1, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 70
    return-void

    .line 61
    :cond_29
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .registers 4
    .param p1, "array"    # [Ljava/lang/Object;

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 2063
    const/4 v0, 0x6

    iput v0, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 75
    iput-object p1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 76
    array-length v0, p1

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 77
    return-void
.end method

.method private defaultIndexPropertyDescriptor(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;
    .registers 8
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 537
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 538
    .local v1, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_9

    move-object v1, p0

    .line 539
    :cond_9
    new-instance v0, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 540
    .local v0, "desc":Lorg/mozilla/javascript/ScriptableObject;
    sget-object v2, Lorg/mozilla/javascript/TopLevel$Builtins;->Object:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    .line 541
    const-string v2, "value"

    invoke-virtual {v0, v2, p1, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 542
    const-string v2, "writable"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 543
    const-string v2, "enumerable"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 544
    const-string v2, "configurable"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 545
    return-object v0
.end method

.method private static defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V
    .registers 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 765
    const-wide/32 v1, 0x7fffffff

    cmp-long v1, p2, v1

    if-lez v1, :cond_f

    .line 766
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 767
    .local v0, "id":Ljava/lang/String;
    invoke-interface {p1, v0, p1, p4}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 771
    .end local v0    # "id":Ljava/lang/String;
    :goto_e
    return-void

    .line 769
    :cond_f
    long-to-int v1, p2

    invoke-interface {p1, v1, p1, p4}, Lorg/mozilla/javascript/Scriptable;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_e
.end method

.method private static deleteElem(Lorg/mozilla/javascript/Scriptable;J)V
    .registers 6
    .param p0, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # J

    .prologue
    .line 742
    long-to-int v0, p1

    .line 743
    .local v0, "i":I
    int-to-long v1, v0

    cmp-long v1, v1, p1

    if-nez v1, :cond_a

    invoke-interface {p0, v0}, Lorg/mozilla/javascript/Scriptable;->delete(I)V

    .line 745
    :goto_9
    return-void

    .line 744
    :cond_a
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Lorg/mozilla/javascript/Scriptable;->delete(Ljava/lang/String;)V

    goto :goto_9
.end method

.method private ensureCapacity(I)Z
    .registers 8
    .param p1, "capacity"    # I

    .prologue
    const/4 v1, 0x0

    .line 412
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v2

    if-le p1, v2, :cond_2f

    .line 413
    const v2, 0x55555554

    if-le p1, v2, :cond_e

    .line 414
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 424
    :goto_d
    return v1

    .line 417
    :cond_e
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v2, v4

    double-to-int v2, v2

    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 418
    new-array v0, p1, [Ljava/lang/Object;

    .line 419
    .local v0, "newDense":[Ljava/lang/Object;
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-object v3, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v3, v3

    invoke-static {v2, v1, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 420
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v1, v1

    array-length v2, v0

    sget-object v3, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 422
    iput-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 424
    .end local v0    # "newDense":[Ljava/lang/Object;
    :cond_2f
    const/4 v1, 0x1

    goto :goto_d
.end method

.method private static getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;
    .registers 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "index"    # J

    .prologue
    .line 749
    invoke-static {p1, p2, p3}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 750
    .local v0, "elem":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_9

    .end local v0    # "elem":Ljava/lang/Object;
    :goto_8
    return-object v0

    .restart local v0    # "elem":Ljava/lang/Object;
    :cond_9
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_8
.end method

.method static getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J
    .registers 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 715
    instance-of v1, p1, Lorg/mozilla/javascript/NativeString;

    if-eqz v1, :cond_c

    .line 716
    check-cast p1, Lorg/mozilla/javascript/NativeString;

    .end local p1    # "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeString;->getLength()I

    move-result v1

    int-to-long v1, v1

    .line 725
    :goto_b
    return-wide v1

    .line 717
    .restart local p1    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_c
    instance-of v1, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v1, :cond_17

    .line 718
    check-cast p1, Lorg/mozilla/javascript/NativeArray;

    .end local p1    # "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeArray;->getLength()J

    move-result-wide v1

    goto :goto_b

    .line 720
    .restart local p1    # "obj":Lorg/mozilla/javascript/Scriptable;
    :cond_17
    const-string v1, "length"

    invoke-static {p1, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 721
    .local v0, "len":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v0, v1, :cond_24

    .line 723
    const-wide/16 v1, 0x0

    goto :goto_b

    .line 725
    :cond_24
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v1

    goto :goto_b
.end method

.method static getMaximumInitialCapacity()I
    .registers 1

    .prologue
    .line 52
    sget v0, Lorg/mozilla/javascript/NativeArray;->maximumInitialCapacity:I

    return v0
.end method

.method private static getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;
    .registers 5
    .param p0, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "index"    # J

    .prologue
    .line 755
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p1, v0

    if-lez v0, :cond_10

    .line 756
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 758
    :goto_f
    return-object v0

    :cond_10
    long-to-int v0, p1

    invoke-static {p0, v0}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_f
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 5
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 47
    new-instance v0, Lorg/mozilla/javascript/NativeArray;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;-><init>(J)V

    .line 48
    .local v0, "obj":Lorg/mozilla/javascript/NativeArray;
    const/16 v1, 0x19

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeArray;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 49
    return-void
.end method

.method private static iterativeMethod(Lorg/mozilla/javascript/Context;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "id"    # I
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1599
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v14

    .line 1600
    .local v14, "length":J
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v20, v0

    if-lez v20, :cond_20

    const/16 v20, 0x0

    aget-object v4, p4, v20

    .line 1601
    .local v4, "callbackArg":Ljava/lang/Object;
    :goto_13
    if-eqz v4, :cond_1b

    instance-of v0, v4, Lorg/mozilla/javascript/Function;

    move/from16 v20, v0

    if-nez v20, :cond_23

    .line 1602
    :cond_1b
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v20

    throw v20

    .line 1600
    .end local v4    # "callbackArg":Ljava/lang/Object;
    :cond_20
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_13

    .line 1603
    .restart local v4    # "callbackArg":Ljava/lang/Object;
    :cond_23
    const/16 v20, 0x16

    move/from16 v0, p1

    move/from16 v1, v20

    if-eq v0, v1, :cond_33

    const/16 v20, 0x17

    move/from16 v0, p1

    move/from16 v1, v20

    if-ne v0, v1, :cond_3e

    :cond_33
    instance-of v0, v4, Lorg/mozilla/javascript/NativeFunction;

    move/from16 v20, v0

    if-nez v20, :cond_3e

    .line 1604
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v20

    throw v20

    :cond_3e
    move-object v6, v4

    .line 1607
    check-cast v6, Lorg/mozilla/javascript/Function;

    .line 1608
    .local v6, "f":Lorg/mozilla/javascript/Function;
    invoke-static {v6}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v16

    .line 1610
    .local v16, "parent":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p4

    array-length v0, v0

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_64

    const/16 v20, 0x1

    aget-object v20, p4, v20

    if-eqz v20, :cond_64

    const/16 v20, 0x1

    aget-object v20, p4, v20

    sget-object v21, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_83

    .line 1611
    :cond_64
    move-object/from16 v19, v16

    .line 1616
    .local v19, "thisArg":Lorg/mozilla/javascript/Scriptable;
    :goto_66
    const/16 v20, 0x16

    move/from16 v0, v20

    move/from16 v1, p1

    if-eq v0, v1, :cond_76

    const/16 v20, 0x17

    move/from16 v0, v20

    move/from16 v1, p1

    if-ne v0, v1, :cond_92

    :cond_76
    move-object/from16 v0, v19

    move-object/from16 v1, p3

    if-ne v0, v1, :cond_92

    .line 1617
    const-string v20, "Array.prototype method called on null or undefined"

    invoke-static/range {v20 .. v20}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v20

    throw v20

    .line 1613
    .end local v19    # "thisArg":Lorg/mozilla/javascript/Scriptable;
    :cond_83
    const/16 v20, 0x1

    aget-object v20, p4, v20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v19

    .restart local v19    # "thisArg":Lorg/mozilla/javascript/Scriptable;
    goto :goto_66

    .line 1620
    :cond_92
    const/4 v3, 0x0

    .line 1621
    .local v3, "array":Lorg/mozilla/javascript/Scriptable;
    const/16 v20, 0x12

    move/from16 v0, p1

    move/from16 v1, v20

    if-eq v0, v1, :cond_a3

    const/16 v20, 0x14

    move/from16 v0, p1

    move/from16 v1, v20

    if-ne v0, v1, :cond_b8

    .line 1622
    :cond_a3
    const/16 v20, 0x14

    move/from16 v0, p1

    move/from16 v1, v20

    if-ne v0, v1, :cond_da

    long-to-int v0, v14

    move/from16 v18, v0

    .line 1623
    .local v18, "resultLength":I
    :goto_ae
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    .line 1625
    .end local v18    # "resultLength":I
    :cond_b8
    const-wide/16 v10, 0x0

    .line 1626
    .local v10, "j":J
    const-wide/16 v7, 0x0

    .local v7, "i":J
    move-wide v12, v10

    .end local v10    # "j":J
    .local v12, "j":J
    :goto_bd
    cmp-long v20, v7, v14

    if-gez v20, :cond_144

    .line 1627
    const/16 v20, 0x3

    move/from16 v0, v20

    new-array v9, v0, [Ljava/lang/Object;

    .line 1628
    .local v9, "innerArgs":[Ljava/lang/Object;
    move-object/from16 v0, p3

    invoke-static {v0, v7, v8}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    .line 1629
    .local v5, "elem":Ljava/lang/Object;
    sget-object v20, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v20

    if-ne v5, v0, :cond_dd

    move-wide v10, v12

    .line 1626
    .end local v12    # "j":J
    .restart local v10    # "j":J
    :goto_d4
    const-wide/16 v20, 0x1

    add-long v7, v7, v20

    move-wide v12, v10

    .end local v10    # "j":J
    .restart local v12    # "j":J
    goto :goto_bd

    .line 1622
    .end local v5    # "elem":Ljava/lang/Object;
    .end local v7    # "i":J
    .end local v9    # "innerArgs":[Ljava/lang/Object;
    .end local v12    # "j":J
    :cond_da
    const/16 v18, 0x0

    goto :goto_ae

    .line 1632
    .restart local v5    # "elem":Ljava/lang/Object;
    .restart local v7    # "i":J
    .restart local v9    # "innerArgs":[Ljava/lang/Object;
    .restart local v12    # "j":J
    :cond_dd
    const/16 v20, 0x0

    aput-object v5, v9, v20

    .line 1633
    const/16 v20, 0x1

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v9, v20

    .line 1634
    const/16 v20, 0x2

    aput-object p3, v9, v20

    .line 1635
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v19

    invoke-interface {v6, v0, v1, v2, v9}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    .line 1636
    .local v17, "result":Ljava/lang/Object;
    packed-switch p1, :pswitch_data_15a

    :cond_fa
    move-wide v10, v12

    .end local v12    # "j":J
    .restart local v10    # "j":J
    goto :goto_d4

    .line 1638
    .end local v10    # "j":J
    .restart local v12    # "j":J
    :pswitch_fc
    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_fa

    .line 1639
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 1676
    .end local v5    # "elem":Ljava/lang/Object;
    .end local v9    # "innerArgs":[Ljava/lang/Object;
    .end local v17    # "result":Ljava/lang/Object;
    :goto_104
    return-object v5

    .line 1642
    .restart local v5    # "elem":Ljava/lang/Object;
    .restart local v9    # "innerArgs":[Ljava/lang/Object;
    .restart local v17    # "result":Ljava/lang/Object;
    :pswitch_105
    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_fa

    .line 1643
    const-wide/16 v20, 0x1

    add-long v10, v12, v20

    .end local v12    # "j":J
    .restart local v10    # "j":J
    const/16 v20, 0x0

    aget-object v20, v9, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-static {v0, v3, v12, v13, v1}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    goto :goto_d4

    .end local v10    # "j":J
    .restart local v12    # "j":J
    :pswitch_11b
    move-wide v10, v12

    .line 1646
    .end local v12    # "j":J
    .restart local v10    # "j":J
    goto :goto_d4

    .line 1648
    .end local v10    # "j":J
    .restart local v12    # "j":J
    :pswitch_11d
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-static {v0, v3, v7, v8, v1}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    move-wide v10, v12

    .line 1649
    .end local v12    # "j":J
    .restart local v10    # "j":J
    goto :goto_d4

    .line 1651
    .end local v10    # "j":J
    .restart local v12    # "j":J
    :pswitch_126
    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_fa

    .line 1652
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_104

    .line 1655
    :pswitch_12f
    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_fa

    goto :goto_104

    .line 1659
    :pswitch_136
    invoke-static/range {v17 .. v17}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_fa

    .line 1660
    long-to-double v0, v7

    move-wide/from16 v20, v0

    invoke-static/range {v20 .. v21}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    goto :goto_104

    .line 1664
    .end local v5    # "elem":Ljava/lang/Object;
    .end local v9    # "innerArgs":[Ljava/lang/Object;
    .end local v17    # "result":Ljava/lang/Object;
    :cond_144
    packed-switch p1, :pswitch_data_16c

    .line 1676
    :pswitch_147
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_104

    .line 1666
    :pswitch_14a
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_104

    :pswitch_14d
    move-object v5, v3

    .line 1669
    goto :goto_104

    .line 1671
    :pswitch_14f
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_104

    .line 1673
    :pswitch_152
    const-wide/high16 v20, -0x4010000000000000L    # -1.0

    invoke-static/range {v20 .. v21}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    goto :goto_104

    .line 1636
    nop

    :pswitch_data_15a
    .packed-switch 0x11
        :pswitch_fc
        :pswitch_105
        :pswitch_11b
        :pswitch_11d
        :pswitch_126
        :pswitch_12f
        :pswitch_136
    .end packed-switch

    .line 1664
    :pswitch_data_16c
    .packed-switch 0x11
        :pswitch_14a
        :pswitch_14d
        :pswitch_147
        :pswitch_14d
        :pswitch_14f
        :pswitch_147
        :pswitch_152
    .end packed-switch
.end method

.method private static jsConstructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 596
    array-length v4, p2

    if-nez v4, :cond_b

    .line 597
    new-instance v4, Lorg/mozilla/javascript/NativeArray;

    const-wide/16 v5, 0x0

    invoke-direct {v4, v5, v6}, Lorg/mozilla/javascript/NativeArray;-><init>(J)V

    .line 614
    :goto_a
    return-object v4

    .line 602
    :cond_b
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v4

    const/16 v5, 0x78

    if-ne v4, v5, :cond_19

    .line 603
    new-instance v4, Lorg/mozilla/javascript/NativeArray;

    invoke-direct {v4, p2}, Lorg/mozilla/javascript/NativeArray;-><init>([Ljava/lang/Object;)V

    goto :goto_a

    .line 605
    :cond_19
    const/4 v4, 0x0

    aget-object v0, p2, v4

    .line 606
    .local v0, "arg0":Ljava/lang/Object;
    array-length v4, p2

    const/4 v5, 0x1

    if-gt v4, v5, :cond_24

    instance-of v4, v0, Ljava/lang/Number;

    if-nez v4, :cond_2a

    .line 607
    :cond_24
    new-instance v4, Lorg/mozilla/javascript/NativeArray;

    invoke-direct {v4, p2}, Lorg/mozilla/javascript/NativeArray;-><init>([Ljava/lang/Object;)V

    goto :goto_a

    .line 609
    :cond_2a
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(Ljava/lang/Object;)J

    move-result-wide v1

    .line 610
    .local v1, "len":J
    long-to-double v4, v1

    check-cast v0, Ljava/lang/Number;

    .end local v0    # "arg0":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    cmpl-double v4, v4, v6

    if-eqz v4, :cond_46

    .line 611
    const-string v4, "msg.arraylength.bad"

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 612
    .local v3, "msg":Ljava/lang/String;
    const-string v4, "RangeError"

    invoke-static {v4, v3}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v4

    throw v4

    .line 614
    .end local v3    # "msg":Ljava/lang/String;
    :cond_46
    new-instance v4, Lorg/mozilla/javascript/NativeArray;

    invoke-direct {v4, v1, v2}, Lorg/mozilla/javascript/NativeArray;-><init>(J)V

    goto :goto_a
.end method

.method private static js_concat(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 31
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1352
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/NativeArray;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 1353
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v15

    .line 1354
    .local v15, "result":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v21, v0

    if-eqz v21, :cond_e8

    instance-of v0, v15, Lorg/mozilla/javascript/NativeArray;

    move/from16 v21, v0

    if-eqz v21, :cond_e8

    move-object/from16 v9, p2

    .line 1355
    check-cast v9, Lorg/mozilla/javascript/NativeArray;

    .local v9, "denseThis":Lorg/mozilla/javascript/NativeArray;
    move-object v8, v15

    .line 1356
    check-cast v8, Lorg/mozilla/javascript/NativeArray;

    .line 1357
    .local v8, "denseResult":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v0, v9, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    move/from16 v21, v0

    if-eqz v21, :cond_e8

    iget-boolean v0, v8, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    move/from16 v21, v0

    if-eqz v21, :cond_e8

    .line 1359
    const/4 v5, 0x1

    .line 1360
    .local v5, "canUseDense":Z
    iget-wide v0, v9, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v21, v0

    move-wide/from16 v0, v21

    long-to-int v13, v0

    .line 1361
    .local v13, "length":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_3a
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v10, v0, :cond_67

    if-eqz v5, :cond_67

    .line 1362
    aget-object v21, p3, v10

    move-object/from16 v0, v21

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v21, v0

    if-eqz v21, :cond_64

    .line 1365
    aget-object v4, p3, v10

    check-cast v4, Lorg/mozilla/javascript/NativeArray;

    .line 1366
    .local v4, "arg":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v5, v4, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 1367
    int-to-long v0, v13

    move-wide/from16 v21, v0

    iget-wide v0, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v23, v0

    add-long v21, v21, v23

    move-wide/from16 v0, v21

    long-to-int v13, v0

    .line 1361
    .end local v4    # "arg":Lorg/mozilla/javascript/NativeArray;
    :goto_61
    add-int/lit8 v10, v10, 0x1

    goto :goto_3a

    .line 1369
    :cond_64
    add-int/lit8 v13, v13, 0x1

    goto :goto_61

    .line 1372
    :cond_67
    if-eqz v5, :cond_e8

    invoke-direct {v8, v13}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v21

    if-eqz v21, :cond_e8

    .line 1373
    iget-object v0, v9, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    iget-object v0, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    iget-wide v0, v9, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v25, v0

    move-wide/from16 v0, v25

    long-to-int v0, v0

    move/from16 v25, v0

    invoke-static/range {v21 .. v25}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1375
    iget-wide v0, v9, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v21, v0

    move-wide/from16 v0, v21

    long-to-int v6, v0

    .line 1376
    .local v6, "cursor":I
    const/4 v10, 0x0

    :goto_8f
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v10, v0, :cond_e0

    if-eqz v5, :cond_e0

    .line 1377
    aget-object v21, p3, v10

    move-object/from16 v0, v21

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v21, v0

    if-eqz v21, :cond_d4

    .line 1378
    aget-object v4, p3, v10

    check-cast v4, Lorg/mozilla/javascript/NativeArray;

    .line 1379
    .restart local v4    # "arg":Lorg/mozilla/javascript/NativeArray;
    iget-object v0, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    iget-object v0, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v23, v0

    iget-wide v0, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    long-to-int v0, v0

    move/from16 v24, v0

    move-object/from16 v0, v21

    move/from16 v1, v22

    move-object/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v0, v1, v2, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1382
    iget-wide v0, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    move-wide/from16 v21, v0

    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v21, v0

    add-int v6, v6, v21

    .line 1376
    .end local v4    # "arg":Lorg/mozilla/javascript/NativeArray;
    :goto_d1
    add-int/lit8 v10, v10, 0x1

    goto :goto_8f

    .line 1384
    :cond_d4
    iget-object v0, v8, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v21, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "cursor":I
    .local v7, "cursor":I
    aget-object v22, p3, v10

    aput-object v22, v21, v6

    move v6, v7

    .end local v7    # "cursor":I
    .restart local v6    # "cursor":I
    goto :goto_d1

    .line 1387
    :cond_e0
    int-to-long v0, v13

    move-wide/from16 v21, v0

    move-wide/from16 v0, v21

    iput-wide v0, v8, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1433
    .end local v5    # "canUseDense":Z
    .end local v6    # "cursor":I
    .end local v8    # "denseResult":Lorg/mozilla/javascript/NativeArray;
    .end local v9    # "denseThis":Lorg/mozilla/javascript/NativeArray;
    .end local v13    # "length":I
    :goto_e7
    return-object v15

    .line 1394
    .end local v10    # "i":I
    :cond_e8
    const-wide/16 v16, 0x0

    .line 1399
    .local v16, "slot":J
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/NativeArray;->js_isArray(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_11c

    .line 1400
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v13

    .line 1403
    .local v13, "length":J
    const-wide/16 v16, 0x0

    :goto_fa
    cmp-long v21, v16, v13

    if-gez v21, :cond_12b

    .line 1404
    move-object/from16 v0, p2

    move-wide/from16 v1, v16

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v20

    .line 1405
    .local v20, "temp":Ljava/lang/Object;
    sget-object v21, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_117

    .line 1406
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-object/from16 v3, v20

    invoke-static {v0, v15, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1403
    :cond_117
    const-wide/16 v21, 0x1

    add-long v16, v16, v21

    goto :goto_fa

    .line 1410
    .end local v13    # "length":J
    .end local v20    # "temp":Ljava/lang/Object;
    :cond_11c
    const-wide/16 v21, 0x1

    add-long v18, v16, v21

    .end local v16    # "slot":J
    .local v18, "slot":J
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-object/from16 v3, p2

    invoke-static {v0, v15, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    move-wide/from16 v16, v18

    .line 1417
    .end local v18    # "slot":J
    .restart local v16    # "slot":J
    :cond_12b
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_12c
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v10, v0, :cond_17f

    .line 1418
    aget-object v21, p3, v10

    invoke-static/range {v21 .. v21}, Lorg/mozilla/javascript/NativeArray;->js_isArray(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_16b

    .line 1420
    aget-object v4, p3, v10

    check-cast v4, Lorg/mozilla/javascript/Scriptable;

    .line 1421
    .local v4, "arg":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v13

    .line 1422
    .restart local v13    # "length":J
    const-wide/16 v11, 0x0

    .local v11, "j":J
    :goto_149
    cmp-long v21, v11, v13

    if-gez v21, :cond_17c

    .line 1423
    invoke-static {v4, v11, v12}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v20

    .line 1424
    .restart local v20    # "temp":Ljava/lang/Object;
    sget-object v21, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_162

    .line 1425
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-object/from16 v3, v20

    invoke-static {v0, v15, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1422
    :cond_162
    const-wide/16 v21, 0x1

    add-long v11, v11, v21

    const-wide/16 v21, 0x1

    add-long v16, v16, v21

    goto :goto_149

    .line 1429
    .end local v4    # "arg":Lorg/mozilla/javascript/Scriptable;
    .end local v11    # "j":J
    .end local v13    # "length":J
    .end local v20    # "temp":Ljava/lang/Object;
    :cond_16b
    const-wide/16 v21, 0x1

    add-long v18, v16, v21

    .end local v16    # "slot":J
    .restart local v18    # "slot":J
    aget-object v21, p3, v10

    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    move-object/from16 v3, v21

    invoke-static {v0, v15, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    move-wide/from16 v16, v18

    .line 1417
    .end local v18    # "slot":J
    .restart local v16    # "slot":J
    :cond_17c
    add-int/lit8 v10, v10, 0x1

    goto :goto_12c

    .line 1432
    :cond_17f
    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    invoke-static {v0, v15, v1, v2}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    goto/16 :goto_e7
.end method

.method private static js_indexOf(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1486
    array-length v10, p2

    if-lez v10, :cond_43

    const/4 v10, 0x0

    aget-object v0, p2, v10

    .line 1487
    .local v0, "compareTo":Ljava/lang/Object;
    :goto_6
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v3

    .line 1499
    .local v3, "length":J
    array-length v10, p2

    const/4 v11, 0x2

    if-ge v10, v11, :cond_46

    .line 1501
    const-wide/16 v7, 0x0

    .line 1511
    .local v7, "start":J
    :cond_10
    instance-of v10, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v10, :cond_6e

    move-object v5, p1

    .line 1512
    check-cast v5, Lorg/mozilla/javascript/NativeArray;

    .line 1513
    .local v5, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v10, v5, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v10, :cond_6e

    .line 1514
    invoke-virtual {v5}, Lorg/mozilla/javascript/NativeArray;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    .line 1515
    .local v6, "proto":Lorg/mozilla/javascript/Scriptable;
    long-to-int v1, v7

    .local v1, "i":I
    :goto_20
    int-to-long v10, v1

    cmp-long v10, v10, v3

    if-gez v10, :cond_6b

    .line 1516
    iget-object v10, v5, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v9, v10, v1

    .line 1517
    .local v9, "val":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v9, v10, :cond_33

    if-eqz v6, :cond_33

    .line 1518
    invoke-static {v6, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v9

    .line 1520
    :cond_33
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_68

    invoke-static {v9, v0}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_68

    .line 1523
    int-to-long v10, v1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    .line 1535
    .end local v1    # "i":I
    .end local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    .end local v9    # "val":Ljava/lang/Object;
    :goto_42
    return-object v10

    .line 1486
    .end local v0    # "compareTo":Ljava/lang/Object;
    .end local v3    # "length":J
    .end local v7    # "start":J
    :cond_43
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_6

    .line 1503
    .restart local v0    # "compareTo":Ljava/lang/Object;
    .restart local v3    # "length":J
    :cond_46
    const/4 v10, 0x1

    aget-object v10, p2, v10

    invoke-static {v10}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v10

    double-to-long v7, v10

    .line 1504
    .restart local v7    # "start":J
    const-wide/16 v10, 0x0

    cmp-long v10, v7, v10

    if-gez v10, :cond_5d

    .line 1505
    add-long/2addr v7, v3

    .line 1506
    const-wide/16 v10, 0x0

    cmp-long v10, v7, v10

    if-gez v10, :cond_5d

    .line 1507
    const-wide/16 v7, 0x0

    .line 1509
    :cond_5d
    const-wide/16 v10, 0x1

    sub-long v10, v3, v10

    cmp-long v10, v7, v10

    if-lez v10, :cond_10

    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_42

    .line 1515
    .restart local v1    # "i":I
    .restart local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .restart local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    .restart local v9    # "val":Ljava/lang/Object;
    :cond_68
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 1526
    .end local v9    # "val":Ljava/lang/Object;
    :cond_6b
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_42

    .line 1529
    .end local v1    # "i":I
    .end local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_6e
    move-wide v1, v7

    .local v1, "i":J
    :goto_6f
    cmp-long v10, v1, v3

    if-gez v10, :cond_8a

    .line 1530
    invoke-static {p1, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v9

    .line 1531
    .restart local v9    # "val":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_86

    invoke-static {v9, v0}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_86

    .line 1532
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_42

    .line 1529
    :cond_86
    const-wide/16 v10, 0x1

    add-long/2addr v1, v10

    goto :goto_6f

    .line 1535
    .end local v9    # "val":Ljava/lang/Object;
    :cond_8a
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_42
.end method

.method private static js_isArray(Ljava/lang/Object;)Z
    .registers 3
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 1718
    instance-of v0, p0, Lorg/mozilla/javascript/Scriptable;

    if-nez v0, :cond_6

    .line 1719
    const/4 v0, 0x0

    .line 1721
    .end local p0    # "o":Ljava/lang/Object;
    :goto_5
    return v0

    .restart local p0    # "o":Ljava/lang/Object;
    :cond_6
    const-string v0, "Array"

    check-cast p0, Lorg/mozilla/javascript/Scriptable;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/mozilla/javascript/Scriptable;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method private static js_join(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 16
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 896
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v3

    .line 897
    .local v3, "llength":J
    long-to-int v2, v3

    .line 898
    .local v2, "length":I
    int-to-long v11, v2

    cmp-long v11, v3, v11

    if-eqz v11, :cond_15

    .line 899
    const-string v11, "msg.arraylength.too.big"

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v11

    throw v11

    .line 903
    :cond_15
    array-length v11, p2

    const/4 v12, 0x1

    if-lt v11, v12, :cond_20

    const/4 v11, 0x0

    aget-object v11, p2, v11

    sget-object v12, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v11, v12, :cond_57

    :cond_20
    const-string v7, ","

    .line 906
    .local v7, "separator":Ljava/lang/String;
    :goto_22
    instance-of v11, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v11, :cond_64

    move-object v5, p1

    .line 907
    check-cast v5, Lorg/mozilla/javascript/NativeArray;

    .line 908
    .local v5, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v11, v5, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v11, :cond_64

    .line 909
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 910
    .local v6, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_33
    if-ge v1, v2, :cond_5f

    .line 911
    if-eqz v1, :cond_3a

    .line 912
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 914
    :cond_3a
    iget-object v11, v5, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v11, v11

    if-ge v1, v11, :cond_54

    .line 915
    iget-object v11, v5, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v9, v11, v1

    .line 916
    .local v9, "temp":Ljava/lang/Object;
    if-eqz v9, :cond_54

    sget-object v11, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v9, v11, :cond_54

    sget-object v11, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v11, :cond_54

    .line 919
    invoke-static {v9}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 910
    .end local v9    # "temp":Ljava/lang/Object;
    :cond_54
    add-int/lit8 v1, v1, 0x1

    goto :goto_33

    .line 903
    .end local v1    # "i":I
    .end local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v6    # "sb":Ljava/lang/StringBuilder;
    .end local v7    # "separator":Ljava/lang/String;
    :cond_57
    const/4 v11, 0x0

    aget-object v11, p2, v11

    invoke-static {v11}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_22

    .line 923
    .restart local v1    # "i":I
    .restart local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .restart local v6    # "sb":Ljava/lang/StringBuilder;
    .restart local v7    # "separator":Ljava/lang/String;
    :cond_5f
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 951
    .end local v1    # "i":I
    .end local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v6    # "sb":Ljava/lang/StringBuilder;
    :goto_63
    return-object v11

    .line 926
    :cond_64
    if-nez v2, :cond_69

    .line 927
    const-string v11, ""

    goto :goto_63

    .line 929
    :cond_69
    new-array v0, v2, [Ljava/lang/String;

    .line 930
    .local v0, "buf":[Ljava/lang/String;
    const/4 v10, 0x0

    .line 931
    .local v10, "total_size":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_6d
    if-eq v1, v2, :cond_88

    .line 932
    int-to-long v11, v1

    invoke-static {p0, p1, v11, v12}, Lorg/mozilla/javascript/NativeArray;->getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v9

    .line 933
    .restart local v9    # "temp":Ljava/lang/Object;
    if-eqz v9, :cond_85

    sget-object v11, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq v9, v11, :cond_85

    .line 934
    invoke-static {v9}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 935
    .local v8, "str":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v10, v11

    .line 936
    aput-object v8, v0, v1

    .line 931
    .end local v8    # "str":Ljava/lang/String;
    :cond_85
    add-int/lit8 v1, v1, 0x1

    goto :goto_6d

    .line 939
    .end local v9    # "temp":Ljava/lang/Object;
    :cond_88
    add-int/lit8 v11, v2, -0x1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v12

    mul-int/2addr v11, v12

    add-int/2addr v10, v11

    .line 940
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 941
    .restart local v6    # "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    :goto_96
    if-eq v1, v2, :cond_a7

    .line 942
    if-eqz v1, :cond_9d

    .line 943
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    :cond_9d
    aget-object v8, v0, v1

    .line 946
    .restart local v8    # "str":Ljava/lang/String;
    if-eqz v8, :cond_a4

    .line 948
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 941
    :cond_a4
    add-int/lit8 v1, v1, 0x1

    goto :goto_96

    .line 951
    .end local v8    # "str":Ljava/lang/String;
    :cond_a7
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_63
.end method

.method private static js_lastIndexOf(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1541
    array-length v10, p2

    if-lez v10, :cond_42

    const/4 v10, 0x0

    aget-object v0, p2, v10

    .line 1542
    .local v0, "compareTo":Ljava/lang/Object;
    :goto_6
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v3

    .line 1555
    .local v3, "length":J
    array-length v10, p2

    const/4 v11, 0x2

    if-ge v10, v11, :cond_45

    .line 1557
    const-wide/16 v10, 0x1

    sub-long v7, v3, v10

    .line 1566
    .local v7, "start":J
    :cond_12
    instance-of v10, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v10, :cond_6c

    move-object v5, p1

    .line 1567
    check-cast v5, Lorg/mozilla/javascript/NativeArray;

    .line 1568
    .local v5, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v10, v5, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v10, :cond_6c

    .line 1569
    invoke-virtual {v5}, Lorg/mozilla/javascript/NativeArray;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    .line 1570
    .local v6, "proto":Lorg/mozilla/javascript/Scriptable;
    long-to-int v1, v7

    .local v1, "i":I
    :goto_22
    if-ltz v1, :cond_69

    .line 1571
    iget-object v10, v5, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v9, v10, v1

    .line 1572
    .local v9, "val":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v9, v10, :cond_32

    if-eqz v6, :cond_32

    .line 1573
    invoke-static {v6, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v9

    .line 1575
    :cond_32
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_66

    invoke-static {v9, v0}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_66

    .line 1578
    int-to-long v10, v1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    .line 1590
    .end local v1    # "i":I
    .end local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    .end local v9    # "val":Ljava/lang/Object;
    :goto_41
    return-object v10

    .line 1541
    .end local v0    # "compareTo":Ljava/lang/Object;
    .end local v3    # "length":J
    .end local v7    # "start":J
    :cond_42
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_6

    .line 1559
    .restart local v0    # "compareTo":Ljava/lang/Object;
    .restart local v3    # "length":J
    :cond_45
    const/4 v10, 0x1

    aget-object v10, p2, v10

    invoke-static {v10}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v10

    double-to-long v7, v10

    .line 1560
    .restart local v7    # "start":J
    cmp-long v10, v7, v3

    if-ltz v10, :cond_5e

    .line 1561
    const-wide/16 v10, 0x1

    sub-long v7, v3, v10

    .line 1564
    :cond_55
    :goto_55
    const-wide/16 v10, 0x0

    cmp-long v10, v7, v10

    if-gez v10, :cond_12

    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_41

    .line 1562
    :cond_5e
    const-wide/16 v10, 0x0

    cmp-long v10, v7, v10

    if-gez v10, :cond_55

    .line 1563
    add-long/2addr v7, v3

    goto :goto_55

    .line 1570
    .restart local v1    # "i":I
    .restart local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .restart local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    .restart local v9    # "val":Ljava/lang/Object;
    :cond_66
    add-int/lit8 v1, v1, -0x1

    goto :goto_22

    .line 1581
    .end local v9    # "val":Ljava/lang/Object;
    :cond_69
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_41

    .line 1584
    .end local v1    # "i":I
    .end local v5    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v6    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_6c
    move-wide v1, v7

    .local v1, "i":J
    :goto_6d
    const-wide/16 v10, 0x0

    cmp-long v10, v1, v10

    if-ltz v10, :cond_8a

    .line 1585
    invoke-static {p1, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v9

    .line 1586
    .restart local v9    # "val":Ljava/lang/Object;
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_86

    invoke-static {v9, v0}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_86

    .line 1587
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    goto :goto_41

    .line 1584
    :cond_86
    const-wide/16 v10, 0x1

    sub-long/2addr v1, v10

    goto :goto_6d

    .line 1590
    .end local v9    # "val":Ljava/lang/Object;
    :cond_8a
    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NEGATIVE_ONE:Ljava/lang/Integer;

    goto :goto_41
.end method

.method private static js_pop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    const-wide/16 v9, 0x1

    const-wide/16 v7, 0x0

    .line 1106
    instance-of v5, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v5, :cond_2c

    move-object v2, p1

    .line 1107
    check-cast v2, Lorg/mozilla/javascript/NativeArray;

    .line 1108
    .local v2, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v5, v2, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v5, :cond_2c

    iget-wide v5, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v5, v5, v7

    if-lez v5, :cond_2c

    .line 1109
    iget-wide v5, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    sub-long/2addr v5, v9

    iput-wide v5, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1110
    iget-object v5, v2, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v6, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v6, v6

    aget-object v3, v5, v6

    .line 1111
    .local v3, "result":Ljava/lang/Object;
    iget-object v5, v2, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v6, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v6, v6

    sget-object v7, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v7, v5, v6

    move-object v4, v3

    .line 1132
    .end local v2    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v3    # "result":Ljava/lang/Object;
    .local v4, "result":Ljava/lang/Object;
    :goto_2b
    return-object v4

    .line 1115
    .end local v4    # "result":Ljava/lang/Object;
    :cond_2c
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v0

    .line 1116
    .local v0, "length":J
    cmp-long v5, v0, v7

    if-lez v5, :cond_41

    .line 1117
    sub-long/2addr v0, v9

    .line 1120
    invoke-static {p0, p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    .line 1124
    .restart local v3    # "result":Ljava/lang/Object;
    invoke-static {p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 1130
    :goto_3c
    invoke-static {p0, p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-object v4, v3

    .line 1132
    .end local v3    # "result":Ljava/lang/Object;
    .restart local v4    # "result":Ljava/lang/Object;
    goto :goto_2b

    .line 1126
    .end local v4    # "result":Ljava/lang/Object;
    :cond_41
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .restart local v3    # "result":Ljava/lang/Object;
    goto :goto_3c
.end method

.method private static js_push(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1069
    instance-of v5, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v5, :cond_33

    move-object v4, p1

    .line 1070
    check-cast v4, Lorg/mozilla/javascript/NativeArray;

    .line 1071
    .local v4, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v5, v4, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v5, :cond_33

    iget-wide v5, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v5, v5

    array-length v6, p2

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v5

    if-eqz v5, :cond_33

    .line 1074
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v5, p2

    if-ge v0, v5, :cond_2b

    .line 1075
    iget-object v5, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v6, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    const-wide/16 v8, 0x1

    add-long/2addr v8, v6

    iput-wide v8, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v6, v6

    aget-object v7, p2, v0

    aput-object v7, v5, v6

    .line 1074
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 1077
    :cond_2b
    iget-wide v5, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-double v5, v5

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v5

    .line 1099
    .end local v4    # "na":Lorg/mozilla/javascript/NativeArray;
    :goto_32
    return-object v5

    .line 1080
    .end local v0    # "i":I
    :cond_33
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v1

    .line 1081
    .local v1, "length":J
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_38
    array-length v5, p2

    if-ge v0, v5, :cond_45

    .line 1082
    int-to-long v5, v0

    add-long/2addr v5, v1

    aget-object v7, p2, v0

    invoke-static {p0, p1, v5, v6, v7}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1081
    add-int/lit8 v0, v0, 0x1

    goto :goto_38

    .line 1085
    :cond_45
    array-length v5, p2

    int-to-long v5, v5

    add-long/2addr v1, v5

    .line 1086
    invoke-static {p0, p1, v1, v2}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    .line 1092
    .local v3, "lengthObj":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v5

    const/16 v6, 0x78

    if-ne v5, v6, :cond_60

    .line 1094
    array-length v5, p2

    if-nez v5, :cond_5a

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_32

    :cond_5a
    array-length v5, p2

    add-int/lit8 v5, v5, -0x1

    aget-object v5, p2, v5

    goto :goto_32

    :cond_60
    move-object v5, v3

    .line 1099
    goto :goto_32
.end method

.method private static js_reverse(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 21
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 960
    move-object/from16 v0, p1

    instance-of v14, v0, Lorg/mozilla/javascript/NativeArray;

    if-eqz v14, :cond_2b

    move-object/from16 v10, p1

    .line 961
    check-cast v10, Lorg/mozilla/javascript/NativeArray;

    .line 962
    .local v10, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v14, v10, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v14, :cond_2b

    .line 963
    const/4 v4, 0x0

    .local v4, "i":I
    iget-wide v14, v10, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v14, v14

    add-int/lit8 v6, v14, -0x1

    .local v6, "j":I
    :goto_14
    if-ge v4, v6, :cond_5d

    .line 964
    iget-object v14, v10, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v11, v14, v4

    .line 965
    .local v11, "temp":Ljava/lang/Object;
    iget-object v14, v10, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-object v15, v10, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v15, v15, v6

    aput-object v15, v14, v4

    .line 966
    iget-object v14, v10, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aput-object v11, v14, v6

    .line 963
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v6, v6, -0x1

    goto :goto_14

    .line 971
    .end local v4    # "i":I
    .end local v6    # "j":I
    .end local v10    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v11    # "temp":Ljava/lang/Object;
    :cond_2b
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v8

    .line 973
    .local v8, "len":J
    const-wide/16 v14, 0x2

    div-long v2, v8, v14

    .line 974
    .local v2, "half":J
    const-wide/16 v4, 0x0

    .local v4, "i":J
    :goto_35
    cmp-long v14, v4, v2

    if-gez v14, :cond_5d

    .line 975
    sub-long v14, v8, v4

    const-wide/16 v16, 0x1

    sub-long v6, v14, v16

    .line 976
    .local v6, "j":J
    move-object/from16 v0, p1

    invoke-static {v0, v4, v5}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v12

    .line 977
    .local v12, "temp1":Ljava/lang/Object;
    move-object/from16 v0, p1

    invoke-static {v0, v6, v7}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v13

    .line 978
    .local v13, "temp2":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v4, v5, v13}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 979
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v6, v7, v12}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 974
    const-wide/16 v14, 0x1

    add-long/2addr v4, v14

    goto :goto_35

    .line 981
    .end local v2    # "half":J
    .end local v4    # "i":J
    .end local v6    # "j":J
    .end local v8    # "len":J
    .end local v12    # "temp1":Ljava/lang/Object;
    .end local v13    # "temp2":Ljava/lang/Object;
    :cond_5d
    return-object p1
.end method

.method private static js_shift(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1138
    instance-of v7, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v7, :cond_3b

    move-object v4, p1

    .line 1139
    check-cast v4, Lorg/mozilla/javascript/NativeArray;

    .line 1140
    .local v4, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v7, v4, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v7, :cond_3b

    iget-wide v7, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-lez v7, :cond_3b

    .line 1141
    iget-wide v7, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    const-wide/16 v9, 0x1

    sub-long/2addr v7, v9

    iput-wide v7, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1142
    iget-object v7, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    const/4 v8, 0x0

    aget-object v5, v7, v8

    .line 1143
    .local v5, "result":Ljava/lang/Object;
    iget-object v7, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    const/4 v8, 0x1

    iget-object v9, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    const/4 v10, 0x0

    iget-wide v11, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v11, v11

    invoke-static {v7, v8, v9, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1144
    iget-object v7, v4, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    iget-wide v8, v4, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v8, v8

    sget-object v9, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v9, v7, v8

    .line 1145
    sget-object v7, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne v5, v7, :cond_3a

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 1174
    .end local v4    # "na":Lorg/mozilla/javascript/NativeArray;
    .end local v5    # "result":Ljava/lang/Object;
    :cond_3a
    :goto_3a
    return-object v5

    .line 1149
    :cond_3b
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v2

    .line 1150
    .local v2, "length":J
    const-wide/16 v7, 0x0

    cmp-long v7, v2, v7

    if-lez v7, :cond_70

    .line 1151
    const-wide/16 v0, 0x0

    .line 1152
    .local v0, "i":J
    const-wide/16 v7, 0x1

    sub-long/2addr v2, v7

    .line 1155
    invoke-static {p0, p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v5

    .line 1161
    .restart local v5    # "result":Ljava/lang/Object;
    const-wide/16 v7, 0x0

    cmp-long v7, v2, v7

    if-lez v7, :cond_69

    .line 1162
    const-wide/16 v0, 0x1

    :goto_56
    cmp-long v7, v0, v2

    if-gtz v7, :cond_69

    .line 1163
    invoke-static {p1, v0, v1}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v6

    .line 1164
    .local v6, "temp":Ljava/lang/Object;
    const-wide/16 v7, 0x1

    sub-long v7, v0, v7

    invoke-static {p0, p1, v7, v8, v6}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1162
    const-wide/16 v7, 0x1

    add-long/2addr v0, v7

    goto :goto_56

    .line 1169
    .end local v6    # "temp":Ljava/lang/Object;
    :cond_69
    invoke-static {p1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 1173
    .end local v0    # "i":J
    :goto_6c
    invoke-static {p0, p1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    goto :goto_3a

    .line 1171
    .end local v5    # "result":Ljava/lang/Object;
    :cond_70
    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .restart local v5    # "result":Ljava/lang/Object;
    goto :goto_6c
.end method

.method private js_slice(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 20
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1439
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/NativeArray;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v8

    .line 1440
    .local v8, "scope":Lorg/mozilla/javascript/Scriptable;
    const/4 v12, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v8, v12}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v7

    .line 1441
    .local v7, "result":Lorg/mozilla/javascript/Scriptable;
    invoke-static/range {p1 .. p2}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v5

    .line 1444
    .local v5, "length":J
    move-object/from16 v0, p3

    array-length v12, v0

    if-nez v12, :cond_31

    .line 1445
    const-wide/16 v1, 0x0

    .line 1446
    .local v1, "begin":J
    move-wide v3, v5

    .line 1456
    .local v3, "end":J
    :goto_17
    move-wide v9, v1

    .local v9, "slot":J
    :goto_18
    cmp-long v12, v9, v3

    if-gez v12, :cond_57

    .line 1457
    move-object/from16 v0, p2

    invoke-static {v0, v9, v10}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v11

    .line 1458
    .local v11, "temp":Ljava/lang/Object;
    sget-object v12, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v11, v12, :cond_2d

    .line 1459
    sub-long v12, v9, v1

    move-object/from16 v0, p1

    invoke-static {v0, v7, v12, v13, v11}, Lorg/mozilla/javascript/NativeArray;->defineElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1456
    :cond_2d
    const-wide/16 v12, 0x1

    add-long/2addr v9, v12

    goto :goto_18

    .line 1448
    .end local v1    # "begin":J
    .end local v3    # "end":J
    .end local v9    # "slot":J
    .end local v11    # "temp":Ljava/lang/Object;
    :cond_31
    const/4 v12, 0x0

    aget-object v12, p3, v12

    invoke-static {v12}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v12

    invoke-static {v12, v13, v5, v6}, Lorg/mozilla/javascript/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v1

    .line 1449
    .restart local v1    # "begin":J
    move-object/from16 v0, p3

    array-length v12, v0

    const/4 v13, 0x1

    if-eq v12, v13, :cond_49

    const/4 v12, 0x1

    aget-object v12, p3, v12

    sget-object v13, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v12, v13, :cond_4b

    .line 1450
    :cond_49
    move-wide v3, v5

    .restart local v3    # "end":J
    goto :goto_17

    .line 1452
    .end local v3    # "end":J
    :cond_4b
    const/4 v12, 0x1

    aget-object v12, p3, v12

    invoke-static {v12}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v12

    invoke-static {v12, v13, v5, v6}, Lorg/mozilla/javascript/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v3

    .restart local v3    # "end":J
    goto :goto_17

    .line 1462
    .restart local v9    # "slot":J
    :cond_57
    const-wide/16 v12, 0x0

    sub-long v14, v3, v1

    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    move-object/from16 v0, p1

    invoke-static {v0, v7, v12, v13}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    .line 1464
    return-object v7
.end method

.method private static js_sort(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 16
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v11, 0x0

    .line 991
    array-length v3, p3

    if-lez v3, :cond_33

    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aget-object v4, p3, v11

    if-eq v3, v4, :cond_33

    .line 992
    aget-object v3, p3, v11

    invoke-static {v3, p0}, Lorg/mozilla/javascript/ScriptRuntime;->getValueFunctionAndThis(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Callable;

    move-result-object v2

    .line 994
    .local v2, "jsCompareFunction":Lorg/mozilla/javascript/Callable;
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    .line 995
    .local v5, "funThis":Lorg/mozilla/javascript/Scriptable;
    const/4 v3, 0x2

    new-array v1, v3, [Ljava/lang/Object;

    .line 996
    .local v1, "cmpBuf":[Ljava/lang/Object;
    new-instance v0, Lorg/mozilla/javascript/NativeArray$1;

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray$1;-><init>([Ljava/lang/Object;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    .line 1043
    .end local v1    # "cmpBuf":[Ljava/lang/Object;
    .end local v2    # "jsCompareFunction":Lorg/mozilla/javascript/Callable;
    .end local v5    # "funThis":Lorg/mozilla/javascript/Scriptable;
    .local v0, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    :goto_1e
    invoke-static {p0, p2}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v8

    .line 1044
    .local v8, "llength":J
    long-to-int v7, v8

    .line 1045
    .local v7, "length":I
    int-to-long v3, v7

    cmp-long v3, v8, v3

    if-eqz v3, :cond_39

    .line 1046
    const-string v3, "msg.arraylength.too.big"

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 1023
    .end local v0    # "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    .end local v7    # "length":I
    .end local v8    # "llength":J
    :cond_33
    new-instance v0, Lorg/mozilla/javascript/NativeArray$2;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeArray$2;-><init>()V

    .restart local v0    # "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    goto :goto_1e

    .line 1051
    .restart local v7    # "length":I
    .restart local v8    # "llength":J
    :cond_39
    new-array v10, v7, [Ljava/lang/Object;

    .line 1052
    .local v10, "working":[Ljava/lang/Object;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3c
    if-eq v6, v7, :cond_48

    .line 1053
    int-to-long v3, v6

    invoke-static {p2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v10, v6

    .line 1052
    add-int/lit8 v6, v6, 0x1

    goto :goto_3c

    .line 1056
    :cond_48
    invoke-static {v10, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 1059
    const/4 v6, 0x0

    :goto_4c
    if-ge v6, v7, :cond_57

    .line 1060
    int-to-long v3, v6

    aget-object v11, v10, v6

    invoke-static {p0, p2, v3, v4, v11}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1059
    add-int/lit8 v6, v6, 0x1

    goto :goto_4c

    .line 1063
    :cond_57
    return-object p2
.end method

.method private static js_splice(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 41
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1219
    const/16 v27, 0x0

    .line 1220
    .local v27, "na":Lorg/mozilla/javascript/NativeArray;
    const/16 v16, 0x0

    .line 1221
    .local v16, "denseMode":Z
    move-object/from16 v0, p2

    instance-of v0, v0, Lorg/mozilla/javascript/NativeArray;

    move/from16 v31, v0

    if-eqz v31, :cond_16

    move-object/from16 v27, p2

    .line 1222
    check-cast v27, Lorg/mozilla/javascript/NativeArray;

    .line 1223
    move-object/from16 v0, v27

    iget-boolean v0, v0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    move/from16 v16, v0

    .line 1227
    :cond_16
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/NativeArray;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 1228
    move-object/from16 v0, p3

    array-length v5, v0

    .line 1229
    .local v5, "argc":I
    if-nez v5, :cond_2c

    .line 1230
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v28

    .line 1342
    :goto_2b
    return-object v28

    .line 1231
    :cond_2c
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v25

    .line 1234
    .local v25, "length":J
    const/16 v31, 0x0

    aget-object v31, p3, v31

    invoke-static/range {v31 .. v31}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v31

    move-wide/from16 v0, v31

    move-wide/from16 v2, v25

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->toSliceIndex(DJ)J

    move-result-wide v7

    .line 1235
    .local v7, "begin":J
    add-int/lit8 v5, v5, -0x1

    .line 1239
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v31, v0

    const/16 v32, 0x1

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_fc

    .line 1240
    sub-long v10, v25, v7

    .line 1253
    .local v10, "count":J
    :goto_55
    add-long v17, v7, v10

    .line 1257
    .local v17, "end":J
    const-wide/16 v31, 0x0

    cmp-long v31, v10, v31

    if-eqz v31, :cond_190

    .line 1258
    const-wide/16 v31, 0x1

    cmp-long v31, v10, v31

    if-nez v31, :cond_120

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v31

    const/16 v32, 0x78

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_120

    .line 1272
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1, v7, v8}, Lorg/mozilla/javascript/NativeArray;->getElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v28

    .line 1302
    :goto_77
    int-to-long v0, v5

    move-wide/from16 v31, v0

    sub-long v14, v31, v10

    .line 1303
    .local v14, "delta":J
    if-eqz v16, :cond_1ae

    add-long v31, v25, v14

    const-wide/32 v33, 0x7fffffff

    cmp-long v31, v31, v33

    if-gez v31, :cond_1ae

    add-long v31, v25, v14

    move-wide/from16 v0, v31

    long-to-int v0, v0

    move/from16 v31, v0

    move-object/from16 v0, v27

    move/from16 v1, v31

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v31

    if-eqz v31, :cond_1ae

    .line 1306
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v31, v0

    move-wide/from16 v0, v17

    long-to-int v0, v0

    move/from16 v32, v0

    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v33, v0

    int-to-long v0, v5

    move-wide/from16 v34, v0

    add-long v34, v34, v7

    move-wide/from16 v0, v34

    long-to-int v0, v0

    move/from16 v34, v0

    sub-long v35, v25, v17

    move-wide/from16 v0, v35

    long-to-int v0, v0

    move/from16 v35, v0

    invoke-static/range {v31 .. v35}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1308
    if-lez v5, :cond_d5

    .line 1309
    const/16 v31, 0x2

    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v32, v0

    long-to-int v0, v7

    move/from16 v33, v0

    move-object/from16 v0, p3

    move/from16 v1, v31

    move-object/from16 v2, v32

    move/from16 v3, v33

    invoke-static {v0, v1, v2, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1311
    :cond_d5
    const-wide/16 v31, 0x0

    cmp-long v31, v14, v31

    if-gez v31, :cond_f2

    .line 1312
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v31, v0

    add-long v32, v25, v14

    move-wide/from16 v0, v32

    long-to-int v0, v0

    move/from16 v32, v0

    move-wide/from16 v0, v25

    long-to-int v0, v0

    move/from16 v33, v0

    sget-object v34, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    invoke-static/range {v31 .. v34}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 1315
    :cond_f2
    add-long v31, v25, v14

    move-wide/from16 v0, v31

    move-object/from16 v2, v27

    iput-wide v0, v2, Lorg/mozilla/javascript/NativeArray;->length:J

    goto/16 :goto_2b

    .line 1242
    .end local v10    # "count":J
    .end local v14    # "delta":J
    .end local v17    # "end":J
    :cond_fc
    const/16 v31, 0x1

    aget-object v31, p3, v31

    invoke-static/range {v31 .. v31}, Lorg/mozilla/javascript/ScriptRuntime;->toInteger(Ljava/lang/Object;)D

    move-result-wide v12

    .line 1243
    .local v12, "dcount":D
    const-wide/16 v31, 0x0

    cmpg-double v31, v12, v31

    if-gez v31, :cond_110

    .line 1244
    const-wide/16 v10, 0x0

    .line 1250
    .restart local v10    # "count":J
    :goto_10c
    add-int/lit8 v5, v5, -0x1

    goto/16 :goto_55

    .line 1245
    .end local v10    # "count":J
    :cond_110
    sub-long v31, v25, v7

    move-wide/from16 v0, v31

    long-to-double v0, v0

    move-wide/from16 v31, v0

    cmpl-double v31, v12, v31

    if-lez v31, :cond_11e

    .line 1246
    sub-long v10, v25, v7

    .restart local v10    # "count":J
    goto :goto_10c

    .line 1248
    .end local v10    # "count":J
    :cond_11e
    double-to-long v10, v12

    .restart local v10    # "count":J
    goto :goto_10c

    .line 1274
    .end local v12    # "dcount":D
    .restart local v17    # "end":J
    :cond_120
    if-eqz v16, :cond_14d

    .line 1275
    sub-long v31, v17, v7

    move-wide/from16 v0, v31

    long-to-int v0, v0

    move/from16 v20, v0

    .line 1276
    .local v20, "intLen":I
    move/from16 v0, v20

    new-array v9, v0, [Ljava/lang/Object;

    .line 1277
    .local v9, "copy":[Ljava/lang/Object;
    move-object/from16 v0, v27

    iget-object v0, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v31, v0

    long-to-int v0, v7

    move/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, v31

    move/from16 v1, v32

    move/from16 v2, v33

    move/from16 v3, v20

    invoke-static {v0, v1, v9, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1278
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v9}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v28

    .line 1279
    .local v28, "result":Lorg/mozilla/javascript/Scriptable;
    goto/16 :goto_77

    .line 1280
    .end local v9    # "copy":[Ljava/lang/Object;
    .end local v20    # "intLen":I
    .end local v28    # "result":Lorg/mozilla/javascript/Scriptable;
    :cond_14d
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v29

    .line 1281
    .local v29, "resultArray":Lorg/mozilla/javascript/Scriptable;
    move-wide/from16 v23, v7

    .local v23, "last":J
    :goto_15b
    cmp-long v31, v23, v17

    if-eqz v31, :cond_181

    .line 1282
    move-object/from16 v0, p2

    move-wide/from16 v1, v23

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v30

    .line 1283
    .local v30, "temp":Ljava/lang/Object;
    sget-object v31, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    if-eq v0, v1, :cond_17c

    .line 1284
    sub-long v31, v23, v7

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-wide/from16 v2, v31

    move-object/from16 v4, v30

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1281
    :cond_17c
    const-wide/16 v31, 0x1

    add-long v23, v23, v31

    goto :goto_15b

    .line 1288
    .end local v30    # "temp":Ljava/lang/Object;
    :cond_181
    sub-long v31, v17, v7

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-wide/from16 v2, v31

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    .line 1289
    move-object/from16 v28, v29

    .line 1290
    .restart local v28    # "result":Lorg/mozilla/javascript/Scriptable;
    goto/16 :goto_77

    .line 1293
    .end local v23    # "last":J
    .end local v28    # "result":Lorg/mozilla/javascript/Scriptable;
    .end local v29    # "resultArray":Lorg/mozilla/javascript/Scriptable;
    :cond_190
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v31

    const/16 v32, 0x78

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_1a0

    .line 1295
    sget-object v28, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .local v28, "result":Ljava/lang/Object;
    goto/16 :goto_77

    .line 1297
    .end local v28    # "result":Ljava/lang/Object;
    :cond_1a0
    const/16 v31, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Scriptable;

    move-result-object v28

    .local v28, "result":Lorg/mozilla/javascript/Scriptable;
    goto/16 :goto_77

    .line 1319
    .end local v28    # "result":Lorg/mozilla/javascript/Scriptable;
    .restart local v14    # "delta":J
    :cond_1ae
    const-wide/16 v31, 0x0

    cmp-long v31, v14, v31

    if-lez v31, :cond_1d6

    .line 1320
    const-wide/16 v31, 0x1

    sub-long v23, v25, v31

    .restart local v23    # "last":J
    :goto_1b8
    cmp-long v31, v23, v17

    if-ltz v31, :cond_20e

    .line 1321
    move-object/from16 v0, p2

    move-wide/from16 v1, v23

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v30

    .line 1322
    .restart local v30    # "temp":Ljava/lang/Object;
    add-long v31, v23, v14

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, v31

    move-object/from16 v4, v30

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1320
    const-wide/16 v31, 0x1

    sub-long v23, v23, v31

    goto :goto_1b8

    .line 1324
    .end local v23    # "last":J
    .end local v30    # "temp":Ljava/lang/Object;
    :cond_1d6
    const-wide/16 v31, 0x0

    cmp-long v31, v14, v31

    if-gez v31, :cond_20e

    .line 1325
    move-wide/from16 v23, v17

    .restart local v23    # "last":J
    :goto_1de
    cmp-long v31, v23, v25

    if-gez v31, :cond_1fc

    .line 1326
    move-object/from16 v0, p2

    move-wide/from16 v1, v23

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v30

    .line 1327
    .restart local v30    # "temp":Ljava/lang/Object;
    add-long v31, v23, v14

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, v31

    move-object/from16 v4, v30

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1325
    const-wide/16 v31, 0x1

    add-long v23, v23, v31

    goto :goto_1de

    .line 1329
    .end local v30    # "temp":Ljava/lang/Object;
    :cond_1fc
    add-long v21, v25, v14

    .local v21, "k":J
    :goto_1fe
    cmp-long v31, v21, v25

    if-gez v31, :cond_20e

    .line 1330
    move-object/from16 v0, p2

    move-wide/from16 v1, v21

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 1329
    const-wide/16 v31, 0x1

    add-long v21, v21, v31

    goto :goto_1fe

    .line 1335
    .end local v21    # "k":J
    .end local v23    # "last":J
    :cond_20e
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v31, v0

    sub-int v6, v31, v5

    .line 1336
    .local v6, "argoffset":I
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_217
    move/from16 v0, v19

    if-ge v0, v5, :cond_234

    .line 1337
    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v31, v0

    add-long v31, v31, v7

    add-int v33, v19, v6

    aget-object v33, p3, v33

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, v31

    move-object/from16 v4, v33

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1336
    add-int/lit8 v19, v19, 0x1

    goto :goto_217

    .line 1341
    :cond_234
    add-long v31, v25, v14

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, v31

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    goto/16 :goto_2b
.end method

.method private static js_unshift(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 18
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1180
    move-object/from16 v0, p1

    instance-of v9, v0, Lorg/mozilla/javascript/NativeArray;

    if-eqz v9, :cond_49

    move-object/from16 v7, p1

    .line 1181
    check-cast v7, Lorg/mozilla/javascript/NativeArray;

    .line 1182
    .local v7, "na":Lorg/mozilla/javascript/NativeArray;
    iget-boolean v9, v7, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v9, :cond_49

    iget-wide v9, v7, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v9, v9

    move-object/from16 v0, p2

    array-length v10, v0

    add-int/2addr v9, v10

    invoke-direct {v7, v9}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v9

    if-eqz v9, :cond_49

    .line 1185
    iget-object v9, v7, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, v7, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    move-object/from16 v0, p2

    array-length v12, v0

    iget-wide v13, v7, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-int v13, v13

    invoke-static {v9, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1187
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2a
    move-object/from16 v0, p2

    array-length v9, v0

    if-ge v2, v9, :cond_38

    .line 1188
    iget-object v9, v7, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v10, p2, v2

    aput-object v10, v9, v2

    .line 1187
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 1190
    :cond_38
    iget-wide v9, v7, Lorg/mozilla/javascript/NativeArray;->length:J

    move-object/from16 v0, p2

    array-length v11, v0

    int-to-long v11, v11

    add-long/2addr v9, v11

    iput-wide v9, v7, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1191
    iget-wide v9, v7, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-double v9, v9

    invoke-static {v9, v10}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v9

    .line 1213
    .end local v2    # "i":I
    .end local v7    # "na":Lorg/mozilla/javascript/NativeArray;
    :goto_48
    return-object v9

    .line 1194
    :cond_49
    invoke-static/range {p0 .. p1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v5

    .line 1195
    .local v5, "length":J
    move-object/from16 v0, p2

    array-length v1, v0

    .line 1197
    .local v1, "argc":I
    move-object/from16 v0, p2

    array-length v9, v0

    if-lez v9, :cond_87

    .line 1199
    const-wide/16 v9, 0x0

    cmp-long v9, v5, v9

    if-lez v9, :cond_76

    .line 1200
    const-wide/16 v9, 0x1

    sub-long v3, v5, v9

    .local v3, "last":J
    :goto_5f
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-ltz v9, :cond_76

    .line 1201
    move-object/from16 v0, p1

    invoke-static {v0, v3, v4}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v8

    .line 1202
    .local v8, "temp":Ljava/lang/Object;
    int-to-long v9, v1

    add-long/2addr v9, v3

    move-object/from16 v0, p1

    invoke-static {p0, v0, v9, v10, v8}, Lorg/mozilla/javascript/NativeArray;->setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1200
    const-wide/16 v9, 0x1

    sub-long/2addr v3, v9

    goto :goto_5f

    .line 1207
    .end local v3    # "last":J
    .end local v8    # "temp":Ljava/lang/Object;
    :cond_76
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_77
    move-object/from16 v0, p2

    array-length v9, v0

    if-ge v2, v9, :cond_87

    .line 1208
    int-to-long v9, v2

    aget-object v11, p2, v2

    move-object/from16 v0, p1

    invoke-static {p0, v0, v9, v10, v11}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    .line 1207
    add-int/lit8 v2, v2, 0x1

    goto :goto_77

    .line 1212
    .end local v2    # "i":I
    :cond_87
    move-object/from16 v0, p2

    array-length v9, v0

    int-to-long v9, v9

    add-long/2addr v5, v9

    .line 1213
    move-object/from16 v0, p1

    invoke-static {p0, v0, v5, v6}, Lorg/mozilla/javascript/NativeArray;->setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v9

    goto :goto_48
.end method

.method private static reduceMethod(Lorg/mozilla/javascript/Context;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "id"    # I
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1686
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v10

    .line 1687
    .local v10, "length":J
    move-object/from16 v0, p4

    array-length v15, v0

    if-lez v15, :cond_1b

    const/4 v15, 0x0

    aget-object v2, p4, v15

    .line 1688
    .local v2, "callbackArg":Ljava/lang/Object;
    :goto_10
    if-eqz v2, :cond_16

    instance-of v15, v2, Lorg/mozilla/javascript/Function;

    if-nez v15, :cond_1e

    .line 1689
    :cond_16
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v15

    throw v15

    .line 1687
    .end local v2    # "callbackArg":Ljava/lang/Object;
    :cond_1b
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_10

    .restart local v2    # "callbackArg":Ljava/lang/Object;
    :cond_1e
    move-object v4, v2

    .line 1691
    check-cast v4, Lorg/mozilla/javascript/Function;

    .line 1692
    .local v4, "f":Lorg/mozilla/javascript/Function;
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v13

    .line 1694
    .local v13, "parent":Lorg/mozilla/javascript/Scriptable;
    const/16 v15, 0x18

    move/from16 v0, p1

    if-ne v0, v15, :cond_4f

    const/4 v12, 0x1

    .line 1695
    .local v12, "movingLeft":Z
    :goto_2c
    move-object/from16 v0, p4

    array-length v15, v0

    const/16 v16, 0x1

    move/from16 v0, v16

    if-le v15, v0, :cond_51

    const/4 v15, 0x1

    aget-object v14, p4, v15

    .line 1696
    .local v14, "value":Ljava/lang/Object;
    :goto_38
    const-wide/16 v5, 0x0

    .local v5, "i":J
    :goto_3a
    cmp-long v15, v5, v10

    if-gez v15, :cond_7b

    .line 1697
    if-eqz v12, :cond_54

    move-wide v7, v5

    .line 1698
    .local v7, "index":J
    :goto_41
    move-object/from16 v0, p3

    invoke-static {v0, v7, v8}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    .line 1699
    .local v3, "elem":Ljava/lang/Object;
    sget-object v15, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v3, v15, :cond_5b

    .line 1696
    :goto_4b
    const-wide/16 v15, 0x1

    add-long/2addr v5, v15

    goto :goto_3a

    .line 1694
    .end local v3    # "elem":Ljava/lang/Object;
    .end local v5    # "i":J
    .end local v7    # "index":J
    .end local v12    # "movingLeft":Z
    .end local v14    # "value":Ljava/lang/Object;
    :cond_4f
    const/4 v12, 0x0

    goto :goto_2c

    .line 1695
    .restart local v12    # "movingLeft":Z
    :cond_51
    sget-object v14, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_38

    .line 1697
    .restart local v5    # "i":J
    .restart local v14    # "value":Ljava/lang/Object;
    :cond_54
    const-wide/16 v15, 0x1

    sub-long v15, v10, v15

    sub-long v7, v15, v5

    goto :goto_41

    .line 1702
    .restart local v3    # "elem":Ljava/lang/Object;
    .restart local v7    # "index":J
    :cond_5b
    sget-object v15, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v14, v15, :cond_61

    .line 1704
    move-object v14, v3

    goto :goto_4b

    .line 1706
    :cond_61
    const/4 v15, 0x4

    new-array v9, v15, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v14, v9, v15

    const/4 v15, 0x1

    aput-object v3, v9, v15

    const/4 v15, 0x2

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    aput-object v16, v9, v15

    const/4 v15, 0x3

    aput-object p3, v9, v15

    .line 1707
    .local v9, "innerArgs":[Ljava/lang/Object;
    move-object/from16 v0, p0

    invoke-interface {v4, v0, v13, v13, v9}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    goto :goto_4b

    .line 1710
    .end local v3    # "elem":Ljava/lang/Object;
    .end local v7    # "index":J
    .end local v9    # "innerArgs":[Ljava/lang/Object;
    :cond_7b
    sget-object v15, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v14, v15, :cond_86

    .line 1712
    const-string v15, "msg.empty.array.reduce"

    invoke-static {v15}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v15

    throw v15

    .line 1714
    :cond_86
    return-object v14
.end method

.method private static setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V
    .registers 8
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 776
    const-wide/32 v1, 0x7fffffff

    cmp-long v1, p2, v1

    if-lez v1, :cond_f

    .line 777
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    .line 778
    .local v0, "id":Ljava/lang/String;
    invoke-static {p1, v0, p4}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 782
    .end local v0    # "id":Ljava/lang/String;
    :goto_e
    return-void

    .line 780
    :cond_f
    long-to-int v1, p2

    invoke-static {p1, v1, p4}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)V

    goto :goto_e
.end method

.method private setLength(Ljava/lang/Object;)V
    .registers 21
    .param p1, "val"    # Ljava/lang/Object;

    .prologue
    .line 651
    move-object/from16 v0, p0

    iget v13, v0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    and-int/lit8 v13, v13, 0x1

    if-eqz v13, :cond_9

    .line 705
    :goto_8
    return-void

    .line 655
    :cond_9
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    .line 656
    .local v1, "d":D
    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(D)J

    move-result-wide v9

    .line 657
    .local v9, "longVal":J
    long-to-double v13, v9

    cmpl-double v13, v13, v1

    if-eqz v13, :cond_23

    .line 658
    const-string v13, "msg.arraylength.bad"

    invoke-static {v13}, Lorg/mozilla/javascript/ScriptRuntime;->getMessage0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 659
    .local v11, "msg":Ljava/lang/String;
    const-string v13, "RangeError"

    invoke-static {v13, v11}, Lorg/mozilla/javascript/ScriptRuntime;->constructError(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v13

    throw v13

    .line 662
    .end local v11    # "msg":Ljava/lang/String;
    :cond_23
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v13, :cond_6d

    .line 663
    move-object/from16 v0, p0

    iget-wide v13, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v13, v9, v13

    if-gez v13, :cond_45

    .line 665
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    long-to-int v14, v9

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v15, v15

    sget-object v16, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    invoke-static/range {v13 .. v16}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 666
    move-object/from16 v0, p0

    iput-wide v9, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_8

    .line 668
    :cond_45
    const-wide/32 v13, 0x55555554

    cmp-long v13, v9, v13

    if-gez v13, :cond_68

    long-to-double v13, v9

    move-object/from16 v0, p0

    iget-wide v15, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-double v15, v15

    const-wide/high16 v17, 0x3ff8000000000000L    # 1.5

    mul-double v15, v15, v17

    cmpg-double v13, v13, v15

    if-gez v13, :cond_68

    long-to-int v13, v9

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v13

    if-eqz v13, :cond_68

    .line 672
    move-object/from16 v0, p0

    iput-wide v9, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_8

    .line 675
    :cond_68
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 678
    :cond_6d
    move-object/from16 v0, p0

    iget-wide v13, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v13, v9, v13

    if-gez v13, :cond_c4

    .line 680
    move-object/from16 v0, p0

    iget-wide v13, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    sub-long/2addr v13, v9

    const-wide/16 v15, 0x1000

    cmp-long v13, v13, v15

    if-lez v13, :cond_b2

    .line 682
    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/NativeArray;->getIds()[Ljava/lang/Object;

    move-result-object v3

    .line 683
    .local v3, "e":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_85
    array-length v13, v3

    if-ge v4, v13, :cond_c4

    .line 684
    aget-object v6, v3, v4

    .line 685
    .local v6, "id":Ljava/lang/Object;
    instance-of v13, v6, Ljava/lang/String;

    if-eqz v13, :cond_a1

    move-object v12, v6

    .line 687
    check-cast v12, Ljava/lang/String;

    .line 688
    .local v12, "strId":Ljava/lang/String;
    invoke-static {v12}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v7

    .line 689
    .local v7, "index":J
    cmp-long v13, v7, v9

    if-ltz v13, :cond_9e

    .line 690
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/NativeArray;->delete(Ljava/lang/String;)V

    .line 683
    .end local v6    # "id":Ljava/lang/Object;
    .end local v7    # "index":J
    .end local v12    # "strId":Ljava/lang/String;
    :cond_9e
    :goto_9e
    add-int/lit8 v4, v4, 0x1

    goto :goto_85

    .line 692
    .restart local v6    # "id":Ljava/lang/Object;
    :cond_a1
    check-cast v6, Ljava/lang/Integer;

    .end local v6    # "id":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 693
    .local v7, "index":I
    int-to-long v13, v7

    cmp-long v13, v13, v9

    if-ltz v13, :cond_9e

    .line 694
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lorg/mozilla/javascript/NativeArray;->delete(I)V

    goto :goto_9e

    .line 699
    .end local v3    # "e":[Ljava/lang/Object;
    .end local v4    # "i":I
    .end local v7    # "index":I
    :cond_b2
    move-wide v4, v9

    .local v4, "i":J
    :goto_b3
    move-object/from16 v0, p0

    iget-wide v13, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v13, v4, v13

    if-gez v13, :cond_c4

    .line 700
    move-object/from16 v0, p0

    invoke-static {v0, v4, v5}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 699
    const-wide/16 v13, 0x1

    add-long/2addr v4, v13

    goto :goto_b3

    .line 704
    .end local v4    # "i":J
    :cond_c4
    move-object/from16 v0, p0

    iput-wide v9, v0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto/16 :goto_8
.end method

.method private static setLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;
    .registers 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "length"    # J

    .prologue
    .line 731
    long-to-double v1, p2

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 732
    .local v0, "len":Ljava/lang/Number;
    const-string v1, "length"

    invoke-static {p1, v1, v0}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 733
    return-object v0
.end method

.method static setMaximumInitialCapacity(I)V
    .registers 1
    .param p0, "maximumInitialCapacity"    # I

    .prologue
    .line 56
    sput p0, Lorg/mozilla/javascript/NativeArray;->maximumInitialCapacity:I

    .line 57
    return-void
.end method

.method private static setRawElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V
    .registers 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "index"    # J
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 787
    sget-object v0, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-ne p4, v0, :cond_8

    .line 788
    invoke-static {p1, p2, p3}, Lorg/mozilla/javascript/NativeArray;->deleteElem(Lorg/mozilla/javascript/Scriptable;J)V

    .line 792
    :goto_7
    return-void

    .line 790
    :cond_8
    invoke-static {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/NativeArray;->setElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;JLjava/lang/Object;)V

    goto :goto_7
.end method

.method private static toArrayIndex(D)J
    .registers 6
    .param p0, "d"    # D

    .prologue
    .line 382
    cmpl-double v2, p0, p0

    if-nez v2, :cond_17

    .line 383
    invoke-static {p0, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(D)J

    move-result-wide v0

    .line 384
    .local v0, "index":J
    long-to-double v2, v0

    cmpl-double v2, v2, p0

    if-nez v2, :cond_17

    const-wide v2, 0xffffffffL

    cmp-long v2, v0, v2

    if-eqz v2, :cond_17

    .line 388
    .end local v0    # "index":J
    :goto_16
    return-wide v0

    :cond_17
    const-wide/16 v0, -0x1

    goto :goto_16
.end method

.method private static toArrayIndex(Ljava/lang/Object;)J
    .registers 3
    .param p0, "id"    # Ljava/lang/Object;

    .prologue
    .line 360
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 361
    check-cast p0, Ljava/lang/String;

    .end local p0    # "id":Ljava/lang/Object;
    invoke-static {p0}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v0

    .line 365
    :goto_a
    return-wide v0

    .line 362
    .restart local p0    # "id":Ljava/lang/Object;
    :cond_b
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_1a

    .line 363
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "id":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(D)J

    move-result-wide v0

    goto :goto_a

    .line 365
    .restart local p0    # "id":Ljava/lang/Object;
    :cond_1a
    const-wide/16 v0, -0x1

    goto :goto_a
.end method

.method private static toArrayIndex(Ljava/lang/String;)J
    .registers 5
    .param p0, "id"    # Ljava/lang/String;

    .prologue
    .line 372
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v2

    invoke-static {v2, v3}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(D)J

    move-result-wide v0

    .line 375
    .local v0, "index":J
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 378
    .end local v0    # "index":J
    :goto_12
    return-wide v0

    .restart local v0    # "index":J
    :cond_13
    const-wide/16 v0, -0x1

    goto :goto_12
.end method

.method private static toDenseIndex(Ljava/lang/Object;)I
    .registers 5
    .param p0, "id"    # Ljava/lang/Object;

    .prologue
    .line 392
    invoke-static {p0}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/Object;)J

    move-result-wide v0

    .line 393
    .local v0, "index":J
    const-wide/16 v2, 0x0

    cmp-long v2, v2, v0

    if-gtz v2, :cond_13

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gez v2, :cond_13

    long-to-int v2, v0

    :goto_12
    return v2

    :cond_13
    const/4 v2, -0x1

    goto :goto_12
.end method

.method private static toSliceIndex(DJ)J
    .registers 10
    .param p0, "value"    # D
    .param p2, "length"    # J

    .prologue
    const-wide/16 v4, 0x0

    .line 1469
    cmpg-double v2, p0, v4

    if-gez v2, :cond_13

    .line 1470
    long-to-double v2, p2

    add-double/2addr v2, p0

    cmpg-double v2, v2, v4

    if-gez v2, :cond_f

    .line 1471
    const-wide/16 v0, 0x0

    .line 1480
    .local v0, "result":J
    :goto_e
    return-wide v0

    .line 1473
    .end local v0    # "result":J
    :cond_f
    long-to-double v2, p2

    add-double/2addr v2, p0

    double-to-long v0, v2

    .restart local v0    # "result":J
    goto :goto_e

    .line 1475
    .end local v0    # "result":J
    :cond_13
    long-to-double v2, p2

    cmpl-double v2, p0, v2

    if-lez v2, :cond_1a

    .line 1476
    move-wide v0, p2

    .restart local v0    # "result":J
    goto :goto_e

    .line 1478
    .end local v0    # "result":J
    :cond_1a
    double-to-long v0, p0

    .restart local v0    # "result":J
    goto :goto_e
.end method

.method private static toStringHelper(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ZZ)Ljava/lang/String;
    .registers 24
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "toSource"    # Z
    .param p4, "toLocale"    # Z

    .prologue
    .line 802
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->getLengthProperty(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)J

    move-result-wide v10

    .line 804
    .local v10, "length":J
    new-instance v12, Ljava/lang/StringBuilder;

    const/16 v17, 0x100

    move/from16 v0, v17

    invoke-direct {v12, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 809
    .local v12, "result":Ljava/lang/StringBuilder;
    if-eqz p3, :cond_84

    .line 810
    const/16 v17, 0x5b

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 811
    const-string v14, ", "

    .line 816
    .local v14, "separator":Ljava/lang/String;
    :goto_1c
    const/4 v6, 0x0

    .line 817
    .local v6, "haslast":Z
    const-wide/16 v7, 0x0

    .line 820
    .local v7, "i":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v17, v0

    if-nez v17, :cond_87

    .line 821
    const/16 v16, 0x1

    .line 822
    .local v16, "toplevel":Z
    const/4 v9, 0x0

    .line 823
    .local v9, "iterating":Z
    new-instance v17, Lorg/mozilla/javascript/ObjToIntMap;

    const/16 v18, 0x1f

    invoke-direct/range {v17 .. v18}, Lorg/mozilla/javascript/ObjToIntMap;-><init>(I)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    .line 832
    :goto_37
    if-nez v9, :cond_108

    .line 833
    :try_start_39
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/ObjToIntMap;->put(Ljava/lang/Object;I)V

    .line 835
    if-eqz p3, :cond_58

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v17

    const/16 v18, 0x96

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_98

    :cond_58
    const/4 v15, 0x1

    .line 837
    .local v15, "skipUndefinedAndNull":Z
    :goto_59
    const-wide/16 v7, 0x0

    :goto_5b
    cmp-long v17, v7, v10

    if-gez v17, :cond_108

    .line 838
    const-wide/16 v17, 0x0

    cmp-long v17, v7, v17

    if-lez v17, :cond_68

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 839
    :cond_68
    move-object/from16 v0, p2

    invoke-static {v0, v7, v8}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v3

    .line 840
    .local v3, "elem":Ljava/lang/Object;
    sget-object v17, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    move-object/from16 v0, v17

    if-eq v3, v0, :cond_7e

    if-eqz v15, :cond_9a

    if-eqz v3, :cond_7e

    sget-object v17, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;
    :try_end_7a
    .catchall {:try_start_39 .. :try_end_7a} :catchall_ab

    move-object/from16 v0, v17

    if-ne v3, v0, :cond_9a

    .line 842
    :cond_7e
    const/4 v6, 0x0

    .line 837
    :goto_7f
    const-wide/16 v17, 0x1

    add-long v7, v7, v17

    goto :goto_5b

    .line 813
    .end local v3    # "elem":Ljava/lang/Object;
    .end local v6    # "haslast":Z
    .end local v7    # "i":J
    .end local v9    # "iterating":Z
    .end local v14    # "separator":Ljava/lang/String;
    .end local v15    # "skipUndefinedAndNull":Z
    .end local v16    # "toplevel":Z
    :cond_84
    const-string v14, ","

    .restart local v14    # "separator":Ljava/lang/String;
    goto :goto_1c

    .line 825
    .restart local v6    # "haslast":Z
    .restart local v7    # "i":J
    :cond_87
    const/16 v16, 0x0

    .line 826
    .restart local v16    # "toplevel":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/ObjToIntMap;->has(Ljava/lang/Object;)Z

    move-result v9

    .restart local v9    # "iterating":Z
    goto :goto_37

    .line 835
    :cond_98
    const/4 v15, 0x0

    goto :goto_59

    .line 845
    .restart local v3    # "elem":Ljava/lang/Object;
    .restart local v15    # "skipUndefinedAndNull":Z
    :cond_9a
    const/4 v6, 0x1

    .line 847
    if-eqz p3, :cond_b7

    .line 848
    :try_start_9d
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v3}, Lorg/mozilla/javascript/ScriptRuntime;->uneval(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_aa
    .catchall {:try_start_9d .. :try_end_aa} :catchall_ab

    goto :goto_7f

    .line 875
    .end local v3    # "elem":Ljava/lang/Object;
    .end local v15    # "skipUndefinedAndNull":Z
    :catchall_ab
    move-exception v17

    if-eqz v16, :cond_b6

    .line 876
    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    :cond_b6
    throw v17

    .line 850
    .restart local v3    # "elem":Ljava/lang/Object;
    .restart local v15    # "skipUndefinedAndNull":Z
    :cond_b7
    :try_start_b7
    instance-of v0, v3, Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_df

    .line 851
    move-object v0, v3

    check-cast v0, Ljava/lang/String;

    move-object v13, v0

    .line 852
    .local v13, "s":Ljava/lang/String;
    if-eqz p3, :cond_db

    .line 853
    const/16 v17, 0x22

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 854
    invoke-static {v13}, Lorg/mozilla/javascript/ScriptRuntime;->escapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 855
    const/16 v17, 0x22

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7f

    .line 857
    :cond_db
    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7f

    .line 861
    .end local v13    # "s":Ljava/lang/String;
    :cond_df
    if-eqz p4, :cond_fd

    .line 864
    const-string v17, "toLocaleString"

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-static {v3, v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v4

    .line 866
    .local v4, "fun":Lorg/mozilla/javascript/Callable;
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    .line 867
    .local v5, "funThis":Lorg/mozilla/javascript/Scriptable;
    sget-object v17, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-interface {v4, v0, v1, v5, v2}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 870
    .end local v4    # "fun":Lorg/mozilla/javascript/Callable;
    .end local v5    # "funThis":Lorg/mozilla/javascript/Scriptable;
    :cond_fd
    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_106
    .catchall {:try_start_b7 .. :try_end_106} :catchall_ab

    goto/16 :goto_7f

    .line 875
    .end local v3    # "elem":Ljava/lang/Object;
    .end local v15    # "skipUndefinedAndNull":Z
    :cond_108
    if-eqz v16, :cond_112

    .line 876
    const/16 v17, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->iterating:Lorg/mozilla/javascript/ObjToIntMap;

    .line 880
    :cond_112
    if-eqz p3, :cond_123

    .line 882
    if-nez v6, :cond_128

    const-wide/16 v17, 0x0

    cmp-long v17, v7, v17

    if-lez v17, :cond_128

    .line 883
    const-string v17, ", ]"

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 887
    :cond_123
    :goto_123
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    return-object v17

    .line 885
    :cond_128
    const/16 v17, 0x5d

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_123
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 1924
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1900
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 4
    .param p1, "index"    # I
    .param p2, "c"    # Ljava/util/Collection;

    .prologue
    .line 1928
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 1908
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 1920
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1727
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/NativeArray;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 5
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 1750
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 1751
    .local v0, "aC":Ljava/lang/Object;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 1752
    const/4 v2, 0x0

    .line 1753
    .end local v0    # "aC":Ljava/lang/Object;
    :goto_15
    return v2

    :cond_16
    const/4 v2, 0x1

    goto :goto_15
.end method

.method protected defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V
    .registers 11
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "desc"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p4, "checkValid"    # Z

    .prologue
    .line 573
    iget-object v4, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v4, :cond_1e

    .line 574
    iget-object v3, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 575
    .local v3, "values":[Ljava/lang/Object;
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    .line 576
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 577
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    array-length v4, v3

    if-ge v0, v4, :cond_1e

    .line 578
    aget-object v4, v3, v0

    sget-object v5, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v4, v5, :cond_1b

    .line 579
    aget-object v4, v3, v0

    invoke-virtual {p0, v0, p0, v4}, Lorg/mozilla/javascript/NativeArray;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 577
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 583
    .end local v0    # "i":I
    .end local v3    # "values":[Ljava/lang/Object;
    :cond_1e
    invoke-static {p2}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/Object;)J

    move-result-wide v1

    .line 584
    .local v1, "index":J
    iget-wide v4, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v4, v1, v4

    if-ltz v4, :cond_2d

    .line 585
    const-wide/16 v4, 0x1

    add-long/2addr v4, v1

    iput-wide v4, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 587
    :cond_2d
    invoke-super {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/IdScriptableObject;->defineOwnProperty(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/ScriptableObject;Z)V

    .line 588
    return-void
.end method

.method public delete(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 463
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_24

    if-ltz p1, :cond_24

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_24

    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->isSealed()Z

    move-result v0

    if-nez v0, :cond_24

    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v0, :cond_1d

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lorg/mozilla/javascript/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-nez v0, :cond_24

    .line 466
    :cond_1d
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    sget-object v1, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    aput-object v1, v0, p1

    .line 470
    :goto_23
    return-void

    .line 468
    :cond_24
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->delete(I)V

    goto :goto_23
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 226
    sget-object v6, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v6}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_f

    .line 227
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 333
    :goto_e
    return-object v4

    .line 229
    :cond_f
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v1

    .line 232
    .local v1, "id":I
    :goto_13
    packed-switch v1, :pswitch_data_c4

    .line 335
    :pswitch_16
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 254
    :pswitch_20
    array-length v6, p5

    if-lez v6, :cond_3c

    .line 255
    aget-object v6, p5, v5

    invoke-static {p2, p3, v6}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p4

    .line 256
    array-length v6, p5

    add-int/lit8 v6, v6, -0x1

    new-array v3, v6, [Ljava/lang/Object;

    .line 257
    .local v3, "newArgs":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2f
    array-length v6, v3

    if-ge v0, v6, :cond_3b

    .line 258
    add-int/lit8 v6, v0, 0x1

    aget-object v6, p5, v6

    aput-object v6, v3, v0

    .line 257
    add-int/lit8 v0, v0, 0x1

    goto :goto_2f

    .line 259
    :cond_3b
    move-object p5, v3

    .line 261
    .end local v0    # "i":I
    .end local v3    # "newArgs":[Ljava/lang/Object;
    :cond_3c
    neg-int v1, v1

    .line 262
    goto :goto_13

    .line 266
    :pswitch_3e
    array-length v6, p5

    if-lez v6, :cond_4e

    aget-object v6, p5, v5

    invoke-static {v6}, Lorg/mozilla/javascript/NativeArray;->js_isArray(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4e

    :goto_49
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    goto :goto_e

    :cond_4e
    move v4, v5

    goto :goto_49

    .line 269
    :pswitch_50
    if-nez p4, :cond_5a

    move v2, v4

    .line 270
    .local v2, "inNewExpr":Z
    :goto_53
    if-nez v2, :cond_5c

    .line 272
    invoke-virtual {p1, p2, p3, p5}, Lorg/mozilla/javascript/IdFunctionObject;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto :goto_e

    .end local v2    # "inNewExpr":Z
    :cond_5a
    move v2, v5

    .line 269
    goto :goto_53

    .line 274
    .restart local v2    # "inNewExpr":Z
    :cond_5c
    invoke-static {p2, p3, p5}, Lorg/mozilla/javascript/NativeArray;->jsConstructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_e

    .line 278
    .end local v2    # "inNewExpr":Z
    :pswitch_61
    const/4 v4, 0x4

    invoke-virtual {p2, v4}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v4

    invoke-static {p2, p3, p4, v4, v5}, Lorg/mozilla/javascript/NativeArray;->toStringHelper(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v4

    goto :goto_e

    .line 282
    :pswitch_6b
    invoke-static {p2, p3, p4, v5, v4}, Lorg/mozilla/javascript/NativeArray;->toStringHelper(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v4

    goto :goto_e

    .line 285
    :pswitch_70
    invoke-static {p2, p3, p4, v4, v5}, Lorg/mozilla/javascript/NativeArray;->toStringHelper(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ZZ)Ljava/lang/String;

    move-result-object v4

    goto :goto_e

    .line 288
    :pswitch_75
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_join(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_e

    .line 291
    :pswitch_7a
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_reverse(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto :goto_e

    .line 294
    :pswitch_7f
    invoke-static {p2, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_sort(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto :goto_e

    .line 297
    :pswitch_84
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_push(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_e

    .line 300
    :pswitch_89
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_pop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_e

    .line 303
    :pswitch_8e
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_shift(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_e

    .line 306
    :pswitch_94
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_unshift(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_e

    .line 309
    :pswitch_9a
    invoke-static {p2, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_splice(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_e

    .line 312
    :pswitch_a0
    invoke-static {p2, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_concat(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto/16 :goto_e

    .line 315
    :pswitch_a6
    invoke-direct {p0, p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_slice(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    goto/16 :goto_e

    .line 318
    :pswitch_ac
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_indexOf(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_e

    .line 321
    :pswitch_b2
    invoke-static {p2, p4, p5}, Lorg/mozilla/javascript/NativeArray;->js_lastIndexOf(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_e

    .line 330
    :pswitch_b8
    invoke-static {p2, v1, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->iterativeMethod(Lorg/mozilla/javascript/Context;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_e

    .line 333
    :pswitch_be
    invoke-static {p2, v1, p3, p4, p5}, Lorg/mozilla/javascript/NativeArray;->reduceMethod(Lorg/mozilla/javascript/Context;ILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_e

    .line 232
    :pswitch_data_c4
    .packed-switch -0x1a
        :pswitch_3e
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_20
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_50
        :pswitch_61
        :pswitch_6b
        :pswitch_70
        :pswitch_75
        :pswitch_7a
        :pswitch_7f
        :pswitch_84
        :pswitch_89
        :pswitch_8e
        :pswitch_94
        :pswitch_9a
        :pswitch_a0
        :pswitch_a6
        :pswitch_ac
        :pswitch_b2
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_be
        :pswitch_be
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .registers 15
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x0

    const/4 v5, 0x1

    .line 139
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v3, -0x5

    const-string v4, "join"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 141
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v9, -0x6

    const-string v10, "reverse"

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 143
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v3, -0x7

    const-string v4, "sort"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 145
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/4 v3, -0x8

    const-string v4, "push"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 147
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0x9

    const-string v10, "pop"

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 149
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xa

    const-string v10, "shift"

    move-object v6, p0

    move-object v7, p1

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 151
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xb

    const-string v4, "unshift"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 153
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xc

    const-string v10, "splice"

    move-object v6, p0

    move-object v7, p1

    move v11, v12

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 155
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xd

    const-string v4, "concat"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 157
    sget-object v8, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v9, -0xe

    const-string v10, "slice"

    move-object v6, p0

    move-object v7, p1

    move v11, v12

    invoke-virtual/range {v6 .. v11}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 159
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0xf

    const-string v4, "indexOf"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 161
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x10

    const-string v4, "lastIndexOf"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 163
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x11

    const-string v4, "every"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 165
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x12

    const-string v4, "filter"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 167
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x13

    const-string v4, "forEach"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 169
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x14

    const-string v4, "map"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 171
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x15

    const-string v4, "some"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 173
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x16

    const-string v4, "find"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 175
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x17

    const-string v4, "findIndex"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 177
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x18

    const-string v4, "reduce"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 179
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x19

    const-string v4, "reduceRight"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 181
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    const/16 v3, -0x1a

    const-string v4, "isArray"

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeArray;->addIdFunctionProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;ILjava/lang/String;I)V

    .line 183
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 184
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 105
    const-string v0, "length"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 106
    iget v0, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/mozilla/javascript/NativeArray;->instanceIdInfo(II)I

    move-result v0

    .line 108
    :goto_f
    return v0

    :cond_10
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v0

    goto :goto_f
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 11
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x6c

    const/16 v7, 0x70

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1950
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 1951
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_104

    .line 1992
    :cond_10
    :goto_10
    :pswitch_10
    if-eqz v0, :cond_1b

    if-eq v0, p1, :cond_1b

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    const/4 v2, 0x0

    .line 1996
    :cond_1b
    :goto_1b
    return v2

    .line 1952
    :pswitch_1c
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1953
    .local v1, "c":I
    const/16 v3, 0x6d

    if-ne v1, v3, :cond_35

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-ne v3, v4, :cond_10

    const/16 v2, 0x14

    goto :goto_1b

    .line 1954
    :cond_35
    if-ne v1, v7, :cond_10

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_10

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x6f

    if-ne v3, v4, :cond_10

    const/16 v2, 0x9

    goto :goto_1b

    .line 1956
    .end local v1    # "c":I
    :pswitch_48
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    packed-switch v3, :pswitch_data_120

    :pswitch_4f
    goto :goto_10

    .line 1957
    :pswitch_50
    const-string v0, "join"

    const/4 v2, 0x5

    goto :goto_10

    .line 1958
    :pswitch_54
    const-string v0, "some"

    const/16 v2, 0x15

    goto :goto_10

    .line 1959
    :pswitch_59
    const-string v0, "find"

    const/16 v2, 0x16

    goto :goto_10

    .line 1960
    :pswitch_5e
    const-string v0, "sort"

    const/4 v2, 0x7

    goto :goto_10

    .line 1961
    :pswitch_62
    const-string v0, "push"

    const/16 v2, 0x8

    goto :goto_10

    .line 1963
    :pswitch_67
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1964
    .restart local v1    # "c":I
    const/16 v3, 0x68

    if-ne v1, v3, :cond_74

    const-string v0, "shift"

    const/16 v2, 0xa

    goto :goto_10

    .line 1965
    :cond_74
    if-ne v1, v8, :cond_7b

    const-string v0, "slice"

    const/16 v2, 0xe

    goto :goto_10

    .line 1966
    :cond_7b
    const/16 v3, 0x76

    if-ne v1, v3, :cond_10

    const-string v0, "every"

    const/16 v2, 0x11

    goto :goto_10

    .line 1968
    .end local v1    # "c":I
    :pswitch_84
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_13a

    goto :goto_10

    .line 1969
    :sswitch_8c
    const-string v0, "concat"

    const/16 v2, 0xd

    goto :goto_10

    .line 1970
    :sswitch_91
    const-string v0, "filter"

    const/16 v2, 0x12

    goto/16 :goto_10

    .line 1971
    :sswitch_97
    const-string v0, "reduce"

    const/16 v2, 0x18

    goto/16 :goto_10

    .line 1972
    :sswitch_9d
    const-string v0, "splice"

    const/16 v2, 0xc

    goto/16 :goto_10

    .line 1974
    :pswitch_a3
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_14c

    goto/16 :goto_10

    .line 1975
    :sswitch_ac
    const-string v0, "forEach"

    const/16 v2, 0x13

    goto/16 :goto_10

    .line 1976
    :sswitch_b2
    const-string v0, "indexOf"

    const/16 v2, 0xf

    goto/16 :goto_10

    .line 1977
    :sswitch_b8
    const-string v0, "reverse"

    const/4 v2, 0x6

    goto/16 :goto_10

    .line 1978
    :sswitch_bd
    const-string v0, "unshift"

    const/16 v2, 0xb

    goto/16 :goto_10

    .line 1980
    :pswitch_c3
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1981
    .restart local v1    # "c":I
    const/16 v3, 0x6f

    if-ne v1, v3, :cond_d1

    const-string v0, "toSource"

    const/4 v2, 0x4

    goto/16 :goto_10

    .line 1982
    :cond_d1
    const/16 v3, 0x74

    if-ne v1, v3, :cond_10

    const-string v0, "toString"

    const/4 v2, 0x2

    goto/16 :goto_10

    .line 1984
    .end local v1    # "c":I
    :pswitch_da
    const-string v0, "findIndex"

    const/16 v2, 0x17

    goto/16 :goto_10

    .line 1985
    :pswitch_e0
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1986
    .restart local v1    # "c":I
    const/16 v3, 0x63

    if-ne v1, v3, :cond_ed

    const-string v0, "constructor"

    const/4 v2, 0x1

    goto/16 :goto_10

    .line 1987
    :cond_ed
    if-ne v1, v8, :cond_f5

    const-string v0, "lastIndexOf"

    const/16 v2, 0x10

    goto/16 :goto_10

    .line 1988
    :cond_f5
    const/16 v3, 0x72

    if-ne v1, v3, :cond_10

    const-string v0, "reduceRight"

    const/16 v2, 0x19

    goto/16 :goto_10

    .line 1990
    .end local v1    # "c":I
    :pswitch_ff
    const-string v0, "toLocaleString"

    const/4 v2, 0x3

    goto/16 :goto_10

    .line 1951
    :pswitch_data_104
    .packed-switch 0x3
        :pswitch_1c
        :pswitch_48
        :pswitch_67
        :pswitch_84
        :pswitch_a3
        :pswitch_c3
        :pswitch_da
        :pswitch_10
        :pswitch_e0
        :pswitch_10
        :pswitch_10
        :pswitch_ff
    .end packed-switch

    .line 1956
    :pswitch_data_120
    .packed-switch 0x69
        :pswitch_50
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_54
        :pswitch_59
        :pswitch_4f
        :pswitch_4f
        :pswitch_4f
        :pswitch_5e
        :pswitch_62
    .end packed-switch

    .line 1968
    :sswitch_data_13a
    .sparse-switch
        0x63 -> :sswitch_8c
        0x66 -> :sswitch_91
        0x72 -> :sswitch_97
        0x73 -> :sswitch_9d
    .end sparse-switch

    .line 1974
    :sswitch_data_14c
    .sparse-switch
        0x66 -> :sswitch_ac
        0x69 -> :sswitch_b2
        0x72 -> :sswitch_b8
        0x75 -> :sswitch_bd
    .end sparse-switch
.end method

.method public get(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 1785
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/mozilla/javascript/NativeArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 342
    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v0, :cond_11

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lorg/mozilla/javascript/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 343
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 346
    :goto_10
    return-object v0

    .line 344
    :cond_11
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_21

    if-ltz p1, :cond_21

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_21

    .line 345
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v0, v0, p1

    goto :goto_10

    .line 346
    :cond_21
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_10
.end method

.method public get(J)Ljava/lang/Object;
    .registers 6
    .param p1, "index"    # J

    .prologue
    .line 1771
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-ltz v1, :cond_c

    iget-wide v1, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v1, p1, v1

    if-ltz v1, :cond_12

    .line 1772
    :cond_c
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 1774
    :cond_12
    invoke-static {p0, p1, p2}, Lorg/mozilla/javascript/NativeArray;->getRawElem(Lorg/mozilla/javascript/Scriptable;J)Ljava/lang/Object;

    move-result-object v0

    .line 1775
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_1e

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_20

    .line 1776
    :cond_1e
    const/4 v0, 0x0

    .line 1780
    .end local v0    # "value":Ljava/lang/Object;
    :cond_1f
    :goto_1f
    return-object v0

    .line 1777
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_20
    instance-of v1, v0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v1, :cond_1f

    .line 1778
    check-cast v0, Lorg/mozilla/javascript/Wrapper;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v0

    goto :goto_1f
.end method

.method public getAllIds()[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 507
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->getIds()[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 509
    .local v0, "allIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Object;>;"
    invoke-super {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 510
    invoke-interface {v0}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getAttributes(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 550
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_15

    if-ltz p1, :cond_15

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_15

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v0, v0, p1

    sget-object v1, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v0, v1, :cond_15

    .line 552
    const/4 v0, 0x0

    .line 554
    :goto_14
    return v0

    :cond_15
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getAttributes(I)I

    move-result v0

    goto :goto_14
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 82
    const-string v0, "Array"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 528
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v1, :cond_17

    .line 529
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 530
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v1

    const/16 v2, 0x78

    if-ne v1, v2, :cond_17

    .line 531
    iget-wide v1, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 533
    .end local v0    # "cx":Lorg/mozilla/javascript/Context;
    :goto_16
    return-object v1

    :cond_17
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_16
.end method

.method public getIds()[Ljava/lang/Object;
    .registers 13

    .prologue
    const/4 v11, 0x0

    .line 475
    invoke-super {p0}, Lorg/mozilla/javascript/IdScriptableObject;->getIds()[Ljava/lang/Object;

    move-result-object v6

    .line 476
    .local v6, "superIds":[Ljava/lang/Object;
    iget-object v9, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-nez v9, :cond_a

    .line 501
    .end local v6    # "superIds":[Ljava/lang/Object;
    :cond_9
    :goto_9
    return-object v6

    .line 477
    .restart local v6    # "superIds":[Ljava/lang/Object;
    :cond_a
    iget-object v9, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v9

    .line 478
    .local v0, "N":I
    iget-wide v1, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 479
    .local v1, "currentLength":J
    int-to-long v9, v0

    cmp-long v9, v9, v1

    if-lez v9, :cond_15

    .line 480
    long-to-int v0, v1

    .line 482
    :cond_15
    if-eqz v0, :cond_9

    .line 483
    array-length v7, v6

    .line 484
    .local v7, "superLength":I
    add-int v9, v0, v7

    new-array v4, v9, [Ljava/lang/Object;

    .line 486
    .local v4, "ids":[Ljava/lang/Object;
    const/4 v5, 0x0

    .line 487
    .local v5, "presentCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1e
    if-eq v3, v0, :cond_33

    .line 489
    iget-object v9, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v9, v9, v3

    sget-object v10, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v9, v10, :cond_30

    .line 490
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v4, v5

    .line 491
    add-int/lit8 v5, v5, 0x1

    .line 487
    :cond_30
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    .line 494
    :cond_33
    if-eq v5, v0, :cond_3d

    .line 496
    add-int v9, v5, v7

    new-array v8, v9, [Ljava/lang/Object;

    .line 497
    .local v8, "tmp":[Ljava/lang/Object;
    invoke-static {v4, v11, v8, v11, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 498
    move-object v4, v8

    .line 500
    .end local v8    # "tmp":[Ljava/lang/Object;
    :cond_3d
    invoke-static {v6, v11, v4, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v6, v4

    .line 501
    goto :goto_9
.end method

.method public getIndexIds()[Ljava/lang/Integer;
    .registers 10

    .prologue
    .line 514
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->getIds()[Ljava/lang/Object;

    move-result-object v3

    .line 515
    .local v3, "ids":[Ljava/lang/Object;
    new-instance v4, Ljava/util/ArrayList;

    array-length v7, v3

    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 516
    .local v4, "indices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_d
    if-ge v1, v6, :cond_30

    aget-object v2, v0, v1

    .line 517
    .local v2, "id":Ljava/lang/Object;
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v5

    .line 518
    .local v5, "int32Id":I
    if-ltz v5, :cond_2d

    int-to-double v7, v5

    invoke-static {v7, v8}, Lorg/mozilla/javascript/ScriptRuntime;->toString(D)Ljava/lang/String;

    move-result-object v7

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2d

    .line 519
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 516
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 522
    .end local v2    # "id":Ljava/lang/Object;
    .end local v5    # "int32Id":I
    :cond_30
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/Integer;

    invoke-interface {v4, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Integer;

    return-object v7
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 114
    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    const-string v0, "length"

    .line 115
    :goto_5
    return-object v0

    :cond_6
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 121
    const/4 v0, 0x1

    if-ne p1, v0, :cond_b

    .line 122
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    long-to-double v0, v0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 124
    :goto_a
    return-object v0

    :cond_b
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_a
.end method

.method public getLength()J
    .registers 3

    .prologue
    .line 620
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    return-wide v0
.end method

.method protected getMaxInstanceId()I
    .registers 2

    .prologue
    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method protected getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 559
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v2, :cond_20

    .line 560
    invoke-static {p2}, Lorg/mozilla/javascript/NativeArray;->toDenseIndex(Ljava/lang/Object;)I

    move-result v0

    .line 561
    .local v0, "index":I
    if-ltz v0, :cond_20

    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v2

    if-ge v0, v2, :cond_20

    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v2, v2, v0

    sget-object v3, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_20

    .line 562
    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v1, v2, v0

    .line 563
    .local v1, "value":Ljava/lang/Object;
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/NativeArray;->defaultIndexPropertyDescriptor(Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    .line 566
    .end local v0    # "index":I
    .end local v1    # "value":Ljava/lang/Object;
    :goto_1f
    return-object v2

    :cond_20
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->getOwnPropertyDescriptor(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/ScriptableObject;

    move-result-object v2

    goto :goto_1f
.end method

.method public has(ILorg/mozilla/javascript/Scriptable;)Z
    .registers 6
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v0, 0x0

    .line 352
    iget-boolean v1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v1, :cond_11

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v0}, Lorg/mozilla/javascript/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 353
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    .line 356
    :cond_10
    :goto_10
    return v0

    .line 354
    :cond_11
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v1, :cond_26

    if-ltz p1, :cond_26

    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v1, v1

    if-ge p1, v1, :cond_26

    .line 355
    iget-object v1, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aget-object v1, v1, p1

    sget-object v2, Lorg/mozilla/javascript/NativeArray;->NOT_FOUND:Ljava/lang/Object;

    if-eq v1, v2, :cond_10

    const/4 v0, 0x1

    goto :goto_10

    .line 356
    :cond_26
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    goto :goto_10
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1789
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1790
    .local v2, "longLen":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v2, v4

    if-lez v4, :cond_f

    .line 1791
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 1793
    :cond_f
    long-to-int v1, v2

    .line 1794
    .local v1, "len":I
    if-nez p1, :cond_20

    .line 1795
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    if-ge v0, v1, :cond_32

    .line 1796
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1d

    move v4, v0

    .line 1807
    :goto_1c
    return v4

    .line 1795
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 1801
    .end local v0    # "i":I
    :cond_20
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_21
    if-ge v0, v1, :cond_32

    .line 1802
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2f

    move v4, v0

    .line 1803
    goto :goto_1c

    .line 1801
    :cond_2f
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 1807
    :cond_32
    const/4 v4, -0x1

    goto :goto_1c
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 191
    packed-switch p1, :pswitch_data_76

    .line 217
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 192
    :pswitch_d
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 219
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/NativeArray;->ARRAY_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeArray;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 220
    return-void

    .line 193
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 194
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toLocaleString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 195
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 196
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "join"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 197
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "reverse"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 198
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "sort"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 199
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "push"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 200
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_32
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "pop"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 201
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_36
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "shift"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 202
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "unshift"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 203
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "splice"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 204
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_42
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "concat"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 205
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_46
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "slice"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 206
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "indexOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 207
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "lastIndexOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 208
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_52
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "every"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 209
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_56
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "filter"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 210
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "forEach"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 211
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_5e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "map"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 212
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_62
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "some"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 213
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_66
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "find"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 214
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "findIndex"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 215
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_6e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "reduce"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 216
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_72
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "reduceRight"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 191
    :pswitch_data_76
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
        :pswitch_42
        :pswitch_46
        :pswitch_4a
        :pswitch_4e
        :pswitch_52
        :pswitch_56
        :pswitch_5a
        :pswitch_5e
        :pswitch_62
        :pswitch_66
        :pswitch_6a
        :pswitch_6e
        :pswitch_72
    .end packed-switch
.end method

.method public isEmpty()Z
    .registers 5

    .prologue
    .line 1767
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 1833
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public jsGet_length()J
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 626
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->getLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1811
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1812
    .local v2, "longLen":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v2, v4

    if-lez v4, :cond_f

    .line 1813
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 1815
    :cond_f
    long-to-int v1, v2

    .line 1816
    .local v1, "len":I
    if-nez p1, :cond_21

    .line 1817
    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_14
    if-ltz v0, :cond_34

    .line 1818
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1e

    move v4, v0

    .line 1829
    :goto_1d
    return v4

    .line 1817
    :cond_1e
    add-int/lit8 v0, v0, -0x1

    goto :goto_14

    .line 1823
    .end local v0    # "i":I
    :cond_21
    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "i":I
    :goto_23
    if-ltz v0, :cond_34

    .line 1824
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_31

    move v4, v0

    .line 1825
    goto :goto_1d

    .line 1823
    :cond_31
    add-int/lit8 v0, v0, -0x1

    goto :goto_23

    .line 1829
    :cond_34
    const/4 v4, -0x1

    goto :goto_1d
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 2

    .prologue
    .line 1837
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 8
    .param p1, "start"    # I

    .prologue
    .line 1841
    iget-wide v1, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1842
    .local v1, "longLen":J
    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v1, v3

    if-lez v3, :cond_f

    .line 1843
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 1845
    :cond_f
    long-to-int v0, v1

    .line 1847
    .local v0, "len":I
    if-ltz p1, :cond_14

    if-le p1, v0, :cond_2d

    .line 1848
    :cond_14
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1851
    :cond_2d
    new-instance v3, Lorg/mozilla/javascript/NativeArray$3;

    invoke-direct {v3, p0, p1, v0}, Lorg/mozilla/javascript/NativeArray$3;-><init>(Lorg/mozilla/javascript/NativeArray;II)V

    return-object v3
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 12
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    const-wide/16 v6, 0x1

    .line 430
    if-ne p2, p0, :cond_63

    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->isSealed()Z

    move-result v0

    if-nez v0, :cond_63

    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    if-eqz v0, :cond_63

    if-ltz p1, :cond_63

    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v0, :cond_1c

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p1, v1}, Lorg/mozilla/javascript/NativeArray;->isGetterOrSetter(Ljava/lang/String;IZ)Z

    move-result v0

    if-nez v0, :cond_63

    .line 433
    :cond_1c
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeArray;->isExtensible()Z

    move-result v0

    if-nez v0, :cond_2a

    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    int-to-long v2, p1

    cmp-long v0, v0, v2

    if-gtz v0, :cond_2a

    .line 458
    :cond_29
    :goto_29
    return-void

    .line 435
    :cond_2a
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v0, v0

    if-ge p1, v0, :cond_3f

    .line 436
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aput-object p3, v0, p1

    .line 437
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    int-to-long v2, p1

    cmp-long v0, v0, v2

    if-gtz v0, :cond_29

    .line 438
    int-to-long v0, p1

    add-long/2addr v0, v6

    iput-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_29

    .line 440
    :cond_3f
    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-eqz v0, :cond_60

    int-to-double v0, p1

    iget-object v2, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    array-length v2, v2

    int-to-double v2, v2

    const-wide/high16 v4, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v2, v4

    cmpg-double v0, v0, v2

    if-gez v0, :cond_60

    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/NativeArray;->ensureCapacity(I)Z

    move-result v0

    if-eqz v0, :cond_60

    .line 443
    iget-object v0, p0, Lorg/mozilla/javascript/NativeArray;->dense:[Ljava/lang/Object;

    aput-object p3, v0, p1

    .line 444
    int-to-long v0, p1

    add-long/2addr v0, v6

    iput-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_29

    .line 447
    :cond_60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 450
    :cond_63
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/IdScriptableObject;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 451
    if-ne p2, p0, :cond_29

    iget v0, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_29

    .line 453
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    int-to-long v2, p1

    cmp-long v0, v0, v2

    if-gtz v0, :cond_29

    .line 455
    int-to-long v0, p1

    add-long/2addr v0, v6

    iput-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    goto :goto_29
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 8
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 399
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/IdScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 400
    if-ne p2, p0, :cond_17

    .line 402
    invoke-static {p1}, Lorg/mozilla/javascript/NativeArray;->toArrayIndex(Ljava/lang/String;)J

    move-result-wide v0

    .line 403
    .local v0, "index":J
    iget-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_17

    .line 404
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 405
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 408
    .end local v0    # "index":J
    :cond_17
    return-void
.end method

.method public remove(I)Ljava/lang/Object;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1936
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1904
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 1912
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3
    .param p1, "c"    # Ljava/util/Collection;

    .prologue
    .line 1916
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 1932
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method setDenseOnly(Z)V
    .registers 3
    .param p1, "denseOnly"    # Z

    .prologue
    .line 639
    if-eqz p1, :cond_c

    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    if-nez v0, :cond_c

    .line 640
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 641
    :cond_c
    iput-boolean p1, p0, Lorg/mozilla/javascript/NativeArray;->denseOnly:Z

    .line 642
    return-void
.end method

.method protected setInstanceIdAttributes(II)V
    .registers 4
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .prologue
    .line 97
    const/4 v0, 0x1

    if-ne p1, v0, :cond_5

    .line 98
    iput p2, p0, Lorg/mozilla/javascript/NativeArray;->lengthAttr:I

    .line 100
    :cond_5
    return-void
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .registers 4
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 130
    const/4 v0, 0x1

    if-ne p1, v0, :cond_7

    .line 131
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/NativeArray;->setLength(Ljava/lang/Object;)V

    .line 134
    :goto_6
    return-void

    .line 133
    :cond_7
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    goto :goto_6
.end method

.method public size()I
    .registers 5

    .prologue
    .line 1758
    iget-wide v0, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1759
    .local v0, "longLen":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_f

    .line 1760
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 1762
    :cond_f
    long-to-int v2, v0

    return v2
.end method

.method public subList(II)Ljava/util/List;
    .registers 4
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .prologue
    .line 1940
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 1731
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeArray;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 9
    .param p1, "a"    # [Ljava/lang/Object;

    .prologue
    .line 1735
    iget-wide v3, p0, Lorg/mozilla/javascript/NativeArray;->length:J

    .line 1736
    .local v3, "longLen":J
    const-wide/32 v5, 0x7fffffff

    cmp-long v5, v3, v5

    if-lez v5, :cond_f

    .line 1737
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 1739
    :cond_f
    long-to-int v2, v3

    .line 1740
    .local v2, "len":I
    array-length v5, p1

    if-lt v5, v2, :cond_20

    move-object v0, p1

    .line 1743
    .local v0, "array":[Ljava/lang/Object;
    :goto_14
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_15
    if-ge v1, v2, :cond_32

    .line 1744
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/NativeArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v0, v1

    .line 1743
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    .line 1740
    .end local v0    # "array":[Ljava/lang/Object;
    .end local v1    # "i":I
    :cond_20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    move-object v0, v5

    goto :goto_14

    .line 1746
    .restart local v0    # "array":[Ljava/lang/Object;
    .restart local v1    # "i":I
    :cond_32
    return-object v0
.end method
