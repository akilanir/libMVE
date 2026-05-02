.class public Lorg/mozilla/javascript/BaseFunction;
.super Lorg/mozilla/javascript/IdScriptableObject;
.source "BaseFunction.java"

# interfaces
.implements Lorg/mozilla/javascript/Function;


# static fields
.field private static final FUNCTION_TAG:Ljava/lang/Object;

.field private static final Id_apply:I = 0x4

.field private static final Id_arguments:I = 0x5

.field private static final Id_arity:I = 0x2

.field private static final Id_bind:I = 0x6

.field private static final Id_call:I = 0x5

.field private static final Id_constructor:I = 0x1

.field private static final Id_length:I = 0x1

.field private static final Id_name:I = 0x3

.field private static final Id_prototype:I = 0x4

.field private static final Id_toSource:I = 0x3

.field private static final Id_toString:I = 0x2

.field private static final MAX_INSTANCE_ID:I = 0x5

.field private static final MAX_PROTOTYPE_ID:I = 0x6

.field static final serialVersionUID:J = 0x49b5dd1bb05c2ae3L


# instance fields
.field private argumentsAttributes:I

.field private argumentsObj:Ljava/lang/Object;

.field private prototypeProperty:Ljava/lang/Object;

.field private prototypePropertyAttributes:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const-string v0, "Function"

    sput-object v0, Lorg/mozilla/javascript/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x6

    .line 30
    invoke-direct {p0}, Lorg/mozilla/javascript/IdScriptableObject;-><init>()V

    .line 601
    sget-object v0, Lorg/mozilla/javascript/BaseFunction;->NOT_FOUND:Ljava/lang/Object;

    iput-object v0, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsObj:Ljava/lang/Object;

    .line 606
    iput v1, p0, Lorg/mozilla/javascript/BaseFunction;->prototypePropertyAttributes:I

    .line 607
    iput v1, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsAttributes:I

    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V
    .registers 5
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "prototype"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    const/4 v1, 0x6

    .line 35
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)V

    .line 601
    sget-object v0, Lorg/mozilla/javascript/BaseFunction;->NOT_FOUND:Ljava/lang/Object;

    iput-object v0, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsObj:Ljava/lang/Object;

    .line 606
    iput v1, p0, Lorg/mozilla/javascript/BaseFunction;->prototypePropertyAttributes:I

    .line 607
    iput v1, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsAttributes:I

    .line 36
    return-void
.end method

.method private getArguments()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 485
    const-string v3, "arguments"

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/BaseFunction;->defaultHas(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_13

    const-string v3, "arguments"

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/BaseFunction;->defaultGet(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 486
    .local v2, "value":Ljava/lang/Object;
    :goto_e
    sget-object v3, Lorg/mozilla/javascript/BaseFunction;->NOT_FOUND:Ljava/lang/Object;

    if-eq v2, v3, :cond_16

    .line 496
    .end local v2    # "value":Ljava/lang/Object;
    :goto_12
    return-object v2

    .line 485
    :cond_13
    iget-object v2, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsObj:Ljava/lang/Object;

    goto :goto_e

    .line 494
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_16
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 495
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    invoke-static {v1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->findFunctionActivation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Function;)Lorg/mozilla/javascript/NativeCall;

    move-result-object v0

    .line 496
    .local v0, "activation":Lorg/mozilla/javascript/NativeCall;
    if-nez v0, :cond_23

    const/4 v3, 0x0

    :goto_21
    move-object v2, v3

    goto :goto_12

    :cond_23
    const-string v3, "arguments"

    invoke-virtual {v0, v3, v0}, Lorg/mozilla/javascript/NativeCall;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_21
.end method

.method static init(Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "sealed"    # Z

    .prologue
    .line 23
    new-instance v0, Lorg/mozilla/javascript/BaseFunction;

    invoke-direct {v0}, Lorg/mozilla/javascript/BaseFunction;-><init>()V

    .line 25
    .local v0, "obj":Lorg/mozilla/javascript/BaseFunction;
    const/4 v1, 0x7

    iput v1, v0, Lorg/mozilla/javascript/BaseFunction;->prototypePropertyAttributes:I

    .line 26
    const/4 v1, 0x6

    invoke-virtual {v0, v1, p0, p1}, Lorg/mozilla/javascript/BaseFunction;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 27
    return-void
.end method

.method static isApply(Lorg/mozilla/javascript/IdFunctionObject;)Z
    .registers 3
    .param p0, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 238
    sget-object v0, Lorg/mozilla/javascript/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_11

    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method static isApplyOrCall(Lorg/mozilla/javascript/IdFunctionObject;)Z
    .registers 2
    .param p0, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 242
    sget-object v0, Lorg/mozilla/javascript/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 243
    invoke-virtual {p0}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    packed-switch v0, :pswitch_data_14

    .line 249
    :cond_f
    const/4 v0, 0x0

    :goto_10
    return v0

    .line 246
    :pswitch_11
    const/4 v0, 0x1

    goto :goto_10

    .line 243
    nop

    :pswitch_data_14
    .packed-switch 0x4
        :pswitch_11
        :pswitch_11
    .end packed-switch
.end method

.method private static jsConstructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 18
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 504
    move-object/from16 v0, p2

    array-length v9, v0

    .line 505
    .local v9, "arglen":I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 507
    .local v14, "sourceBuf":Ljava/lang/StringBuilder;
    const-string v1, "function "

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getLanguageVersion()I

    move-result v1

    const/16 v7, 0x78

    if-eq v1, v7, :cond_1a

    .line 515
    const-string v1, "anonymous"

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    :cond_1a
    const/16 v1, 0x28

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 520
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_20
    add-int/lit8 v1, v9, -0x1

    if-ge v12, v1, :cond_37

    .line 521
    if-lez v12, :cond_2b

    .line 522
    const/16 v1, 0x2c

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 524
    :cond_2b
    aget-object v1, p2, v12

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 520
    add-int/lit8 v12, v12, 0x1

    goto :goto_20

    .line 526
    :cond_37
    const-string v1, ") {"

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    if-eqz v9, :cond_49

    .line 529
    add-int/lit8 v1, v9, -0x1

    aget-object v1, p2, v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 530
    .local v11, "funBody":Ljava/lang/String;
    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 532
    .end local v11    # "funBody":Ljava/lang/String;
    :cond_49
    const-string v1, "\n}"

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 535
    .local v3, "source":Ljava/lang/String;
    const/4 v1, 0x1

    new-array v13, v1, [I

    .line 536
    .local v13, "linep":[I
    invoke-static {v13}, Lorg/mozilla/javascript/Context;->getSourcePositionFromStack([I)Ljava/lang/String;

    move-result-object v10

    .line 537
    .local v10, "filename":Ljava/lang/String;
    if-nez v10, :cond_61

    .line 538
    const-string v10, "<eval\'ed string>"

    .line 539
    const/4 v1, 0x0

    const/4 v7, 0x1

    aput v7, v13, v1

    .line 542
    :cond_61
    const/4 v1, 0x0

    const/4 v7, 0x0

    aget v7, v13, v7

    invoke-static {v1, v10, v7}, Lorg/mozilla/javascript/ScriptRuntime;->makeUrlForGeneratedScript(ZLjava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    .line 545
    .local v6, "sourceURI":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 548
    .local v2, "global":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0}, Lorg/mozilla/javascript/Context;->getErrorReporter()Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/DefaultErrorReporter;->forEval(Lorg/mozilla/javascript/ErrorReporter;)Lorg/mozilla/javascript/ErrorReporter;

    move-result-object v5

    .line 550
    .local v5, "reporter":Lorg/mozilla/javascript/ErrorReporter;
    invoke-static {}, Lorg/mozilla/javascript/Context;->createInterpreter()Lorg/mozilla/javascript/Evaluator;

    move-result-object v4

    .line 551
    .local v4, "evaluator":Lorg/mozilla/javascript/Evaluator;
    if-nez v4, :cond_86

    .line 552
    new-instance v1, Lorg/mozilla/javascript/JavaScriptException;

    const-string v7, "Interpreter not present"

    const/4 v8, 0x0

    aget v8, v13, v8

    invoke-direct {v1, v7, v10, v8}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    throw v1

    .line 558
    :cond_86
    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v8}, Lorg/mozilla/javascript/Context;->compileFunction(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Evaluator;Lorg/mozilla/javascript/ErrorReporter;Ljava/lang/String;ILjava/lang/Object;)Lorg/mozilla/javascript/Function;

    move-result-object v1

    return-object v1
.end method

.method private realFunction(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/BaseFunction;
    .registers 6
    .param p1, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "f"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 313
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    invoke-interface {p1, v1}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 314
    .local v0, "x":Ljava/lang/Object;
    instance-of v1, v0, Lorg/mozilla/javascript/Delegator;

    if-eqz v1, :cond_10

    .line 315
    check-cast v0, Lorg/mozilla/javascript/Delegator;

    .end local v0    # "x":Ljava/lang/Object;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Delegator;->getDelegee()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 317
    :cond_10
    instance-of v1, v0, Lorg/mozilla/javascript/BaseFunction;

    if-eqz v1, :cond_17

    .line 318
    check-cast v0, Lorg/mozilla/javascript/BaseFunction;

    return-object v0

    .line 320
    :cond_17
    const-string v1, "msg.incompat.call"

    invoke-virtual {p2}, Lorg/mozilla/javascript/IdFunctionObject;->getFunctionName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1
.end method

.method private declared-synchronized setupDefaultPrototype()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 462
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lorg/mozilla/javascript/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    if-eqz v3, :cond_9

    .line 463
    iget-object v1, p0, Lorg/mozilla/javascript/BaseFunction;->prototypeProperty:Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_21

    .line 477
    :cond_7
    :goto_7
    monitor-exit p0

    return-object v1

    .line 465
    :cond_9
    :try_start_9
    new-instance v1, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v1}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 466
    .local v1, "obj":Lorg/mozilla/javascript/NativeObject;
    const/4 v0, 0x2

    .line 467
    .local v0, "attr":I
    const-string v3, "constructor"

    const/4 v4, 0x2

    invoke-virtual {v1, v3, p0, v4}, Lorg/mozilla/javascript/NativeObject;->defineProperty(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 471
    iput-object v1, p0, Lorg/mozilla/javascript/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    .line 472
    invoke-static {p0}, Lorg/mozilla/javascript/BaseFunction;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 473
    .local v2, "proto":Lorg/mozilla/javascript/Scriptable;
    if-eq v2, v1, :cond_7

    .line 475
    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/NativeObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V
    :try_end_20
    .catchall {:try_start_9 .. :try_end_20} :catchall_21

    goto :goto_7

    .line 462
    .end local v0    # "attr":I
    .end local v1    # "obj":Lorg/mozilla/javascript/NativeObject;
    .end local v2    # "proto":Lorg/mozilla/javascript/Scriptable;
    :catchall_21
    move-exception v3

    monitor-exit p0

    throw v3
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 352
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method public construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 11
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 357
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/BaseFunction;->createObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v2

    .line 358
    .local v2, "result":Lorg/mozilla/javascript/Scriptable;
    if-eqz v2, :cond_12

    .line 359
    invoke-virtual {p0, p1, p2, v2, p3}, Lorg/mozilla/javascript/BaseFunction;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 360
    .local v3, "val":Ljava/lang/Object;
    instance-of v4, v3, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_11

    move-object v2, v3

    .line 361
    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    .line 386
    :cond_11
    :goto_11
    return-object v2

    .line 364
    .end local v3    # "val":Ljava/lang/Object;
    :cond_12
    const/4 v4, 0x0

    invoke-virtual {p0, p1, p2, v4, p3}, Lorg/mozilla/javascript/BaseFunction;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 365
    .restart local v3    # "val":Ljava/lang/Object;
    instance-of v4, v3, Lorg/mozilla/javascript/Scriptable;

    if-nez v4, :cond_4a

    .line 368
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bad implementaion of call as constructor, name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " in "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_4a
    move-object v2, v3

    .line 372
    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    .line 373
    invoke-interface {v2}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    if-nez v4, :cond_5c

    .line 374
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getClassPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 375
    .local v1, "proto":Lorg/mozilla/javascript/Scriptable;
    if-eq v2, v1, :cond_5c

    .line 376
    invoke-interface {v2, v1}, Lorg/mozilla/javascript/Scriptable;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 379
    .end local v1    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_5c
    invoke-interface {v2}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    if-nez v4, :cond_11

    .line 380
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 381
    .local v0, "parent":Lorg/mozilla/javascript/Scriptable;
    if-eq v2, v0, :cond_11

    .line 382
    invoke-interface {v2, v0}, Lorg/mozilla/javascript/Scriptable;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_11
.end method

.method public createObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 401
    new-instance v0, Lorg/mozilla/javascript/NativeObject;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeObject;-><init>()V

    .line 402
    .local v0, "newInstance":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getClassPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/mozilla/javascript/Scriptable;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 403
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/mozilla/javascript/Scriptable;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 404
    return-object v0
.end method

.method decompile(II)Ljava/lang/String;
    .registers 6
    .param p1, "indent"    # I
    .param p2, "flags"    # I

    .prologue
    .line 417
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 418
    .local v1, "sb":Ljava/lang/StringBuilder;
    and-int/lit8 v2, p2, 0x1

    if-eqz v2, :cond_3a

    const/4 v0, 0x1

    .line 419
    .local v0, "justbody":Z
    :goto_a
    if-nez v0, :cond_1d

    .line 420
    const-string v2, "function "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 421
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    const-string v2, "() {\n\t"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    :cond_1d
    const-string v2, "[native code, arity="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getArity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 426
    const-string v2, "]\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    if-nez v0, :cond_35

    .line 428
    const-string v2, "}\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    :cond_35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 418
    .end local v0    # "justbody":Z
    :cond_3a
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 21
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 256
    sget-object v4, Lorg/mozilla/javascript/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_f

    .line 257
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdScriptableObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 306
    :goto_e
    return-object v4

    .line 259
    :cond_f
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v12

    .line 260
    .local v12, "id":I
    packed-switch v12, :pswitch_data_ae

    .line 308
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 262
    :pswitch_20
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/BaseFunction;->jsConstructor(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_e

    .line 265
    :pswitch_2b
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/BaseFunction;->realFunction(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/BaseFunction;

    move-result-object v14

    .line 266
    .local v14, "realf":Lorg/mozilla/javascript/BaseFunction;
    const/4 v4, 0x0

    move-object/from16 v0, p5

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v13

    .line 267
    .local v13, "indent":I
    const/4 v4, 0x0

    invoke-virtual {v14, v13, v4}, Lorg/mozilla/javascript/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_e

    .line 271
    .end local v13    # "indent":I
    .end local v14    # "realf":Lorg/mozilla/javascript/BaseFunction;
    :pswitch_40
    move-object/from16 v0, p4

    move-object/from16 v1, p1

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/BaseFunction;->realFunction(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/BaseFunction;

    move-result-object v14

    .line 272
    .restart local v14    # "realf":Lorg/mozilla/javascript/BaseFunction;
    const/4 v13, 0x0

    .line 273
    .restart local v13    # "indent":I
    const/4 v11, 0x2

    .line 274
    .local v11, "flags":I
    move-object/from16 v0, p5

    array-length v4, v0

    if-eqz v4, :cond_59

    .line 275
    const/4 v4, 0x0

    aget-object v4, p5, v4

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v13

    .line 276
    if-ltz v13, :cond_5e

    .line 277
    const/4 v11, 0x0

    .line 282
    :cond_59
    :goto_59
    invoke-virtual {v14, v13, v11}, Lorg/mozilla/javascript/BaseFunction;->decompile(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_e

    .line 279
    :cond_5e
    const/4 v13, 0x0

    goto :goto_59

    .line 287
    .end local v11    # "flags":I
    .end local v13    # "indent":I
    .end local v14    # "realf":Lorg/mozilla/javascript/BaseFunction;
    :pswitch_60
    const/4 v4, 0x4

    if-ne v12, v4, :cond_71

    const/4 v4, 0x1

    :goto_64
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-static {v4, v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->applyOrCall(ZLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_e

    :cond_71
    const/4 v4, 0x0

    goto :goto_64

    .line 291
    :pswitch_73
    move-object/from16 v0, p4

    instance-of v4, v0, Lorg/mozilla/javascript/Callable;

    if-nez v4, :cond_7e

    .line 292
    invoke-static/range {p4 .. p4}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    :cond_7e
    move-object/from16 v7, p4

    .line 294
    check-cast v7, Lorg/mozilla/javascript/Callable;

    .line 295
    .local v7, "targetFunction":Lorg/mozilla/javascript/Callable;
    move-object/from16 v0, p5

    array-length v10, v0

    .line 298
    .local v10, "argc":I
    if-lez v10, :cond_aa

    .line 299
    const/4 v4, 0x0

    aget-object v4, p5, v4

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-static {v0, v4, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v8

    .line 300
    .local v8, "boundThis":Lorg/mozilla/javascript/Scriptable;
    add-int/lit8 v4, v10, -0x1

    new-array v9, v4, [Ljava/lang/Object;

    .line 301
    .local v9, "boundArgs":[Ljava/lang/Object;
    const/4 v4, 0x1

    const/4 v5, 0x0

    add-int/lit8 v6, v10, -0x1

    move-object/from16 v0, p5

    invoke-static {v0, v4, v9, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 306
    :goto_9f
    new-instance v4, Lorg/mozilla/javascript/BoundFunction;

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    invoke-direct/range {v4 .. v9}, Lorg/mozilla/javascript/BoundFunction;-><init>(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)V

    goto/16 :goto_e

    .line 303
    .end local v8    # "boundThis":Lorg/mozilla/javascript/Scriptable;
    .end local v9    # "boundArgs":[Ljava/lang/Object;
    :cond_aa
    const/4 v8, 0x0

    .line 304
    .restart local v8    # "boundThis":Lorg/mozilla/javascript/Scriptable;
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .restart local v9    # "boundArgs":[Ljava/lang/Object;
    goto :goto_9f

    .line 260
    :pswitch_data_ae
    .packed-switch 0x1
        :pswitch_20
        :pswitch_2b
        :pswitch_40
        :pswitch_60
        :pswitch_60
        :pswitch_73
    .end packed-switch
.end method

.method protected fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V
    .registers 2
    .param p1, "ctor"    # Lorg/mozilla/javascript/IdFunctionObject;

    .prologue
    .line 216
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/IdFunctionObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 217
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->fillConstructorProperties(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 218
    return-void
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .registers 8
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 101
    const/4 v3, 0x0

    .local v3, "id":I
    const/4 v0, 0x0

    .line 102
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    packed-switch v5, :pswitch_data_58

    .line 111
    :cond_a
    :goto_a
    :pswitch_a
    if-eqz v0, :cond_15

    if-eq v0, p1, :cond_15

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_15

    const/4 v3, 0x0

    .line 117
    :cond_15
    if-nez v3, :cond_3c

    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v4

    .line 138
    :cond_1b
    :goto_1b
    return v4

    .line 103
    :pswitch_1c
    const-string v0, "name"

    const/4 v3, 0x3

    goto :goto_a

    .line 104
    :pswitch_20
    const-string v0, "arity"

    const/4 v3, 0x2

    goto :goto_a

    .line 105
    :pswitch_24
    const-string v0, "length"

    const/4 v3, 0x1

    goto :goto_a

    .line 106
    :pswitch_28
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 107
    .local v2, "c":I
    const/16 v5, 0x61

    if-ne v2, v5, :cond_34

    const-string v0, "arguments"

    const/4 v3, 0x5

    goto :goto_a

    .line 108
    :cond_34
    const/16 v5, 0x70

    if-ne v2, v5, :cond_a

    const-string v0, "prototype"

    const/4 v3, 0x4

    goto :goto_a

    .line 120
    .end local v2    # "c":I
    :cond_3c
    packed-switch v3, :pswitch_data_68

    .line 136
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 124
    :pswitch_45
    const/4 v1, 0x7

    .line 138
    .local v1, "attr":I
    :goto_46
    invoke-static {v1, v3}, Lorg/mozilla/javascript/BaseFunction;->instanceIdInfo(II)I

    move-result v4

    goto :goto_1b

    .line 128
    .end local v1    # "attr":I
    :pswitch_4b
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->hasPrototypeProperty()Z

    move-result v5

    if-eqz v5, :cond_1b

    .line 131
    iget v1, p0, Lorg/mozilla/javascript/BaseFunction;->prototypePropertyAttributes:I

    .line 132
    .restart local v1    # "attr":I
    goto :goto_46

    .line 134
    .end local v1    # "attr":I
    :pswitch_54
    iget v1, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsAttributes:I

    .line 135
    .restart local v1    # "attr":I
    goto :goto_46

    .line 102
    nop

    :pswitch_data_58
    .packed-switch 0x4
        :pswitch_1c
        :pswitch_20
        :pswitch_24
        :pswitch_a
        :pswitch_a
        :pswitch_28
    .end packed-switch

    .line 120
    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_45
        :pswitch_45
        :pswitch_45
        :pswitch_4b
        :pswitch_54
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 568
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 569
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_48

    .line 581
    :cond_9
    :goto_9
    :pswitch_9
    if-eqz v0, :cond_14

    if-eq v0, p1, :cond_14

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    const/4 v2, 0x0

    .line 585
    :cond_14
    return v2

    .line 570
    :pswitch_15
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 571
    .local v1, "c":I
    const/16 v3, 0x62

    if-ne v1, v3, :cond_22

    const-string v0, "bind"

    const/4 v2, 0x6

    goto :goto_9

    .line 572
    :cond_22
    const/16 v3, 0x63

    if-ne v1, v3, :cond_9

    const-string v0, "call"

    const/4 v2, 0x5

    goto :goto_9

    .line 574
    .end local v1    # "c":I
    :pswitch_2a
    const-string v0, "apply"

    const/4 v2, 0x4

    goto :goto_9

    .line 575
    :pswitch_2e
    const/4 v3, 0x3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 576
    .restart local v1    # "c":I
    const/16 v3, 0x6f

    if-ne v1, v3, :cond_3b

    const-string v0, "toSource"

    const/4 v2, 0x3

    goto :goto_9

    .line 577
    :cond_3b
    const/16 v3, 0x74

    if-ne v1, v3, :cond_9

    const-string v0, "toString"

    const/4 v2, 0x2

    goto :goto_9

    .line 579
    .end local v1    # "c":I
    :pswitch_43
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto :goto_9

    .line 569
    nop

    :pswitch_data_48
    .packed-switch 0x4
        :pswitch_15
        :pswitch_2a
        :pswitch_9
        :pswitch_9
        :pswitch_2e
        :pswitch_9
        :pswitch_9
        :pswitch_43
    .end packed-switch
.end method

.method public getArity()I
    .registers 2

    .prologue
    .line 433
    const/4 v0, 0x0

    return v0
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    const-string v0, "Function"

    return-object v0
.end method

.method protected getClassPrototype()Lorg/mozilla/javascript/Scriptable;
    .registers 3

    .prologue
    .line 339
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v0

    .line 340
    .local v0, "protoVal":Ljava/lang/Object;
    instance-of v1, v0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v1, :cond_b

    .line 341
    check-cast v0, Lorg/mozilla/javascript/Scriptable;

    .line 343
    .end local v0    # "protoVal":Ljava/lang/Object;
    :goto_a
    return-object v0

    .restart local v0    # "protoVal":Ljava/lang/Object;
    :cond_b
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptableObject;->getObjectPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    goto :goto_a
.end method

.method public getFunctionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 438
    const-string v0, ""

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 144
    packed-switch p1, :pswitch_data_18

    .line 151
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 145
    :pswitch_8
    const-string v0, "length"

    goto :goto_7

    .line 146
    :pswitch_b
    const-string v0, "arity"

    goto :goto_7

    .line 147
    :pswitch_e
    const-string v0, "name"

    goto :goto_7

    .line 148
    :pswitch_11
    const-string v0, "prototype"

    goto :goto_7

    .line 149
    :pswitch_14
    const-string v0, "arguments"

    goto :goto_7

    .line 144
    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_14
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 157
    packed-switch p1, :pswitch_data_2a

    .line 164
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdScriptableObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    :goto_7
    return-object v0

    .line 158
    :pswitch_8
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getLength()I

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_7

    .line 159
    :pswitch_11
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getArity()I

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_7

    .line 160
    :pswitch_1a
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 161
    :pswitch_1f
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getPrototypeProperty()Ljava/lang/Object;

    move-result-object v0

    goto :goto_7

    .line 162
    :pswitch_24
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;->getArguments()Ljava/lang/Object;

    move-result-object v0

    goto :goto_7

    .line 157
    nop

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_8
        :pswitch_11
        :pswitch_1a
        :pswitch_1f
        :pswitch_24
    .end packed-switch
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 435
    const/4 v0, 0x0

    return v0
.end method

.method protected getMaxInstanceId()I
    .registers 2

    .prologue
    .line 93
    const/4 v0, 0x5

    return v0
.end method

.method protected getPrototypeProperty()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 446
    iget-object v0, p0, Lorg/mozilla/javascript/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    .line 447
    .local v0, "result":Ljava/lang/Object;
    if-nez v0, :cond_10

    .line 450
    instance-of v1, p0, Lorg/mozilla/javascript/NativeFunction;

    if-eqz v1, :cond_d

    .line 451
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;->setupDefaultPrototype()Ljava/lang/Object;

    move-result-object v0

    .line 458
    .end local v0    # "result":Ljava/lang/Object;
    :cond_c
    :goto_c
    return-object v0

    .line 453
    .restart local v0    # "result":Ljava/lang/Object;
    :cond_d
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_c

    .line 455
    :cond_10
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v1, :cond_c

    .line 456
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getTypeOf()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->avoidObjectDetection()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "undefined"

    :goto_8
    return-object v0

    :cond_9
    const-string v0, "function"

    goto :goto_8
.end method

.method public hasInstance(Lorg/mozilla/javascript/Scriptable;)Z
    .registers 5
    .param p1, "instance"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 71
    const-string v1, "prototype"

    invoke-static {p0, v1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 72
    .local v0, "protoProp":Ljava/lang/Object;
    instance-of v1, v0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v1, :cond_11

    .line 73
    check-cast v0, Lorg/mozilla/javascript/Scriptable;

    .end local v0    # "protoProp":Ljava/lang/Object;
    invoke-static {p1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->jsDelegatesTo(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v1

    return v1

    .line 75
    .restart local v0    # "protoProp":Ljava/lang/Object;
    :cond_11
    const-string v1, "msg.instanceof.bad.prototype"

    invoke-virtual {p0}, Lorg/mozilla/javascript/BaseFunction;->getFunctionName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1
.end method

.method protected hasPrototypeProperty()Z
    .registers 2

    .prologue
    .line 442
    iget-object v0, p0, Lorg/mozilla/javascript/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    if-nez v0, :cond_8

    instance-of v0, p0, Lorg/mozilla/javascript/NativeFunction;

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 225
    packed-switch p1, :pswitch_data_2a

    .line 232
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 226
    :pswitch_d
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v1, "constructor"

    .line 234
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/BaseFunction;->FUNCTION_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/BaseFunction;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 235
    return-void

    .line 227
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "toString"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 228
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "toSource"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 229
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1e
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v1, "apply"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 230
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_22
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "call"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 231
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_26
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "bind"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 225
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
        :pswitch_1e
        :pswitch_22
        :pswitch_26
    .end packed-switch
.end method

.method public setImmunePrototypeProperty(Ljava/lang/Object;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 330
    iget v0, p0, Lorg/mozilla/javascript/BaseFunction;->prototypePropertyAttributes:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_c

    .line 331
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 333
    :cond_c
    if-eqz p1, :cond_14

    .end local p1    # "value":Ljava/lang/Object;
    :goto_e
    iput-object p1, p0, Lorg/mozilla/javascript/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    .line 334
    const/4 v0, 0x7

    iput v0, p0, Lorg/mozilla/javascript/BaseFunction;->prototypePropertyAttributes:I

    .line 335
    return-void

    .line 333
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_14
    sget-object p1, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    goto :goto_e
.end method

.method protected setInstanceIdAttributes(II)V
    .registers 3
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .prologue
    .line 199
    packed-switch p1, :pswitch_data_e

    .line 207
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdAttributes(II)V

    .line 208
    :goto_6
    return-void

    .line 201
    :pswitch_7
    iput p2, p0, Lorg/mozilla/javascript/BaseFunction;->prototypePropertyAttributes:I

    goto :goto_6

    .line 204
    :pswitch_a
    iput p2, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsAttributes:I

    goto :goto_6

    .line 199
    nop

    :pswitch_data_e
    .packed-switch 0x4
        :pswitch_7
        :pswitch_a
    .end packed-switch
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .registers 4
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 170
    packed-switch p1, :pswitch_data_34

    .line 193
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdScriptableObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 194
    .end local p2    # "value":Ljava/lang/Object;
    :cond_6
    :goto_6
    :pswitch_6
    return-void

    .line 172
    .restart local p2    # "value":Ljava/lang/Object;
    :pswitch_7
    iget v0, p0, Lorg/mozilla/javascript/BaseFunction;->prototypePropertyAttributes:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_6

    .line 173
    if-eqz p2, :cond_12

    .end local p2    # "value":Ljava/lang/Object;
    :goto_f
    iput-object p2, p0, Lorg/mozilla/javascript/BaseFunction;->prototypeProperty:Ljava/lang/Object;

    goto :goto_6

    .restart local p2    # "value":Ljava/lang/Object;
    :cond_12
    sget-object p2, Lorg/mozilla/javascript/UniqueTag;->NULL_VALUE:Lorg/mozilla/javascript/UniqueTag;

    goto :goto_f

    .line 178
    :pswitch_15
    sget-object v0, Lorg/mozilla/javascript/BaseFunction;->NOT_FOUND:Ljava/lang/Object;

    if-ne p2, v0, :cond_1c

    .line 180
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 182
    :cond_1c
    const-string v0, "arguments"

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/BaseFunction;->defaultHas(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 183
    const-string v0, "arguments"

    invoke-virtual {p0, v0, p2}, Lorg/mozilla/javascript/BaseFunction;->defaultPut(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_6

    .line 184
    :cond_2a
    iget v0, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsAttributes:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_6

    .line 185
    iput-object p2, p0, Lorg/mozilla/javascript/BaseFunction;->argumentsObj:Ljava/lang/Object;

    goto :goto_6

    .line 170
    nop

    :pswitch_data_34
    .packed-switch 0x1
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_7
        :pswitch_15
    .end packed-switch
.end method
