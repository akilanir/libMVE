.class public Ljavassist/bytecode/analysis/ControlFlow$Block;
.super Ljavassist/bytecode/stackmap/BasicBlock;
.source "ControlFlow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/analysis/ControlFlow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Block"
.end annotation


# instance fields
.field public clientData:Ljava/lang/Object;

.field entrances:[Ljavassist/bytecode/analysis/ControlFlow$Block;

.field index:I

.field method:Ljavassist/bytecode/MethodInfo;


# direct methods
.method constructor <init>(ILjavassist/bytecode/MethodInfo;)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "minfo"    # Ljavassist/bytecode/MethodInfo;

    .prologue
    .line 240
    invoke-direct {p0, p1}, Ljavassist/bytecode/stackmap/BasicBlock;-><init>(I)V

    .line 233
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->clientData:Ljava/lang/Object;

    .line 241
    iput-object p2, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->method:Ljavassist/bytecode/MethodInfo;

    .line 242
    return-void
.end method


# virtual methods
.method public catchers()[Ljavassist/bytecode/analysis/ControlFlow$Catcher;
    .registers 4

    .prologue
    .line 306
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 307
    .local v1, "catchers":Ljava/util/ArrayList;
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->toCatch:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    .line 308
    .local v0, "c":Ljavassist/bytecode/stackmap/BasicBlock$Catch;
    :goto_7
    if-eqz v0, :cond_14

    .line 309
    new-instance v2, Ljavassist/bytecode/analysis/ControlFlow$Catcher;

    invoke-direct {v2, v0}, Ljavassist/bytecode/analysis/ControlFlow$Catcher;-><init>(Ljavassist/bytecode/stackmap/BasicBlock$Catch;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    iget-object v0, v0, Ljavassist/bytecode/stackmap/BasicBlock$Catch;->next:Ljavassist/bytecode/stackmap/BasicBlock$Catch;

    goto :goto_7

    .line 313
    :cond_14
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljavassist/bytecode/analysis/ControlFlow$Catcher;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljavassist/bytecode/analysis/ControlFlow$Catcher;

    check-cast v2, [Ljavassist/bytecode/analysis/ControlFlow$Catcher;

    return-object v2
.end method

.method public exit(I)Ljavassist/bytecode/analysis/ControlFlow$Block;
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 299
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    aget-object v0, v0, p1

    check-cast v0, Ljavassist/bytecode/analysis/ControlFlow$Block;

    return-object v0
.end method

.method public exits()I
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    array-length v0, v0

    goto :goto_5
.end method

.method getExit()[Ljavassist/bytecode/stackmap/BasicBlock;
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->exit:[Ljavassist/bytecode/stackmap/BasicBlock;

    return-object v0
.end method

.method public incoming(I)Ljavassist/bytecode/analysis/ControlFlow$Block;
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 284
    iget-object v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->entrances:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public incomings()I
    .registers 2

    .prologue
    .line 278
    iget v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->incoming:I

    return v0
.end method

.method public index()I
    .registers 2

    .prologue
    .line 262
    iget v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->index:I

    return v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 273
    iget v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->length:I

    return v0
.end method

.method public position()I
    .registers 2

    .prologue
    .line 268
    iget v0, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->position:I

    return v0
.end method

.method protected toString2(Ljava/lang/StringBuffer;)V
    .registers 5
    .param p1, "sbuf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 245
    invoke-super {p0, p1}, Ljavassist/bytecode/stackmap/BasicBlock;->toString2(Ljava/lang/StringBuffer;)V

    .line 246
    const-string v1, ", incoming{"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 247
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v1, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->entrances:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    array-length v1, v1

    if-ge v0, v1, :cond_20

    .line 248
    iget-object v1, p0, Ljavassist/bytecode/analysis/ControlFlow$Block;->entrances:[Ljavassist/bytecode/analysis/ControlFlow$Block;

    aget-object v1, v1, v0

    iget v1, v1, Ljavassist/bytecode/analysis/ControlFlow$Block;->position:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 247
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 250
    :cond_20
    const-string v1, "}"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 251
    return-void
.end method
