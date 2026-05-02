.class Ljavassist/bytecode/stackmap/BasicBlock$Mark;
.super Ljava/lang/Object;
.source "BasicBlock.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/BasicBlock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Mark"
.end annotation


# instance fields
.field alwaysJmp:Z

.field block:Ljavassist/bytecode/stackmap/BasicBlock;

.field catcher:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

.field jump:[Ljavassist/bytecode/stackmap/BasicBlock;

.field position:I

.field size:I


# direct methods
.method constructor <init>(I)V
    .registers 4
    .param p1, "p"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput p1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->position:I

    .line 114
    iput-object v0, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->block:Ljavassist/bytecode/stackmap/BasicBlock;

    .line 115
    iput-object v0, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->jump:[Ljavassist/bytecode/stackmap/BasicBlock;

    .line 116
    iput-boolean v1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->alwaysJmp:Z

    .line 117
    iput v1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->size:I

    .line 118
    iput-object v0, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->catcher:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    .line 119
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 122
    instance-of v1, p1, Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    if-eqz v1, :cond_c

    .line 123
    check-cast p1, Ljavassist/bytecode/stackmap/BasicBlock$Mark;

    .end local p1    # "obj":Ljava/lang/Object;
    iget v0, p1, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->position:I

    .line 124
    .local v0, "pos":I
    iget v1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->position:I

    sub-int/2addr v1, v0

    .line 127
    .end local v0    # "pos":I
    :goto_b
    return v1

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_c
    const/4 v1, -0x1

    goto :goto_b
.end method

.method setJump([Ljavassist/bytecode/stackmap/BasicBlock;IZ)V
    .registers 4
    .param p1, "bb"    # [Ljavassist/bytecode/stackmap/BasicBlock;
    .param p2, "s"    # I
    .param p3, "always"    # Z

    .prologue
    .line 131
    iput-object p1, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->jump:[Ljavassist/bytecode/stackmap/BasicBlock;

    .line 132
    iput p2, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->size:I

    .line 133
    iput-boolean p3, p0, Ljavassist/bytecode/stackmap/BasicBlock$Mark;->alwaysJmp:Z

    .line 134
    return-void
.end method
