.class public Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;
.super Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UninitTypeVar"
.end annotation


# instance fields
.field protected type:Ljavassist/bytecode/stackmap/TypeData;


# direct methods
.method public constructor <init>(Ljavassist/bytecode/stackmap/TypeData$UninitData;)V
    .registers 2
    .param p1, "t"    # Ljavassist/bytecode/stackmap/TypeData$UninitData;

    .prologue
    .line 637
    invoke-direct {p0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;-><init>()V

    iput-object p1, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    return-void
.end method


# virtual methods
.method public constructorCalled(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 659
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/stackmap/TypeData;->constructorCalled(I)V

    .line 660
    return-void
.end method

.method public eq(Ljavassist/bytecode/stackmap/TypeData;)Z
    .registers 3
    .param p1, "d"    # Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 643
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/stackmap/TypeData;->eq(Ljavassist/bytecode/stackmap/TypeData;)Z

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 644
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTypeData(Ljavassist/bytecode/ConstPool;)I
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 639
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/stackmap/TypeData;->getTypeData(Ljavassist/bytecode/ConstPool;)I

    move-result v0

    return v0
.end method

.method public getTypeTag()I
    .registers 2

    .prologue
    .line 638
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData;->getTypeTag()I

    move-result v0

    return v0
.end method

.method public is2WordType()Z
    .registers 2

    .prologue
    .line 641
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v0

    return v0
.end method

.method public isBasicType()Ljavassist/bytecode/stackmap/TypeData$BasicType;
    .registers 2

    .prologue
    .line 640
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData;->isBasicType()Ljavassist/bytecode/stackmap/TypeData$BasicType;

    move-result-object v0

    return-object v0
.end method

.method public isUninit()Z
    .registers 2

    .prologue
    .line 642
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData;->isUninit()Z

    move-result v0

    return v0
.end method

.method public join()Ljavassist/bytecode/stackmap/TypeData;
    .registers 2

    .prologue
    .line 647
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData;->join()Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v0

    return-object v0
.end method

.method public merge(Ljavassist/bytecode/stackmap/TypeData;)V
    .registers 3
    .param p1, "t"    # Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 654
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {p1, v0}, Ljavassist/bytecode/stackmap/TypeData;->eq(Ljavassist/bytecode/stackmap/TypeData;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 655
    sget-object v0, Ljavassist/bytecode/stackmap/TypeTag;->TOP:Ljavassist/bytecode/stackmap/TypeData;

    iput-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    .line 656
    :cond_c
    return-void
.end method

.method public offset()I
    .registers 3

    .prologue
    .line 663
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    instance-of v0, v0, Ljavassist/bytecode/stackmap/TypeData$UninitData;

    if-eqz v0, :cond_d

    .line 664
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    check-cast v0, Ljavassist/bytecode/stackmap/TypeData$UninitData;

    iget v0, v0, Ljavassist/bytecode/stackmap/TypeData$UninitData;->offset:I

    return v0

    .line 666
    :cond_d
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "not available"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setType(Ljava/lang/String;Ljavassist/ClassPool;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 650
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$UninitTypeVar;->type:Ljavassist/bytecode/stackmap/TypeData;

    invoke-virtual {v0, p1, p2}, Ljavassist/bytecode/stackmap/TypeData;->setType(Ljava/lang/String;Ljavassist/ClassPool;)V

    .line 651
    return-void
.end method

.method protected toTypeVar()Ljavassist/bytecode/stackmap/TypeData$TypeVar;
    .registers 2

    .prologue
    .line 646
    const/4 v0, 0x0

    return-object v0
.end method
