.class public abstract Ljavassist/CtField$Initializer;
.super Ljava/lang/Object;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Initializer"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 478
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static byCall(Ljavassist/CtClass;Ljava/lang/String;)Ljavassist/CtField$Initializer;
    .registers 4
    .param p0, "methodClass"    # Ljavassist/CtClass;
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 680
    new-instance v0, Ljavassist/CtField$MethodInitializer;

    invoke-direct {v0}, Ljavassist/CtField$MethodInitializer;-><init>()V

    .line 681
    .local v0, "i":Ljavassist/CtField$MethodInitializer;
    iput-object p0, v0, Ljavassist/CtField$MethodInitializer;->objectType:Ljavassist/CtClass;

    .line 682
    iput-object p1, v0, Ljavassist/CtField$MethodInitializer;->methodName:Ljava/lang/String;

    .line 683
    const/4 v1, 0x0

    iput-object v1, v0, Ljavassist/CtField$MethodInitializer;->stringParams:[Ljava/lang/String;

    .line 684
    const/4 v1, 0x0

    iput-boolean v1, v0, Ljavassist/CtField$MethodInitializer;->withConstructorParams:Z

    .line 685
    return-object v0
.end method

.method public static byCall(Ljavassist/CtClass;Ljava/lang/String;[Ljava/lang/String;)Ljavassist/CtField$Initializer;
    .registers 5
    .param p0, "methodClass"    # Ljavassist/CtClass;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "stringParams"    # [Ljava/lang/String;

    .prologue
    .line 715
    new-instance v0, Ljavassist/CtField$MethodInitializer;

    invoke-direct {v0}, Ljavassist/CtField$MethodInitializer;-><init>()V

    .line 716
    .local v0, "i":Ljavassist/CtField$MethodInitializer;
    iput-object p0, v0, Ljavassist/CtField$MethodInitializer;->objectType:Ljavassist/CtClass;

    .line 717
    iput-object p1, v0, Ljavassist/CtField$MethodInitializer;->methodName:Ljava/lang/String;

    .line 718
    iput-object p2, v0, Ljavassist/CtField$MethodInitializer;->stringParams:[Ljava/lang/String;

    .line 719
    const/4 v1, 0x0

    iput-boolean v1, v0, Ljavassist/CtField$MethodInitializer;->withConstructorParams:Z

    .line 720
    return-object v0
.end method

.method public static byCallWithParams(Ljavassist/CtClass;Ljava/lang/String;)Ljavassist/CtField$Initializer;
    .registers 4
    .param p0, "methodClass"    # Ljavassist/CtClass;
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 748
    new-instance v0, Ljavassist/CtField$MethodInitializer;

    invoke-direct {v0}, Ljavassist/CtField$MethodInitializer;-><init>()V

    .line 749
    .local v0, "i":Ljavassist/CtField$MethodInitializer;
    iput-object p0, v0, Ljavassist/CtField$MethodInitializer;->objectType:Ljavassist/CtClass;

    .line 750
    iput-object p1, v0, Ljavassist/CtField$MethodInitializer;->methodName:Ljava/lang/String;

    .line 751
    const/4 v1, 0x0

    iput-object v1, v0, Ljavassist/CtField$MethodInitializer;->stringParams:[Ljava/lang/String;

    .line 752
    const/4 v1, 0x1

    iput-boolean v1, v0, Ljavassist/CtField$MethodInitializer;->withConstructorParams:Z

    .line 753
    return-object v0
.end method

.method public static byCallWithParams(Ljavassist/CtClass;Ljava/lang/String;[Ljava/lang/String;)Ljavassist/CtField$Initializer;
    .registers 5
    .param p0, "methodClass"    # Ljavassist/CtClass;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "stringParams"    # [Ljava/lang/String;

    .prologue
    .line 785
    new-instance v0, Ljavassist/CtField$MethodInitializer;

    invoke-direct {v0}, Ljavassist/CtField$MethodInitializer;-><init>()V

    .line 786
    .local v0, "i":Ljavassist/CtField$MethodInitializer;
    iput-object p0, v0, Ljavassist/CtField$MethodInitializer;->objectType:Ljavassist/CtClass;

    .line 787
    iput-object p1, v0, Ljavassist/CtField$MethodInitializer;->methodName:Ljava/lang/String;

    .line 788
    iput-object p2, v0, Ljavassist/CtField$MethodInitializer;->stringParams:[Ljava/lang/String;

    .line 789
    const/4 v1, 0x1

    iput-boolean v1, v0, Ljavassist/CtField$MethodInitializer;->withConstructorParams:Z

    .line 790
    return-object v0
.end method

.method public static byExpr(Ljava/lang/String;)Ljavassist/CtField$Initializer;
    .registers 2
    .param p0, "source"    # Ljava/lang/String;

    .prologue
    .line 826
    new-instance v0, Ljavassist/CtField$CodeInitializer;

    invoke-direct {v0, p0}, Ljavassist/CtField$CodeInitializer;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method static byExpr(Ljavassist/compiler/ast/ASTree;)Ljavassist/CtField$Initializer;
    .registers 2
    .param p0, "source"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 830
    new-instance v0, Ljavassist/CtField$PtreeInitializer;

    invoke-direct {v0, p0}, Ljavassist/CtField$PtreeInitializer;-><init>(Ljavassist/compiler/ast/ASTree;)V

    return-object v0
.end method

.method public static byNew(Ljavassist/CtClass;)Ljavassist/CtField$Initializer;
    .registers 3
    .param p0, "objectType"    # Ljavassist/CtClass;

    .prologue
    .line 563
    new-instance v0, Ljavassist/CtField$NewInitializer;

    invoke-direct {v0}, Ljavassist/CtField$NewInitializer;-><init>()V

    .line 564
    .local v0, "i":Ljavassist/CtField$NewInitializer;
    iput-object p0, v0, Ljavassist/CtField$NewInitializer;->objectType:Ljavassist/CtClass;

    .line 565
    const/4 v1, 0x0

    iput-object v1, v0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    .line 566
    const/4 v1, 0x0

    iput-boolean v1, v0, Ljavassist/CtField$NewInitializer;->withConstructorParams:Z

    .line 567
    return-object v0
.end method

.method public static byNew(Ljavassist/CtClass;[Ljava/lang/String;)Ljavassist/CtField$Initializer;
    .registers 4
    .param p0, "objectType"    # Ljavassist/CtClass;
    .param p1, "stringParams"    # [Ljava/lang/String;

    .prologue
    .line 591
    new-instance v0, Ljavassist/CtField$NewInitializer;

    invoke-direct {v0}, Ljavassist/CtField$NewInitializer;-><init>()V

    .line 592
    .local v0, "i":Ljavassist/CtField$NewInitializer;
    iput-object p0, v0, Ljavassist/CtField$NewInitializer;->objectType:Ljavassist/CtClass;

    .line 593
    iput-object p1, v0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    .line 594
    const/4 v1, 0x0

    iput-boolean v1, v0, Ljavassist/CtField$NewInitializer;->withConstructorParams:Z

    .line 595
    return-object v0
.end method

.method public static byNewArray(Ljavassist/CtClass;I)Ljavassist/CtField$Initializer;
    .registers 4
    .param p0, "type"    # Ljavassist/CtClass;
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 804
    new-instance v0, Ljavassist/CtField$ArrayInitializer;

    invoke-virtual {p0}, Ljavassist/CtClass;->getComponentType()Ljavassist/CtClass;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljavassist/CtField$ArrayInitializer;-><init>(Ljavassist/CtClass;I)V

    return-object v0
.end method

.method public static byNewArray(Ljavassist/CtClass;[I)Ljavassist/CtField$Initializer;
    .registers 3
    .param p0, "type"    # Ljavassist/CtClass;
    .param p1, "sizes"    # [I

    .prologue
    .line 817
    new-instance v0, Ljavassist/CtField$MultiArrayInitializer;

    invoke-direct {v0, p0, p1}, Ljavassist/CtField$MultiArrayInitializer;-><init>(Ljavassist/CtClass;[I)V

    return-object v0
.end method

.method public static byNewWithParams(Ljavassist/CtClass;)Ljavassist/CtField$Initializer;
    .registers 3
    .param p0, "objectType"    # Ljavassist/CtClass;

    .prologue
    .line 620
    new-instance v0, Ljavassist/CtField$NewInitializer;

    invoke-direct {v0}, Ljavassist/CtField$NewInitializer;-><init>()V

    .line 621
    .local v0, "i":Ljavassist/CtField$NewInitializer;
    iput-object p0, v0, Ljavassist/CtField$NewInitializer;->objectType:Ljavassist/CtClass;

    .line 622
    const/4 v1, 0x0

    iput-object v1, v0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    .line 623
    const/4 v1, 0x1

    iput-boolean v1, v0, Ljavassist/CtField$NewInitializer;->withConstructorParams:Z

    .line 624
    return-object v0
.end method

.method public static byNewWithParams(Ljavassist/CtClass;[Ljava/lang/String;)Ljavassist/CtField$Initializer;
    .registers 4
    .param p0, "objectType"    # Ljavassist/CtClass;
    .param p1, "stringParams"    # [Ljava/lang/String;

    .prologue
    .line 651
    new-instance v0, Ljavassist/CtField$NewInitializer;

    invoke-direct {v0}, Ljavassist/CtField$NewInitializer;-><init>()V

    .line 652
    .local v0, "i":Ljavassist/CtField$NewInitializer;
    iput-object p0, v0, Ljavassist/CtField$NewInitializer;->objectType:Ljavassist/CtClass;

    .line 653
    iput-object p1, v0, Ljavassist/CtField$NewInitializer;->stringParams:[Ljava/lang/String;

    .line 654
    const/4 v1, 0x1

    iput-boolean v1, v0, Ljavassist/CtField$NewInitializer;->withConstructorParams:Z

    .line 655
    return-object v0
.end method

.method public static byParameter(I)Ljavassist/CtField$Initializer;
    .registers 2
    .param p0, "nth"    # I

    .prologue
    .line 542
    new-instance v0, Ljavassist/CtField$ParamInitializer;

    invoke-direct {v0}, Ljavassist/CtField$ParamInitializer;-><init>()V

    .line 543
    .local v0, "i":Ljavassist/CtField$ParamInitializer;
    iput p0, v0, Ljavassist/CtField$ParamInitializer;->nthParam:I

    .line 544
    return-object v0
.end method

.method public static constant(D)Ljavassist/CtField$Initializer;
    .registers 3
    .param p0, "d"    # D

    .prologue
    .line 516
    new-instance v0, Ljavassist/CtField$DoubleInitializer;

    invoke-direct {v0, p0, p1}, Ljavassist/CtField$DoubleInitializer;-><init>(D)V

    return-object v0
.end method

.method public static constant(F)Ljavassist/CtField$Initializer;
    .registers 2
    .param p0, "l"    # F

    .prologue
    .line 508
    new-instance v0, Ljavassist/CtField$FloatInitializer;

    invoke-direct {v0, p0}, Ljavassist/CtField$FloatInitializer;-><init>(F)V

    return-object v0
.end method

.method public static constant(I)Ljavassist/CtField$Initializer;
    .registers 2
    .param p0, "i"    # I

    .prologue
    .line 484
    new-instance v0, Ljavassist/CtField$IntInitializer;

    invoke-direct {v0, p0}, Ljavassist/CtField$IntInitializer;-><init>(I)V

    return-object v0
.end method

.method public static constant(J)Ljavassist/CtField$Initializer;
    .registers 3
    .param p0, "l"    # J

    .prologue
    .line 500
    new-instance v0, Ljavassist/CtField$LongInitializer;

    invoke-direct {v0, p0, p1}, Ljavassist/CtField$LongInitializer;-><init>(J)V

    return-object v0
.end method

.method public static constant(Ljava/lang/String;)Ljavassist/CtField$Initializer;
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 524
    new-instance v0, Ljavassist/CtField$StringInitializer;

    invoke-direct {v0, p0}, Ljavassist/CtField$StringInitializer;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static constant(Z)Ljavassist/CtField$Initializer;
    .registers 3
    .param p0, "b"    # Z

    .prologue
    .line 492
    new-instance v1, Ljavassist/CtField$IntInitializer;

    if-eqz p0, :cond_9

    const/4 v0, 0x1

    :goto_5
    invoke-direct {v1, v0}, Ljavassist/CtField$IntInitializer;-><init>(I)V

    return-object v1

    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method


# virtual methods
.method check(Ljava/lang/String;)V
    .registers 2
    .param p1, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 835
    return-void
.end method

.method abstract compile(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;Ljavassist/compiler/Javac;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation
.end method

.method abstract compileIfStatic(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation
.end method

.method getConstantValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)I
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;

    .prologue
    .line 848
    const/4 v0, 0x0

    return v0
.end method
