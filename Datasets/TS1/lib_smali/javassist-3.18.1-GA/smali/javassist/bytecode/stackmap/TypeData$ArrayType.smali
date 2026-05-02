.class public Ljavassist/bytecode/stackmap/TypeData$ArrayType;
.super Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ArrayType"
.end annotation


# instance fields
.field private element:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;


# direct methods
.method private constructor <init>(Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;)V
    .registers 2
    .param p1, "elementType"    # Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    .prologue
    .line 507
    invoke-direct {p0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;-><init>()V

    .line 508
    iput-object p1, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->element:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    .line 509
    return-void
.end method

.method static make(Ljavassist/bytecode/stackmap/TypeData;)Ljavassist/bytecode/stackmap/TypeData;
    .registers 4
    .param p0, "element"    # Ljavassist/bytecode/stackmap/TypeData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 512
    instance-of v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;

    if-eqz v0, :cond_b

    .line 513
    check-cast p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;

    .end local p0    # "element":Ljavassist/bytecode/stackmap/TypeData;
    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->arrayType()Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    move-result-object v0

    .line 518
    .restart local p0    # "element":Ljavassist/bytecode/stackmap/TypeData;
    :goto_a
    return-object v0

    .line 514
    :cond_b
    instance-of v0, p0, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    if-eqz v0, :cond_17

    .line 515
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;

    check-cast p0, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    .end local p0    # "element":Ljavassist/bytecode/stackmap/TypeData;
    invoke-direct {v0, p0}, Ljavassist/bytecode/stackmap/TypeData$ArrayType;-><init>(Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;)V

    goto :goto_a

    .line 516
    .restart local p0    # "element":Ljavassist/bytecode/stackmap/TypeData;
    :cond_17
    instance-of v0, p0, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    if-eqz v0, :cond_2f

    .line 517
    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData;->isNullType()Z

    move-result v0

    if-nez v0, :cond_2f

    .line 518
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->typeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    goto :goto_a

    .line 520
    :cond_2f
    new-instance v0, Ljavassist/bytecode/BadBytecode;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad AASTORE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static typeName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "elementType"    # Ljava/lang/String;

    .prologue
    .line 547
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5b

    if-ne v0, v1, :cond_1d

    .line 548
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 550
    :goto_1c
    return-object v0

    :cond_1d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    const/16 v2, 0x2f

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1c
.end method


# virtual methods
.method public dfs(Ljava/util/ArrayList;ILjavassist/ClassPool;)I
    .registers 5
    .param p1, "order"    # Ljava/util/ArrayList;
    .param p2, "index"    # I
    .param p3, "cp"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 560
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->element:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->dfs(Ljava/util/ArrayList;ILjavassist/ClassPool;)I

    move-result v0

    return v0
.end method

.method public elementType()Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;
    .registers 2

    .prologue
    .line 538
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->element:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 535
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->element:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->typeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public is2WordType()Z
    .registers 2

    .prologue
    .line 541
    const/4 v0, 0x0

    return v0
.end method

.method public isBasicType()Ljavassist/bytecode/stackmap/TypeData$BasicType;
    .registers 2

    .prologue
    .line 540
    const/4 v0, 0x0

    return-object v0
.end method

.method public merge(Ljavassist/bytecode/stackmap/TypeData;)V
    .registers 6
    .param p1, "t"    # Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 525
    :try_start_0
    invoke-virtual {p1}, Ljavassist/bytecode/stackmap/TypeData;->isNullType()Z

    move-result v1

    if-nez v1, :cond_f

    .line 526
    iget-object v1, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->element:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-static {p1}, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->make(Ljavassist/bytecode/stackmap/TypeData;)Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->merge(Ljavassist/bytecode/stackmap/TypeData;)V
    :try_end_f
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_0 .. :try_end_f} :catch_10

    .line 532
    :cond_f
    return-void

    .line 528
    :catch_10
    move-exception v0

    .line 530
    .local v0, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fatal: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setType(Ljava/lang/String;Ljavassist/ClassPool;)V
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 554
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->element:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    # invokes: Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->typeName(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1}, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->access$000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->setType(Ljava/lang/String;Ljavassist/ClassPool;)V

    .line 555
    return-void
.end method

.method protected toTypeVar()Ljavassist/bytecode/stackmap/TypeData$TypeVar;
    .registers 2

    .prologue
    .line 557
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->element:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->toTypeVar()Ljavassist/bytecode/stackmap/TypeData$TypeVar;

    move-result-object v0

    return-object v0
.end method
