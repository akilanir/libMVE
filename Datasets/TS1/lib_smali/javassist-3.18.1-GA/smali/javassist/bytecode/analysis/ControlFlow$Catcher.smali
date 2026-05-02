.class public Ljavassist/bytecode/analysis/ControlFlow$Catcher;
.super Ljava/lang/Object;
.source "ControlFlow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/analysis/ControlFlow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Catcher"
.end annotation


# instance fields
.field private node:Ljavassist/bytecode/analysis/ControlFlow$Block;

.field private typeIndex:I


# direct methods
.method constructor <init>(Ljavassist/bytecode/stackmap/BasicBlock$Catch;)V
    .registers 3
    .param p1, "c"    # Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    .prologue
    .line 477
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 478
    iget-object v0, p1, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->body:Ljavassist/bytecode/stackmap/BasicBlock;

    check-cast v0, Ljavassist/bytecode/analysis/ControlFlow$Block;

    iput-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Catcher;->node:Ljavassist/bytecode/analysis/ControlFlow$Block;

    .line 479
    iget v0, p1, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->typeIndex:I

    iput v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Catcher;->typeIndex:I

    .line 480
    return-void
.end method


# virtual methods
.method public block()Ljavassist/bytecode/analysis/ControlFlow$Block;
    .registers 2

    .prologue
    .line 485
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Catcher;->node:Ljavassist/bytecode/analysis/ControlFlow$Block;

    return-object v0
.end method

.method public type()Ljava/lang/String;
    .registers 3

    .prologue
    .line 492
    iget v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Catcher;->typeIndex:I

    if-nez v0, :cond_7

    .line 493
    const-string v0, "java.lang.Throwable"

    .line 495
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Catcher;->node:Ljavassist/bytecode/analysis/ControlFlow$Block;

    iget-object v0, v0, Ljavassist/bytecode/analysis/ControlFlow$Block;->method:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    iget v1, p0, Ljavassist/bytecode/analysis/ControlFlow$Catcher;->typeIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
