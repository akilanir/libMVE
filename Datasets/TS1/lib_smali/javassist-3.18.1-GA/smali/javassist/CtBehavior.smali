.class public abstract Ljavassist/CtBehavior;
.super Ljavassist/CtMember;
.source "CtBehavior.java"


# instance fields
.field protected methodInfo:Ljavassist/bytecode/MethodInfo;


# direct methods
.method protected constructor <init>(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V
    .registers 3
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "minfo"    # Ljavassist/bytecode/MethodInfo;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Ljavassist/CtMember;-><init>(Ljavassist/CtClass;)V

    .line 40
    iput-object p2, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    .line 41
    return-void
.end method

.method private addParameter2(ILjavassist/CtClass;Ljava/lang/String;)V
    .registers 14
    .param p1, "where"    # I
    .param p2, "type"    # Ljavassist/CtClass;
    .param p3, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 644
    iget-object v9, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v9}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 645
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    if-eqz v0, :cond_5c

    .line 646
    const/4 v4, 0x1

    .line 647
    .local v4, "size":I
    const/16 v7, 0x4c

    .line 648
    .local v7, "typeDesc":C
    const/4 v1, 0x0

    .line 649
    .local v1, "classInfo":I
    invoke-virtual {p2}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_5d

    move-object v2, p2

    .line 650
    check-cast v2, Ljavassist/CtPrimitiveType;

    .line 651
    .local v2, "cpt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v2}, Ljavassist/CtPrimitiveType;->getDataSize()I

    move-result v4

    .line 652
    invoke-virtual {v2}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v7

    .line 657
    .end local v2    # "cpt":Ljavassist/CtPrimitiveType;
    :goto_1d
    invoke-virtual {v0, p1, v4}, Ljavassist/bytecode/CodeAttribute;->insertLocalVar(II)V

    .line 658
    const-string v9, "LocalVariableTable"

    invoke-virtual {v0, v9}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v8

    check-cast v8, Ljavassist/bytecode/LocalVariableAttribute;

    .line 660
    .local v8, "va":Ljavassist/bytecode/LocalVariableAttribute;
    if-eqz v8, :cond_2d

    .line 661
    invoke-virtual {v8, p1, v4}, Ljavassist/bytecode/LocalVariableAttribute;->shiftIndex(II)V

    .line 663
    :cond_2d
    const-string v9, "LocalVariableTypeTable"

    invoke-virtual {v0, v9}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    check-cast v3, Ljavassist/bytecode/LocalVariableTypeAttribute;

    .line 665
    .local v3, "lvta":Ljavassist/bytecode/LocalVariableTypeAttribute;
    if-eqz v3, :cond_3a

    .line 666
    invoke-virtual {v3, p1, v4}, Ljavassist/bytecode/LocalVariableTypeAttribute;->shiftIndex(II)V

    .line 668
    :cond_3a
    const-string v9, "StackMapTable"

    invoke-virtual {v0, v9}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v6

    check-cast v6, Ljavassist/bytecode/StackMapTable;

    .line 669
    .local v6, "smt":Ljavassist/bytecode/StackMapTable;
    if-eqz v6, :cond_4b

    .line 670
    invoke-static {v7}, Ljavassist/bytecode/StackMapTable;->typeTagOf(C)I

    move-result v9

    invoke-virtual {v6, p1, v9, v1}, Ljavassist/bytecode/StackMapTable;->insertLocal(III)V

    .line 672
    :cond_4b
    const-string v9, "StackMap"

    invoke-virtual {v0, v9}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v5

    check-cast v5, Ljavassist/bytecode/StackMap;

    .line 673
    .local v5, "sm":Ljavassist/bytecode/StackMap;
    if-eqz v5, :cond_5c

    .line 674
    invoke-static {v7}, Ljavassist/bytecode/StackMapTable;->typeTagOf(C)I

    move-result v9

    invoke-virtual {v5, p1, v9, v1}, Ljavassist/bytecode/StackMap;->insertLocal(III)V

    .line 676
    .end local v1    # "classInfo":I
    .end local v3    # "lvta":Ljavassist/bytecode/LocalVariableTypeAttribute;
    .end local v4    # "size":I
    .end local v5    # "sm":Ljavassist/bytecode/StackMap;
    .end local v6    # "smt":Ljavassist/bytecode/StackMapTable;
    .end local v7    # "typeDesc":C
    .end local v8    # "va":Ljavassist/bytecode/LocalVariableAttribute;
    :cond_5c
    return-void

    .line 655
    .restart local v1    # "classInfo":I
    .restart local v4    # "size":I
    .restart local v7    # "typeDesc":C
    :cond_5d
    iget-object v9, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v9}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v1

    goto :goto_1d
.end method

.method private getAnnotations(Z)[Ljava/lang/Object;
    .registers 6
    .param p1, "ignoreNotFound"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 234
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v2

    .line 235
    .local v2, "mi":Ljavassist/bytecode/MethodInfo;
    const-string v3, "RuntimeInvisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AnnotationsAttribute;

    .line 237
    .local v0, "ainfo":Ljavassist/bytecode/AnnotationsAttribute;
    const-string v3, "RuntimeVisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/AnnotationsAttribute;

    .line 239
    .local v1, "ainfo2":Ljavassist/bytecode/AnnotationsAttribute;
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-static {p1, v3, v0, v1}, Ljavassist/CtClassType;->toAnnotationType(ZLjavassist/ClassPool;Ljavassist/bytecode/AnnotationsAttribute;Ljavassist/bytecode/AnnotationsAttribute;)[Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method private insertAfterAdvice(Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;Ljava/lang/String;Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;I)I
    .registers 10
    .param p1, "code"    # Ljavassist/bytecode/Bytecode;
    .param p2, "jv"    # Ljavassist/compiler/Javac;
    .param p3, "src"    # Ljava/lang/String;
    .param p4, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p5, "rtype"    # Ljavassist/CtClass;
    .param p6, "varNo"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 888
    invoke-virtual {p1}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v0

    .line 889
    .local v0, "pc":I
    sget-object v1, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-ne p5, v1, :cond_26

    .line 890
    invoke-virtual {p1, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 891
    invoke-virtual {p1, p6}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 892
    invoke-virtual {p2, p3}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 893
    const/16 v1, 0xb1

    invoke-virtual {p1, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 894
    invoke-virtual {p1}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v1

    if-ge v1, v2, :cond_20

    .line 895
    invoke-virtual {p1, v2}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 907
    .end local p5    # "rtype":Ljavassist/CtClass;
    :cond_20
    :goto_20
    invoke-virtual {p1}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v1

    sub-int/2addr v1, v0

    return v1

    .line 898
    .restart local p5    # "rtype":Ljavassist/CtClass;
    :cond_26
    invoke-virtual {p1, p6, p5}, Ljavassist/bytecode/Bytecode;->addStore(ILjavassist/CtClass;)I

    .line 899
    invoke-virtual {p2, p3}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 900
    invoke-virtual {p1, p6, p5}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    .line 901
    invoke-virtual {p5}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 902
    check-cast p5, Ljavassist/CtPrimitiveType;

    .end local p5    # "rtype":Ljavassist/CtClass;
    invoke-virtual {p5}, Ljavassist/CtPrimitiveType;->getReturnOp()I

    move-result v1

    invoke-virtual {p1, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_20

    .line 904
    .restart local p5    # "rtype":Ljavassist/CtClass;
    :cond_3f
    const/16 v1, 0xb0

    invoke-virtual {p1, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_20
.end method

.method private insertAfterHandler(ZLjavassist/bytecode/Bytecode;Ljavassist/CtClass;ILjavassist/compiler/Javac;Ljava/lang/String;)I
    .registers 13
    .param p1, "asFinally"    # Z
    .param p2, "b"    # Ljavassist/bytecode/Bytecode;
    .param p3, "rtype"    # Ljavassist/CtClass;
    .param p4, "returnVarNo"    # I
    .param p5, "javac"    # Ljavassist/compiler/Javac;
    .param p6, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x1

    .line 944
    if-nez p1, :cond_5

    .line 982
    .end local p3    # "rtype":Ljavassist/CtClass;
    :goto_4
    return v3

    .line 947
    .restart local p3    # "rtype":Ljavassist/CtClass;
    :cond_5
    invoke-virtual {p2}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v2

    .line 948
    .local v2, "var":I
    invoke-virtual {p2, v5}, Ljavassist/bytecode/Bytecode;->incMaxLocals(I)V

    .line 949
    invoke-virtual {p2}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v1

    .line 950
    .local v1, "pc":I
    invoke-virtual {p2, v2}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 951
    invoke-virtual {p3}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v4

    if-eqz v4, :cond_67

    .line 952
    check-cast p3, Ljavassist/CtPrimitiveType;

    .end local p3    # "rtype":Ljavassist/CtClass;
    invoke-virtual {p3}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v0

    .line 953
    .local v0, "c":C
    const/16 v4, 0x44

    if-ne v0, v4, :cond_3c

    .line 954
    const-wide/16 v3, 0x0

    invoke-virtual {p2, v3, v4}, Ljavassist/bytecode/Bytecode;->addDconst(D)V

    .line 955
    invoke-virtual {p2, p4}, Ljavassist/bytecode/Bytecode;->addDstore(I)V

    .line 979
    .end local v0    # "c":C
    :goto_2b
    invoke-virtual {p5, p6}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 980
    invoke-virtual {p2, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 981
    const/16 v3, 0xbf

    invoke-virtual {p2, v3}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 982
    invoke-virtual {p2}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v3

    sub-int/2addr v3, v1

    goto :goto_4

    .line 957
    .restart local v0    # "c":C
    :cond_3c
    const/16 v4, 0x46

    if-ne v0, v4, :cond_48

    .line 958
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Ljavassist/bytecode/Bytecode;->addFconst(F)V

    .line 959
    invoke-virtual {p2, p4}, Ljavassist/bytecode/Bytecode;->addFstore(I)V

    goto :goto_2b

    .line 961
    :cond_48
    const/16 v4, 0x4a

    if-ne v0, v4, :cond_55

    .line 962
    const-wide/16 v3, 0x0

    invoke-virtual {p2, v3, v4}, Ljavassist/bytecode/Bytecode;->addLconst(J)V

    .line 963
    invoke-virtual {p2, p4}, Ljavassist/bytecode/Bytecode;->addLstore(I)V

    goto :goto_2b

    .line 965
    :cond_55
    const/16 v4, 0x56

    if-ne v0, v4, :cond_60

    .line 966
    invoke-virtual {p2, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 967
    invoke-virtual {p2, p4}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    goto :goto_2b

    .line 970
    :cond_60
    invoke-virtual {p2, v3}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 971
    invoke-virtual {p2, p4}, Ljavassist/bytecode/Bytecode;->addIstore(I)V

    goto :goto_2b

    .line 975
    .end local v0    # "c":C
    .restart local p3    # "rtype":Ljavassist/CtClass;
    :cond_67
    invoke-virtual {p2, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 976
    invoke-virtual {p2, p4}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    goto :goto_2b
.end method

.method private insertBefore(Ljava/lang/String;Z)V
    .registers 16
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "rebuild"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 740
    iget-object v2, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    .line 741
    .local v2, "cc":Ljavassist/CtClass;
    invoke-virtual {v2}, Ljavassist/CtClass;->checkModify()V

    .line 742
    iget-object v10, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v10}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    .line 743
    .local v1, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v1, :cond_15

    .line 744
    new-instance v10, Ljavassist/CannotCompileException;

    const-string v11, "no method body"

    invoke-direct {v10, v11}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 746
    :cond_15
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v4

    .line 747
    .local v4, "iterator":Ljavassist/bytecode/CodeIterator;
    new-instance v5, Ljavassist/compiler/Javac;

    invoke-direct {v5, v2}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 749
    .local v5, "jv":Ljavassist/compiler/Javac;
    :try_start_1e
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v10

    invoke-virtual {p0}, Ljavassist/CtBehavior;->getModifiers()I

    move-result v11

    invoke-static {v11}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v11

    invoke-virtual {v5, v10, v11}, Ljavassist/compiler/Javac;->recordParams([Ljavassist/CtClass;Z)I

    move-result v7

    .line 751
    .local v7, "nvars":I
    invoke-virtual {v5, v1, v7}, Ljavassist/compiler/Javac;->recordParamNames(Ljavassist/bytecode/CodeAttribute;I)Z

    .line 752
    const/4 v10, 0x0

    invoke-virtual {v5, v1, v10}, Ljavassist/compiler/Javac;->recordLocalVariables(Ljavassist/bytecode/CodeAttribute;I)Z

    .line 753
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getReturnType0()Ljavassist/CtClass;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljavassist/compiler/Javac;->recordType(Ljavassist/CtClass;)V

    .line 754
    invoke-virtual {v5, p1}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 755
    invoke-virtual {v5}, Ljavassist/compiler/Javac;->getBytecode()Ljavassist/bytecode/Bytecode;

    move-result-object v0

    .line 756
    .local v0, "b":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getMaxStack()I

    move-result v9

    .line 757
    .local v9, "stack":I
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v6

    .line 759
    .local v6, "locals":I
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v10

    if-le v9, v10, :cond_54

    .line 760
    invoke-virtual {v1, v9}, Ljavassist/bytecode/CodeAttribute;->setMaxStack(I)V

    .line 762
    :cond_54
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v10

    if-le v6, v10, :cond_5d

    .line 763
    invoke-virtual {v1, v6}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 765
    :cond_5d
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v10

    invoke-virtual {v4, v10}, Ljavassist/bytecode/CodeIterator;->insertEx([B)I

    move-result v8

    .line 766
    .local v8, "pos":I
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v10

    invoke-virtual {v4, v10, v8}, Ljavassist/bytecode/CodeIterator;->insert(Ljavassist/bytecode/ExceptionTable;I)V

    .line 767
    if-eqz p2, :cond_7b

    .line 768
    iget-object v10, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v11

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V
    :try_end_7b
    .catch Ljavassist/NotFoundException; {:try_start_1e .. :try_end_7b} :catch_7c
    .catch Ljavassist/compiler/CompileError; {:try_start_1e .. :try_end_7b} :catch_83
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_1e .. :try_end_7b} :catch_8a

    .line 779
    :cond_7b
    return-void

    .line 770
    .end local v0    # "b":Ljavassist/bytecode/Bytecode;
    .end local v6    # "locals":I
    .end local v7    # "nvars":I
    .end local v8    # "pos":I
    .end local v9    # "stack":I
    :catch_7c
    move-exception v3

    .line 771
    .local v3, "e":Ljavassist/NotFoundException;
    new-instance v10, Ljavassist/CannotCompileException;

    invoke-direct {v10, v3}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v10

    .line 773
    .end local v3    # "e":Ljavassist/NotFoundException;
    :catch_83
    move-exception v3

    .line 774
    .local v3, "e":Ljavassist/compiler/CompileError;
    new-instance v10, Ljavassist/CannotCompileException;

    invoke-direct {v10, v3}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v10

    .line 776
    .end local v3    # "e":Ljavassist/compiler/CompileError;
    :catch_8a
    move-exception v3

    .line 777
    .local v3, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v10, Ljavassist/CannotCompileException;

    invoke-direct {v10, v3}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v10
.end method

.method private insertGoto(Ljavassist/bytecode/CodeIterator;II)V
    .registers 11
    .param p1, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .param p2, "subr"    # I
    .param p3, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/16 v6, 0x7fff

    const/16 v5, 0xc8

    const/4 v3, 0x2

    const/4 v4, 0x0

    .line 916
    invoke-virtual {p1, p2}, Ljavassist/bytecode/CodeIterator;->setMark(I)V

    .line 918
    invoke-virtual {p1, v4, p3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 919
    add-int/lit8 v2, p2, 0x2

    sub-int/2addr v2, p3

    if-le v2, v6, :cond_2c

    const/4 v1, 0x1

    .line 920
    .local v1, "wide":Z
    :goto_12
    if-eqz v1, :cond_2e

    const/4 v2, 0x4

    :goto_15
    invoke-virtual {p1, p3, v2, v4}, Ljavassist/bytecode/CodeIterator;->insertGapAt(IIZ)Ljavassist/bytecode/CodeIterator$Gap;

    move-result-object v2

    iget p3, v2, Ljavassist/bytecode/CodeIterator$Gap;->position:I

    .line 921
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->getMark()I

    move-result v2

    sub-int v0, v2, p3

    .line 922
    .local v0, "offset":I
    if-eqz v1, :cond_30

    .line 923
    invoke-virtual {p1, v5, p3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 924
    add-int/lit8 v2, p3, 0x1

    invoke-virtual {p1, v0, v2}, Ljavassist/bytecode/CodeIterator;->write32bit(II)V

    .line 935
    :goto_2b
    return-void

    .end local v0    # "offset":I
    .end local v1    # "wide":Z
    :cond_2c
    move v1, v4

    .line 919
    goto :goto_12

    .restart local v1    # "wide":Z
    :cond_2e
    move v2, v3

    .line 920
    goto :goto_15

    .line 926
    .restart local v0    # "offset":I
    :cond_30
    if-gt v0, v6, :cond_3d

    .line 927
    const/16 v2, 0xa7

    invoke-virtual {p1, v2, p3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 928
    add-int/lit8 v2, p3, 0x1

    invoke-virtual {p1, v0, v2}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    goto :goto_2b

    .line 931
    :cond_3d
    invoke-virtual {p1, p3, v3, v4}, Ljavassist/bytecode/CodeIterator;->insertGapAt(IIZ)Ljavassist/bytecode/CodeIterator$Gap;

    move-result-object v2

    iget p3, v2, Ljavassist/bytecode/CodeIterator$Gap;->position:I

    .line 932
    invoke-virtual {p1, v5, p3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 933
    invoke-virtual {p1}, Ljavassist/bytecode/CodeIterator;->getMark()I

    move-result v2

    sub-int/2addr v2, p3

    add-int/lit8 v3, p3, 0x1

    invoke-virtual {p1, v2, v3}, Ljavassist/bytecode/CodeIterator;->write32bit(II)V

    goto :goto_2b
.end method

.method static setBody0(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/ClassMap;)V
    .registers 12
    .param p0, "srcClass"    # Ljavassist/CtClass;
    .param p1, "srcInfo"    # Ljavassist/bytecode/MethodInfo;
    .param p2, "destClass"    # Ljavassist/CtClass;
    .param p3, "destInfo"    # Ljavassist/bytecode/MethodInfo;
    .param p4, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 457
    invoke-virtual {p2}, Ljavassist/CtClass;->checkModify()V

    .line 459
    new-instance v4, Ljavassist/ClassMap;

    invoke-direct {v4, p4}, Ljavassist/ClassMap;-><init>(Ljavassist/ClassMap;)V

    .line 460
    .end local p4    # "map":Ljavassist/ClassMap;
    .local v4, "map":Ljavassist/ClassMap;
    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljavassist/ClassMap;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 462
    :try_start_13
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    .line 463
    .local v1, "cattr":Ljavassist/bytecode/CodeAttribute;
    if-eqz v1, :cond_26

    .line 464
    invoke-virtual {p3}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    .line 465
    .local v2, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {v1, v2, v4}, Ljavassist/bytecode/CodeAttribute;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/CodeAttribute;

    .line 466
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    invoke-virtual {p3, v0}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V
    :try_end_26
    .catch Ljavassist/bytecode/CodeAttribute$RuntimeCopyException; {:try_start_13 .. :try_end_26} :catch_33

    .line 476
    .end local v0    # "ca":Ljavassist/bytecode/CodeAttribute;
    .end local v2    # "cp":Ljavassist/bytecode/ConstPool;
    :cond_26
    invoke-virtual {p3}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v5

    and-int/lit16 v5, v5, -0x401

    invoke-virtual {p3, v5}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 478
    invoke-virtual {p2}, Ljavassist/CtClass;->rebuildClassFile()V

    .line 479
    return-void

    .line 470
    .end local v1    # "cattr":Ljavassist/bytecode/CodeAttribute;
    :catch_33
    move-exception v3

    .line 473
    .local v3, "e":Ljavassist/bytecode/CodeAttribute$RuntimeCopyException;
    new-instance v5, Ljavassist/CannotCompileException;

    invoke-direct {v5, v3}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method


# virtual methods
.method public addCatch(Ljava/lang/String;Ljavassist/CtClass;)V
    .registers 4
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "exceptionType"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1048
    const-string v0, "$e"

    invoke-virtual {p0, p1, p2, v0}, Ljavassist/CtBehavior;->addCatch(Ljava/lang/String;Ljavassist/CtClass;Ljava/lang/String;)V

    .line 1049
    return-void
.end method

.method public addCatch(Ljava/lang/String;Ljavassist/CtClass;Ljava/lang/String;)V
    .registers 21
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "exceptionType"    # Ljavassist/CtClass;
    .param p3, "exceptionName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1067
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    .line 1068
    .local v4, "cc":Ljavassist/CtClass;
    invoke-virtual {v4}, Ljavassist/CtClass;->checkModify()V

    .line 1069
    move-object/from16 v0, p0

    iget-object v14, v0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v14}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v5

    .line 1070
    .local v5, "cp":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p0

    iget-object v14, v0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v14}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v3

    .line 1071
    .local v3, "ca":Ljavassist/bytecode/CodeAttribute;
    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v7

    .line 1072
    .local v7, "iterator":Ljavassist/bytecode/CodeIterator;
    new-instance v2, Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v14

    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v15

    invoke-direct {v2, v5, v14, v15}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 1073
    .local v2, "b":Ljavassist/bytecode/Bytecode;
    const/4 v14, 0x1

    invoke-virtual {v2, v14}, Ljavassist/bytecode/Bytecode;->setStackDepth(I)V

    .line 1074
    new-instance v8, Ljavassist/compiler/Javac;

    invoke-direct {v8, v2, v4}, Ljavassist/compiler/Javac;-><init>(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V

    .line 1076
    .local v8, "jv":Ljavassist/compiler/Javac;
    :try_start_31
    invoke-virtual/range {p0 .. p0}, Ljavassist/CtBehavior;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Ljavassist/CtBehavior;->getModifiers()I

    move-result v15

    invoke-static {v15}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v15

    invoke-virtual {v8, v14, v15}, Ljavassist/compiler/Javac;->recordParams([Ljavassist/CtClass;Z)I

    .line 1078
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {v8, v0, v1}, Ljavassist/compiler/Javac;->recordVariable(Ljavassist/CtClass;Ljava/lang/String;)I

    move-result v13

    .line 1079
    .local v13, "var":I
    invoke-virtual {v2, v13}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 1080
    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 1082
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->getMaxStack()I

    move-result v12

    .line 1083
    .local v12, "stack":I
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v10

    .line 1085
    .local v10, "locals":I
    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v14

    if-le v12, v14, :cond_61

    .line 1086
    invoke-virtual {v3, v12}, Ljavassist/bytecode/CodeAttribute;->setMaxStack(I)V

    .line 1088
    :cond_61
    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v14

    if-le v10, v14, :cond_6a

    .line 1089
    invoke-virtual {v3, v10}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 1091
    :cond_6a
    invoke-virtual {v7}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I

    move-result v9

    .line 1092
    .local v9, "len":I
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v14

    invoke-virtual {v7, v14}, Ljavassist/bytecode/CodeIterator;->append([B)I

    move-result v11

    .line 1093
    .local v11, "pos":I
    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ljavassist/CtBehavior;->getStartPosOfBody(Ljavassist/bytecode/CodeAttribute;)I

    move-result v15

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljavassist/CtClass;)I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v14, v15, v9, v9, v0}, Ljavassist/bytecode/ExceptionTable;->add(IIII)V

    .line 1095
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v14

    invoke-virtual {v7, v14, v11}, Ljavassist/bytecode/CodeIterator;->append(Ljavassist/bytecode/ExceptionTable;I)V

    .line 1096
    move-object/from16 v0, p0

    iget-object v14, v0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v15

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v16

    invoke-virtual/range {v14 .. v16}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V
    :try_end_a1
    .catch Ljavassist/NotFoundException; {:try_start_31 .. :try_end_a1} :catch_a2
    .catch Ljavassist/compiler/CompileError; {:try_start_31 .. :try_end_a1} :catch_a9
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_31 .. :try_end_a1} :catch_b0

    .line 1106
    return-void

    .line 1098
    .end local v9    # "len":I
    .end local v10    # "locals":I
    .end local v11    # "pos":I
    .end local v12    # "stack":I
    .end local v13    # "var":I
    :catch_a2
    move-exception v6

    .line 1099
    .local v6, "e":Ljavassist/NotFoundException;
    new-instance v14, Ljavassist/CannotCompileException;

    invoke-direct {v14, v6}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v14

    .line 1101
    .end local v6    # "e":Ljavassist/NotFoundException;
    :catch_a9
    move-exception v6

    .line 1102
    .local v6, "e":Ljavassist/compiler/CompileError;
    new-instance v14, Ljavassist/CannotCompileException;

    invoke-direct {v14, v6}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v14

    .line 1103
    .end local v6    # "e":Ljavassist/compiler/CompileError;
    :catch_b0
    move-exception v6

    .line 1104
    .local v6, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v14, Ljavassist/CannotCompileException;

    invoke-direct {v14, v6}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v14
.end method

.method public addLocalVariable(Ljava/lang/String;Ljavassist/CtClass;)V
    .registers 12
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 582
    iget-object v1, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->checkModify()V

    .line 583
    iget-object v1, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v7

    .line 584
    .local v7, "cp":Ljavassist/bytecode/ConstPool;
    iget-object v1, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v6

    .line 585
    .local v6, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v6, :cond_1b

    .line 586
    new-instance v1, Ljavassist/CannotCompileException;

    const-string v2, "no method body"

    invoke-direct {v1, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 588
    :cond_1b
    const-string v1, "LocalVariableTable"

    invoke-virtual {v6, v1}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/LocalVariableAttribute;

    .line 590
    .local v0, "va":Ljavassist/bytecode/LocalVariableAttribute;
    if-nez v0, :cond_31

    .line 591
    new-instance v0, Ljavassist/bytecode/LocalVariableAttribute;

    .end local v0    # "va":Ljavassist/bytecode/LocalVariableAttribute;
    invoke-direct {v0, v7}, Ljavassist/bytecode/LocalVariableAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 592
    .restart local v0    # "va":Ljavassist/bytecode/LocalVariableAttribute;
    invoke-virtual {v6}, Ljavassist/bytecode/CodeAttribute;->getAttributes()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 595
    :cond_31
    invoke-virtual {v6}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v5

    .line 596
    .local v5, "maxLocals":I
    invoke-static {p2}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v8

    .line 597
    .local v8, "desc":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {v6}, Ljavassist/bytecode/CodeAttribute;->getCodeLength()I

    move-result v2

    invoke-virtual {v7, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v7, v8}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v4

    invoke-virtual/range {v0 .. v5}, Ljavassist/bytecode/LocalVariableAttribute;->addEntry(IIIII)V

    .line 599
    invoke-static {v8}, Ljavassist/bytecode/Descriptor;->dataSize(Ljava/lang/String;)I

    move-result v1

    add-int/2addr v1, v5

    invoke-virtual {v6, v1}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 600
    return-void
.end method

.method public addParameter(Ljavassist/CtClass;)V
    .registers 7
    .param p1, "type"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 627
    iget-object v4, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v4}, Ljavassist/CtClass;->checkModify()V

    .line 628
    iget-object v4, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 629
    .local v0, "desc":Ljava/lang/String;
    invoke-static {p1, v0}, Ljavassist/bytecode/Descriptor;->appendParameter(Ljavassist/CtClass;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 630
    .local v1, "desc2":Ljava/lang/String;
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v4

    if-eqz v4, :cond_28

    const/4 v3, 0x0

    .line 632
    .local v3, "offset":I
    :goto_1a
    :try_start_1a
    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->paramSize(Ljava/lang/String;)I

    move-result v4

    add-int/2addr v4, v3

    invoke-direct {p0, v4, p1, v0}, Ljavassist/CtBehavior;->addParameter2(ILjavassist/CtClass;Ljava/lang/String;)V
    :try_end_22
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_1a .. :try_end_22} :catch_2a

    .line 638
    iget-object v4, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v4, v1}, Ljavassist/bytecode/MethodInfo;->setDescriptor(Ljava/lang/String;)V

    .line 639
    return-void

    .line 630
    .end local v3    # "offset":I
    :cond_28
    const/4 v3, 0x1

    goto :goto_1a

    .line 634
    .restart local v3    # "offset":I
    :catch_2a
    move-exception v2

    .line 635
    .local v2, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method copy(Ljavassist/CtBehavior;ZLjavassist/ClassMap;)V
    .registers 18
    .param p1, "src"    # Ljavassist/CtBehavior;
    .param p2, "isCons"    # Z
    .param p3, "map"    # Ljavassist/ClassMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v2, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    .line 50
    .local v2, "declaring":Ljavassist/CtClass;
    iget-object v9, p1, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    .line 51
    .local v9, "srcInfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {p1}, Ljavassist/CtBehavior;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v8

    .line 52
    .local v8, "srcClass":Ljavassist/CtClass;
    invoke-virtual {v2}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v12

    invoke-virtual {v12}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    .line 54
    .local v1, "cp":Ljavassist/bytecode/ConstPool;
    new-instance v6, Ljavassist/ClassMap;

    move-object/from16 v0, p3

    invoke-direct {v6, v0}, Ljavassist/ClassMap;-><init>(Ljavassist/ClassMap;)V

    .line 55
    .end local p3    # "map":Ljavassist/ClassMap;
    .local v6, "map":Ljavassist/ClassMap;
    invoke-virtual {v8}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v12, v13}, Ljavassist/ClassMap;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const/4 v7, 0x0

    .line 58
    .local v7, "patch":Z
    :try_start_23
    invoke-virtual {v8}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v10

    .line 59
    .local v10, "srcSuper":Ljavassist/CtClass;
    invoke-virtual {v2}, Ljavassist/CtClass;->getSuperclass()Ljavassist/CtClass;

    move-result-object v3

    .line 60
    .local v3, "destSuper":Ljavassist/CtClass;
    const/4 v4, 0x0

    .line 61
    .local v4, "destSuperName":Ljava/lang/String;
    if-eqz v10, :cond_47

    if-eqz v3, :cond_47

    .line 62
    invoke-virtual {v10}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v11

    .line 63
    .local v11, "srcSuperName":Ljava/lang/String;
    invoke-virtual {v3}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    .line 64
    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_47

    .line 65
    const-string v12, "java.lang.Object"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5c

    .line 66
    const/4 v7, 0x1

    .line 72
    .end local v11    # "srcSuperName":Ljava/lang/String;
    :cond_47
    :goto_47
    new-instance v12, Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v9}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v1, v13, v9, v6}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljavassist/bytecode/MethodInfo;Ljava/util/Map;)V

    iput-object v12, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    .line 73
    if-eqz p2, :cond_5b

    if-eqz v7, :cond_5b

    .line 74
    iget-object v12, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v12, v4}, Ljavassist/bytecode/MethodInfo;->setSuperclass(Ljava/lang/String;)V

    .line 82
    :cond_5b
    return-void

    .line 68
    .restart local v11    # "srcSuperName":Ljava/lang/String;
    :cond_5c
    invoke-virtual {v6, v11, v4}, Ljavassist/ClassMap;->putIfNone(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5f
    .catch Ljavassist/NotFoundException; {:try_start_23 .. :try_end_5f} :catch_60
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_23 .. :try_end_5f} :catch_67

    goto :goto_47

    .line 76
    .end local v3    # "destSuper":Ljavassist/CtClass;
    .end local v4    # "destSuperName":Ljava/lang/String;
    .end local v10    # "srcSuper":Ljavassist/CtClass;
    .end local v11    # "srcSuperName":Ljava/lang/String;
    :catch_60
    move-exception v5

    .line 77
    .local v5, "e":Ljavassist/NotFoundException;
    new-instance v12, Ljavassist/CannotCompileException;

    invoke-direct {v12, v5}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v12

    .line 79
    .end local v5    # "e":Ljavassist/NotFoundException;
    :catch_67
    move-exception v5

    .line 80
    .local v5, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v12, Ljavassist/CannotCompileException;

    invoke-direct {v12, v5}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v12
.end method

.method protected extendToString(Ljava/lang/StringBuffer;)V
    .registers 4
    .param p1, "buffer"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v1, 0x20

    .line 85
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 86
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 88
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    return-void
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "clz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 192
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v2

    .line 193
    .local v2, "mi":Ljavassist/bytecode/MethodInfo;
    const-string v3, "RuntimeInvisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AnnotationsAttribute;

    .line 195
    .local v0, "ainfo":Ljavassist/bytecode/AnnotationsAttribute;
    const-string v3, "RuntimeVisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/AnnotationsAttribute;

    .line 197
    .local v1, "ainfo2":Ljavassist/bytecode/AnnotationsAttribute;
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-static {p1, v3, v0, v1}, Ljavassist/CtClassType;->getAnnotationType(Ljava/lang/Class;Ljavassist/ClassPool;Ljavassist/bytecode/AnnotationsAttribute;Ljavassist/bytecode/AnnotationsAttribute;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public getAnnotations()[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 210
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljavassist/CtBehavior;->getAnnotations(Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)[B
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 493
    iget-object v1, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    .line 494
    .local v0, "ai":Ljavassist/bytecode/AttributeInfo;
    if-nez v0, :cond_a

    .line 495
    const/4 v1, 0x0

    .line 497
    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Ljavassist/bytecode/AttributeInfo;->get()[B

    move-result-object v1

    goto :goto_9
.end method

.method public getAvailableAnnotations()[Ljava/lang/Object;
    .registers 4

    .prologue
    .line 224
    const/4 v1, 0x1

    :try_start_1
    invoke-direct {p0, v1}, Ljavassist/CtBehavior;->getAnnotations(Z)[Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_4} :catch_6

    move-result-object v1

    return-object v1

    .line 226
    :catch_6
    move-exception v0

    .line 227
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Unexpected exception"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getAvailableParameterAnnotations()[[Ljava/lang/Object;
    .registers 4

    .prologue
    .line 274
    const/4 v1, 0x1

    :try_start_1
    invoke-virtual {p0, v1}, Ljavassist/CtBehavior;->getParameterAnnotations(Z)[[Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_4} :catch_6

    move-result-object v1

    return-object v1

    .line 276
    :catch_6
    move-exception v0

    .line 277
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Unexpected exception"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getExceptionTypes()[Ljavassist/CtClass;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 366
    iget-object v2, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v2}, Ljavassist/bytecode/MethodInfo;->getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;

    move-result-object v0

    .line 367
    .local v0, "ea":Ljavassist/bytecode/ExceptionsAttribute;
    if-nez v0, :cond_14

    .line 368
    const/4 v1, 0x0

    .line 372
    .local v1, "exceptions":[Ljava/lang/String;
    :goto_9
    iget-object v2, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v2}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljavassist/ClassPool;->get([Ljava/lang/String;)[Ljavassist/CtClass;

    move-result-object v2

    return-object v2

    .line 370
    .end local v1    # "exceptions":[Ljava/lang/String;
    :cond_14
    invoke-virtual {v0}, Ljavassist/bytecode/ExceptionsAttribute;->getExceptions()[Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "exceptions":[Ljava/lang/String;
    goto :goto_9
.end method

.method public getGenericSignature()Ljava/lang/String;
    .registers 4

    .prologue
    .line 339
    iget-object v1, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    const-string v2, "Signature"

    invoke-virtual {v1, v2}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/SignatureAttribute;

    .line 341
    .local v0, "sa":Ljavassist/bytecode/SignatureAttribute;
    if-nez v0, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Ljavassist/bytecode/SignatureAttribute;->getSignature()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public abstract getLongName()Ljava/lang/String;
.end method

.method public getMethodInfo()Ljavassist/bytecode/MethodInfo;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 112
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    return-object v0
.end method

.method public getMethodInfo2()Ljavassist/bytecode/MethodInfo;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    return-object v0
.end method

.method public getModifiers()I
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v0

    invoke-static {v0}, Ljavassist/bytecode/AccessFlag;->toModifier(I)I

    move-result v0

    return v0
.end method

.method public getParameterAnnotations()[[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 256
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/CtBehavior;->getParameterAnnotations(Z)[[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getParameterAnnotations(Z)[[Ljava/lang/Object;
    .registers 6
    .param p1, "ignoreNotFound"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v2

    .line 285
    .local v2, "mi":Ljavassist/bytecode/MethodInfo;
    const-string v3, "RuntimeInvisibleParameterAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ParameterAnnotationsAttribute;

    .line 287
    .local v0, "ainfo":Ljavassist/bytecode/ParameterAnnotationsAttribute;
    const-string v3, "RuntimeVisibleParameterAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/ParameterAnnotationsAttribute;

    .line 289
    .local v1, "ainfo2":Ljavassist/bytecode/ParameterAnnotationsAttribute;
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-static {p1, v3, v0, v1, v2}, Ljavassist/CtClassType;->toAnnotationType(ZLjavassist/ClassPool;Ljavassist/bytecode/ParameterAnnotationsAttribute;Ljavassist/bytecode/ParameterAnnotationsAttribute;Ljavassist/bytecode/MethodInfo;)[[Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public getParameterTypes()[Ljavassist/CtClass;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 298
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v1

    invoke-static {v0, v1}, Ljavassist/bytecode/Descriptor;->getParameterTypes(Ljava/lang/String;Ljavassist/ClassPool;)[Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method getReturnType0()Ljavassist/CtClass;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 306
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v1

    invoke-static {v0, v1}, Ljavassist/bytecode/Descriptor;->getReturnType(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .registers 2

    .prologue
    .line 328
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getStartPosOfBody(Ljavassist/bytecode/CodeAttribute;)I
    .registers 3
    .param p1, "ca"    # Ljavassist/bytecode/CodeAttribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1111
    const/4 v0, 0x0

    return v0
.end method

.method public hasAnnotation(Ljava/lang/Class;)Z
    .registers 6
    .param p1, "clz"    # Ljava/lang/Class;

    .prologue
    .line 170
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v2

    .line 171
    .local v2, "mi":Ljavassist/bytecode/MethodInfo;
    const-string v3, "RuntimeInvisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AnnotationsAttribute;

    .line 173
    .local v0, "ainfo":Ljavassist/bytecode/AnnotationsAttribute;
    const-string v3, "RuntimeVisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/AnnotationsAttribute;

    .line 175
    .local v1, "ainfo2":Ljavassist/bytecode/AnnotationsAttribute;
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-static {p1, v3, v0, v1}, Ljavassist/CtClassType;->hasAnnotationType(Ljava/lang/Class;Ljavassist/ClassPool;Ljavassist/bytecode/AnnotationsAttribute;Ljavassist/bytecode/AnnotationsAttribute;)Z

    move-result v3

    return v3
.end method

.method public insertAfter(Ljava/lang/String;)V
    .registers 3
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 792
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ljavassist/CtBehavior;->insertAfter(Ljava/lang/String;Z)V

    .line 793
    return-void
.end method

.method public insertAfter(Ljava/lang/String;Z)V
    .registers 33
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "asFinally"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 810
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    move-object/from16 v21, v0

    .line 811
    .local v21, "cc":Ljavassist/CtClass;
    invoke-virtual/range {v21 .. v21}, Ljavassist/CtClass;->checkModify()V

    .line 812
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v14

    .line 813
    .local v14, "pool":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v20

    .line 814
    .local v20, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v20, :cond_23

    .line 815
    new-instance v4, Ljavassist/CannotCompileException;

    const-string v5, "no method body"

    invoke-direct {v4, v5}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 817
    :cond_23
    invoke-virtual/range {v20 .. v20}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v25

    .line 818
    .local v25, "iterator":Ljavassist/bytecode/CodeIterator;
    invoke-virtual/range {v20 .. v20}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v29

    .line 819
    .local v29, "retAddr":I
    new-instance v6, Ljavassist/bytecode/Bytecode;

    const/4 v4, 0x0

    add-int/lit8 v5, v29, 0x1

    invoke-direct {v6, v14, v4, v5}, Ljavassist/bytecode/Bytecode;-><init>(Ljavassist/bytecode/ConstPool;II)V

    .line 820
    .local v6, "b":Ljavassist/bytecode/Bytecode;
    invoke-virtual/range {v20 .. v20}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v6, v4}, Ljavassist/bytecode/Bytecode;->setStackDepth(I)V

    .line 821
    new-instance v9, Ljavassist/compiler/Javac;

    move-object/from16 v0, v21

    invoke-direct {v9, v6, v0}, Ljavassist/compiler/Javac;-><init>(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;)V

    .line 823
    .local v9, "jv":Ljavassist/compiler/Javac;
    :try_start_43
    invoke-virtual/range {p0 .. p0}, Ljavassist/CtBehavior;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Ljavassist/CtBehavior;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v5

    invoke-virtual {v9, v4, v5}, Ljavassist/compiler/Javac;->recordParams([Ljavassist/CtClass;Z)I

    move-result v27

    .line 825
    .local v27, "nvars":I
    move-object/from16 v0, v20

    move/from16 v1, v27

    invoke-virtual {v9, v0, v1}, Ljavassist/compiler/Javac;->recordParamNames(Ljavassist/bytecode/CodeAttribute;I)Z

    .line 826
    invoke-virtual/range {p0 .. p0}, Ljavassist/CtBehavior;->getReturnType0()Ljavassist/CtClass;

    move-result-object v7

    .line 827
    .local v7, "rtype":Ljavassist/CtClass;
    const/4 v4, 0x1

    invoke-virtual {v9, v7, v4}, Ljavassist/compiler/Javac;->recordReturnType(Ljavassist/CtClass;Z)I

    move-result v8

    .line 828
    .local v8, "varNo":I
    const/4 v4, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v9, v0, v4}, Ljavassist/compiler/Javac;->recordLocalVariables(Ljavassist/bytecode/CodeAttribute;I)Z

    move-object/from16 v4, p0

    move/from16 v5, p2

    move-object/from16 v10, p1

    .line 831
    invoke-direct/range {v4 .. v10}, Ljavassist/CtBehavior;->insertAfterHandler(ZLjavassist/bytecode/Bytecode;Ljavassist/CtClass;ILjavassist/compiler/Javac;Ljava/lang/String;)I

    move-result v23

    .line 833
    .local v23, "handlerLen":I
    invoke-virtual/range {v25 .. v25}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I

    move-result v24

    .line 834
    .local v24, "handlerPos":I
    if-eqz p2, :cond_8d

    .line 835
    invoke-virtual/range {v20 .. v20}, Ljavassist/bytecode/CodeAttribute;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljavassist/CtBehavior;->getStartPosOfBody(Ljavassist/bytecode/CodeAttribute;)I

    move-result v5

    const/4 v10, 0x0

    move/from16 v0, v24

    move/from16 v1, v24

    invoke-virtual {v4, v5, v0, v1, v10}, Ljavassist/bytecode/ExceptionTable;->add(IIII)V

    .line 837
    :cond_8d
    const/16 v17, 0x0

    .line 838
    .local v17, "adviceLen":I
    const/16 v18, 0x0

    .line 839
    .local v18, "advicePos":I
    const/16 v26, 0x1

    .line 840
    .local v26, "noReturn":Z
    :cond_93
    :goto_93
    invoke-virtual/range {v25 .. v25}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a3

    .line 841
    invoke-virtual/range {v25 .. v25}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v28

    .line 842
    .local v28, "pos":I
    move/from16 v0, v28

    move/from16 v1, v24

    if-lt v0, v1, :cond_dc

    .line 864
    .end local v28    # "pos":I
    :cond_a3
    if-eqz v26, :cond_ba

    .line 865
    invoke-virtual {v6}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljavassist/bytecode/CodeIterator;->append([B)I

    move-result v24

    .line 866
    invoke-virtual {v6}, Ljavassist/bytecode/Bytecode;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v4

    move-object/from16 v0, v25

    move/from16 v1, v24

    invoke-virtual {v0, v4, v1}, Ljavassist/bytecode/CodeIterator;->append(Ljavassist/bytecode/ExceptionTable;I)V

    .line 869
    :cond_ba
    invoke-virtual {v6}, Ljavassist/bytecode/Bytecode;->getMaxStack()I

    move-result v4

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljavassist/bytecode/CodeAttribute;->setMaxStack(I)V

    .line 870
    invoke-virtual {v6}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v4

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 871
    move-object/from16 v0, p0

    iget-object v4, v0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual/range {v21 .. v21}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v5

    invoke-virtual/range {v21 .. v21}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v10

    invoke-virtual {v4, v5, v10}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V

    .line 882
    return-void

    .line 845
    .restart local v28    # "pos":I
    :cond_dc
    move-object/from16 v0, v25

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v19

    .line 846
    .local v19, "c":I
    const/16 v4, 0xb0

    move/from16 v0, v19

    if-eq v0, v4, :cond_108

    const/16 v4, 0xac

    move/from16 v0, v19

    if-eq v0, v4, :cond_108

    const/16 v4, 0xae

    move/from16 v0, v19

    if-eq v0, v4, :cond_108

    const/16 v4, 0xad

    move/from16 v0, v19

    if-eq v0, v4, :cond_108

    const/16 v4, 0xaf

    move/from16 v0, v19

    if-eq v0, v4, :cond_108

    const/16 v4, 0xb1

    move/from16 v0, v19

    if-ne v0, v4, :cond_93

    .line 849
    :cond_108
    if-eqz v26, :cond_136

    move-object/from16 v10, p0

    move-object v11, v6

    move-object v12, v9

    move-object/from16 v13, p1

    move-object v15, v7

    move/from16 v16, v8

    .line 851
    invoke-direct/range {v10 .. v16}, Ljavassist/CtBehavior;->insertAfterAdvice(Ljavassist/bytecode/Bytecode;Ljavassist/compiler/Javac;Ljava/lang/String;Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;I)I

    move-result v17

    .line 852
    invoke-virtual {v6}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Ljavassist/bytecode/CodeIterator;->append([B)I

    move-result v24

    .line 853
    invoke-virtual {v6}, Ljavassist/bytecode/Bytecode;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v4

    move-object/from16 v0, v25

    move/from16 v1, v24

    invoke-virtual {v0, v4, v1}, Ljavassist/bytecode/CodeIterator;->append(Ljavassist/bytecode/ExceptionTable;I)V

    .line 854
    invoke-virtual/range {v25 .. v25}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I

    move-result v4

    sub-int v18, v4, v17

    .line 855
    sub-int v23, v18, v24

    .line 856
    const/16 v26, 0x0

    .line 858
    :cond_136
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v18

    move/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Ljavassist/CtBehavior;->insertGoto(Ljavassist/bytecode/CodeIterator;II)V

    .line 859
    invoke-virtual/range {v25 .. v25}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I
    :try_end_144
    .catch Ljavassist/NotFoundException; {:try_start_43 .. :try_end_144} :catch_14b
    .catch Ljavassist/compiler/CompileError; {:try_start_43 .. :try_end_144} :catch_154
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_43 .. :try_end_144} :catch_15d

    move-result v4

    sub-int v18, v4, v17

    .line 860
    sub-int v24, v18, v23

    goto/16 :goto_93

    .line 873
    .end local v7    # "rtype":Ljavassist/CtClass;
    .end local v8    # "varNo":I
    .end local v17    # "adviceLen":I
    .end local v18    # "advicePos":I
    .end local v19    # "c":I
    .end local v23    # "handlerLen":I
    .end local v24    # "handlerPos":I
    .end local v26    # "noReturn":Z
    .end local v27    # "nvars":I
    .end local v28    # "pos":I
    :catch_14b
    move-exception v22

    .line 874
    .local v22, "e":Ljavassist/NotFoundException;
    new-instance v4, Ljavassist/CannotCompileException;

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v4

    .line 876
    .end local v22    # "e":Ljavassist/NotFoundException;
    :catch_154
    move-exception v22

    .line 877
    .local v22, "e":Ljavassist/compiler/CompileError;
    new-instance v4, Ljavassist/CannotCompileException;

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v4

    .line 879
    .end local v22    # "e":Ljavassist/compiler/CompileError;
    :catch_15d
    move-exception v22

    .line 880
    .local v22, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v4, Ljavassist/CannotCompileException;

    move-object/from16 v0, v22

    invoke-direct {v4, v0}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public insertAt(ILjava/lang/String;)I
    .registers 4
    .param p1, "lineNum"    # I
    .param p2, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1134
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p2}, Ljavassist/CtBehavior;->insertAt(IZLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public insertAt(IZLjava/lang/String;)I
    .registers 19
    .param p1, "lineNum"    # I
    .param p2, "modify"    # Z
    .param p3, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1162
    iget-object v12, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v12}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v3

    .line 1163
    .local v3, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v3, :cond_10

    .line 1164
    new-instance v12, Ljavassist/CannotCompileException;

    const-string v13, "no method body"

    invoke-direct {v12, v13}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 1166
    :cond_10
    const-string v12, "LineNumberTable"

    invoke-virtual {v3, v12}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/LineNumberAttribute;

    .line 1168
    .local v1, "ainfo":Ljavassist/bytecode/LineNumberAttribute;
    if-nez v1, :cond_22

    .line 1169
    new-instance v12, Ljavassist/CannotCompileException;

    const-string v13, "no line number info"

    invoke-direct {v12, v13}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 1171
    :cond_22
    move/from16 v0, p1

    invoke-virtual {v1, v0}, Ljavassist/bytecode/LineNumberAttribute;->toNearPc(I)Ljavassist/bytecode/LineNumberAttribute$Pc;

    move-result-object v10

    .line 1172
    .local v10, "pc":Ljavassist/bytecode/LineNumberAttribute$Pc;
    iget v0, v10, Ljavassist/bytecode/LineNumberAttribute$Pc;->line:I

    move/from16 p1, v0

    .line 1173
    iget v6, v10, Ljavassist/bytecode/LineNumberAttribute$Pc;->index:I

    .line 1174
    .local v6, "index":I
    if-nez p2, :cond_31

    .line 1201
    :goto_30
    return p1

    .line 1177
    :cond_31
    iget-object v4, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    .line 1178
    .local v4, "cc":Ljavassist/CtClass;
    invoke-virtual {v4}, Ljavassist/CtClass;->checkModify()V

    .line 1179
    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v7

    .line 1180
    .local v7, "iterator":Ljavassist/bytecode/CodeIterator;
    new-instance v8, Ljavassist/compiler/Javac;

    invoke-direct {v8, v4}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 1182
    .local v8, "jv":Ljavassist/compiler/Javac;
    :try_start_3f
    invoke-virtual {v8, v3, v6}, Ljavassist/compiler/Javac;->recordLocalVariables(Ljavassist/bytecode/CodeAttribute;I)Z

    .line 1183
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getParameterTypes()[Ljavassist/CtClass;

    move-result-object v12

    invoke-virtual {p0}, Ljavassist/CtBehavior;->getModifiers()I

    move-result v13

    invoke-static {v13}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v13

    invoke-virtual {v8, v12, v13}, Ljavassist/compiler/Javac;->recordParams([Ljavassist/CtClass;Z)I

    .line 1185
    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v12

    invoke-virtual {v8, v12}, Ljavassist/compiler/Javac;->setMaxLocals(I)V

    .line 1186
    move-object/from16 v0, p3

    invoke-virtual {v8, v0}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 1187
    invoke-virtual {v8}, Ljavassist/compiler/Javac;->getBytecode()Ljavassist/bytecode/Bytecode;

    move-result-object v2

    .line 1188
    .local v2, "b":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v9

    .line 1189
    .local v9, "locals":I
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->getMaxStack()I

    move-result v11

    .line 1190
    .local v11, "stack":I
    invoke-virtual {v3, v9}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 1195
    invoke-virtual {v3}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v12

    if-le v11, v12, :cond_75

    .line 1196
    invoke-virtual {v3, v11}, Ljavassist/bytecode/CodeAttribute;->setMaxStack(I)V

    .line 1198
    :cond_75
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v12

    invoke-virtual {v7, v6, v12}, Ljavassist/bytecode/CodeIterator;->insertAt(I[B)I

    move-result v6

    .line 1199
    invoke-virtual {v2}, Ljavassist/bytecode/Bytecode;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v12

    invoke-virtual {v7, v12, v6}, Ljavassist/bytecode/CodeIterator;->insert(Ljavassist/bytecode/ExceptionTable;I)V

    .line 1200
    iget-object v12, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v13

    invoke-virtual {v4}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V
    :try_end_91
    .catch Ljavassist/NotFoundException; {:try_start_3f .. :try_end_91} :catch_92
    .catch Ljavassist/compiler/CompileError; {:try_start_3f .. :try_end_91} :catch_99
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_3f .. :try_end_91} :catch_a0

    goto :goto_30

    .line 1203
    .end local v2    # "b":Ljavassist/bytecode/Bytecode;
    .end local v9    # "locals":I
    .end local v11    # "stack":I
    :catch_92
    move-exception v5

    .line 1204
    .local v5, "e":Ljavassist/NotFoundException;
    new-instance v12, Ljavassist/CannotCompileException;

    invoke-direct {v12, v5}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v12

    .line 1206
    .end local v5    # "e":Ljavassist/NotFoundException;
    :catch_99
    move-exception v5

    .line 1207
    .local v5, "e":Ljavassist/compiler/CompileError;
    new-instance v12, Ljavassist/CannotCompileException;

    invoke-direct {v12, v5}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v12

    .line 1209
    .end local v5    # "e":Ljavassist/compiler/CompileError;
    :catch_a0
    move-exception v5

    .line 1210
    .local v5, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v12, Ljavassist/CannotCompileException;

    invoke-direct {v12, v5}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v12
.end method

.method public insertBefore(Ljava/lang/String;)V
    .registers 3
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 734
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Ljavassist/CtBehavior;->insertBefore(Ljava/lang/String;Z)V

    .line 735
    return-void
.end method

.method public insertParameter(Ljavassist/CtClass;)V
    .registers 6
    .param p1, "type"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 608
    iget-object v3, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->checkModify()V

    .line 609
    iget-object v3, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 610
    .local v0, "desc":Ljava/lang/String;
    invoke-static {p1, v0}, Ljavassist/bytecode/Descriptor;->insertParameter(Ljavassist/CtClass;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 612
    .local v1, "desc2":Ljava/lang/String;
    :try_start_f
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljavassist/Modifier;->isStatic(I)Z

    move-result v3

    if-eqz v3, :cond_23

    const/4 v3, 0x0

    :goto_1a
    invoke-direct {p0, v3, p1, v0}, Ljavassist/CtBehavior;->addParameter2(ILjavassist/CtClass;Ljava/lang/String;)V
    :try_end_1d
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_f .. :try_end_1d} :catch_25

    .line 618
    iget-object v3, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v3, v1}, Ljavassist/bytecode/MethodInfo;->setDescriptor(Ljava/lang/String;)V

    .line 619
    return-void

    .line 612
    :cond_23
    const/4 v3, 0x1

    goto :goto_1a

    .line 614
    :catch_25
    move-exception v2

    .line 615
    .local v2, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v3, Ljavassist/CannotCompileException;

    invoke-direct {v3, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public instrument(Ljavassist/CodeConverter;)V
    .registers 5
    .param p1, "converter"    # Ljavassist/CodeConverter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 686
    iget-object v1, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->checkModify()V

    .line 687
    iget-object v1, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 688
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {p0}, Ljavassist/CtBehavior;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v1

    iget-object v2, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {p1, v1, v2, v0}, Ljavassist/CodeConverter;->doit(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/ConstPool;)V

    .line 689
    return-void
.end method

.method public instrument(Ljavassist/expr/ExprEditor;)V
    .registers 4
    .param p1, "editor"    # Ljavassist/expr/ExprEditor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 709
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->isFrozen()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 710
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 712
    :cond_d
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    iget-object v1, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {p1, v0, v1}, Ljavassist/expr/ExprEditor;->doit(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 713
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 714
    :cond_1c
    return-void
.end method

.method public abstract isEmpty()Z
.end method

.method public setAttribute(Ljava/lang/String;[B)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 511
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 512
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    new-instance v1, Ljavassist/bytecode/AttributeInfo;

    iget-object v2, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v2}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    invoke-direct {v1, v2, p1, p2}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    invoke-virtual {v0, v1}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 514
    return-void
.end method

.method public setBody(Ljava/lang/String;)V
    .registers 3
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 412
    invoke-virtual {p0, p1, v0, v0}, Ljavassist/CtBehavior;->setBody(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    return-void
.end method

.method public setBody(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "delegateObj"    # Ljava/lang/String;
    .param p3, "delegateMethod"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 431
    iget-object v1, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    .line 432
    .local v1, "cc":Ljavassist/CtClass;
    invoke-virtual {v1}, Ljavassist/CtClass;->checkModify()V

    .line 434
    :try_start_5
    new-instance v3, Ljavassist/compiler/Javac;

    invoke-direct {v3, v1}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 435
    .local v3, "jv":Ljavassist/compiler/Javac;
    if-eqz p3, :cond_f

    .line 436
    invoke-virtual {v3, p2, p3}, Ljavassist/compiler/Javac;->recordProceed(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    :cond_f
    invoke-virtual {v3, p0, p1}, Ljavassist/compiler/Javac;->compileBody(Ljavassist/CtBehavior;Ljava/lang/String;)Ljavassist/bytecode/Bytecode;

    move-result-object v0

    .line 439
    .local v0, "b":Ljavassist/bytecode/Bytecode;
    iget-object v4, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->toCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavassist/bytecode/MethodInfo;->setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V

    .line 440
    iget-object v4, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    iget-object v5, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v5

    and-int/lit16 v5, v5, -0x401

    invoke-virtual {v4, v5}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 442
    iget-object v4, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v5

    invoke-virtual {v1}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V

    .line 443
    iget-object v4, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v4}, Ljavassist/CtClass;->rebuildClassFile()V
    :try_end_3b
    .catch Ljavassist/compiler/CompileError; {:try_start_5 .. :try_end_3b} :catch_3c
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_5 .. :try_end_3b} :catch_43

    .line 450
    return-void

    .line 445
    .end local v0    # "b":Ljavassist/bytecode/Bytecode;
    .end local v3    # "jv":Ljavassist/compiler/Javac;
    :catch_3c
    move-exception v2

    .line 446
    .local v2, "e":Ljavassist/compiler/CompileError;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v2}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v4

    .line 447
    .end local v2    # "e":Ljavassist/compiler/CompileError;
    :catch_43
    move-exception v2

    .line 448
    .local v2, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public setExceptionTypes([Ljavassist/CtClass;)V
    .registers 6
    .param p1, "types"    # [Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 379
    iget-object v3, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->checkModify()V

    .line 380
    if-eqz p1, :cond_a

    array-length v3, p1

    if-nez v3, :cond_10

    .line 381
    :cond_a
    iget-object v3, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->removeExceptionsAttribute()V

    .line 396
    :goto_f
    return-void

    .line 385
    :cond_10
    array-length v3, p1

    new-array v2, v3, [Ljava/lang/String;

    .line 386
    .local v2, "names":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    array-length v3, p1

    if-ge v1, v3, :cond_22

    .line 387
    aget-object v3, p1, v1

    invoke-virtual {v3}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    .line 386
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 389
    :cond_22
    iget-object v3, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;

    move-result-object v0

    .line 390
    .local v0, "ea":Ljavassist/bytecode/ExceptionsAttribute;
    if-nez v0, :cond_3a

    .line 391
    new-instance v0, Ljavassist/bytecode/ExceptionsAttribute;

    .end local v0    # "ea":Ljavassist/bytecode/ExceptionsAttribute;
    iget-object v3, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v3}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v3

    invoke-direct {v0, v3}, Ljavassist/bytecode/ExceptionsAttribute;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 392
    .restart local v0    # "ea":Ljavassist/bytecode/ExceptionsAttribute;
    iget-object v3, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v3, v0}, Ljavassist/bytecode/MethodInfo;->setExceptionsAttribute(Ljavassist/bytecode/ExceptionsAttribute;)V

    .line 395
    :cond_3a
    invoke-virtual {v0, v2}, Ljavassist/bytecode/ExceptionsAttribute;->setExceptions([Ljava/lang/String;)V

    goto :goto_f
.end method

.method public setGenericSignature(Ljava/lang/String;)V
    .registers 5
    .param p1, "sig"    # Ljava/lang/String;

    .prologue
    .line 355
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 356
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    new-instance v1, Ljavassist/bytecode/SignatureAttribute;

    iget-object v2, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-virtual {v2}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljavassist/bytecode/SignatureAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavassist/bytecode/MethodInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 357
    return-void
.end method

.method public setModifiers(I)V
    .registers 4
    .param p1, "mod"    # I

    .prologue
    .line 157
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 158
    iget-object v0, p0, Ljavassist/CtBehavior;->methodInfo:Ljavassist/bytecode/MethodInfo;

    invoke-static {p1}, Ljavassist/bytecode/AccessFlag;->of(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/MethodInfo;->setAccessFlags(I)V

    .line 159
    return-void
.end method

.method public useCflow(Ljava/lang/String;)V
    .registers 13
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 534
    iget-object v0, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    .line 535
    .local v0, "cc":Ljavassist/CtClass;
    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 536
    invoke-virtual {v0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v6

    .line 538
    .local v6, "pool":Ljavassist/ClassPool;
    const/4 v4, 0x0

    .line 540
    .local v4, "i":I
    :goto_a
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "_cflow$"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "i":I
    .local v5, "i":I
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 542
    .local v3, "fname":Ljava/lang/String;
    :try_start_1f
    invoke-virtual {v0, v3}, Ljavassist/CtClass;->getDeclaredField(Ljava/lang/String;)Ljavassist/CtField;
    :try_end_22
    .catch Ljavassist/NotFoundException; {:try_start_1f .. :try_end_22} :catch_24

    move v4, v5

    .line 546
    .end local v5    # "i":I
    .restart local v4    # "i":I
    goto :goto_a

    .line 544
    .end local v4    # "i":I
    .restart local v5    # "i":I
    :catch_24
    move-exception v1

    .line 549
    .local v1, "e":Ljavassist/NotFoundException;
    iget-object v9, p0, Ljavassist/CtBehavior;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v9}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, p1, v9, v3}, Ljavassist/ClassPool;->recordCflow(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 551
    :try_start_2e
    const-string v9, "javassist.runtime.Cflow"

    invoke-virtual {v6, v9}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v8

    .line 552
    .local v8, "type":Ljavassist/CtClass;
    new-instance v2, Ljavassist/CtField;

    invoke-direct {v2, v8, v3, v0}, Ljavassist/CtField;-><init>(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 553
    .local v2, "field":Ljavassist/CtField;
    const/16 v9, 0x9

    invoke-virtual {v2, v9}, Ljavassist/CtField;->setModifiers(I)V

    .line 554
    invoke-static {v8}, Ljavassist/CtField$Initializer;->byNew(Ljavassist/CtClass;)Ljavassist/CtField$Initializer;

    move-result-object v9

    invoke-virtual {v0, v2, v9}, Ljavassist/CtClass;->addField(Ljavassist/CtField;Ljavassist/CtField$Initializer;)V

    .line 555
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ".enter();"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {p0, v9, v10}, Ljavassist/CtBehavior;->insertBefore(Ljava/lang/String;Z)V

    .line 556
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ".exit();"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 557
    .local v7, "src":Ljava/lang/String;
    const/4 v9, 0x1

    invoke-virtual {p0, v7, v9}, Ljavassist/CtBehavior;->insertAfter(Ljava/lang/String;Z)V
    :try_end_73
    .catch Ljavassist/NotFoundException; {:try_start_2e .. :try_end_73} :catch_74

    .line 562
    return-void

    .line 559
    .end local v2    # "field":Ljavassist/CtField;
    .end local v7    # "src":Ljava/lang/String;
    .end local v8    # "type":Ljavassist/CtClass;
    :catch_74
    move-exception v1

    .line 560
    new-instance v9, Ljavassist/CannotCompileException;

    invoke-direct {v9, v1}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v9
.end method
