.class public final Lorg/mozilla/javascript/Interpreter;
.super Lorg/mozilla/javascript/Icode;
.source "Interpreter.java"

# interfaces
.implements Lorg/mozilla/javascript/Evaluator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/Interpreter$1;,
        Lorg/mozilla/javascript/Interpreter$GeneratorState;,
        Lorg/mozilla/javascript/Interpreter$ContinuationJump;,
        Lorg/mozilla/javascript/Interpreter$CallFrame;
    }
.end annotation


# static fields
.field static final EXCEPTION_HANDLER_SLOT:I = 0x2

.field static final EXCEPTION_LOCAL_SLOT:I = 0x4

.field static final EXCEPTION_SCOPE_SLOT:I = 0x5

.field static final EXCEPTION_SLOT_SIZE:I = 0x6

.field static final EXCEPTION_TRY_END_SLOT:I = 0x1

.field static final EXCEPTION_TRY_START_SLOT:I = 0x0

.field static final EXCEPTION_TYPE_SLOT:I = 0x3


# instance fields
.field itsData:Lorg/mozilla/javascript/InterpreterData;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    .prologue
    .line 186
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/mozilla/javascript/Icode;-><init>()V

    .line 818
    return-void
.end method

.method private static addInstructionCount(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I)V
    .registers 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "extra"    # I

    .prologue
    .line 3177
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    iget v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    iget v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    sub-int/2addr v1, v2

    add-int/2addr v1, p2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 3178
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    iget v1, p0, Lorg/mozilla/javascript/Context;->instructionThreshold:I

    if-le v0, v1, :cond_19

    .line 3179
    iget v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/Context;->observeInstructionCount(I)V

    .line 3180
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 3182
    :cond_19
    return-void
.end method

.method private static bytecodeSpan(I)I
    .registers 4
    .param p0, "bytecode"    # I

    .prologue
    const/4 v1, 0x5

    const/4 v2, 0x2

    const/4 v0, 0x3

    .line 493
    sparse-switch p0, :sswitch_data_26

    .line 570
    invoke-static {p0}, Lorg/mozilla/javascript/Interpreter;->validBytecode(I)Z

    move-result v0

    if-nez v0, :cond_23

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    :sswitch_11
    move v0, v1

    .line 571
    :goto_12
    :sswitch_12
    return v0

    :sswitch_13
    move v0, v2

    .line 518
    goto :goto_12

    :sswitch_15
    move v0, v2

    .line 526
    goto :goto_12

    :sswitch_17
    move v0, v1

    .line 534
    goto :goto_12

    :sswitch_19
    move v0, v2

    .line 538
    goto :goto_12

    :sswitch_1b
    move v0, v1

    .line 546
    goto :goto_12

    :sswitch_1d
    move v0, v2

    .line 550
    goto :goto_12

    :sswitch_1f
    move v0, v1

    .line 558
    goto :goto_12

    :sswitch_21
    move v0, v2

    .line 564
    goto :goto_12

    .line 571
    :cond_23
    const/4 v0, 0x1

    goto :goto_12

    .line 493
    nop

    :sswitch_data_26
    .sparse-switch
        -0x3f -> :sswitch_12
        -0x3e -> :sswitch_12
        -0x3d -> :sswitch_21
        -0x36 -> :sswitch_12
        -0x31 -> :sswitch_21
        -0x30 -> :sswitch_21
        -0x2f -> :sswitch_1f
        -0x2e -> :sswitch_12
        -0x2d -> :sswitch_1d
        -0x28 -> :sswitch_1b
        -0x27 -> :sswitch_12
        -0x26 -> :sswitch_19
        -0x1c -> :sswitch_17
        -0x1b -> :sswitch_12
        -0x1a -> :sswitch_12
        -0x17 -> :sswitch_12
        -0x15 -> :sswitch_11
        -0xb -> :sswitch_15
        -0xa -> :sswitch_15
        -0x9 -> :sswitch_15
        -0x8 -> :sswitch_15
        -0x7 -> :sswitch_15
        -0x6 -> :sswitch_12
        0x5 -> :sswitch_12
        0x6 -> :sswitch_12
        0x7 -> :sswitch_12
        0x32 -> :sswitch_12
        0x39 -> :sswitch_13
        0x48 -> :sswitch_12
    .end sparse-switch
.end method

.method public static captureContinuation(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/NativeContinuation;
    .registers 3
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 2973
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    instance-of v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-nez v0, :cond_12

    .line 2976
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Interpreter frames not found"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2978
    :cond_12
    iget-object v0, p0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v0, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/mozilla/javascript/Interpreter;->captureContinuation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Z)Lorg/mozilla/javascript/NativeContinuation;

    move-result-object v0

    return-object v0
.end method

.method private static captureContinuation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Z)Lorg/mozilla/javascript/NativeContinuation;
    .registers 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "requireContinuationsTopFrame"    # Z

    .prologue
    const/4 v6, 0x0

    .line 2984
    new-instance v0, Lorg/mozilla/javascript/NativeContinuation;

    invoke-direct {v0}, Lorg/mozilla/javascript/NativeContinuation;-><init>()V

    .line 2985
    .local v0, "c":Lorg/mozilla/javascript/NativeContinuation;
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    invoke-static {v0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;)V

    .line 2989
    move-object v3, p1

    .line 2990
    .local v3, "x":Lorg/mozilla/javascript/Interpreter$CallFrame;
    move-object v2, p1

    .line 2991
    .local v2, "outermost":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_f
    if-eqz v3, :cond_47

    iget-boolean v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v4, :cond_47

    .line 2992
    const/4 v4, 0x1

    iput-boolean v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 2994
    iget v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    add-int/lit8 v1, v4, 0x1

    .local v1, "i":I
    :goto_1c
    iget-object v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    array-length v4, v4

    if-eq v1, v4, :cond_2d

    .line 2996
    iget-object v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aput-object v6, v4, v1

    .line 2997
    iget-object v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    const/4 v5, 0x0

    aput v5, v4, v1

    .line 2994
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .line 2999
    :cond_2d
    iget v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    const/16 v5, 0x26

    if-ne v4, v5, :cond_3d

    .line 3001
    iget-object v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v5, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    aput-object v6, v4, v5

    .line 3008
    :cond_39
    :goto_39
    move-object v2, v3

    .line 3009
    iget-object v3, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    goto :goto_f

    .line 3003
    :cond_3d
    iget v4, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    const/16 v5, 0x1e

    if-eq v4, v5, :cond_39

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_39

    .line 3012
    .end local v1    # "i":I
    :cond_47
    if-eqz p2, :cond_5c

    .line 3013
    :goto_49
    iget-object v4, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v4, :cond_50

    .line 3014
    iget-object v2, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    goto :goto_49

    .line 3016
    :cond_50
    iget-boolean v4, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->isContinuationsTopFrame:Z

    if-nez v4, :cond_5c

    .line 3017
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Cannot capture continuation from JavaScript code not called directly by executeScriptWithContinuations or callFunctionWithContinuations"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 3024
    :cond_5c
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/NativeContinuation;->initImplementation(Ljava/lang/Object;)V

    .line 3025
    return-object v0
.end method

.method private static captureFrameForGenerator(Lorg/mozilla/javascript/Interpreter$CallFrame;)Lorg/mozilla/javascript/Interpreter$CallFrame;
    .registers 4
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;

    .prologue
    const/4 v2, 0x0

    .line 162
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 163
    invoke-virtual {p0}, Lorg/mozilla/javascript/Interpreter$CallFrame;->cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object v0

    .line 164
    .local v0, "result":Lorg/mozilla/javascript/Interpreter$CallFrame;
    iput-boolean v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 167
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 168
    iput v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    .line 170
    return-object v0
.end method

.method private static doAdd([Ljava/lang/Object;[DILorg/mozilla/javascript/Context;)V
    .registers 19
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I
    .param p3, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 3073
    add-int/lit8 v13, p2, 0x1

    aget-object v10, p0, v13

    .line 3074
    .local v10, "rhs":Ljava/lang/Object;
    aget-object v6, p0, p2

    .line 3077
    .local v6, "lhs":Ljava/lang/Object;
    sget-object v13, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v10, v13, :cond_2f

    .line 3078
    add-int/lit8 v13, p2, 0x1

    aget-wide v1, p1, v13

    .line 3079
    .local v1, "d":D
    sget-object v13, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v6, v13, :cond_18

    .line 3080
    aget-wide v13, p1, p2

    add-double/2addr v13, v1

    aput-wide v13, p1, p2

    .line 3131
    .end local v1    # "d":D
    .end local v6    # "lhs":Ljava/lang/Object;
    .end local v10    # "rhs":Ljava/lang/Object;
    :goto_17
    return-void

    .line 3083
    .restart local v1    # "d":D
    .restart local v6    # "lhs":Ljava/lang/Object;
    .restart local v10    # "rhs":Ljava/lang/Object;
    :cond_18
    const/4 v5, 0x1

    .line 3109
    .local v5, "leftRightOrder":Z
    :goto_19
    instance-of v13, v6, Lorg/mozilla/javascript/Scriptable;

    if-eqz v13, :cond_88

    .line 3110
    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v10

    .line 3111
    .local v10, "rhs":Ljava/lang/Number;
    if-nez v5, :cond_26

    .line 3112
    move-object v12, v6

    .line 3113
    .local v12, "tmp":Ljava/lang/Object;
    move-object v6, v10

    .line 3114
    .local v6, "lhs":Ljava/lang/Number;
    move-object v10, v12

    .line 3116
    .end local v6    # "lhs":Ljava/lang/Number;
    .end local v10    # "rhs":Ljava/lang/Number;
    .end local v12    # "tmp":Ljava/lang/Object;
    :cond_26
    move-object/from16 v0, p3

    invoke-static {v6, v10, v0}, Lorg/mozilla/javascript/ScriptRuntime;->add(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v13

    aput-object v13, p0, p2

    goto :goto_17

    .line 3085
    .end local v1    # "d":D
    .end local v5    # "leftRightOrder":Z
    .local v6, "lhs":Ljava/lang/Object;
    .local v10, "rhs":Ljava/lang/Object;
    :cond_2f
    sget-object v13, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v6, v13, :cond_38

    .line 3086
    aget-wide v1, p1, p2

    .line 3087
    .restart local v1    # "d":D
    move-object v6, v10

    .line 3088
    const/4 v5, 0x0

    .restart local v5    # "leftRightOrder":Z
    goto :goto_19

    .line 3091
    .end local v1    # "d":D
    .end local v5    # "leftRightOrder":Z
    :cond_38
    instance-of v13, v6, Lorg/mozilla/javascript/Scriptable;

    if-nez v13, :cond_40

    instance-of v13, v10, Lorg/mozilla/javascript/Scriptable;

    if-eqz v13, :cond_49

    .line 3092
    :cond_40
    move-object/from16 v0, p3

    invoke-static {v6, v10, v0}, Lorg/mozilla/javascript/ScriptRuntime;->add(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v13

    aput-object v13, p0, p2

    goto :goto_17

    .line 3093
    :cond_49
    instance-of v13, v6, Ljava/lang/CharSequence;

    if-nez v13, :cond_51

    instance-of v13, v10, Ljava/lang/CharSequence;

    if-eqz v13, :cond_61

    .line 3094
    :cond_51
    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v7

    .line 3095
    .local v7, "lstr":Ljava/lang/CharSequence;
    invoke-static {v10}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v11

    .line 3096
    .local v11, "rstr":Ljava/lang/CharSequence;
    new-instance v13, Lorg/mozilla/javascript/ConsString;

    invoke-direct {v13, v7, v11}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v13, p0, p2

    goto :goto_17

    .line 3098
    .end local v7    # "lstr":Ljava/lang/CharSequence;
    .end local v11    # "rstr":Ljava/lang/CharSequence;
    :cond_61
    instance-of v13, v6, Ljava/lang/Number;

    if-eqz v13, :cond_7e

    check-cast v6, Ljava/lang/Number;

    .end local v6    # "lhs":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    .line 3100
    .local v3, "lDbl":D
    :goto_6b
    instance-of v13, v10, Ljava/lang/Number;

    if-eqz v13, :cond_83

    check-cast v10, Ljava/lang/Number;

    .end local v10    # "rhs":Ljava/lang/Object;
    invoke-virtual {v10}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v8

    .line 3102
    .local v8, "rDbl":D
    :goto_75
    sget-object v13, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v13, p0, p2

    .line 3103
    add-double v13, v3, v8

    aput-wide v13, p1, p2

    goto :goto_17

    .line 3098
    .end local v3    # "lDbl":D
    .end local v8    # "rDbl":D
    .restart local v6    # "lhs":Ljava/lang/Object;
    .restart local v10    # "rhs":Ljava/lang/Object;
    :cond_7e
    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    goto :goto_6b

    .line 3100
    .end local v6    # "lhs":Ljava/lang/Object;
    .restart local v3    # "lDbl":D
    :cond_83
    invoke-static {v10}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v8

    goto :goto_75

    .line 3117
    .end local v3    # "lDbl":D
    .restart local v1    # "d":D
    .restart local v5    # "leftRightOrder":Z
    .restart local v6    # "lhs":Ljava/lang/Object;
    :cond_88
    instance-of v13, v6, Ljava/lang/CharSequence;

    if-eqz v13, :cond_ab

    move-object v7, v6

    .line 3118
    check-cast v7, Ljava/lang/CharSequence;

    .line 3119
    .restart local v7    # "lstr":Ljava/lang/CharSequence;
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    invoke-static {v13}, Lorg/mozilla/javascript/ScriptRuntime;->toCharSequence(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v11

    .line 3120
    .restart local v11    # "rstr":Ljava/lang/CharSequence;
    if-eqz v5, :cond_a2

    .line 3121
    new-instance v13, Lorg/mozilla/javascript/ConsString;

    invoke-direct {v13, v7, v11}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v13, p0, p2

    goto/16 :goto_17

    .line 3123
    :cond_a2
    new-instance v13, Lorg/mozilla/javascript/ConsString;

    invoke-direct {v13, v11, v7}, Lorg/mozilla/javascript/ConsString;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    aput-object v13, p0, p2

    goto/16 :goto_17

    .line 3126
    .end local v7    # "lstr":Ljava/lang/CharSequence;
    .end local v11    # "rstr":Ljava/lang/CharSequence;
    :cond_ab
    instance-of v13, v6, Ljava/lang/Number;

    if-eqz v13, :cond_bf

    check-cast v6, Ljava/lang/Number;

    .end local v6    # "lhs":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    .line 3128
    .restart local v3    # "lDbl":D
    :goto_b5
    sget-object v13, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v13, p0, p2

    .line 3129
    add-double v13, v3, v1

    aput-wide v13, p1, p2

    goto/16 :goto_17

    .line 3126
    .end local v3    # "lDbl":D
    .restart local v6    # "lhs":Ljava/lang/Object;
    :cond_bf
    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    goto :goto_b5
.end method

.method private static doArithmetic(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .registers 10
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 3135
    invoke-static {p0, p4}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v2

    .line 3136
    .local v2, "rDbl":D
    add-int/lit8 p4, p4, -0x1

    .line 3137
    invoke-static {p0, p4}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v0

    .line 3138
    .local v0, "lDbl":D
    sget-object v4, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v4, p2, p4

    .line 3139
    packed-switch p1, :pswitch_data_1c

    .line 3153
    :goto_11
    aput-wide v0, p3, p4

    .line 3154
    return p4

    .line 3141
    :pswitch_14
    sub-double/2addr v0, v2

    .line 3142
    goto :goto_11

    .line 3144
    :pswitch_16
    mul-double/2addr v0, v2

    .line 3145
    goto :goto_11

    .line 3147
    :pswitch_18
    div-double/2addr v0, v2

    .line 3148
    goto :goto_11

    .line 3150
    :pswitch_1a
    rem-double/2addr v0, v2

    goto :goto_11

    .line 3139
    :pswitch_data_1c
    .packed-switch 0x16
        :pswitch_14
        :pswitch_16
        :pswitch_18
        :pswitch_1a
    .end packed-switch
.end method

.method private static doBitOp(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .registers 9
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 2168
    add-int/lit8 v2, p4, -0x1

    invoke-static {p0, v2}, Lorg/mozilla/javascript/Interpreter;->stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I

    move-result v0

    .line 2169
    .local v0, "lIntValue":I
    invoke-static {p0, p4}, Lorg/mozilla/javascript/Interpreter;->stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I

    move-result v1

    .line 2170
    .local v1, "rIntValue":I
    add-int/lit8 p4, p4, -0x1

    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v2, p2, p4

    .line 2171
    packed-switch p1, :pswitch_data_22

    .line 2188
    :goto_13
    :pswitch_13
    int-to-double v2, v0

    aput-wide v2, p3, p4

    .line 2189
    return p4

    .line 2173
    :pswitch_17
    and-int/2addr v0, v1

    .line 2174
    goto :goto_13

    .line 2176
    :pswitch_19
    or-int/2addr v0, v1

    .line 2177
    goto :goto_13

    .line 2179
    :pswitch_1b
    xor-int/2addr v0, v1

    .line 2180
    goto :goto_13

    .line 2182
    :pswitch_1d
    shl-int/2addr v0, v1

    .line 2183
    goto :goto_13

    .line 2185
    :pswitch_1f
    shr-int/2addr v0, v1

    goto :goto_13

    .line 2171
    nop

    :pswitch_data_22
    .packed-switch 0x9
        :pswitch_19
        :pswitch_1b
        :pswitch_17
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_1d
        :pswitch_1f
    .end packed-switch
.end method

.method private static doCallSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[BI)I
    .registers 18
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "iCode"    # [B
    .param p6, "indexReg"    # I

    .prologue
    .line 2263
    iget v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v1, p5, v1

    and-int/lit16 v7, v1, 0xff

    .line 2264
    .local v7, "callType":I
    iget v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v1, v1, 0x1

    aget-byte v1, p5, v1

    if-eqz v1, :cond_40

    const/4 v10, 0x1

    .line 2265
    .local v10, "isNew":Z
    :goto_f
    iget v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v1, v1, 0x2

    move-object/from16 v0, p5

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v9

    .line 2268
    .local v9, "sourceLine":I
    if-eqz v10, :cond_42

    .line 2270
    sub-int p4, p4, p6

    .line 2272
    aget-object v2, p2, p4

    .line 2273
    .local v2, "function":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v1, :cond_29

    .line 2274
    aget-wide v5, p3, p4

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 2275
    .end local v2    # "function":Ljava/lang/Object;
    :cond_29
    add-int/lit8 v1, p4, 0x1

    move/from16 v0, p6

    invoke-static {p2, p3, v1, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v4

    .line 2277
    .local v4, "outArgs":[Ljava/lang/Object;
    iget-object v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {p0, v2, v4, v1, v7}, Lorg/mozilla/javascript/ScriptRuntime;->newSpecial(Lorg/mozilla/javascript/Context;Ljava/lang/Object;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v1

    aput-object v1, p2, p4

    .line 2294
    :goto_39
    iget v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2295
    return p4

    .line 2264
    .end local v4    # "outArgs":[Ljava/lang/Object;
    .end local v9    # "sourceLine":I
    .end local v10    # "isNew":Z
    :cond_40
    const/4 v10, 0x0

    goto :goto_f

    .line 2281
    .restart local v9    # "sourceLine":I
    .restart local v10    # "isNew":Z
    :cond_42
    add-int/lit8 v1, p6, 0x1

    sub-int/2addr p4, v1

    .line 2285
    add-int/lit8 v1, p4, 0x1

    aget-object v3, p2, v1

    check-cast v3, Lorg/mozilla/javascript/Scriptable;

    .line 2286
    .local v3, "functionThis":Lorg/mozilla/javascript/Scriptable;
    aget-object v2, p2, p4

    check-cast v2, Lorg/mozilla/javascript/Callable;

    .line 2287
    .local v2, "function":Lorg/mozilla/javascript/Callable;
    add-int/lit8 v1, p4, 0x2

    move/from16 v0, p6

    invoke-static {p2, p3, v1, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v4

    .line 2289
    .restart local v4    # "outArgs":[Ljava/lang/Object;
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v6, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->thisObj:Lorg/mozilla/javascript/Scriptable;

    iget-object v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v8, v1, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    move-object v1, p0

    invoke-static/range {v1 .. v9}, Lorg/mozilla/javascript/ScriptRuntime;->callSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;ILjava/lang/String;I)Ljava/lang/Object;

    move-result-object v1

    aput-object v1, p2, p4

    goto :goto_39
.end method

.method private static doCompare(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .registers 14
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 2110
    add-int/lit8 p4, p4, -0x1

    .line 2111
    add-int/lit8 v8, p4, 0x1

    aget-object v5, p2, v8

    .line 2112
    .local v5, "rhs":Ljava/lang/Object;
    aget-object v2, p2, p4

    .line 2119
    .local v2, "lhs":Ljava/lang/Object;
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v5, v8, :cond_1e

    .line 2120
    add-int/lit8 v8, p4, 0x1

    aget-wide v3, p3, v8

    .line 2121
    .local v3, "rDbl":D
    invoke-static {p0, p4}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v0

    .line 2128
    .local v0, "lDbl":D
    :goto_16
    packed-switch p1, :pswitch_data_68

    .line 2142
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v7

    throw v7

    .line 2122
    .end local v0    # "lDbl":D
    .end local v3    # "rDbl":D
    :cond_1e
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v8, :cond_4b

    .line 2123
    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v3

    .line 2124
    .restart local v3    # "rDbl":D
    aget-wide v0, p3, p4

    .restart local v0    # "lDbl":D
    goto :goto_16

    .line 2130
    :pswitch_29
    cmpl-double v8, v0, v3

    if-ltz v8, :cond_34

    .line 2162
    .end local v0    # "lDbl":D
    .end local v3    # "rDbl":D
    .local v6, "valBln":Z
    :goto_2d
    invoke-static {v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, p2, p4

    .line 2163
    return p4

    .end local v6    # "valBln":Z
    .restart local v0    # "lDbl":D
    .restart local v3    # "rDbl":D
    :cond_34
    move v6, v7

    .line 2130
    goto :goto_2d

    .line 2133
    :pswitch_36
    cmpg-double v8, v0, v3

    if-gtz v8, :cond_3b

    .line 2134
    .restart local v6    # "valBln":Z
    :goto_3a
    goto :goto_2d

    .end local v6    # "valBln":Z
    :cond_3b
    move v6, v7

    .line 2133
    goto :goto_3a

    .line 2136
    :pswitch_3d
    cmpl-double v8, v0, v3

    if-lez v8, :cond_42

    .line 2137
    .restart local v6    # "valBln":Z
    :goto_41
    goto :goto_2d

    .end local v6    # "valBln":Z
    :cond_42
    move v6, v7

    .line 2136
    goto :goto_41

    .line 2139
    :pswitch_44
    cmpg-double v8, v0, v3

    if-gez v8, :cond_49

    .line 2140
    .restart local v6    # "valBln":Z
    :goto_48
    goto :goto_2d

    .end local v6    # "valBln":Z
    :cond_49
    move v6, v7

    .line 2139
    goto :goto_48

    .line 2145
    .end local v0    # "lDbl":D
    .end local v3    # "rDbl":D
    :cond_4b
    packed-switch p1, :pswitch_data_74

    .line 2159
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v7

    throw v7

    .line 2147
    :pswitch_53
    invoke-static {v5, v2}, Lorg/mozilla/javascript/ScriptRuntime;->cmp_LE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2148
    .restart local v6    # "valBln":Z
    goto :goto_2d

    .line 2150
    .end local v6    # "valBln":Z
    :pswitch_58
    invoke-static {v2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->cmp_LE(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2151
    .restart local v6    # "valBln":Z
    goto :goto_2d

    .line 2153
    .end local v6    # "valBln":Z
    :pswitch_5d
    invoke-static {v5, v2}, Lorg/mozilla/javascript/ScriptRuntime;->cmp_LT(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2154
    .restart local v6    # "valBln":Z
    goto :goto_2d

    .line 2156
    .end local v6    # "valBln":Z
    :pswitch_62
    invoke-static {v2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->cmp_LT(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    .line 2157
    .restart local v6    # "valBln":Z
    goto :goto_2d

    .line 2128
    nop

    :pswitch_data_68
    .packed-switch 0xe
        :pswitch_44
        :pswitch_36
        :pswitch_3d
        :pswitch_29
    .end packed-switch

    .line 2145
    :pswitch_data_74
    .packed-switch 0xe
        :pswitch_62
        :pswitch_58
        :pswitch_5d
        :pswitch_53
    .end packed-switch
.end method

.method private static doDelName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I
    .registers 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "op"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I

    .prologue
    .line 2194
    aget-object v1, p3, p5

    .line 2195
    .local v1, "rhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_c

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2196
    .end local v1    # "rhs":Ljava/lang/Object;
    :cond_c
    add-int/lit8 p5, p5, -0x1

    .line 2197
    aget-object v0, p3, p5

    .line 2198
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_1a

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2199
    .end local v0    # "lhs":Ljava/lang/Object;
    :cond_1a
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    if-nez p2, :cond_26

    const/4 v2, 0x1

    :goto_1f
    invoke-static {v0, v1, p0, v3, v2}, Lorg/mozilla/javascript/ScriptRuntime;->delete(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p3, p5

    .line 2201
    return p5

    .line 2199
    :cond_26
    const/4 v2, 0x0

    goto :goto_1f
.end method

.method private static doElemIncDec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[B[Ljava/lang/Object;[DI)I
    .registers 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "iCode"    # [B
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I

    .prologue
    .line 2248
    aget-object v1, p3, p5

    .line 2249
    .local v1, "rhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_c

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2250
    .end local v1    # "rhs":Ljava/lang/Object;
    :cond_c
    add-int/lit8 p5, p5, -0x1

    .line 2251
    aget-object v0, p3, p5

    .line 2252
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_1a

    aget-wide v2, p4, p5

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2253
    .end local v0    # "lhs":Ljava/lang/Object;
    :cond_1a
    iget-object v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    iget v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v3, p2, v3

    invoke-static {v0, v1, p0, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->elemIncrDecr(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p3, p5

    .line 2255
    iget v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2256
    return p5
.end method

.method private static doEquals([Ljava/lang/Object;[DI)Z
    .registers 9
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I

    .prologue
    .line 2485
    add-int/lit8 v2, p2, 0x1

    aget-object v1, p0, v2

    .line 2486
    .local v1, "rhs":Ljava/lang/Object;
    aget-object v0, p0, p2

    .line 2487
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_25

    .line 2488
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_1c

    .line 2489
    aget-wide v2, p1, p2

    add-int/lit8 v4, p2, 0x1

    aget-wide v4, p1, v4

    cmpl-double v2, v2, v4

    if-nez v2, :cond_1a

    const/4 v2, 0x1

    .line 2497
    :goto_19
    return v2

    .line 2489
    :cond_1a
    const/4 v2, 0x0

    goto :goto_19

    .line 2491
    :cond_1c
    add-int/lit8 v2, p2, 0x1

    aget-wide v2, p1, v2

    invoke-static {v2, v3, v0}, Lorg/mozilla/javascript/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v2

    goto :goto_19

    .line 2494
    :cond_25
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_30

    .line 2495
    aget-wide v2, p1, p2

    invoke-static {v2, v3, v1}, Lorg/mozilla/javascript/ScriptRuntime;->eqNumber(DLjava/lang/Object;)Z

    move-result v2

    goto :goto_19

    .line 2497
    :cond_30
    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    goto :goto_19
.end method

.method private static doGetElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I
    .registers 12
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 2206
    add-int/lit8 p4, p4, -0x1

    .line 2207
    aget-object v3, p2, p4

    .line 2208
    .local v3, "lhs":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v3, v5, :cond_e

    .line 2209
    aget-wide v5, p3, p4

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 2212
    .end local v3    # "lhs":Ljava/lang/Object;
    :cond_e
    add-int/lit8 v5, p4, 0x1

    aget-object v2, p2, v5

    .line 2213
    .local v2, "id":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v2, v5, :cond_1f

    .line 2214
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v3, v2, p0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectElem(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .line 2219
    .local v4, "value":Ljava/lang/Object;
    :goto_1c
    aput-object v4, p2, p4

    .line 2220
    return p4

    .line 2216
    .end local v4    # "value":Ljava/lang/Object;
    :cond_1f
    add-int/lit8 v5, p4, 0x1

    aget-wide v0, p3, v5

    .line 2217
    .local v0, "d":D
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v3, v0, v1, p0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectIndex(Ljava/lang/Object;DLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v4

    .restart local v4    # "value":Ljava/lang/Object;
    goto :goto_1c
.end method

.method private static doGetVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[DI)I
    .registers 10
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "indexReg"    # I

    .prologue
    .line 2349
    add-int/lit8 p3, p3, 0x1

    .line 2350
    iget-boolean v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-nez v1, :cond_f

    .line 2351
    aget-object v1, p4, p6

    aput-object v1, p1, p3

    .line 2352
    aget-wide v1, p5, p6

    aput-wide v1, p2, p3

    .line 2357
    :goto_e
    return p3

    .line 2354
    :cond_f
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v1, v1, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v0, v1, p6

    .line 2355
    .local v0, "stringReg":Ljava/lang/String;
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v1, v0, v2}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    aput-object v1, p1, p3

    goto :goto_e
.end method

.method private static doInOrInstanceof(Lorg/mozilla/javascript/Context;I[Ljava/lang/Object;[DI)I
    .registers 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "op"    # I
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 2093
    aget-object v1, p2, p4

    .line 2094
    .local v1, "rhs":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v3, :cond_c

    aget-wide v3, p3, p4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2095
    .end local v1    # "rhs":Ljava/lang/Object;
    :cond_c
    add-int/lit8 p4, p4, -0x1

    .line 2096
    aget-object v0, p2, p4

    .line 2097
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v3, :cond_1a

    aget-wide v3, p3, p4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2099
    .end local v0    # "lhs":Ljava/lang/Object;
    :cond_1a
    const/16 v3, 0x34

    if-ne p1, v3, :cond_29

    .line 2100
    invoke-static {v0, v1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->in(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z

    move-result v2

    .line 2104
    .local v2, "valBln":Z
    :goto_22
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, p2, p4

    .line 2105
    return p4

    .line 2102
    .end local v2    # "valBln":Z
    :cond_29
    invoke-static {v0, v1, p0}, Lorg/mozilla/javascript/ScriptRuntime;->instanceOf(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z

    move-result v2

    .restart local v2    # "valBln":Z
    goto :goto_22
.end method

.method private static doRefMember(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;[DII)I
    .registers 9
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "flags"    # I

    .prologue
    .line 2405
    aget-object v0, p1, p3

    .line 2406
    .local v0, "elem":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_c

    aget-wide v2, p2, p3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2407
    .end local v0    # "elem":Ljava/lang/Object;
    :cond_c
    add-int/lit8 p3, p3, -0x1

    .line 2408
    aget-object v1, p1, p3

    .line 2409
    .local v1, "obj":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_1a

    aget-wide v2, p2, p3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2410
    .end local v1    # "obj":Ljava/lang/Object;
    :cond_1a
    invoke-static {v1, v0, p0, p4}, Lorg/mozilla/javascript/ScriptRuntime;->memberRef(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Lorg/mozilla/javascript/Ref;

    move-result-object v2

    aput-object v2, p1, p3

    .line 2411
    return p3
.end method

.method private static doRefNsMember(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;[DII)I
    .registers 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "flags"    # I

    .prologue
    .line 2416
    aget-object v0, p1, p3

    .line 2417
    .local v0, "elem":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v3, :cond_c

    aget-wide v3, p2, p3

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2418
    .end local v0    # "elem":Ljava/lang/Object;
    :cond_c
    add-int/lit8 p3, p3, -0x1

    .line 2419
    aget-object v1, p1, p3

    .line 2420
    .local v1, "ns":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v3, :cond_1a

    aget-wide v3, p2, p3

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2421
    .end local v1    # "ns":Ljava/lang/Object;
    :cond_1a
    add-int/lit8 p3, p3, -0x1

    .line 2422
    aget-object v2, p1, p3

    .line 2423
    .local v2, "obj":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v3, :cond_28

    aget-wide v3, p2, p3

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 2424
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_28
    invoke-static {v2, v1, v0, p0, p4}, Lorg/mozilla/javascript/ScriptRuntime;->memberRef(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;I)Lorg/mozilla/javascript/Ref;

    move-result-object v3

    aput-object v3, p1, p3

    .line 2425
    return p3
.end method

.method private static doRefNsName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DII)I
    .registers 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "flags"    # I

    .prologue
    .line 2431
    aget-object v0, p2, p4

    .line 2432
    .local v0, "name":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v2, :cond_c

    aget-wide v2, p3, p4

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2433
    .end local v0    # "name":Ljava/lang/Object;
    :cond_c
    add-int/lit8 p4, p4, -0x1

    .line 2434
    aget-object v1, p2, p4

    .line 2435
    .local v1, "ns":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_1a

    aget-wide v2, p3, p4

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2436
    .end local v1    # "ns":Ljava/lang/Object;
    :cond_1a
    iget-object v2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1, v0, p0, v2, p5}, Lorg/mozilla/javascript/ScriptRuntime;->nameRef(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;

    move-result-object v2

    aput-object v2, p2, p4

    .line 2437
    return p4
.end method

.method private static doSetConstVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .registers 13
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "varAttributes"    # [I
    .param p7, "indexReg"    # I

    .prologue
    .line 2302
    iget-boolean v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-nez v3, :cond_2c

    .line 2303
    aget v3, p6, p7

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_17

    .line 2304
    const-string v3, "msg.var.redecl"

    iget-object v4, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v4, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v4, v4, p7

    invoke-static {v3, v4}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v3

    throw v3

    .line 2307
    :cond_17
    aget v3, p6, p7

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_2b

    .line 2310
    aget-object v3, p1, p3

    aput-object v3, p4, p7

    .line 2311
    aget v3, p6, p7

    and-int/lit8 v3, v3, -0x9

    aput v3, p6, p7

    .line 2312
    aget-wide v3, p2, p3

    aput-wide v3, p5, p7

    .line 2324
    :cond_2b
    :goto_2b
    return p3

    .line 2315
    :cond_2c
    aget-object v2, p1, p3

    .line 2316
    .local v2, "val":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v3, :cond_38

    aget-wide v3, p2, p3

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 2317
    .end local v2    # "val":Ljava/lang/Object;
    :cond_38
    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v1, v3, p7

    .line 2318
    .local v1, "stringReg":Ljava/lang/String;
    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    instance-of v3, v3, Lorg/mozilla/javascript/ConstProperties;

    if-eqz v3, :cond_4e

    .line 2319
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    check-cast v0, Lorg/mozilla/javascript/ConstProperties;

    .line 2320
    .local v0, "cp":Lorg/mozilla/javascript/ConstProperties;
    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v0, v1, v3, v2}, Lorg/mozilla/javascript/ConstProperties;->putConst(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_2b

    .line 2322
    .end local v0    # "cp":Lorg/mozilla/javascript/ConstProperties;
    :cond_4e
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3
.end method

.method private static doSetElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I
    .registers 13
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I

    .prologue
    .line 2225
    add-int/lit8 p4, p4, -0x2

    .line 2226
    add-int/lit8 v4, p4, 0x2

    aget-object v3, p2, v4

    .line 2227
    .local v3, "rhs":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v3, v4, :cond_12

    .line 2228
    add-int/lit8 v4, p4, 0x2

    aget-wide v4, p3, v4

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 2230
    .end local v3    # "rhs":Ljava/lang/Object;
    :cond_12
    aget-object v0, p2, p4

    .line 2231
    .local v0, "lhs":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v4, :cond_1e

    .line 2232
    aget-wide v4, p3, p4

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    .line 2235
    .end local v0    # "lhs":Ljava/lang/Object;
    :cond_1e
    add-int/lit8 v4, p4, 0x1

    aget-object v6, p2, v4

    .line 2236
    .local v6, "id":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v6, v4, :cond_2f

    .line 2237
    iget-object v4, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v0, v6, v3, p0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectElem(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    .line 2242
    .local v7, "value":Ljava/lang/Object;
    :goto_2c
    aput-object v7, p2, p4

    .line 2243
    return p4

    .line 2239
    .end local v7    # "value":Ljava/lang/Object;
    :cond_2f
    add-int/lit8 v4, p4, 0x1

    aget-wide v1, p3, v4

    .line 2240
    .local v1, "d":D
    iget-object v5, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object v4, p0

    invoke-static/range {v0 .. v5}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectIndex(Ljava/lang/Object;DLjava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v7

    .restart local v7    # "value":Ljava/lang/Object;
    goto :goto_2c
.end method

.method private static doSetVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .registers 12
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "stack"    # [Ljava/lang/Object;
    .param p2, "sDbl"    # [D
    .param p3, "stackTop"    # I
    .param p4, "vars"    # [Ljava/lang/Object;
    .param p5, "varDbls"    # [D
    .param p6, "varAttributes"    # [I
    .param p7, "indexReg"    # I

    .prologue
    .line 2331
    iget-boolean v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-nez v2, :cond_13

    .line 2332
    aget v2, p6, p7

    and-int/lit8 v2, v2, 0x1

    if-nez v2, :cond_12

    .line 2333
    aget-object v2, p1, p3

    aput-object v2, p4, p7

    .line 2334
    aget-wide v2, p2, p3

    aput-wide v2, p5, p7

    .line 2342
    :cond_12
    :goto_12
    return p3

    .line 2337
    :cond_13
    aget-object v1, p1, p3

    .line 2338
    .local v1, "val":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v1, v2, :cond_1f

    aget-wide v2, p2, p3

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v1

    .line 2339
    .end local v1    # "val":Ljava/lang/Object;
    :cond_1f
    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v2, v2, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v0, v2, p7

    .line 2340
    .local v0, "stringReg":Ljava/lang/String;
    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v2, v0, v3, v1}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_12
.end method

.method private static doShallowEquals([Ljava/lang/Object;[DI)Z
    .registers 12
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "stackTop"    # I

    .prologue
    const/4 v7, 0x0

    .line 2505
    add-int/lit8 v8, p2, 0x1

    aget-object v6, p0, v8

    .line 2506
    .local v6, "rhs":Ljava/lang/Object;
    aget-object v3, p0, p2

    .line 2507
    .local v3, "lhs":Ljava/lang/Object;
    sget-object v0, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    .line 2509
    .local v0, "DBL_MRK":Lorg/mozilla/javascript/UniqueTag;
    if-ne v6, v0, :cond_24

    .line 2510
    add-int/lit8 v8, p2, 0x1

    aget-wide v4, p1, v8

    .line 2511
    .local v4, "rdbl":D
    if-ne v3, v0, :cond_19

    .line 2512
    aget-wide v1, p1, p2

    .line 2528
    .end local v3    # "lhs":Ljava/lang/Object;
    .end local v6    # "rhs":Ljava/lang/Object;
    .local v1, "ldbl":D
    :goto_13
    cmpl-double v8, v1, v4

    if-nez v8, :cond_18

    const/4 v7, 0x1

    .end local v1    # "ldbl":D
    .end local v4    # "rdbl":D
    :cond_18
    :goto_18
    return v7

    .line 2513
    .restart local v3    # "lhs":Ljava/lang/Object;
    .restart local v4    # "rdbl":D
    .restart local v6    # "rhs":Ljava/lang/Object;
    :cond_19
    instance-of v8, v3, Ljava/lang/Number;

    if-eqz v8, :cond_18

    .line 2514
    check-cast v3, Ljava/lang/Number;

    .end local v3    # "lhs":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    .restart local v1    # "ldbl":D
    goto :goto_13

    .line 2518
    .end local v1    # "ldbl":D
    .end local v4    # "rdbl":D
    .restart local v3    # "lhs":Ljava/lang/Object;
    :cond_24
    if-ne v3, v0, :cond_33

    .line 2519
    aget-wide v1, p1, p2

    .line 2520
    .restart local v1    # "ldbl":D
    instance-of v8, v6, Ljava/lang/Number;

    if-eqz v8, :cond_18

    .line 2521
    check-cast v6, Ljava/lang/Number;

    .end local v6    # "rhs":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    .restart local v4    # "rdbl":D
    goto :goto_13

    .line 2526
    .end local v1    # "ldbl":D
    .end local v4    # "rdbl":D
    .restart local v6    # "rhs":Ljava/lang/Object;
    :cond_33
    invoke-static {v3, v6}, Lorg/mozilla/javascript/ScriptRuntime;->shallowEq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    goto :goto_18
.end method

.method private static doVarIncDec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I
    .registers 19
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stack"    # [Ljava/lang/Object;
    .param p3, "sDbl"    # [D
    .param p4, "stackTop"    # I
    .param p5, "vars"    # [Ljava/lang/Object;
    .param p6, "varDbls"    # [D
    .param p7, "varAttributes"    # [I
    .param p8, "indexReg"    # I

    .prologue
    .line 2366
    add-int/lit8 p4, p4, 0x1

    .line 2367
    iget-object v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v8, v8, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    iget v9, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v4, v8, v9

    .line 2368
    .local v4, "incrDecrMask":I
    iget-boolean v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-nez v8, :cond_64

    .line 2369
    aget-object v7, p5, p8

    .line 2371
    .local v7, "varValue":Ljava/lang/Object;
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v7, v8, :cond_42

    .line 2372
    aget-wide v0, p6, p8

    .line 2376
    .local v0, "d":D
    :goto_16
    and-int/lit8 v8, v4, 0x1

    if-nez v8, :cond_47

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    add-double v2, v0, v8

    .line 2378
    .local v2, "d2":D
    :goto_1e
    and-int/lit8 v8, v4, 0x2

    if-eqz v8, :cond_4c

    const/4 v5, 0x1

    .line 2379
    .local v5, "post":Z
    :goto_23
    aget v8, p7, p8

    and-int/lit8 v8, v8, 0x1

    if-nez v8, :cond_50

    .line 2380
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v7, v8, :cond_31

    .line 2381
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v8, p5, p8

    .line 2383
    :cond_31
    aput-wide v2, p6, p8

    .line 2384
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v8, p2, p4

    .line 2385
    if-eqz v5, :cond_4e

    .end local v0    # "d":D
    :goto_39
    aput-wide v0, p3, p4

    .line 2399
    .end local v2    # "d2":D
    .end local v5    # "post":Z
    .end local v7    # "varValue":Ljava/lang/Object;
    :goto_3b
    iget v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2400
    return p4

    .line 2374
    .restart local v7    # "varValue":Ljava/lang/Object;
    :cond_42
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v0

    .restart local v0    # "d":D
    goto :goto_16

    .line 2376
    :cond_47
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    sub-double v2, v0, v8

    goto :goto_1e

    .line 2378
    .restart local v2    # "d2":D
    :cond_4c
    const/4 v5, 0x0

    goto :goto_23

    .restart local v5    # "post":Z
    :cond_4e
    move-wide v0, v2

    .line 2385
    goto :goto_39

    .line 2387
    :cond_50
    if-eqz v5, :cond_59

    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v7, v8, :cond_59

    .line 2388
    aput-object v7, p2, p4

    goto :goto_3b

    .line 2390
    :cond_59
    sget-object v8, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    aput-object v8, p2, p4

    .line 2391
    if-eqz v5, :cond_62

    .end local v0    # "d":D
    :goto_5f
    aput-wide v0, p3, p4

    goto :goto_3b

    .restart local v0    # "d":D
    :cond_62
    move-wide v0, v2

    goto :goto_5f

    .line 2395
    .end local v0    # "d":D
    .end local v2    # "d2":D
    .end local v5    # "post":Z
    .end local v7    # "varValue":Ljava/lang/Object;
    :cond_64
    iget-object v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v8, v8, Lorg/mozilla/javascript/InterpreterData;->argNames:[Ljava/lang/String;

    aget-object v6, v8, p8

    .line 2396
    .local v6, "varName":Ljava/lang/String;
    iget-object v8, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v8, v6, p0, v4}, Lorg/mozilla/javascript/ScriptRuntime;->nameIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;

    move-result-object v8

    aput-object v8, p2, p4

    goto :goto_3b
.end method

.method static dumpICode(Lorg/mozilla/javascript/InterpreterData;)V
    .registers 1
    .param p0, "idata"    # Lorg/mozilla/javascript/InterpreterData;

    .prologue
    .line 283
    return-void
.end method

.method private static enterFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;Z)V
    .registers 9
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "continuationRestart"    # Z

    .prologue
    .line 2868
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v2, v3, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    .line 2869
    .local v2, "usesActivation":Z
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v3, :cond_23

    const/4 v0, 0x1

    .line 2870
    .local v0, "isDebugged":Z
    :goto_9
    if-nez v2, :cond_d

    if-eqz v0, :cond_22

    .line 2871
    :cond_d
    iget-object v1, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 2872
    .local v1, "scope":Lorg/mozilla/javascript/Scriptable;
    if-nez v1, :cond_25

    .line 2873
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2902
    :cond_14
    :goto_14
    if-eqz v0, :cond_1d

    .line 2903
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    iget-object v4, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->thisObj:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v3, p0, v1, v4, p2}, Lorg/mozilla/javascript/debug/DebugFrame;->onEnter(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)V

    .line 2908
    :cond_1d
    if-eqz v2, :cond_22

    .line 2909
    invoke-static {p0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->enterActivationFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)V

    .line 2912
    .end local v1    # "scope":Lorg/mozilla/javascript/Scriptable;
    :cond_22
    return-void

    .line 2869
    .end local v0    # "isDebugged":Z
    :cond_23
    const/4 v0, 0x0

    goto :goto_9

    .line 2874
    .restart local v0    # "isDebugged":Z
    .restart local v1    # "scope":Lorg/mozilla/javascript/Scriptable;
    :cond_25
    if-eqz p3, :cond_14

    .line 2884
    :cond_27
    instance-of v3, v1, Lorg/mozilla/javascript/NativeWith;

    if-eqz v3, :cond_14

    .line 2885
    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 2886
    if-eqz v1, :cond_3b

    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v3, :cond_27

    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-object v3, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    if-ne v3, v1, :cond_27

    .line 2892
    :cond_3b
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_14
.end method

.method private static exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V
    .registers 11
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "throwable"    # Ljava/lang/Object;

    .prologue
    .line 2917
    iget-object v6, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v6, v6, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    if-eqz v6, :cond_9

    .line 2918
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->exitActivationFunction(Lorg/mozilla/javascript/Context;)V

    .line 2921
    :cond_9
    iget-object v6, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v6, :cond_17

    .line 2923
    :try_start_d
    instance-of v6, p2, Ljava/lang/Throwable;

    if-eqz v6, :cond_18

    .line 2924
    iget-object v6, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    const/4 v7, 0x1

    invoke-interface {v6, p0, v7, p2}, Lorg/mozilla/javascript/debug/DebugFrame;->onExit(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)V

    .line 2950
    :cond_17
    :goto_17
    return-void

    .line 2927
    :cond_18
    move-object v0, p2

    check-cast v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    move-object v1, v0

    .line 2928
    .local v1, "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    if-nez v1, :cond_41

    .line 2929
    iget-object v3, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 2933
    .local v3, "result":Ljava/lang/Object;
    :goto_20
    sget-object v6, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v3, v6, :cond_2c

    .line 2935
    if-nez v1, :cond_44

    .line 2936
    iget-wide v4, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    .line 2940
    .local v4, "resultDbl":D
    :goto_28
    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v3

    .line 2942
    .end local v3    # "result":Ljava/lang/Object;
    .end local v4    # "resultDbl":D
    :cond_2c
    iget-object v6, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    const/4 v7, 0x0

    invoke-interface {v6, p0, v7, v3}, Lorg/mozilla/javascript/debug/DebugFrame;->onExit(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)V
    :try_end_32
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_32} :catch_33

    goto :goto_17

    .line 2944
    .end local v1    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :catch_33
    move-exception v2

    .line 2945
    .local v2, "ex":Ljava/lang/Throwable;
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v7, "RHINO USAGE WARNING: onExit terminated with exception"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 2947
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v2, v6}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_17

    .line 2931
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v1    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :cond_41
    :try_start_41
    iget-object v3, v1, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .restart local v3    # "result":Ljava/lang/Object;
    goto :goto_20

    .line 2938
    :cond_44
    iget-wide v4, v1, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->resultDbl:D
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_46} :catch_33

    .restart local v4    # "resultDbl":D
    goto :goto_28
.end method

.method private static freezeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;ILorg/mozilla/javascript/Interpreter$GeneratorState;)Ljava/lang/Object;
    .registers 6
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "stackTop"    # I
    .param p3, "generatorState"    # Lorg/mozilla/javascript/Interpreter$GeneratorState;

    .prologue
    .line 2631
    iget v0, p3, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 2633
    const-string v0, "msg.yield.closing"

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 2636
    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 2637
    iget-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v0, p2

    iput-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 2638
    iget-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    aget-wide v0, v0, p2

    iput-wide v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    .line 2639
    iput p2, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2640
    iget v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2641
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->exitActivationFunction(Lorg/mozilla/javascript/Context;)V

    .line 2642
    iget-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v0, v1, :cond_2f

    iget-object v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    :goto_2e
    return-object v0

    :cond_2f
    iget-wide v0, p1, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v0

    goto :goto_2e
.end method

.method private static getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;
    .registers 9
    .param p0, "stack"    # [Ljava/lang/Object;
    .param p1, "sDbl"    # [D
    .param p2, "shift"    # I
    .param p3, "count"    # I

    .prologue
    .line 3160
    if-nez p3, :cond_5

    .line 3161
    sget-object v0, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 3171
    :cond_4
    return-object v0

    .line 3163
    :cond_5
    new-array v0, p3, [Ljava/lang/Object;

    .line 3164
    .local v0, "args":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-eq v1, p3, :cond_4

    .line 3165
    aget-object v2, p0, p2

    .line 3166
    .local v2, "val":Ljava/lang/Object;
    sget-object v3, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v3, :cond_16

    .line 3167
    aget-wide v3, p1, p2

    invoke-static {v3, v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v2

    .line 3169
    .end local v2    # "val":Ljava/lang/Object;
    :cond_16
    aput-object v2, v0, v1

    .line 3164
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 p2, p2, 0x1

    goto :goto_8
.end method

.method static getEncodedSource(Lorg/mozilla/javascript/InterpreterData;)Ljava/lang/String;
    .registers 4
    .param p0, "idata"    # Lorg/mozilla/javascript/InterpreterData;

    .prologue
    .line 776
    iget-object v0, p0, Lorg/mozilla/javascript/InterpreterData;->encodedSource:Ljava/lang/String;

    if-nez v0, :cond_6

    .line 777
    const/4 v0, 0x0

    .line 779
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/mozilla/javascript/InterpreterData;->encodedSource:Ljava/lang/String;

    iget v1, p0, Lorg/mozilla/javascript/InterpreterData;->encodedSourceStart:I

    iget v2, p0, Lorg/mozilla/javascript/InterpreterData;->encodedSourceEnd:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method private static getExceptionHandler(Lorg/mozilla/javascript/Interpreter$CallFrame;Z)I
    .registers 12
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "onlyFinally"    # Z

    .prologue
    .line 240
    iget-object v8, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v4, v8, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    .line 241
    .local v4, "exceptionTable":[I
    if-nez v4, :cond_8

    .line 243
    const/4 v0, -0x1

    .line 277
    :cond_7
    return v0

    .line 249
    :cond_8
    iget v8, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v8, -0x1

    .line 252
    .local v6, "pc":I
    const/4 v0, -0x1

    .local v0, "best":I
    const/4 v2, 0x0

    .local v2, "bestStart":I
    const/4 v1, 0x0

    .line 253
    .local v1, "bestEnd":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_10
    array-length v8, v4

    if-eq v5, v8, :cond_7

    .line 254
    add-int/lit8 v8, v5, 0x0

    aget v7, v4, v8

    .line 255
    .local v7, "start":I
    add-int/lit8 v8, v5, 0x1

    aget v3, v4, v8

    .line 256
    .local v3, "end":I
    if-gt v7, v6, :cond_1f

    if-lt v6, v3, :cond_22

    .line 253
    :cond_1f
    :goto_1f
    add-int/lit8 v5, v5, 0x6

    goto :goto_10

    .line 259
    :cond_22
    if-eqz p1, :cond_2b

    add-int/lit8 v8, v5, 0x3

    aget v8, v4, v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_1f

    .line 262
    :cond_2b
    if-ltz v0, :cond_39

    .line 266
    if-lt v1, v3, :cond_1f

    .line 270
    if-le v2, v7, :cond_34

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 271
    :cond_34
    if-ne v1, v3, :cond_39

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 273
    :cond_39
    move v0, v5

    .line 274
    move v2, v7

    .line 275
    move v1, v3

    goto :goto_1f
.end method

.method private static getIndex([BI)I
    .registers 4
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .prologue
    .line 229
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static getInt([BI)I
    .registers 4
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .prologue
    .line 233
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method static getLineNumbers(Lorg/mozilla/javascript/InterpreterData;)[I
    .registers 9
    .param p0, "data"    # Lorg/mozilla/javascript/InterpreterData;

    .prologue
    .line 576
    new-instance v5, Lorg/mozilla/javascript/UintMap;

    invoke-direct {v5}, Lorg/mozilla/javascript/UintMap;-><init>()V

    .line 578
    .local v5, "presentLines":Lorg/mozilla/javascript/UintMap;
    iget-object v1, p0, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 579
    .local v1, "iCode":[B
    array-length v2, v1

    .line 580
    .local v2, "iCodeLength":I
    const/4 v4, 0x0

    .local v4, "pc":I
    :goto_9
    if-eq v4, v2, :cond_27

    .line 581
    aget-byte v0, v1, v4

    .line 582
    .local v0, "bytecode":I
    invoke-static {v0}, Lorg/mozilla/javascript/Interpreter;->bytecodeSpan(I)I

    move-result v6

    .line 583
    .local v6, "span":I
    const/16 v7, -0x1a

    if-ne v0, v7, :cond_25

    .line 584
    const/4 v7, 0x3

    if-eq v6, v7, :cond_1b

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 585
    :cond_1b
    add-int/lit8 v7, v4, 0x1

    invoke-static {v1, v7}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v3

    .line 586
    .local v3, "line":I
    const/4 v7, 0x0

    invoke-virtual {v5, v3, v7}, Lorg/mozilla/javascript/UintMap;->put(II)V

    .line 588
    .end local v3    # "line":I
    :cond_25
    add-int/2addr v4, v6

    .line 589
    goto :goto_9

    .line 591
    .end local v0    # "bytecode":I
    .end local v6    # "span":I
    :cond_27
    invoke-virtual {v5}, Lorg/mozilla/javascript/UintMap;->getKeys()[I

    move-result-object v7

    return-object v7
.end method

.method private static getShort([BI)I
    .registers 4
    .param p0, "iCode"    # [B
    .param p1, "pc"    # I

    .prologue
    .line 225
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V
    .registers 30
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "callerScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;
    .param p4, "argsDbl"    # [D
    .param p5, "argShift"    # I
    .param p6, "argCount"    # I
    .param p7, "fnOrScript"    # Lorg/mozilla/javascript/InterpretedFunction;
    .param p8, "parentFrame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p9, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;

    .prologue
    .line 2727
    move-object/from16 v0, p7

    iget-object v9, v0, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 2729
    .local v9, "idata":Lorg/mozilla/javascript/InterpreterData;
    iget-boolean v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    move/from16 v16, v0

    .line 2730
    .local v16, "useActivation":Z
    const/4 v4, 0x0

    .line 2731
    .local v4, "debuggerFrame":Lorg/mozilla/javascript/debug/DebugFrame;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->debugger:Lorg/mozilla/javascript/debug/Debugger;

    move-object/from16 v18, v0

    if-eqz v18, :cond_23

    .line 2732
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/Context;->debugger:Lorg/mozilla/javascript/debug/Debugger;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-interface {v0, v1, v9}, Lorg/mozilla/javascript/debug/Debugger;->getFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/debug/DebuggableScript;)Lorg/mozilla/javascript/debug/DebugFrame;

    move-result-object v4

    .line 2733
    if-eqz v4, :cond_23

    .line 2734
    const/16 v16, 0x1

    .line 2738
    :cond_23
    if-eqz v16, :cond_2f

    .line 2741
    if-eqz p4, :cond_2b

    .line 2742
    invoke-static/range {p3 .. p6}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object p3

    .line 2744
    :cond_2b
    const/16 p5, 0x0

    .line 2745
    const/16 p4, 0x0

    .line 2749
    :cond_2f
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    move/from16 v18, v0

    if-eqz v18, :cond_82

    .line 2750
    invoke-virtual/range {p7 .. p7}, Lorg/mozilla/javascript/InterpretedFunction;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v12

    .line 2752
    .local v12, "scope":Lorg/mozilla/javascript/Scriptable;
    if-eqz v16, :cond_43

    .line 2753
    move-object/from16 v0, p7

    move-object/from16 v1, p3

    invoke-static {v0, v12, v1}, Lorg/mozilla/javascript/ScriptRuntime;->createFunctionActivation(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v12

    .line 2762
    :cond_43
    :goto_43
    iget-object v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNestedFunctions:[Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v18, v0

    if-eqz v18, :cond_9c

    .line 2763
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    move/from16 v18, v0

    if-eqz v18, :cond_58

    iget-boolean v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    move/from16 v18, v0

    if-nez v18, :cond_58

    .line 2764
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2765
    :cond_58
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_59
    iget-object v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNestedFunctions:[Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v8, v0, :cond_9c

    .line 2766
    iget-object v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsNestedFunctions:[Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v18, v0

    aget-object v7, v18, v8

    .line 2767
    .local v7, "fdata":Lorg/mozilla/javascript/InterpreterData;
    iget v0, v7, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_7f

    .line 2768
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-static {v0, v12, v1, v8}, Lorg/mozilla/javascript/Interpreter;->initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)V

    .line 2765
    :cond_7f
    add-int/lit8 v8, v8, 0x1

    goto :goto_59

    .line 2757
    .end local v7    # "fdata":Lorg/mozilla/javascript/InterpreterData;
    .end local v8    # "i":I
    .end local v12    # "scope":Lorg/mozilla/javascript/Scriptable;
    :cond_82
    move-object/from16 v12, p1

    .line 2758
    .restart local v12    # "scope":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p7

    iget-object v0, v0, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-boolean v0, v0, Lorg/mozilla/javascript/InterpreterData;->evalScriptFlag:Z

    move/from16 v18, v0

    move-object/from16 v0, p7

    move-object/from16 v1, p2

    move-object/from16 v2, p0

    move/from16 v3, v18

    invoke-static {v0, v1, v2, v12, v3}, Lorg/mozilla/javascript/ScriptRuntime;->initScript(Lorg/mozilla/javascript/NativeFunction;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V

    goto :goto_43

    .line 2775
    :cond_9c
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxVars:I

    move/from16 v18, v0

    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxLocals:I

    move/from16 v19, v0

    add-int v18, v18, v19

    add-int/lit8 v6, v18, -0x1

    .line 2776
    .local v6, "emptyStackTop":I
    iget v10, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxFrameArray:I

    .line 2777
    .local v10, "maxFrameArray":I
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxStack:I

    move/from16 v18, v0

    add-int v18, v18, v6

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    if-eq v10, v0, :cond_b9

    .line 2778
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2784
    :cond_b9
    move-object/from16 v0, p9

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v18, v0

    if-eqz v18, :cond_f3

    move-object/from16 v0, p9

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-gt v10, v0, :cond_f3

    .line 2786
    const/4 v15, 0x1

    .line 2787
    .local v15, "stackReuse":Z
    move-object/from16 v0, p9

    iget-object v13, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 2788
    .local v13, "stack":[Ljava/lang/Object;
    move-object/from16 v0, p9

    iget-object v14, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    .line 2789
    .local v14, "stackAttributes":[I
    move-object/from16 v0, p9

    iget-object v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    .line 2797
    .local v11, "sDbl":[D
    :goto_dd
    invoke-virtual {v9}, Lorg/mozilla/javascript/InterpreterData;->getParamAndVarCount()I

    move-result v17

    .line 2798
    .local v17, "varCount":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_e2
    move/from16 v0, v17

    if-ge v8, v0, :cond_fb

    .line 2799
    invoke-virtual {v9, v8}, Lorg/mozilla/javascript/InterpreterData;->getParamOrVarConst(I)Z

    move-result v18

    if-eqz v18, :cond_f0

    .line 2800
    const/16 v18, 0xd

    aput v18, v14, v8

    .line 2798
    :cond_f0
    add-int/lit8 v8, v8, 0x1

    goto :goto_e2

    .line 2791
    .end local v8    # "i":I
    .end local v11    # "sDbl":[D
    .end local v13    # "stack":[Ljava/lang/Object;
    .end local v14    # "stackAttributes":[I
    .end local v15    # "stackReuse":Z
    .end local v17    # "varCount":I
    :cond_f3
    const/4 v15, 0x0

    .line 2792
    .restart local v15    # "stackReuse":Z
    new-array v13, v10, [Ljava/lang/Object;

    .line 2793
    .restart local v13    # "stack":[Ljava/lang/Object;
    new-array v14, v10, [I

    .line 2794
    .restart local v14    # "stackAttributes":[I
    new-array v11, v10, [D

    .restart local v11    # "sDbl":[D
    goto :goto_dd

    .line 2802
    .restart local v8    # "i":I
    .restart local v17    # "varCount":I
    :cond_fb
    iget v5, v9, Lorg/mozilla/javascript/InterpreterData;->argCount:I

    .line 2803
    .local v5, "definedArgs":I
    move/from16 v0, p6

    if-le v5, v0, :cond_103

    move/from16 v5, p6

    .line 2807
    :cond_103
    move-object/from16 v0, p8

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2808
    if-nez p8, :cond_12a

    const/16 v18, 0x0

    :goto_10d
    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    .line 2810
    move-object/from16 v0, p9

    iget v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    move/from16 v18, v0

    invoke-virtual/range {p0 .. p0}, Lorg/mozilla/javascript/Context;->getMaximumInterpreterStackDepth()I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_133

    .line 2812
    const-string v18, "Exceeded maximum stack depth"

    invoke-static/range {v18 .. v18}, Lorg/mozilla/javascript/Context;->reportRuntimeError(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v18

    throw v18

    .line 2808
    :cond_12a
    move-object/from16 v0, p8

    iget v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    goto :goto_10d

    .line 2814
    :cond_133
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput-boolean v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 2816
    move-object/from16 v0, p7

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    .line 2817
    move-object/from16 v0, p9

    iput-object v9, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 2819
    move-object/from16 v0, p9

    iput-object v13, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 2820
    move-object/from16 v0, p9

    iput-object v14, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    .line 2821
    move-object/from16 v0, p9

    iput-object v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    .line 2822
    move-object/from16 v0, p9

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2823
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxVars:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    .line 2824
    move-object/from16 v0, p9

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->emptyStackTop:I

    .line 2826
    move-object/from16 v0, p9

    iput-object v4, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    .line 2827
    move/from16 v0, v16

    move-object/from16 v1, p9

    iput-boolean v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    .line 2829
    move-object/from16 v0, p2

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->thisObj:Lorg/mozilla/javascript/Scriptable;

    .line 2833
    sget-object v18, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    move-object/from16 v0, v18

    move-object/from16 v1, p9

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 2834
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2835
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    .line 2836
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->firstLinePC:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    .line 2837
    move-object/from16 v0, p9

    iput-object v12, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 2839
    move-object/from16 v0, p9

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2840
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p9

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 2842
    const/16 v18, 0x0

    move-object/from16 v0, p3

    move/from16 v1, p5

    move/from16 v2, v18

    invoke-static {v0, v1, v13, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2843
    if-eqz p4, :cond_1bf

    .line 2844
    const/16 v18, 0x0

    move-object/from16 v0, p4

    move/from16 v1, p5

    move/from16 v2, v18

    invoke-static {v0, v1, v11, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2846
    :cond_1bf
    move v8, v5

    :goto_1c0
    iget v0, v9, Lorg/mozilla/javascript/InterpreterData;->itsMaxVars:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-eq v8, v0, :cond_1cf

    .line 2847
    sget-object v18, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    aput-object v18, v13, v8

    .line 2846
    add-int/lit8 v8, v8, 0x1

    goto :goto_1c0

    .line 2849
    :cond_1cf
    if-eqz v15, :cond_1e1

    .line 2852
    add-int/lit8 v8, v6, 0x1

    :goto_1d3
    array-length v0, v13

    move/from16 v18, v0

    move/from16 v0, v18

    if-eq v8, v0, :cond_1e1

    .line 2853
    const/16 v18, 0x0

    aput-object v18, v13, v8

    .line 2852
    add-int/lit8 v8, v8, 0x1

    goto :goto_1d3

    .line 2857
    :cond_1e1
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p9

    move-object/from16 v2, p3

    move/from16 v3, v18

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/Interpreter;->enterFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    .line 2858
    return-void
.end method

.method private static initFrameForApplyOrCall(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/InterpretedFunction;)Lorg/mozilla/javascript/Interpreter$CallFrame;
    .registers 34
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "indexReg"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I
    .param p6, "op"    # I
    .param p7, "calleeScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p8, "ifun"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p9, "iApplyCallable"    # Lorg/mozilla/javascript/InterpretedFunction;

    .prologue
    .line 2677
    if-eqz p2, :cond_5e

    .line 2678
    add-int/lit8 v2, p5, 0x2

    aget-object v23, p3, v2

    .line 2679
    .local v23, "obj":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    move-object/from16 v0, v23

    if-ne v0, v2, :cond_14

    .line 2680
    add-int/lit8 v2, p5, 0x2

    aget-wide v2, p4, v2

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v23

    .line 2681
    .end local v23    # "obj":Ljava/lang/Object;
    :cond_14
    move-object/from16 v0, p1

    iget-object v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 2686
    .local v4, "applyThis":Lorg/mozilla/javascript/Scriptable;
    :goto_20
    if-nez v4, :cond_26

    .line 2688
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->getTopCallScope(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v4

    .line 2690
    :cond_26
    const/16 v2, -0x37

    move/from16 v0, p6

    if-ne v0, v2, :cond_60

    .line 2691
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2692
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 p1, v0

    .line 2698
    :goto_3a
    new-instance v11, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v2, 0x0

    invoke-direct {v11, v2}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 2699
    .local v11, "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    invoke-static/range {p8 .. p8}, Lorg/mozilla/javascript/BaseFunction;->isApply(Lorg/mozilla/javascript/IdFunctionObject;)Z

    move-result v2

    if-eqz v2, :cond_78

    .line 2700
    const/4 v2, 0x2

    move/from16 v0, p2

    if-ge v0, v2, :cond_6d

    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    .line 2702
    .local v5, "callArgs":[Ljava/lang/Object;
    :goto_4d
    const/4 v6, 0x0

    const/4 v7, 0x0

    array-length v8, v5

    move-object/from16 v2, p0

    move-object/from16 v3, p7

    move-object/from16 v9, p9

    move-object/from16 v10, p1

    invoke-static/range {v2 .. v11}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 2716
    .end local v5    # "callArgs":[Ljava/lang/Object;
    :goto_5b
    move-object/from16 p1, v11

    .line 2717
    return-object p1

    .line 2684
    .end local v4    # "applyThis":Lorg/mozilla/javascript/Scriptable;
    .end local v11    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :cond_5e
    const/4 v4, 0x0

    .restart local v4    # "applyThis":Lorg/mozilla/javascript/Scriptable;
    goto :goto_20

    .line 2695
    :cond_60
    move/from16 v0, p5

    move-object/from16 v1, p1

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2696
    move/from16 v0, p6

    move-object/from16 v1, p1

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    goto :goto_3a

    .line 2700
    .restart local v11    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :cond_6d
    add-int/lit8 v2, p5, 0x3

    aget-object v2, p3, v2

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lorg/mozilla/javascript/ScriptRuntime;->getApplyArguments(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    goto :goto_4d

    .line 2707
    :cond_78
    const/16 v22, 0x1

    .local v22, "i":I
    :goto_7a
    move/from16 v0, v22

    move/from16 v1, p2

    if-ge v0, v1, :cond_9b

    .line 2708
    add-int/lit8 v2, p5, 0x1

    add-int v2, v2, v22

    add-int/lit8 v3, p5, 0x2

    add-int v3, v3, v22

    aget-object v3, p3, v3

    aput-object v3, p3, v2

    .line 2709
    add-int/lit8 v2, p5, 0x1

    add-int v2, v2, v22

    add-int/lit8 v3, p5, 0x2

    add-int v3, v3, v22

    aget-wide v6, p4, v3

    aput-wide v6, p4, v2

    .line 2707
    add-int/lit8 v22, v22, 0x1

    goto :goto_7a

    .line 2711
    :cond_9b
    const/4 v2, 0x2

    move/from16 v0, p2

    if-ge v0, v2, :cond_b7

    const/16 v18, 0x0

    .line 2712
    .local v18, "argCount":I
    :goto_a2
    add-int/lit8 v17, p5, 0x2

    move-object/from16 v12, p0

    move-object/from16 v13, p7

    move-object v14, v4

    move-object/from16 v15, p3

    move-object/from16 v16, p4

    move-object/from16 v19, p9

    move-object/from16 v20, p1

    move-object/from16 v21, v11

    invoke-static/range {v12 .. v21}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    goto :goto_5b

    .line 2711
    .end local v18    # "argCount":I
    :cond_b7
    add-int/lit8 v18, p2, -0x1

    goto :goto_a2
.end method

.method private static initFrameForNoSuchMethod(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;Lorg/mozilla/javascript/InterpretedFunction;)Lorg/mozilla/javascript/Interpreter$CallFrame;
    .registers 27
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "indexReg"    # I
    .param p3, "stack"    # [Ljava/lang/Object;
    .param p4, "sDbl"    # [D
    .param p5, "stackTop"    # I
    .param p6, "op"    # I
    .param p7, "funThisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p8, "calleeScope"    # Lorg/mozilla/javascript/Scriptable;
    .param p9, "noSuchMethodShim"    # Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;
    .param p10, "ifun"    # Lorg/mozilla/javascript/InterpretedFunction;

    .prologue
    .line 2449
    const/4 v5, 0x0

    .line 2452
    .local v5, "argsArray":[Ljava/lang/Object;
    add-int/lit8 v14, p5, 0x2

    .line 2453
    .local v14, "shift":I
    move/from16 v0, p2

    new-array v12, v0, [Ljava/lang/Object;

    .line 2454
    .local v12, "elements":[Ljava/lang/Object;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_8
    move/from16 v0, p2

    if-ge v13, v0, :cond_1f

    .line 2455
    aget-object v15, p3, v14

    .line 2456
    .local v15, "val":Ljava/lang/Object;
    sget-object v2, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v15, v2, :cond_18

    .line 2457
    aget-wide v2, p4, v14

    invoke-static {v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v15

    .line 2459
    .end local v15    # "val":Ljava/lang/Object;
    :cond_18
    aput-object v15, v12, v13

    .line 2454
    add-int/lit8 v13, v13, 0x1

    add-int/lit8 v14, v14, 0x1

    goto :goto_8

    .line 2461
    :cond_1f
    const/4 v2, 0x2

    new-array v5, v2, [Ljava/lang/Object;

    .line 2462
    const/4 v2, 0x0

    move-object/from16 v0, p9

    iget-object v3, v0, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;->methodName:Ljava/lang/String;

    aput-object v3, v5, v2

    .line 2463
    const/4 v2, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-virtual {v0, v1, v12}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v3

    aput-object v3, v5, v2

    .line 2466
    move-object/from16 v10, p1

    .line 2467
    .local v10, "callParentFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    new-instance v11, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v2, 0x0

    invoke-direct {v11, v2}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 2468
    .local v11, "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    const/16 v2, -0x37

    move/from16 v0, p6

    if-ne v0, v2, :cond_4e

    .line 2469
    move-object/from16 v0, p1

    iget-object v10, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2470
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2474
    :cond_4e
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x2

    move-object/from16 v2, p0

    move-object/from16 v3, p8

    move-object/from16 v4, p7

    move-object/from16 v9, p10

    invoke-static/range {v2 .. v11}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 2476
    const/16 v2, -0x37

    move/from16 v0, p6

    if-eq v0, v2, :cond_6e

    .line 2477
    move/from16 v0, p5

    move-object/from16 v1, p1

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2478
    move/from16 v0, p6

    move-object/from16 v1, p1

    iput v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 2480
    :cond_6e
    return-object v11
.end method

.method private static initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)V
    .registers 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "parent"    # Lorg/mozilla/javascript/InterpretedFunction;
    .param p3, "index"    # I

    .prologue
    .line 787
    invoke-static {p0, p1, p2, p3}, Lorg/mozilla/javascript/InterpretedFunction;->createFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)Lorg/mozilla/javascript/InterpretedFunction;

    move-result-object v0

    .line 788
    .local v0, "fn":Lorg/mozilla/javascript/InterpretedFunction;
    iget-object v1, v0, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget v1, v1, Lorg/mozilla/javascript/InterpreterData;->itsFunctionType:I

    iget-object v2, p2, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v2, v2, Lorg/mozilla/javascript/InterpreterData;->evalScriptFlag:Z

    invoke-static {p0, p1, v0, v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/NativeFunction;IZ)V

    .line 790
    return-void
.end method

.method static interpret(Lorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16
    .param p0, "ifun"    # Lorg/mozilla/javascript/InterpretedFunction;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 796
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->hasTopCall(Lorg/mozilla/javascript/Context;)Z

    move-result v0

    if-nez v0, :cond_b

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 798
    :cond_b
    iget-object v0, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    iget-object v1, p0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-eq v0, v1, :cond_2b

    .line 799
    iget-object v10, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 800
    .local v10, "savedDomain":Ljava/lang/Object;
    iget-object v0, p0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    iput-object v0, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 802
    :try_start_17
    iget-object v0, p0, Lorg/mozilla/javascript/InterpretedFunction;->securityController:Lorg/mozilla/javascript/SecurityController;

    iget-object v1, p0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object v2, p1

    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lorg/mozilla/javascript/SecurityController;->callWithDomain(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catchall {:try_start_17 .. :try_end_23} :catchall_27

    move-result-object v0

    .line 805
    iput-object v10, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    .line 815
    .end local v10    # "savedDomain":Ljava/lang/Object;
    :goto_26
    return-object v0

    .line 805
    .restart local v10    # "savedDomain":Ljava/lang/Object;
    :catchall_27
    move-exception v0

    iput-object v10, p1, Lorg/mozilla/javascript/Context;->interpreterSecurityDomain:Ljava/lang/Object;

    throw v0

    .line 809
    .end local v10    # "savedDomain":Ljava/lang/Object;
    :cond_2b
    new-instance v9, Lorg/mozilla/javascript/Interpreter$CallFrame;

    invoke-direct {v9, v4}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 810
    .local v9, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    array-length v6, p4

    move-object v0, p1

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v7, p0

    move-object v8, v4

    invoke-static/range {v0 .. v9}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 812
    iget-boolean v0, p1, Lorg/mozilla/javascript/Context;->isContinuationsTopCall:Z

    iput-boolean v0, v9, Lorg/mozilla/javascript/Interpreter$CallFrame;->isContinuationsTopFrame:Z

    .line 813
    iput-boolean v5, p1, Lorg/mozilla/javascript/Context;->isContinuationsTopCall:Z

    .line 815
    invoke-static {p1, v9, v4}, Lorg/mozilla/javascript/Interpreter;->interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_26
.end method

.method private static interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 115
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p2, "throwable"    # Ljava/lang/Object;

    .prologue
    .line 885
    sget-object v54, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    .line 886
    .local v54, "DBL_MRK":Lorg/mozilla/javascript/UniqueTag;
    sget-object v106, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 888
    .local v106, "undefined":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget v5, v0, Lorg/mozilla/javascript/Context;->instructionThreshold:I

    if-eqz v5, :cond_f8

    const/16 v78, 0x1

    .line 891
    .local v78, "instructionCounting":Z
    :goto_c
    const/16 v59, 0x64

    .line 893
    .local v59, "INVOCATION_COST":I
    const/16 v55, 0x64

    .line 895
    .local v55, "EXCEPTION_COST":I
    const/16 v104, 0x0

    .line 896
    .local v104, "stringReg":Ljava/lang/String;
    const/16 v20, -0x1

    .line 898
    .local v20, "indexReg":I
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-eqz v5, :cond_34

    .line 901
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    if-nez v5, :cond_29

    .line 902
    new-instance v5, Lorg/mozilla/javascript/ObjArray;

    invoke-direct {v5}, Lorg/mozilla/javascript/ObjArray;-><init>()V

    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    .line 904
    :cond_29
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/ObjArray;->push(Ljava/lang/Object;)V

    .line 914
    :cond_34
    const/16 v73, 0x0

    .line 915
    .local v73, "generatorState":Lorg/mozilla/javascript/Interpreter$GeneratorState;
    if-eqz p2, :cond_4e

    .line 916
    move-object/from16 v0, p2

    instance-of v5, v0, Lorg/mozilla/javascript/Interpreter$GeneratorState;

    if-eqz v5, :cond_fc

    move-object/from16 v73, p2

    .line 917
    check-cast v73, Lorg/mozilla/javascript/Interpreter$GeneratorState;

    .line 920
    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    const/4 v6, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v5, v6}, Lorg/mozilla/javascript/Interpreter;->enterFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    .line 921
    const/16 p2, 0x0

    .line 928
    .end local p2    # "throwable":Ljava/lang/Object;
    :cond_4e
    :goto_4e
    const/16 v79, 0x0

    .line 929
    .local v79, "interpreterResult":Ljava/lang/Object;
    const-wide/16 v80, 0x0

    .local v80, "interpreterResultDbl":D
    move-object/from16 v111, p2

    .line 934
    .end local v79    # "interpreterResult":Ljava/lang/Object;
    :goto_54
    if-eqz v111, :cond_107

    .line 938
    :try_start_56
    move-object/from16 v0, p0

    move-object/from16 v1, v111

    move-object/from16 v2, p1

    move/from16 v3, v20

    move/from16 v4, v78

    invoke-static {v0, v1, v2, v3, v4}, Lorg/mozilla/javascript/Interpreter;->processThrowable(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Interpreter$CallFrame;IZ)Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p1

    .line 940
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->throwable:Ljava/lang/Object;

    move-object/from16 p2, v0
    :try_end_6a
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_6a} :catch_e8

    .line 941
    .restart local p2    # "throwable":Ljava/lang/Object;
    const/4 v5, 0x0

    :try_start_6b
    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->throwable:Ljava/lang/Object;
    :try_end_6f
    .catch Ljava/lang/Throwable; {:try_start_6b .. :try_end_6f} :catch_fab

    move-object/from16 v111, p2

    .line 948
    .end local p2    # "throwable":Ljava/lang/Object;
    :cond_71
    :goto_71
    :try_start_71
    move-object/from16 v0, p1

    iget-object v8, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 949
    .local v8, "stack":[Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    .line 950
    .local v9, "sDbl":[D
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-object v0, v5, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v28, v0

    .line 951
    .local v28, "vars":[Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-object v0, v5, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    move-object/from16 v29, v0

    .line 952
    .local v29, "varDbls":[D
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-object v0, v5, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    move-object/from16 v30, v0

    .line 953
    .local v30, "varAttributes":[I
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v13, v5, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    .line 954
    .local v13, "iCode":[B
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v0, v5, Lorg/mozilla/javascript/InterpreterData;->itsStringTable:[Ljava/lang/String;

    move-object/from16 v105, v0

    .line 960
    .local v105, "strings":[Ljava/lang/String;
    move-object/from16 v0, p1

    iget v10, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 963
    .local v10, "stackTop":I
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 970
    :cond_a9
    :goto_a9
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v7, v13, v5

    .line 974
    .local v7, "op":I
    packed-switch v7, :pswitch_data_fb8

    .line 1890
    :pswitch_b8
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    invoke-static {v5}, Lorg/mozilla/javascript/Interpreter;->dumpICode(Lorg/mozilla/javascript/InterpreterData;)V

    .line 1891
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unknown icode : "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, " @ pc : "

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    iget v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_e8
    .catch Ljava/lang/Throwable; {:try_start_71 .. :try_end_e8} :catch_e8

    .line 1933
    .end local v7    # "op":I
    .end local v8    # "stack":[Ljava/lang/Object;
    .end local v9    # "sDbl":[D
    .end local v10    # "stackTop":I
    .end local v13    # "iCode":[B
    .end local v28    # "vars":[Ljava/lang/Object;
    .end local v29    # "varDbls":[D
    .end local v30    # "varAttributes":[I
    .end local v105    # "strings":[Ljava/lang/String;
    :catch_e8
    move-exception v68

    .line 1934
    .local v68, "ex":Ljava/lang/Throwable;
    :goto_e9
    if-eqz v111, :cond_eac

    .line 1936
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v68

    invoke-virtual {v0, v5}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 1937
    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    throw v5

    .line 888
    .end local v20    # "indexReg":I
    .end local v55    # "EXCEPTION_COST":I
    .end local v59    # "INVOCATION_COST":I
    .end local v68    # "ex":Ljava/lang/Throwable;
    .end local v73    # "generatorState":Lorg/mozilla/javascript/Interpreter$GeneratorState;
    .end local v78    # "instructionCounting":Z
    .end local v80    # "interpreterResultDbl":D
    .end local v104    # "stringReg":Ljava/lang/String;
    .restart local p2    # "throwable":Ljava/lang/Object;
    :cond_f8
    const/16 v78, 0x0

    goto/16 :goto_c

    .line 922
    .restart local v20    # "indexReg":I
    .restart local v55    # "EXCEPTION_COST":I
    .restart local v59    # "INVOCATION_COST":I
    .restart local v73    # "generatorState":Lorg/mozilla/javascript/Interpreter$GeneratorState;
    .restart local v78    # "instructionCounting":Z
    .restart local v104    # "stringReg":Ljava/lang/String;
    :cond_fc
    move-object/from16 v0, p2

    instance-of v5, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    if-nez v5, :cond_4e

    .line 924
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto/16 :goto_4e

    .line 943
    .end local p2    # "throwable":Ljava/lang/Object;
    .restart local v80    # "interpreterResultDbl":D
    :cond_107
    if-nez v73, :cond_71

    :try_start_109
    move-object/from16 v0, p1

    iget-boolean v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-eqz v5, :cond_71

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto/16 :goto_71

    .line 976
    .restart local v7    # "op":I
    .restart local v8    # "stack":[Ljava/lang/Object;
    .restart local v9    # "sDbl":[D
    .restart local v10    # "stackTop":I
    .restart local v13    # "iCode":[B
    .restart local v28    # "vars":[Ljava/lang/Object;
    .restart local v29    # "varDbls":[D
    .restart local v30    # "varAttributes":[I
    .restart local v105    # "strings":[Ljava/lang/String;
    :pswitch_114
    move-object/from16 v0, p1

    iget-boolean v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v5, :cond_17b

    .line 979
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 980
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/Interpreter;->captureFrameForGenerator(Lorg/mozilla/javascript/Interpreter$CallFrame;)Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object v72

    .line 981
    .local v72, "generatorFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    const/4 v5, 0x1

    move-object/from16 v0, v72

    iput-boolean v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 982
    new-instance v71, Lorg/mozilla/javascript/NativeGenerator;

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v72

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v0, v71

    move-object/from16 v1, v72

    invoke-direct {v0, v5, v6, v1}, Lorg/mozilla/javascript/NativeGenerator;-><init>(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/NativeFunction;Ljava/lang/Object;)V

    .line 984
    .local v71, "generator":Lorg/mozilla/javascript/NativeGenerator;
    move-object/from16 v0, v71

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1917
    .end local v71    # "generator":Lorg/mozilla/javascript/NativeGenerator;
    .end local v72    # "generatorFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_144
    :pswitch_144
    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v5}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 1918
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    move-object/from16 v79, v0

    .line 1919
    .restart local v79    # "interpreterResult":Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-wide v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    move-wide/from16 v80, v0

    .line 1920
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v5, :cond_e85

    .line 1921
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 p1, v0

    .line 1922
    move-object/from16 v0, p1

    iget-boolean v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-eqz v5, :cond_16e

    .line 1923
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/Interpreter$CallFrame;->cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p1

    .line 1925
    :cond_16e
    move-object/from16 v0, p1

    move-object/from16 v1, v79

    move-wide/from16 v2, v80

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/Interpreter;->setCallResult(Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;D)V

    .line 1927
    const/16 v79, 0x0

    goto/16 :goto_54

    .line 992
    .end local v79    # "interpreterResult":Ljava/lang/Object;
    :cond_17b
    :pswitch_17b
    move-object/from16 v0, p1

    iget-boolean v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v5, :cond_18c

    .line 993
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v73

    invoke-static {v0, v1, v10, v2}, Lorg/mozilla/javascript/Interpreter;->freezeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;ILorg/mozilla/javascript/Interpreter$GeneratorState;)Ljava/lang/Object;

    move-result-object v79

    .line 2086
    .end local v7    # "op":I
    .end local v8    # "stack":[Ljava/lang/Object;
    .end local v9    # "sDbl":[D
    .end local v10    # "stackTop":I
    .end local v13    # "iCode":[B
    .end local v28    # "vars":[Ljava/lang/Object;
    .end local v29    # "varDbls":[D
    .end local v30    # "varAttributes":[I
    .end local v105    # "strings":[Ljava/lang/String;
    :cond_18b
    :goto_18b
    return-object v79

    .line 995
    .restart local v7    # "op":I
    .restart local v8    # "stack":[Ljava/lang/Object;
    .restart local v9    # "sDbl":[D
    .restart local v10    # "stackTop":I
    .restart local v13    # "iCode":[B
    .restart local v28    # "vars":[Ljava/lang/Object;
    .restart local v29    # "varDbls":[D
    .restart local v30    # "varAttributes":[I
    .restart local v105    # "strings":[Ljava/lang/String;
    :cond_18c
    move-object/from16 v0, p1

    move-object/from16 v1, v73

    invoke-static {v0, v10, v1, v7}, Lorg/mozilla/javascript/Interpreter;->thawGenerator(Lorg/mozilla/javascript/Interpreter$CallFrame;ILorg/mozilla/javascript/Interpreter$GeneratorState;I)Ljava/lang/Object;

    move-result-object v90

    .line 996
    .local v90, "obj":Ljava/lang/Object;
    sget-object v5, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;
    :try_end_196
    .catch Ljava/lang/Throwable; {:try_start_109 .. :try_end_196} :catch_e8

    move-object/from16 v0, v90

    if-eq v0, v5, :cond_a9

    .line 997
    move-object/from16 p2, v90

    .line 1945
    .end local v7    # "op":I
    .end local v8    # "stack":[Ljava/lang/Object;
    .end local v9    # "sDbl":[D
    .end local v10    # "stackTop":I
    .end local v13    # "iCode":[B
    .end local v28    # "vars":[Ljava/lang/Object;
    .end local v29    # "varDbls":[D
    .end local v30    # "varAttributes":[I
    .end local v90    # "obj":Ljava/lang/Object;
    .end local v105    # "strings":[Ljava/lang/String;
    :goto_19c
    if-nez p2, :cond_1a1

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 1948
    :cond_1a1
    const/16 v56, 0x2

    .line 1949
    .local v56, "EX_CATCH_STATE":I
    const/16 v57, 0x1

    .line 1950
    .local v57, "EX_FINALLY_STATE":I
    const/16 v58, 0x0

    .line 1953
    .local v58, "EX_NO_JS_STATE":I
    const/16 v63, 0x0

    .line 1955
    .local v63, "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    if-eqz v73, :cond_eb0

    move-object/from16 v0, v73

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    const/4 v6, 0x2

    if-ne v5, v6, :cond_eb0

    move-object/from16 v0, v73

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    move-object/from16 v0, p2

    if-ne v0, v5, :cond_eb0

    .line 1959
    const/16 v69, 0x1

    .line 1987
    .local v69, "exState":I
    :goto_1bc
    if-eqz v78, :cond_fb4

    .line 1989
    const/16 v5, 0x64

    :try_start_1c0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v5}, Lorg/mozilla/javascript/Interpreter;->addInstructionCount(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I)V
    :try_end_1c7
    .catch Ljava/lang/RuntimeException; {:try_start_1c0 .. :try_end_1c7} :catch_f25
    .catch Ljava/lang/Error; {:try_start_1c0 .. :try_end_1c7} :catch_f2e

    move-object/from16 v5, p2

    .line 2001
    :goto_1c9
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v6, :cond_1e2

    instance-of v6, v5, Ljava/lang/RuntimeException;

    if-eqz v6, :cond_1e2

    move-object/from16 v99, v5

    .line 2005
    check-cast v99, Ljava/lang/RuntimeException;

    .line 2007
    .local v99, "rex":Ljava/lang/RuntimeException;
    :try_start_1d7
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    move-object/from16 v0, p0

    move-object/from16 v1, v99

    invoke-interface {v6, v0, v1}, Lorg/mozilla/javascript/debug/DebugFrame;->onExceptionThrown(Lorg/mozilla/javascript/Context;Ljava/lang/Throwable;)V
    :try_end_1e2
    .catch Ljava/lang/Throwable; {:try_start_1d7 .. :try_end_1e2} :catch_f39

    .line 2018
    .end local v99    # "rex":Ljava/lang/RuntimeException;
    :cond_1e2
    :goto_1e2
    if-eqz v69, :cond_f48

    .line 2019
    const/4 v6, 0x2

    move/from16 v0, v69

    if-eq v0, v6, :cond_f44

    const/16 v92, 0x1

    .line 2020
    .local v92, "onlyFinally":Z
    :goto_1eb
    move-object/from16 v0, p1

    move/from16 v1, v92

    invoke-static {v0, v1}, Lorg/mozilla/javascript/Interpreter;->getExceptionHandler(Lorg/mozilla/javascript/Interpreter$CallFrame;Z)I

    move-result v20

    .line 2021
    if-ltz v20, :cond_f48

    move-object/from16 v111, v5

    .line 2025
    goto/16 :goto_54

    .line 1005
    .end local v56    # "EX_CATCH_STATE":I
    .end local v57    # "EX_FINALLY_STATE":I
    .end local v58    # "EX_NO_JS_STATE":I
    .end local v63    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    .end local v69    # "exState":I
    .end local v92    # "onlyFinally":Z
    .restart local v7    # "op":I
    .restart local v8    # "stack":[Ljava/lang/Object;
    .restart local v9    # "sDbl":[D
    .restart local v10    # "stackTop":I
    .restart local v13    # "iCode":[B
    .restart local v28    # "vars":[Ljava/lang/Object;
    .restart local v29    # "varDbls":[D
    .restart local v30    # "varAttributes":[I
    .restart local v105    # "strings":[Ljava/lang/String;
    :pswitch_1f9
    const/4 v5, 0x1

    :try_start_1fa
    move-object/from16 v0, p1

    iput-boolean v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 1006
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v102

    .line 1007
    .local v102, "sourceLine":I
    new-instance v5, Lorg/mozilla/javascript/JavaScriptException;

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v6}, Lorg/mozilla/javascript/NativeIterator;->getStopIterationObject(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, p1

    iget-object v11, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v11, v11, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    move/from16 v0, v102

    invoke-direct {v5, v6, v11, v0}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    move-object/from16 v0, v73

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    goto/16 :goto_144

    .line 1013
    .end local v102    # "sourceLine":I
    :pswitch_221
    aget-object v109, v8, v10

    .line 1014
    .local v109, "value":Ljava/lang/Object;
    move-object/from16 v0, v109

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_22f

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v109

    .line 1015
    .end local v109    # "value":Ljava/lang/Object;
    :cond_22f
    add-int/lit8 v10, v10, -0x1

    .line 1017
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v102

    .line 1018
    .restart local v102    # "sourceLine":I
    new-instance p2, Lorg/mozilla/javascript/JavaScriptException;

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    move-object/from16 v0, p2

    move-object/from16 v1, v109

    move/from16 v2, v102

    invoke-direct {v0, v1, v5, v2}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    .local p2, "throwable":Lorg/mozilla/javascript/JavaScriptException;
    goto/16 :goto_19c

    .line 1024
    .end local v102    # "sourceLine":I
    .end local p2    # "throwable":Lorg/mozilla/javascript/JavaScriptException;
    :pswitch_24c
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1025
    aget-object p2, v8, v20

    .local p2, "throwable":Ljava/lang/Object;
    goto/16 :goto_19c

    .line 1032
    .end local p2    # "throwable":Ljava/lang/Object;
    :pswitch_256
    move-object/from16 v0, p1

    invoke-static {v0, v7, v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->doCompare(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1033
    goto/16 :goto_a9

    .line 1037
    :pswitch_25e
    move-object/from16 v0, p0

    invoke-static {v0, v7, v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->doInOrInstanceof(Lorg/mozilla/javascript/Context;I[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1038
    goto/16 :goto_a9

    .line 1042
    :pswitch_266
    add-int/lit8 v10, v10, -0x1

    .line 1043
    invoke-static {v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->doEquals([Ljava/lang/Object;[DI)Z

    move-result v108

    .line 1044
    .local v108, "valBln":Z
    const/16 v5, 0xd

    if-ne v7, v5, :cond_27b

    const/4 v5, 0x1

    :goto_271
    xor-int v108, v108, v5

    .line 1045
    invoke-static/range {v108 .. v108}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1044
    :cond_27b
    const/4 v5, 0x0

    goto :goto_271

    .line 1050
    .end local v108    # "valBln":Z
    :pswitch_27d
    add-int/lit8 v10, v10, -0x1

    .line 1051
    invoke-static {v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->doShallowEquals([Ljava/lang/Object;[DI)Z

    move-result v108

    .line 1052
    .restart local v108    # "valBln":Z
    const/16 v5, 0x2f

    if-ne v7, v5, :cond_292

    const/4 v5, 0x1

    :goto_288
    xor-int v108, v108, v5

    .line 1053
    invoke-static/range {v108 .. v108}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1052
    :cond_292
    const/4 v5, 0x0

    goto :goto_288

    .line 1057
    .end local v108    # "valBln":Z
    :pswitch_294
    add-int/lit8 v103, v10, -0x1

    .end local v10    # "stackTop":I
    .local v103, "stackTop":I
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v5

    if-eqz v5, :cond_fb0

    .line 1058
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move/from16 v10, v103

    .line 1059
    .end local v103    # "stackTop":I
    .restart local v10    # "stackTop":I
    goto/16 :goto_a9

    .line 1063
    :pswitch_2ac
    add-int/lit8 v103, v10, -0x1

    .end local v10    # "stackTop":I
    .restart local v103    # "stackTop":I
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v5

    if-nez v5, :cond_fb0

    .line 1064
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move/from16 v10, v103

    .line 1065
    .end local v103    # "stackTop":I
    .restart local v10    # "stackTop":I
    goto/16 :goto_a9

    .line 1069
    :pswitch_2c4
    add-int/lit8 v103, v10, -0x1

    .end local v10    # "stackTop":I
    .restart local v103    # "stackTop":I
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v5

    if-nez v5, :cond_2dc

    .line 1070
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move/from16 v10, v103

    .line 1071
    .end local v103    # "stackTop":I
    .restart local v10    # "stackTop":I
    goto/16 :goto_a9

    .line 1073
    .end local v10    # "stackTop":I
    .restart local v103    # "stackTop":I
    :cond_2dc
    add-int/lit8 v10, v103, -0x1

    .end local v103    # "stackTop":I
    .restart local v10    # "stackTop":I
    const/4 v5, 0x0

    aput-object v5, v8, v103

    .line 1899
    :goto_2e1
    :pswitch_2e1
    if-eqz v78, :cond_2eb

    .line 1900
    const/4 v5, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v5}, Lorg/mozilla/javascript/Interpreter;->addInstructionCount(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I)V

    .line 1902
    :cond_2eb
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getShort([BI)I

    move-result v91

    .line 1903
    .local v91, "offset":I
    if-eqz v91, :cond_e71

    .line 1905
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v91, -0x1

    add-int/2addr v5, v6

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 1910
    :goto_300
    if-eqz v78, :cond_a9

    .line 1911
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    goto/16 :goto_a9

    .line 1078
    .end local v91    # "offset":I
    :pswitch_30c
    add-int/lit8 v10, v10, 0x1

    .line 1079
    aput-object v54, v8, v10

    .line 1080
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    int-to-double v5, v5

    aput-wide v5, v9, v10

    goto :goto_2e1

    .line 1083
    :pswitch_31a
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->emptyStackTop:I

    add-int/lit8 v5, v5, 0x1

    if-ne v10, v5, :cond_334

    .line 1085
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1086
    aget-object v5, v8, v10

    aput-object v5, v8, v20

    .line 1087
    aget-wide v5, v9, v10

    aput-wide v5, v9, v20

    .line 1088
    add-int/lit8 v10, v10, -0x1

    goto/16 :goto_a9

    .line 1092
    :cond_334
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->emptyStackTop:I

    if-eq v10, v5, :cond_a9

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto/16 :goto_a9

    .line 1097
    :pswitch_33f
    if-eqz v78, :cond_349

    .line 1098
    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v5}, Lorg/mozilla/javascript/Interpreter;->addInstructionCount(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I)V

    .line 1100
    :cond_349
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1101
    aget-object v109, v8, v20

    .line 1102
    .restart local v109    # "value":Ljava/lang/Object;
    move-object/from16 v0, v109

    move-object/from16 v1, v54

    if-eq v0, v1, :cond_35b

    .line 1104
    move-object/from16 p2, v109

    .restart local p2    # "throwable":Ljava/lang/Object;
    goto/16 :goto_19c

    .line 1108
    .end local p2    # "throwable":Ljava/lang/Object;
    :cond_35b
    aget-wide v5, v9, v20

    double-to-int v5, v5

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 1109
    if-eqz v78, :cond_a9

    .line 1110
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    goto/16 :goto_a9

    .line 1115
    .end local v109    # "value":Ljava/lang/Object;
    :pswitch_36e
    const/4 v5, 0x0

    aput-object v5, v8, v10

    .line 1116
    add-int/lit8 v10, v10, -0x1

    .line 1117
    goto/16 :goto_a9

    .line 1119
    :pswitch_375
    aget-object v5, v8, v10

    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1120
    aget-wide v5, v9, v10

    move-object/from16 v0, p1

    iput-wide v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    .line 1121
    const/4 v5, 0x0

    aput-object v5, v8, v10

    .line 1122
    add-int/lit8 v10, v10, -0x1

    .line 1123
    goto/16 :goto_a9

    .line 1125
    :pswitch_388
    add-int/lit8 v5, v10, 0x1

    aget-object v6, v8, v10

    aput-object v6, v8, v5

    .line 1126
    add-int/lit8 v5, v10, 0x1

    aget-wide v11, v9, v10

    aput-wide v11, v9, v5

    .line 1127
    add-int/lit8 v10, v10, 0x1

    .line 1128
    goto/16 :goto_a9

    .line 1130
    :pswitch_398
    add-int/lit8 v5, v10, 0x1

    add-int/lit8 v6, v10, -0x1

    aget-object v6, v8, v6

    aput-object v6, v8, v5

    .line 1131
    add-int/lit8 v5, v10, 0x1

    add-int/lit8 v6, v10, -0x1

    aget-wide v11, v9, v6

    aput-wide v11, v9, v5

    .line 1132
    add-int/lit8 v5, v10, 0x2

    aget-object v6, v8, v10

    aput-object v6, v8, v5

    .line 1133
    add-int/lit8 v5, v10, 0x2

    aget-wide v11, v9, v10

    aput-wide v11, v9, v5

    .line 1134
    add-int/lit8 v10, v10, 0x2

    .line 1135
    goto/16 :goto_a9

    .line 1137
    :pswitch_3b8
    aget-object v89, v8, v10

    .line 1138
    .local v89, "o":Ljava/lang/Object;
    add-int/lit8 v5, v10, -0x1

    aget-object v5, v8, v5

    aput-object v5, v8, v10

    .line 1139
    add-int/lit8 v5, v10, -0x1

    aput-object v89, v8, v5

    .line 1140
    aget-wide v64, v9, v10

    .line 1141
    .local v64, "d":D
    add-int/lit8 v5, v10, -0x1

    aget-wide v5, v9, v5

    aput-wide v5, v9, v10

    .line 1142
    add-int/lit8 v5, v10, -0x1

    aput-wide v64, v9, v5

    goto/16 :goto_a9

    .line 1146
    .end local v64    # "d":D
    .end local v89    # "o":Ljava/lang/Object;
    :pswitch_3d2
    aget-object v5, v8, v10

    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    .line 1147
    aget-wide v5, v9, v10

    move-object/from16 v0, p1

    iput-wide v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->resultDbl:D

    .line 1148
    add-int/lit8 v10, v10, -0x1

    .line 1149
    goto/16 :goto_144

    .line 1153
    :pswitch_3e2
    move-object/from16 v0, v106

    move-object/from16 v1, p1

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->result:Ljava/lang/Object;

    goto/16 :goto_144

    .line 1156
    :pswitch_3ea
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lorg/mozilla/javascript/Interpreter;->stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I

    move-result v96

    .line 1157
    .local v96, "rIntValue":I
    aput-object v54, v8, v10

    .line 1158
    xor-int/lit8 v5, v96, -0x1

    int-to-double v5, v5

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1166
    .end local v96    # "rIntValue":I
    :pswitch_3f9
    move-object/from16 v0, p1

    invoke-static {v0, v7, v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->doBitOp(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1167
    goto/16 :goto_a9

    .line 1170
    :pswitch_401
    add-int/lit8 v5, v10, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v82

    .line 1171
    .local v82, "lDbl":D
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lorg/mozilla/javascript/Interpreter;->stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I

    move-result v5

    and-int/lit8 v96, v5, 0x1f

    .line 1172
    .restart local v96    # "rIntValue":I
    add-int/lit8 v10, v10, -0x1

    aput-object v54, v8, v10

    .line 1173
    invoke-static/range {v82 .. v83}, Lorg/mozilla/javascript/ScriptRuntime;->toUint32(D)J

    move-result-wide v5

    ushr-long v5, v5, v96

    long-to-double v5, v5

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1178
    .end local v82    # "lDbl":D
    .end local v96    # "rIntValue":I
    :pswitch_420
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lorg/mozilla/javascript/Interpreter;->stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D

    move-result-wide v94

    .line 1179
    .local v94, "rDbl":D
    aput-object v54, v8, v10

    .line 1180
    const/16 v5, 0x1d

    if-ne v7, v5, :cond_431

    .line 1181
    move-wide/from16 v0, v94

    neg-double v0, v0

    move-wide/from16 v94, v0

    .line 1183
    :cond_431
    aput-wide v94, v9, v10

    goto/16 :goto_a9

    .line 1187
    .end local v94    # "rDbl":D
    :pswitch_435
    add-int/lit8 v10, v10, -0x1

    .line 1188
    move-object/from16 v0, p0

    invoke-static {v8, v9, v10, v0}, Lorg/mozilla/javascript/Interpreter;->doAdd([Ljava/lang/Object;[DILorg/mozilla/javascript/Context;)V

    goto/16 :goto_a9

    .line 1194
    :pswitch_43e
    move-object/from16 v0, p1

    invoke-static {v0, v7, v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->doArithmetic(Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1195
    goto/16 :goto_a9

    .line 1198
    :pswitch_446
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v5

    if-nez v5, :cond_457

    const/4 v5, 0x1

    :goto_44f
    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    :cond_457
    const/4 v5, 0x0

    goto :goto_44f

    .line 1202
    :pswitch_459
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-static {v0, v5, v1}, Lorg/mozilla/javascript/ScriptRuntime;->bind(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1206
    :pswitch_46b
    aget-object v100, v8, v10

    .line 1207
    .local v100, "rhs":Ljava/lang/Object;
    move-object/from16 v0, v100

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_479

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v100

    .line 1208
    .end local v100    # "rhs":Ljava/lang/Object;
    :cond_479
    add-int/lit8 v10, v10, -0x1

    .line 1209
    aget-object v85, v8, v10

    check-cast v85, Lorg/mozilla/javascript/Scriptable;

    .line 1210
    .local v85, "lhs":Lorg/mozilla/javascript/Scriptable;
    const/16 v5, 0x8

    if-ne v7, v5, :cond_497

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v85

    move-object/from16 v1, v100

    move-object/from16 v2, p0

    move-object/from16 v3, v104

    invoke-static {v0, v1, v2, v5, v3}, Lorg/mozilla/javascript/ScriptRuntime;->setName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    :goto_493
    aput-object v5, v8, v10

    goto/16 :goto_a9

    :cond_497
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v85

    move-object/from16 v1, v100

    move-object/from16 v2, p0

    move-object/from16 v3, v104

    invoke-static {v0, v1, v2, v5, v3}, Lorg/mozilla/javascript/ScriptRuntime;->strictSetName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_493

    .line 1218
    .end local v85    # "lhs":Lorg/mozilla/javascript/Scriptable;
    :pswitch_4a8
    aget-object v100, v8, v10

    .line 1219
    .restart local v100    # "rhs":Ljava/lang/Object;
    move-object/from16 v0, v100

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_4b6

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v100

    .line 1220
    .end local v100    # "rhs":Ljava/lang/Object;
    :cond_4b6
    add-int/lit8 v10, v10, -0x1

    .line 1221
    aget-object v85, v8, v10

    check-cast v85, Lorg/mozilla/javascript/Scriptable;

    .line 1222
    .restart local v85    # "lhs":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, v85

    move-object/from16 v1, v100

    move-object/from16 v2, p0

    move-object/from16 v3, v104

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->setConst(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .end local v85    # "lhs":Lorg/mozilla/javascript/Scriptable;
    :pswitch_4cc
    move-object/from16 v5, p0

    move-object/from16 v6, p1

    .line 1227
    invoke-static/range {v5 .. v10}, Lorg/mozilla/javascript/Interpreter;->doDelName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1228
    goto/16 :goto_a9

    .line 1231
    :pswitch_4d6
    aget-object v85, v8, v10

    .line 1232
    .local v85, "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_4e4

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1233
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_4e4
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v85

    move-object/from16 v1, v104

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectPropNoWarn(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1238
    :pswitch_4f6
    aget-object v85, v8, v10

    .line 1239
    .restart local v85    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_504

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1240
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_504
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v85

    move-object/from16 v1, v104

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectProp(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1245
    :pswitch_516
    aget-object v100, v8, v10

    .line 1246
    .restart local v100    # "rhs":Ljava/lang/Object;
    move-object/from16 v0, v100

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_524

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v100

    .line 1247
    .end local v100    # "rhs":Ljava/lang/Object;
    :cond_524
    add-int/lit8 v10, v10, -0x1

    .line 1248
    aget-object v85, v8, v10

    .line 1249
    .restart local v85    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_534

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1250
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_534
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v85

    move-object/from16 v1, v104

    move-object/from16 v2, v100

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3, v5}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProp(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1255
    :pswitch_548
    aget-object v85, v8, v10

    .line 1256
    .restart local v85    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_556

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1257
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_556
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v6, v13, v6

    move-object/from16 v0, v85

    move-object/from16 v1, v104

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->propIncrDecr(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    .line 1260
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1264
    :pswitch_578
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->doGetElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1265
    goto/16 :goto_a9

    .line 1268
    :pswitch_582
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->doSetElem(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1269
    goto/16 :goto_a9

    :pswitch_58c
    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object v14, v8

    move-object v15, v9

    move/from16 v16, v10

    .line 1272
    invoke-static/range {v11 .. v16}, Lorg/mozilla/javascript/Interpreter;->doElemIncDec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[B[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1273
    goto/16 :goto_a9

    .line 1276
    :pswitch_59a
    aget-object v98, v8, v10

    check-cast v98, Lorg/mozilla/javascript/Ref;

    .line 1277
    .local v98, "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, v98

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->refGet(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1281
    .end local v98    # "ref":Lorg/mozilla/javascript/Ref;
    :pswitch_5aa
    aget-object v109, v8, v10

    .line 1282
    .restart local v109    # "value":Ljava/lang/Object;
    move-object/from16 v0, v109

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_5b8

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v109

    .line 1283
    .end local v109    # "value":Ljava/lang/Object;
    :cond_5b8
    add-int/lit8 v10, v10, -0x1

    .line 1284
    aget-object v98, v8, v10

    check-cast v98, Lorg/mozilla/javascript/Ref;

    .line 1285
    .restart local v98    # "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v98

    move-object/from16 v1, v109

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->refSet(Lorg/mozilla/javascript/Ref;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1289
    .end local v98    # "ref":Lorg/mozilla/javascript/Ref;
    :pswitch_5d0
    aget-object v98, v8, v10

    check-cast v98, Lorg/mozilla/javascript/Ref;

    .line 1290
    .restart local v98    # "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, v98

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->refDel(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1294
    .end local v98    # "ref":Lorg/mozilla/javascript/Ref;
    :pswitch_5e0
    aget-object v98, v8, v10

    check-cast v98, Lorg/mozilla/javascript/Ref;

    .line 1295
    .restart local v98    # "ref":Lorg/mozilla/javascript/Ref;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v6, v13, v6

    move-object/from16 v0, v98

    move-object/from16 v1, p0

    invoke-static {v0, v1, v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->refIncrDecr(Lorg/mozilla/javascript/Ref;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    .line 1297
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1301
    .end local v98    # "ref":Lorg/mozilla/javascript/Ref;
    :pswitch_604
    add-int/lit8 v10, v10, 0x1

    .line 1302
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1303
    aget-object v5, v8, v20

    aput-object v5, v8, v10

    .line 1304
    aget-wide v5, v9, v20

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1307
    :pswitch_616
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1308
    const/4 v5, 0x0

    aput-object v5, v8, v20

    goto/16 :goto_a9

    .line 1312
    :pswitch_621
    add-int/lit8 v10, v10, 0x1

    .line 1313
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v104

    move-object/from16 v1, p0

    invoke-static {v0, v1, v5}, Lorg/mozilla/javascript/ScriptRuntime;->getNameFunctionAndThis(Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v5

    aput-object v5, v8, v10

    .line 1315
    add-int/lit8 v10, v10, 0x1

    .line 1316
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1319
    :pswitch_63b
    aget-object v90, v8, v10

    .line 1320
    .restart local v90    # "obj":Ljava/lang/Object;
    move-object/from16 v0, v90

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_649

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v90

    .line 1322
    .end local v90    # "obj":Ljava/lang/Object;
    :cond_649
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v90

    move-object/from16 v1, v104

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->getPropFunctionAndThis(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v5

    aput-object v5, v8, v10

    .line 1324
    add-int/lit8 v10, v10, 0x1

    .line 1325
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1329
    :pswitch_663
    add-int/lit8 v5, v10, -0x1

    aget-object v90, v8, v5

    .line 1330
    .restart local v90    # "obj":Ljava/lang/Object;
    move-object/from16 v0, v90

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_675

    add-int/lit8 v5, v10, -0x1

    aget-wide v5, v9, v5

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v90

    .line 1331
    .end local v90    # "obj":Ljava/lang/Object;
    :cond_675
    aget-object v76, v8, v10

    .line 1332
    .local v76, "id":Ljava/lang/Object;
    move-object/from16 v0, v76

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_683

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v76

    .line 1333
    .end local v76    # "id":Ljava/lang/Object;
    :cond_683
    add-int/lit8 v5, v10, -0x1

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v90

    move-object/from16 v1, v76

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v6}, Lorg/mozilla/javascript/ScriptRuntime;->getElemFunctionAndThis(Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v6

    aput-object v6, v8, v5

    .line 1335
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1339
    :pswitch_69d
    aget-object v109, v8, v10

    .line 1340
    .restart local v109    # "value":Ljava/lang/Object;
    move-object/from16 v0, v109

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_6ab

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v109

    .line 1341
    .end local v109    # "value":Ljava/lang/Object;
    :cond_6ab
    move-object/from16 v0, v109

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->getValueFunctionAndThis(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Callable;

    move-result-object v5

    aput-object v5, v8, v10

    .line 1342
    add-int/lit8 v10, v10, 0x1

    .line 1343
    invoke-static/range {p0 .. p0}, Lorg/mozilla/javascript/ScriptRuntime;->lastStoredScriptable(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1347
    :pswitch_6bf
    if-eqz v78, :cond_6cb

    .line 1348
    move-object/from16 v0, p0

    iget v5, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    add-int/lit8 v5, v5, 0x64

    move-object/from16 v0, p0

    iput v5, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    :cond_6cb
    move-object/from16 v14, p0

    move-object/from16 v15, p1

    move-object/from16 v16, v8

    move-object/from16 v17, v9

    move/from16 v18, v10

    move-object/from16 v19, v13

    .line 1350
    invoke-static/range {v14 .. v20}, Lorg/mozilla/javascript/Interpreter;->doCallSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[BI)I

    move-result v10

    .line 1351
    goto/16 :goto_a9

    .line 1356
    :pswitch_6dd
    if-eqz v78, :cond_6e9

    .line 1357
    move-object/from16 v0, p0

    iget v5, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    add-int/lit8 v5, v5, 0x64

    move-object/from16 v0, p0

    iput v5, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 1361
    :cond_6e9
    add-int/lit8 v5, v20, 0x1

    sub-int/2addr v10, v5

    .line 1365
    aget-object v70, v8, v10

    check-cast v70, Lorg/mozilla/javascript/Callable;

    .line 1366
    .local v70, "fun":Lorg/mozilla/javascript/Callable;
    add-int/lit8 v5, v10, 0x1

    aget-object v16, v8, v5

    check-cast v16, Lorg/mozilla/javascript/Scriptable;

    .line 1367
    .local v16, "funThisObj":Lorg/mozilla/javascript/Scriptable;
    const/16 v5, 0x46

    if-ne v7, v5, :cond_712

    .line 1368
    add-int/lit8 v5, v10, 0x2

    move/from16 v0, v20

    invoke-static {v8, v9, v5, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v93

    .line 1370
    .local v93, "outArgs":[Ljava/lang/Object;
    move-object/from16 v0, v70

    move-object/from16 v1, v16

    move-object/from16 v2, v93

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->callRef(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Ref;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1374
    .end local v93    # "outArgs":[Ljava/lang/Object;
    :cond_712
    move-object/from16 v0, p1

    iget-object v15, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 1375
    .local v15, "calleeScope":Lorg/mozilla/javascript/Scriptable;
    move-object/from16 v0, p1

    iget-boolean v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->useActivation:Z

    if-eqz v5, :cond_724

    .line 1376
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v15

    .line 1378
    :cond_724
    move-object/from16 v0, v70

    instance-of v5, v0, Lorg/mozilla/javascript/InterpretedFunction;

    if-eqz v5, :cond_773

    .line 1379
    move-object/from16 v0, v70

    check-cast v0, Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v21, v0

    .line 1380
    .local v21, "ifun":Lorg/mozilla/javascript/InterpretedFunction;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 v0, v21

    iget-object v6, v0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v5, v6, :cond_773

    .line 1381
    move-object/from16 v22, p1

    .line 1382
    .local v22, "callParentFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    new-instance v23, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v5, 0x0

    move-object/from16 v0, v23

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 1383
    .local v23, "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    const/16 v5, -0x37

    if-ne v7, v5, :cond_758

    .line 1399
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 v22, v0

    .line 1402
    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v5}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 1404
    :cond_758
    add-int/lit8 v19, v10, 0x2

    move-object/from16 v14, p0

    move-object/from16 v17, v8

    move-object/from16 v18, v9

    invoke-static/range {v14 .. v23}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 1407
    const/16 v5, -0x37

    if-eq v7, v5, :cond_76f

    .line 1408
    move-object/from16 v0, p1

    iput v10, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 1409
    move-object/from16 v0, p1

    iput v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 1411
    :cond_76f
    move-object/from16 p1, v23

    goto/16 :goto_54

    .line 1416
    .end local v21    # "ifun":Lorg/mozilla/javascript/InterpretedFunction;
    .end local v22    # "callParentFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v23    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :cond_773
    move-object/from16 v0, v70

    instance-of v5, v0, Lorg/mozilla/javascript/NativeContinuation;

    if-eqz v5, :cond_7a3

    .line 1419
    new-instance v63, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    check-cast v70, Lorg/mozilla/javascript/NativeContinuation;

    .end local v70    # "fun":Lorg/mozilla/javascript/Callable;
    move-object/from16 v0, v63

    move-object/from16 v1, v70

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/mozilla/javascript/Interpreter$ContinuationJump;-><init>(Lorg/mozilla/javascript/NativeContinuation;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 1423
    .restart local v63    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    if-nez v20, :cond_792

    .line 1424
    move-object/from16 v0, v106

    move-object/from16 v1, v63

    iput-object v0, v1, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 1431
    :goto_78e
    move-object/from16 p2, v63

    .local p2, "throwable":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    goto/16 :goto_19c

    .line 1426
    .end local p2    # "throwable":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :cond_792
    add-int/lit8 v5, v10, 0x2

    aget-object v5, v8, v5

    move-object/from16 v0, v63

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 1427
    add-int/lit8 v5, v10, 0x2

    aget-wide v5, v9, v5

    move-object/from16 v0, v63

    iput-wide v5, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->resultDbl:D

    goto :goto_78e

    .line 1435
    .end local v63    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    .restart local v70    # "fun":Lorg/mozilla/javascript/Callable;
    :cond_7a3
    move-object/from16 v0, v70

    instance-of v5, v0, Lorg/mozilla/javascript/IdFunctionObject;

    if-eqz v5, :cond_802

    .line 1436
    move-object/from16 v0, v70

    check-cast v0, Lorg/mozilla/javascript/IdFunctionObject;

    move-object/from16 v21, v0

    .line 1437
    .local v21, "ifun":Lorg/mozilla/javascript/IdFunctionObject;
    invoke-static/range {v21 .. v21}, Lorg/mozilla/javascript/NativeContinuation;->isContinuationConstructor(Lorg/mozilla/javascript/IdFunctionObject;)Z

    move-result v5

    if-eqz v5, :cond_7c8

    .line 1438
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v6, v11}, Lorg/mozilla/javascript/Interpreter;->captureContinuation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Z)Lorg/mozilla/javascript/NativeContinuation;

    move-result-object v6

    aput-object v6, v5, v10

    goto/16 :goto_a9

    .line 1444
    :cond_7c8
    invoke-static/range {v21 .. v21}, Lorg/mozilla/javascript/BaseFunction;->isApplyOrCall(Lorg/mozilla/javascript/IdFunctionObject;)Z

    move-result v5

    if-eqz v5, :cond_802

    .line 1445
    invoke-static/range {v16 .. v16}, Lorg/mozilla/javascript/ScriptRuntime;->getCallable(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Callable;

    move-result-object v61

    .line 1446
    .local v61, "applyCallable":Lorg/mozilla/javascript/Callable;
    move-object/from16 v0, v61

    instance-of v5, v0, Lorg/mozilla/javascript/InterpretedFunction;

    if-eqz v5, :cond_802

    .line 1447
    move-object/from16 v0, v61

    check-cast v0, Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v33, v0

    .line 1448
    .local v33, "iApplyCallable":Lorg/mozilla/javascript/InterpretedFunction;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 v0, v33

    iget-object v6, v0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v5, v6, :cond_802

    move-object/from16 v24, p0

    move-object/from16 v25, p1

    move/from16 v26, v20

    move-object/from16 v27, v8

    move-object/from16 v28, v9

    move/from16 v29, v10

    move/from16 v30, v7

    move-object/from16 v31, v15

    move-object/from16 v32, v21

    .line 1449
    invoke-static/range {v24 .. v33}, Lorg/mozilla/javascript/Interpreter;->initFrameForApplyOrCall(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/InterpretedFunction;)Lorg/mozilla/javascript/Interpreter$CallFrame;

    .end local v28    # "vars":[Ljava/lang/Object;
    .end local v29    # "varDbls":[D
    .end local v30    # "varAttributes":[I
    move-result-object p1

    goto/16 :goto_54

    .line 1460
    .end local v21    # "ifun":Lorg/mozilla/javascript/IdFunctionObject;
    .end local v33    # "iApplyCallable":Lorg/mozilla/javascript/InterpretedFunction;
    .end local v61    # "applyCallable":Lorg/mozilla/javascript/Callable;
    .restart local v28    # "vars":[Ljava/lang/Object;
    .restart local v29    # "varDbls":[D
    .restart local v30    # "varAttributes":[I
    :cond_802
    move-object/from16 v0, v70

    instance-of v5, v0, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;

    if-eqz v5, :cond_846

    .line 1462
    move-object/from16 v0, v70

    check-cast v0, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;

    move-object/from16 v43, v0

    .line 1463
    .local v43, "noSuchMethodShim":Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;
    move-object/from16 v0, v43

    iget-object v0, v0, Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;->noSuchMethodMethod:Lorg/mozilla/javascript/Callable;

    move-object/from16 v88, v0

    .line 1465
    .local v88, "noSuchMethodMethod":Lorg/mozilla/javascript/Callable;
    move-object/from16 v0, v88

    instance-of v5, v0, Lorg/mozilla/javascript/InterpretedFunction;

    if-eqz v5, :cond_846

    .line 1466
    move-object/from16 v0, v88

    check-cast v0, Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v21, v0

    .line 1467
    .local v21, "ifun":Lorg/mozilla/javascript/InterpretedFunction;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 v0, v21

    iget-object v6, v0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v5, v6, :cond_846

    move-object/from16 v34, p0

    move-object/from16 v35, p1

    move/from16 v36, v20

    move-object/from16 v37, v8

    move-object/from16 v38, v9

    move/from16 v39, v10

    move/from16 v40, v7

    move-object/from16 v41, v16

    move-object/from16 v42, v15

    move-object/from16 v44, v21

    .line 1468
    invoke-static/range {v34 .. v44}, Lorg/mozilla/javascript/Interpreter;->initFrameForNoSuchMethod(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;I[Ljava/lang/Object;[DIILorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;Lorg/mozilla/javascript/InterpretedFunction;)Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p1

    goto/16 :goto_54

    .line 1476
    .end local v21    # "ifun":Lorg/mozilla/javascript/InterpretedFunction;
    .end local v43    # "noSuchMethodShim":Lorg/mozilla/javascript/ScriptRuntime$NoSuchMethodShim;
    .end local v88    # "noSuchMethodMethod":Lorg/mozilla/javascript/Callable;
    :cond_846
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 1477
    move-object/from16 v0, p1

    iput v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 1478
    move-object/from16 v0, p1

    iput v10, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 1479
    add-int/lit8 v5, v10, 0x2

    move/from16 v0, v20

    invoke-static {v8, v9, v5, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v0, v70

    move-object/from16 v1, p0

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v15, v2, v5}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1485
    .end local v15    # "calleeScope":Lorg/mozilla/javascript/Scriptable;
    .end local v16    # "funThisObj":Lorg/mozilla/javascript/Scriptable;
    .end local v70    # "fun":Lorg/mozilla/javascript/Callable;
    :pswitch_86a
    if-eqz v78, :cond_876

    .line 1486
    move-object/from16 v0, p0

    iget v5, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    add-int/lit8 v5, v5, 0x64

    move-object/from16 v0, p0

    iput v5, v0, Lorg/mozilla/javascript/Context;->instructionCount:I

    .line 1490
    :cond_876
    sub-int v10, v10, v20

    .line 1492
    aget-object v85, v8, v10

    .line 1493
    .restart local v85    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    instance-of v5, v0, Lorg/mozilla/javascript/InterpretedFunction;

    if-eqz v5, :cond_8cb

    .line 1494
    move-object/from16 v0, v85

    check-cast v0, Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v51, v0

    .line 1495
    .local v51, "f":Lorg/mozilla/javascript/InterpretedFunction;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    move-object/from16 v0, v51

    iget-object v6, v0, Lorg/mozilla/javascript/InterpretedFunction;->securityDomain:Ljava/lang/Object;

    if-ne v5, v6, :cond_8cb

    .line 1496
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v51

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v5}, Lorg/mozilla/javascript/InterpretedFunction;->createObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v46

    .line 1497
    .local v46, "newInstance":Lorg/mozilla/javascript/Scriptable;
    new-instance v23, Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v5, 0x0

    move-object/from16 v0, v23

    invoke-direct {v0, v5}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>(Lorg/mozilla/javascript/Interpreter$1;)V

    .line 1498
    .restart local v23    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v45, v0

    add-int/lit8 v49, v10, 0x1

    move-object/from16 v44, p0

    move-object/from16 v47, v8

    move-object/from16 v48, v9

    move/from16 v50, v20

    move-object/from16 v52, p1

    move-object/from16 v53, v23

    invoke-static/range {v44 .. v53}, Lorg/mozilla/javascript/Interpreter;->initFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;[DIILorg/mozilla/javascript/InterpretedFunction;Lorg/mozilla/javascript/Interpreter$CallFrame;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 1502
    aput-object v46, v8, v10

    .line 1503
    move-object/from16 v0, p1

    iput v10, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 1504
    move-object/from16 v0, p1

    iput v7, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 1505
    move-object/from16 p1, v23

    goto/16 :goto_54

    .line 1509
    .end local v23    # "calleeFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v46    # "newInstance":Lorg/mozilla/javascript/Scriptable;
    .end local v51    # "f":Lorg/mozilla/javascript/InterpretedFunction;
    :cond_8cb
    move-object/from16 v0, v85

    instance-of v5, v0, Lorg/mozilla/javascript/Function;

    if-nez v5, :cond_8e2

    .line 1510
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_8dd

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1511
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_8dd
    invoke-static/range {v85 .. v85}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 1513
    .restart local v85    # "lhs":Ljava/lang/Object;
    :cond_8e2
    move-object/from16 v0, v85

    check-cast v0, Lorg/mozilla/javascript/Function;

    move-object/from16 v70, v0

    .line 1515
    .local v70, "fun":Lorg/mozilla/javascript/Function;
    move-object/from16 v0, v70

    instance-of v5, v0, Lorg/mozilla/javascript/IdFunctionObject;

    if-eqz v5, :cond_90d

    .line 1516
    move-object/from16 v0, v70

    check-cast v0, Lorg/mozilla/javascript/IdFunctionObject;

    move-object/from16 v21, v0

    .line 1517
    .local v21, "ifun":Lorg/mozilla/javascript/IdFunctionObject;
    invoke-static/range {v21 .. v21}, Lorg/mozilla/javascript/NativeContinuation;->isContinuationConstructor(Lorg/mozilla/javascript/IdFunctionObject;)Z

    move-result v5

    if-eqz v5, :cond_90d

    .line 1518
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    const/4 v11, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v6, v11}, Lorg/mozilla/javascript/Interpreter;->captureContinuation(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Z)Lorg/mozilla/javascript/NativeContinuation;

    move-result-object v6

    aput-object v6, v5, v10

    goto/16 :goto_a9

    .line 1524
    .end local v21    # "ifun":Lorg/mozilla/javascript/IdFunctionObject;
    :cond_90d
    add-int/lit8 v5, v10, 0x1

    move/from16 v0, v20

    invoke-static {v8, v9, v5, v0}, Lorg/mozilla/javascript/Interpreter;->getArgsArray([Ljava/lang/Object;[DII)[Ljava/lang/Object;

    move-result-object v93

    .line 1525
    .restart local v93    # "outArgs":[Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v70

    move-object/from16 v1, p0

    move-object/from16 v2, v93

    invoke-interface {v0, v1, v5, v2}, Lorg/mozilla/javascript/Function;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1529
    .end local v70    # "fun":Lorg/mozilla/javascript/Function;
    .end local v85    # "lhs":Ljava/lang/Object;
    .end local v93    # "outArgs":[Ljava/lang/Object;
    :pswitch_927
    aget-object v85, v8, v10

    .line 1530
    .restart local v85    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_935

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1531
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_935
    invoke-static/range {v85 .. v85}, Lorg/mozilla/javascript/ScriptRuntime;->typeof(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1535
    :pswitch_93d
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v104

    invoke-static {v5, v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeofName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1538
    :pswitch_94d
    add-int/lit8 v10, v10, 0x1

    aput-object v104, v8, v10

    goto/16 :goto_a9

    .line 1541
    :pswitch_953
    add-int/lit8 v10, v10, 0x1

    .line 1542
    aput-object v54, v8, v10

    .line 1543
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getShort([BI)I

    move-result v5

    int-to-double v5, v5

    aput-wide v5, v9, v10

    .line 1544
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1547
    :pswitch_96e
    add-int/lit8 v10, v10, 0x1

    .line 1548
    aput-object v54, v8, v10

    .line 1549
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getInt([BI)I

    move-result v5

    int-to-double v5, v5

    aput-wide v5, v9, v10

    .line 1550
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x4

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1553
    :pswitch_989
    add-int/lit8 v10, v10, 0x1

    .line 1554
    aput-object v54, v8, v10

    .line 1555
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpreterData;->itsDoubleTable:[D

    aget-wide v5, v5, v20

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1558
    :pswitch_999
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-static {v0, v5, v1}, Lorg/mozilla/javascript/ScriptRuntime;->name(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1561
    :pswitch_9ab
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v6, v13, v6

    move-object/from16 v0, v104

    move-object/from16 v1, p0

    invoke-static {v5, v0, v1, v6}, Lorg/mozilla/javascript/ScriptRuntime;->nameIncrDecr(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    .line 1563
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1566
    :pswitch_9cd
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v20, v13, v5

    :pswitch_9d9
    move-object/from16 v24, p1

    move-object/from16 v25, v8

    move-object/from16 v26, v9

    move/from16 v27, v10

    move/from16 v31, v20

    .line 1569
    invoke-static/range {v24 .. v31}, Lorg/mozilla/javascript/Interpreter;->doSetConstVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v10

    .line 1571
    goto/16 :goto_a9

    .line 1573
    :pswitch_9e9
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v20, v13, v5

    :pswitch_9f5
    move-object/from16 v24, p1

    move-object/from16 v25, v8

    move-object/from16 v26, v9

    move/from16 v27, v10

    move/from16 v31, v20

    .line 1576
    invoke-static/range {v24 .. v31}, Lorg/mozilla/javascript/Interpreter;->doSetVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v10

    .line 1578
    goto/16 :goto_a9

    .line 1580
    :pswitch_a05
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v6, v5, 0x1

    move-object/from16 v0, p1

    iput v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v20, v13, v5

    :pswitch_a11
    move-object/from16 v34, p1

    move-object/from16 v35, v8

    move-object/from16 v36, v9

    move/from16 v37, v10

    move-object/from16 v38, v28

    move-object/from16 v39, v29

    move/from16 v40, v20

    .line 1583
    invoke-static/range {v34 .. v40}, Lorg/mozilla/javascript/Interpreter;->doGetVar(Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[DI)I

    move-result v10

    .line 1584
    goto/16 :goto_a9

    :pswitch_a25
    move-object/from16 v34, p0

    move-object/from16 v35, p1

    move-object/from16 v36, v8

    move-object/from16 v37, v9

    move/from16 v38, v10

    move-object/from16 v39, v28

    move-object/from16 v40, v29

    move-object/from16 v41, v30

    move/from16 v42, v20

    .line 1586
    invoke-static/range {v34 .. v42}, Lorg/mozilla/javascript/Interpreter;->doVarIncDec(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DI[Ljava/lang/Object;[D[II)I

    move-result v10

    .line 1588
    goto/16 :goto_a9

    .line 1591
    :pswitch_a3d
    add-int/lit8 v10, v10, 0x1

    .line 1592
    aput-object v54, v8, v10

    .line 1593
    const-wide/16 v5, 0x0

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1596
    :pswitch_a47
    add-int/lit8 v10, v10, 0x1

    .line 1597
    aput-object v54, v8, v10

    .line 1598
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1601
    :pswitch_a51
    add-int/lit8 v10, v10, 0x1

    const/4 v5, 0x0

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1604
    :pswitch_a58
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->thisObj:Lorg/mozilla/javascript/Scriptable;

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1607
    :pswitch_a62
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1610
    :pswitch_a6c
    add-int/lit8 v10, v10, 0x1

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1613
    :pswitch_a74
    add-int/lit8 v10, v10, 0x1

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1616
    :pswitch_a7c
    add-int/lit8 v10, v10, 0x1

    aput-object v106, v8, v10

    goto/16 :goto_a9

    .line 1619
    :pswitch_a82
    aget-object v85, v8, v10

    .line 1620
    .restart local v85    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_a90

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1621
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_a90
    add-int/lit8 v10, v10, -0x1

    .line 1622
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v85

    move-object/from16 v1, p0

    invoke-static {v0, v1, v5}, Lorg/mozilla/javascript/ScriptRuntime;->enterWith(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    goto/16 :goto_a9

    .line 1626
    :pswitch_aa4
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->leaveWith(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    goto/16 :goto_a9

    .line 1632
    :pswitch_ab2
    add-int/lit8 v10, v10, -0x1

    .line 1633
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1635
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v5, v5, v6

    if-eqz v5, :cond_af2

    const/16 v60, 0x1

    .line 1636
    .local v60, "afterFirstScope":Z
    :goto_aca
    add-int/lit8 v5, v10, 0x1

    aget-object v62, v8, v5

    check-cast v62, Ljava/lang/Throwable;

    .line 1638
    .local v62, "caughtException":Ljava/lang/Throwable;
    if-nez v60, :cond_af5

    .line 1639
    const/16 v84, 0x0

    .line 1643
    .local v84, "lastCatchScope":Lorg/mozilla/javascript/Scriptable;
    :goto_ad4
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v62

    move-object/from16 v1, v84

    move-object/from16 v2, v104

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3, v5}, Lorg/mozilla/javascript/ScriptRuntime;->newCatchScope(Ljava/lang/Throwable;Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    aput-object v5, v8, v20

    .line 1646
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1635
    .end local v60    # "afterFirstScope":Z
    .end local v62    # "caughtException":Ljava/lang/Throwable;
    .end local v84    # "lastCatchScope":Lorg/mozilla/javascript/Scriptable;
    :cond_af2
    const/16 v60, 0x0

    goto :goto_aca

    .line 1641
    .restart local v60    # "afterFirstScope":Z
    .restart local v62    # "caughtException":Ljava/lang/Throwable;
    :cond_af5
    aget-object v84, v8, v20

    check-cast v84, Lorg/mozilla/javascript/Scriptable;

    .restart local v84    # "lastCatchScope":Lorg/mozilla/javascript/Scriptable;
    goto :goto_ad4

    .line 1652
    .end local v60    # "afterFirstScope":Z
    .end local v62    # "caughtException":Ljava/lang/Throwable;
    .end local v84    # "lastCatchScope":Lorg/mozilla/javascript/Scriptable;
    :pswitch_afa
    aget-object v85, v8, v10

    .line 1653
    .restart local v85    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_b08

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1654
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_b08
    add-int/lit8 v10, v10, -0x1

    .line 1655
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1656
    const/16 v5, 0x3a

    if-ne v7, v5, :cond_b28

    const/16 v67, 0x0

    .line 1661
    .local v67, "enumType":I
    :goto_b16
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v85

    move-object/from16 v1, p0

    move/from16 v2, v67

    invoke-static {v0, v1, v5, v2}, Lorg/mozilla/javascript/ScriptRuntime;->enumInit(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v20

    goto/16 :goto_a9

    .line 1656
    .end local v67    # "enumType":I
    :cond_b28
    const/16 v5, 0x3b

    if-ne v7, v5, :cond_b2f

    const/16 v67, 0x1

    goto :goto_b16

    :cond_b2f
    const/16 v67, 0x2

    goto :goto_b16

    .line 1666
    :pswitch_b32
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1667
    aget-object v107, v8, v20

    .line 1668
    .local v107, "val":Ljava/lang/Object;
    add-int/lit8 v10, v10, 0x1

    .line 1669
    const/16 v5, 0x3d

    if-ne v7, v5, :cond_b48

    invoke-static/range {v107 .. v107}, Lorg/mozilla/javascript/ScriptRuntime;->enumNext(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v5

    :goto_b44
    aput-object v5, v8, v10

    goto/16 :goto_a9

    :cond_b48
    move-object/from16 v0, v107

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->enumId(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_b44

    .line 1676
    .end local v107    # "val":Ljava/lang/Object;
    :pswitch_b51
    aget-object v90, v8, v10

    .line 1677
    .restart local v90    # "obj":Ljava/lang/Object;
    move-object/from16 v0, v90

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_b5f

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v90

    .line 1678
    .end local v90    # "obj":Ljava/lang/Object;
    :cond_b5f
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v90

    move-object/from16 v1, v104

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->specialRef(Ljava/lang/Object;Ljava/lang/String;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1684
    :pswitch_b71
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v8, v9, v10, v1}, Lorg/mozilla/javascript/Interpreter;->doRefMember(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;[DII)I

    move-result v10

    .line 1685
    goto/16 :goto_a9

    .line 1689
    :pswitch_b7b
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v8, v9, v10, v1}, Lorg/mozilla/javascript/Interpreter;->doRefNsMember(Lorg/mozilla/javascript/Context;[Ljava/lang/Object;[DII)I

    move-result v10

    .line 1690
    goto/16 :goto_a9

    .line 1694
    :pswitch_b85
    aget-object v87, v8, v10

    .line 1695
    .local v87, "name":Ljava/lang/Object;
    move-object/from16 v0, v87

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_b93

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v87

    .line 1696
    .end local v87    # "name":Ljava/lang/Object;
    :cond_b93
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v87

    move-object/from16 v1, p0

    move/from16 v2, v20

    invoke-static {v0, v1, v5, v2}, Lorg/mozilla/javascript/ScriptRuntime;->nameRef(Ljava/lang/Object;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    :pswitch_ba5
    move-object/from16 v34, p0

    move-object/from16 v35, p1

    move-object/from16 v36, v8

    move-object/from16 v37, v9

    move/from16 v38, v10

    move/from16 v39, v20

    .line 1702
    invoke-static/range {v34 .. v39}, Lorg/mozilla/javascript/Interpreter;->doRefNsName(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;[DII)I

    move-result v10

    .line 1703
    goto/16 :goto_a9

    .line 1706
    :pswitch_bb7
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1707
    aget-object v5, v8, v20

    check-cast v5, Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    goto/16 :goto_a9

    .line 1710
    :pswitch_bc7
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int v20, v20, v5

    .line 1711
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    aput-object v5, v8, v20

    goto/16 :goto_a9

    .line 1714
    :pswitch_bd5
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v5, v6, v1}, Lorg/mozilla/javascript/InterpretedFunction;->createFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)Lorg/mozilla/javascript/InterpretedFunction;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1719
    :pswitch_beb
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-static {v0, v5, v6, v1}, Lorg/mozilla/javascript/Interpreter;->initFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpretedFunction;I)V

    goto/16 :goto_a9

    .line 1722
    :pswitch_bfc
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpreterData;->itsRegExpLiterals:[Ljava/lang/Object;

    aget-object v97, v5, v20

    .line 1723
    .local v97, "re":Ljava/lang/Object;
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, p0

    move-object/from16 v1, v97

    invoke-static {v0, v5, v1}, Lorg/mozilla/javascript/ScriptRuntime;->wrapRegExp(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1727
    .end local v97    # "re":Ljava/lang/Object;
    :pswitch_c16
    add-int/lit8 v10, v10, 0x1

    .line 1728
    move/from16 v0, v20

    new-array v5, v0, [I

    aput-object v5, v8, v10

    .line 1729
    add-int/lit8 v10, v10, 0x1

    .line 1730
    move/from16 v0, v20

    new-array v5, v0, [Ljava/lang/Object;

    aput-object v5, v8, v10

    .line 1731
    const-wide/16 v5, 0x0

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1734
    :pswitch_c2c
    aget-object v109, v8, v10

    .line 1735
    .restart local v109    # "value":Ljava/lang/Object;
    move-object/from16 v0, v109

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_c3a

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v109

    .line 1736
    .end local v109    # "value":Ljava/lang/Object;
    :cond_c3a
    add-int/lit8 v10, v10, -0x1

    .line 1737
    aget-wide v5, v9, v10

    double-to-int v0, v5

    move/from16 v75, v0

    .line 1738
    .local v75, "i":I
    aget-object v5, v8, v10

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    aput-object v109, v5, v75

    .line 1739
    add-int/lit8 v5, v75, 0x1

    int-to-double v5, v5

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1743
    .end local v75    # "i":I
    :pswitch_c50
    aget-object v109, v8, v10

    .line 1744
    .restart local v109    # "value":Ljava/lang/Object;
    add-int/lit8 v10, v10, -0x1

    .line 1745
    aget-wide v5, v9, v10

    double-to-int v0, v5

    move/from16 v75, v0

    .line 1746
    .restart local v75    # "i":I
    aget-object v5, v8, v10

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    aput-object v109, v5, v75

    .line 1747
    add-int/lit8 v5, v10, -0x1

    aget-object v5, v8, v5

    check-cast v5, [I

    check-cast v5, [I

    const/4 v6, -0x1

    aput v6, v5, v75

    .line 1748
    add-int/lit8 v5, v75, 0x1

    int-to-double v5, v5

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1752
    .end local v75    # "i":I
    .end local v109    # "value":Ljava/lang/Object;
    :pswitch_c73
    aget-object v109, v8, v10

    .line 1753
    .restart local v109    # "value":Ljava/lang/Object;
    add-int/lit8 v10, v10, -0x1

    .line 1754
    aget-wide v5, v9, v10

    double-to-int v0, v5

    move/from16 v75, v0

    .line 1755
    .restart local v75    # "i":I
    aget-object v5, v8, v10

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    aput-object v109, v5, v75

    .line 1756
    add-int/lit8 v5, v10, -0x1

    aget-object v5, v8, v5

    check-cast v5, [I

    check-cast v5, [I

    const/4 v6, 0x1

    aput v6, v5, v75

    .line 1757
    add-int/lit8 v5, v75, 0x1

    int-to-double v5, v5

    aput-wide v5, v9, v10

    goto/16 :goto_a9

    .line 1763
    .end local v75    # "i":I
    .end local v109    # "value":Ljava/lang/Object;
    :pswitch_c96
    aget-object v5, v8, v10

    check-cast v5, [Ljava/lang/Object;

    move-object v0, v5

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v66, v0

    .line 1764
    .local v66, "data":[Ljava/lang/Object;
    add-int/lit8 v10, v10, -0x1

    .line 1765
    aget-object v5, v8, v10

    check-cast v5, [I

    move-object v0, v5

    check-cast v0, [I

    move-object/from16 v74, v0

    .line 1767
    .local v74, "getterSetters":[I
    const/16 v5, 0x42

    if-ne v7, v5, :cond_cd1

    .line 1768
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpreterData;->literalIds:[Ljava/lang/Object;

    aget-object v5, v5, v20

    check-cast v5, [Ljava/lang/Object;

    move-object v0, v5

    check-cast v0, [Ljava/lang/Object;

    move-object/from16 v77, v0

    .line 1769
    .local v77, "ids":[Ljava/lang/Object;
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v77

    move-object/from16 v1, v66

    move-object/from16 v2, v74

    move-object/from16 v3, p0

    invoke-static {v0, v1, v2, v3, v5}, Lorg/mozilla/javascript/ScriptRuntime;->newObjectLiteral([Ljava/lang/Object;[Ljava/lang/Object;[ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v107

    .line 1779
    .end local v77    # "ids":[Ljava/lang/Object;
    .local v107, "val":Lorg/mozilla/javascript/Scriptable;
    :goto_ccd
    aput-object v107, v8, v10

    goto/16 :goto_a9

    .line 1772
    .end local v107    # "val":Lorg/mozilla/javascript/Scriptable;
    :cond_cd1
    const/16 v101, 0x0

    .line 1773
    .local v101, "skipIndexces":[I
    const/16 v5, -0x1f

    if-ne v7, v5, :cond_ce6

    .line 1774
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpreterData;->literalIds:[Ljava/lang/Object;

    aget-object v5, v5, v20

    check-cast v5, [I

    move-object v0, v5

    check-cast v0, [I

    move-object/from16 v101, v0

    .line 1776
    :cond_ce6
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v66

    move-object/from16 v1, v101

    move-object/from16 v2, p0

    invoke-static {v0, v1, v2, v5}, Lorg/mozilla/javascript/ScriptRuntime;->newArrayLiteral([Ljava/lang/Object;[ILorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v107

    .restart local v107    # "val":Lorg/mozilla/javascript/Scriptable;
    goto :goto_ccd

    .line 1783
    .end local v66    # "data":[Ljava/lang/Object;
    .end local v74    # "getterSetters":[I
    .end local v101    # "skipIndexces":[I
    .end local v107    # "val":Lorg/mozilla/javascript/Scriptable;
    :pswitch_cf5
    aget-object v85, v8, v10

    .line 1784
    .restart local v85    # "lhs":Ljava/lang/Object;
    move-object/from16 v0, v85

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_d03

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v85

    .line 1785
    .end local v85    # "lhs":Ljava/lang/Object;
    :cond_d03
    add-int/lit8 v10, v10, -0x1

    .line 1786
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move-object/from16 v0, v85

    invoke-static {v0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->enterDotQuery(Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    goto/16 :goto_a9

    .line 1790
    :pswitch_d15
    move-object/from16 v0, p1

    invoke-static {v0, v10}, Lorg/mozilla/javascript/Interpreter;->stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z

    move-result v108

    .line 1791
    .restart local v108    # "valBln":Z
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    move/from16 v0, v108

    invoke-static {v0, v5}, Lorg/mozilla/javascript/ScriptRuntime;->updateDotQuery(ZLorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v110

    .line 1792
    .local v110, "x":Ljava/lang/Object;
    if-eqz v110, :cond_d41

    .line 1793
    aput-object v110, v8, v10

    .line 1794
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v5}, Lorg/mozilla/javascript/ScriptRuntime;->leaveDotQuery(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v5

    move-object/from16 v0, p1

    iput-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 1795
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1799
    :cond_d41
    add-int/lit8 v10, v10, -0x1

    .line 1800
    goto/16 :goto_2e1

    .line 1803
    .end local v108    # "valBln":Z
    .end local v110    # "x":Ljava/lang/Object;
    :pswitch_d45
    aget-object v109, v8, v10

    .line 1804
    .restart local v109    # "value":Ljava/lang/Object;
    move-object/from16 v0, v109

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_d53

    aget-wide v5, v9, v10

    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v109

    .line 1805
    .end local v109    # "value":Ljava/lang/Object;
    :cond_d53
    move-object/from16 v0, v109

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setDefaultNamespace(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1809
    :pswitch_d5f
    aget-object v109, v8, v10

    .line 1810
    .restart local v109    # "value":Ljava/lang/Object;
    move-object/from16 v0, v109

    move-object/from16 v1, v54

    if-eq v0, v1, :cond_a9

    .line 1811
    move-object/from16 v0, v109

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->escapeAttributeValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1816
    .end local v109    # "value":Ljava/lang/Object;
    :pswitch_d73
    aget-object v109, v8, v10

    .line 1817
    .restart local v109    # "value":Ljava/lang/Object;
    move-object/from16 v0, v109

    move-object/from16 v1, v54

    if-eq v0, v1, :cond_a9

    .line 1818
    move-object/from16 v0, v109

    move-object/from16 v1, p0

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->escapeTextValue(Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v8, v10

    goto/16 :goto_a9

    .line 1823
    .end local v109    # "value":Ljava/lang/Object;
    :pswitch_d87
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v5, :cond_a9

    .line 1824
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    move-object/from16 v0, p0

    invoke-interface {v5, v0}, Lorg/mozilla/javascript/debug/DebugFrame;->onDebuggerStatement(Lorg/mozilla/javascript/Context;)V

    goto/16 :goto_a9

    .line 1828
    :pswitch_d98
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    .line 1829
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-eqz v5, :cond_db9

    .line 1830
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v86

    .line 1831
    .local v86, "line":I
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    move-object/from16 v0, p0

    move/from16 v1, v86

    invoke-interface {v5, v0, v1}, Lorg/mozilla/javascript/debug/DebugFrame;->onLineChange(Lorg/mozilla/javascript/Context;I)V

    .line 1833
    .end local v86    # "line":I
    :cond_db9
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1836
    :pswitch_dc5
    const/16 v20, 0x0

    .line 1837
    goto/16 :goto_a9

    .line 1839
    :pswitch_dc9
    const/16 v20, 0x1

    .line 1840
    goto/16 :goto_a9

    .line 1842
    :pswitch_dcd
    const/16 v20, 0x2

    .line 1843
    goto/16 :goto_a9

    .line 1845
    :pswitch_dd1
    const/16 v20, 0x3

    .line 1846
    goto/16 :goto_a9

    .line 1848
    :pswitch_dd5
    const/16 v20, 0x4

    .line 1849
    goto/16 :goto_a9

    .line 1851
    :pswitch_dd9
    const/16 v20, 0x5

    .line 1852
    goto/16 :goto_a9

    .line 1854
    :pswitch_ddd
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v5, v13, v5

    and-int/lit16 v0, v5, 0xff

    move/from16 v20, v0

    .line 1855
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1858
    :pswitch_df3
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v20

    .line 1859
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1862
    :pswitch_e07
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getInt([BI)I

    move-result v20

    .line 1863
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x4

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1866
    :pswitch_e1b
    const/4 v5, 0x0

    aget-object v104, v105, v5

    .line 1867
    goto/16 :goto_a9

    .line 1869
    :pswitch_e20
    const/4 v5, 0x1

    aget-object v104, v105, v5

    .line 1870
    goto/16 :goto_a9

    .line 1872
    :pswitch_e25
    const/4 v5, 0x2

    aget-object v104, v105, v5

    .line 1873
    goto/16 :goto_a9

    .line 1875
    :pswitch_e2a
    const/4 v5, 0x3

    aget-object v104, v105, v5

    .line 1876
    goto/16 :goto_a9

    .line 1878
    :pswitch_e2f
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    aget-byte v5, v13, v5

    and-int/lit16 v5, v5, 0xff

    aget-object v104, v105, v5

    .line 1879
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1882
    :pswitch_e45
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v5

    aget-object v104, v105, v5

    .line 1883
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x2

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1886
    :pswitch_e5b
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v13, v5}, Lorg/mozilla/javascript/Interpreter;->getInt([BI)I

    move-result v5

    aget-object v104, v105, v5

    .line 1887
    move-object/from16 v0, p1

    iget v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v5, v5, 0x4

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    goto/16 :goto_a9

    .line 1907
    .restart local v91    # "offset":I
    :cond_e71
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v5, v5, Lorg/mozilla/javascript/InterpreterData;->longJumps:Lorg/mozilla/javascript/UintMap;

    move-object/from16 v0, p1

    iget v6, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-virtual {v5, v6}, Lorg/mozilla/javascript/UintMap;->getExistingInt(I)I

    move-result v5

    move-object/from16 v0, p1

    iput v5, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I
    :try_end_e83
    .catch Ljava/lang/Throwable; {:try_start_1fa .. :try_end_e83} :catch_e8

    goto/16 :goto_300

    .end local v91    # "offset":I
    .restart local v79    # "interpreterResult":Ljava/lang/Object;
    :cond_e85
    move-object/from16 v5, v111

    .line 2065
    .end local v7    # "op":I
    .end local v8    # "stack":[Ljava/lang/Object;
    .end local v9    # "sDbl":[D
    .end local v10    # "stackTop":I
    .end local v13    # "iCode":[B
    .end local v28    # "vars":[Ljava/lang/Object;
    .end local v29    # "varDbls":[D
    .end local v30    # "varAttributes":[I
    .end local v79    # "interpreterResult":Ljava/lang/Object;
    .end local v105    # "strings":[Ljava/lang/String;
    :cond_e87
    :goto_e87
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    if-eqz v6, :cond_f90

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v6

    if-eqz v6, :cond_f90

    .line 2068
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v6}, Lorg/mozilla/javascript/ObjArray;->pop()Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v0, p0

    iput-object v6, v0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 2077
    :goto_ea3
    if-eqz v5, :cond_f9f

    .line 2078
    instance-of v6, v5, Ljava/lang/RuntimeException;

    if-eqz v6, :cond_f9c

    .line 2079
    check-cast v5, Ljava/lang/RuntimeException;

    throw v5

    .line 1939
    .restart local v68    # "ex":Ljava/lang/Throwable;
    :cond_eac
    move-object/from16 p2, v68

    .local p2, "throwable":Ljava/lang/Throwable;
    goto/16 :goto_19c

    .line 1960
    .end local v68    # "ex":Ljava/lang/Throwable;
    .end local p2    # "throwable":Ljava/lang/Throwable;
    .restart local v56    # "EX_CATCH_STATE":I
    .restart local v57    # "EX_FINALLY_STATE":I
    .restart local v58    # "EX_NO_JS_STATE":I
    .restart local v63    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :cond_eb0
    move-object/from16 v0, p2

    instance-of v5, v0, Lorg/mozilla/javascript/JavaScriptException;

    if-eqz v5, :cond_eba

    .line 1961
    const/16 v69, 0x2

    .restart local v69    # "exState":I
    goto/16 :goto_1bc

    .line 1962
    .end local v69    # "exState":I
    :cond_eba
    move-object/from16 v0, p2

    instance-of v5, v0, Lorg/mozilla/javascript/EcmaError;

    if-eqz v5, :cond_ec4

    .line 1964
    const/16 v69, 0x2

    .restart local v69    # "exState":I
    goto/16 :goto_1bc

    .line 1965
    .end local v69    # "exState":I
    :cond_ec4
    move-object/from16 v0, p2

    instance-of v5, v0, Lorg/mozilla/javascript/EvaluatorException;

    if-eqz v5, :cond_ece

    .line 1966
    const/16 v69, 0x2

    .restart local v69    # "exState":I
    goto/16 :goto_1bc

    .line 1967
    .end local v69    # "exState":I
    :cond_ece
    move-object/from16 v0, p2

    instance-of v5, v0, Lorg/mozilla/javascript/ContinuationPending;

    if-eqz v5, :cond_ed8

    .line 1968
    const/16 v69, 0x0

    .restart local v69    # "exState":I
    goto/16 :goto_1bc

    .line 1969
    .end local v69    # "exState":I
    :cond_ed8
    move-object/from16 v0, p2

    instance-of v5, v0, Ljava/lang/RuntimeException;

    if-eqz v5, :cond_eef

    .line 1970
    const/16 v5, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v5

    if-eqz v5, :cond_eec

    const/16 v69, 0x2

    .restart local v69    # "exState":I
    :goto_eea
    goto/16 :goto_1bc

    .end local v69    # "exState":I
    :cond_eec
    const/16 v69, 0x1

    goto :goto_eea

    .line 1973
    :cond_eef
    move-object/from16 v0, p2

    instance-of v5, v0, Ljava/lang/Error;

    if-eqz v5, :cond_f06

    .line 1974
    const/16 v5, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v5

    if-eqz v5, :cond_f03

    const/16 v69, 0x2

    .restart local v69    # "exState":I
    :goto_f01
    goto/16 :goto_1bc

    .end local v69    # "exState":I
    :cond_f03
    const/16 v69, 0x0

    goto :goto_f01

    .line 1977
    :cond_f06
    move-object/from16 v0, p2

    instance-of v5, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    if-eqz v5, :cond_f14

    .line 1979
    const/16 v69, 0x1

    .restart local v69    # "exState":I
    move-object/from16 v63, p2

    .line 1980
    check-cast v63, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    goto/16 :goto_1bc

    .line 1982
    .end local v69    # "exState":I
    :cond_f14
    const/16 v5, 0xd

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v5

    if-eqz v5, :cond_f22

    const/16 v69, 0x2

    .restart local v69    # "exState":I
    :goto_f20
    goto/16 :goto_1bc

    .end local v69    # "exState":I
    :cond_f22
    const/16 v69, 0x1

    goto :goto_f20

    .line 1990
    .restart local v69    # "exState":I
    :catch_f25
    move-exception v68

    .line 1991
    .local v68, "ex":Ljava/lang/RuntimeException;
    move-object/from16 p2, v68

    .line 1992
    .local p2, "throwable":Ljava/lang/RuntimeException;
    const/16 v69, 0x1

    move-object/from16 v5, p2

    .line 1999
    goto/16 :goto_1c9

    .line 1993
    .end local v68    # "ex":Ljava/lang/RuntimeException;
    .end local p2    # "throwable":Ljava/lang/RuntimeException;
    :catch_f2e
    move-exception v68

    .line 1996
    .local v68, "ex":Ljava/lang/Error;
    move-object/from16 p2, v68

    .line 1997
    .local p2, "throwable":Ljava/lang/Error;
    const/16 v63, 0x0

    .line 1998
    const/16 v69, 0x0

    move-object/from16 v5, p2

    goto/16 :goto_1c9

    .line 2008
    .end local v68    # "ex":Ljava/lang/Error;
    .end local p2    # "throwable":Ljava/lang/Error;
    .restart local v99    # "rex":Ljava/lang/RuntimeException;
    :catch_f39
    move-exception v68

    .line 2011
    .local v68, "ex":Ljava/lang/Throwable;
    move-object/from16 p2, v68

    .line 2012
    .local p2, "throwable":Ljava/lang/Throwable;
    const/16 v63, 0x0

    .line 2013
    const/16 v69, 0x0

    move-object/from16 v5, p2

    goto/16 :goto_1e2

    .line 2019
    .end local v68    # "ex":Ljava/lang/Throwable;
    .end local v99    # "rex":Ljava/lang/RuntimeException;
    .end local p2    # "throwable":Ljava/lang/Throwable;
    :cond_f44
    const/16 v92, 0x0

    goto/16 :goto_1eb

    .line 2031
    :cond_f48
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v5}, Lorg/mozilla/javascript/Interpreter;->exitFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)V

    .line 2033
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 p1, v0

    .line 2034
    if-nez p1, :cond_f6e

    .line 2044
    if-eqz v63, :cond_e87

    .line 2045
    move-object/from16 v0, v63

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v6, :cond_f62

    .line 2047
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2049
    :cond_f62
    move-object/from16 v0, v63

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v6, :cond_f7e

    .line 2051
    const/16 v20, -0x1

    move-object/from16 v111, v5

    .line 2052
    goto/16 :goto_54

    .line 2035
    :cond_f6e
    if-eqz v63, :cond_1e2

    move-object/from16 v0, v63

    iget-object v6, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object/from16 v0, p1

    if-ne v6, v0, :cond_1e2

    .line 2038
    const/16 v20, -0x1

    move-object/from16 v111, v5

    .line 2039
    goto/16 :goto_54

    .line 2055
    :cond_f7e
    move-object/from16 v0, v63

    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    move-object/from16 v79, v0

    .line 2056
    .restart local v79    # "interpreterResult":Ljava/lang/Object;
    move-object/from16 v0, v63

    iget-wide v0, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->resultDbl:D

    move-wide/from16 v80, v0

    .line 2057
    const/16 p2, 0x0

    .local p2, "throwable":Ljava/lang/Object;
    move-object/from16 v5, p2

    goto/16 :goto_e87

    .line 2072
    .end local v56    # "EX_CATCH_STATE":I
    .end local v57    # "EX_FINALLY_STATE":I
    .end local v58    # "EX_NO_JS_STATE":I
    .end local v63    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    .end local v69    # "exState":I
    .end local v79    # "interpreterResult":Ljava/lang/Object;
    .end local p2    # "throwable":Ljava/lang/Object;
    :cond_f90
    const/4 v6, 0x0

    move-object/from16 v0, p0

    iput-object v6, v0, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    .line 2074
    const/4 v6, 0x0

    move-object/from16 v0, p0

    iput-object v6, v0, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    goto/16 :goto_ea3

    .line 2082
    :cond_f9c
    check-cast v5, Ljava/lang/Error;

    throw v5

    .line 2086
    :cond_f9f
    move-object/from16 v0, v79

    move-object/from16 v1, v54

    if-ne v0, v1, :cond_18b

    invoke-static/range {v80 .. v81}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v79

    goto/16 :goto_18b

    .line 1933
    .restart local p2    # "throwable":Ljava/lang/Object;
    :catch_fab
    move-exception v68

    move-object/from16 v111, p2

    goto/16 :goto_e9

    .end local p2    # "throwable":Ljava/lang/Object;
    .restart local v7    # "op":I
    .restart local v8    # "stack":[Ljava/lang/Object;
    .restart local v9    # "sDbl":[D
    .restart local v13    # "iCode":[B
    .restart local v28    # "vars":[Ljava/lang/Object;
    .restart local v29    # "varDbls":[D
    .restart local v30    # "varAttributes":[I
    .restart local v103    # "stackTop":I
    .restart local v105    # "strings":[Ljava/lang/String;
    :cond_fb0
    move/from16 v10, v103

    .end local v103    # "stackTop":I
    .restart local v10    # "stackTop":I
    goto/16 :goto_2e1

    .end local v7    # "op":I
    .end local v8    # "stack":[Ljava/lang/Object;
    .end local v9    # "sDbl":[D
    .end local v10    # "stackTop":I
    .end local v13    # "iCode":[B
    .end local v28    # "vars":[Ljava/lang/Object;
    .end local v29    # "varDbls":[D
    .end local v30    # "varAttributes":[I
    .end local v105    # "strings":[Ljava/lang/String;
    .restart local v56    # "EX_CATCH_STATE":I
    .restart local v57    # "EX_FINALLY_STATE":I
    .restart local v58    # "EX_NO_JS_STATE":I
    .restart local v63    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    .restart local v69    # "exState":I
    :cond_fb4
    move-object/from16 v5, p2

    goto/16 :goto_1c9

    .line 974
    :pswitch_data_fb8
    .packed-switch -0x40
        :pswitch_d87
        :pswitch_1f9
        :pswitch_114
        :pswitch_9cd
        :pswitch_b8
        :pswitch_4a8
        :pswitch_c73
        :pswitch_c50
        :pswitch_616
        :pswitch_6dd
        :pswitch_d15
        :pswitch_cf5
        :pswitch_a47
        :pswitch_a3d
        :pswitch_a7c
        :pswitch_9e9
        :pswitch_a05
        :pswitch_e5b
        :pswitch_e45
        :pswitch_e2f
        :pswitch_e2a
        :pswitch_e25
        :pswitch_e20
        :pswitch_e1b
        :pswitch_e07
        :pswitch_df3
        :pswitch_ddd
        :pswitch_dd9
        :pswitch_dd5
        :pswitch_dd1
        :pswitch_dcd
        :pswitch_dc9
        :pswitch_dc5
        :pswitch_c96
        :pswitch_c2c
        :pswitch_c16
        :pswitch_96e
        :pswitch_953
        :pswitch_d98
        :pswitch_33f
        :pswitch_31a
        :pswitch_30c
        :pswitch_3e2
        :pswitch_6bf
        :pswitch_beb
        :pswitch_bd5
        :pswitch_69d
        :pswitch_663
        :pswitch_63b
        :pswitch_621
        :pswitch_93d
        :pswitch_bc7
        :pswitch_bb7
        :pswitch_5e0
        :pswitch_58c
        :pswitch_548
        :pswitch_9ab
        :pswitch_a25
        :pswitch_2c4
        :pswitch_375
        :pswitch_36e
        :pswitch_3b8
        :pswitch_398
        :pswitch_388
        :pswitch_4cc
        :pswitch_b8
        :pswitch_a82
        :pswitch_aa4
        :pswitch_3d2
        :pswitch_2e1
        :pswitch_2ac
        :pswitch_294
        :pswitch_46b
        :pswitch_3f9
        :pswitch_3f9
        :pswitch_3f9
        :pswitch_266
        :pswitch_266
        :pswitch_256
        :pswitch_256
        :pswitch_256
        :pswitch_256
        :pswitch_3f9
        :pswitch_3f9
        :pswitch_401
        :pswitch_435
        :pswitch_43e
        :pswitch_43e
        :pswitch_43e
        :pswitch_43e
        :pswitch_446
        :pswitch_3ea
        :pswitch_420
        :pswitch_420
        :pswitch_86a
        :pswitch_4cc
        :pswitch_927
        :pswitch_4f6
        :pswitch_4d6
        :pswitch_516
        :pswitch_578
        :pswitch_582
        :pswitch_6dd
        :pswitch_999
        :pswitch_989
        :pswitch_94d
        :pswitch_a51
        :pswitch_a58
        :pswitch_a6c
        :pswitch_a74
        :pswitch_27d
        :pswitch_27d
        :pswitch_bfc
        :pswitch_459
        :pswitch_221
        :pswitch_24c
        :pswitch_25e
        :pswitch_25e
        :pswitch_604
        :pswitch_a11
        :pswitch_9f5
        :pswitch_ab2
        :pswitch_afa
        :pswitch_afa
        :pswitch_afa
        :pswitch_b32
        :pswitch_b32
        :pswitch_a62
        :pswitch_144
        :pswitch_c96
        :pswitch_c96
        :pswitch_59a
        :pswitch_5aa
        :pswitch_5d0
        :pswitch_6dd
        :pswitch_b51
        :pswitch_17b
        :pswitch_46b
        :pswitch_d45
        :pswitch_d5f
        :pswitch_d73
        :pswitch_b71
        :pswitch_b7b
        :pswitch_b85
        :pswitch_ba5
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_b8
        :pswitch_9d9
    .end packed-switch
.end method

.method private static isFrameEnterExitRequired(Lorg/mozilla/javascript/Interpreter$CallFrame;)Z
    .registers 2
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;

    .prologue
    .line 2862
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

    if-nez v0, :cond_a

    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-boolean v0, v0, Lorg/mozilla/javascript/InterpreterData;->itsNeedsActivation:Z

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static processThrowable(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Interpreter$CallFrame;IZ)Lorg/mozilla/javascript/Interpreter$CallFrame;
    .registers 17
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "throwable"    # Ljava/lang/Object;
    .param p2, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p3, "indexReg"    # I
    .param p4, "instructionCounting"    # Z

    .prologue
    .line 2538
    if-ltz p3, :cond_3e

    .line 2542
    iget-boolean v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-eqz v9, :cond_a

    .line 2544
    invoke-virtual {p2}, Lorg/mozilla/javascript/Interpreter$CallFrame;->cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p2

    .line 2547
    :cond_a
    iget-object v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v7, v9, Lorg/mozilla/javascript/InterpreterData;->itsExceptionTable:[I

    .line 2549
    .local v7, "table":[I
    add-int/lit8 v9, p3, 0x2

    aget v9, v7, v9

    iput v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2550
    if-eqz p4, :cond_1a

    .line 2551
    iget v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    iput v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcPrevBranch:I

    .line 2554
    :cond_1a
    iget v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->emptyStackTop:I

    iput v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    .line 2555
    iget v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int/lit8 v10, p3, 0x5

    aget v10, v7, v10

    add-int v6, v9, v10

    .line 2558
    .local v6, "scopeLocal":I
    iget v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->localShift:I

    add-int/lit8 v10, p3, 0x4

    aget v10, v7, v10

    add-int v3, v9, v10

    .line 2561
    .local v3, "exLocal":I
    iget-object v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v9, v9, v6

    check-cast v9, Lorg/mozilla/javascript/Scriptable;

    iput-object v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 2562
    iget-object v9, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aput-object p1, v9, v3

    .line 2564
    const/4 p1, 0x0

    .line 2623
    .end local v3    # "exLocal":I
    .end local v6    # "scopeLocal":I
    .end local v7    # "table":[I
    :goto_3b
    iput-object p1, p2, Lorg/mozilla/javascript/Interpreter$CallFrame;->throwable:Ljava/lang/Object;

    .line 2624
    return-object p2

    :cond_3e
    move-object v0, p1

    .line 2567
    check-cast v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    .line 2570
    .local v0, "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    const/4 p1, 0x0

    .line 2572
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eq v9, p2, :cond_49

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2577
    :cond_49
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-nez v9, :cond_50

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2581
    :cond_50
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget v9, v9, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    add-int/lit8 v5, v9, 0x1

    .line 2582
    .local v5, "rewindCount":I
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v9, :cond_5f

    .line 2583
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget v9, v9, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    sub-int/2addr v5, v9

    .line 2586
    :cond_5f
    const/4 v1, 0x0

    .line 2587
    .local v1, "enterCount":I
    const/4 v2, 0x0

    .line 2589
    .local v2, "enterFrames":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v8, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2590
    .local v8, "x":Lorg/mozilla/javascript/Interpreter$CallFrame;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_64
    if-eq v4, v5, :cond_82

    .line 2591
    iget-boolean v9, v8, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v9, :cond_6d

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 2592
    :cond_6d
    invoke-static {v8}, Lorg/mozilla/javascript/Interpreter;->isFrameEnterExitRequired(Lorg/mozilla/javascript/Interpreter$CallFrame;)Z

    move-result v9

    if-eqz v9, :cond_7d

    .line 2593
    if-nez v2, :cond_79

    .line 2597
    sub-int v9, v5, v4

    new-array v2, v9, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2600
    :cond_79
    aput-object v8, v2, v1

    .line 2601
    add-int/lit8 v1, v1, 0x1

    .line 2603
    :cond_7d
    iget-object v8, v8, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 2590
    add-int/lit8 v4, v4, 0x1

    goto :goto_64

    .line 2606
    :cond_82
    :goto_82
    if-eqz v1, :cond_8f

    .line 2610
    add-int/lit8 v1, v1, -0x1

    .line 2611
    aget-object v8, v2, v1

    .line 2612
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    const/4 v10, 0x1

    invoke-static {p0, v8, v9, v10}, Lorg/mozilla/javascript/Interpreter;->enterFrame(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;[Ljava/lang/Object;Z)V

    goto :goto_82

    .line 2619
    :cond_8f
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    invoke-virtual {v9}, Lorg/mozilla/javascript/Interpreter$CallFrame;->cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-result-object p2

    .line 2620
    iget-object v9, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    iget-wide v10, v0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->resultDbl:D

    invoke-static {p2, v9, v10, v11}, Lorg/mozilla/javascript/Interpreter;->setCallResult(Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;D)V

    goto :goto_3b
.end method

.method public static restartContinuation(Lorg/mozilla/javascript/NativeContinuation;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p0, "c"    # Lorg/mozilla/javascript/NativeContinuation;
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 855
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->hasTopCall(Lorg/mozilla/javascript/Context;)Z

    move-result v3

    if-nez v3, :cond_c

    .line 856
    invoke-static {p0, p1, p2, v4, p3}, Lorg/mozilla/javascript/ScriptRuntime;->doTopCall(Lorg/mozilla/javascript/Callable;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 875
    :cond_b
    :goto_b
    return-object v0

    .line 860
    :cond_c
    array-length v3, p3

    if-nez v3, :cond_25

    .line 861
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 866
    .local v0, "arg":Ljava/lang/Object;
    :goto_11
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeContinuation;->getImplementation()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 867
    .local v1, "capturedFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    if-eqz v1, :cond_b

    .line 872
    new-instance v2, Lorg/mozilla/javascript/Interpreter$ContinuationJump;

    invoke-direct {v2, p0, v4}, Lorg/mozilla/javascript/Interpreter$ContinuationJump;-><init>(Lorg/mozilla/javascript/NativeContinuation;Lorg/mozilla/javascript/Interpreter$CallFrame;)V

    .line 874
    .local v2, "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    iput-object v0, v2, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->result:Ljava/lang/Object;

    .line 875
    invoke-static {p1, v4, v2}, Lorg/mozilla/javascript/Interpreter;->interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_b

    .line 863
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v1    # "capturedFrame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v2    # "cjump":Lorg/mozilla/javascript/Interpreter$ContinuationJump;
    :cond_25
    const/4 v3, 0x0

    aget-object v0, p3, v3

    .restart local v0    # "arg":Ljava/lang/Object;
    goto :goto_11
.end method

.method public static resumeGenerator(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "operation"    # I
    .param p3, "savedState"    # Ljava/lang/Object;
    .param p4, "value"    # Ljava/lang/Object;

    .prologue
    .line 834
    move-object v1, p3

    check-cast v1, Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 835
    .local v1, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    new-instance v2, Lorg/mozilla/javascript/Interpreter$GeneratorState;

    invoke-direct {v2, p2, p4}, Lorg/mozilla/javascript/Interpreter$GeneratorState;-><init>(ILjava/lang/Object;)V

    .line 836
    .local v2, "generatorState":Lorg/mozilla/javascript/Interpreter$GeneratorState;
    const/4 v4, 0x2

    if-ne p2, v4, :cond_17

    .line 838
    :try_start_b
    invoke-static {p0, v1, v2}, Lorg/mozilla/javascript/Interpreter;->interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_e} :catch_10

    move-result-object v3

    .line 849
    :cond_f
    :goto_f
    return-object v3

    .line 839
    :catch_10
    move-exception v0

    .line 841
    .local v0, "e":Ljava/lang/RuntimeException;
    if-eq v0, p4, :cond_14

    .line 842
    throw v0

    .line 844
    :cond_14
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_f

    .line 846
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_17
    invoke-static {p0, v1, v2}, Lorg/mozilla/javascript/Interpreter;->interpretLoop(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 847
    .local v3, "result":Ljava/lang/Object;
    iget-object v4, v2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    if-eqz v4, :cond_f

    .line 848
    iget-object v4, v2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->returnedException:Ljava/lang/RuntimeException;

    throw v4
.end method

.method private static setCallResult(Lorg/mozilla/javascript/Interpreter$CallFrame;Ljava/lang/Object;D)V
    .registers 6
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "callResult"    # Ljava/lang/Object;
    .param p2, "callResultDbl"    # D

    .prologue
    .line 2956
    iget v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    const/16 v1, 0x26

    if-ne v0, v1, :cond_16

    .line 2957
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    aput-object p1, v0, v1

    .line 2958
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    iget v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    aput-wide p2, v0, v1

    .line 2969
    :cond_12
    :goto_12
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    .line 2970
    return-void

    .line 2959
    :cond_16
    iget v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedCallOp:I

    const/16 v1, 0x1e

    if-ne v0, v1, :cond_27

    .line 2963
    instance-of v0, p1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_12

    .line 2964
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->savedStackTop:I

    aput-object p1, v0, v1

    goto :goto_12

    .line 2967
    :cond_27
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_12
.end method

.method private static stack_boolean(Lorg/mozilla/javascript/Interpreter$CallFrame;I)Z
    .registers 10
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "i"    # I

    .prologue
    const-wide/16 v6, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 3050
    iget-object v5, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v2, v5, p1

    .line 3051
    .local v2, "x":Ljava/lang/Object;
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne v2, v5, :cond_d

    .line 3066
    .end local v2    # "x":Ljava/lang/Object;
    :cond_c
    :goto_c
    return v3

    .line 3053
    .restart local v2    # "x":Ljava/lang/Object;
    :cond_d
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-ne v2, v5, :cond_13

    move v3, v4

    .line 3054
    goto :goto_c

    .line 3055
    :cond_13
    sget-object v5, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v2, v5, :cond_25

    .line 3056
    iget-object v5, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    aget-wide v0, v5, p1

    .line 3057
    .local v0, "d":D
    cmpl-double v5, v0, v0

    if-nez v5, :cond_23

    cmpl-double v5, v0, v6

    if-nez v5, :cond_c

    :cond_23
    move v3, v4

    goto :goto_c

    .line 3058
    .end local v0    # "d":D
    :cond_25
    if-eqz v2, :cond_2b

    sget-object v5, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v2, v5, :cond_2d

    :cond_2b
    move v3, v4

    .line 3059
    goto :goto_c

    .line 3060
    :cond_2d
    instance-of v5, v2, Ljava/lang/Number;

    if-eqz v5, :cond_41

    .line 3061
    check-cast v2, Ljava/lang/Number;

    .end local v2    # "x":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 3062
    .restart local v0    # "d":D
    cmpl-double v5, v0, v0

    if-nez v5, :cond_3f

    cmpl-double v5, v0, v6

    if-nez v5, :cond_c

    :cond_3f
    move v3, v4

    goto :goto_c

    .line 3063
    .end local v0    # "d":D
    .restart local v2    # "x":Ljava/lang/Object;
    :cond_41
    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_4c

    .line 3064
    check-cast v2, Ljava/lang/Boolean;

    .end local v2    # "x":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_c

    .line 3066
    .restart local v2    # "x":Ljava/lang/Object;
    :cond_4c
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_c
.end method

.method private static stack_double(Lorg/mozilla/javascript/Interpreter$CallFrame;I)D
    .registers 5
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "i"    # I

    .prologue
    .line 3040
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v1, p1

    .line 3041
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-eq v0, v1, :cond_d

    .line 3042
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    .line 3044
    :goto_c
    return-wide v1

    :cond_d
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    aget-wide v1, v1, p1

    goto :goto_c
.end method

.method private static stack_int32(Lorg/mozilla/javascript/Interpreter$CallFrame;I)I
    .registers 5
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "i"    # I

    .prologue
    .line 3030
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    aget-object v0, v1, p1

    .line 3031
    .local v0, "x":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/UniqueTag;->DOUBLE_MARK:Lorg/mozilla/javascript/UniqueTag;

    if-ne v0, v1, :cond_11

    .line 3032
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    aget-wide v1, v1, p1

    invoke-static {v1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(D)I

    move-result v1

    .line 3034
    :goto_10
    return v1

    :cond_11
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    goto :goto_10
.end method

.method private static thawGenerator(Lorg/mozilla/javascript/Interpreter$CallFrame;ILorg/mozilla/javascript/Interpreter$GeneratorState;I)Ljava/lang/Object;
    .registers 8
    .param p0, "frame"    # Lorg/mozilla/javascript/Interpreter$CallFrame;
    .param p1, "stackTop"    # I
    .param p2, "generatorState"    # Lorg/mozilla/javascript/Interpreter$GeneratorState;
    .param p3, "op"    # I

    .prologue
    .line 2651
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 2652
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v1, v1, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    iget v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    invoke-static {v1, v2}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v0

    .line 2653
    .local v0, "sourceLine":I
    iget v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pc:I

    .line 2654
    iget v1, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_24

    .line 2657
    new-instance v1, Lorg/mozilla/javascript/JavaScriptException;

    iget-object v2, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    iget-object v3, v3, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v0}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    .line 2668
    :goto_23
    return-object v1

    .line 2661
    :cond_24
    iget v1, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2c

    .line 2662
    iget-object v1, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    goto :goto_23

    .line 2664
    :cond_2c
    iget v1, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->operation:I

    if-eqz v1, :cond_35

    .line 2665
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 2666
    :cond_35
    const/16 v1, 0x48

    if-ne p3, v1, :cond_3f

    .line 2667
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    iget-object v2, p2, Lorg/mozilla/javascript/Interpreter$GeneratorState;->value:Ljava/lang/Object;

    aput-object v2, v1, p1

    .line 2668
    :cond_3f
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_23
.end method


# virtual methods
.method public captureStackInfo(Lorg/mozilla/javascript/RhinoException;)V
    .registers 12
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;

    .prologue
    const/4 v9, 0x0

    .line 596
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 597
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    if-eqz v1, :cond_b

    iget-object v8, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-nez v8, :cond_10

    .line 599
    :cond_b
    iput-object v9, p1, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    .line 600
    iput-object v9, p1, Lorg/mozilla/javascript/RhinoException;->interpreterLineData:[I

    .line 647
    :goto_f
    return-void

    .line 605
    :cond_10
    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    if-eqz v8, :cond_1c

    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v8

    if-nez v8, :cond_37

    .line 608
    :cond_1c
    const/4 v8, 0x1

    new-array v0, v8, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 623
    .local v0, "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_1f
    array-length v8, v0

    add-int/lit8 v9, v8, -0x1

    iget-object v8, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v8, Lorg/mozilla/javascript/Interpreter$CallFrame;

    aput-object v8, v0, v9

    .line 625
    const/4 v4, 0x0

    .line 626
    .local v4, "interpreterFrameCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2a
    array-length v8, v0

    if-eq v3, v8, :cond_53

    .line 627
    aget-object v8, v0, v3

    iget v8, v8, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    add-int/lit8 v8, v8, 0x1

    add-int/2addr v4, v8

    .line 626
    add-int/lit8 v3, v3, 0x1

    goto :goto_2a

    .line 610
    .end local v0    # "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v3    # "i":I
    .end local v4    # "interpreterFrameCount":I
    :cond_37
    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->size()I

    move-result v7

    .line 611
    .local v7, "previousCount":I
    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8}, Lorg/mozilla/javascript/ObjArray;->peek()Ljava/lang/Object;

    move-result-object v8

    iget-object v9, v1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    if-ne v8, v9, :cond_49

    .line 618
    add-int/lit8 v7, v7, -0x1

    .line 620
    :cond_49
    add-int/lit8 v8, v7, 0x1

    new-array v0, v8, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 621
    .restart local v0    # "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v8, v1, Lorg/mozilla/javascript/Context;->previousInterpreterInvocations:Lorg/mozilla/javascript/ObjArray;

    invoke-virtual {v8, v0}, Lorg/mozilla/javascript/ObjArray;->toArray([Ljava/lang/Object;)V

    goto :goto_1f

    .line 630
    .end local v7    # "previousCount":I
    .restart local v3    # "i":I
    .restart local v4    # "interpreterFrameCount":I
    :cond_53
    new-array v5, v4, [I

    .line 633
    .local v5, "linePC":[I
    move v6, v4

    .line 634
    .local v6, "linePCIndex":I
    array-length v3, v0

    :cond_57
    if-eqz v3, :cond_68

    .line 635
    add-int/lit8 v3, v3, -0x1

    .line 636
    aget-object v2, v0, v3

    .line 637
    .local v2, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_5d
    if-eqz v2, :cond_57

    .line 638
    add-int/lit8 v6, v6, -0x1

    .line 639
    iget v8, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    aput v8, v5, v6

    .line 640
    iget-object v2, v2, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    goto :goto_5d

    .line 643
    .end local v2    # "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :cond_68
    if-eqz v6, :cond_6d

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 645
    :cond_6d
    iput-object v0, p1, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    .line 646
    iput-object v5, p1, Lorg/mozilla/javascript/RhinoException;->interpreterLineData:[I

    goto :goto_f
.end method

.method public compile(Lorg/mozilla/javascript/CompilerEnvirons;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)Ljava/lang/Object;
    .registers 7
    .param p1, "compilerEnv"    # Lorg/mozilla/javascript/CompilerEnvirons;
    .param p2, "tree"    # Lorg/mozilla/javascript/ast/ScriptNode;
    .param p3, "encodedSource"    # Ljava/lang/String;
    .param p4, "returnFunction"    # Z

    .prologue
    .line 193
    new-instance v0, Lorg/mozilla/javascript/CodeGenerator;

    invoke-direct {v0}, Lorg/mozilla/javascript/CodeGenerator;-><init>()V

    .line 194
    .local v0, "cgen":Lorg/mozilla/javascript/CodeGenerator;
    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/mozilla/javascript/CodeGenerator;->compile(Lorg/mozilla/javascript/CompilerEnvirons;Lorg/mozilla/javascript/ast/ScriptNode;Ljava/lang/String;Z)Lorg/mozilla/javascript/InterpreterData;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    .line 195
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    return-object v1
.end method

.method public createFunctionObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/Function;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "bytecode"    # Ljava/lang/Object;
    .param p4, "staticSecurityDomain"    # Ljava/lang/Object;

    .prologue
    .line 216
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    if-eq p3, v0, :cond_7

    .line 218
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 220
    :cond_7
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    invoke-static {p1, p2, v0, p4}, Lorg/mozilla/javascript/InterpretedFunction;->createFunction(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/InterpreterData;Ljava/lang/Object;)Lorg/mozilla/javascript/InterpretedFunction;

    move-result-object v0

    return-object v0
.end method

.method public createScriptObject(Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/Script;
    .registers 4
    .param p1, "bytecode"    # Ljava/lang/Object;
    .param p2, "staticSecurityDomain"    # Ljava/lang/Object;

    .prologue
    .line 200
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    if-eq p1, v0, :cond_7

    .line 202
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 204
    :cond_7
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter;->itsData:Lorg/mozilla/javascript/InterpreterData;

    invoke-static {v0, p2}, Lorg/mozilla/javascript/InterpretedFunction;->createScript(Lorg/mozilla/javascript/InterpreterData;Ljava/lang/Object;)Lorg/mozilla/javascript/InterpretedFunction;

    move-result-object v0

    return-object v0
.end method

.method public getPatchedStack(Lorg/mozilla/javascript/RhinoException;Ljava/lang/String;)Ljava/lang/String;
    .registers 18
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;
    .param p2, "nativeStackTrace"    # Ljava/lang/String;

    .prologue
    .line 664
    const-string v13, "org.mozilla.javascript.Interpreter.interpretLoop"

    .line 665
    .local v13, "tag":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit16 v14, v14, 0x3e8

    invoke-direct {v12, v14}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 666
    .local v12, "sb":Ljava/lang/StringBuilder;
    const-string v14, "line.separator"

    invoke-static {v14}, Lorg/mozilla/javascript/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 668
    .local v8, "lineSeparator":Ljava/lang/String;
    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    check-cast v14, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object v1, v14

    check-cast v1, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 669
    .local v1, "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    move-object/from16 v0, p1

    iget-object v6, v0, Lorg/mozilla/javascript/RhinoException;->interpreterLineData:[I

    .line 670
    .local v6, "linePC":[I
    array-length v2, v1

    .line 671
    .local v2, "arrayIndex":I
    array-length v7, v6

    .line 672
    .local v7, "linePCIndex":I
    const/4 v9, 0x0

    .line 673
    .local v9, "offset":I
    :cond_23
    if-eqz v2, :cond_2f

    .line 674
    add-int/lit8 v2, v2, -0x1

    .line 675
    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v11

    .line 676
    .local v11, "pos":I
    if-gez v11, :cond_3d

    .line 715
    .end local v11    # "pos":I
    :cond_2f
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 717
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    return-object v14

    .line 681
    .restart local v11    # "pos":I
    :cond_3d
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v14

    add-int/2addr v11, v14

    .line 683
    :goto_42
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v14

    if-eq v11, v14, :cond_56

    .line 684
    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 685
    .local v3, "c":C
    const/16 v14, 0xa

    if-eq v3, v14, :cond_56

    const/16 v14, 0xd

    if-ne v3, v14, :cond_af

    .line 689
    .end local v3    # "c":C
    :cond_56
    move-object/from16 v0, p2

    invoke-virtual {v0, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 690
    move v9, v11

    .line 692
    aget-object v4, v1, v2

    .line 693
    .local v4, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :goto_62
    if-eqz v4, :cond_23

    .line 694
    if-nez v7, :cond_69

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 695
    :cond_69
    add-int/lit8 v7, v7, -0x1

    .line 696
    iget-object v5, v4, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 697
    .local v5, "idata":Lorg/mozilla/javascript/InterpreterData;
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 698
    const-string v14, "\tat script"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 699
    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    if-eqz v14, :cond_8b

    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_8b

    .line 700
    const/16 v14, 0x2e

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 701
    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    :cond_8b
    const/16 v14, 0x28

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 704
    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 705
    aget v10, v6, v7

    .line 706
    .local v10, "pc":I
    if-ltz v10, :cond_a7

    .line 708
    const/16 v14, 0x3a

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 709
    iget-object v14, v5, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    invoke-static {v14, v10}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 711
    :cond_a7
    const/16 v14, 0x29

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 712
    iget-object v4, v4, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 713
    goto :goto_62

    .line 683
    .end local v4    # "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v5    # "idata":Lorg/mozilla/javascript/InterpreterData;
    .end local v10    # "pc":I
    .restart local v3    # "c":C
    :cond_af
    add-int/lit8 v11, v11, 0x1

    goto :goto_42
.end method

.method public getScriptStack(Lorg/mozilla/javascript/RhinoException;)Ljava/util/List;
    .registers 15
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/RhinoException;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 721
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/Interpreter;->getScriptStackElements(Lorg/mozilla/javascript/RhinoException;)[[Lorg/mozilla/javascript/ScriptStackElement;

    move-result-object v11

    .line 722
    .local v11, "stack":[[Lorg/mozilla/javascript/ScriptStackElement;
    new-instance v9, Ljava/util/ArrayList;

    array-length v12, v11

    invoke-direct {v9, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 723
    .local v9, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v12, "line.separator"

    invoke-static {v12}, Lorg/mozilla/javascript/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 725
    .local v8, "lineSeparator":Ljava/lang/String;
    move-object v0, v11

    .local v0, "arr$":[[Lorg/mozilla/javascript/ScriptStackElement;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    move v5, v4

    .end local v0    # "arr$":[[Lorg/mozilla/javascript/ScriptStackElement;
    .end local v4    # "i$":I
    .end local v6    # "len$":I
    .local v5, "i$":I
    :goto_14
    if-ge v5, v6, :cond_38

    aget-object v3, v0, v5

    .line 726
    .local v3, "group":[Lorg/mozilla/javascript/ScriptStackElement;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 727
    .local v10, "sb":Ljava/lang/StringBuilder;
    move-object v1, v3

    .local v1, "arr$":[Lorg/mozilla/javascript/ScriptStackElement;
    array-length v7, v1

    .local v7, "len$":I
    const/4 v4, 0x0

    .end local v5    # "i$":I
    .restart local v4    # "i$":I
    :goto_20
    if-ge v4, v7, :cond_2d

    aget-object v2, v1, v4

    .line 728
    .local v2, "elem":Lorg/mozilla/javascript/ScriptStackElement;
    invoke-virtual {v2, v10}, Lorg/mozilla/javascript/ScriptStackElement;->renderJavaStyle(Ljava/lang/StringBuilder;)V

    .line 729
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 727
    add-int/lit8 v4, v4, 0x1

    goto :goto_20

    .line 731
    .end local v2    # "elem":Lorg/mozilla/javascript/ScriptStackElement;
    :cond_2d
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 725
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_14

    .line 733
    .end local v1    # "arr$":[Lorg/mozilla/javascript/ScriptStackElement;
    .end local v3    # "group":[Lorg/mozilla/javascript/ScriptStackElement;
    .end local v7    # "len$":I
    .end local v10    # "sb":Ljava/lang/StringBuilder;
    :cond_38
    return-object v9
.end method

.method public getScriptStackElements(Lorg/mozilla/javascript/RhinoException;)[[Lorg/mozilla/javascript/ScriptStackElement;
    .registers 15
    .param p1, "ex"    # Lorg/mozilla/javascript/RhinoException;

    .prologue
    .line 738
    iget-object v12, p1, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    if-nez v12, :cond_8

    .line 739
    const/4 v12, 0x0

    check-cast v12, [[Lorg/mozilla/javascript/ScriptStackElement;

    .line 771
    :goto_7
    return-object v12

    .line 742
    :cond_8
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 744
    .local v10, "list":Ljava/util/List;, "Ljava/util/List<[Lorg/mozilla/javascript/ScriptStackElement;>;"
    iget-object v12, p1, Lorg/mozilla/javascript/RhinoException;->interpreterStackInfo:Ljava/lang/Object;

    check-cast v12, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    move-object v0, v12

    check-cast v0, [Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 745
    .local v0, "array":[Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v8, p1, Lorg/mozilla/javascript/RhinoException;->interpreterLineData:[I

    .line 746
    .local v8, "linePC":[I
    array-length v1, v0

    .line 747
    .local v1, "arrayIndex":I
    array-length v9, v8

    .line 748
    .local v9, "linePCIndex":I
    :goto_18
    if-eqz v1, :cond_63

    .line 749
    add-int/lit8 v1, v1, -0x1

    .line 750
    aget-object v3, v0, v1

    .line 751
    .local v3, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 752
    .local v5, "group":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ScriptStackElement;>;"
    :goto_23
    if-eqz v3, :cond_55

    .line 753
    if-nez v9, :cond_2a

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 754
    :cond_2a
    add-int/lit8 v9, v9, -0x1

    .line 755
    iget-object v6, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 756
    .local v6, "idata":Lorg/mozilla/javascript/InterpreterData;
    iget-object v2, v6, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    .line 757
    .local v2, "fileName":Ljava/lang/String;
    const/4 v4, 0x0

    .line 758
    .local v4, "functionName":Ljava/lang/String;
    const/4 v7, -0x1

    .line 759
    .local v7, "lineNumber":I
    aget v11, v8, v9

    .line 760
    .local v11, "pc":I
    if-ltz v11, :cond_3c

    .line 761
    iget-object v12, v6, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    invoke-static {v12, v11}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v7

    .line 763
    :cond_3c
    iget-object v12, v6, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    if-eqz v12, :cond_4a

    iget-object v12, v6, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_4a

    .line 764
    iget-object v4, v6, Lorg/mozilla/javascript/InterpreterData;->itsName:Ljava/lang/String;

    .line 766
    :cond_4a
    iget-object v3, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 767
    new-instance v12, Lorg/mozilla/javascript/ScriptStackElement;

    invoke-direct {v12, v2, v4, v7}, Lorg/mozilla/javascript/ScriptStackElement;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v5, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_23

    .line 769
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v4    # "functionName":Ljava/lang/String;
    .end local v6    # "idata":Lorg/mozilla/javascript/InterpreterData;
    .end local v7    # "lineNumber":I
    .end local v11    # "pc":I
    :cond_55
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [Lorg/mozilla/javascript/ScriptStackElement;

    invoke-interface {v5, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    invoke-interface {v10, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_18

    .line 771
    .end local v3    # "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    .end local v5    # "group":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ScriptStackElement;>;"
    :cond_63
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [[Lorg/mozilla/javascript/ScriptStackElement;

    invoke-interface {v10, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [[Lorg/mozilla/javascript/ScriptStackElement;

    goto :goto_7
.end method

.method public getSourcePositionFromStack(Lorg/mozilla/javascript/Context;[I)Ljava/lang/String;
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "linep"    # [I

    .prologue
    const/4 v4, 0x0

    .line 651
    iget-object v0, p1, Lorg/mozilla/javascript/Context;->lastInterpreterFrame:Ljava/lang/Object;

    check-cast v0, Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 652
    .local v0, "frame":Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v1, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->idata:Lorg/mozilla/javascript/InterpreterData;

    .line 653
    .local v1, "idata":Lorg/mozilla/javascript/InterpreterData;
    iget v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    if-ltz v2, :cond_18

    .line 654
    iget-object v2, v1, Lorg/mozilla/javascript/InterpreterData;->itsICode:[B

    iget v3, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->pcSourceLineStart:I

    invoke-static {v2, v3}, Lorg/mozilla/javascript/Interpreter;->getIndex([BI)I

    move-result v2

    aput v2, p2, v4

    .line 658
    :goto_15
    iget-object v2, v1, Lorg/mozilla/javascript/InterpreterData;->itsSourceFile:Ljava/lang/String;

    return-object v2

    .line 656
    :cond_18
    aput v4, p2, v4

    goto :goto_15
.end method

.method public setEvalScriptFlag(Lorg/mozilla/javascript/Script;)V
    .registers 4
    .param p1, "script"    # Lorg/mozilla/javascript/Script;

    .prologue
    .line 209
    check-cast p1, Lorg/mozilla/javascript/InterpretedFunction;

    .end local p1    # "script":Lorg/mozilla/javascript/Script;
    iget-object v0, p1, Lorg/mozilla/javascript/InterpretedFunction;->idata:Lorg/mozilla/javascript/InterpreterData;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lorg/mozilla/javascript/InterpreterData;->evalScriptFlag:Z

    .line 210
    return-void
.end method
