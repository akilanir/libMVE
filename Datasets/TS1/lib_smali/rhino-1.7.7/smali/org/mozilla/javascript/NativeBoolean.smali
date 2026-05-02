.class final Lorg/mozilla/javascript/NativeBoolean;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeBoolean.java"


# static fields
.field private static final BOOLEAN_TAG:Ljava/lang/Object;

.field private static final Id_constructor:I = 0x1

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final Id_valueOf:I = 0x4

.field private static final MAX_PROTOTYPE_ID:I = 0x4

.field static final serialVersionUID:J = -0x33956cfcac6218e5L


# instance fields
.field private booleanValue:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    const-string v0, "Boolean"

    sput-object v0, Lorg/mozilla/javascript/NativeBoolean;->BOOLEAN_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 28
    iput-boolean p1, p0, Lorg/mozilla/javascript/NativeBoolean;->booleanValue:Z

    .line 29
    return-void
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 22
    new-instance v0, Lorg/mozilla/javascript/NativeBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/NativeBoolean;-><init>(Z)V

    .line 23
    .local v0, "obj":Lorg/mozilla/javascript/NativeBoolean;
    const/4 v1, 0x4

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeBoolean;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 24
    return-void
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 65
    sget-object v3, Lorg/mozilla/javascript/NativeBoolean;->BOOLEAN_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 66
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 103
    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :goto_e
    return-object v3

    .line 68
    .restart local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :cond_f
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v1

    .line 70
    .local v1, "id":I
    if-ne v1, v0, :cond_3e

    .line 72
    array-length v3, p5

    if-nez v3, :cond_21

    .line 73
    const/4 v0, 0x0

    .line 80
    .local v0, "b":Z
    :goto_19
    if-nez p4, :cond_39

    .line 82
    new-instance v3, Lorg/mozilla/javascript/NativeBoolean;

    invoke-direct {v3, v0}, Lorg/mozilla/javascript/NativeBoolean;-><init>(Z)V

    goto :goto_e

    .line 75
    .end local v0    # "b":Z
    :cond_21
    aget-object v3, p5, v4

    instance-of v3, v3, Lorg/mozilla/javascript/ScriptableObject;

    if-eqz v3, :cond_32

    aget-object v3, p5, v4

    check-cast v3, Lorg/mozilla/javascript/ScriptableObject;

    invoke-virtual {v3}, Lorg/mozilla/javascript/ScriptableObject;->avoidObjectDetection()Z

    move-result v3

    if-eqz v3, :cond_32

    .restart local v0    # "b":Z
    :goto_31
    goto :goto_19

    .end local v0    # "b":Z
    :cond_32
    aget-object v3, p5, v4

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_31

    .line 85
    .restart local v0    # "b":Z
    :cond_39
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_e

    .line 90
    .end local v0    # "b":Z
    :cond_3e
    instance-of v3, p4, Lorg/mozilla/javascript/NativeBoolean;

    if-nez v3, :cond_47

    .line 91
    invoke-static {p1}, Lorg/mozilla/javascript/NativeBoolean;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 92
    :cond_47
    check-cast p4, Lorg/mozilla/javascript/NativeBoolean;

    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    iget-boolean v2, p4, Lorg/mozilla/javascript/NativeBoolean;->booleanValue:Z

    .line 94
    .local v2, "value":Z
    packed-switch v1, :pswitch_data_6e

    .line 105
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 97
    :pswitch_58
    if-eqz v2, :cond_5d

    const-string v3, "true"

    goto :goto_e

    :cond_5d
    const-string v3, "false"

    goto :goto_e

    .line 100
    :pswitch_60
    if-eqz v2, :cond_65

    const-string v3, "(new Boolean(true))"

    goto :goto_e

    :cond_65
    const-string v3, "(new Boolean(false))"

    goto :goto_e

    .line 103
    :pswitch_68
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_e

    .line 94
    nop

    :pswitch_data_6e
    .packed-switch 0x2
        :pswitch_58
        :pswitch_60
        :pswitch_68
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 115
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 116
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 117
    .local v3, "s_length":I
    const/4 v4, 0x7

    if-ne v3, v4, :cond_18

    const-string v0, "valueOf"

    const/4 v2, 0x4

    .line 124
    :cond_c
    :goto_c
    if-eqz v0, :cond_17

    if-eq v0, p1, :cond_17

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_17

    const/4 v2, 0x0

    .line 128
    :cond_17
    return v2

    .line 118
    :cond_18
    const/16 v4, 0x8

    if-ne v3, v4, :cond_31

    .line 119
    const/4 v4, 0x3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 120
    .local v1, "c":I
    const/16 v4, 0x6f

    if-ne v1, v4, :cond_29

    const-string v0, "toSource"

    const/4 v2, 0x3

    goto :goto_c

    .line 121
    :cond_29
    const/16 v4, 0x74

    if-ne v1, v4, :cond_c

    const-string v0, "toString"

    const/4 v2, 0x2

    goto :goto_c

    .line 123
    .end local v1    # "c":I
    :cond_31
    const/16 v4, 0xb

    if-ne v3, v4, :cond_c

    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_c
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 34
    const-string v0, "Boolean"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, "typeHint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v0, :cond_b

    .line 42
    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeBoolean;->booleanValue:Z

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 43
    :goto_a
    return-object v0

    :cond_b
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_a
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 51
    packed-switch p1, :pswitch_data_22

    .line 56
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 52
    :pswitch_d
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 58
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/NativeBoolean;->BOOLEAN_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeBoolean;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 59
    return-void

    .line 53
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 54
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 55
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "valueOf"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 51
    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
        :pswitch_1e
    .end packed-switch
.end method
