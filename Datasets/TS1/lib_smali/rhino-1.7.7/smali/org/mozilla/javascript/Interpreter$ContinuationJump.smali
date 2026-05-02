.class final Lorg/mozilla/javascript/Interpreter$ContinuationJump;
.super Ljava/lang/Object;
.source "Interpreter.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/Interpreter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ContinuationJump"
.end annotation


# static fields
.field static final serialVersionUID:J = 0x6ab05607ef7f8517L


# instance fields
.field branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

.field capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

.field result:Ljava/lang/Object;

.field resultDbl:D


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/NativeContinuation;Lorg/mozilla/javascript/Interpreter$CallFrame;)V
    .registers 8
    .param p1, "c"    # Lorg/mozilla/javascript/NativeContinuation;
    .param p2, "current"    # Lorg/mozilla/javascript/Interpreter$CallFrame;

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    invoke-virtual {p1}, Lorg/mozilla/javascript/NativeContinuation;->getImplementation()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/mozilla/javascript/Interpreter$CallFrame;

    iput-object v3, p0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 119
    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v3, :cond_11

    if-nez p2, :cond_15

    .line 123
    :cond_11
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 158
    :cond_14
    :goto_14
    return-void

    .line 127
    :cond_15
    iget-object v0, p0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 128
    .local v0, "chain1":Lorg/mozilla/javascript/Interpreter$CallFrame;
    move-object v1, p2

    .line 132
    .local v1, "chain2":Lorg/mozilla/javascript/Interpreter$CallFrame;
    iget v3, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    iget v4, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    sub-int v2, v3, v4

    .line 133
    .local v2, "diff":I
    if-eqz v2, :cond_35

    .line 134
    if-gez v2, :cond_26

    .line 137
    move-object v0, p2

    .line 138
    iget-object v1, p0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->capturedFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 139
    neg-int v2, v2

    .line 142
    :cond_26
    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 143
    add-int/lit8 v2, v2, -0x1

    if-nez v2, :cond_26

    .line 144
    iget v3, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    iget v4, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->frameIndex:I

    if-eq v3, v4, :cond_35

    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    .line 149
    :cond_35
    :goto_35
    if-eq v0, v1, :cond_3e

    if-eqz v0, :cond_3e

    .line 150
    iget-object v0, v0, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 151
    iget-object v1, v1, Lorg/mozilla/javascript/Interpreter$CallFrame;->parentFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    goto :goto_35

    .line 154
    :cond_3e
    iput-object v0, p0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    .line 155
    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    if-eqz v3, :cond_14

    iget-object v3, p0, Lorg/mozilla/javascript/Interpreter$ContinuationJump;->branchFrame:Lorg/mozilla/javascript/Interpreter$CallFrame;

    iget-boolean v3, v3, Lorg/mozilla/javascript/Interpreter$CallFrame;->frozen:Z

    if-nez v3, :cond_14

    .line 156
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    goto :goto_14
.end method
