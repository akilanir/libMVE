.class public Ljavassist/bytecode/analysis/Executor;
.super Ljava/lang/Object;
.source "Executor.java"

# interfaces
.implements Ljavassist/bytecode/Opcode;


# instance fields
.field private final CLASS_TYPE:Ljavassist/bytecode/analysis/Type;

.field private final STRING_TYPE:Ljavassist/bytecode/analysis/Type;

.field private final THROWABLE_TYPE:Ljavassist/bytecode/analysis/Type;

.field private final classPool:Ljavassist/ClassPool;

.field private final constPool:Ljavassist/bytecode/ConstPool;

.field private lastPos:I


# direct methods
.method public constructor <init>(Ljavassist/ClassPool;Ljavassist/bytecode/ConstPool;)V
    .registers 5
    .param p1, "classPool"    # Ljavassist/ClassPool;
    .param p2, "constPool"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p2, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    .line 43
    iput-object p1, p0, Ljavassist/bytecode/analysis/Executor;->classPool:Ljavassist/ClassPool;

    .line 46
    :try_start_7
    const-string v1, "java.lang.String"

    invoke-direct {p0, v1}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    iput-object v1, p0, Ljavassist/bytecode/analysis/Executor;->STRING_TYPE:Ljavassist/bytecode/analysis/Type;

    .line 47
    const-string v1, "java.lang.Class"

    invoke-direct {p0, v1}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    iput-object v1, p0, Ljavassist/bytecode/analysis/Executor;->CLASS_TYPE:Ljavassist/bytecode/analysis/Type;

    .line 48
    const-string v1, "java.lang.Throwable"

    invoke-direct {p0, v1}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    iput-object v1, p0, Ljavassist/bytecode/analysis/Executor;->THROWABLE_TYPE:Ljavassist/bytecode/analysis/Type;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_1f} :catch_20

    .line 52
    return-void

    .line 49
    :catch_20
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private access(ILjavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Subroutine;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "type"    # Ljavassist/bytecode/analysis/Type;
    .param p3, "subroutine"    # Ljavassist/bytecode/analysis/Subroutine;

    .prologue
    .line 997
    if-nez p3, :cond_3

    .line 1002
    :cond_2
    :goto_2
    return-void

    .line 999
    :cond_3
    invoke-virtual {p3, p1}, Ljavassist/bytecode/analysis/Subroutine;->access(I)V

    .line 1000
    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Type;->getSize()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 1001
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p3, v0}, Ljavassist/bytecode/analysis/Subroutine;->access(I)V

    goto :goto_2
.end method

.method private evalArrayLoad(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V
    .registers 9
    .param p1, "expectedComponent"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 636
    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 637
    .local v2, "index":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 641
    .local v0, "array":Ljavassist/bytecode/analysis/Type;
    sget-object v3, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    if-ne v0, v3, :cond_1f

    .line 642
    sget-object v3, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v3, v2}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 643
    sget-object v3, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    if-ne p1, v3, :cond_1b

    .line 644
    sget-object v3, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v3, p2}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 661
    :goto_1a
    return-void

    .line 646
    :cond_1b
    invoke-direct {p0, p1, p2}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto :goto_1a

    .line 651
    :cond_1f
    invoke-virtual {v0}, Ljavassist/bytecode/analysis/Type;->getComponent()Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 653
    .local v1, "component":Ljavassist/bytecode/analysis/Type;
    if-nez v1, :cond_4a

    .line 654
    new-instance v3, Ljavassist/bytecode/BadBytecode;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Not an array! [pos = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v3

    .line 656
    :cond_4a
    invoke-direct {p0, v1}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 658
    invoke-direct {p0, p1, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 659
    sget-object v3, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v3, v2}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 660
    invoke-direct {p0, v1, p2}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto :goto_1a
.end method

.method private evalArrayStore(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V
    .registers 10
    .param p1, "expectedComponent"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 664
    invoke-direct {p0, p2}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    .line 665
    .local v3, "value":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 666
    .local v2, "index":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 668
    .local v0, "array":Ljavassist/bytecode/analysis/Type;
    sget-object v4, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    if-ne v0, v4, :cond_16

    .line 669
    sget-object v4, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v4, v2}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 694
    :goto_15
    return-void

    .line 673
    :cond_16
    invoke-virtual {v0}, Ljavassist/bytecode/analysis/Type;->getComponent()Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 675
    .local v1, "component":Ljavassist/bytecode/analysis/Type;
    if-nez v1, :cond_41

    .line 676
    new-instance v4, Ljavassist/bytecode/BadBytecode;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not an array! [pos = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v4

    .line 678
    :cond_41
    invoke-direct {p0, v1}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 680
    invoke-direct {p0, p1, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 681
    sget-object v4, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v4, v2}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 689
    sget-object v4, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    if-ne p1, v4, :cond_55

    .line 690
    invoke-direct {p0, p1, v3}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto :goto_15

    .line 692
    :cond_55
    invoke-direct {p0, v1, v3}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto :goto_15
.end method

.method private evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V
    .registers 5
    .param p1, "expected"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 697
    invoke-direct {p0, p2}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 698
    .local v1, "value2":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p2}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 700
    .local v0, "value1":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p1, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 701
    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 702
    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 703
    return-void
.end method

.method private evalGetField(IILjavassist/bytecode/analysis/Frame;)V
    .registers 8
    .param p1, "opcode"    # I
    .param p2, "index"    # I
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 706
    iget-object v3, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p2}, Ljavassist/bytecode/ConstPool;->getFieldrefType(I)Ljava/lang/String;

    move-result-object v0

    .line 707
    .local v0, "desc":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljavassist/bytecode/analysis/Executor;->typeFromDesc(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-direct {p0, v3}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 709
    .local v2, "type":Ljavassist/bytecode/analysis/Type;
    const/16 v3, 0xb4

    if-ne p1, v3, :cond_23

    .line 710
    iget-object v3, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p2}, Ljavassist/bytecode/ConstPool;->getFieldrefClassName(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Ljavassist/bytecode/analysis/Executor;->resolveClassInfo(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 711
    .local v1, "objectType":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 714
    .end local v1    # "objectType":Ljavassist/bytecode/analysis/Type;
    :cond_23
    invoke-direct {p0, v2, p3}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 715
    return-void
.end method

.method private evalInvokeDynamic(IILjavassist/bytecode/analysis/Frame;)V
    .registers 10
    .param p1, "opcode"    # I
    .param p2, "index"    # I
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 753
    iget-object v4, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v4, p2}, Ljavassist/bytecode/ConstPool;->getInvokeDynamicType(I)Ljava/lang/String;

    move-result-object v0

    .line 754
    .local v0, "desc":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljavassist/bytecode/analysis/Executor;->paramTypesFromDesc(Ljava/lang/String;)[Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    .line 755
    .local v3, "types":[Ljavassist/bytecode/analysis/Type;
    array-length v1, v3

    .line 757
    .local v1, "i":I
    :goto_b
    if-lez v1, :cond_1d

    .line 758
    add-int/lit8 v1, v1, -0x1

    aget-object v4, v3, v1

    invoke-direct {p0, v4}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v4

    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto :goto_b

    .line 762
    :cond_1d
    invoke-direct {p0, v0}, Ljavassist/bytecode/analysis/Executor;->returnTypeFromDesc(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 763
    .local v2, "returnType":Ljavassist/bytecode/analysis/Type;
    sget-object v4, Ljavassist/bytecode/analysis/Type;->VOID:Ljavassist/bytecode/analysis/Type;

    if-eq v2, v4, :cond_2c

    .line 764
    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v4

    invoke-direct {p0, v4, p3}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 765
    :cond_2c
    return-void
.end method

.method private evalInvokeIntfMethod(IILjavassist/bytecode/analysis/Frame;)V
    .registers 12
    .param p1, "opcode"    # I
    .param p2, "index"    # I
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 718
    iget-object v6, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v6, p2}, Ljavassist/bytecode/ConstPool;->getInterfaceMethodrefType(I)Ljava/lang/String;

    move-result-object v1

    .line 719
    .local v1, "desc":Ljava/lang/String;
    invoke-direct {p0, v1}, Ljavassist/bytecode/analysis/Executor;->paramTypesFromDesc(Ljava/lang/String;)[Ljavassist/bytecode/analysis/Type;

    move-result-object v5

    .line 720
    .local v5, "types":[Ljavassist/bytecode/analysis/Type;
    array-length v2, v5

    .line 722
    .local v2, "i":I
    :goto_b
    if-lez v2, :cond_1d

    .line 723
    add-int/lit8 v2, v2, -0x1

    aget-object v6, v5, v2

    invoke-direct {p0, v6}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v6

    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto :goto_b

    .line 725
    :cond_1d
    iget-object v6, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v6, p2}, Ljavassist/bytecode/ConstPool;->getInterfaceMethodrefClassName(I)Ljava/lang/String;

    move-result-object v0

    .line 726
    .local v0, "classInfo":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljavassist/bytecode/analysis/Executor;->resolveClassInfo(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    .line 727
    .local v3, "objectType":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v6

    invoke-direct {p0, v3, v6}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 729
    invoke-direct {p0, v1}, Ljavassist/bytecode/analysis/Executor;->returnTypeFromDesc(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v4

    .line 730
    .local v4, "returnType":Ljavassist/bytecode/analysis/Type;
    sget-object v6, Ljavassist/bytecode/analysis/Type;->VOID:Ljavassist/bytecode/analysis/Type;

    if-eq v4, v6, :cond_3d

    .line 731
    invoke-direct {p0, v4}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v6

    invoke-direct {p0, v6, p3}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 732
    :cond_3d
    return-void
.end method

.method private evalInvokeMethod(IILjavassist/bytecode/analysis/Frame;)V
    .registers 11
    .param p1, "opcode"    # I
    .param p2, "index"    # I
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 735
    iget-object v5, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v5, p2}, Ljavassist/bytecode/ConstPool;->getMethodrefType(I)Ljava/lang/String;

    move-result-object v0

    .line 736
    .local v0, "desc":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljavassist/bytecode/analysis/Executor;->paramTypesFromDesc(Ljava/lang/String;)[Ljavassist/bytecode/analysis/Type;

    move-result-object v4

    .line 737
    .local v4, "types":[Ljavassist/bytecode/analysis/Type;
    array-length v1, v4

    .line 739
    .local v1, "i":I
    :goto_b
    if-lez v1, :cond_1d

    .line 740
    add-int/lit8 v1, v1, -0x1

    aget-object v5, v4, v1

    invoke-direct {p0, v5}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v5

    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto :goto_b

    .line 742
    :cond_1d
    const/16 v5, 0xb8

    if-eq p1, v5, :cond_32

    .line 743
    iget-object v5, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v5, p2}, Ljavassist/bytecode/ConstPool;->getMethodrefClassName(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Ljavassist/bytecode/analysis/Executor;->resolveClassInfo(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 744
    .local v2, "objectType":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v5

    invoke-direct {p0, v2, v5}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 747
    .end local v2    # "objectType":Ljavassist/bytecode/analysis/Type;
    :cond_32
    invoke-direct {p0, v0}, Ljavassist/bytecode/analysis/Executor;->returnTypeFromDesc(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    .line 748
    .local v3, "returnType":Ljavassist/bytecode/analysis/Type;
    sget-object v5, Ljavassist/bytecode/analysis/Type;->VOID:Ljavassist/bytecode/analysis/Type;

    if-eq v3, v5, :cond_41

    .line 749
    invoke-direct {p0, v3}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v5

    invoke-direct {p0, v5, p3}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 750
    :cond_41
    return-void
.end method

.method private evalLDC(ILjavassist/bytecode/analysis/Frame;)V
    .registers 8
    .param p1, "index"    # I
    .param p2, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 768
    iget-object v2, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v2, p1}, Ljavassist/bytecode/ConstPool;->getTag(I)I

    move-result v0

    .line 770
    .local v0, "tag":I
    packed-switch v0, :pswitch_data_44

    .line 790
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad LDC [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 772
    :pswitch_2e
    iget-object v1, p0, Ljavassist/bytecode/analysis/Executor;->STRING_TYPE:Ljavassist/bytecode/analysis/Type;

    .line 793
    .local v1, "type":Ljavassist/bytecode/analysis/Type;
    :goto_30
    invoke-direct {p0, v1, p2}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 794
    return-void

    .line 775
    .end local v1    # "type":Ljavassist/bytecode/analysis/Type;
    :pswitch_34
    sget-object v1, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    .line 776
    .restart local v1    # "type":Ljavassist/bytecode/analysis/Type;
    goto :goto_30

    .line 778
    .end local v1    # "type":Ljavassist/bytecode/analysis/Type;
    :pswitch_37
    sget-object v1, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    .line 779
    .restart local v1    # "type":Ljavassist/bytecode/analysis/Type;
    goto :goto_30

    .line 781
    .end local v1    # "type":Ljavassist/bytecode/analysis/Type;
    :pswitch_3a
    sget-object v1, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    .line 782
    .restart local v1    # "type":Ljavassist/bytecode/analysis/Type;
    goto :goto_30

    .line 784
    .end local v1    # "type":Ljavassist/bytecode/analysis/Type;
    :pswitch_3d
    sget-object v1, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    .line 785
    .restart local v1    # "type":Ljavassist/bytecode/analysis/Type;
    goto :goto_30

    .line 787
    .end local v1    # "type":Ljavassist/bytecode/analysis/Type;
    :pswitch_40
    iget-object v1, p0, Ljavassist/bytecode/analysis/Executor;->CLASS_TYPE:Ljavassist/bytecode/analysis/Type;

    .line 788
    .restart local v1    # "type":Ljavassist/bytecode/analysis/Type;
    goto :goto_30

    .line 770
    nop

    :pswitch_data_44
    .packed-switch 0x3
        :pswitch_34
        :pswitch_37
        :pswitch_3a
        :pswitch_3d
        :pswitch_40
        :pswitch_2e
    .end packed-switch
.end method

.method private evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V
    .registers 6
    .param p1, "expected"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "index"    # I
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .param p4, "subroutine"    # Ljavassist/bytecode/analysis/Subroutine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 797
    invoke-virtual {p3, p2}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 799
    .local v0, "type":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 801
    invoke-direct {p0, v0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 802
    invoke-direct {p0, p2, v0, p4}, Ljavassist/bytecode/analysis/Executor;->access(ILjavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Subroutine;)V

    .line 803
    return-void
.end method

.method private evalNewArray(ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V
    .registers 9
    .param p1, "pos"    # I
    .param p2, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 806
    sget-object v2, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 807
    const/4 v0, 0x0

    .line 808
    .local v0, "type":Ljavassist/bytecode/analysis/Type;
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p2, v2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v1

    .line 809
    .local v1, "typeInfo":I
    packed-switch v1, :pswitch_data_72

    .line 835
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid array type [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 811
    :pswitch_36
    const-string v2, "boolean[]"

    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 839
    :goto_3c
    invoke-virtual {p3, v0}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 840
    return-void

    .line 814
    :pswitch_40
    const-string v2, "char[]"

    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 815
    goto :goto_3c

    .line 817
    :pswitch_47
    const-string v2, "byte[]"

    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 818
    goto :goto_3c

    .line 820
    :pswitch_4e
    const-string v2, "short[]"

    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 821
    goto :goto_3c

    .line 823
    :pswitch_55
    const-string v2, "int[]"

    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 824
    goto :goto_3c

    .line 826
    :pswitch_5c
    const-string v2, "long[]"

    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 827
    goto :goto_3c

    .line 829
    :pswitch_63
    const-string v2, "float[]"

    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 830
    goto :goto_3c

    .line 832
    :pswitch_6a
    const-string v2, "double[]"

    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 833
    goto :goto_3c

    .line 809
    nop

    :pswitch_data_72
    .packed-switch 0x4
        :pswitch_36
        :pswitch_40
        :pswitch_63
        :pswitch_6a
        :pswitch_47
        :pswitch_4e
        :pswitch_55
        :pswitch_5c
    .end packed-switch
.end method

.method private evalNewObjectArray(ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V
    .registers 11
    .param p1, "pos"    # I
    .param p2, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 844
    iget-object v5, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    add-int/lit8 v6, p1, 0x1

    invoke-virtual {p2, v6}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v6

    invoke-virtual {v5, v6}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Ljavassist/bytecode/analysis/Executor;->resolveClassInfo(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v4

    .line 845
    .local v4, "type":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {v4}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-virtual {v5}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    .line 846
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p2, p1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v3

    .line 849
    .local v3, "opcode":I
    const/16 v5, 0xc5

    if-ne v3, v5, :cond_36

    .line 850
    add-int/lit8 v5, p1, 0x3

    invoke-virtual {p2, v5}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    .local v0, "dimensions":I
    move v1, v0

    .line 856
    .end local v0    # "dimensions":I
    .local v1, "dimensions":I
    :goto_27
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "dimensions":I
    .restart local v0    # "dimensions":I
    if-lez v1, :cond_4c

    .line 857
    sget-object v5, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    move v1, v0

    .end local v0    # "dimensions":I
    .restart local v1    # "dimensions":I
    goto :goto_27

    .line 852
    .end local v1    # "dimensions":I
    :cond_36
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "[]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 853
    const/4 v0, 0x1

    .restart local v0    # "dimensions":I
    move v1, v0

    .end local v0    # "dimensions":I
    .restart local v1    # "dimensions":I
    goto :goto_27

    .line 860
    .end local v1    # "dimensions":I
    .restart local v0    # "dimensions":I
    :cond_4c
    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/Executor;->getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v5

    invoke-direct {p0, v5, p3}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 861
    return-void
.end method

.method private evalPutField(IILjavassist/bytecode/analysis/Frame;)V
    .registers 8
    .param p1, "opcode"    # I
    .param p2, "index"    # I
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 864
    iget-object v3, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p2}, Ljavassist/bytecode/ConstPool;->getFieldrefType(I)Ljava/lang/String;

    move-result-object v0

    .line 865
    .local v0, "desc":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljavassist/bytecode/analysis/Executor;->typeFromDesc(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-direct {p0, v3}, Ljavassist/bytecode/analysis/Executor;->zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 867
    .local v2, "type":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 869
    const/16 v3, 0xb5

    if-ne p1, v3, :cond_2a

    .line 870
    iget-object v3, p0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p2}, Ljavassist/bytecode/ConstPool;->getFieldrefClassName(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Ljavassist/bytecode/analysis/Executor;->resolveClassInfo(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 871
    .local v1, "objectType":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-direct {p0, v1, v3}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 873
    .end local v1    # "objectType":Ljavassist/bytecode/analysis/Type;
    :cond_2a
    return-void
.end method

.method private evalShift(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V
    .registers 6
    .param p1, "expected"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 876
    invoke-direct {p0, p2}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 877
    .local v1, "value2":Ljavassist/bytecode/analysis/Type;
    invoke-direct {p0, p2}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 879
    .local v0, "value1":Ljavassist/bytecode/analysis/Type;
    sget-object v2, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 880
    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 881
    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 882
    return-void
.end method

.method private evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V
    .registers 7
    .param p1, "expected"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "index"    # I
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .param p4, "subroutine"    # Ljavassist/bytecode/analysis/Subroutine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 885
    invoke-direct {p0, p3}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 888
    .local v0, "type":Ljavassist/bytecode/analysis/Type;
    sget-object v1, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    if-ne p1, v1, :cond_c

    sget-object v1, Ljavassist/bytecode/analysis/Type;->RETURN_ADDRESS:Ljavassist/bytecode/analysis/Type;

    if-eq v0, v1, :cond_f

    .line 889
    :cond_c
    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 890
    :cond_f
    invoke-direct {p0, p2, v0, p3}, Ljavassist/bytecode/analysis/Executor;->simpleSetLocal(ILjavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    .line 891
    invoke-direct {p0, p2, v0, p4}, Ljavassist/bytecode/analysis/Executor;->access(ILjavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Subroutine;)V

    .line 892
    return-void
.end method

.method private evalWide(ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V
    .registers 10
    .param p1, "pos"    # I
    .param p2, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .param p4, "subroutine"    # Ljavassist/bytecode/analysis/Subroutine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 895
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p2, v2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v1

    .line 896
    .local v1, "opcode":I
    add-int/lit8 v2, p1, 0x2

    invoke-virtual {p2, v2}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v0

    .line 897
    .local v0, "index":I
    sparse-switch v1, :sswitch_data_82

    .line 935
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid WIDE operand [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 899
    :sswitch_32
    sget-object v2, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    .line 938
    :goto_37
    return-void

    .line 902
    :sswitch_38
    sget-object v2, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 905
    :sswitch_3e
    sget-object v2, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 908
    :sswitch_44
    sget-object v2, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 911
    :sswitch_4a
    sget-object v2, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 914
    :sswitch_50
    sget-object v2, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 917
    :sswitch_56
    sget-object v2, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 920
    :sswitch_5c
    sget-object v2, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 923
    :sswitch_62
    sget-object v2, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 926
    :sswitch_68
    sget-object v2, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    invoke-direct {p0, v2, v0, p3, p4}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_37

    .line 929
    :sswitch_6e
    sget-object v2, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {p3, v0}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto :goto_37

    .line 932
    :sswitch_78
    sget-object v2, Ljavassist/bytecode/analysis/Type;->RETURN_ADDRESS:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {p3, v0}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto :goto_37

    .line 897
    :sswitch_data_82
    .sparse-switch
        0x15 -> :sswitch_32
        0x16 -> :sswitch_38
        0x17 -> :sswitch_3e
        0x18 -> :sswitch_44
        0x19 -> :sswitch_4a
        0x36 -> :sswitch_50
        0x37 -> :sswitch_56
        0x38 -> :sswitch_5c
        0x39 -> :sswitch_62
        0x3a -> :sswitch_68
        0x84 -> :sswitch_6e
        0xa9 -> :sswitch_78
    .end sparse-switch
.end method

.method private getType(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 942
    :try_start_0
    iget-object v1, p0, Ljavassist/bytecode/analysis/Executor;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v1, p1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    invoke-static {v1}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;
    :try_end_9
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    return-object v1

    .line 943
    :catch_b
    move-exception v0

    .line 944
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljavassist/bytecode/BadBytecode;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not find class [pos = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private paramTypesFromDesc(Ljava/lang/String;)[Ljavassist/bytecode/analysis/Type;
    .registers 9
    .param p1, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 949
    const/4 v0, 0x0

    .line 951
    .local v0, "classes":[Ljavassist/CtClass;
    :try_start_1
    iget-object v4, p0, Ljavassist/bytecode/analysis/Executor;->classPool:Ljavassist/ClassPool;

    invoke-static {p1, v4}, Ljavassist/bytecode/Descriptor;->getParameterTypes(Ljava/lang/String;Ljavassist/ClassPool;)[Ljavassist/CtClass;
    :try_end_6
    .catch Ljavassist/NotFoundException; {:try_start_1 .. :try_end_6} :catch_2e

    move-result-object v0

    .line 956
    if-nez v0, :cond_58

    .line 957
    new-instance v4, Ljavassist/bytecode/BadBytecode;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not obtain parameters for descriptor [pos = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v4

    .line 952
    :catch_2e
    move-exception v1

    .line 953
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v4, Ljavassist/bytecode/BadBytecode;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not find class in descriptor [pos = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljavassist/NotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v4

    .line 959
    .end local v1    # "e":Ljavassist/NotFoundException;
    :cond_58
    array-length v4, v0

    new-array v3, v4, [Ljavassist/bytecode/analysis/Type;

    .line 960
    .local v3, "types":[Ljavassist/bytecode/analysis/Type;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5c
    array-length v4, v3

    if-ge v2, v4, :cond_6a

    .line 961
    aget-object v4, v0, v2

    invoke-static {v4}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;

    move-result-object v4

    aput-object v4, v3, v2

    .line 960
    add-int/lit8 v2, v2, 0x1

    goto :goto_5c

    .line 963
    :cond_6a
    return-object v3
.end method

.method private resolveClassInfo(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;
    .registers 7
    .param p1, "info"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1011
    const/4 v0, 0x0

    .line 1013
    .local v0, "clazz":Ljavassist/CtClass;
    const/4 v2, 0x0

    :try_start_2
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x5b

    if-ne v2, v3, :cond_37

    .line 1014
    iget-object v2, p0, Ljavassist/bytecode/analysis/Executor;->classPool:Ljavassist/ClassPool;

    invoke-static {p1, v2}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;
    :try_end_f
    .catch Ljavassist/NotFoundException; {:try_start_2 .. :try_end_f} :catch_3e

    move-result-object v0

    .line 1023
    :goto_10
    if-nez v0, :cond_68

    .line 1024
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not obtain type for descriptor [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1016
    :cond_37
    :try_start_37
    iget-object v2, p0, Ljavassist/bytecode/analysis/Executor;->classPool:Ljavassist/ClassPool;

    invoke-virtual {v2, p1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;
    :try_end_3c
    .catch Ljavassist/NotFoundException; {:try_start_37 .. :try_end_3c} :catch_3e

    move-result-object v0

    goto :goto_10

    .line 1019
    :catch_3e
    move-exception v1

    .line 1020
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find class in descriptor [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljavassist/NotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1026
    .end local v1    # "e":Ljavassist/NotFoundException;
    :cond_68
    invoke-static {v0}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    return-object v2
.end method

.method private returnTypeFromDesc(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;
    .registers 7
    .param p1, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 967
    const/4 v0, 0x0

    .line 969
    .local v0, "clazz":Ljavassist/CtClass;
    :try_start_1
    iget-object v2, p0, Ljavassist/bytecode/analysis/Executor;->classPool:Ljavassist/ClassPool;

    invoke-static {p1, v2}, Ljavassist/bytecode/Descriptor;->getReturnType(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;
    :try_end_6
    .catch Ljavassist/NotFoundException; {:try_start_1 .. :try_end_6} :catch_2e

    move-result-object v0

    .line 974
    if-nez v0, :cond_58

    .line 975
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not obtain return type for descriptor [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 970
    :catch_2e
    move-exception v1

    .line 971
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find class in descriptor [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljavassist/NotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 977
    .end local v1    # "e":Ljavassist/NotFoundException;
    :cond_58
    invoke-static {v0}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    return-object v2
.end method

.method private simplePeek(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;
    .registers 4
    .param p1, "frame"    # Ljavassist/bytecode/analysis/Frame;

    .prologue
    .line 981
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Frame;->peek()Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 982
    .local v0, "type":Ljavassist/bytecode/analysis/Type;
    sget-object v1, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    if-ne v0, v1, :cond_12

    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Frame;->getTopIndex()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v1}, Ljavassist/bytecode/analysis/Frame;->getStack(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .end local v0    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_12
    return-object v0
.end method

.method private simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;
    .registers 4
    .param p1, "frame"    # Ljavassist/bytecode/analysis/Frame;

    .prologue
    .line 986
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .line 987
    .local v0, "type":Ljavassist/bytecode/analysis/Type;
    sget-object v1, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    if-ne v0, v1, :cond_c

    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v0

    .end local v0    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_c
    return-object v0
.end method

.method private simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V
    .registers 5
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "frame"    # Ljavassist/bytecode/analysis/Frame;

    .prologue
    .line 991
    invoke-virtual {p2, p1}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 992
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->getSize()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_f

    .line 993
    sget-object v0, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {p2, v0}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 994
    :cond_f
    return-void
.end method

.method private simpleSetLocal(ILjavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "type"    # Ljavassist/bytecode/analysis/Type;
    .param p3, "frame"    # Ljavassist/bytecode/analysis/Frame;

    .prologue
    .line 1005
    invoke-virtual {p3, p1, p2}, Ljavassist/bytecode/analysis/Frame;->setLocal(ILjavassist/bytecode/analysis/Type;)V

    .line 1006
    invoke-virtual {p2}, Ljavassist/bytecode/analysis/Type;->getSize()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_11

    .line 1007
    add-int/lit8 v0, p1, 0x1

    sget-object v1, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {p3, v0, v1}, Ljavassist/bytecode/analysis/Frame;->setLocal(ILjavassist/bytecode/analysis/Type;)V

    .line 1008
    :cond_11
    return-void
.end method

.method private typeFromDesc(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;
    .registers 7
    .param p1, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1030
    const/4 v0, 0x0

    .line 1032
    .local v0, "clazz":Ljavassist/CtClass;
    :try_start_1
    iget-object v2, p0, Ljavassist/bytecode/analysis/Executor;->classPool:Ljavassist/ClassPool;

    invoke-static {p1, v2}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;
    :try_end_6
    .catch Ljavassist/NotFoundException; {:try_start_1 .. :try_end_6} :catch_2e

    move-result-object v0

    .line 1037
    if-nez v0, :cond_58

    .line 1038
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not obtain type for descriptor [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1033
    :catch_2e
    move-exception v1

    .line 1034
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v2, Ljavassist/bytecode/BadBytecode;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find class in descriptor [pos = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljavassist/NotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1040
    .end local v1    # "e":Ljavassist/NotFoundException;
    :cond_58
    invoke-static {v0}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    return-object v2
.end method

.method private verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V
    .registers 6
    .param p1, "expected"    # Ljavassist/bytecode/analysis/Type;
    .param p2, "type"    # Ljavassist/bytecode/analysis/Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1044
    invoke-virtual {p1, p2}, Ljavassist/bytecode/analysis/Type;->isAssignableFrom(Ljavassist/bytecode/analysis/Type;)Z

    move-result v0

    if-nez v0, :cond_3b

    .line 1045
    new-instance v0, Ljavassist/bytecode/BadBytecode;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Got: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " [pos = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1046
    :cond_3b
    return-void
.end method

.method private zeroExtend(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;
    .registers 3
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    .line 629
    sget-object v0, Ljavassist/bytecode/analysis/Type;->SHORT:Ljavassist/bytecode/analysis/Type;

    if-eq p1, v0, :cond_10

    sget-object v0, Ljavassist/bytecode/analysis/Type;->BYTE:Ljavassist/bytecode/analysis/Type;

    if-eq p1, v0, :cond_10

    sget-object v0, Ljavassist/bytecode/analysis/Type;->CHAR:Ljavassist/bytecode/analysis/Type;

    if-eq p1, v0, :cond_10

    sget-object v0, Ljavassist/bytecode/analysis/Type;->BOOLEAN:Ljavassist/bytecode/analysis/Type;

    if-ne p1, v0, :cond_12

    .line 630
    :cond_10
    sget-object p1, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    .line 632
    .end local p1    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_12
    return-object p1
.end method


# virtual methods
.method public execute(Ljavassist/bytecode/MethodInfo;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V
    .registers 24
    .param p1, "method"    # Ljavassist/bytecode/MethodInfo;
    .param p2, "pos"    # I
    .param p3, "iter"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "frame"    # Ljavassist/bytecode/analysis/Frame;
    .param p5, "subroutine"    # Ljavassist/bytecode/analysis/Subroutine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 68
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Ljavassist/bytecode/analysis/Executor;->lastPos:I

    .line 69
    move-object/from16 v0, p3

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v10

    .line 73
    .local v10, "opcode":I
    packed-switch v10, :pswitch_data_a34

    .line 626
    :cond_11
    :goto_11
    :pswitch_11
    return-void

    .line 77
    :pswitch_12
    sget-object v15, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto :goto_11

    .line 86
    :pswitch_1a
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto :goto_11

    .line 90
    :pswitch_22
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 91
    sget-object v15, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto :goto_11

    .line 96
    :pswitch_31
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto :goto_11

    .line 100
    :pswitch_39
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 101
    sget-object v15, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto :goto_11

    .line 105
    :pswitch_48
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto :goto_11

    .line 108
    :pswitch_50
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalLDC(ILjavassist/bytecode/analysis/Frame;)V

    goto :goto_11

    .line 112
    :pswitch_60
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalLDC(ILjavassist/bytecode/analysis/Frame;)V

    goto :goto_11

    .line 115
    :pswitch_70
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto :goto_11

    .line 118
    :pswitch_88
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 121
    :pswitch_a1
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 124
    :pswitch_ba
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 127
    :pswitch_d3
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 133
    :pswitch_ec
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x1a

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 139
    :pswitch_fd
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x1e

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 145
    :pswitch_10e
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x22

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 151
    :pswitch_11f
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x26

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 157
    :pswitch_130
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x2a

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalLoad(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 160
    :pswitch_141
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayLoad(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 163
    :pswitch_14c
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayLoad(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 166
    :pswitch_157
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayLoad(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 169
    :pswitch_162
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayLoad(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 172
    :pswitch_16d
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayLoad(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 177
    :pswitch_178
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayLoad(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 180
    :pswitch_183
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 183
    :pswitch_19c
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 186
    :pswitch_1b5
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 189
    :pswitch_1ce
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 192
    :pswitch_1e7
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 198
    :pswitch_200
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x3b

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 204
    :pswitch_211
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x3f

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 210
    :pswitch_222
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x43

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 216
    :pswitch_233
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x47

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 222
    :pswitch_244
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, v10, -0x4b

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v15, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalStore(Ljavassist/bytecode/analysis/Type;ILjavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 225
    :pswitch_255
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayStore(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 228
    :pswitch_260
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayStore(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 231
    :pswitch_26b
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayStore(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 234
    :pswitch_276
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayStore(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 237
    :pswitch_281
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayStore(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 242
    :pswitch_28c
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalArrayStore(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 245
    :pswitch_297
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    sget-object v16, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_11

    .line 246
    new-instance v15, Ljavassist/bytecode/BadBytecode;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "POP can not be used with a category 2 value, pos = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v15

    .line 249
    :pswitch_2be
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    .line 250
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    goto/16 :goto_11

    .line 253
    :pswitch_2c6
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->peek()Ljavassist/bytecode/analysis/Type;

    move-result-object v12

    .line 254
    .local v12, "type":Ljavassist/bytecode/analysis/Type;
    sget-object v15, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    if-ne v12, v15, :cond_2eb

    .line 255
    new-instance v15, Ljavassist/bytecode/BadBytecode;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "DUP can not be used with a category 2 value, pos = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v15

    .line 257
    :cond_2eb
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->peek()Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 262
    .end local v12    # "type":Ljavassist/bytecode/analysis/Type;
    :pswitch_2f6
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->peek()Ljavassist/bytecode/analysis/Type;

    move-result-object v12

    .line 263
    .restart local v12    # "type":Ljavassist/bytecode/analysis/Type;
    sget-object v15, Ljavassist/bytecode/analysis/Type;->TOP:Ljavassist/bytecode/analysis/Type;

    if-ne v12, v15, :cond_31b

    .line 264
    new-instance v15, Ljavassist/bytecode/BadBytecode;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "DUP can not be used with a category 2 value, pos = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v15

    .line 265
    :cond_31b
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->getTopIndex()I

    move-result v7

    .line 266
    .local v7, "end":I
    add-int/lit8 v15, v10, -0x5a

    sub-int v15, v7, v15

    add-int/lit8 v9, v15, -0x1

    .line 267
    .local v9, "insert":I
    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 269
    :goto_32a
    if-le v7, v9, :cond_33c

    .line 270
    add-int/lit8 v15, v7, -0x1

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->getStack(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    move-object/from16 v0, p4

    invoke-virtual {v0, v7, v15}, Ljavassist/bytecode/analysis/Frame;->setStack(ILjavassist/bytecode/analysis/Type;)V

    .line 271
    add-int/lit8 v7, v7, -0x1

    goto :goto_32a

    .line 273
    :cond_33c
    move-object/from16 v0, p4

    invoke-virtual {v0, v9, v12}, Ljavassist/bytecode/analysis/Frame;->setStack(ILjavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 277
    .end local v7    # "end":I
    .end local v9    # "insert":I
    .end local v12    # "type":Ljavassist/bytecode/analysis/Type;
    :pswitch_343
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->getTopIndex()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->getStack(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 278
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->getTopIndex()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->getStack(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 282
    :pswitch_367
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->getTopIndex()I

    move-result v7

    .line 283
    .restart local v7    # "end":I
    add-int/lit8 v15, v10, -0x5d

    sub-int v15, v7, v15

    add-int/lit8 v9, v15, -0x1

    .line 284
    .restart local v9    # "insert":I
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->getTopIndex()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->getStack(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v13

    .line 285
    .local v13, "type1":Ljavassist/bytecode/analysis/Type;
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->peek()Ljavassist/bytecode/analysis/Type;

    move-result-object v14

    .line 286
    .local v14, "type2":Ljavassist/bytecode/analysis/Type;
    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 287
    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 288
    :goto_38b
    if-le v7, v9, :cond_39d

    .line 289
    add-int/lit8 v15, v7, -0x2

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->getStack(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    move-object/from16 v0, p4

    invoke-virtual {v0, v7, v15}, Ljavassist/bytecode/analysis/Frame;->setStack(ILjavassist/bytecode/analysis/Type;)V

    .line 290
    add-int/lit8 v7, v7, -0x1

    goto :goto_38b

    .line 292
    :cond_39d
    move-object/from16 v0, p4

    invoke-virtual {v0, v9, v14}, Ljavassist/bytecode/analysis/Frame;->setStack(ILjavassist/bytecode/analysis/Type;)V

    .line 293
    add-int/lit8 v15, v9, -0x1

    move-object/from16 v0, p4

    invoke-virtual {v0, v15, v13}, Ljavassist/bytecode/analysis/Frame;->setStack(ILjavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 297
    .end local v7    # "end":I
    .end local v9    # "insert":I
    .end local v13    # "type1":Ljavassist/bytecode/analysis/Type;
    .end local v14    # "type2":Ljavassist/bytecode/analysis/Type;
    :pswitch_3ab
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v13

    .line 298
    .restart local v13    # "type1":Ljavassist/bytecode/analysis/Type;
    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->pop()Ljavassist/bytecode/analysis/Type;

    move-result-object v14

    .line 299
    .restart local v14    # "type2":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {v13}, Ljavassist/bytecode/analysis/Type;->getSize()I

    move-result v15

    const/16 v16, 0x2

    move/from16 v0, v16

    if-eq v15, v0, :cond_3c7

    invoke-virtual {v14}, Ljavassist/bytecode/analysis/Type;->getSize()I

    move-result v15

    const/16 v16, 0x2

    move/from16 v0, v16

    if-ne v15, v0, :cond_3e4

    .line 300
    :cond_3c7
    new-instance v15, Ljavassist/bytecode/BadBytecode;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Swap can not be used with category 2 values, pos = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v15

    .line 301
    :cond_3e4
    move-object/from16 v0, p4

    invoke-virtual {v0, v13}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    .line 302
    move-object/from16 v0, p4

    invoke-virtual {v0, v14}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 308
    .end local v13    # "type1":Ljavassist/bytecode/analysis/Type;
    .end local v14    # "type2":Ljavassist/bytecode/analysis/Type;
    :pswitch_3f0
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 311
    :pswitch_3fb
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 314
    :pswitch_406
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 317
    :pswitch_411
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 320
    :pswitch_41c
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 323
    :pswitch_427
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 326
    :pswitch_432
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 329
    :pswitch_43d
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 332
    :pswitch_448
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 335
    :pswitch_453
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 338
    :pswitch_45e
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 341
    :pswitch_469
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 344
    :pswitch_474
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 347
    :pswitch_47f
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 350
    :pswitch_48a
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 353
    :pswitch_495
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 356
    :pswitch_4a0
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 359
    :pswitch_4ab
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 362
    :pswitch_4b6
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 365
    :pswitch_4c1
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 370
    :pswitch_4cc
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePeek(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 373
    :pswitch_4df
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePeek(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 376
    :pswitch_4f2
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePeek(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 379
    :pswitch_505
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePeek(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 384
    :pswitch_518
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalShift(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 387
    :pswitch_523
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalShift(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 390
    :pswitch_52e
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalShift(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 393
    :pswitch_539
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalShift(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 396
    :pswitch_544
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalShift(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 399
    :pswitch_54f
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalShift(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 404
    :pswitch_55a
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 407
    :pswitch_565
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 410
    :pswitch_570
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 413
    :pswitch_57b
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 416
    :pswitch_586
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 419
    :pswitch_591
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalBinaryMath(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 423
    :pswitch_59c
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v8

    .line 424
    .local v8, "index":I
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v8}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 425
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v8, v15, v1}, Ljavassist/bytecode/analysis/Executor;->access(ILjavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 431
    .end local v8    # "index":I
    :pswitch_5be
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 432
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 435
    :pswitch_5da
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 436
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 439
    :pswitch_5f6
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 440
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 443
    :pswitch_612
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 444
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 447
    :pswitch_62e
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 448
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 451
    :pswitch_64a
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 452
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 455
    :pswitch_666
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 456
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 459
    :pswitch_682
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 460
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 463
    :pswitch_69e
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 464
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 467
    :pswitch_6ba
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 468
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 471
    :pswitch_6d6
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 472
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 475
    :pswitch_6f2
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 476
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->simplePush(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 481
    :pswitch_70e
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    invoke-virtual/range {p4 .. p4}, Ljavassist/bytecode/analysis/Frame;->peek()Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 484
    :pswitch_71d
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 485
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 486
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 490
    :pswitch_748
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 491
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 492
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 496
    :pswitch_773
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 497
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 498
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 508
    :pswitch_79e
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 516
    :pswitch_7b1
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 517
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 521
    :pswitch_7d5
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 522
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 527
    :pswitch_7f9
    sget-object v15, Ljavassist/bytecode/analysis/Type;->RETURN_ADDRESS:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 530
    :pswitch_802
    sget-object v15, Ljavassist/bytecode/analysis/Type;->RETURN_ADDRESS:Ljavassist/bytecode/analysis/Type;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v16

    move-object/from16 v0, p4

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 535
    :pswitch_81f
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 538
    :pswitch_832
    sget-object v15, Ljavassist/bytecode/analysis/Type;->LONG:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 541
    :pswitch_845
    sget-object v15, Ljavassist/bytecode/analysis/Type;->FLOAT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 544
    :pswitch_858
    sget-object v15, Ljavassist/bytecode/analysis/Type;->DOUBLE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 548
    :pswitch_86b
    :try_start_86b
    invoke-virtual/range {p1 .. p1}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/bytecode/analysis/Executor;->classPool:Ljavassist/ClassPool;

    move-object/from16 v16, v0

    invoke-static/range {v15 .. v16}, Ljavassist/bytecode/Descriptor;->getReturnType(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v11

    .line 549
    .local v11, "returnType":Ljavassist/CtClass;
    invoke-static {v11}, Ljavassist/bytecode/analysis/Type;->get(Ljavassist/CtClass;)Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V
    :try_end_88c
    .catch Ljavassist/NotFoundException; {:try_start_86b .. :try_end_88c} :catch_88e

    goto/16 :goto_11

    .line 550
    .end local v11    # "returnType":Ljavassist/CtClass;
    :catch_88e
    move-exception v6

    .line 551
    .local v6, "e":Ljavassist/NotFoundException;
    new-instance v15, Ljava/lang/RuntimeException;

    invoke-direct {v15, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v15

    .line 557
    .end local v6    # "e":Ljavassist/NotFoundException;
    :pswitch_895
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalGetField(IILjavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 560
    :pswitch_8a6
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalPutField(IILjavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 563
    :pswitch_8b7
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalGetField(IILjavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 566
    :pswitch_8c8
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalPutField(IILjavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 571
    :pswitch_8d9
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalInvokeMethod(IILjavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 574
    :pswitch_8ea
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalInvokeIntfMethod(IILjavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 577
    :pswitch_8fb
    add-int/lit8 v15, p2, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v10, v15, v1}, Ljavassist/bytecode/analysis/Executor;->evalInvokeDynamic(IILjavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 580
    :pswitch_90c
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Ljavassist/bytecode/analysis/Executor;->resolveClassInfo(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 583
    :pswitch_92b
    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalNewArray(ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 586
    :pswitch_938
    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalNewObjectArray(ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 589
    :pswitch_945
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v5

    .line 590
    .local v5, "array":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {v5}, Ljavassist/bytecode/analysis/Type;->isArray()Z

    move-result v15

    if-nez v15, :cond_980

    sget-object v15, Ljavassist/bytecode/analysis/Type;->UNINIT:Ljavassist/bytecode/analysis/Type;

    if-eq v5, v15, :cond_980

    .line 591
    new-instance v15, Ljavassist/bytecode/BadBytecode;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Array length passed a non-array [pos = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "]: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v15

    .line 592
    :cond_980
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 596
    .end local v5    # "array":Ljavassist/bytecode/analysis/Type;
    :pswitch_989
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/bytecode/analysis/Executor;->THROWABLE_TYPE:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 599
    :pswitch_99e
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 600
    move-object/from16 v0, p0

    iget-object v15, v0, Ljavassist/bytecode/analysis/Executor;->constPool:Ljavassist/bytecode/ConstPool;

    add-int/lit8 v16, p2, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljavassist/bytecode/ConstPool;->getClassInfoByDescriptor(I)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Ljavassist/bytecode/analysis/Executor;->typeFromDesc(Ljava/lang/String;)Ljavassist/bytecode/analysis/Type;

    move-result-object v15

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 603
    :pswitch_9ce
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    .line 604
    sget-object v15, Ljavassist/bytecode/analysis/Type;->INTEGER:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 608
    :pswitch_9e8
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 611
    :pswitch_9fb
    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Ljavassist/bytecode/analysis/Executor;->evalWide(ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;Ljavassist/bytecode/analysis/Subroutine;)V

    goto/16 :goto_11

    .line 614
    :pswitch_a0a
    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Ljavassist/bytecode/analysis/Executor;->evalNewObjectArray(ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/analysis/Frame;)V

    goto/16 :goto_11

    .line 618
    :pswitch_a17
    sget-object v15, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Ljavassist/bytecode/analysis/Executor;->simplePop(Ljavassist/bytecode/analysis/Frame;)Ljavassist/bytecode/analysis/Type;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Ljavassist/bytecode/analysis/Executor;->verifyAssignable(Ljavassist/bytecode/analysis/Type;Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 623
    :pswitch_a2a
    sget-object v15, Ljavassist/bytecode/analysis/Type;->RETURN_ADDRESS:Ljavassist/bytecode/analysis/Type;

    move-object/from16 v0, p4

    invoke-virtual {v0, v15}, Ljavassist/bytecode/analysis/Frame;->push(Ljavassist/bytecode/analysis/Type;)V

    goto/16 :goto_11

    .line 73
    nop

    :pswitch_data_a34
    .packed-switch 0x0
        :pswitch_11
        :pswitch_12
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_1a
        :pswitch_22
        :pswitch_22
        :pswitch_31
        :pswitch_31
        :pswitch_31
        :pswitch_39
        :pswitch_39
        :pswitch_48
        :pswitch_48
        :pswitch_50
        :pswitch_60
        :pswitch_60
        :pswitch_70
        :pswitch_88
        :pswitch_a1
        :pswitch_ba
        :pswitch_d3
        :pswitch_ec
        :pswitch_ec
        :pswitch_ec
        :pswitch_ec
        :pswitch_fd
        :pswitch_fd
        :pswitch_fd
        :pswitch_fd
        :pswitch_10e
        :pswitch_10e
        :pswitch_10e
        :pswitch_10e
        :pswitch_11f
        :pswitch_11f
        :pswitch_11f
        :pswitch_11f
        :pswitch_130
        :pswitch_130
        :pswitch_130
        :pswitch_130
        :pswitch_141
        :pswitch_14c
        :pswitch_157
        :pswitch_162
        :pswitch_16d
        :pswitch_178
        :pswitch_178
        :pswitch_178
        :pswitch_183
        :pswitch_19c
        :pswitch_1b5
        :pswitch_1ce
        :pswitch_1e7
        :pswitch_200
        :pswitch_200
        :pswitch_200
        :pswitch_200
        :pswitch_211
        :pswitch_211
        :pswitch_211
        :pswitch_211
        :pswitch_222
        :pswitch_222
        :pswitch_222
        :pswitch_222
        :pswitch_233
        :pswitch_233
        :pswitch_233
        :pswitch_233
        :pswitch_244
        :pswitch_244
        :pswitch_244
        :pswitch_244
        :pswitch_255
        :pswitch_260
        :pswitch_26b
        :pswitch_276
        :pswitch_281
        :pswitch_28c
        :pswitch_28c
        :pswitch_28c
        :pswitch_297
        :pswitch_2be
        :pswitch_2c6
        :pswitch_2f6
        :pswitch_2f6
        :pswitch_343
        :pswitch_367
        :pswitch_367
        :pswitch_3ab
        :pswitch_3f0
        :pswitch_3fb
        :pswitch_406
        :pswitch_411
        :pswitch_41c
        :pswitch_427
        :pswitch_432
        :pswitch_43d
        :pswitch_448
        :pswitch_453
        :pswitch_45e
        :pswitch_469
        :pswitch_474
        :pswitch_47f
        :pswitch_48a
        :pswitch_495
        :pswitch_4a0
        :pswitch_4ab
        :pswitch_4b6
        :pswitch_4c1
        :pswitch_4cc
        :pswitch_4df
        :pswitch_4f2
        :pswitch_505
        :pswitch_518
        :pswitch_523
        :pswitch_52e
        :pswitch_539
        :pswitch_544
        :pswitch_54f
        :pswitch_55a
        :pswitch_565
        :pswitch_570
        :pswitch_57b
        :pswitch_586
        :pswitch_591
        :pswitch_59c
        :pswitch_5be
        :pswitch_5da
        :pswitch_5f6
        :pswitch_612
        :pswitch_62e
        :pswitch_64a
        :pswitch_666
        :pswitch_682
        :pswitch_69e
        :pswitch_6ba
        :pswitch_6d6
        :pswitch_6f2
        :pswitch_70e
        :pswitch_70e
        :pswitch_70e
        :pswitch_71d
        :pswitch_748
        :pswitch_748
        :pswitch_773
        :pswitch_773
        :pswitch_79e
        :pswitch_79e
        :pswitch_79e
        :pswitch_79e
        :pswitch_79e
        :pswitch_79e
        :pswitch_7b1
        :pswitch_7b1
        :pswitch_7b1
        :pswitch_7b1
        :pswitch_7b1
        :pswitch_7b1
        :pswitch_7d5
        :pswitch_7d5
        :pswitch_11
        :pswitch_7f9
        :pswitch_802
        :pswitch_81f
        :pswitch_81f
        :pswitch_81f
        :pswitch_832
        :pswitch_845
        :pswitch_858
        :pswitch_86b
        :pswitch_11
        :pswitch_895
        :pswitch_8a6
        :pswitch_8b7
        :pswitch_8c8
        :pswitch_8d9
        :pswitch_8d9
        :pswitch_8d9
        :pswitch_8ea
        :pswitch_8fb
        :pswitch_90c
        :pswitch_92b
        :pswitch_938
        :pswitch_945
        :pswitch_989
        :pswitch_99e
        :pswitch_9ce
        :pswitch_9e8
        :pswitch_9e8
        :pswitch_9fb
        :pswitch_a0a
        :pswitch_a17
        :pswitch_a17
        :pswitch_11
        :pswitch_a2a
    .end packed-switch
.end method
