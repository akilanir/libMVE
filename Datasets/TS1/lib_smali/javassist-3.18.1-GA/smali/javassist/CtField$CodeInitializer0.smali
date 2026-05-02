.class abstract Ljavassist/CtField$CodeInitializer0;
.super Ljavassist/CtField$Initializer;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/CtField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "CodeInitializer0"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 851
    invoke-direct {p0}, Ljavassist/CtField$Initializer;-><init>()V

    return-void
.end method


# virtual methods
.method compile(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;Ljavassist/compiler/Javac;)I
    .registers 9
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "code"    # Ljavassist/bytecode/Bytecode;
    .param p4, "parameters"    # [Ljavassist/CtClass;
    .param p5, "drv"    # Ljavassist/compiler/Javac;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 859
    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {p3, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 860
    invoke-virtual {p0, p5}, Ljavassist/CtField$CodeInitializer0;->compileExpr(Ljavassist/compiler/Javac;)V

    .line 861
    sget-object v1, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1, p2, v2}, Ljavassist/bytecode/Bytecode;->addPutfield(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 862
    invoke-virtual {p3}, Ljavassist/bytecode/Bytecode;->getMaxStack()I
    :try_end_13
    .catch Ljavassist/compiler/CompileError; {:try_start_1 .. :try_end_13} :catch_15

    move-result v1

    return v1

    .line 864
    :catch_15
    move-exception v0

    .line 865
    .local v0, "e":Ljavassist/compiler/CompileError;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v1
.end method

.method abstract compileExpr(Ljavassist/compiler/Javac;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method compileIfStatic(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;)I
    .registers 8
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "code"    # Ljavassist/bytecode/Bytecode;
    .param p4, "drv"    # Ljavassist/compiler/Javac;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 873
    :try_start_0
    invoke-virtual {p0, p4}, Ljavassist/CtField$CodeInitializer0;->compileExpr(Ljavassist/compiler/Javac;)V

    .line 874
    sget-object v1, Ljavassist/bytecode/Bytecode;->THIS:Ljavassist/CtClass;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1, p2, v2}, Ljavassist/bytecode/Bytecode;->addPutstatic(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;)V

    .line 875
    invoke-virtual {p3}, Ljavassist/bytecode/Bytecode;->getMaxStack()I
    :try_end_f
    .catch Ljavassist/compiler/CompileError; {:try_start_0 .. :try_end_f} :catch_11

    move-result v1

    return v1

    .line 877
    :catch_11
    move-exception v0

    .line 878
    .local v0, "e":Ljavassist/compiler/CompileError;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v1
.end method

.method getConstantValue2(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;Ljavassist/compiler/ast/ASTree;)I
    .registers 8
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "type"    # Ljavassist/CtClass;
    .param p3, "tree"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 883
    invoke-virtual {p2}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_54

    .line 884
    instance-of v2, p3, Ljavassist/compiler/ast/IntConst;

    if-eqz v2, :cond_37

    .line 885
    check-cast p3, Ljavassist/compiler/ast/IntConst;

    .end local p3    # "tree":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p3}, Ljavassist/compiler/ast/IntConst;->get()J

    move-result-wide v0

    .line 886
    .local v0, "value":J
    sget-object v2, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    if-ne p2, v2, :cond_1a

    .line 887
    long-to-double v2, v0

    invoke-virtual {p1, v2, v3}, Ljavassist/bytecode/ConstPool;->addDoubleInfo(D)I

    move-result v2

    .line 907
    .end local v0    # "value":J
    :goto_19
    return v2

    .line 888
    .restart local v0    # "value":J
    :cond_1a
    sget-object v2, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    if-ne p2, v2, :cond_24

    .line 889
    long-to-float v2, v0

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->addFloatInfo(F)I

    move-result v2

    goto :goto_19

    .line 890
    :cond_24
    sget-object v2, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    if-ne p2, v2, :cond_2d

    .line 891
    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/ConstPool;->addLongInfo(J)I

    move-result v2

    goto :goto_19

    .line 892
    :cond_2d
    sget-object v2, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-eq p2, v2, :cond_6f

    .line 893
    long-to-int v2, v0

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v2

    goto :goto_19

    .line 895
    .end local v0    # "value":J
    .restart local p3    # "tree":Ljavassist/compiler/ast/ASTree;
    :cond_37
    instance-of v2, p3, Ljavassist/compiler/ast/DoubleConst;

    if-eqz v2, :cond_6f

    .line 896
    check-cast p3, Ljavassist/compiler/ast/DoubleConst;

    .end local p3    # "tree":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p3}, Ljavassist/compiler/ast/DoubleConst;->get()D

    move-result-wide v0

    .line 897
    .local v0, "value":D
    sget-object v2, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    if-ne p2, v2, :cond_4b

    .line 898
    double-to-float v2, v0

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->addFloatInfo(F)I

    move-result v2

    goto :goto_19

    .line 899
    :cond_4b
    sget-object v2, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    if-ne p2, v2, :cond_6f

    .line 900
    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/ConstPool;->addDoubleInfo(D)I

    move-result v2

    goto :goto_19

    .line 903
    .end local v0    # "value":D
    .restart local p3    # "tree":Ljavassist/compiler/ast/ASTree;
    :cond_54
    instance-of v2, p3, Ljavassist/compiler/ast/StringL;

    if-eqz v2, :cond_6f

    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "java.lang.String"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 905
    check-cast p3, Ljavassist/compiler/ast/StringL;

    .end local p3    # "tree":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p3}, Ljavassist/compiler/ast/StringL;->get()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->addStringInfo(Ljava/lang/String;)I

    move-result v2

    goto :goto_19

    .line 907
    :cond_6f
    const/4 v2, 0x0

    goto :goto_19
.end method
