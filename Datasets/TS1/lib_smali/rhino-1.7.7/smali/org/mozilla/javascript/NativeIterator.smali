.class public final Lorg/mozilla/javascript/NativeIterator;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeIterator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/NativeIterator$WrappedJavaIterator;,
        Lorg/mozilla/javascript/NativeIterator$StopIteration;
    }
.end annotation


# static fields
.field public static final ITERATOR_PROPERTY_NAME:Ljava/lang/String; = "__iterator__"

.field private static final ITERATOR_TAG:Ljava/lang/Object;

.field private static final Id___iterator__:I = 0x3

.field private static final Id_constructor:I = 0x1

.field private static final Id_next:I = 0x2

.field private static final MAX_PROTOTYPE_ID:I = 0x3

.field private static final STOP_ITERATION:Ljava/lang/String; = "StopIteration"

.field private static final serialVersionUID:J = -0x396976a99d923961L


# instance fields
.field private objectIterator:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const-string v0, "Iterator"

    sput-object v0, Lorg/mozilla/javascript/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 46
    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .param p1, "objectIterator"    # Ljava/lang/Object;

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/mozilla/javascript/NativeIterator;->objectIterator:Ljava/lang/Object;

    .line 50
    return-void
.end method

.method public static getStopIterationObject(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 3
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 61
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 62
    .local v0, "top":Lorg/mozilla/javascript/Scriptable;
    sget-object v1, Lorg/mozilla/javascript/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getTopScopeValue(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method static init(Lorg/mozilla/javascript/ScriptableObject;Z)V
    .registers 6
    .param p0, "scope"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p1, "sealed"    # Z

    .prologue
    .line 23
    new-instance v0, Lorg/mozilla/javascript/NativeIterator;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeIterator;-><init>()V

    .line 24
    .local v0, "iterator":Lorg/mozilla/javascript/NativeIterator;
    const/4 v2, 0x3

    invoke-virtual {v0, v2, p0, p1}, Lorg/mozilla/javascript/NativeIterator;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 27
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeGenerator;->init(Lorg/mozilla/javascript/ScriptableObject;Z)Lorg/mozilla/javascript/NativeGenerator;

    .line 30
    new-instance v1, Lorg/mozilla/javascript/NativeIterator$StopIteration;

    invoke-direct {v1}, Lorg/mozilla/javascript/NativeIterator$StopIteration;-><init>()V

    .line 31
    .local v1, "obj":Lorg/mozilla/javascript/NativeObject;
    invoke-static {p0}, Lorg/mozilla/javascript/NativeIterator;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/NativeObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 32
    invoke-virtual {v1, p0}, Lorg/mozilla/javascript/NativeObject;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 33
    if-eqz p1, :cond_20

    invoke-virtual {v1}, Lorg/mozilla/javascript/NativeObject;->sealObject()V

    .line 34
    :cond_20
    const-string v2, "StopIteration"

    const/4 v3, 0x2

    invoke-static {p0, v2, v1, v3}, Lorg/mozilla/javascript/ScriptableObject;->defineProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;I)V

    .line 39
    sget-object v2, Lorg/mozilla/javascript/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, v1}, Lorg/mozilla/javascript/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    return-void
.end method

.method private static jsConstructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    .line 139
    array-length v7, p3

    if-eqz v7, :cond_f

    aget-object v7, p3, v3

    if-eqz v7, :cond_f

    aget-object v7, p3, v3

    sget-object v9, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v7, v9, :cond_22

    .line 142
    :cond_f
    array-length v7, p3

    if-nez v7, :cond_1f

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 143
    .local v0, "argument":Ljava/lang/Object;
    :goto_14
    const-string v7, "msg.no.properties"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v7

    throw v7

    .line 142
    .end local v0    # "argument":Ljava/lang/Object;
    :cond_1f
    aget-object v0, p3, v3

    goto :goto_14

    .line 146
    :cond_22
    aget-object v7, p3, v3

    invoke-static {p0, p1, v7}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 147
    .local v4, "obj":Lorg/mozilla/javascript/Scriptable;
    array-length v7, p3

    if-le v7, v8, :cond_34

    aget-object v7, p3, v8

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_34

    move v3, v8

    .line 148
    .local v3, "keyOnly":Z
    :cond_34
    if-eqz p2, :cond_58

    .line 154
    sget-object v7, Lorg/mozilla/javascript/VMBridge;->instance:Lorg/mozilla/javascript/VMBridge;

    invoke-virtual {v7, p0, p1, v4}, Lorg/mozilla/javascript/VMBridge;->getJavaIterator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v1

    .line 156
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    if-eqz v1, :cond_52

    .line 157
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    .line 158
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v7

    new-instance v8, Lorg/mozilla/javascript/NativeIterator$WrappedJavaIterator;

    invoke-direct {v8, v1, p1}, Lorg/mozilla/javascript/NativeIterator$WrappedJavaIterator;-><init>(Ljava/util/Iterator;Lorg/mozilla/javascript/Scriptable;)V

    const-class v9, Lorg/mozilla/javascript/NativeIterator$WrappedJavaIterator;

    invoke-virtual {v7, p0, p1, v8, v9}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 181
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_51
    :goto_51
    return-object v2

    .line 164
    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_52
    invoke-static {p0, p1, v4, v3}, Lorg/mozilla/javascript/ScriptRuntime;->toIterator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 166
    .local v2, "jsIterator":Lorg/mozilla/javascript/Scriptable;
    if-nez v2, :cond_51

    .line 173
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v2    # "jsIterator":Lorg/mozilla/javascript/Scriptable;
    :cond_58
    if-eqz v3, :cond_77

    const/4 v7, 0x3

    :goto_5b
    invoke-static {v4, p0, p1, v7}, Lorg/mozilla/javascript/ScriptRuntime;->enumInit(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v5

    .line 176
    .local v5, "objectIterator":Ljava/lang/Object;
    invoke-static {v5, v8}, Lorg/mozilla/javascript/ScriptRuntime;->setEnumNumbers(Ljava/lang/Object;Z)V

    .line 177
    new-instance v6, Lorg/mozilla/javascript/NativeIterator;

    invoke-direct {v6, v5}, Lorg/mozilla/javascript/NativeIterator;-><init>(Ljava/lang/Object;)V

    .line 178
    .local v6, "result":Lorg/mozilla/javascript/NativeIterator;
    invoke-virtual {v6}, Lorg/mozilla/javascript/NativeIterator;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, v7}, Lorg/mozilla/javascript/ScriptableObject;->getClassPrototype(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/mozilla/javascript/NativeIterator;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 180
    invoke-virtual {v6, p1}, Lorg/mozilla/javascript/NativeIterator;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    move-object v2, v6

    .line 181
    goto :goto_51

    .line 173
    .end local v5    # "objectIterator":Ljava/lang/Object;
    .end local v6    # "result":Lorg/mozilla/javascript/NativeIterator;
    :cond_77
    const/4 v7, 0x5

    goto :goto_5b
.end method

.method private next(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 185
    iget-object v1, p0, Lorg/mozilla/javascript/NativeIterator;->objectIterator:Ljava/lang/Object;

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->enumNext(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    .line 186
    .local v0, "b":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_18

    .line 188
    new-instance v1, Lorg/mozilla/javascript/JavaScriptException;

    invoke-static {p2}, Lorg/mozilla/javascript/NativeIterator;->getStopIterationObject(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v1

    .line 191
    :cond_18
    iget-object v1, p0, Lorg/mozilla/javascript/NativeIterator;->objectIterator:Ljava/lang/Object;

    invoke-static {v1, p1}, Lorg/mozilla/javascript/ScriptRuntime;->enumId(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 107
    sget-object v2, Lorg/mozilla/javascript/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 108
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    .line 128
    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :goto_c
    :pswitch_c
    return-object p4

    .line 110
    .restart local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :cond_d
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    .line 112
    .local v0, "id":I
    const/4 v2, 0x1

    if-ne v0, v2, :cond_19

    .line 113
    invoke-static {p2, p3, p4, p5}, Lorg/mozilla/javascript/NativeIterator;->jsConstructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_c

    .line 116
    :cond_19
    instance-of v2, p4, Lorg/mozilla/javascript/NativeIterator;

    if-nez v2, :cond_22

    .line 117
    invoke-static {p1}, Lorg/mozilla/javascript/NativeIterator;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v2

    throw v2

    :cond_22
    move-object v1, p4

    .line 119
    check-cast v1, Lorg/mozilla/javascript/NativeIterator;

    .line 121
    .local v1, "iterator":Lorg/mozilla/javascript/NativeIterator;
    packed-switch v0, :pswitch_data_38

    .line 131
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 124
    :pswitch_32
    invoke-direct {v1, p2, p3}, Lorg/mozilla/javascript/NativeIterator;->next(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_c

    .line 121
    nop

    :pswitch_data_38
    .packed-switch 0x2
        :pswitch_32
        :pswitch_c
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 224
    const/4 v1, 0x0

    .local v1, "id":I
    const/4 v0, 0x0

    .line 225
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 226
    .local v2, "s_length":I
    const/4 v3, 0x4

    if-ne v2, v3, :cond_18

    const-string v0, "next"

    const/4 v1, 0x2

    .line 229
    :cond_c
    :goto_c
    if-eqz v0, :cond_17

    if-eq v0, p1, :cond_17

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    const/4 v1, 0x0

    .line 233
    :cond_17
    return v1

    .line 227
    :cond_18
    const/16 v3, 0xb

    if-ne v2, v3, :cond_20

    const-string v0, "constructor"

    const/4 v1, 0x1

    goto :goto_c

    .line 228
    :cond_20
    const/16 v3, 0xc

    if-ne v2, v3, :cond_c

    const-string v0, "__iterator__"

    const/4 v1, 0x3

    goto :goto_c
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    const-string v0, "Iterator"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 94
    packed-switch p1, :pswitch_data_1e

    .line 98
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 95
    :pswitch_d
    const/4 v0, 0x2

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 100
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/NativeIterator;->ITERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeIterator;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 101
    return-void

    .line 96
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "next"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 97
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "__iterator__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 94
    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
    .end packed-switch
.end method
