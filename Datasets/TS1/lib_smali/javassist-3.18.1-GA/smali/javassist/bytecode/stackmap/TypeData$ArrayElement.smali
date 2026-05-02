.class public Ljavassist/bytecode/stackmap/TypeData$ArrayElement;
.super Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ArrayElement"
.end annotation


# instance fields
.field private array:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;


# direct methods
.method private constructor <init>(Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;)V
    .registers 2
    .param p1, "a"    # Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    .prologue
    .line 570
    invoke-direct {p0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;-><init>()V

    .line 571
    iput-object p1, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->array:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    .line 572
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 567
    invoke-static {p0}, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->typeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static make(Ljavassist/bytecode/stackmap/TypeData;)Ljavassist/bytecode/stackmap/TypeData;
    .registers 4
    .param p0, "array"    # Ljavassist/bytecode/stackmap/TypeData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 575
    instance-of v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;

    if-eqz v0, :cond_b

    .line 576
    check-cast p0, Ljavassist/bytecode/stackmap/TypeData$ArrayType;

    .end local p0    # "array":Ljavassist/bytecode/stackmap/TypeData;
    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->elementType()Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    move-result-object v0

    .line 581
    .restart local p0    # "array":Ljavassist/bytecode/stackmap/TypeData;
    :goto_a
    return-object v0

    .line 577
    :cond_b
    instance-of v0, p0, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    if-eqz v0, :cond_17

    .line 578
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;

    check-cast p0, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    .end local p0    # "array":Ljavassist/bytecode/stackmap/TypeData;
    invoke-direct {v0, p0}, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;-><init>(Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;)V

    goto :goto_a

    .line 579
    .restart local p0    # "array":Ljavassist/bytecode/stackmap/TypeData;
    :cond_17
    instance-of v0, p0, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    if-eqz v0, :cond_2f

    .line 580
    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData;->isNullType()Z

    move-result v0

    if-nez v0, :cond_2f

    .line 581
    new-instance v0, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    invoke-virtual {p0}, Ljavassist/bytecode/stackmap/TypeData;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->typeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    goto :goto_a

    .line 583
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

.method private static typeName(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "arrayType"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x5b

    const/4 v2, 0x1

    .line 612
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v2, :cond_33

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v3, :cond_33

    .line 613
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 614
    .local v0, "c":C
    const/16 v1, 0x4c

    if-ne v0, v1, :cond_2c

    .line 615
    const/4 v1, 0x2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2f

    const/16 v3, 0x2e

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 620
    .end local v0    # "c":C
    :goto_2b
    return-object v1

    .line 616
    .restart local v0    # "c":C
    :cond_2c
    if-ne v0, v3, :cond_33

    .line 617
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2b

    .line 620
    .end local v0    # "c":C
    :cond_33
    const-string v1, "java.lang.Object"

    goto :goto_2b
.end method


# virtual methods
.method public arrayType()Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;
    .registers 2

    .prologue
    .line 601
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->array:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    return-object v0
.end method

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
    .line 630
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->array:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-virtual {v0, p1, p2, p3}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->dfs(Ljava/util/ArrayList;ILjavassist/ClassPool;)I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 598
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->array:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->typeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public is2WordType()Z
    .registers 2

    .prologue
    .line 609
    const/4 v0, 0x0

    return v0
.end method

.method public isBasicType()Ljavassist/bytecode/stackmap/TypeData$BasicType;
    .registers 2

    .prologue
    .line 607
    const/4 v0, 0x0

    return-object v0
.end method

.method public merge(Ljavassist/bytecode/stackmap/TypeData;)V
    .registers 6
    .param p1, "t"    # Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 588
    :try_start_0
    invoke-virtual {p1}, Ljavassist/bytecode/stackmap/TypeData;->isNullType()Z

    move-result v1

    if-nez v1, :cond_f

    .line 589
    iget-object v1, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->array:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-static {p1}, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->make(Ljavassist/bytecode/stackmap/TypeData;)Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->merge(Ljavassist/bytecode/stackmap/TypeData;)V
    :try_end_f
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_0 .. :try_end_f} :catch_10

    .line 595
    :cond_f
    return-void

    .line 591
    :catch_10
    move-exception v0

    .line 593
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
    .line 624
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->array:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-static {p1}, Ljavassist/bytecode/stackmap/TypeData$ArrayType;->typeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->setType(Ljava/lang/String;Ljavassist/ClassPool;)V

    .line 625
    return-void
.end method

.method protected toTypeVar()Ljavassist/bytecode/stackmap/TypeData$TypeVar;
    .registers 2

    .prologue
    .line 627
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$ArrayElement;->array:Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;

    invoke-virtual {v0}, Ljavassist/bytecode/stackmap/TypeData$AbsTypeVar;->toTypeVar()Ljavassist/bytecode/stackmap/TypeData$TypeVar;

    move-result-object v0

    return-object v0
.end method
