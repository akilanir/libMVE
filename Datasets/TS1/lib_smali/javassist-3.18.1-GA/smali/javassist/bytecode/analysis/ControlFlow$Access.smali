.class abstract Ljavassist/bytecode/analysis/ControlFlow$Access;
.super Ljava/lang/Object;
.source "ControlFlow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/analysis/ControlFlow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Access"
.end annotation


# instance fields
.field all:[Ljavassist/bytecode/analysis/ControlFlow$Node;


# direct methods
.method constructor <init>([Ljavassist/bytecode/analysis/ControlFlow$Node;)V
    .registers 2
    .param p1, "nodes"    # [Ljavassist/bytecode/analysis/ControlFlow$Node;

    .prologue
    .line 319
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljavassist/bytecode/analysis/ControlFlow$Access;->all:[Ljavassist/bytecode/analysis/ControlFlow$Node;

    return-void
.end method


# virtual methods
.method abstract entrances(Ljavassist/bytecode/analysis/ControlFlow$Node;)[Ljavassist/bytecode/stackmap/BasicBlock;
.end method

.method abstract exits(Ljavassist/bytecode/analysis/ControlFlow$Node;)[Ljavassist/bytecode/stackmap/BasicBlock;
.end method

.method node(Ljavassist/bytecode/stackmap/BasicBlock;)Ljavassist/bytecode/analysis/ControlFlow$Node;
    .registers 4
    .param p1, "b"    # Ljavassist/bytecode/stackmap/BasicBlock;

    .prologue
    .line 320
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Access;->all:[Ljavassist/bytecode/analysis/ControlFlow$Node;

    check-cast p1, Ljavassist/bytecode/analysis/ControlFlow$Block;

    .end local p1    # "b":Ljavassist/bytecode/stackmap/BasicBlock;
    iget v1, p1, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    aget-object v0, v0, v1

    return-object v0
.end method
