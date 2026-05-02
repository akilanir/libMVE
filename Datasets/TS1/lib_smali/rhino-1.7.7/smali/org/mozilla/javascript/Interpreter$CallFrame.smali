.class Lorg/mozilla/javascript/Interpreter$CallFrame;
.super Ljava/lang/Object;
.source "Interpreter.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/Interpreter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CallFrame"
.end annotation


# static fields
.field static final serialVersionUID:J = -0x27772e38498fb682L


# instance fields
.field debuggerFrame:Lorg/mozilla/javascript/debug/DebugFrame;

.field emptyStackTop:I

.field fnOrScript:Lorg/mozilla/javascript/InterpretedFunction;

.field frameIndex:I

.field frozen:Z

.field idata:Lorg/mozilla/javascript/InterpreterData;

.field isContinuationsTopFrame:Z

.field localShift:I

.field parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

.field pc:I

.field pcPrevBranch:I

.field pcSourceLineStart:I

.field result:Ljava/lang/Object;

.field resultDbl:D

.field sDbl:[D

.field savedCallOp:I

.field savedStackTop:I

.field scope:Lorg/mozilla/javascript/Scriptable;

.field stack:[Ljava/lang/Object;

.field stackAttributes:[I

.field thisObj:Lorg/mozilla/javascript/Scriptable;

.field throwable:Ljava/lang/Object;

.field useActivation:Z

.field varSource:Lorg/mozilla/javascript/Interpreter$CallFrame;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/mozilla/javascript/Interpreter$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/mozilla/javascript/Interpreter$1;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/mozilla/javascript/Interpreter$CallFrame;-><init>()V

    return-void
.end method


# virtual methods
.method cloneFrozen()Lorg/mozilla/javascript/Interpreter$CallFrame;
    .registers 4

    .prologue
    .line 86
    iget-boolean v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v2, :cond_7

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 90
    :cond_7
    :try_start_7
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/Interpreter$CallFrame;
    :try_end_d
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_7 .. :try_end_d} :catch_2f

    .line 98
    .local v0, "copy":Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    invoke-virtual {v2}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    iput-object v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stack:[Ljava/lang/Object;

    .line 99
    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    invoke-virtual {v2}, [I->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    iput-object v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->stackAttributes:[I

    .line 100
    iget-object v2, p0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    invoke-virtual {v2}, [D->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    iput-object v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->sDbl:[D

    .line 102
    const/4 v2, 0x0

    iput-boolean v2, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    .line 103
    return-object v0

    .line 91
    .end local v0    # "copy":Lorg/mozilla/javascript/Interpreter$CallFrame;
    :catch_2f
    move-exception v1

    .line 92
    .local v1, "ex":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2
.end method
