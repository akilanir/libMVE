.class Lorg/mozilla/javascript/NativeScript;
.super Lorg/mozilla/javascript/BaseFunction;
.source "NativeScript.java"


# static fields
.field private static final Id_compile:I = 0x3

.field private static final Id_constructor:I = 0x1

.field private static final Id_exec:I = 0x4

.field private static final Id_toString:I = 0x2

.field private static final MAX_PROTOTYPE_ID:I = 0x4

.field private static final SCRIPT_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = -0x5e4d0c813cab5264L


# instance fields
.field private script:Lorg/mozilla/javascript/Script;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const-string v0, "Script"

    sput-object v0, Lorg/mozilla/javascript/NativeScript;->SCRIPT_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Lorg/mozilla/javascript/Script;)V
    .registers 2
    .param p1, "script"    # Lorg/mozilla/javascript/Script;

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/mozilla/javascript/NativeScript;->script:Lorg/mozilla/javascript/Script;

    .line 38
    return-void
.end method

.method private static compile(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/Script;
    .registers 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 151
    new-array v7, v0, [I

    aput v1, v7, v1

    .line 152
    .local v7, "linep":[I
    invoke-static {v7}, Lorg/mozilla/javascript/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v4

    .line 153
    .local v4, "filename":Ljava/lang/String;
    if-nez v4, :cond_11

    .line 154
    const-string v4, "<Script object>"

    .line 155
    aput v0, v7, v1

    .line 158
    :cond_11
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/DefaultErrorReporter;->forEval(Lorg/mozilla/javascript/ErrorReporter;)Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v3

    .line 159
    .local v3, "reporter":Lorg/mozilla/javascript/ErrorReporter;
    aget v5, v7, v1

    move-object v0, p0

    move-object v1, p1

    move-object v6, v2

    invoke-virtual/range {v0 .. v6}, Lorg/mozilla/javascript/Context;->compileString(Ljava/lang/String;Lorg/mozilla/javascript/Evaluator;Lorg/mozilla/javascript/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lorg/mozilla/javascript/Script;

    move-result-object v0

    return-object v0
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 31
    new-instance v0, Lorg/mozilla/javascript/NativeScript;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/NativeScript;-><init>(Lorg/mozilla/javascript/Script;)V

    .line 32
    .local v0, "obj":Lorg/mozilla/javascript/NativeScript;
    const/4 v1, 0x4

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/NativeScript;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 33
    return-void
.end method

.method private static realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeScript;
    .registers 3
    .param p0, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 144
    instance-of v0, p0, Lorg/mozilla/javascript/NativeScript;

    if-nez v0, :cond_9

    .line 145
    invoke-static {p1}, Lorg/mozilla/javascript/NativeScript;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 146
    :cond_9
    check-cast p0, Lorg/mozilla/javascript/NativeScript;

    .end local p0    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    return-object p0
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/mozilla/javascript/NativeScript;->script:Lorg/mozilla/javascript/Script;

    if-eqz v0, :cond_b

    .line 54
    iget-object v0, p0, Lorg/mozilla/javascript/NativeScript;->script:Lorg/mozilla/javascript/Script;

    invoke-interface {v0, p1, p2}, Lorg/mozilla/javascript/Script;->exec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v0

    .line 56
    :goto_a
    return-object v0

    :cond_b
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_a
.end method

.method public construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 62
    const-string v0, "msg.script.is.not.constructor"

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method decompile(II)Ljava/lang/String;
    .registers 4
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .prologue
    .line 80
    iget-object v0, p0, Lorg/mozilla/javascript/NativeScript;->script:Lorg/mozilla/javascript/Script;

    instance-of v0, v0, Lorg/mozilla/javascript/NativeFunction;

    if-eqz v0, :cond_f

    .line 81
    iget-object v0, p0, Lorg/mozilla/javascript/NativeScript;->script:Lorg/mozilla/javascript/Script;

    check-cast v0, Lorg/mozilla/javascript/NativeFunction;

    invoke-virtual {v0, p1, p2}, Lorg/mozilla/javascript/NativeFunction;->decompile(II)Ljava/lang/String;

    move-result-object v0

    .line 83
    :goto_e
    return-object v0

    :cond_f
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 105
    sget-object v6, Lorg/mozilla/javascript/NativeScript;->SCRIPT_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v6}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e

    .line 106
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/BaseFunction;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 136
    :goto_d
    return-object v1

    .line 108
    :cond_e
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    .line 109
    .local v0, "id":I
    packed-switch v0, :pswitch_data_62

    .line 139
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 111
    :pswitch_1f
    array-length v6, p5

    if-nez v6, :cond_31

    const-string v5, ""

    .line 114
    .local v5, "source":Ljava/lang/String;
    :goto_24
    invoke-static {p2, v5}, Lorg/mozilla/javascript/NativeScript;->compile(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/Script;

    move-result-object v4

    .line 115
    .local v4, "script":Lorg/mozilla/javascript/Script;
    new-instance v1, Lorg/mozilla/javascript/NativeScript;

    invoke-direct {v1, v4}, Lorg/mozilla/javascript/NativeScript;-><init>(Lorg/mozilla/javascript/Script;)V

    .line 116
    .local v1, "nscript":Lorg/mozilla/javascript/NativeScript;
    invoke-static {v1, p3}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_d

    .line 111
    .end local v1    # "nscript":Lorg/mozilla/javascript/NativeScript;
    .end local v4    # "script":Lorg/mozilla/javascript/Script;
    .end local v5    # "source":Ljava/lang/String;
    :cond_31
    aget-object v6, p5, v7

    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_24

    .line 121
    :pswitch_38
    invoke-static {p4, p1}, Lorg/mozilla/javascript/NativeScript;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeScript;

    move-result-object v2

    .line 122
    .local v2, "real":Lorg/mozilla/javascript/NativeScript;
    iget-object v3, v2, Lorg/mozilla/javascript/NativeScript;->script:Lorg/mozilla/javascript/Script;

    .line 123
    .local v3, "realScript":Lorg/mozilla/javascript/Script;
    if-nez v3, :cond_43

    const-string v1, ""

    goto :goto_d

    .line 124
    :cond_43
    invoke-virtual {p2, v3, v7}, Lorg/mozilla/javascript/Context;->decompileScript(Lorg/mozilla/javascript/Script;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_d

    .line 128
    .end local v2    # "real":Lorg/mozilla/javascript/NativeScript;
    .end local v3    # "realScript":Lorg/mozilla/javascript/Script;
    :pswitch_48
    const-string v6, "msg.cant.call.indirect"

    const-string v7, "exec"

    invoke-static {v6, v7}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v6

    throw v6

    .line 133
    :pswitch_51
    invoke-static {p4, p1}, Lorg/mozilla/javascript/NativeScript;->realThis(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/NativeScript;

    move-result-object v2

    .line 134
    .restart local v2    # "real":Lorg/mozilla/javascript/NativeScript;
    invoke-static {p5, v7}, Lorg/mozilla/javascript/ScriptRuntime;->toString([Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v5

    .line 135
    .restart local v5    # "source":Ljava/lang/String;
    invoke-static {p2, v5}, Lorg/mozilla/javascript/NativeScript;->compile(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/Script;

    move-result-object v6

    iput-object v6, v2, Lorg/mozilla/javascript/NativeScript;->script:Lorg/mozilla/javascript/Script;

    move-object v1, v2

    .line 136
    goto :goto_d

    .line 109
    nop

    :pswitch_data_62
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_38
        :pswitch_51
        :pswitch_48
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 170
    const/4 v1, 0x0

    .local v1, "id":I
    const/4 v0, 0x0

    .line 171
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    packed-switch v2, :pswitch_data_26

    .line 177
    :goto_9
    :pswitch_9
    if-eqz v0, :cond_14

    if-eq v0, p1, :cond_14

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    const/4 v1, 0x0

    .line 181
    :cond_14
    return v1

    .line 172
    :pswitch_15
    const-string v0, "exec"

    const/4 v1, 0x4

    goto :goto_9

    .line 173
    :pswitch_19
    const-string v0, "compile"

    const/4 v1, 0x3

    goto :goto_9

    .line 174
    :pswitch_1d
    const-string v0, "toString"

    const/4 v1, 0x2

    goto :goto_9

    .line 175
    :pswitch_21
    const-string v0, "constructor"

    const/4 v1, 0x1

    goto :goto_9

    .line 171
    nop

    :pswitch_data_26
    .packed-switch 0x4
        :pswitch_15
        :pswitch_9
        :pswitch_9
        :pswitch_19
        :pswitch_1d
        :pswitch_9
        :pswitch_9
        :pswitch_21
    .end packed-switch
.end method

.method public getArity()I
    .registers 2

    .prologue
    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    const-string v0, "Script"

    return-object v0
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 68
    const/4 v0, 0x0

    return v0
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 91
    packed-switch p1, :pswitch_data_22

    .line 96
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 92
    :pswitch_d
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 98
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/NativeScript;->SCRIPT_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeScript;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 99
    return-void

    .line 93
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 94
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "exec"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 95
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "compile"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 91
    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1e
        :pswitch_1a
    .end packed-switch
.end method
