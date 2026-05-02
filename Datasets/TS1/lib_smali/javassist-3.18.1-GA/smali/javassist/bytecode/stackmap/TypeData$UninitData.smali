.class public Ljavassist/bytecode/stackmap/TypeData$UninitData;
.super Ljavassist/bytecode/stackmap/TypeData$ClassName;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UninitData"
.end annotation


# instance fields
.field initialized:Z

.field offset:I


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .registers 4
    .param p1, "offset"    # I
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 725
    invoke-direct {p0, p2}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    .line 726
    iput p1, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    .line 727
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->initialized:Z

    .line 728
    return-void
.end method


# virtual methods
.method public constructorCalled(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 763
    iget v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    if-ne p1, v0, :cond_7

    .line 764
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->initialized:Z

    .line 765
    :cond_7
    return-void
.end method

.method public copy()Ljavassist/bytecode/stackmap/TypeData$UninitData;
    .registers 4

    .prologue
    .line 730
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$UninitData;

    iget v1, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$UninitData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/stackmap/TypeData$UninitData;-><init>(ILjava/lang/String;)V

    return-object v0
.end method

.method public eq(Ljavassist/bytecode/stackmap/TypeData;)Z
    .registers 6
    .param p1, "d"    # Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    const/4 v1, 0x0

    .line 750
    instance-of v2, p1, Ljavassist/bytecode/stackmap/TypeData$UninitData;

    if-eqz v2, :cond_1d

    move-object v0, p1

    .line 751
    check-cast v0, Ljavassist/bytecode/stackmap/TypeData$UninitData;

    .line 752
    .local v0, "ud":Ljavassist/bytecode/stackmap/TypeData$UninitData;
    iget v2, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    iget v3, v0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    if-ne v2, v3, :cond_1d

    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$UninitData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData$UninitData;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    const/4 v1, 0x1

    .line 755
    .end local v0    # "ud":Ljavassist/bytecode/stackmap/TypeData$UninitData;
    :cond_1d
    return v1
.end method

.method public getTypeData(Ljavassist/bytecode/ConstPool;)I
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 737
    iget v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    return v0
.end method

.method public getTypeTag()I
    .registers 2

    .prologue
    .line 733
    const/16 v0, 0x8

    return v0
.end method

.method public isUninit()Z
    .registers 2

    .prologue
    .line 747
    const/4 v0, 0x1

    return v0
.end method

.method public join()Ljavassist/bytecode/stackmap/TypeData;
    .registers 4

    .prologue
    .line 741
    iget-boolean v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->initialized:Z

    if-eqz v0, :cond_13

    .line 742
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$TypeVar;

    new-instance v1, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$UninitData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljavassist/bytecode/stackmap/TypeData$TypeVar;-><init>(Ljavassist/bytecode/stackmap/TypeData;)V

    .line 744
    :goto_12
    return-object v0

    :cond_13
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;

    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$UninitData;->copy()Ljavassist/bytecode/stackmap/TypeData$UninitData;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;-><init>(Ljavassist/bytecode/stackmap/TypeData$UninitData;)V

    goto :goto_12
.end method

.method public offset()I
    .registers 2

    .prologue
    .line 760
    iget v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 758
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "uninit:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$UninitData;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
