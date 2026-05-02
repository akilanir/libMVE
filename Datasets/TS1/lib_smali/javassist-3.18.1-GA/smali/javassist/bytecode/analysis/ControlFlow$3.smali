.class Ljavassist/bytecode/analysis/ControlFlow$3;
.super Ljavassist/bytecode/analysis/ControlFlow$Access;
.source "ControlFlow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/bytecode/analysis/ControlFlow;->postDominatorTree()[Ljavassist/bytecode/analysis/ControlFlow$Node;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljavassist/bytecode/analysis/ControlFlow;


# direct methods
.method constructor <init>(Ljavassist/bytecode/analysis/ControlFlow;[Ljavassist/bytecode/analysis/ControlFlow$Node;)V
    .registers 3
    .param p2, "x0"    # [Ljavassist/bytecode/analysis/ControlFlow$Node;

    .prologue
    .line 193
    iput-object p1, p0, Ljavassist/bytecode/analysis/ControlFlow$3;->this$0:Ljavassist/bytecode/analysis/ControlFlow;

    invoke-direct {p0, p2}, Ljavassist/bytecode/analysis/ControlFlow$Access;-><init>([Ljavassist/bytecode/analysis/ControlFlow$Node;)V

    return-void
.end method


# virtual methods
.method entrances(Ljavassist/bytecode/analysis/ControlFlow$Node;)[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 3
    .param p1, "n"    # Ljavassist/bytecode/analysis/ControlFlow$Node;

    .prologue
    .line 195
    # getter for: Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;
    invoke-static {p1}, Ljavassist/bytecode/analysis/ControlFlow$Node;->access$100(Ljavassist/bytecode/analysis/ControlFlow$Node;)Ljavassist/bytecode/analysis/ControlFlow$Block;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/analysis/ControlFlow$Block;->getExit()[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v0

    return-object v0
.end method

.method exits(Ljavassist/bytecode/analysis/ControlFlow$Node;)[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 3
    .param p1, "n"    # Ljavassist/bytecode/analysis/ControlFlow$Node;

    .prologue
    .line 194
    # getter for: Ljavassist/bytecode/analysis/ControlFlow$Node;->block:Ljavassist/bytecode/analysis/ControlFlow$Block;
    invoke-static {p1}, Ljavassist/bytecode/analysis/ControlFlow$Node;->access$100(Ljavassist/bytecode/analysis/ControlFlow$Node;)Ljavassist/bytecode/analysis/ControlFlow$Block;

    move-result-object v0

    iget-object v0, v0, Ljavassist/bytecode/analysis/ControlFlow$Block;->entrances:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    return-object v0
.end method
