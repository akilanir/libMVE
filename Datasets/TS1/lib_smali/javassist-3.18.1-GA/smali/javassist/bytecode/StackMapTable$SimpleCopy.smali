.class Ljavassist/bytecode/StackMapTable$SimpleCopy;
.super Ljavassist/bytecode/StackMapTable$Walker;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMapTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SimpleCopy"
.end annotation


# instance fields
.field private writer:Ljavassist/bytecode/StackMapTable$Writer;


# direct methods
.method public constructor <init>([B)V
    .registers 4
    .param p1, "data"    # [B

    .prologue
    .line 374
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMapTable$Walker;-><init>([B)V

    .line 375
    new-instance v0, Ljavassist/bytecode/StackMapTable$Writer;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljavassist/bytecode/StackMapTable$Writer;-><init>(I)V

    iput-object v0, p0, Ljavassist/bytecode/StackMapTable$SimpleCopy;->writer:Ljavassist/bytecode/StackMapTable$Writer;

    .line 376
    return-void
.end method


# virtual methods
.method public appendFrame(II[I[I)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "tags"    # [I
    .param p4, "data"    # [I

    .prologue
    .line 396
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$SimpleCopy;->writer:Ljavassist/bytecode/StackMapTable$Writer;

    invoke-virtual {p0, p3, p4}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->copyData([I[I)[I

    move-result-object v1

    invoke-virtual {v0, p2, p3, v1}, Ljavassist/bytecode/StackMapTable$Writer;->appendFrame(I[I[I)V

    .line 397
    return-void
.end method

.method public chopFrame(III)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "k"    # I

    .prologue
    .line 392
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$SimpleCopy;->writer:Ljavassist/bytecode/StackMapTable$Writer;

    invoke-virtual {v0, p2, p3}, Ljavassist/bytecode/StackMapTable$Writer;->chopFrame(II)V

    .line 393
    return-void
.end method

.method protected copyData(II)I
    .registers 3
    .param p1, "tag"    # I
    .param p2, "data"    # I

    .prologue
    .line 406
    return p2
.end method

.method protected copyData([I[I)[I
    .registers 3
    .param p1, "tags"    # [I
    .param p2, "data"    # [I

    .prologue
    .line 410
    return-object p2
.end method

.method public doit()[B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 379
    invoke-virtual {p0}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->parse()V

    .line 380
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$SimpleCopy;->writer:Ljavassist/bytecode/StackMapTable$Writer;

    invoke-virtual {v0}, Ljavassist/bytecode/StackMapTable$Writer;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public fullFrame(II[I[I[I[I)V
    .registers 13
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "localTags"    # [I
    .param p4, "localData"    # [I
    .param p5, "stackTags"    # [I
    .param p6, "stackData"    # [I

    .prologue
    .line 401
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$SimpleCopy;->writer:Ljavassist/bytecode/StackMapTable$Writer;

    invoke-virtual {p0, p3, p4}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->copyData([I[I)[I

    move-result-object v3

    invoke-virtual {p0, p5, p6}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->copyData([I[I)[I

    move-result-object v5

    move v1, p2

    move-object v2, p3

    move-object v4, p5

    invoke-virtual/range {v0 .. v5}, Ljavassist/bytecode/StackMapTable$Writer;->fullFrame(I[I[I[I[I)V

    .line 403
    return-void
.end method

.method public sameFrame(II)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I

    .prologue
    .line 384
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$SimpleCopy;->writer:Ljavassist/bytecode/StackMapTable$Writer;

    invoke-virtual {v0, p2}, Ljavassist/bytecode/StackMapTable$Writer;->sameFrame(I)V

    .line 385
    return-void
.end method

.method public sameLocals(IIII)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "stackTag"    # I
    .param p4, "stackData"    # I

    .prologue
    .line 388
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$SimpleCopy;->writer:Ljavassist/bytecode/StackMapTable$Writer;

    invoke-virtual {p0, p3, p4}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->copyData(II)I

    move-result v1

    invoke-virtual {v0, p2, p3, v1}, Ljavassist/bytecode/StackMapTable$Writer;->sameLocals(III)V

    .line 389
    return-void
.end method
