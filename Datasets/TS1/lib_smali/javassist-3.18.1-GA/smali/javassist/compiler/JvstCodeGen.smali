.class public Ljavassist/compiler/JvstCodeGen;
.super Ljavassist/compiler/MemberCodeGen;
.source "JvstCodeGen.java"


# static fields
.field public static final cflowName:Ljava/lang/String; = "$cflow"

.field public static final clazzName:Ljava/lang/String; = "$class"

.field public static final dollarTypeName:Ljava/lang/String; = "$type"

.field public static final sigName:Ljava/lang/String; = "$sig"

.field public static final wrapperCastName:Ljava/lang/String; = "$w"


# instance fields
.field private dollarType:Ljavassist/CtClass;

.field private param0Type:Ljava/lang/String;

.field paramArrayName:Ljava/lang/String;

.field paramListName:Ljava/lang/String;

.field paramTypeList:[Ljavassist/CtClass;

.field private paramVarBase:I

.field procHandler:Ljavassist/compiler/ProceedHandler;

.field proceedName:Ljava/lang/String;

.field returnCastName:Ljava/lang/String;

.field returnType:Ljavassist/CtClass;

.field private returnVarName:Ljava/lang/String;

.field private useParam0:Z


# direct methods
.method public constructor <init>(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;Ljavassist/ClassPool;)V
    .registers 6
    .param p1, "b"    # Ljavassist/bytecode/Bytecode;
    .param p2, "cc"    # Ljavassist/CtClass;
    .param p3, "cp"    # Ljavassist/ClassPool;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, p2, p3}, Ljavassist/compiler/MemberCodeGen;-><init>(Ljavassist/bytecode/Bytecode;Ljavassist/CtClass;Ljavassist/ClassPool;)V

    .line 27
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->paramArrayName:Ljava/lang/String;

    .line 28
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->paramListName:Ljava/lang/String;

    .line 29
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    .line 30
    iput v1, p0, Ljavassist/compiler/JvstCodeGen;->paramVarBase:I

    .line 31
    iput-boolean v1, p0, Ljavassist/compiler/JvstCodeGen;->useParam0:Z

    .line 32
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->param0Type:Ljava/lang/String;

    .line 36
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->dollarType:Ljavassist/CtClass;

    .line 37
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->returnType:Ljavassist/CtClass;

    .line 38
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->returnCastName:Ljava/lang/String;

    .line 39
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->returnVarName:Ljava/lang/String;

    .line 41
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->proceedName:Ljava/lang/String;

    .line 43
    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->procHandler:Ljavassist/compiler/ProceedHandler;

    .line 47
    new-instance v0, Ljavassist/compiler/JvstTypeChecker;

    invoke-direct {v0, p2, p3, p0}, Ljavassist/compiler/JvstTypeChecker;-><init>(Ljavassist/CtClass;Ljavassist/ClassPool;Ljavassist/compiler/JvstCodeGen;)V

    invoke-virtual {p0, v0}, Ljavassist/compiler/JvstCodeGen;->setTypeChecker(Ljavassist/compiler/TypeChecker;)V

    .line 48
    return-void
.end method

.method private callGetType(Ljava/lang/String;)V
    .registers 5
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 116
    iget-object v0, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v1, "javassist/runtime/Desc"

    const-string v2, "(Ljava/lang/String;)Ljava/lang/Class;"

    invoke-virtual {v0, v1, p1, v2}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    const/16 v0, 0x133

    iput v0, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 119
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 120
    const-string v0, "java/lang/Class"

    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public static compileParameterList(Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;I)I
    .registers 13
    .param p0, "code"    # Ljavassist/bytecode/Bytecode;
    .param p1, "params"    # [Ljavassist/CtClass;
    .param p2, "regno"    # I

    .prologue
    const/16 v9, 0x59

    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 607
    if-nez p1, :cond_f

    .line 608
    invoke-virtual {p0, v8}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 609
    const-string v7, "java.lang.Object"

    invoke-virtual {p0, v7}, Ljavassist/bytecode/Bytecode;->addAnewarray(Ljava/lang/String;)V

    .line 640
    :goto_e
    return v6

    .line 613
    :cond_f
    new-array v0, v6, [Ljavassist/CtClass;

    .line 614
    .local v0, "args":[Ljavassist/CtClass;
    array-length v2, p1

    .line 615
    .local v2, "n":I
    invoke-virtual {p0, v2}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 616
    const-string v6, "java.lang.Object"

    invoke-virtual {p0, v6}, Ljavassist/bytecode/Bytecode;->addAnewarray(Ljava/lang/String;)V

    .line 617
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    if-ge v1, v2, :cond_59

    .line 618
    invoke-virtual {p0, v9}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 619
    invoke-virtual {p0, v1}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 620
    aget-object v6, p1, v1

    invoke-virtual {v6}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v6

    if-eqz v6, :cond_53

    .line 621
    aget-object v3, p1, v1

    check-cast v3, Ljavassist/CtPrimitiveType;

    .line 622
    .local v3, "pt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v3}, Ljavassist/CtPrimitiveType;->getWrapperName()Ljava/lang/String;

    move-result-object v5

    .line 623
    .local v5, "wrapper":Ljava/lang/String;
    invoke-virtual {p0, v5}, Ljavassist/bytecode/Bytecode;->addNew(Ljava/lang/String;)V

    .line 624
    invoke-virtual {p0, v9}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 625
    invoke-virtual {p0, p2, v3}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v4

    .line 626
    .local v4, "s":I
    add-int/2addr p2, v4

    .line 627
    aput-object v3, v0, v8

    .line 628
    const-string v6, "<init>"

    sget-object v7, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    invoke-static {v7, v0}, Ljavassist/bytecode/Descriptor;->ofMethod(Ljavassist/CtClass;[Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v5, v6, v7}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 637
    .end local v3    # "pt":Ljavassist/CtPrimitiveType;
    .end local v4    # "s":I
    .end local v5    # "wrapper":Ljava/lang/String;
    :goto_4b
    const/16 v6, 0x53

    invoke-virtual {p0, v6}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 617
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 633
    :cond_53
    invoke-virtual {p0, p2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 634
    add-int/lit8 p2, p2, 0x1

    goto :goto_4b

    .line 640
    :cond_59
    const/16 v6, 0x8

    goto :goto_e
.end method

.method private indexOfParam1()I
    .registers 3

    .prologue
    .line 53
    iget v1, p0, Ljavassist/compiler/JvstCodeGen;->paramVarBase:I

    iget-boolean v0, p0, Ljavassist/compiler/JvstCodeGen;->useParam0:Z

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    :goto_7
    add-int/2addr v0, v1

    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static makeCflowName(Ljava/lang/StringBuffer;Ljavassist/compiler/ast/ASTree;)V
    .registers 5
    .param p0, "sbuf"    # Ljava/lang/StringBuffer;
    .param p1, "name"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v2, 0x2e

    .line 277
    instance-of v1, p1, Ljavassist/compiler/ast/Symbol;

    if-eqz v1, :cond_10

    .line 278
    check-cast p1, Ljavassist/compiler/ast/Symbol;

    .end local p1    # "name":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p1}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 287
    :goto_f
    return-void

    .line 281
    .restart local p1    # "name":Ljavassist/compiler/ast/ASTree;
    :cond_10
    instance-of v1, p1, Ljavassist/compiler/ast/Expr;

    if-eqz v1, :cond_2f

    move-object v0, p1

    .line 282
    check-cast v0, Ljavassist/compiler/ast/Expr;

    .line 283
    .local v0, "expr":Ljavassist/compiler/ast/Expr;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v1

    if-ne v1, v2, :cond_2f

    .line 284
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-static {p0, v1}, Ljavassist/compiler/JvstCodeGen;->makeCflowName(Ljava/lang/StringBuffer;Ljavassist/compiler/ast/ASTree;)V

    .line 285
    invoke-virtual {p0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 286
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-static {p0, v1}, Ljavassist/compiler/JvstCodeGen;->makeCflowName(Ljava/lang/StringBuffer;Ljavassist/compiler/ast/ASTree;)V

    goto :goto_f

    .line 291
    .end local v0    # "expr":Ljavassist/compiler/ast/Expr;
    :cond_2f
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "bad $cflow"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private recordVar(Ljavassist/CtClass;Ljava/lang/String;ILjavassist/compiler/SymbolTable;)I
    .registers 11
    .param p1, "cc"    # Ljavassist/CtClass;
    .param p2, "varName"    # Ljava/lang/String;
    .param p3, "varNo"    # I
    .param p4, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 552
    sget-object v1, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-ne p1, v1, :cond_2f

    .line 553
    const/16 v1, 0x133

    iput v1, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 554
    const/4 v1, 0x0

    iput v1, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 555
    const-string v1, "java/lang/Object"

    iput-object v1, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    .line 560
    :goto_f
    new-instance v0, Ljavassist/compiler/ast/Declarator;

    iget v1, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    iget v3, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    new-instance v5, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v5, p2}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    move v4, p3

    invoke-direct/range {v0 .. v5}, Ljavassist/compiler/ast/Declarator;-><init>(ILjava/lang/String;IILjavassist/compiler/ast/Symbol;)V

    .line 563
    .local v0, "decl":Ljavassist/compiler/ast/Declarator;
    invoke-virtual {p4, p2, v0}, Ljavassist/compiler/SymbolTable;->append(Ljava/lang/String;Ljavassist/compiler/ast/Declarator;)V

    .line 564
    iget v1, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    iget v2, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    invoke-static {v1, v2}, Ljavassist/compiler/JvstCodeGen;->is2word(II)Z

    move-result v1

    if-eqz v1, :cond_33

    const/4 v1, 0x2

    :goto_2e
    return v1

    .line 558
    .end local v0    # "decl":Ljavassist/compiler/ast/Declarator;
    :cond_2f
    invoke-virtual {p0, p1}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    goto :goto_f

    .line 564
    .restart local v0    # "decl":Ljavassist/compiler/ast/Declarator;
    :cond_33
    const/4 v1, 0x1

    goto :goto_2e
.end method

.method private setType(Ljavassist/CtClass;I)V
    .registers 8
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "dim"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 678
    invoke-virtual {p1}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_19

    move-object v1, p1

    .line 679
    check-cast v1, Ljavassist/CtPrimitiveType;

    .line 680
    .local v1, "pt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v2

    invoke-static {v2}, Ljavassist/compiler/MemberResolver;->descToType(C)I

    move-result v2

    iput v2, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 681
    iput p2, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 682
    const/4 v2, 0x0

    iput-object v2, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    .line 696
    .end local v1    # "pt":Ljavassist/CtPrimitiveType;
    :goto_18
    return-void

    .line 684
    :cond_19
    invoke-virtual {p1}, Ljavassist/CtClass;->isArray()Z

    move-result v2

    if-eqz v2, :cond_47

    .line 686
    :try_start_1f
    invoke-virtual {p1}, Ljavassist/CtClass;->getComponentType()Ljavassist/CtClass;

    move-result-object v2

    add-int/lit8 v3, p2, 0x1

    invoke-direct {p0, v2, v3}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;I)V
    :try_end_28
    .catch Ljavassist/NotFoundException; {:try_start_1f .. :try_end_28} :catch_29

    goto :goto_18

    .line 688
    :catch_29
    move-exception v0

    .line 689
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v2, Ljavassist/compiler/CompileError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "undefined type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 692
    .end local v0    # "e":Ljavassist/NotFoundException;
    :cond_47
    const/16 v2, 0x133

    iput v2, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 693
    iput p2, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 694
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljavassist/compiler/MemberResolver;->javaToJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    goto :goto_18
.end method


# virtual methods
.method public addNullIfVoid()V
    .registers 3

    .prologue
    .line 70
    iget v0, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    const/16 v1, 0x158

    if-ne v0, v1, :cond_17

    .line 71
    iget-object v0, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 72
    const/16 v0, 0x133

    iput v0, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 73
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 74
    const-string v0, "java/lang/Object"

    iput-object v0, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    .line 76
    :cond_17
    return-void
.end method

.method protected atAssignParamList([Ljavassist/CtClass;Ljavassist/bytecode/Bytecode;)V
    .registers 8
    .param p1, "params"    # [Ljavassist/CtClass;
    .param p2, "code"    # Ljavassist/bytecode/Bytecode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 146
    if-nez p1, :cond_3

    .line 159
    :cond_2
    return-void

    .line 149
    :cond_3
    invoke-direct {p0}, Ljavassist/compiler/JvstCodeGen;->indexOfParam1()I

    move-result v2

    .line 150
    .local v2, "varNo":I
    array-length v1, p1

    .line 151
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    if-ge v0, v1, :cond_2

    .line 152
    const/16 v3, 0x59

    invoke-virtual {p2, v3}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 153
    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 154
    const/16 v3, 0x32

    invoke-virtual {p2, v3}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 155
    aget-object v3, p1, v0

    invoke-virtual {p0, v3, p2}, Ljavassist/compiler/JvstCodeGen;->compileUnwrapValue(Ljavassist/CtClass;Ljavassist/bytecode/Bytecode;)V

    .line 156
    aget-object v3, p1, v0

    invoke-virtual {p2, v2, v3}, Ljavassist/bytecode/Bytecode;->addStore(ILjavassist/CtClass;)I

    .line 157
    iget v3, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    iget v4, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    invoke-static {v3, v4}, Ljavassist/compiler/JvstCodeGen;->is2word(II)Z

    move-result v3

    if-eqz v3, :cond_31

    const/4 v3, 0x2

    :goto_2d
    add-int/2addr v2, v3

    .line 151
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 157
    :cond_31
    const/4 v3, 0x1

    goto :goto_2d
.end method

.method public atCallExpr(Ljavassist/compiler/ast/CallExpr;)V
    .registers 7
    .param p1, "expr"    # Ljavassist/compiler/ast/CallExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 231
    invoke-virtual {p1}, Ljavassist/compiler/ast/CallExpr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 232
    .local v0, "method":Ljavassist/compiler/ast/ASTree;
    instance-of v2, v0, Ljavassist/compiler/ast/Member;

    if-eqz v2, :cond_3a

    .line 233
    check-cast v0, Ljavassist/compiler/ast/Member;

    .end local v0    # "method":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v1

    .line 234
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->procHandler:Ljavassist/compiler/ProceedHandler;

    if-eqz v2, :cond_28

    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->proceedName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    .line 235
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->procHandler:Ljavassist/compiler/ProceedHandler;

    iget-object v4, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {p1}, Ljavassist/compiler/ast/CallExpr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    check-cast v2, Ljavassist/compiler/ast/ASTList;

    invoke-interface {v3, p0, v4, v2}, Ljavassist/compiler/ProceedHandler;->doit(Ljavassist/compiler/JvstCodeGen;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/ast/ASTList;)V

    .line 245
    .end local v1    # "name":Ljava/lang/String;
    :goto_27
    return-void

    .line 238
    .restart local v1    # "name":Ljava/lang/String;
    :cond_28
    const-string v2, "$cflow"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 239
    invoke-virtual {p1}, Ljavassist/compiler/ast/CallExpr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    check-cast v2, Ljavassist/compiler/ast/ASTList;

    invoke-virtual {p0, v2}, Ljavassist/compiler/JvstCodeGen;->atCflow(Ljavassist/compiler/ast/ASTList;)V

    goto :goto_27

    .line 244
    .end local v1    # "name":Ljava/lang/String;
    :cond_3a
    invoke-super {p0, p1}, Ljavassist/compiler/MemberCodeGen;->atCallExpr(Ljavassist/compiler/ast/CallExpr;)V

    goto :goto_27
.end method

.method public atCastExpr(Ljavassist/compiler/ast/CastExpr;)V
    .registers 6
    .param p1, "expr"    # Ljavassist/compiler/ast/CastExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 162
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getClassName()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .line 163
    .local v0, "classname":Ljavassist/compiler/ast/ASTList;
    if-eqz v0, :cond_38

    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getArrayDim()I

    move-result v3

    if-nez v3, :cond_38

    .line 164
    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 165
    .local v1, "p":Ljavassist/compiler/ast/ASTree;
    instance-of v3, v1, Ljavassist/compiler/ast/Symbol;

    if-eqz v3, :cond_38

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    if-nez v3, :cond_38

    .line 166
    check-cast v1, Ljavassist/compiler/ast/Symbol;

    .end local v1    # "p":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v1}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v2

    .line 167
    .local v2, "typename":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->returnCastName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 168
    invoke-virtual {p0, p1}, Ljavassist/compiler/JvstCodeGen;->atCastToRtype(Ljavassist/compiler/ast/CastExpr;)V

    .line 179
    .end local v2    # "typename":Ljava/lang/String;
    :goto_2b
    return-void

    .line 171
    .restart local v2    # "typename":Ljava/lang/String;
    :cond_2c
    const-string v3, "$w"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_38

    .line 172
    invoke-virtual {p0, p1}, Ljavassist/compiler/JvstCodeGen;->atCastToWrapper(Ljavassist/compiler/ast/CastExpr;)V

    goto :goto_2b

    .line 178
    .end local v2    # "typename":Ljava/lang/String;
    :cond_38
    invoke-super {p0, p1}, Ljavassist/compiler/MemberCodeGen;->atCastExpr(Ljavassist/compiler/ast/CastExpr;)V

    goto :goto_2b
.end method

.method protected atCastToRtype(Ljavassist/compiler/ast/CastExpr;)V
    .registers 6
    .param p1, "expr"    # Ljavassist/compiler/ast/CastExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 186
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getOprand()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 187
    iget v2, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    const/16 v3, 0x158

    if-eq v2, v3, :cond_19

    iget v2, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    invoke-static {v2}, Ljavassist/compiler/JvstCodeGen;->isRefType(I)Z

    move-result v2

    if-nez v2, :cond_19

    iget v2, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    if-lez v2, :cond_21

    .line 188
    :cond_19
    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->returnType:Ljavassist/CtClass;

    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {p0, v2, v3}, Ljavassist/compiler/JvstCodeGen;->compileUnwrapValue(Ljavassist/CtClass;Ljavassist/bytecode/Bytecode;)V

    .line 199
    :goto_20
    return-void

    .line 189
    :cond_21
    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->returnType:Ljavassist/CtClass;

    instance-of v2, v2, Ljavassist/CtPrimitiveType;

    if-eqz v2, :cond_41

    .line 190
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->returnType:Ljavassist/CtClass;

    check-cast v1, Ljavassist/CtPrimitiveType;

    .line 191
    .local v1, "pt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v2

    invoke-static {v2}, Ljavassist/compiler/MemberResolver;->descToType(C)I

    move-result v0

    .line 192
    .local v0, "destType":I
    iget v2, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    invoke-virtual {p0, v2, v0}, Ljavassist/compiler/JvstCodeGen;->atNumCastExpr(II)V

    .line 193
    iput v0, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 194
    const/4 v2, 0x0

    iput v2, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 195
    const/4 v2, 0x0

    iput-object v2, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    goto :goto_20

    .line 198
    .end local v0    # "destType":I
    .end local v1    # "pt":Ljavassist/CtPrimitiveType;
    :cond_41
    new-instance v2, Ljavassist/compiler/CompileError;

    const-string v3, "invalid cast"

    invoke-direct {v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected atCastToWrapper(Ljavassist/compiler/ast/CastExpr;)V
    .registers 9
    .param p1, "expr"    # Ljavassist/compiler/ast/CastExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 202
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getOprand()Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 203
    iget v3, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    invoke-static {v3}, Ljavassist/compiler/JvstCodeGen;->isRefType(I)Z

    move-result v3

    if-nez v3, :cond_13

    iget v3, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    if-lez v3, :cond_14

    .line 225
    :cond_13
    :goto_13
    return-void

    .line 206
    :cond_14
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->resolver:Ljavassist/compiler/MemberResolver;

    iget v4, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    iget v5, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    iget-object v6, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6}, Ljavassist/compiler/MemberResolver;->lookupClass(IILjava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 207
    .local v0, "clazz":Ljavassist/CtClass;
    instance-of v3, v0, Ljavassist/CtPrimitiveType;

    if-eqz v3, :cond_13

    move-object v1, v0

    .line 208
    check-cast v1, Ljavassist/CtPrimitiveType;

    .line 209
    .local v1, "pt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getWrapperName()Ljava/lang/String;

    move-result-object v2

    .line 210
    .local v2, "wrapper":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3, v2}, Ljavassist/bytecode/Bytecode;->addNew(Ljava/lang/String;)V

    .line 211
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x59

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 212
    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getDataSize()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_7c

    .line 213
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x5e

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 217
    :goto_45
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 218
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v4, "<init>"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")V"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v2, v4, v5}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    const/16 v3, 0x133

    iput v3, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 222
    const/4 v3, 0x0

    iput v3, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 223
    const-string v3, "java/lang/Object"

    iput-object v3, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    goto :goto_13

    .line 215
    :cond_7c
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_45
.end method

.method protected atCflow(Ljavassist/compiler/ast/ASTList;)V
    .registers 10
    .param p1, "cname"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 250
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 251
    .local v2, "sbuf":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    if-eqz v3, :cond_16

    .line 252
    :cond_e
    new-instance v3, Ljavassist/compiler/CompileError;

    const-string v4, "bad $cflow"

    invoke-direct {v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 254
    :cond_16
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    invoke-static {v2, v3}, Ljavassist/compiler/JvstCodeGen;->makeCflowName(Ljava/lang/StringBuffer;Ljavassist/compiler/ast/ASTree;)V

    .line 255
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 256
    .local v0, "name":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->resolver:Ljavassist/compiler/MemberResolver;

    invoke-virtual {v3}, Ljavassist/compiler/MemberResolver;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljavassist/ClassPool;->lookupCflow(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v1

    .line 257
    .local v1, "names":[Ljava/lang/Object;
    if-nez v1, :cond_46

    .line 258
    new-instance v3, Ljavassist/compiler/CompileError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "no such $cflow: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 260
    :cond_46
    iget-object v5, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    aget-object v3, v1, v7

    check-cast v3, Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v4, v1, v4

    check-cast v4, Ljava/lang/String;

    const-string v6, "Ljavassist/runtime/Cflow;"

    invoke-virtual {v5, v3, v4, v6}, Ljavassist/bytecode/Bytecode;->addGetstatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v4, "javassist.runtime.Cflow"

    const-string v5, "value"

    const-string v6, "()I"

    invoke-virtual {v3, v4, v5, v6}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    const/16 v3, 0x144

    iput v3, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 265
    iput v7, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 266
    const/4 v3, 0x0

    iput-object v3, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    .line 267
    return-void
.end method

.method protected atFieldAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Z)V
    .registers 9
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p2, "op"    # I
    .param p3, "left"    # Ljavassist/compiler/ast/ASTree;
    .param p4, "right"    # Ljavassist/compiler/ast/ASTree;
    .param p5, "doDup"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 126
    instance-of v0, p3, Ljavassist/compiler/ast/Member;

    if-eqz v0, :cond_6c

    move-object v0, p3

    check-cast v0, Ljavassist/compiler/ast/Member;

    invoke-virtual {v0}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->paramArrayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 128
    const/16 v0, 0x3d

    if-eq p2, v0, :cond_32

    .line 129
    new-instance v0, Ljavassist/compiler/CompileError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bad operator for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->paramArrayName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_32
    invoke-virtual {p4, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 132
    iget v0, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_40

    iget v0, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    const/16 v1, 0x133

    if-eq v0, v1, :cond_5b

    .line 133
    :cond_40
    new-instance v0, Ljavassist/compiler/CompileError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid type for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->paramArrayName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_5b
    iget-object v0, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {p0, v0, v1}, Ljavassist/compiler/JvstCodeGen;->atAssignParamList([Ljavassist/CtClass;Ljavassist/bytecode/Bytecode;)V

    .line 136
    if-nez p5, :cond_6b

    .line 137
    iget-object v0, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x57

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 141
    :cond_6b
    :goto_6b
    return-void

    .line 140
    :cond_6c
    invoke-super/range {p0 .. p5}, Ljavassist/compiler/MemberCodeGen;->atFieldAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Z)V

    goto :goto_6b
.end method

.method public atMember(Ljavassist/compiler/ast/Member;)V
    .registers 9
    .param p1, "mem"    # Ljavassist/compiler/ast/Member;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v6, 0x133

    const/4 v5, 0x1

    .line 82
    invoke-virtual {p1}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->paramArrayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_23

    .line 84
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    invoke-direct {p0}, Ljavassist/compiler/JvstCodeGen;->indexOfParam1()I

    move-result v3

    invoke-static {v1, v2, v3}, Ljavassist/compiler/JvstCodeGen;->compileParameterList(Ljavassist/bytecode/Bytecode;[Ljavassist/CtClass;I)I

    .line 85
    iput v6, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 86
    iput v5, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 87
    const-string v1, "java/lang/Object"

    iput-object v1, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    .line 113
    :goto_22
    return-void

    .line 89
    :cond_23
    const-string v1, "$sig"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4c

    .line 90
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->returnType:Ljavassist/CtClass;

    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    invoke-static {v2, v3}, Ljavassist/bytecode/Descriptor;->ofMethod(Ljavassist/CtClass;[Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 91
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v2, "javassist/runtime/Desc"

    const-string v3, "getParams"

    const-string v4, "(Ljava/lang/String;)[Ljava/lang/Class;"

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    iput v6, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    .line 94
    iput v5, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    .line 95
    const-string v1, "java/lang/Class"

    iput-object v1, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    goto :goto_22

    .line 97
    :cond_4c
    const-string v1, "$type"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_71

    .line 98
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->dollarType:Ljavassist/CtClass;

    if-nez v1, :cond_60

    .line 99
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "$type is not available"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 101
    :cond_60
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->dollarType:Ljavassist/CtClass;

    invoke-static {v2}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 102
    const-string v1, "getType"

    invoke-direct {p0, v1}, Ljavassist/compiler/JvstCodeGen;->callGetType(Ljava/lang/String;)V

    goto :goto_22

    .line 104
    :cond_71
    const-string v1, "$class"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_92

    .line 105
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->param0Type:Ljava/lang/String;

    if-nez v1, :cond_85

    .line 106
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "$class is not available"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 108
    :cond_85
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->param0Type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 109
    const-string v1, "getClazz"

    invoke-direct {p0, v1}, Ljavassist/compiler/JvstCodeGen;->callGetType(Ljava/lang/String;)V

    goto :goto_22

    .line 112
    :cond_92
    invoke-super {p0, p1}, Ljavassist/compiler/MemberCodeGen;->atMember(Ljavassist/compiler/ast/Member;)V

    goto :goto_22
.end method

.method public atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V
    .registers 14
    .param p1, "args"    # Ljavassist/compiler/ast/ASTList;
    .param p2, "types"    # [I
    .param p3, "dims"    # [I
    .param p4, "cnames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 337
    iget-object v5, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    .line 338
    .local v5, "params":[Ljavassist/CtClass;
    iget-object v6, p0, Ljavassist/compiler/JvstCodeGen;->paramListName:Ljava/lang/String;

    .line 339
    .local v6, "pname":Ljava/lang/String;
    const/4 v1, 0x0

    .line 340
    .local v1, "i":I
    :goto_5
    if-eqz p1, :cond_59

    .line 341
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 342
    .local v0, "a":Ljavassist/compiler/ast/ASTree;
    instance-of v8, v0, Ljavassist/compiler/ast/Member;

    if-eqz v8, :cond_43

    move-object v8, v0

    check-cast v8, Ljavassist/compiler/ast/Member;

    invoke-virtual {v8}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_43

    .line 343
    if-eqz v5, :cond_54

    .line 344
    array-length v3, v5

    .line 345
    .local v3, "n":I
    invoke-direct {p0}, Ljavassist/compiler/JvstCodeGen;->indexOfParam1()I

    move-result v7

    .line 346
    .local v7, "regno":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_24
    if-ge v2, v3, :cond_54

    .line 347
    aget-object v4, v5, v2

    .line 348
    .local v4, "p":Ljavassist/CtClass;
    iget-object v8, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v8, v7, v4}, Ljavassist/bytecode/Bytecode;->addLoad(ILjavassist/CtClass;)I

    move-result v8

    add-int/2addr v7, v8

    .line 349
    invoke-virtual {p0, v4}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    .line 350
    iget v8, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    aput v8, p2, v1

    .line 351
    iget v8, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    aput v8, p3, v1

    .line 352
    iget-object v8, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    aput-object v8, p4, v1

    .line 353
    add-int/lit8 v1, v1, 0x1

    .line 346
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 358
    .end local v2    # "k":I
    .end local v3    # "n":I
    .end local v4    # "p":Ljavassist/CtClass;
    .end local v7    # "regno":I
    :cond_43
    invoke-virtual {v0, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 359
    iget v8, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    aput v8, p2, v1

    .line 360
    iget v8, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    aput v8, p3, v1

    .line 361
    iget-object v8, p0, Ljavassist/compiler/JvstCodeGen;->className:Ljava/lang/String;

    aput-object v8, p4, v1

    .line 362
    add-int/lit8 v1, v1, 0x1

    .line 365
    :cond_54
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object p1

    .line 366
    goto :goto_5

    .line 367
    .end local v0    # "a":Ljavassist/compiler/ast/ASTree;
    :cond_59
    return-void
.end method

.method protected atReturnStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 5
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 414
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 415
    .local v0, "result":Ljavassist/compiler/ast/ASTree;
    if-eqz v0, :cond_21

    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->returnType:Ljavassist/CtClass;

    sget-object v2, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-ne v1, v2, :cond_21

    .line 416
    invoke-virtual {p0, v0}, Ljavassist/compiler/JvstCodeGen;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 417
    iget v1, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    iget v2, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    invoke-static {v1, v2}, Ljavassist/compiler/JvstCodeGen;->is2word(II)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 418
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v2, 0x58

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 422
    :cond_20
    :goto_20
    const/4 v0, 0x0

    .line 425
    :cond_21
    invoke-virtual {p0, v0}, Ljavassist/compiler/JvstCodeGen;->atReturnStmnt2(Ljavassist/compiler/ast/ASTree;)V

    .line 426
    return-void

    .line 419
    :cond_25
    iget v1, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    const/16 v2, 0x158

    if-eq v1, v2, :cond_20

    .line 420
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v2, 0x57

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_20
.end method

.method compileInvokeSpecial(Ljavassist/compiler/ast/ASTree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavassist/compiler/ast/ASTList;)V
    .registers 11
    .param p1, "target"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "methodname"    # Ljava/lang/String;
    .param p4, "descriptor"    # Ljava/lang/String;
    .param p5, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 401
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 402
    invoke-virtual {p0, p5}, Ljavassist/compiler/JvstCodeGen;->getMethodArgsLength(Ljavassist/compiler/ast/ASTList;)I

    move-result v0

    .line 403
    .local v0, "nargs":I
    new-array v1, v0, [I

    new-array v2, v0, [I

    new-array v3, v0, [Ljava/lang/String;

    invoke-virtual {p0, p5, v1, v2, v3}, Ljavassist/compiler/JvstCodeGen;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 405
    iget-object v1, p0, Ljavassist/compiler/JvstCodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v1, p2, p3, p4}, Ljavassist/bytecode/Bytecode;->addInvokespecial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    invoke-virtual {p0, p4, v4, v4}, Ljavassist/compiler/JvstCodeGen;->setReturnType(Ljava/lang/String;ZZ)V

    .line 407
    invoke-virtual {p0}, Ljavassist/compiler/JvstCodeGen;->addNullIfVoid()V

    .line 408
    return-void
.end method

.method protected compileUnwrapValue(Ljavassist/CtClass;Ljavassist/bytecode/Bytecode;)V
    .registers 8
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "code"    # Ljavassist/bytecode/Bytecode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 647
    sget-object v2, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-ne p1, v2, :cond_8

    .line 648
    invoke-virtual {p0}, Ljavassist/compiler/JvstCodeGen;->addNullIfVoid()V

    .line 668
    :goto_7
    return-void

    .line 652
    :cond_8
    iget v2, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    const/16 v3, 0x158

    if-ne v2, v3, :cond_29

    .line 653
    new-instance v2, Ljavassist/compiler/CompileError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "invalid type for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Ljavassist/compiler/JvstCodeGen;->returnCastName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 655
    :cond_29
    instance-of v2, p1, Ljavassist/CtPrimitiveType;

    if-eqz v2, :cond_46

    move-object v0, p1

    .line 656
    check-cast v0, Ljavassist/CtPrimitiveType;

    .line 658
    .local v0, "pt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getWrapperName()Ljava/lang/String;

    move-result-object v1

    .line 659
    .local v1, "wrapper":Ljava/lang/String;
    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->addCheckcast(Ljava/lang/String;)V

    .line 660
    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getGetMethodName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getGetMethodDescriptor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    invoke-virtual {p0, p1}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    goto :goto_7

    .line 665
    .end local v0    # "pt":Ljavassist/CtPrimitiveType;
    .end local v1    # "wrapper":Ljava/lang/String;
    :cond_46
    invoke-virtual {p2, p1}, Ljavassist/bytecode/Bytecode;->addCheckcast(Ljavassist/CtClass;)V

    .line 666
    invoke-virtual {p0, p1}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    goto :goto_7
.end method

.method public doNumCast(Ljavassist/CtClass;)V
    .registers 5
    .param p1, "type"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 701
    iget v1, p0, Ljavassist/compiler/JvstCodeGen;->arrayDim:I

    if-nez v1, :cond_20

    iget v1, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    invoke-static {v1}, Ljavassist/compiler/JvstCodeGen;->isRefType(I)Z

    move-result v1

    if-nez v1, :cond_20

    .line 702
    instance-of v1, p1, Ljavassist/CtPrimitiveType;

    if-eqz v1, :cond_21

    move-object v0, p1

    .line 703
    check-cast v0, Ljavassist/CtPrimitiveType;

    .line 704
    .local v0, "pt":Ljavassist/CtPrimitiveType;
    iget v1, p0, Ljavassist/compiler/JvstCodeGen;->exprType:I

    invoke-virtual {v0}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v2

    invoke-static {v2}, Ljavassist/compiler/MemberResolver;->descToType(C)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Ljavassist/compiler/JvstCodeGen;->atNumCastExpr(II)V

    .line 709
    .end local v0    # "pt":Ljavassist/CtPrimitiveType;
    :cond_20
    return-void

    .line 708
    :cond_21
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "type mismatch"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getMethodArgsLength(Ljavassist/compiler/ast/ASTList;)I
    .registers 6
    .param p1, "args"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 318
    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->paramListName:Ljava/lang/String;

    .line 319
    .local v2, "pname":Ljava/lang/String;
    const/4 v1, 0x0

    .line 320
    .local v1, "n":I
    :goto_3
    if-eqz p1, :cond_29

    .line 321
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 322
    .local v0, "a":Ljavassist/compiler/ast/ASTree;
    instance-of v3, v0, Ljavassist/compiler/ast/Member;

    if-eqz v3, :cond_26

    check-cast v0, Ljavassist/compiler/ast/Member;

    .end local v0    # "a":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 323
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    if-eqz v3, :cond_21

    .line 324
    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    array-length v3, v3

    add-int/2addr v1, v3

    .line 329
    :cond_21
    :goto_21
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object p1

    .line 330
    goto :goto_3

    .line 327
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 332
    :cond_29
    return v1
.end method

.method public isParamListName(Ljavassist/compiler/ast/ASTList;)Z
    .registers 6
    .param p1, "args"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    const/4 v1, 0x0

    .line 298
    iget-object v2, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    if-eqz v2, :cond_24

    if-eqz p1, :cond_24

    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    if-nez v2, :cond_24

    .line 300
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 301
    .local v0, "left":Ljavassist/compiler/ast/ASTree;
    instance-of v2, v0, Ljavassist/compiler/ast/Member;

    if-eqz v2, :cond_24

    check-cast v0, Ljavassist/compiler/ast/Member;

    .end local v0    # "left":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Ljavassist/compiler/JvstCodeGen;->paramListName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    const/4 v1, 0x1

    .line 305
    :cond_24
    return v1
.end method

.method public recordParams([Ljavassist/CtClass;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavassist/compiler/SymbolTable;)I
    .registers 17
    .param p1, "params"    # [Ljavassist/CtClass;
    .param p2, "isStatic"    # Z
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "paramVarName"    # Ljava/lang/String;
    .param p5, "paramsName"    # Ljava/lang/String;
    .param p6, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 471
    if-nez p2, :cond_15

    const/4 v6, 0x1

    :goto_3
    const/4 v7, 0x0

    invoke-virtual {p0}, Ljavassist/compiler/JvstCodeGen;->getThisName()Ljava/lang/String;

    move-result-object v8

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object/from16 v9, p6

    invoke-virtual/range {v0 .. v9}, Ljavassist/compiler/JvstCodeGen;->recordParams([Ljavassist/CtClass;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Ljavassist/compiler/SymbolTable;)I

    move-result v0

    return v0

    :cond_15
    const/4 v6, 0x0

    goto :goto_3
.end method

.method public recordParams([Ljavassist/CtClass;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Ljavassist/compiler/SymbolTable;)I
    .registers 20
    .param p1, "params"    # [Ljavassist/CtClass;
    .param p2, "isStatic"    # Z
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "paramVarName"    # Ljava/lang/String;
    .param p5, "paramsName"    # Ljava/lang/String;
    .param p6, "use0"    # Z
    .param p7, "paramBase"    # I
    .param p8, "target"    # Ljava/lang/String;
    .param p9, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 502
    iput-object p1, p0, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    .line 503
    iput-object p4, p0, Ljavassist/compiler/JvstCodeGen;->paramArrayName:Ljava/lang/String;

    .line 504
    iput-object p5, p0, Ljavassist/compiler/JvstCodeGen;->paramListName:Ljava/lang/String;

    .line 505
    move/from16 v0, p7

    iput v0, p0, Ljavassist/compiler/JvstCodeGen;->paramVarBase:I

    .line 506
    move/from16 v0, p6

    iput-boolean v0, p0, Ljavassist/compiler/JvstCodeGen;->useParam0:Z

    .line 508
    if-eqz p8, :cond_16

    .line 509
    invoke-static/range {p8 .. p8}, Ljavassist/compiler/MemberResolver;->jvmToJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Ljavassist/compiler/JvstCodeGen;->param0Type:Ljava/lang/String;

    .line 511
    :cond_16
    iput-boolean p2, p0, Ljavassist/compiler/JvstCodeGen;->inStaticMethod:Z

    .line 512
    move/from16 v5, p7

    .line 513
    .local v5, "varNo":I
    if-eqz p6, :cond_48

    .line 514
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 515
    .local v8, "varName":Ljava/lang/String;
    new-instance v1, Ljavassist/compiler/ast/Declarator;

    const/16 v2, 0x133

    invoke-static/range {p8 .. p8}, Ljavassist/compiler/MemberResolver;->javaToJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    add-int/lit8 v9, v5, 0x1

    .end local v5    # "varNo":I
    .local v9, "varNo":I
    new-instance v6, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v6, v8}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v1 .. v6}, Ljavassist/compiler/ast/Declarator;-><init>(ILjava/lang/String;IILjavassist/compiler/ast/Symbol;)V

    .line 518
    .local v1, "decl":Ljavassist/compiler/ast/Declarator;
    move-object/from16 v0, p9

    invoke-virtual {v0, v8, v1}, Ljavassist/compiler/SymbolTable;->append(Ljava/lang/String;Ljavassist/compiler/ast/Declarator;)V

    move v5, v9

    .line 521
    .end local v1    # "decl":Ljavassist/compiler/ast/Declarator;
    .end local v8    # "varName":Ljava/lang/String;
    .end local v9    # "varNo":I
    .restart local v5    # "varNo":I
    :cond_48
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_49
    array-length v2, p1

    if-ge v7, v2, :cond_6b

    .line 522
    aget-object v2, p1, v7

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v7, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p9

    invoke-direct {p0, v2, v3, v5, v0}, Ljavassist/compiler/JvstCodeGen;->recordVar(Ljavassist/CtClass;Ljava/lang/String;ILjavassist/compiler/SymbolTable;)I

    move-result v2

    add-int/2addr v5, v2

    .line 521
    add-int/lit8 v7, v7, 0x1

    goto :goto_49

    .line 524
    :cond_6b
    invoke-virtual {p0}, Ljavassist/compiler/JvstCodeGen;->getMaxLocals()I

    move-result v2

    if-ge v2, v5, :cond_74

    .line 525
    invoke-virtual {p0, v5}, Ljavassist/compiler/JvstCodeGen;->setMaxLocals(I)V

    .line 527
    :cond_74
    return v5
.end method

.method public recordReturnType(Ljavassist/CtClass;Ljava/lang/String;Ljava/lang/String;Ljavassist/compiler/SymbolTable;)I
    .registers 8
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "castName"    # Ljava/lang/String;
    .param p3, "resultName"    # Ljava/lang/String;
    .param p4, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 441
    iput-object p1, p0, Ljavassist/compiler/JvstCodeGen;->returnType:Ljavassist/CtClass;

    .line 442
    iput-object p2, p0, Ljavassist/compiler/JvstCodeGen;->returnCastName:Ljava/lang/String;

    .line 443
    iput-object p3, p0, Ljavassist/compiler/JvstCodeGen;->returnVarName:Ljava/lang/String;

    .line 444
    if-nez p3, :cond_a

    .line 445
    const/4 v1, -0x1

    .line 450
    :goto_9
    return v1

    .line 447
    :cond_a
    invoke-virtual {p0}, Ljavassist/compiler/JvstCodeGen;->getMaxLocals()I

    move-result v1

    .line 448
    .local v1, "varNo":I
    invoke-direct {p0, p1, p3, v1, p4}, Ljavassist/compiler/JvstCodeGen;->recordVar(Ljavassist/CtClass;Ljava/lang/String;ILjavassist/compiler/SymbolTable;)I

    move-result v2

    add-int v0, v1, v2

    .line 449
    .local v0, "locals":I
    invoke-virtual {p0, v0}, Ljavassist/compiler/JvstCodeGen;->setMaxLocals(I)V

    goto :goto_9
.end method

.method public recordType(Ljavassist/CtClass;)V
    .registers 2
    .param p1, "t"    # Ljavassist/CtClass;

    .prologue
    .line 458
    iput-object p1, p0, Ljavassist/compiler/JvstCodeGen;->dollarType:Ljavassist/CtClass;

    .line 459
    return-void
.end method

.method public recordVariable(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/compiler/SymbolTable;)I
    .registers 7
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "varName"    # Ljava/lang/String;
    .param p3, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 539
    if-nez p2, :cond_4

    .line 540
    const/4 v1, -0x1

    .line 545
    :goto_3
    return v1

    .line 542
    :cond_4
    invoke-virtual {p0}, Ljavassist/compiler/JvstCodeGen;->getMaxLocals()I

    move-result v1

    .line 543
    .local v1, "varNo":I
    invoke-direct {p0, p1, p2, v1, p3}, Ljavassist/compiler/JvstCodeGen;->recordVar(Ljavassist/CtClass;Ljava/lang/String;ILjavassist/compiler/SymbolTable;)I

    move-result v2

    add-int v0, v1, v2

    .line 544
    .local v0, "locals":I
    invoke-virtual {p0, v0}, Ljavassist/compiler/JvstCodeGen;->setMaxLocals(I)V

    goto :goto_3
.end method

.method public recordVariable(Ljava/lang/String;Ljava/lang/String;ILjavassist/compiler/SymbolTable;)V
    .registers 12
    .param p1, "typeDesc"    # Ljava/lang/String;
    .param p2, "varName"    # Ljava/lang/String;
    .param p3, "varNo"    # I
    .param p4, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 578
    const/4 v3, 0x0

    .line 579
    .local v3, "dim":I
    :goto_1
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .local v6, "c":C
    const/16 v4, 0x5b

    if-ne v6, v4, :cond_c

    .line 580
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 582
    :cond_c
    invoke-static {v6}, Ljavassist/compiler/MemberResolver;->descToType(C)I

    move-result v1

    .line 583
    .local v1, "type":I
    const/4 v2, 0x0

    .line 584
    .local v2, "cname":Ljava/lang/String;
    const/16 v4, 0x133

    if-ne v1, v4, :cond_22

    .line 585
    if-nez v3, :cond_31

    .line 586
    const/4 v4, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 591
    :cond_22
    :goto_22
    new-instance v0, Ljavassist/compiler/ast/Declarator;

    new-instance v5, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v5, p2}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    move v4, p3

    invoke-direct/range {v0 .. v5}, Ljavassist/compiler/ast/Declarator;-><init>(ILjava/lang/String;IILjavassist/compiler/ast/Symbol;)V

    .line 593
    .local v0, "decl":Ljavassist/compiler/ast/Declarator;
    invoke-virtual {p4, p2, v0}, Ljavassist/compiler/SymbolTable;->append(Ljava/lang/String;Ljavassist/compiler/ast/Declarator;)V

    .line 594
    return-void

    .line 588
    .end local v0    # "decl":Ljavassist/compiler/ast/Declarator;
    :cond_31
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_22
.end method

.method public setProceedHandler(Ljavassist/compiler/ProceedHandler;Ljava/lang/String;)V
    .registers 3
    .param p1, "h"    # Ljavassist/compiler/ProceedHandler;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p2, p0, Ljavassist/compiler/JvstCodeGen;->proceedName:Ljava/lang/String;

    .line 63
    iput-object p1, p0, Ljavassist/compiler/JvstCodeGen;->procHandler:Ljavassist/compiler/ProceedHandler;

    .line 64
    return-void
.end method

.method public setType(Ljavassist/CtClass;)V
    .registers 3
    .param p1, "type"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 674
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;I)V

    .line 675
    return-void
.end method
