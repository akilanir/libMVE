.class public Lorg/mozilla/javascript/NativeCallSite;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeCallSite.java"


# static fields
.field private static final CALLSITE_TAG:Ljava/lang/String; = "CallSite"

.field private static final Id_constructor:I = 0x1

.field private static final Id_getColumnNumber:I = 0x9

.field private static final Id_getEvalOrigin:I = 0xa

.field private static final Id_getFileName:I = 0x7

.field private static final Id_getFunction:I = 0x4

.field private static final Id_getFunctionName:I = 0x5

.field private static final Id_getLineNumber:I = 0x8

.field private static final Id_getMethodName:I = 0x6

.field private static final Id_getThis:I = 0x2

.field private static final Id_getTypeName:I = 0x3

.field private static final Id_isConstructor:I = 0xe

.field private static final Id_isEval:I = 0xc

.field private static final Id_isNative:I = 0xd

.field private static final Id_isToplevel:I = 0xb

.field private static final Id_toString:I = 0xf

.field private static final MAX_PROTOTYPE_ID:I = 0xf


# instance fields
.field private element:Lorg/mozilla/javascript/ScriptStackElement;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 37
    return-void
.end method

.method private getFalse()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 146
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0
.end method

.method private getFileName(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 4
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 163
    :goto_0
    if-eqz p1, :cond_b

    instance-of v1, p1, Lorg/mozilla/javascript/NativeCallSite;

    if-nez v1, :cond_b

    .line 164
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 166
    :cond_b
    if-nez p1, :cond_10

    .line 167
    sget-object v1, Lorg/mozilla/javascript/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    .line 170
    :goto_f
    return-object v1

    :cond_10
    move-object v0, p1

    .line 169
    check-cast v0, Lorg/mozilla/javascript/NativeCallSite;

    .line 170
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    if-nez v1, :cond_19

    const/4 v1, 0x0

    goto :goto_f

    :cond_19
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    iget-object v1, v1, Lorg/mozilla/javascript/ScriptStackElement;->fileName:Ljava/lang/String;

    goto :goto_f
.end method

.method private getFunctionName(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 4
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 151
    :goto_0
    if-eqz p1, :cond_b

    instance-of v1, p1, Lorg/mozilla/javascript/NativeCallSite;

    if-nez v1, :cond_b

    .line 152
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 154
    :cond_b
    if-nez p1, :cond_10

    .line 155
    sget-object v1, Lorg/mozilla/javascript/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    .line 158
    :goto_f
    return-object v1

    :cond_10
    move-object v0, p1

    .line 157
    check-cast v0, Lorg/mozilla/javascript/NativeCallSite;

    .line 158
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    if-nez v1, :cond_19

    const/4 v1, 0x0

    goto :goto_f

    :cond_19
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    iget-object v1, v1, Lorg/mozilla/javascript/ScriptStackElement;->functionName:Ljava/lang/String;

    goto :goto_f
.end method

.method private getLineNumber(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 4
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 175
    :goto_0
    if-eqz p1, :cond_b

    instance-of v1, p1, Lorg/mozilla/javascript/NativeCallSite;

    if-nez v1, :cond_b

    .line 176
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 178
    :cond_b
    if-nez p1, :cond_10

    .line 179
    sget-object v1, Lorg/mozilla/javascript/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    .line 185
    :goto_f
    return-object v1

    :cond_10
    move-object v0, p1

    .line 181
    check-cast v0, Lorg/mozilla/javascript/NativeCallSite;

    .line 182
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    if-eqz v1, :cond_1d

    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    iget v1, v1, Lorg/mozilla/javascript/ScriptStackElement;->lineNumber:I

    if-gez v1, :cond_20

    .line 183
    :cond_1d
    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_f

    .line 185
    :cond_20
    iget-object v1, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    iget v1, v1, Lorg/mozilla/javascript/ScriptStackElement;->lineNumber:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_f
.end method

.method private getNull()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 141
    const/4 v0, 0x0

    return-object v0
.end method

.method private getUndefined()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 136
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 22
    new-instance v0, Lorg/mozilla/javascript/NativeCallSite;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeCallSite;-><init>()V

    .line 23
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    const/16 v1, 0xf

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeCallSite;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 24
    return-void
.end method

.method private js_toString(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 5
    .param p1, "obj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 122
    :goto_0
    if-eqz p1, :cond_b

    instance-of v2, p1, Lorg/mozilla/javascript/NativeCallSite;

    if-nez v2, :cond_b

    .line 123
    invoke-interface {p1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object p1

    goto :goto_0

    .line 125
    :cond_b
    if-nez p1, :cond_10

    .line 126
    sget-object v2, Lorg/mozilla/javascript/NativeCallSite;->NOT_FOUND:Ljava/lang/Object;

    .line 131
    :goto_f
    return-object v2

    :cond_10
    move-object v0, p1

    .line 128
    check-cast v0, Lorg/mozilla/javascript/NativeCallSite;

    .line 129
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-object v2, v0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/ScriptStackElement;->renderJavaStyle(Ljava/lang/StringBuilder;)V

    .line 131
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_f
.end method

.method static make(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeCallSite;
    .registers 5
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "ctorObj"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 28
    new-instance v0, Lorg/mozilla/javascript/NativeCallSite;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeCallSite;-><init>()V

    .line 29
    .local v0, "cs":Lorg/mozilla/javascript/NativeCallSite;
    const-string v2, "prototype"

    invoke-interface {p1, v2, p1}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    move-object v1, v2

    check-cast v1, Lorg/mozilla/javascript/Scriptable;

    .line 30
    .local v1, "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeCallSite;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 31
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeCallSite;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 32
    return-object v0
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 80
    const-string v1, "CallSite"

    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 81
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 105
    :goto_c
    return-object v1

    .line 83
    :cond_d
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    .line 84
    .local v0, "id":I
    packed-switch v0, :pswitch_data_46

    .line 107
    :pswitch_14
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 86
    :pswitch_1e
    invoke-static {p3, p1}, Lorg/mozilla/javascript/NativeCallSite;->make(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeCallSite;

    move-result-object v1

    goto :goto_c

    .line 88
    :pswitch_23
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/NativeCallSite;->getFunctionName(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 90
    :pswitch_28
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/NativeCallSite;->getFileName(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 92
    :pswitch_2d
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/NativeCallSite;->getLineNumber(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 97
    :pswitch_32
    invoke-direct {p0}, Lorg/mozilla/javascript/NativeCallSite;->getUndefined()Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 99
    :pswitch_37
    invoke-direct {p0}, Lorg/mozilla/javascript/NativeCallSite;->getNull()Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 103
    :pswitch_3c
    invoke-direct {p0}, Lorg/mozilla/javascript/NativeCallSite;->getFalse()Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 105
    :pswitch_41
    invoke-direct {p0, p4}, Lorg/mozilla/javascript/NativeCallSite;->js_toString(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_c

    .line 84
    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_32
        :pswitch_32
        :pswitch_32
        :pswitch_23
        :pswitch_37
        :pswitch_28
        :pswitch_2d
        :pswitch_32
        :pswitch_3c
        :pswitch_14
        :pswitch_3c
        :pswitch_14
        :pswitch_3c
        :pswitch_41
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x3

    .line 195
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 196
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_84

    .line 221
    :cond_a
    :goto_a
    :pswitch_a
    if-eqz v0, :cond_15

    if-eq v0, p1, :cond_15

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    const/4 v2, 0x0

    .line 225
    :cond_15
    return v2

    .line 197
    :pswitch_16
    const-string v0, "isEval"

    const/16 v2, 0xc

    goto :goto_a

    .line 198
    :pswitch_1b
    const-string v0, "getThis"

    const/4 v2, 0x2

    goto :goto_a

    .line 199
    :pswitch_1f
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 200
    .local v1, "c":I
    const/16 v3, 0x69

    if-ne v1, v3, :cond_2d

    const-string v0, "isNative"

    const/16 v2, 0xd

    goto :goto_a

    .line 201
    :cond_2d
    const/16 v3, 0x74

    if-ne v1, v3, :cond_a

    const-string v0, "toString"

    const/16 v2, 0xf

    goto :goto_a

    .line 203
    .end local v1    # "c":I
    :pswitch_36
    const-string v0, "isToplevel"

    const/16 v2, 0xb

    goto :goto_a

    .line 204
    :pswitch_3b
    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_9c

    goto :goto_a

    .line 205
    :sswitch_44
    const-string v0, "getFileName"

    const/4 v2, 0x7

    goto :goto_a

    .line 206
    :sswitch_48
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_a

    .line 207
    :sswitch_4c
    const-string v0, "getFunction"

    const/4 v2, 0x4

    goto :goto_a

    .line 208
    :sswitch_50
    const-string v0, "getTypeName"

    const/4 v2, 0x3

    goto :goto_a

    .line 210
    :pswitch_54
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_ae

    goto :goto_a

    .line 211
    :sswitch_5c
    const-string v0, "getEvalOrigin"

    const/16 v2, 0xa

    goto :goto_a

    .line 212
    :sswitch_61
    const-string v0, "getLineNumber"

    const/16 v2, 0x8

    goto :goto_a

    .line 213
    :sswitch_66
    const-string v0, "getMethodName"

    const/4 v2, 0x6

    goto :goto_a

    .line 214
    :sswitch_6a
    const-string v0, "isConstructor"

    const/16 v2, 0xe

    goto :goto_a

    .line 216
    :pswitch_6f
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 217
    .restart local v1    # "c":I
    const/16 v3, 0x43

    if-ne v1, v3, :cond_7c

    const-string v0, "getColumnNumber"

    const/16 v2, 0x9

    goto :goto_a

    .line 218
    :cond_7c
    const/16 v3, 0x46

    if-ne v1, v3, :cond_a

    const-string v0, "getFunctionName"

    const/4 v2, 0x5

    goto :goto_a

    .line 196
    :pswitch_data_84
    .packed-switch 0x6
        :pswitch_16
        :pswitch_1b
        :pswitch_1f
        :pswitch_a
        :pswitch_36
        :pswitch_3b
        :pswitch_a
        :pswitch_54
        :pswitch_a
        :pswitch_6f
    .end packed-switch

    .line 204
    :sswitch_data_9c
    .sparse-switch
        0x69 -> :sswitch_44
        0x74 -> :sswitch_48
        0x75 -> :sswitch_4c
        0x79 -> :sswitch_50
    .end sparse-switch

    .line 210
    :sswitch_data_ae
    .sparse-switch
        0x45 -> :sswitch_5c
        0x4c -> :sswitch_61
        0x4d -> :sswitch_66
        0x6f -> :sswitch_6a
    .end sparse-switch
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 47
    const-string v0, "CallSite"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 55
    packed-switch p1, :pswitch_data_4e

    .line 71
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 56
    :pswitch_d
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 73
    .local v1, "s":Ljava/lang/String;
    :goto_10
    const-string v2, "CallSite"

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeCallSite;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 74
    return-void

    .line 57
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getThis"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 58
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getTypeName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 59
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFunction"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 60
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFunctionName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 61
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getMethodName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 62
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getFileName"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 63
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_2e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getLineNumber"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 64
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_32
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getColumnNumber"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 65
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_36
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "getEvalOrigin"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 66
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isToplevel"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 67
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_3e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isEval"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 68
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_42
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isNative"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 69
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_46
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "isConstructor"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 70
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_4a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 55
    :pswitch_data_4e
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
    .end packed-switch
.end method

.method setElement(Lorg/mozilla/javascript/ScriptStackElement;)V
    .registers 2
    .param p1, "elt"    # Lorg/mozilla/javascript/ScriptStackElement;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    .line 42
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    if-nez v0, :cond_7

    .line 115
    const-string v0, ""

    .line 117
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/mozilla/javascript/NativeCallSite;->element:Lorg/mozilla/javascript/ScriptStackElement;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ScriptStackElement;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
