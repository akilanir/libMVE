.class public final Lorg/mozilla/javascript/NativeGenerator;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "NativeGenerator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;,
        Lorg/mozilla/javascript/NativeGenerator$CloseGeneratorAction;
    }
.end annotation


# static fields
.field public static final GENERATOR_CLOSE:I = 0x2

.field public static final GENERATOR_SEND:I = 0x0

.field private static final GENERATOR_TAG:Ljava/lang/Object;

.field public static final GENERATOR_THROW:I = 0x1

.field private static final Id___iterator__:I = 0x5

.field private static final Id_close:I = 0x1

.field private static final Id_next:I = 0x2

.field private static final Id_send:I = 0x3

.field private static final Id_throw:I = 0x4

.field private static final MAX_PROTOTYPE_ID:I = 0x5

.field private static final serialVersionUID:J = 0x16d762746ec522c9L


# instance fields
.field private firstTime:Z

.field private function:Lorg/mozilla/javascript/NativeFunction;

.field private lineNumber:I

.field private lineSource:Ljava/lang/String;

.field private locked:Z

.field private savedState:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    const-string v0, "Generator"

    sput-object v0, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 241
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/NativeGenerator;->firstTime:Z

    .line 49
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/NativeFunction;Ljava/lang/Object;)V
    .registers 7
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "function"    # Lorg/mozilla/javascript/NativeFunction;
    .param p3, "savedState"    # Ljava/lang/Object;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 241
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/mozilla/javascript/NativeGenerator;->firstTime:Z

    .line 54
    iput-object p2, p0, Lorg/mozilla/javascript/NativeGenerator;->function:Lorg/mozilla/javascript/NativeFunction;

    .line 55
    iput-object p3, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 59
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 60
    .local v1, "top":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/NativeGenerator;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 61
    sget-object v2, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getTopScopeValue(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/NativeGenerator;

    .line 63
    .local v0, "prototype":Lorg/mozilla/javascript/NativeGenerator;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/NativeGenerator;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lorg/mozilla/javascript/NativeGenerator;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p0, "x0"    # Lorg/mozilla/javascript/NativeGenerator;
    .param p1, "x1"    # Lorg/mozilla/javascript/Context;
    .param p2, "x2"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "x3"    # I
    .param p4, "x4"    # Ljava/lang/Object;

    .prologue
    .line 15
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static init(Lorg/mozilla/javascript/ScriptableObject;Z)Lorg/mozilla/javascript/NativeGenerator;
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/ScriptableObject;
    .param p1, "sealed"    # Z

    .prologue
    .line 25
    new-instance v0, Lorg/mozilla/javascript/NativeGenerator;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeGenerator;-><init>()V

    .line 26
    .local v0, "prototype":Lorg/mozilla/javascript/NativeGenerator;
    if-eqz p0, :cond_11

    .line 27
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeGenerator;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 28
    invoke-static {p0}, Lorg/mozilla/javascript/NativeGenerator;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeGenerator;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 30
    :cond_11
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/NativeGenerator;->activatePrototypeMap(I)V

    .line 31
    if-eqz p1, :cond_1a

    .line 32
    invoke-virtual {v0}, Lorg/mozilla/javascript/NativeGenerator;->sealObject()V

    .line 39
    :cond_1a
    if-eqz p0, :cond_21

    .line 40
    sget-object v1, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v1, v0}, Lorg/mozilla/javascript/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    :cond_21
    return-object v0
.end method

.method private resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;
    .registers 15
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "operation"    # I
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x2

    .line 161
    iget-object v0, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    if-nez v0, :cond_1e

    .line 162
    if-ne p3, v8, :cond_c

    .line 163
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 198
    :cond_b
    :goto_b
    return-object v0

    .line 165
    :cond_c
    if-ne p3, v1, :cond_19

    .line 166
    move-object v7, p4

    .line 170
    .local v7, "thrown":Ljava/lang/Object;
    :goto_f
    new-instance v0, Lorg/mozilla/javascript/JavaScriptException;

    iget-object v1, p0, Lorg/mozilla/javascript/NativeGenerator;->lineSource:Ljava/lang/String;

    iget v2, p0, Lorg/mozilla/javascript/NativeGenerator;->lineNumber:I

    invoke-direct {v0, v7, v1, v2}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v0

    .line 168
    .end local v7    # "thrown":Ljava/lang/Object;
    :cond_19
    invoke-static {p2}, Lorg/mozilla/javascript/NativeIterator;->getStopIterationObject(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    .restart local v7    # "thrown":Ljava/lang/Object;
    goto :goto_f

    .line 173
    .end local v7    # "thrown":Ljava/lang/Object;
    :cond_1e
    :try_start_1e
    monitor-enter p0
    :try_end_1f
    .catch Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException; {:try_start_1e .. :try_end_1f} :catch_2d
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_1e .. :try_end_1f} :catch_5a
    .catchall {:try_start_1e .. :try_end_1f} :catchall_6b

    .line 177
    :try_start_1f
    iget-boolean v0, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    if-eqz v0, :cond_3a

    .line 178
    const-string v0, "msg.already.exec.gen"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 180
    :catchall_2a
    move-exception v0

    monitor-exit p0
    :try_end_2c
    .catchall {:try_start_1f .. :try_end_2c} :catchall_2a

    :try_start_2c
    throw v0
    :try_end_2d
    .catch Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException; {:try_start_2c .. :try_end_2d} :catch_2d
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_2c .. :try_end_2d} :catch_5a
    .catchall {:try_start_2c .. :try_end_2d} :catchall_6b

    .line 183
    :catch_2d
    move-exception v6

    .line 187
    .local v6, "e":Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;
    :try_start_2e
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;
    :try_end_30
    .catchall {:try_start_2e .. :try_end_30} :catchall_6b

    .line 194
    monitor-enter p0

    .line 195
    const/4 v1, 0x0

    :try_start_32
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    .line 196
    monitor-exit p0
    :try_end_35
    .catchall {:try_start_32 .. :try_end_35} :catchall_57

    .line 197
    if-ne p3, v8, :cond_b

    .line 198
    iput-object v9, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    goto :goto_b

    .line 179
    .end local v6    # "e":Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;
    :cond_3a
    const/4 v0, 0x1

    :try_start_3b
    iput-boolean v0, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    .line 180
    monitor-exit p0
    :try_end_3e
    .catchall {:try_start_3b .. :try_end_3e} :catchall_2a

    .line 181
    :try_start_3e
    iget-object v0, p0, Lorg/mozilla/javascript/NativeGenerator;->function:Lorg/mozilla/javascript/NativeFunction;

    iget-object v4, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/NativeFunction;->resumeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_49
    .catch Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException; {:try_start_3e .. :try_end_49} :catch_2d
    .catch Lorg/mozilla/javascript/RhinoException; {:try_start_3e .. :try_end_49} :catch_5a
    .catchall {:try_start_3e .. :try_end_49} :catchall_6b

    move-result-object v0

    .line 194
    monitor-enter p0

    .line 195
    const/4 v1, 0x0

    :try_start_4c
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    .line 196
    monitor-exit p0
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_54

    .line 197
    if-ne p3, v8, :cond_b

    .line 198
    iput-object v9, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    goto :goto_b

    .line 196
    :catchall_54
    move-exception v0

    :try_start_55
    monitor-exit p0
    :try_end_56
    .catchall {:try_start_55 .. :try_end_56} :catchall_54

    throw v0

    .restart local v6    # "e":Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;
    :catchall_57
    move-exception v0

    :try_start_58
    monitor-exit p0
    :try_end_59
    .catchall {:try_start_58 .. :try_end_59} :catchall_57

    throw v0

    .line 188
    .end local v6    # "e":Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;
    :catch_5a
    move-exception v6

    .line 189
    .local v6, "e":Lorg/mozilla/javascript/RhinoException;
    :try_start_5b
    invoke-virtual {v6}, Lorg/mozilla/javascript/RhinoException;->lineNumber()I

    move-result v0

    iput v0, p0, Lorg/mozilla/javascript/NativeGenerator;->lineNumber:I

    .line 190
    invoke-virtual {v6}, Lorg/mozilla/javascript/RhinoException;->lineSource()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/NativeGenerator;->lineSource:Ljava/lang/String;

    .line 191
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    .line 192
    throw v6
    :try_end_6b
    .catchall {:try_start_5b .. :try_end_6b} :catchall_6b

    .line 194
    .end local v6    # "e":Lorg/mozilla/javascript/RhinoException;
    :catchall_6b
    move-exception v0

    monitor-enter p0

    .line 195
    const/4 v1, 0x0

    :try_start_6e
    iput-boolean v1, p0, Lorg/mozilla/javascript/NativeGenerator;->locked:Z

    .line 196
    monitor-exit p0
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_76

    .line 197
    if-ne p3, v8, :cond_75

    .line 198
    iput-object v9, p0, Lorg/mozilla/javascript/NativeGenerator;->savedState:Ljava/lang/Object;

    :cond_75
    throw v0

    .line 196
    :catchall_76
    move-exception v0

    :try_start_77
    monitor-exit p0
    :try_end_78
    .catchall {:try_start_77 .. :try_end_78} :catchall_76

    throw v0
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 115
    sget-object v3, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    .line 116
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    .line 151
    .end local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :goto_d
    :pswitch_d
    return-object p4

    .line 118
    .restart local p4    # "thisObj":Lorg/mozilla/javascript/Scriptable;
    :cond_e
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v2

    .line 120
    .local v2, "id":I
    instance-of v3, p4, Lorg/mozilla/javascript/NativeGenerator;

    if-nez v3, :cond_1b

    .line 121
    invoke-static {p1}, Lorg/mozilla/javascript/NativeGenerator;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    :cond_1b
    move-object v1, p4

    .line 123
    check-cast v1, Lorg/mozilla/javascript/NativeGenerator;

    .line 125
    .local v1, "generator":Lorg/mozilla/javascript/NativeGenerator;
    packed-switch v2, :pswitch_data_6e

    .line 154
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 129
    :pswitch_2b
    const/4 v3, 0x2

    new-instance v4, Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;

    invoke-direct {v4}, Lorg/mozilla/javascript/NativeGenerator$GeneratorClosedException;-><init>()V

    invoke-direct {v1, p2, p3, v3, v4}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_d

    .line 134
    :pswitch_36
    iput-boolean v5, v1, Lorg/mozilla/javascript/NativeGenerator;->firstTime:Z

    .line 135
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    invoke-direct {v1, p2, p3, v5, v3}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_d

    .line 139
    :pswitch_3f
    array-length v3, p5

    if-lez v3, :cond_57

    aget-object v0, p5, v5

    .line 140
    .local v0, "arg":Ljava/lang/Object;
    :goto_44
    iget-boolean v3, v1, Lorg/mozilla/javascript/NativeGenerator;->firstTime:Z

    if-eqz v3, :cond_5a

    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5a

    .line 141
    const-string v3, "msg.send.newborn"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 139
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_57
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_44

    .line 143
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_5a
    invoke-direct {v1, p2, p3, v5, v0}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_d

    .line 147
    .end local v0    # "arg":Ljava/lang/Object;
    :pswitch_5f
    const/4 v4, 0x1

    array-length v3, p5

    if-lez v3, :cond_6a

    aget-object v3, p5, v5

    :goto_65
    invoke-direct {v1, p2, p3, v4, v3}, Lorg/mozilla/javascript/NativeGenerator;->resume(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    goto :goto_d

    :cond_6a
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_65

    .line 125
    nop

    :pswitch_data_6e
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_36
        :pswitch_3f
        :pswitch_5f
        :pswitch_d
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 8
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 208
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 209
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 210
    .local v3, "s_length":I
    const/4 v4, 0x4

    if-ne v3, v4, :cond_29

    .line 211
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 212
    .local v1, "c":I
    const/16 v4, 0x6e

    if-ne v1, v4, :cond_21

    const-string v0, "next"

    const/4 v2, 0x2

    .line 221
    .end local v1    # "c":I
    :cond_15
    :goto_15
    if-eqz v0, :cond_20

    if-eq v0, p1, :cond_20

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_20

    const/4 v2, 0x0

    .line 225
    :cond_20
    return v2

    .line 213
    .restart local v1    # "c":I
    :cond_21
    const/16 v4, 0x73

    if-ne v1, v4, :cond_15

    const-string v0, "send"

    const/4 v2, 0x3

    goto :goto_15

    .line 215
    .end local v1    # "c":I
    :cond_29
    const/4 v4, 0x5

    if-ne v3, v4, :cond_40

    .line 216
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 217
    .restart local v1    # "c":I
    const/16 v4, 0x63

    if-ne v1, v4, :cond_38

    const-string v0, "close"

    const/4 v2, 0x1

    goto :goto_15

    .line 218
    :cond_38
    const/16 v4, 0x74

    if-ne v1, v4, :cond_15

    const-string v0, "throw"

    const/4 v2, 0x4

    goto :goto_15

    .line 220
    .end local v1    # "c":I
    :cond_40
    const/16 v4, 0xc

    if-ne v3, v4, :cond_15

    const-string v0, "__iterator__"

    const/4 v2, 0x5

    goto :goto_15
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 72
    const-string v0, "Generator"

    return-object v0
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 100
    packed-switch p1, :pswitch_data_26

    .line 106
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 101
    :pswitch_d
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "close"

    .line 108
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/NativeGenerator;->GENERATOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/NativeGenerator;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 109
    return-void

    .line 102
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "next"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 103
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "send"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 104
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "throw"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 105
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "__iterator__"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 100
    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
        :pswitch_1e
        :pswitch_22
    .end packed-switch
.end method
