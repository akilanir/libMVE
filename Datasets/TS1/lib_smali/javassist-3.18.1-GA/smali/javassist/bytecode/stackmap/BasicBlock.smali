.class public Ljavassist/bytecode/stackmap/BasicBlock;
.super Ljava/lang/Object;
.source "BasicBlock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/stackmap/BasicBlock$Maker;,
        Ljavassist/bytecode/stackmap/BasicBlock$Mark;,
        Ljavassist/bytecode/stackmap/BasicBlock$Catch;,
        Ljavassist/bytecode/stackmap/BasicBlock$JsrBytecode;
    }
.end annotation


# instance fields
.field protected exit:[Ljavassist/bytecode/stackmap/BasicBlock;

.field protected incoming:I

.field protected length:I

.field protected position:I

.field protected stop:Z

.field protected toCatch:Ljavassist/bytecode/stackmap/BasicBlock$Catch;


# direct methods
.method protected constructor <init>(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    const/4 v0, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    .line 42
    iput v0, p0, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    .line 43
    iput v0, p0, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    .line 44
    return-void
.end method

.method public static find([Ljavassist/bytecode/stackmap/BasicBlock;I)Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 7
    .param p0, "blocks"    # [Ljavassist/bytecode/stackmap/BasicBlock;
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 49
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_17

    .line 50
    aget-object v2, p0, v0

    iget v1, v2, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    .line 51
    .local v1, "iPos":I
    if-gt v1, p1, :cond_14

    aget-object v2, p0, v0

    iget v2, v2, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    add-int/2addr v2, v1

    if-ge p1, v2, :cond_14

    .line 52
    aget-object v2, p0, v0

    return-object v2

    .line 49
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 55
    .end local v1    # "iPos":I
    :cond_17
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "no basic block at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 70
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 71
    .local v2, "sbuf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "cname":Ljava/lang/String;
    const/16 v3, 0x2e

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 73
    .local v1, "i":I
    if-gez v1, :cond_2a

    .end local v0    # "cname":Ljava/lang/String;
    :goto_15
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 74
    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 75
    invoke-virtual {p0, v2}, Ljavassist/bytecode/stackmap/BasicBlock;->toString2(Ljava/lang/StringBuffer;)V

    .line 76
    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 77
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 73
    .restart local v0    # "cname":Ljava/lang/String;
    :cond_2a
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_15
.end method

.method protected toString2(Ljava/lang/StringBuffer;)V
    .registers 6
    .param p1, "sbuf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 81
    const-string v2, "pos="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget v3, p0, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", len="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget v3, p0, Ljavassist/bytecode/stackmap/BasicBlock;->length:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", in="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget v3, p0, Ljavassist/bytecode/stackmap/BasicBlock;->incoming:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", exit{"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 84
    iget-object v2, p0, Ljavassist/bytecode/stackmap/BasicBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    if-eqz v2, :cond_45

    .line 85
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2e
    iget-object v2, p0, Ljavassist/bytecode/stackmap/BasicBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    array-length v2, v2

    if-ge v0, v2, :cond_45

    .line 86
    iget-object v2, p0, Ljavassist/bytecode/stackmap/BasicBlock;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    aget-object v2, v2, v0

    iget v2, v2, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    add-int/lit8 v0, v0, 0x1

    goto :goto_2e

    .line 89
    .end local v0    # "i":I
    :cond_45
    const-string v2, "}, {"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    iget-object v1, p0, Ljavassist/bytecode/stackmap/BasicBlock;->toCatch:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    .line 91
    .local v1, "th":Ljavassist/bytecode/stackmap/BasicBlock$Catch;
    :goto_4c
    if-eqz v1, :cond_70

    .line 92
    const-string v2, "("

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, v1, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->body:Ljavassist/bytecode/stackmap/BasicBlock;

    iget v3, v3, Ljavassist/bytecode/stackmap/BasicBlock;->position:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget v3, v1, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->typeIndex:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "), "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    iget-object v1, v1, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->next:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    goto :goto_4c

    .line 97
    :cond_70
    const-string v2, "}"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    return-void
.end method
