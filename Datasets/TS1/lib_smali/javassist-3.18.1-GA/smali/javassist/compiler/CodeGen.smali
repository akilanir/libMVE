.class public abstract Ljavassist/compiler/CodeGen;
.super Ljavassist/compiler/ast/Visitor;
.source "CodeGen.java"

# interfaces
.implements Ljavassist/bytecode/Opcode;
.implements Ljavassist/compiler/TokenId;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/compiler/CodeGen$ReturnHook;
    }
.end annotation


# static fields
.field private static final P_DOUBLE:I = 0x0

.field private static final P_FLOAT:I = 0x1

.field private static final P_INT:I = 0x3

.field private static final P_LONG:I = 0x2

.field private static final P_OTHER:I = -0x1

.field static final binOp:[I

.field private static final castOp:[I

.field private static final ifOp:[I

.field private static final ifOp2:[I

.field static final javaLangObject:Ljava/lang/String; = "java.lang.Object"

.field static final javaLangString:Ljava/lang/String; = "java.lang.String"

.field static final jvmJavaLangObject:Ljava/lang/String; = "java/lang/Object"

.field static final jvmJavaLangString:Ljava/lang/String; = "java/lang/String"


# instance fields
.field protected arrayDim:I

.field protected breakList:Ljava/util/ArrayList;

.field protected bytecode:Ljavassist/bytecode/Bytecode;

.field protected className:Ljava/lang/String;

.field protected continueList:Ljava/util/ArrayList;

.field protected exprType:I

.field protected hasReturned:Z

.field public inStaticMethod:Z

.field protected returnHooks:Ljavassist/compiler/CodeGen$ReturnHook;

.field private tempVar:I

.field typeChecker:Ljavassist/compiler/TypeChecker;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x12

    .line 934
    const/16 v0, 0x37

    new-array v0, v0, [I

    fill-array-data v0, :array_24

    sput-object v0, Ljavassist/compiler/CodeGen;->binOp:[I

    .line 1183
    new-array v0, v1, [I

    fill-array-data v0, :array_96

    sput-object v0, Ljavassist/compiler/CodeGen;->ifOp:[I

    .line 1190
    new-array v0, v1, [I

    fill-array-data v0, :array_be

    sput-object v0, Ljavassist/compiler/CodeGen;->ifOp2:[I

    .line 1296
    const/16 v0, 0x10

    new-array v0, v0, [I

    fill-array-data v0, :array_e6

    sput-object v0, Ljavassist/compiler/CodeGen;->castOp:[I

    return-void

    .line 934
    nop

    :array_24
    .array-data 4
        0x2b
        0x63
        0x62
        0x61
        0x60
        0x2d
        0x67
        0x66
        0x65
        0x64
        0x2a
        0x6b
        0x6a
        0x69
        0x68
        0x2f
        0x6f
        0x6e
        0x6d
        0x6c
        0x25
        0x73
        0x72
        0x71
        0x70
        0x7c
        0x0
        0x0
        0x81
        0x80
        0x5e
        0x0
        0x0
        0x83
        0x82
        0x26
        0x0
        0x0
        0x7f
        0x7e
        0x16c
        0x0
        0x0
        0x79
        0x78
        0x16e
        0x0
        0x0
        0x7b
        0x7a
        0x172
        0x0
        0x0
        0x7d
        0x7c
    .end array-data

    .line 1183
    :array_96
    .array-data 4
        0x166
        0x9f
        0xa0
        0x15e
        0xa0
        0x9f
        0x165
        0xa4
        0xa3
        0x167
        0xa2
        0xa1
        0x3c
        0xa1
        0xa2
        0x3e
        0xa3
        0xa4
    .end array-data

    .line 1190
    :array_be
    .array-data 4
        0x166
        0x99
        0x9a
        0x15e
        0x9a
        0x99
        0x165
        0x9e
        0x9d
        0x167
        0x9c
        0x9b
        0x3c
        0x9b
        0x9c
        0x3e
        0x9d
        0x9e
    .end array-data

    .line 1296
    :array_e6
    .array-data 4
        0x0
        0x90
        0x8f
        0x8e
        0x8d
        0x0
        0x8c
        0x8b
        0x8a
        0x89
        0x0
        0x88
        0x87
        0x86
        0x85
        0x0
    .end array-data
.end method

.method public constructor <init>(Ljavassist/bytecode/Bytecode;)V
    .registers 5
    .param p1, "b"    # Ljavassist/bytecode/Bytecode;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Ljavassist/compiler/ast/Visitor;-><init>()V

    .line 84
    iput-object p1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    .line 85
    const/4 v0, -0x1

    iput v0, p0, Ljavassist/compiler/CodeGen;->tempVar:I

    .line 86
    iput-object v1, p0, Ljavassist/compiler/CodeGen;->typeChecker:Ljavassist/compiler/TypeChecker;

    .line 87
    iput-boolean v2, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 88
    iput-boolean v2, p0, Ljavassist/compiler/CodeGen;->inStaticMethod:Z

    .line 89
    iput-object v1, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 90
    iput-object v1, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    .line 91
    iput-object v1, p0, Ljavassist/compiler/CodeGen;->returnHooks:Ljavassist/compiler/CodeGen$ReturnHook;

    .line 92
    return-void
.end method

.method private atArithBinExpr(Ljavassist/compiler/ast/Expr;III)V
    .registers 11
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p2, "token"    # I
    .param p3, "index"    # I
    .param p4, "type1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v5, 0x144

    .line 1001
    iget v3, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-eqz v3, :cond_9

    .line 1002
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badTypes(Ljavassist/compiler/ast/Expr;)V

    .line 1004
    :cond_9
    iget v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1005
    .local v2, "type2":I
    const/16 v3, 0x16c

    if-eq p2, v3, :cond_17

    const/16 v3, 0x16e

    if-eq p2, v3, :cond_17

    const/16 v3, 0x172

    if-ne p2, v3, :cond_4e

    .line 1006
    :cond_17
    if-eq v2, v5, :cond_25

    const/16 v3, 0x14e

    if-eq v2, v3, :cond_25

    const/16 v3, 0x132

    if-eq v2, v3, :cond_25

    const/16 v3, 0x12f

    if-ne v2, v3, :cond_4a

    .line 1008
    :cond_25
    iput p4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1014
    :goto_27
    iget v3, p0, Ljavassist/compiler/CodeGen;->exprType:I

    invoke-static {v3}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v1

    .line 1015
    .local v1, "p":I
    if-ltz v1, :cond_52

    .line 1016
    sget-object v3, Ljavassist/compiler/CodeGen;->binOp:[I

    add-int v4, p3, v1

    add-int/lit8 v4, v4, 0x1

    aget v0, v3, v4

    .line 1017
    .local v0, "op":I
    if-eqz v0, :cond_52

    .line 1018
    const/4 v3, 0x3

    if-ne v1, v3, :cond_44

    iget v3, p0, Ljavassist/compiler/CodeGen;->exprType:I

    const/16 v4, 0x12d

    if-eq v3, v4, :cond_44

    .line 1019
    iput v5, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1021
    :cond_44
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1027
    .end local v0    # "op":I
    :goto_49
    return-void

    .line 1010
    .end local v1    # "p":I
    :cond_4a
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badTypes(Ljavassist/compiler/ast/Expr;)V

    goto :goto_27

    .line 1012
    :cond_4e
    invoke-direct {p0, p4, v2, p1}, Ljavassist/compiler/CodeGen;->convertOprandTypes(IILjavassist/compiler/ast/Expr;)V

    goto :goto_27

    .line 1026
    .restart local v1    # "p":I
    :cond_52
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badTypes(Ljavassist/compiler/ast/Expr;)V

    goto :goto_49
.end method

.method private atArrayAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/Expr;Ljavassist/compiler/ast/ASTree;Z)V
    .registers 13
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p2, "op"    # I
    .param p3, "array"    # Ljavassist/compiler/ast/Expr;
    .param p4, "right"    # Ljavassist/compiler/ast/ASTree;
    .param p5, "doDup"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 825
    invoke-virtual {p3}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    invoke-virtual {p3}, Ljavassist/compiler/ast/Expr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljavassist/compiler/CodeGen;->arrayAccess(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V

    .line 827
    const/16 v0, 0x3d

    if-eq p2, v0, :cond_23

    .line 828
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x5c

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 829
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    iget v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    invoke-static {v1, v2}, Ljavassist/compiler/CodeGen;->getArrayReadOp(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 832
    :cond_23
    iget v4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 833
    .local v4, "aType":I
    iget v5, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 834
    .local v5, "aDim":I
    iget-object v6, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .local v6, "cname":Ljava/lang/String;
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p4

    .line 836
    invoke-virtual/range {v0 .. v6}, Ljavassist/compiler/CodeGen;->atAssignCore(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;IILjava/lang/String;)V

    .line 838
    if-eqz p5, :cond_3f

    .line 839
    invoke-static {v4, v5}, Ljavassist/compiler/CodeGen;->is2word(II)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 840
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x5e

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 844
    :cond_3f
    :goto_3f
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-static {v4, v5}, Ljavassist/compiler/CodeGen;->getArrayWriteOp(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 845
    iput v4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 846
    iput v5, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 847
    iput-object v6, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 848
    return-void

    .line 842
    :cond_4f
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_3f
.end method

.method private atBreakStmnt(Ljavassist/compiler/ast/Stmnt;Z)V
    .registers 6
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .param p2, "notCont"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 576
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    if-eqz v1, :cond_e

    .line 577
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "sorry, not support labeled break or continue"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 580
    :cond_e
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v2, 0xa7

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 581
    new-instance v0, Ljava/lang/Integer;

    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v1}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    .line 582
    .local v0, "pc":Ljava/lang/Integer;
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 583
    if-eqz p2, :cond_2e

    .line 584
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 587
    :goto_2d
    return-void

    .line 586
    :cond_2e
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2d
.end method

.method private atForStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 16
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    .line 456
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 457
    .local v8, "prevBreakList":Ljava/util/ArrayList;
    iget-object v9, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    .line 458
    .local v9, "prevContList":Ljava/util/ArrayList;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 459
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    .line 461
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    check-cast v2, Ljavassist/compiler/ast/Stmnt;

    .line 462
    .local v2, "init":Ljavassist/compiler/ast/Stmnt;
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    .line 463
    .local v3, "p":Ljavassist/compiler/ast/ASTList;
    invoke-virtual {v3}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 464
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v3}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    .line 465
    invoke-virtual {v3}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v10

    check-cast v10, Ljavassist/compiler/ast/Stmnt;

    .line 466
    .local v10, "update":Ljavassist/compiler/ast/Stmnt;
    invoke-virtual {v3}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/Stmnt;

    .line 468
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    if-eqz v2, :cond_36

    .line 469
    invoke-virtual {v2, p0}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 471
    :cond_36
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v11}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    .line 472
    .local v4, "pc":I
    const/4 v5, 0x0

    .line 473
    .local v5, "pc2":I
    if-eqz v1, :cond_4d

    .line 474
    invoke-virtual {p0, v13, v1}, Ljavassist/compiler/CodeGen;->compileBooleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    .line 475
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v11}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v5

    .line 476
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v11, v13}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 479
    :cond_4d
    if-eqz v0, :cond_52

    .line 480
    invoke-virtual {v0, p0}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 482
    :cond_52
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v11}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v6

    .line 483
    .local v6, "pc3":I
    if-eqz v10, :cond_5d

    .line 484
    invoke-virtual {v10, p0}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 486
    :cond_5d
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v12, 0xa7

    invoke-virtual {v11, v12}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 487
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v12, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v12}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v12

    sub-int v12, v4, v12

    add-int/lit8 v12, v12, 0x1

    invoke-virtual {v11, v12}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 489
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v11}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v7

    .line 490
    .local v7, "pc4":I
    if-eqz v1, :cond_84

    .line 491
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    sub-int v12, v7, v5

    add-int/lit8 v12, v12, 0x1

    invoke-virtual {v11, v5, v12}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 493
    :cond_84
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    invoke-virtual {p0, v11, v7}, Ljavassist/compiler/CodeGen;->patchGoto(Ljava/util/ArrayList;I)V

    .line 494
    iget-object v11, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    invoke-virtual {p0, v11, v6}, Ljavassist/compiler/CodeGen;->patchGoto(Ljava/util/ArrayList;I)V

    .line 495
    iput-object v9, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    .line 496
    iput-object v8, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 497
    iput-boolean v13, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 498
    return-void
.end method

.method private atIfStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 11
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 381
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 382
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v7

    invoke-virtual {v7}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v5

    check-cast v5, Ljavassist/compiler/ast/Stmnt;

    .line 383
    .local v5, "thenp":Ljavassist/compiler/ast/Stmnt;
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v7

    invoke-virtual {v7}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v7

    invoke-virtual {v7}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/Stmnt;

    .line 384
    .local v0, "elsep":Ljavassist/compiler/ast/Stmnt;
    invoke-virtual {p0, v6, v1}, Ljavassist/compiler/CodeGen;->compileBooleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    .line 385
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v7}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v2

    .line 386
    .local v2, "pc":I
    const/4 v3, 0x0

    .line 387
    .local v3, "pc2":I
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v7, v6}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 389
    iput-boolean v6, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 390
    if-eqz v5, :cond_33

    .line 391
    invoke-virtual {v5, p0}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 393
    :cond_33
    iget-boolean v4, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 394
    .local v4, "thenHasReturned":Z
    iput-boolean v6, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 396
    if-eqz v0, :cond_4d

    if-nez v4, :cond_4d

    .line 397
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v8, 0xa7

    invoke-virtual {v7, v8}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 398
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v7}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v3

    .line 399
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v7, v6}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 402
    :cond_4d
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v8}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v8

    sub-int/2addr v8, v2

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v2, v8}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 404
    if-eqz v0, :cond_79

    .line 405
    invoke-virtual {v0, p0}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 406
    if-nez v4, :cond_70

    .line 407
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v8}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v8

    sub-int/2addr v8, v3

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v3, v8}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 409
    :cond_70
    if-eqz v4, :cond_77

    iget-boolean v7, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    if-eqz v7, :cond_77

    const/4 v6, 0x1

    :cond_77
    iput-boolean v6, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 411
    :cond_79
    return-void
.end method

.method private atPlusPlus(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/Expr;Z)V
    .registers 16
    .param p1, "token"    # I
    .param p2, "oprand"    # Ljavassist/compiler/ast/ASTree;
    .param p3, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p4, "doDup"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1689
    if-nez p2, :cond_61

    const/4 v2, 0x1

    .line 1690
    .local v2, "isPost":Z
    :goto_3
    if-eqz v2, :cond_9

    .line 1691
    invoke-virtual {p3}, Ljavassist/compiler/ast/Expr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object p2

    .line 1693
    :cond_9
    instance-of v0, p2, Ljavassist/compiler/ast/Variable;

    if-eqz v0, :cond_138

    .line 1694
    check-cast p2, Ljavassist/compiler/ast/Variable;

    .end local p2    # "oprand":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p2}, Ljavassist/compiler/ast/Variable;->getDeclarator()Ljavassist/compiler/ast/Declarator;

    move-result-object v6

    .line 1695
    .local v6, "d":Ljavassist/compiler/ast/Declarator;
    invoke-virtual {v6}, Ljavassist/compiler/ast/Declarator;->getType()I

    move-result v9

    iput v9, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1696
    .local v9, "t":I
    invoke-virtual {v6}, Ljavassist/compiler/ast/Declarator;->getArrayDim()I

    move-result v0

    iput v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1697
    invoke-virtual {p0, v6}, Ljavassist/compiler/CodeGen;->getLocalVar(Ljavassist/compiler/ast/Declarator;)I

    move-result v10

    .line 1698
    .local v10, "var":I
    iget v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-lez v0, :cond_2a

    .line 1699
    invoke-static {p3}, Ljavassist/compiler/CodeGen;->badType(Ljavassist/compiler/ast/Expr;)V

    .line 1701
    :cond_2a
    const/16 v0, 0x138

    if-ne v9, v0, :cond_66

    .line 1702
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addDload(I)V

    .line 1703
    if-eqz p4, :cond_3e

    if-eqz v2, :cond_3e

    .line 1704
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x5c

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1706
    :cond_3e
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v0, v3, v4}, Ljavassist/bytecode/Bytecode;->addDconst(D)V

    .line 1707
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v0, 0x16a

    if-ne p1, v0, :cond_63

    const/16 v0, 0x63

    :goto_4d
    invoke-virtual {v1, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1708
    if-eqz p4, :cond_5b

    if-nez v2, :cond_5b

    .line 1709
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x5c

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1711
    :cond_5b
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addDstore(I)V

    .line 1771
    .end local v6    # "d":Ljavassist/compiler/ast/Declarator;
    .end local v9    # "t":I
    .end local v10    # "var":I
    :cond_60
    :goto_60
    return-void

    .line 1689
    .end local v2    # "isPost":Z
    .restart local p2    # "oprand":Ljavassist/compiler/ast/ASTree;
    :cond_61
    const/4 v2, 0x0

    goto :goto_3

    .line 1707
    .end local p2    # "oprand":Ljavassist/compiler/ast/ASTree;
    .restart local v2    # "isPost":Z
    .restart local v6    # "d":Ljavassist/compiler/ast/Declarator;
    .restart local v9    # "t":I
    .restart local v10    # "var":I
    :cond_63
    const/16 v0, 0x67

    goto :goto_4d

    .line 1713
    :cond_66
    const/16 v0, 0x146

    if-ne v9, v0, :cond_a0

    .line 1714
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addLload(I)V

    .line 1715
    if-eqz p4, :cond_7a

    if-eqz v2, :cond_7a

    .line 1716
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x5c

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1718
    :cond_7a
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-wide/16 v3, 0x1

    invoke-virtual {v0, v3, v4}, Ljavassist/bytecode/Bytecode;->addLconst(J)V

    .line 1719
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v0, 0x16a

    if-ne p1, v0, :cond_9d

    const/16 v0, 0x61

    :goto_89
    invoke-virtual {v1, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1720
    if-eqz p4, :cond_97

    if-nez v2, :cond_97

    .line 1721
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x5c

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1723
    :cond_97
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addLstore(I)V

    goto :goto_60

    .line 1719
    :cond_9d
    const/16 v0, 0x65

    goto :goto_89

    .line 1725
    :cond_a0
    const/16 v0, 0x13d

    if-ne v9, v0, :cond_da

    .line 1726
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addFload(I)V

    .line 1727
    if-eqz p4, :cond_b4

    if-eqz v2, :cond_b4

    .line 1728
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x59

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1730
    :cond_b4
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addFconst(F)V

    .line 1731
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v0, 0x16a

    if-ne p1, v0, :cond_d7

    const/16 v0, 0x62

    :goto_c3
    invoke-virtual {v1, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1732
    if-eqz p4, :cond_d1

    if-nez v2, :cond_d1

    .line 1733
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x59

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1735
    :cond_d1
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addFstore(I)V

    goto :goto_60

    .line 1731
    :cond_d7
    const/16 v0, 0x66

    goto :goto_c3

    .line 1737
    :cond_da
    const/16 v0, 0x12f

    if-eq v9, v0, :cond_ea

    const/16 v0, 0x132

    if-eq v9, v0, :cond_ea

    const/16 v0, 0x14e

    if-eq v9, v0, :cond_ea

    const/16 v0, 0x144

    if-ne v9, v0, :cond_133

    .line 1738
    :cond_ea
    if-eqz p4, :cond_f3

    if-eqz v2, :cond_f3

    .line 1739
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addIload(I)V

    .line 1741
    :cond_f3
    const/16 v0, 0x16a

    if-ne p1, v0, :cond_11f

    const/4 v7, 0x1

    .line 1742
    .local v7, "delta":I
    :goto_f8
    const/16 v0, 0xff

    if-le v10, v0, :cond_121

    .line 1743
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0xc4

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1744
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x84

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1745
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1746
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1754
    :goto_114
    if-eqz p4, :cond_60

    if-nez v2, :cond_60

    .line 1755
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addIload(I)V

    goto/16 :goto_60

    .line 1741
    .end local v7    # "delta":I
    :cond_11f
    const/4 v7, -0x1

    goto :goto_f8

    .line 1749
    .restart local v7    # "delta":I
    :cond_121
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x84

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1750
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 1751
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_114

    .line 1758
    .end local v7    # "delta":I
    :cond_133
    invoke-static {p3}, Ljavassist/compiler/CodeGen;->badType(Ljavassist/compiler/ast/Expr;)V

    goto/16 :goto_60

    .line 1761
    .end local v6    # "d":Ljavassist/compiler/ast/Declarator;
    .end local v9    # "t":I
    .end local v10    # "var":I
    .restart local p2    # "oprand":Ljavassist/compiler/ast/ASTree;
    :cond_138
    instance-of v0, p2, Ljavassist/compiler/ast/Expr;

    if-eqz v0, :cond_14c

    move-object v8, p2

    .line 1762
    check-cast v8, Ljavassist/compiler/ast/Expr;

    .line 1763
    .local v8, "e":Ljavassist/compiler/ast/Expr;
    invoke-virtual {v8}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v0

    const/16 v1, 0x41

    if-ne v0, v1, :cond_14c

    .line 1764
    invoke-virtual {p0, p1, v2, v8, p4}, Ljavassist/compiler/CodeGen;->atArrayPlusPlus(IZLjavassist/compiler/ast/Expr;Z)V

    goto/16 :goto_60

    .end local v8    # "e":Ljavassist/compiler/ast/Expr;
    :cond_14c
    move-object v0, p0

    move v1, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    .line 1769
    invoke-virtual/range {v0 .. v5}, Ljavassist/compiler/CodeGen;->atFieldPlusPlus(IZLjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/Expr;Z)V

    goto/16 :goto_60
.end method

.method private atStringConcatExpr(Ljavassist/compiler/ast/Expr;IILjava/lang/String;)V
    .registers 15
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p2, "type1"    # I
    .param p3, "dim1"    # I
    .param p4, "cname1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v9, 0x133

    const/16 v7, 0x5f

    const/4 v4, 0x0

    .line 1032
    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1033
    .local v1, "type2":I
    iget v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1034
    .local v0, "dim2":I
    invoke-static {v1, v0}, Ljavassist/compiler/CodeGen;->is2word(II)Z

    move-result v2

    .line 1035
    .local v2, "type2Is2":Z
    if-ne v1, v9, :cond_56

    const-string v5, "java/lang/String"

    iget-object v6, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_56

    const/4 v3, 0x1

    .line 1038
    .local v3, "type2IsString":Z
    :goto_1a
    if-eqz v2, :cond_1f

    .line 1039
    invoke-direct {p0, v1, v0}, Ljavassist/compiler/CodeGen;->convToString(II)V

    .line 1041
    :cond_1f
    invoke-static {p2, p3}, Ljavassist/compiler/CodeGen;->is2word(II)Z

    move-result v5

    if-eqz v5, :cond_58

    .line 1042
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v6, 0x5b

    invoke-virtual {v5, v6}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1043
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v6, 0x57

    invoke-virtual {v5, v6}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1049
    :goto_33
    invoke-direct {p0, p2, p3}, Ljavassist/compiler/CodeGen;->convToString(II)V

    .line 1050
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v7}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1052
    if-nez v2, :cond_42

    if-nez v3, :cond_42

    .line 1053
    invoke-direct {p0, v1, v0}, Ljavassist/compiler/CodeGen;->convToString(II)V

    .line 1055
    :cond_42
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v6, "java.lang.String"

    const-string v7, "concat"

    const-string v8, "(Ljava/lang/String;)Ljava/lang/String;"

    invoke-virtual {v5, v6, v7, v8}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1057
    iput v9, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1058
    iput v4, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1059
    const-string v4, "java/lang/String"

    iput-object v4, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 1060
    return-void

    .end local v3    # "type2IsString":Z
    :cond_56
    move v3, v4

    .line 1035
    goto :goto_1a

    .line 1046
    .restart local v3    # "type2IsString":Z
    :cond_58
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v7}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_33
.end method

.method private atStringPlusEq(Ljavassist/compiler/ast/Expr;IILjava/lang/String;Ljavassist/compiler/ast/ASTree;)V
    .registers 10
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p2, "type"    # I
    .param p3, "dim"    # I
    .param p4, "cname"    # Ljava/lang/String;
    .param p5, "right"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 885
    const-string v0, "java/lang/String"

    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    .line 886
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badAssign(Ljavassist/compiler/ast/Expr;)V

    .line 888
    :cond_b
    invoke-direct {p0, p2, p3}, Ljavassist/compiler/CodeGen;->convToString(II)V

    .line 889
    invoke-virtual {p5, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 890
    iget v0, p0, Ljavassist/compiler/CodeGen;->exprType:I

    iget v1, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    invoke-direct {p0, v0, v1}, Ljavassist/compiler/CodeGen;->convToString(II)V

    .line 891
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v1, "java.lang.String"

    const-string v2, "concat"

    const-string v3, "(Ljava/lang/String;)Ljava/lang/String;"

    invoke-virtual {v0, v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addInvokevirtual(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 893
    const/16 v0, 0x133

    iput v0, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 894
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 895
    const-string v0, "java/lang/String"

    iput-object v0, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 896
    return-void
.end method

.method private atSwitchStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 28
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 501
    invoke-virtual/range {p1 .. p1}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljavassist/compiler/CodeGen;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 503
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    .line 504
    .local v19, "prevBreakList":Ljava/util/ArrayList;
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 505
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v15

    .line 506
    .local v15, "opcodePc":I
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    const/16 v21, 0xab

    invoke-virtual/range {v20 .. v21}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 507
    and-int/lit8 v20, v15, 0x3

    rsub-int/lit8 v11, v20, 0x3

    .local v11, "npads":I
    move v12, v11

    .line 508
    .end local v11    # "npads":I
    .local v12, "npads":I
    :goto_36
    add-int/lit8 v11, v12, -0x1

    .end local v12    # "npads":I
    .restart local v11    # "npads":I
    if-lez v12, :cond_47

    .line 509
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Ljavassist/bytecode/Bytecode;->add(I)V

    move v12, v11

    .end local v11    # "npads":I
    .restart local v12    # "npads":I
    goto :goto_36

    .line 511
    .end local v12    # "npads":I
    .restart local v11    # "npads":I
    :cond_47
    invoke-virtual/range {p1 .. p1}, Ljavassist/compiler/ast/Stmnt;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    check-cast v3, Ljavassist/compiler/ast/Stmnt;

    .line 512
    .local v3, "body":Ljavassist/compiler/ast/Stmnt;
    const/4 v13, 0x0

    .line 513
    .local v13, "npairs":I
    move-object v10, v3

    .local v10, "list":Ljavassist/compiler/ast/ASTList;
    :goto_4f
    if-eqz v10, :cond_6a

    .line 514
    invoke-virtual {v10}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v20

    check-cast v20, Ljavassist/compiler/ast/Stmnt;

    invoke-virtual/range {v20 .. v20}, Ljavassist/compiler/ast/Stmnt;->getOperator()I

    move-result v20

    const/16 v21, 0x130

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_65

    .line 515
    add-int/lit8 v13, v13, 0x1

    .line 513
    :cond_65
    invoke-virtual {v10}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v10

    goto :goto_4f

    .line 518
    :cond_6a
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v16

    .line 519
    .local v16, "opcodePc2":I
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    const/16 v21, 0x4

    invoke-virtual/range {v20 .. v21}, Ljavassist/bytecode/Bytecode;->addGap(I)V

    .line 520
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Ljavassist/bytecode/Bytecode;->add32bit(I)V

    .line 521
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    mul-int/lit8 v21, v13, 0x8

    invoke-virtual/range {v20 .. v21}, Ljavassist/bytecode/Bytecode;->addGap(I)V

    .line 523
    new-array v0, v13, [J

    move-object/from16 v17, v0

    .line 524
    .local v17, "pairs":[J
    const/4 v7, 0x0

    .line 525
    .local v7, "ipairs":I
    const/4 v4, -0x1

    .line 526
    .local v4, "defaultPc":I
    move-object v10, v3

    move v8, v7

    .end local v7    # "ipairs":I
    .local v8, "ipairs":I
    :goto_9d
    if-eqz v10, :cond_111

    .line 527
    invoke-virtual {v10}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v9

    check-cast v9, Ljavassist/compiler/ast/Stmnt;

    .line 528
    .local v9, "label":Ljavassist/compiler/ast/Stmnt;
    invoke-virtual {v9}, Ljavassist/compiler/ast/Stmnt;->getOperator()I

    move-result v14

    .line 529
    .local v14, "op":I
    const/16 v20, 0x136

    move/from16 v0, v20

    if-ne v14, v0, :cond_d5

    .line 530
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    move v7, v8

    .line 539
    .end local v8    # "ipairs":I
    .restart local v7    # "ipairs":I
    :goto_ba
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 540
    invoke-virtual {v9}, Ljavassist/compiler/ast/Stmnt;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v20

    check-cast v20, Ljavassist/compiler/ast/Stmnt;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 526
    invoke-virtual {v10}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v10

    move v8, v7

    .end local v7    # "ipairs":I
    .restart local v8    # "ipairs":I
    goto :goto_9d

    .line 531
    :cond_d5
    const/16 v20, 0x130

    move/from16 v0, v20

    if-eq v14, v0, :cond_e0

    .line 532
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    move v7, v8

    .end local v8    # "ipairs":I
    .restart local v7    # "ipairs":I
    goto :goto_ba

    .line 534
    .end local v7    # "ipairs":I
    .restart local v8    # "ipairs":I
    :cond_e0
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "ipairs":I
    .restart local v7    # "ipairs":I
    invoke-virtual {v9}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljavassist/compiler/CodeGen;->computeLabel(Ljavassist/compiler/ast/ASTree;)I

    move-result v20

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const/16 v22, 0x20

    shl-long v20, v20, v22

    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v22

    sub-int v22, v22, v15

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    const-wide/16 v24, -0x1

    and-long v22, v22, v24

    add-long v20, v20, v22

    aput-wide v20, v17, v8

    goto :goto_ba

    .line 543
    .end local v7    # "ipairs":I
    .end local v9    # "label":Ljavassist/compiler/ast/Stmnt;
    .end local v14    # "op":I
    .restart local v8    # "ipairs":I
    :cond_111
    invoke-static/range {v17 .. v17}, Ljava/util/Arrays;->sort([J)V

    .line 544
    add-int/lit8 v18, v16, 0x8

    .line 545
    .local v18, "pc":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_117
    if-ge v6, v13, :cond_14a

    .line 546
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    aget-wide v21, v17, v6

    const/16 v23, 0x20

    ushr-long v21, v21, v23

    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v21, v0

    move-object/from16 v0, v20

    move/from16 v1, v18

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/Bytecode;->write32bit(II)V

    .line 547
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    add-int/lit8 v21, v18, 0x4

    aget-wide v22, v17, v6

    move-wide/from16 v0, v22

    long-to-int v0, v0

    move/from16 v22, v0

    invoke-virtual/range {v20 .. v22}, Ljavassist/bytecode/Bytecode;->write32bit(II)V

    .line 548
    add-int/lit8 v18, v18, 0x8

    .line 545
    add-int/lit8 v6, v6, 0x1

    goto :goto_117

    .line 551
    :cond_14a
    if-ltz v4, :cond_158

    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v20

    if-lez v20, :cond_160

    .line 552
    :cond_158
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 554
    :cond_160
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v5

    .line 555
    .local v5, "endPc":I
    if-gez v4, :cond_16d

    .line 556
    move v4, v5

    .line 558
    :cond_16d
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    move-object/from16 v20, v0

    sub-int v21, v4, v15

    move-object/from16 v0, v20

    move/from16 v1, v16

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/Bytecode;->write32bit(II)V

    .line 560
    move-object/from16 v0, p0

    iget-object v0, v0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v5}, Ljavassist/compiler/CodeGen;->patchGoto(Ljava/util/ArrayList;I)V

    .line 561
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 562
    return-void
.end method

.method private atSyncStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 15
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 643
    iget-object v10, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    invoke-static {v10}, Ljavassist/compiler/CodeGen;->getListSize(Ljava/util/ArrayList;)I

    move-result v2

    .line 644
    .local v2, "nbreaks":I
    iget-object v10, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    invoke-static {v10}, Ljavassist/compiler/CodeGen;->getListSize(Ljava/util/ArrayList;)I

    move-result v3

    .line 646
    .local v3, "ncontinues":I
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v10

    invoke-virtual {p0, v10}, Ljavassist/compiler/CodeGen;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 647
    iget v10, p0, Ljavassist/compiler/CodeGen;->exprType:I

    const/16 v11, 0x133

    if-eq v10, v11, :cond_26

    iget v10, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-nez v10, :cond_26

    .line 648
    new-instance v10, Ljavassist/compiler/CompileError;

    const-string v11, "bad type expr for synchronized block"

    invoke-direct {v10, v11}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v10

    .line 650
    :cond_26
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    .line 651
    .local v0, "bc":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v9

    .line 652
    .local v9, "var":I
    const/4 v10, 0x1

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->incMaxLocals(I)V

    .line 653
    const/16 v10, 0x59

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 654
    invoke-virtual {v0, v9}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 655
    const/16 v10, 0xc2

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 657
    new-instance v8, Ljavassist/compiler/CodeGen$1;

    invoke-direct {v8, p0, p0, v9}, Ljavassist/compiler/CodeGen$1;-><init>(Ljavassist/compiler/CodeGen;Ljavassist/compiler/CodeGen;I)V

    .line 665
    .local v8, "rh":Ljavassist/compiler/CodeGen$ReturnHook;
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    .line 666
    .local v4, "pc":I
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    check-cast v1, Ljavassist/compiler/ast/Stmnt;

    .line 667
    .local v1, "body":Ljavassist/compiler/ast/Stmnt;
    if-eqz v1, :cond_51

    .line 668
    invoke-virtual {v1, p0}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 670
    :cond_51
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v5

    .line 671
    .local v5, "pc2":I
    const/4 v6, 0x0

    .line 672
    .local v6, "pc3":I
    iget-boolean v10, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    if-nez v10, :cond_69

    .line 673
    invoke-virtual {v8, v0, v12}, Ljavassist/compiler/CodeGen$ReturnHook;->doit(Ljavassist/bytecode/Bytecode;I)Z

    .line 674
    const/16 v10, 0xa7

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 675
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v6

    .line 676
    invoke-virtual {v0, v12}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 679
    :cond_69
    if-ge v4, v5, :cond_7a

    .line 680
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v7

    .line 681
    .local v7, "pc4":I
    invoke-virtual {v8, v0, v12}, Ljavassist/compiler/CodeGen$ReturnHook;->doit(Ljavassist/bytecode/Bytecode;I)Z

    .line 682
    const/16 v10, 0xbf

    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 683
    invoke-virtual {v0, v4, v5, v7, v12}, Ljavassist/bytecode/Bytecode;->addExceptionHandler(IIII)V

    .line 686
    .end local v7    # "pc4":I
    :cond_7a
    iget-boolean v10, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    if-nez v10, :cond_88

    .line 687
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v10

    sub-int/2addr v10, v6

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v0, v6, v10}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 689
    :cond_88
    invoke-virtual {v8, p0}, Ljavassist/compiler/CodeGen$ReturnHook;->remove(Ljavassist/compiler/CodeGen;)V

    .line 691
    iget-object v10, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    invoke-static {v10}, Ljavassist/compiler/CodeGen;->getListSize(Ljava/util/ArrayList;)I

    move-result v10

    if-ne v10, v2, :cond_9b

    iget-object v10, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    invoke-static {v10}, Ljavassist/compiler/CodeGen;->getListSize(Ljava/util/ArrayList;)I

    move-result v10

    if-eq v10, v3, :cond_a3

    .line 693
    :cond_9b
    new-instance v10, Ljavassist/compiler/CompileError;

    const-string v11, "sorry, cannot break/continue in synchronized block"

    invoke-direct {v10, v11}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v10

    .line 695
    :cond_a3
    return-void
.end method

.method private atThrowStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 5
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 627
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 628
    .local v0, "e":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0, v0}, Ljavassist/compiler/CodeGen;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 629
    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    const/16 v2, 0x133

    if-ne v1, v2, :cond_11

    iget v1, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-lez v1, :cond_19

    .line 630
    :cond_11
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "bad throw statement"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 632
    :cond_19
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v2, 0xbf

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 633
    const/4 v1, 0x1

    iput-boolean v1, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 634
    return-void
.end method

.method private atVariableAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/Variable;Ljavassist/compiler/ast/Declarator;Ljavassist/compiler/ast/ASTree;Z)V
    .registers 15
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p2, "op"    # I
    .param p3, "var"    # Ljavassist/compiler/ast/Variable;
    .param p4, "d"    # Ljavassist/compiler/ast/Declarator;
    .param p5, "right"    # Ljavassist/compiler/ast/ASTree;
    .param p6, "doDup"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 781
    invoke-virtual {p4}, Ljavassist/compiler/ast/Declarator;->getType()I

    move-result v4

    .line 782
    .local v4, "varType":I
    invoke-virtual {p4}, Ljavassist/compiler/ast/Declarator;->getArrayDim()I

    move-result v5

    .line 783
    .local v5, "varArray":I
    invoke-virtual {p4}, Ljavassist/compiler/ast/Declarator;->getClassName()Ljava/lang/String;

    move-result-object v6

    .line 784
    .local v6, "varClass":Ljava/lang/String;
    invoke-virtual {p0, p4}, Ljavassist/compiler/CodeGen;->getLocalVar(Ljavassist/compiler/ast/Declarator;)I

    move-result v7

    .line 786
    .local v7, "varNo":I
    const/16 v0, 0x3d

    if-eq p2, v0, :cond_17

    .line 787
    invoke-virtual {p0, p3}, Ljavassist/compiler/CodeGen;->atVariable(Ljavassist/compiler/ast/Variable;)V

    .line 790
    :cond_17
    if-nez p1, :cond_3f

    instance-of v0, p5, Ljavassist/compiler/ast/ArrayInit;

    if-eqz v0, :cond_3f

    .line 791
    check-cast p5, Ljavassist/compiler/ast/ArrayInit;

    .end local p5    # "right":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0, p5, v4, v5, v6}, Ljavassist/compiler/CodeGen;->atArrayVariableAssign(Ljavassist/compiler/ast/ArrayInit;IILjava/lang/String;)V

    .line 795
    :goto_22
    if-eqz p6, :cond_31

    .line 796
    invoke-static {v4, v5}, Ljavassist/compiler/CodeGen;->is2word(II)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 797
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x5c

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 801
    :cond_31
    :goto_31
    if-lez v5, :cond_4f

    .line 802
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 814
    :goto_38
    iput v4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 815
    iput v5, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 816
    iput-object v6, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 817
    return-void

    .restart local p5    # "right":Ljavassist/compiler/ast/ASTree;
    :cond_3f
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p5

    .line 793
    invoke-virtual/range {v0 .. v6}, Ljavassist/compiler/CodeGen;->atAssignCore(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;IILjava/lang/String;)V

    goto :goto_22

    .line 799
    .end local p5    # "right":Ljavassist/compiler/ast/ASTree;
    :cond_47
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0x59

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_31

    .line 803
    :cond_4f
    const/16 v0, 0x138

    if-ne v4, v0, :cond_59

    .line 804
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->addDstore(I)V

    goto :goto_38

    .line 805
    :cond_59
    const/16 v0, 0x13d

    if-ne v4, v0, :cond_63

    .line 806
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->addFstore(I)V

    goto :goto_38

    .line 807
    :cond_63
    const/16 v0, 0x146

    if-ne v4, v0, :cond_6d

    .line 808
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->addLstore(I)V

    goto :goto_38

    .line 809
    :cond_6d
    invoke-static {v4}, Ljavassist/compiler/CodeGen;->isRefType(I)Z

    move-result v0

    if-eqz v0, :cond_79

    .line 810
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    goto :goto_38

    .line 812
    :cond_79
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v7}, Ljavassist/bytecode/Bytecode;->addIstore(I)V

    goto :goto_38
.end method

.method private atWhileStmnt(Ljavassist/compiler/ast/Stmnt;Z)V
    .registers 13
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .param p2, "notDo"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 414
    iget-object v6, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 415
    .local v6, "prevBreakList":Ljava/util/ArrayList;
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    .line 416
    .local v7, "prevContList":Ljava/util/ArrayList;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 417
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    .line 419
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .line 420
    .local v2, "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    check-cast v1, Ljavassist/compiler/ast/Stmnt;

    .line 422
    .local v1, "body":Ljavassist/compiler/ast/Stmnt;
    const/4 v3, 0x0

    .line 423
    .local v3, "pc":I
    if-eqz p2, :cond_32

    .line 424
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v9, 0xa7

    invoke-virtual {v8, v9}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 425
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v8}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v3

    .line 426
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 429
    :cond_32
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v8}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    .line 430
    .local v4, "pc2":I
    if-eqz v1, :cond_3d

    .line 431
    invoke-virtual {v1, p0}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 433
    :cond_3d
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v8}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v5

    .line 434
    .local v5, "pc3":I
    if-eqz p2, :cond_4e

    .line 435
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    sub-int v9, v5, v3

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v8, v3, v9}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 437
    :cond_4e
    const/4 v8, 0x1

    invoke-virtual {p0, v8, v2}, Ljavassist/compiler/CodeGen;->compileBooleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    move-result v0

    .line 438
    .local v0, "alwaysBranch":Z
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v9, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v9}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v9

    sub-int v9, v4, v9

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v8, v9}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 440
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    iget-object v9, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v9}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v9

    invoke-virtual {p0, v8, v9}, Ljavassist/compiler/CodeGen;->patchGoto(Ljava/util/ArrayList;I)V

    .line 441
    iget-object v8, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    invoke-virtual {p0, v8, v5}, Ljavassist/compiler/CodeGen;->patchGoto(Ljava/util/ArrayList;I)V

    .line 442
    iput-object v7, p0, Ljavassist/compiler/CodeGen;->continueList:Ljava/util/ArrayList;

    .line 443
    iput-object v6, p0, Ljavassist/compiler/CodeGen;->breakList:Ljava/util/ArrayList;

    .line 444
    iput-boolean v0, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 445
    return-void
.end method

.method protected static badAssign(Ljavassist/compiler/ast/Expr;)V
    .registers 4
    .param p0, "expr"    # Ljavassist/compiler/ast/Expr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 765
    if-nez p0, :cond_a

    .line 766
    const-string v0, "incompatible type for assignment"

    .line 770
    .local v0, "msg":Ljava/lang/String;
    :goto_4
    new-instance v1, Ljavassist/compiler/CompileError;

    invoke-direct {v1, v0}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 768
    .end local v0    # "msg":Ljava/lang/String;
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "incompatible type for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/compiler/ast/Expr;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_4
.end method

.method protected static badType(Ljavassist/compiler/ast/Expr;)V
    .registers 4
    .param p0, "expr"    # Ljavassist/compiler/ast/Expr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1526
    new-instance v0, Ljavassist/compiler/CompileError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid type for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/compiler/ast/Expr;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected static badTypes(Ljavassist/compiler/ast/Expr;)V
    .registers 4
    .param p0, "expr"    # Ljavassist/compiler/ast/Expr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1256
    new-instance v0, Ljavassist/compiler/CompileError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid types for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/compiler/ast/Expr;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private booleanExpr(ZLjavassist/compiler/ast/ASTree;)Z
    .registers 13
    .param p1, "branchIf"    # Z
    .param p2, "expr"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v9, 0x12d

    const/16 v8, 0xa7

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1099
    invoke-static {p2}, Ljavassist/compiler/CodeGen;->getCompOperator(Ljavassist/compiler/ast/ASTree;)I

    move-result v2

    .line 1100
    .local v2, "op":I
    const/16 v7, 0x166

    if-ne v2, v7, :cond_22

    move-object v0, p2

    .line 1101
    check-cast v0, Ljavassist/compiler/ast/BinExpr;

    .line 1102
    .local v0, "bexpr":Ljavassist/compiler/ast/BinExpr;
    invoke-direct {p0, v0}, Ljavassist/compiler/CodeGen;->compileOprands(Ljavassist/compiler/ast/BinExpr;)I

    move-result v4

    .line 1105
    .local v4, "type1":I
    invoke-virtual {v0}, Ljavassist/compiler/ast/BinExpr;->getOperator()I

    move-result v5

    invoke-direct {p0, p1, v5, v4, v0}, Ljavassist/compiler/CodeGen;->compareExpr(ZIILjavassist/compiler/ast/BinExpr;)V

    .line 1134
    .end local v0    # "bexpr":Ljavassist/compiler/ast/BinExpr;
    .end local v4    # "type1":I
    .end local p2    # "expr":Ljavassist/compiler/ast/ASTree;
    :cond_1c
    :goto_1c
    iput v9, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1135
    iput v6, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    move v5, v6

    .line 1136
    :goto_21
    return v5

    .line 1107
    .restart local p2    # "expr":Ljavassist/compiler/ast/ASTree;
    :cond_22
    const/16 v7, 0x21

    if-ne v2, v7, :cond_34

    .line 1108
    if-nez p1, :cond_32

    :goto_28
    check-cast p2, Ljavassist/compiler/ast/Expr;

    .end local p2    # "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p2}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v7

    invoke-direct {p0, v5, v7}, Ljavassist/compiler/CodeGen;->booleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    goto :goto_1c

    .restart local p2    # "expr":Ljavassist/compiler/ast/ASTree;
    :cond_32
    move v5, v6

    goto :goto_28

    .line 1109
    :cond_34
    const/16 v7, 0x171

    if-ne v2, v7, :cond_79

    move v1, v5

    .local v1, "isAndAnd":Z
    :goto_39
    if-nez v1, :cond_3f

    const/16 v7, 0x170

    if-ne v2, v7, :cond_7d

    :cond_3f
    move-object v0, p2

    .line 1110
    check-cast v0, Ljavassist/compiler/ast/BinExpr;

    .line 1111
    .restart local v0    # "bexpr":Ljavassist/compiler/ast/BinExpr;
    if-nez v1, :cond_7b

    :goto_44
    invoke-virtual {v0}, Ljavassist/compiler/ast/BinExpr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v7

    invoke-direct {p0, v5, v7}, Ljavassist/compiler/CodeGen;->booleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    .line 1112
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v3

    .line 1113
    .local v3, "pc":I
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v6}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1115
    invoke-virtual {v0}, Ljavassist/compiler/ast/BinExpr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v5

    invoke-direct {p0, v1, v5}, Ljavassist/compiler/CodeGen;->booleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    .line 1116
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v7}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v7

    sub-int/2addr v7, v3

    add-int/lit8 v7, v7, 0x3

    invoke-virtual {v5, v3, v7}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 1117
    if-eq p1, v1, :cond_1c

    .line 1118
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v7, 0x6

    invoke-virtual {v5, v7}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1119
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v8}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_1c

    .end local v0    # "bexpr":Ljavassist/compiler/ast/BinExpr;
    .end local v1    # "isAndAnd":Z
    .end local v3    # "pc":I
    :cond_79
    move v1, v6

    .line 1109
    goto :goto_39

    .restart local v0    # "bexpr":Ljavassist/compiler/ast/BinExpr;
    .restart local v1    # "isAndAnd":Z
    :cond_7b
    move v5, v6

    .line 1111
    goto :goto_44

    .line 1122
    .end local v0    # "bexpr":Ljavassist/compiler/ast/BinExpr;
    :cond_7d
    invoke-static {p2, p1}, Ljavassist/compiler/CodeGen;->isAlwaysBranch(Ljavassist/compiler/ast/ASTree;Z)Z

    move-result v7

    if-eqz v7, :cond_89

    .line 1123
    iget-object v6, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v6, v8}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_21

    .line 1127
    :cond_89
    invoke-virtual {p2, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 1128
    iget v5, p0, Ljavassist/compiler/CodeGen;->exprType:I

    if-ne v5, v9, :cond_94

    iget v5, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-eqz v5, :cond_9c

    .line 1129
    :cond_94
    new-instance v5, Ljavassist/compiler/CompileError;

    const-string v6, "boolean expr is required"

    invoke-direct {v5, v6}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1131
    :cond_9c
    iget-object v7, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-eqz p1, :cond_a7

    const/16 v5, 0x9a

    :goto_a2
    invoke-virtual {v7, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto/16 :goto_1c

    :cond_a7
    const/16 v5, 0x99

    goto :goto_a2
.end method

.method private checkCastExpr(Ljavassist/compiler/ast/CastExpr;Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p1, "expr"    # Ljavassist/compiler/ast/CastExpr;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v10, 0x158

    .line 1386
    const-string v8, "invalid cast"

    .line 1387
    .local v8, "msg":Ljava/lang/String;
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getOprand()Ljavassist/compiler/ast/ASTree;

    move-result-object v9

    .line 1388
    .local v9, "oprand":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getArrayDim()I

    move-result v5

    .line 1389
    .local v5, "dim":I
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getType()I

    move-result v4

    .line 1390
    .local v4, "type":I
    invoke-virtual {v9, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 1391
    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1392
    .local v1, "srcType":I
    iget v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    iget-object v3, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    const/4 v7, 0x1

    move-object v0, p0

    move-object v6, p2

    invoke-direct/range {v0 .. v7}, Ljavassist/compiler/CodeGen;->invalidDim(IILjava/lang/String;IILjava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_26

    if-eq v1, v10, :cond_26

    if-ne v4, v10, :cond_2e

    .line 1394
    :cond_26
    new-instance v0, Ljavassist/compiler/CompileError;

    const-string v2, "invalid cast"

    invoke-direct {v0, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1396
    :cond_2e
    const/16 v0, 0x133

    if-ne v4, v0, :cond_45

    .line 1397
    invoke-static {v1}, Ljavassist/compiler/CodeGen;->isRefType(I)Z

    move-result v0

    if-nez v0, :cond_40

    .line 1398
    new-instance v0, Ljavassist/compiler/CompileError;

    const-string v2, "invalid cast"

    invoke-direct {v0, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1400
    :cond_40
    invoke-static {p2, v5}, Ljavassist/compiler/CodeGen;->toJvmArrayName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 1406
    :goto_44
    return-object v0

    .line 1403
    :cond_45
    if-lez v5, :cond_4c

    .line 1404
    invoke-static {v4, v5}, Ljavassist/compiler/CodeGen;->toJvmTypeName(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_44

    .line 1406
    :cond_4c
    const/4 v0, 0x0

    goto :goto_44
.end method

.method private compareExpr(ZIILjavassist/compiler/ast/BinExpr;)V
    .registers 14
    .param p1, "branchIf"    # Z
    .param p2, "token"    # I
    .param p3, "type1"    # I
    .param p4, "expr"    # Ljavassist/compiler/ast/BinExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v4, 0xa6

    const/16 v3, 0xa5

    const/16 v8, 0x3c

    const/4 v6, 0x2

    const/4 v5, 0x1

    .line 1206
    iget v7, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-nez v7, :cond_11

    .line 1207
    iget v7, p0, Ljavassist/compiler/CodeGen;->exprType:I

    invoke-direct {p0, p3, v7, p4}, Ljavassist/compiler/CodeGen;->convertOprandTypes(IILjavassist/compiler/ast/Expr;)V

    .line 1209
    :cond_11
    iget v7, p0, Ljavassist/compiler/CodeGen;->exprType:I

    invoke-static {v7}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v2

    .line 1210
    .local v2, "p":I
    const/4 v7, -0x1

    if-eq v2, v7, :cond_1e

    iget v7, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-lez v7, :cond_3e

    .line 1211
    :cond_1e
    const/16 v5, 0x166

    if-ne p2, v5, :cond_2c

    .line 1212
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-eqz p1, :cond_2a

    :goto_26
    invoke-virtual {v5, v3}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1253
    :goto_29
    return-void

    :cond_2a
    move v3, v4

    .line 1212
    goto :goto_26

    .line 1213
    :cond_2c
    const/16 v5, 0x15e

    if-ne p2, v5, :cond_3a

    .line 1214
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-eqz p1, :cond_38

    :goto_34
    invoke-virtual {v5, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_29

    :cond_38
    move v4, v3

    goto :goto_34

    .line 1216
    :cond_3a
    invoke-static {p4}, Ljavassist/compiler/CodeGen;->badTypes(Ljavassist/compiler/ast/Expr;)V

    goto :goto_29

    .line 1218
    :cond_3e
    const/4 v3, 0x3

    if-ne v2, v3, :cond_60

    .line 1219
    sget-object v1, Ljavassist/compiler/CodeGen;->ifOp:[I

    .line 1220
    .local v1, "op":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_44
    array-length v3, v1

    if-ge v0, v3, :cond_5c

    .line 1221
    aget v3, v1, v0

    if-ne v3, p2, :cond_59

    .line 1222
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-eqz p1, :cond_57

    move v3, v5

    :goto_50
    add-int/2addr v3, v0

    aget v3, v1, v3

    invoke-virtual {v4, v3}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_29

    :cond_57
    move v3, v6

    goto :goto_50

    .line 1220
    :cond_59
    add-int/lit8 v0, v0, 0x3

    goto :goto_44

    .line 1226
    :cond_5c
    invoke-static {p4}, Ljavassist/compiler/CodeGen;->badTypes(Ljavassist/compiler/ast/Expr;)V

    goto :goto_29

    .line 1229
    .end local v0    # "i":I
    .end local v1    # "op":[I
    :cond_60
    if-nez v2, :cond_8d

    .line 1230
    if-eq p2, v8, :cond_68

    const/16 v3, 0x165

    if-ne p2, v3, :cond_85

    .line 1231
    :cond_68
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x98

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1244
    :goto_6f
    sget-object v1, Ljavassist/compiler/CodeGen;->ifOp2:[I

    .line 1245
    .restart local v1    # "op":[I
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_72
    array-length v3, v1

    if-ge v0, v3, :cond_b8

    .line 1246
    aget v3, v1, v0

    if-ne v3, p2, :cond_b5

    .line 1247
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-eqz p1, :cond_b3

    :goto_7d
    add-int v4, v0, v5

    aget v4, v1, v4

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_29

    .line 1233
    .end local v0    # "i":I
    .end local v1    # "op":[I
    :cond_85
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x97

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_6f

    .line 1234
    :cond_8d
    if-ne v2, v5, :cond_a5

    .line 1235
    if-eq p2, v8, :cond_95

    const/16 v3, 0x165

    if-ne p2, v3, :cond_9d

    .line 1236
    :cond_95
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x96

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_6f

    .line 1238
    :cond_9d
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x95

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_6f

    .line 1239
    :cond_a5
    if-ne v2, v6, :cond_af

    .line 1240
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0x94

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_6f

    .line 1242
    :cond_af
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    goto :goto_6f

    .restart local v0    # "i":I
    .restart local v1    # "op":[I
    :cond_b3
    move v5, v6

    .line 1247
    goto :goto_7d

    .line 1245
    :cond_b5
    add-int/lit8 v0, v0, 0x3

    goto :goto_72

    .line 1251
    :cond_b8
    invoke-static {p4}, Ljavassist/compiler/CodeGen;->badTypes(Ljavassist/compiler/ast/Expr;)V

    goto/16 :goto_29
.end method

.method private compileOprands(Ljavassist/compiler/ast/BinExpr;)I
    .registers 6
    .param p1, "expr"    # Ljavassist/compiler/ast/BinExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v3, 0x19c

    .line 1167
    invoke-virtual {p1}, Ljavassist/compiler/ast/BinExpr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 1168
    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1169
    .local v1, "type1":I
    iget v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1170
    .local v0, "dim1":I
    invoke-virtual {p1}, Ljavassist/compiler/ast/BinExpr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 1171
    iget v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-eq v0, v2, :cond_2c

    .line 1172
    if-eq v1, v3, :cond_26

    iget v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    if-eq v2, v3, :cond_26

    .line 1173
    new-instance v2, Ljavassist/compiler/CompileError;

    const-string v3, "incompatible array types"

    invoke-direct {v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1174
    :cond_26
    iget v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    if-ne v2, v3, :cond_2c

    .line 1175
    iput v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1177
    :cond_2c
    if-ne v1, v3, :cond_30

    .line 1178
    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1180
    .end local v1    # "type1":I
    :cond_30
    return v1
.end method

.method private computeLabel(Ljavassist/compiler/ast/ASTree;)I
    .registers 4
    .param p1, "expr"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 565
    invoke-virtual {p0, p1}, Ljavassist/compiler/CodeGen;->doTypeCheck(Ljavassist/compiler/ast/ASTree;)V

    .line 566
    invoke-static {p1}, Ljavassist/compiler/TypeChecker;->stripPlusExpr(Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTree;

    move-result-object p1

    .line 567
    instance-of v0, p1, Ljavassist/compiler/ast/IntConst;

    if-eqz v0, :cond_13

    .line 568
    check-cast p1, Ljavassist/compiler/ast/IntConst;

    .end local p1    # "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p1}, Ljavassist/compiler/ast/IntConst;->get()J

    move-result-wide v0

    long-to-int v0, v0

    return v0

    .line 570
    .restart local p1    # "expr":Ljavassist/compiler/ast/ASTree;
    :cond_13
    new-instance v0, Ljavassist/compiler/CompileError;

    const-string v1, "bad case label"

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private convToString(II)V
    .registers 8
    .param p1, "type"    # I
    .param p2, "dim"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1063
    const-string v0, "valueOf"

    .line 1065
    .local v0, "method":Ljava/lang/String;
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->isRefType(I)Z

    move-result v1

    if-nez v1, :cond_a

    if-lez p2, :cond_16

    .line 1066
    :cond_a
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v2, "java.lang.String"

    const-string v3, "valueOf"

    const-string v4, "(Ljava/lang/Object;)Ljava/lang/String;"

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1088
    :goto_15
    return-void

    .line 1068
    :cond_16
    const/16 v1, 0x138

    if-ne p1, v1, :cond_26

    .line 1069
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v2, "java.lang.String"

    const-string v3, "valueOf"

    const-string v4, "(D)Ljava/lang/String;"

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15

    .line 1071
    :cond_26
    const/16 v1, 0x13d

    if-ne p1, v1, :cond_36

    .line 1072
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v2, "java.lang.String"

    const-string v3, "valueOf"

    const-string v4, "(F)Ljava/lang/String;"

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15

    .line 1074
    :cond_36
    const/16 v1, 0x146

    if-ne p1, v1, :cond_46

    .line 1075
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v2, "java.lang.String"

    const-string v3, "valueOf"

    const-string v4, "(J)Ljava/lang/String;"

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15

    .line 1077
    :cond_46
    const/16 v1, 0x12d

    if-ne p1, v1, :cond_56

    .line 1078
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v2, "java.lang.String"

    const-string v3, "valueOf"

    const-string v4, "(Z)Ljava/lang/String;"

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15

    .line 1080
    :cond_56
    const/16 v1, 0x132

    if-ne p1, v1, :cond_66

    .line 1081
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v2, "java.lang.String"

    const-string v3, "valueOf"

    const-string v4, "(C)Ljava/lang/String;"

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15

    .line 1083
    :cond_66
    const/16 v1, 0x158

    if-ne p1, v1, :cond_72

    .line 1084
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "void type expression"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1086
    :cond_72
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v2, "java.lang.String"

    const-string v3, "valueOf"

    const-string v4, "(I)Ljava/lang/String;"

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15
.end method

.method private convertOprandTypes(IILjavassist/compiler/ast/Expr;)V
    .registers 15
    .param p1, "type1"    # I
    .param p2, "type2"    # I
    .param p3, "expr"    # Ljavassist/compiler/ast/Expr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v10, 0x5f

    const/16 v9, 0x5e

    const/16 v8, 0x58

    const/4 v7, 0x2

    .line 1310
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v3

    .line 1311
    .local v3, "type1_p":I
    invoke-static {p2}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v4

    .line 1313
    .local v4, "type2_p":I
    if-gez v4, :cond_14

    if-gez v3, :cond_14

    .line 1360
    :cond_13
    :goto_13
    return-void

    .line 1316
    :cond_14
    if-ltz v4, :cond_18

    if-gez v3, :cond_1b

    .line 1317
    :cond_18
    invoke-static {p3}, Ljavassist/compiler/CodeGen;->badTypes(Ljavassist/compiler/ast/Expr;)V

    .line 1320
    :cond_1b
    if-gt v3, v4, :cond_4c

    .line 1321
    const/4 v2, 0x0

    .line 1322
    .local v2, "rightStrong":Z
    iput p1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1323
    sget-object v5, Ljavassist/compiler/CodeGen;->castOp:[I

    mul-int/lit8 v6, v4, 0x4

    add-int/2addr v6, v3

    aget v0, v5, v6

    .line 1324
    .local v0, "op":I
    move v1, v3

    .line 1332
    .local v1, "result_type":I
    :goto_28
    if-eqz v2, :cond_86

    .line 1333
    if-eqz v1, :cond_2e

    if-ne v1, v7, :cond_5e

    .line 1334
    :cond_2e
    if-eqz v3, :cond_32

    if-ne v3, v7, :cond_56

    .line 1335
    :cond_32
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v9}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1339
    :goto_37
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v8}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1340
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1341
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v9}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1342
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v8}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_13

    .line 1327
    .end local v0    # "op":I
    .end local v1    # "result_type":I
    .end local v2    # "rightStrong":Z
    :cond_4c
    const/4 v2, 0x1

    .line 1328
    .restart local v2    # "rightStrong":Z
    sget-object v5, Ljavassist/compiler/CodeGen;->castOp:[I

    mul-int/lit8 v6, v3, 0x4

    add-int/2addr v6, v4

    aget v0, v5, v6

    .line 1329
    .restart local v0    # "op":I
    move v1, v4

    .restart local v1    # "result_type":I
    goto :goto_28

    .line 1337
    :cond_56
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v6, 0x5d

    invoke-virtual {v5, v6}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_37

    .line 1344
    :cond_5e
    const/4 v5, 0x1

    if-ne v1, v5, :cond_82

    .line 1345
    if-ne v3, v7, :cond_7c

    .line 1346
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v6, 0x5b

    invoke-virtual {v5, v6}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1347
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v6, 0x57

    invoke-virtual {v5, v6}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1352
    :goto_71
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1353
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v10}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_13

    .line 1350
    :cond_7c
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v10}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_71

    .line 1356
    :cond_82
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    goto :goto_13

    .line 1358
    :cond_86
    if-eqz v0, :cond_13

    .line 1359
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v5, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_13
.end method

.method protected static fatal()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 99
    new-instance v0, Ljavassist/compiler/CompileError;

    const-string v1, "fatal"

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected static getArrayReadOp(II)I
    .registers 3
    .param p0, "type"    # I
    .param p1, "dim"    # I

    .prologue
    const/16 v0, 0x32

    .line 1637
    if-lez p1, :cond_5

    .line 1657
    :goto_4
    return v0

    .line 1640
    :cond_5
    sparse-switch p0, :sswitch_data_1e

    goto :goto_4

    .line 1655
    :sswitch_9
    const/16 v0, 0x33

    goto :goto_4

    .line 1642
    :sswitch_c
    const/16 v0, 0x31

    goto :goto_4

    .line 1644
    :sswitch_f
    const/16 v0, 0x30

    goto :goto_4

    .line 1646
    :sswitch_12
    const/16 v0, 0x2f

    goto :goto_4

    .line 1648
    :sswitch_15
    const/16 v0, 0x2e

    goto :goto_4

    .line 1650
    :sswitch_18
    const/16 v0, 0x35

    goto :goto_4

    .line 1652
    :sswitch_1b
    const/16 v0, 0x34

    goto :goto_4

    .line 1640
    :sswitch_data_1e
    .sparse-switch
        0x12d -> :sswitch_9
        0x12f -> :sswitch_9
        0x132 -> :sswitch_1b
        0x138 -> :sswitch_c
        0x13d -> :sswitch_f
        0x144 -> :sswitch_15
        0x146 -> :sswitch_12
        0x14e -> :sswitch_18
    .end sparse-switch
.end method

.method protected static getArrayWriteOp(II)I
    .registers 3
    .param p0, "type"    # I
    .param p1, "dim"    # I

    .prologue
    const/16 v0, 0x53

    .line 1662
    if-lez p1, :cond_5

    .line 1682
    :goto_4
    return v0

    .line 1665
    :cond_5
    sparse-switch p0, :sswitch_data_1e

    goto :goto_4

    .line 1680
    :sswitch_9
    const/16 v0, 0x54

    goto :goto_4

    .line 1667
    :sswitch_c
    const/16 v0, 0x52

    goto :goto_4

    .line 1669
    :sswitch_f
    const/16 v0, 0x51

    goto :goto_4

    .line 1671
    :sswitch_12
    const/16 v0, 0x50

    goto :goto_4

    .line 1673
    :sswitch_15
    const/16 v0, 0x4f

    goto :goto_4

    .line 1675
    :sswitch_18
    const/16 v0, 0x56

    goto :goto_4

    .line 1677
    :sswitch_1b
    const/16 v0, 0x55

    goto :goto_4

    .line 1665
    :sswitch_data_1e
    .sparse-switch
        0x12d -> :sswitch_9
        0x12f -> :sswitch_9
        0x132 -> :sswitch_1b
        0x138 -> :sswitch_c
        0x13d -> :sswitch_f
        0x144 -> :sswitch_15
        0x146 -> :sswitch_12
        0x14e -> :sswitch_18
    .end sparse-switch
.end method

.method static getCompOperator(Ljavassist/compiler/ast/ASTree;)I
    .registers 5
    .param p0, "expr"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v2, 0x21

    .line 1150
    instance-of v3, p0, Ljavassist/compiler/ast/Expr;

    if-eqz v3, :cond_28

    move-object v0, p0

    .line 1151
    check-cast v0, Ljavassist/compiler/ast/Expr;

    .line 1152
    .local v0, "bexpr":Ljavassist/compiler/ast/Expr;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v1

    .line 1153
    .local v1, "token":I
    if-ne v1, v2, :cond_11

    move v1, v2

    .line 1163
    .end local v0    # "bexpr":Ljavassist/compiler/ast/Expr;
    .end local v1    # "token":I
    :cond_10
    :goto_10
    return v1

    .line 1155
    .restart local v0    # "bexpr":Ljavassist/compiler/ast/Expr;
    .restart local v1    # "token":I
    :cond_11
    instance-of v2, v0, Ljavassist/compiler/ast/BinExpr;

    if-eqz v2, :cond_10

    const/16 v2, 0x170

    if-eq v1, v2, :cond_10

    const/16 v2, 0x171

    if-eq v1, v2, :cond_10

    const/16 v2, 0x26

    if-eq v1, v2, :cond_10

    const/16 v2, 0x7c

    if-eq v1, v2, :cond_10

    .line 1158
    const/16 v1, 0x166

    goto :goto_10

    .line 1163
    .end local v0    # "bexpr":Ljavassist/compiler/ast/Expr;
    .end local v1    # "token":I
    :cond_28
    const/16 v1, 0x20

    goto :goto_10
.end method

.method private static getListSize(Ljava/util/ArrayList;)I
    .registers 2
    .param p0, "list"    # Ljava/util/ArrayList;

    .prologue
    .line 698
    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_3
.end method

.method private invalidDim(IILjava/lang/String;IILjava/lang/String;Z)Z
    .registers 11
    .param p1, "srcType"    # I
    .param p2, "srcDim"    # I
    .param p3, "srcClass"    # Ljava/lang/String;
    .param p4, "destType"    # I
    .param p5, "destDim"    # I
    .param p6, "destClass"    # Ljava/lang/String;
    .param p7, "isCast"    # Z

    .prologue
    const/16 v2, 0x133

    const/4 v0, 0x0

    .line 902
    if-eq p2, p5, :cond_9

    .line 903
    const/16 v1, 0x19c

    if-ne p1, v1, :cond_a

    .line 914
    :cond_9
    :goto_9
    return v0

    .line 905
    :cond_a
    if-nez p5, :cond_16

    if-ne p4, v2, :cond_16

    const-string v1, "java/lang/Object"

    invoke-virtual {v1, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 908
    :cond_16
    if-eqz p7, :cond_24

    if-nez p2, :cond_24

    if-ne p1, v2, :cond_24

    const-string v1, "java/lang/Object"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 912
    :cond_24
    const/4 v0, 0x1

    goto :goto_9
.end method

.method public static is2word(II)Z
    .registers 3
    .param p0, "type"    # I
    .param p1, "dim"    # I

    .prologue
    .line 103
    if-nez p1, :cond_c

    const/16 v0, 0x138

    if-eq p0, v0, :cond_a

    const/16 v0, 0x146

    if-ne p0, v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static isAlwaysBranch(Ljavassist/compiler/ast/ASTree;Z)Z
    .registers 6
    .param p0, "expr"    # Ljavassist/compiler/ast/ASTree;
    .param p1, "branchIf"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1141
    instance-of v3, p0, Ljavassist/compiler/ast/Keyword;

    if-eqz v3, :cond_1b

    .line 1142
    check-cast p0, Ljavassist/compiler/ast/Keyword;

    .end local p0    # "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0}, Ljavassist/compiler/ast/Keyword;->get()I

    move-result v0

    .line 1143
    .local v0, "t":I
    if-eqz p1, :cond_15

    const/16 v3, 0x19a

    if-ne v0, v3, :cond_13

    .line 1146
    .end local v0    # "t":I
    :cond_12
    :goto_12
    return v1

    .restart local v0    # "t":I
    :cond_13
    move v1, v2

    .line 1143
    goto :goto_12

    :cond_15
    const/16 v3, 0x19b

    if-eq v0, v3, :cond_12

    move v1, v2

    goto :goto_12

    .end local v0    # "t":I
    .restart local p0    # "expr":Ljavassist/compiler/ast/ASTree;
    :cond_1b
    move v1, v2

    .line 1146
    goto :goto_12
.end method

.method static isP_INT(I)Z
    .registers 3
    .param p0, "type"    # I

    .prologue
    .line 1286
    invoke-static {p0}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method private static isPlusPlusExpr(Ljavassist/compiler/ast/ASTree;)Z
    .registers 4
    .param p0, "expr"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    const/4 v1, 0x0

    .line 702
    instance-of v2, p0, Ljavassist/compiler/ast/Expr;

    if-eqz v2, :cond_14

    .line 703
    check-cast p0, Ljavassist/compiler/ast/Expr;

    .end local p0    # "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v0

    .line 704
    .local v0, "op":I
    const/16 v2, 0x16a

    if-eq v0, v2, :cond_13

    const/16 v2, 0x16b

    if-ne v0, v2, :cond_14

    :cond_13
    const/4 v1, 0x1

    .line 707
    :cond_14
    return v1
.end method

.method protected static isRefType(I)Z
    .registers 2
    .param p0, "type"    # I

    .prologue
    .line 1266
    const/16 v0, 0x133

    if-eq p0, v0, :cond_8

    const/16 v0, 0x19c

    if-ne p0, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method static lookupBinOp(I)I
    .registers 5
    .param p0, "token"    # I

    .prologue
    .line 948
    sget-object v0, Ljavassist/compiler/CodeGen;->binOp:[I

    .line 949
    .local v0, "code":[I
    array-length v2, v0

    .line 950
    .local v2, "s":I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_4
    if-ge v1, v2, :cond_e

    .line 951
    aget v3, v0, v1

    if-ne v3, p0, :cond_b

    .line 954
    .end local v1    # "k":I
    :goto_a
    return v1

    .line 950
    .restart local v1    # "k":I
    :cond_b
    add-int/lit8 v1, v1, 0x5

    goto :goto_4

    .line 954
    :cond_e
    const/4 v1, -0x1

    goto :goto_a
.end method

.method private needsSuperCall(Ljavassist/compiler/ast/Stmnt;)Z
    .registers 8
    .param p1, "body"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 303
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->getOperator()I

    move-result v3

    const/16 v5, 0x42

    if-ne v3, v5, :cond_f

    .line 304
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object p1

    .end local p1    # "body":Ljavassist/compiler/ast/Stmnt;
    check-cast p1, Ljavassist/compiler/ast/Stmnt;

    .line 306
    .restart local p1    # "body":Ljavassist/compiler/ast/Stmnt;
    :cond_f
    if-eqz p1, :cond_4a

    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->getOperator()I

    move-result v3

    const/16 v5, 0x45

    if-ne v3, v5, :cond_4a

    .line 307
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 308
    .local v0, "expr":Ljavassist/compiler/ast/ASTree;
    if-eqz v0, :cond_4a

    instance-of v3, v0, Ljavassist/compiler/ast/Expr;

    if-eqz v3, :cond_4a

    move-object v3, v0

    check-cast v3, Ljavassist/compiler/ast/Expr;

    invoke-virtual {v3}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v3

    const/16 v5, 0x43

    if-ne v3, v5, :cond_4a

    .line 310
    check-cast v0, Ljavassist/compiler/ast/Expr;

    .end local v0    # "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 311
    .local v1, "target":Ljavassist/compiler/ast/ASTree;
    instance-of v3, v1, Ljavassist/compiler/ast/Keyword;

    if-eqz v3, :cond_4a

    .line 312
    check-cast v1, Ljavassist/compiler/ast/Keyword;

    .end local v1    # "target":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v1}, Ljavassist/compiler/ast/Keyword;->get()I

    move-result v2

    .line 313
    .local v2, "token":I
    const/16 v3, 0x153

    if-eq v2, v3, :cond_48

    const/16 v3, 0x150

    if-eq v2, v3, :cond_48

    move v3, v4

    .line 318
    .end local v2    # "token":I
    :goto_47
    return v3

    .line 313
    .restart local v2    # "token":I
    :cond_48
    const/4 v3, 0x0

    goto :goto_47

    .end local v2    # "token":I
    :cond_4a
    move v3, v4

    .line 318
    goto :goto_47
.end method

.method static rightIsStrong(II)Z
    .registers 5
    .param p0, "type1"    # I
    .param p1, "type2"    # I

    .prologue
    .line 1291
    invoke-static {p0}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v0

    .line 1292
    .local v0, "type1_p":I
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v1

    .line 1293
    .local v1, "type2_p":I
    if-ltz v0, :cond_10

    if-ltz v1, :cond_10

    if-le v0, v1, :cond_10

    const/4 v2, 0x1

    :goto_f
    return v2

    :cond_10
    const/4 v2, 0x0

    goto :goto_f
.end method

.method protected static toJvmArrayName(Ljava/lang/String;I)Ljava/lang/String;
    .registers 6
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "dim"    # I

    .prologue
    .line 169
    if-nez p0, :cond_4

    .line 170
    const/4 p0, 0x0

    .line 184
    .end local p0    # "name":Ljava/lang/String;
    :cond_3
    :goto_3
    return-object p0

    .line 172
    .restart local p0    # "name":Ljava/lang/String;
    :cond_4
    if-eqz p1, :cond_3

    .line 175
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 176
    .local v2, "sbuf":Ljava/lang/StringBuffer;
    move v0, p1

    .local v0, "d":I
    move v1, v0

    .line 177
    .end local v0    # "d":I
    .local v1, "d":I
    :goto_d
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "d":I
    .restart local v0    # "d":I
    if-lez v1, :cond_18

    .line 178
    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move v1, v0

    .end local v0    # "d":I
    .restart local v1    # "d":I
    goto :goto_d

    .line 180
    .end local v1    # "d":I
    .restart local v0    # "d":I
    :cond_18
    const/16 v3, 0x4c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 181
    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 182
    const/16 v3, 0x3b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 184
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_3
.end method

.method protected static toJvmTypeName(II)Ljava/lang/String;
    .registers 6
    .param p0, "type"    # I
    .param p1, "dim"    # I

    .prologue
    .line 189
    const/16 v0, 0x49

    .line 190
    .local v0, "c":C
    sparse-switch p0, :sswitch_data_3a

    .line 220
    :goto_5
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .local v2, "sbuf":Ljava/lang/StringBuffer;
    move v1, p1

    .line 221
    .end local p1    # "dim":I
    .local v1, "dim":I
    :goto_b
    add-int/lit8 p1, v1, -0x1

    .end local v1    # "dim":I
    .restart local p1    # "dim":I
    if-lez v1, :cond_31

    .line 222
    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move v1, p1

    .end local p1    # "dim":I
    .restart local v1    # "dim":I
    goto :goto_b

    .line 192
    .end local v1    # "dim":I
    .end local v2    # "sbuf":Ljava/lang/StringBuffer;
    .restart local p1    # "dim":I
    :sswitch_16
    const/16 v0, 0x5a

    .line 193
    goto :goto_5

    .line 195
    :sswitch_19
    const/16 v0, 0x42

    .line 196
    goto :goto_5

    .line 198
    :sswitch_1c
    const/16 v0, 0x43

    .line 199
    goto :goto_5

    .line 201
    :sswitch_1f
    const/16 v0, 0x53

    .line 202
    goto :goto_5

    .line 204
    :sswitch_22
    const/16 v0, 0x49

    .line 205
    goto :goto_5

    .line 207
    :sswitch_25
    const/16 v0, 0x4a

    .line 208
    goto :goto_5

    .line 210
    :sswitch_28
    const/16 v0, 0x46

    .line 211
    goto :goto_5

    .line 213
    :sswitch_2b
    const/16 v0, 0x44

    .line 214
    goto :goto_5

    .line 216
    :sswitch_2e
    const/16 v0, 0x56

    goto :goto_5

    .line 224
    .restart local v2    # "sbuf":Ljava/lang/StringBuffer;
    :cond_31
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 225
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 190
    nop

    :sswitch_data_3a
    .sparse-switch
        0x12d -> :sswitch_16
        0x12f -> :sswitch_19
        0x132 -> :sswitch_1c
        0x138 -> :sswitch_2b
        0x13d -> :sswitch_28
        0x144 -> :sswitch_22
        0x146 -> :sswitch_25
        0x14e -> :sswitch_1f
        0x158 -> :sswitch_2e
    .end sparse-switch
.end method

.method private static typePrecedence(I)I
    .registers 3
    .param p0, "type"    # I

    .prologue
    const/4 v0, -0x1

    .line 1270
    const/16 v1, 0x138

    if-ne p0, v1, :cond_7

    .line 1271
    const/4 v0, 0x0

    .line 1281
    :cond_6
    :goto_6
    return v0

    .line 1272
    :cond_7
    const/16 v1, 0x13d

    if-ne p0, v1, :cond_d

    .line 1273
    const/4 v0, 0x1

    goto :goto_6

    .line 1274
    :cond_d
    const/16 v1, 0x146

    if-ne p0, v1, :cond_13

    .line 1275
    const/4 v0, 0x2

    goto :goto_6

    .line 1276
    :cond_13
    invoke-static {p0}, Ljavassist/compiler/CodeGen;->isRefType(I)Z

    move-result v1

    if-nez v1, :cond_6

    .line 1278
    const/16 v1, 0x158

    if-eq p0, v1, :cond_6

    .line 1281
    const/4 v0, 0x3

    goto :goto_6
.end method


# virtual methods
.method protected arrayAccess(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V
    .registers 8
    .param p1, "array"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "index"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1619
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 1620
    iget v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1621
    .local v2, "type":I
    iget v1, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1622
    .local v1, "dim":I
    if-nez v1, :cond_11

    .line 1623
    new-instance v3, Ljavassist/compiler/CompileError;

    const-string v4, "bad array access"

    invoke-direct {v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1625
    :cond_11
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 1627
    .local v0, "cname":Ljava/lang/String;
    invoke-virtual {p2, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 1628
    iget v3, p0, Ljavassist/compiler/CodeGen;->exprType:I

    invoke-static {v3}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_23

    iget v3, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-lez v3, :cond_2b

    .line 1629
    :cond_23
    new-instance v3, Ljavassist/compiler/CompileError;

    const-string v4, "bad array index"

    invoke-direct {v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1631
    :cond_2b
    iput v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1632
    add-int/lit8 v3, v1, -0x1

    iput v3, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1633
    iput-object v0, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 1634
    return-void
.end method

.method public atASTList(Ljavassist/compiler/ast/ASTList;)V
    .registers 2
    .param p1, "n"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 245
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    return-void
.end method

.method public abstract atArrayInit(Ljavassist/compiler/ast/ArrayInit;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method public atArrayPlusPlus(IZLjavassist/compiler/ast/Expr;Z)V
    .registers 13
    .param p1, "token"    # I
    .param p2, "isPost"    # Z
    .param p3, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p4, "doDup"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1776
    invoke-virtual {p3}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    invoke-virtual {p3}, Ljavassist/compiler/ast/Expr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Ljavassist/compiler/CodeGen;->arrayAccess(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V

    .line 1777
    iget v7, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1778
    .local v7, "t":I
    iget v6, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1779
    .local v6, "dim":I
    if-lez v6, :cond_14

    .line 1780
    invoke-static {p3}, Ljavassist/compiler/CodeGen;->badType(Ljavassist/compiler/ast/Expr;)V

    .line 1782
    :cond_14
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v2, 0x5c

    invoke-virtual {v0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1783
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    invoke-static {v7, v2}, Ljavassist/compiler/CodeGen;->getArrayReadOp(II)I

    move-result v2

    invoke-virtual {v0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1784
    invoke-static {v7, v6}, Ljavassist/compiler/CodeGen;->is2word(II)Z

    move-result v0

    if-eqz v0, :cond_40

    const/16 v1, 0x5e

    .local v1, "dup_code":I
    :goto_2e
    move-object v0, p0

    move v2, p4

    move v3, p1

    move v4, p2

    move-object v5, p3

    .line 1785
    invoke-virtual/range {v0 .. v5}, Ljavassist/compiler/CodeGen;->atPlusPlusCore(IZIZLjavassist/compiler/ast/Expr;)V

    .line 1786
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-static {v7, v6}, Ljavassist/compiler/CodeGen;->getArrayWriteOp(II)I

    move-result v2

    invoke-virtual {v0, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1787
    return-void

    .line 1784
    .end local v1    # "dup_code":I
    :cond_40
    const/16 v1, 0x5b

    goto :goto_2e
.end method

.method public atArrayRead(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V
    .registers 6
    .param p1, "array"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "index"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1612
    invoke-virtual {p0, p1, p2}, Ljavassist/compiler/CodeGen;->arrayAccess(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V

    .line 1613
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    iget v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    invoke-static {v1, v2}, Ljavassist/compiler/CodeGen;->getArrayReadOp(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1614
    return-void
.end method

.method protected abstract atArrayVariableAssign(Ljavassist/compiler/ast/ArrayInit;IILjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method protected atAssignCore(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;IILjava/lang/String;)V
    .registers 17
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p2, "op"    # I
    .param p3, "right"    # Ljavassist/compiler/ast/ASTree;
    .param p4, "type"    # I
    .param p5, "dim"    # I
    .param p6, "cname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 857
    const/16 v0, 0x162

    if-ne p2, v0, :cond_26

    if-nez p5, :cond_26

    const/16 v0, 0x133

    if-ne p4, v0, :cond_26

    move-object v0, p0

    move-object v1, p1

    move v2, p4

    move v3, p5

    move-object/from16 v4, p6

    move-object v5, p3

    .line 858
    invoke-direct/range {v0 .. v5}, Ljavassist/compiler/CodeGen;->atStringPlusEq(Ljavassist/compiler/ast/Expr;IILjava/lang/String;Ljavassist/compiler/ast/ASTree;)V

    .line 875
    :cond_14
    :goto_14
    const/16 v0, 0x3d

    if-ne p2, v0, :cond_20

    if-nez p5, :cond_25

    invoke-static {p4}, Ljavassist/compiler/CodeGen;->isRefType(I)Z

    move-result v0

    if-nez v0, :cond_25

    .line 876
    :cond_20
    iget v0, p0, Ljavassist/compiler/CodeGen;->exprType:I

    invoke-virtual {p0, v0, p4}, Ljavassist/compiler/CodeGen;->atNumCastExpr(II)V

    .line 879
    :cond_25
    return-void

    .line 860
    :cond_26
    invoke-virtual {p3, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 861
    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    iget v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    iget-object v3, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    const/4 v7, 0x0

    move-object v0, p0

    move v4, p4

    move v5, p5

    move-object/from16 v6, p6

    invoke-direct/range {v0 .. v7}, Ljavassist/compiler/CodeGen;->invalidDim(IILjava/lang/String;IILjava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_41

    const/16 v0, 0x3d

    if-eq p2, v0, :cond_44

    if-lez p5, :cond_44

    .line 863
    :cond_41
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badAssign(Ljavassist/compiler/ast/Expr;)V

    .line 865
    :cond_44
    const/16 v0, 0x3d

    if-eq p2, v0, :cond_14

    .line 866
    sget-object v0, Ljavassist/compiler/CodeGen;->assignOps:[I

    add-int/lit16 v1, p2, -0x15f

    aget v9, v0, v1

    .line 867
    .local v9, "token":I
    invoke-static {v9}, Ljavassist/compiler/CodeGen;->lookupBinOp(I)I

    move-result v8

    .line 868
    .local v8, "k":I
    if-gez v8, :cond_57

    .line 869
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    .line 871
    :cond_57
    invoke-direct {p0, p1, v9, v8, p4}, Ljavassist/compiler/CodeGen;->atArithBinExpr(Ljavassist/compiler/ast/Expr;III)V

    goto :goto_14
.end method

.method public atAssignExpr(Ljavassist/compiler/ast/AssignExpr;)V
    .registers 3
    .param p1, "expr"    # Ljavassist/compiler/ast/AssignExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 736
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Ljavassist/compiler/CodeGen;->atAssignExpr(Ljavassist/compiler/ast/AssignExpr;Z)V

    .line 737
    return-void
.end method

.method protected atAssignExpr(Ljavassist/compiler/ast/AssignExpr;Z)V
    .registers 16
    .param p1, "expr"    # Ljavassist/compiler/ast/AssignExpr;
    .param p2, "doDup"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 743
    invoke-virtual {p1}, Ljavassist/compiler/ast/AssignExpr;->getOperator()I

    move-result v2

    .line 744
    .local v2, "op":I
    invoke-virtual {p1}, Ljavassist/compiler/ast/AssignExpr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v9

    .line 745
    .local v9, "left":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p1}, Ljavassist/compiler/ast/AssignExpr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v5

    .line 746
    .local v5, "right":Ljavassist/compiler/ast/ASTree;
    instance-of v0, v9, Ljavassist/compiler/ast/Variable;

    if-eqz v0, :cond_20

    move-object v3, v9

    .line 747
    check-cast v3, Ljavassist/compiler/ast/Variable;

    check-cast v9, Ljavassist/compiler/ast/Variable;

    .end local v9    # "left":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v9}, Ljavassist/compiler/ast/Variable;->getDeclarator()Ljavassist/compiler/ast/Declarator;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move v6, p2

    invoke-direct/range {v0 .. v6}, Ljavassist/compiler/CodeGen;->atVariableAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/Variable;Ljavassist/compiler/ast/Declarator;Ljavassist/compiler/ast/ASTree;Z)V

    .line 761
    :goto_1f
    return-void

    .line 751
    .restart local v9    # "left":Ljavassist/compiler/ast/ASTree;
    :cond_20
    instance-of v0, v9, Ljavassist/compiler/ast/Expr;

    if-eqz v0, :cond_3a

    move-object v12, v9

    .line 752
    check-cast v12, Ljavassist/compiler/ast/Expr;

    .line 753
    .local v12, "e":Ljavassist/compiler/ast/Expr;
    invoke-virtual {v12}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v0

    const/16 v1, 0x41

    if-ne v0, v1, :cond_3a

    .line 754
    check-cast v9, Ljavassist/compiler/ast/Expr;

    .end local v9    # "left":Ljavassist/compiler/ast/ASTree;
    move-object v6, p0

    move-object v7, p1

    move v8, v2

    move-object v10, v5

    move v11, p2

    invoke-direct/range {v6 .. v11}, Ljavassist/compiler/CodeGen;->atArrayAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/Expr;Ljavassist/compiler/ast/ASTree;Z)V

    goto :goto_1f

    .end local v12    # "e":Ljavassist/compiler/ast/Expr;
    .restart local v9    # "left":Ljavassist/compiler/ast/ASTree;
    :cond_3a
    move-object v6, p0

    move-object v7, p1

    move v8, v2

    move-object v10, v5

    move v11, p2

    .line 759
    invoke-virtual/range {v6 .. v11}, Ljavassist/compiler/CodeGen;->atFieldAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Z)V

    goto :goto_1f
.end method

.method public atBinExpr(Ljavassist/compiler/ast/BinExpr;)V
    .registers 11
    .param p1, "expr"    # Ljavassist/compiler/ast/BinExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v7, 0x133

    const/4 v8, 0x1

    .line 958
    invoke-virtual {p1}, Ljavassist/compiler/ast/BinExpr;->getOperator()I

    move-result v4

    .line 962
    .local v4, "token":I
    invoke-static {v4}, Ljavassist/compiler/CodeGen;->lookupBinOp(I)I

    move-result v2

    .line 963
    .local v2, "k":I
    if-ltz v2, :cond_44

    .line 964
    invoke-virtual {p1}, Ljavassist/compiler/ast/BinExpr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 965
    invoke-virtual {p1}, Ljavassist/compiler/ast/BinExpr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    .line 966
    .local v3, "right":Ljavassist/compiler/ast/ASTree;
    if-nez v3, :cond_1b

    .line 992
    .end local v3    # "right":Ljavassist/compiler/ast/ASTree;
    :goto_1a
    return-void

    .line 969
    .restart local v3    # "right":Ljavassist/compiler/ast/ASTree;
    :cond_1b
    iget v5, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 970
    .local v5, "type1":I
    iget v1, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 971
    .local v1, "dim1":I
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 972
    .local v0, "cname1":Ljava/lang/String;
    invoke-virtual {v3, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 973
    iget v6, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-eq v1, v6, :cond_30

    .line 974
    new-instance v6, Ljavassist/compiler/CompileError;

    const-string v7, "incompatible array types"

    invoke-direct {v6, v7}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v6

    .line 976
    :cond_30
    const/16 v6, 0x2b

    if-ne v4, v6, :cond_40

    if-nez v1, :cond_40

    if-eq v5, v7, :cond_3c

    iget v6, p0, Ljavassist/compiler/CodeGen;->exprType:I

    if-ne v6, v7, :cond_40

    .line 978
    :cond_3c
    invoke-direct {p0, p1, v5, v1, v0}, Ljavassist/compiler/CodeGen;->atStringConcatExpr(Ljavassist/compiler/ast/Expr;IILjava/lang/String;)V

    goto :goto_1a

    .line 980
    :cond_40
    invoke-direct {p0, p1, v4, v2, v5}, Ljavassist/compiler/CodeGen;->atArithBinExpr(Ljavassist/compiler/ast/Expr;III)V

    goto :goto_1a

    .line 985
    .end local v0    # "cname1":Ljava/lang/String;
    .end local v1    # "dim1":I
    .end local v3    # "right":Ljavassist/compiler/ast/ASTree;
    .end local v5    # "type1":I
    :cond_44
    invoke-direct {p0, v8, p1}, Ljavassist/compiler/CodeGen;->booleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    .line 986
    iget-object v6, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v7, 0x7

    invoke-virtual {v6, v7}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 987
    iget-object v6, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 988
    iget-object v6, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v7, 0xa7

    invoke-virtual {v6, v7}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 989
    iget-object v6, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v7, 0x4

    invoke-virtual {v6, v7}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 990
    iget-object v6, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v6, v8}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    goto :goto_1a
.end method

.method public abstract atCallExpr(Ljavassist/compiler/ast/CallExpr;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
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
    .line 1363
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getClassName()Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljavassist/compiler/CodeGen;->resolveClassName(Ljavassist/compiler/ast/ASTList;)Ljava/lang/String;

    move-result-object v0

    .line 1364
    .local v0, "cname":Ljava/lang/String;
    invoke-direct {p0, p1, v0}, Ljavassist/compiler/CodeGen;->checkCastExpr(Ljavassist/compiler/ast/CastExpr;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1365
    .local v2, "toClass":Ljava/lang/String;
    iget v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1366
    .local v1, "srcType":I
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getType()I

    move-result v3

    iput v3, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1367
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getArrayDim()I

    move-result v3

    iput v3, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1368
    iput-object v0, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 1369
    if-nez v2, :cond_24

    .line 1370
    iget v3, p0, Ljavassist/compiler/CodeGen;->exprType:I

    invoke-virtual {p0, v1, v3}, Ljavassist/compiler/CodeGen;->atNumCastExpr(II)V

    .line 1373
    :goto_23
    return-void

    .line 1372
    :cond_24
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3, v2}, Ljavassist/bytecode/Bytecode;->addCheckcast(Ljava/lang/String;)V

    goto :goto_23
.end method

.method public atClassObject(Ljavassist/compiler/ast/Expr;)V
    .registers 11
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1534
    invoke-virtual {p1}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v5

    .line 1535
    .local v5, "op1":Ljavassist/compiler/ast/ASTree;
    instance-of v7, v5, Ljavassist/compiler/ast/Symbol;

    if-nez v7, :cond_10

    .line 1536
    new-instance v7, Ljavassist/compiler/CompileError;

    const-string v8, "fatal error: badly parsed .class expr"

    invoke-direct {v7, v8}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1538
    :cond_10
    check-cast v5, Ljavassist/compiler/ast/Symbol;

    .end local v5    # "op1":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v5}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v0

    .line 1539
    .local v0, "cname":Ljava/lang/String;
    const-string v7, "["

    invoke-virtual {v0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_73

    .line 1540
    const-string v7, "[L"

    invoke-virtual {v0, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 1541
    .local v1, "i":I
    if-ltz v1, :cond_64

    .line 1542
    add-int/lit8 v7, v1, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v0, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 1543
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {p0, v3}, Ljavassist/compiler/CodeGen;->resolveClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1544
    .local v4, "name2":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_64

    .line 1549
    invoke-static {v4}, Ljavassist/compiler/MemberResolver;->jvmToJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1550
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .local v6, "sbuf":Ljava/lang/StringBuffer;
    move v2, v1

    .line 1551
    .end local v1    # "i":I
    .local v2, "i":I
    :goto_46
    add-int/lit8 v1, v2, -0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    if-ltz v2, :cond_51

    .line 1552
    const/16 v7, 0x5b

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_46

    .line 1554
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_51
    const/16 v7, 0x4c

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const/16 v8, 0x3b

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1555
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1564
    .end local v1    # "i":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "name2":Ljava/lang/String;
    .end local v6    # "sbuf":Ljava/lang/StringBuffer;
    :cond_64
    :goto_64
    invoke-virtual {p0, v0}, Ljavassist/compiler/CodeGen;->atClassObject2(Ljava/lang/String;)V

    .line 1565
    const/16 v7, 0x133

    iput v7, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1566
    const/4 v7, 0x0

    iput v7, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1567
    const-string v7, "java/lang/Class"

    iput-object v7, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 1568
    return-void

    .line 1560
    :cond_73
    invoke-static {v0}, Ljavassist/compiler/MemberResolver;->javaToJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljavassist/compiler/CodeGen;->resolveClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1561
    invoke-static {v0}, Ljavassist/compiler/MemberResolver;->jvmToJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_64
.end method

.method protected atClassObject2(Ljava/lang/String;)V
    .registers 9
    .param p1, "cname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1573
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v2

    .line 1574
    .local v2, "start":I
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3, p1}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 1575
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v4, "java.lang.Class"

    const-string v5, "forName"

    const-string v6, "(Ljava/lang/String;)Ljava/lang/Class;"

    invoke-virtual {v3, v4, v5, v6}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1577
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v0

    .line 1578
    .local v0, "end":I
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0xa7

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1579
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v1

    .line 1580
    .local v1, "pc":I
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1582
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    const-string v5, "java.lang.ClassNotFoundException"

    invoke-virtual {v3, v2, v0, v4, v5}, Ljavassist/bytecode/Bytecode;->addExceptionHandler(IIILjava/lang/String;)V

    .line 1601
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 1602
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-string v4, "javassist.runtime.DotClass"

    const-string v5, "fail"

    const-string v6, "(Ljava/lang/ClassNotFoundException;)Ljava/lang/NoClassDefFoundError;"

    invoke-virtual {v3, v4, v5, v6}, Ljavassist/bytecode/Bytecode;->addInvokestatic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1605
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0xbf

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1606
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    sub-int/2addr v4, v1

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v1, v4}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 1607
    return-void
.end method

.method public atCondExpr(Ljavassist/compiler/ast/CondExpr;)V
    .registers 8
    .param p1, "expr"    # Ljavassist/compiler/ast/CondExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 918
    invoke-virtual {p1}, Ljavassist/compiler/ast/CondExpr;->condExpr()Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    invoke-direct {p0, v5, v3}, Ljavassist/compiler/CodeGen;->booleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    .line 919
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v1

    .line 920
    .local v1, "pc":I
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3, v5}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 921
    invoke-virtual {p1}, Ljavassist/compiler/ast/CondExpr;->thenExpr()Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 922
    iget v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 923
    .local v0, "dim1":I
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v4, 0xa7

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 924
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v2

    .line 925
    .local v2, "pc2":I
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3, v5}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 926
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    sub-int/2addr v4, v1

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v1, v4}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 927
    invoke-virtual {p1}, Ljavassist/compiler/ast/CondExpr;->elseExpr()Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 928
    iget v3, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-eq v0, v3, :cond_4f

    .line 929
    new-instance v3, Ljavassist/compiler/CompileError;

    const-string v4, "type mismatch in ?:"

    invoke-direct {v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 931
    :cond_4f
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v4

    sub-int/2addr v4, v2

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v2, v4}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 932
    return-void
.end method

.method public atDeclarator(Ljavassist/compiler/ast/Declarator;)V
    .registers 10
    .param p1, "d"    # Ljavassist/compiler/ast/Declarator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 711
    invoke-virtual {p0}, Ljavassist/compiler/CodeGen;->getMaxLocals()I

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/compiler/ast/Declarator;->setLocalVar(I)V

    .line 712
    invoke-virtual {p1}, Ljavassist/compiler/ast/Declarator;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljavassist/compiler/CodeGen;->resolveClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/compiler/ast/Declarator;->setClassName(Ljava/lang/String;)V

    .line 715
    invoke-virtual {p1}, Ljavassist/compiler/ast/Declarator;->getType()I

    move-result v0

    invoke-virtual {p1}, Ljavassist/compiler/ast/Declarator;->getArrayDim()I

    move-result v2

    invoke-static {v0, v2}, Ljavassist/compiler/CodeGen;->is2word(II)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 716
    const/4 v7, 0x2

    .line 720
    .local v7, "size":I
    :goto_22
    invoke-virtual {p0, v7}, Ljavassist/compiler/CodeGen;->incMaxLocals(I)V

    .line 724
    invoke-virtual {p1}, Ljavassist/compiler/ast/Declarator;->getInitializer()Ljavassist/compiler/ast/ASTree;

    move-result-object v5

    .line 725
    .local v5, "init":Ljavassist/compiler/ast/ASTree;
    if-eqz v5, :cond_37

    .line 726
    invoke-virtual {p0, v5}, Ljavassist/compiler/CodeGen;->doTypeCheck(Ljavassist/compiler/ast/ASTree;)V

    .line 727
    const/16 v2, 0x3d

    const/4 v6, 0x0

    move-object v0, p0

    move-object v3, v1

    move-object v4, p1

    invoke-direct/range {v0 .. v6}, Ljavassist/compiler/CodeGen;->atVariableAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/Variable;Ljavassist/compiler/ast/Declarator;Ljavassist/compiler/ast/ASTree;Z)V

    .line 729
    :cond_37
    return-void

    .line 718
    .end local v5    # "init":Ljavassist/compiler/ast/ASTree;
    .end local v7    # "size":I
    :cond_38
    const/4 v7, 0x1

    .restart local v7    # "size":I
    goto :goto_22
.end method

.method public atDoubleConst(Ljavassist/compiler/ast/DoubleConst;)V
    .registers 5
    .param p1, "d"    # Ljavassist/compiler/ast/DoubleConst;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1912
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1913
    invoke-virtual {p1}, Ljavassist/compiler/ast/DoubleConst;->getType()I

    move-result v0

    const/16 v1, 0x195

    if-ne v0, v1, :cond_19

    .line 1914
    const/16 v0, 0x138

    iput v0, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1915
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {p1}, Ljavassist/compiler/ast/DoubleConst;->get()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/Bytecode;->addDconst(D)V

    .line 1921
    :goto_18
    return-void

    .line 1918
    :cond_19
    const/16 v0, 0x13d

    iput v0, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1919
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {p1}, Ljavassist/compiler/ast/DoubleConst;->get()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addFconst(F)V

    goto :goto_18
.end method

.method public atExpr(Ljavassist/compiler/ast/Expr;)V
    .registers 12
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v5, -0x1

    const/4 v6, 0x1

    .line 1450
    invoke-virtual {p1}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v2

    .line 1451
    .local v2, "token":I
    invoke-virtual {p1}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 1452
    .local v1, "oprand":Ljavassist/compiler/ast/ASTree;
    const/16 v4, 0x2e

    if-ne v2, v4, :cond_2b

    .line 1453
    invoke-virtual {p1}, Ljavassist/compiler/ast/Expr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v4

    check-cast v4, Ljavassist/compiler/ast/Symbol;

    invoke-virtual {v4}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v0

    .line 1454
    .local v0, "member":Ljava/lang/String;
    const-string v4, "class"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 1455
    invoke-virtual {p0, p1}, Ljavassist/compiler/CodeGen;->atClassObject(Ljavassist/compiler/ast/Expr;)V

    .line 1523
    .end local v0    # "member":Ljava/lang/String;
    :cond_26
    :goto_26
    return-void

    .line 1457
    .restart local v0    # "member":Ljava/lang/String;
    :cond_27
    invoke-virtual {p0, p1}, Ljavassist/compiler/CodeGen;->atFieldRead(Ljavassist/compiler/ast/ASTree;)V

    goto :goto_26

    .line 1459
    .end local v0    # "member":Ljava/lang/String;
    :cond_2b
    const/16 v4, 0x23

    if-ne v2, v4, :cond_33

    .line 1464
    invoke-virtual {p0, p1}, Ljavassist/compiler/CodeGen;->atFieldRead(Ljavassist/compiler/ast/ASTree;)V

    goto :goto_26

    .line 1466
    :cond_33
    const/16 v4, 0x41

    if-ne v2, v4, :cond_3f

    .line 1467
    invoke-virtual {p1}, Ljavassist/compiler/ast/Expr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Ljavassist/compiler/CodeGen;->atArrayRead(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V

    goto :goto_26

    .line 1468
    :cond_3f
    const/16 v4, 0x16a

    if-eq v2, v4, :cond_47

    const/16 v4, 0x16b

    if-ne v2, v4, :cond_4b

    .line 1469
    :cond_47
    invoke-direct {p0, v2, v1, p1, v6}, Ljavassist/compiler/CodeGen;->atPlusPlus(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/Expr;Z)V

    goto :goto_26

    .line 1470
    :cond_4b
    const/16 v4, 0x21

    if-ne v2, v4, :cond_70

    .line 1471
    invoke-direct {p0, v7, p1}, Ljavassist/compiler/CodeGen;->booleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    .line 1472
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v5, 0x7

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1473
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4, v6}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1474
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v5, 0xa7

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1475
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 1476
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4, v7}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    goto :goto_26

    .line 1478
    :cond_70
    const/16 v4, 0x43

    if-ne v2, v4, :cond_78

    .line 1479
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    goto :goto_26

    .line 1481
    :cond_78
    invoke-virtual {p1}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 1482
    iget v4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    invoke-static {v4}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v3

    .line 1483
    .local v3, "type":I
    iget v4, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-lez v4, :cond_8c

    .line 1484
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badType(Ljavassist/compiler/ast/Expr;)V

    .line 1486
    :cond_8c
    const/16 v4, 0x2d

    if-ne v2, v4, :cond_c3

    .line 1487
    if-nez v3, :cond_9a

    .line 1488
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v5, 0x77

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_26

    .line 1489
    :cond_9a
    if-ne v3, v6, :cond_a4

    .line 1490
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v5, 0x76

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_26

    .line 1491
    :cond_a4
    if-ne v3, v8, :cond_af

    .line 1492
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v5, 0x75

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto/16 :goto_26

    .line 1493
    :cond_af
    if-ne v3, v9, :cond_be

    .line 1494
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v5, 0x74

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1495
    const/16 v4, 0x144

    iput v4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    goto/16 :goto_26

    .line 1498
    :cond_be
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badType(Ljavassist/compiler/ast/Expr;)V

    goto/16 :goto_26

    .line 1500
    :cond_c3
    const/16 v4, 0x7e

    if-ne v2, v4, :cond_f2

    .line 1501
    if-ne v3, v9, :cond_db

    .line 1502
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1503
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v5, 0x82

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1504
    const/16 v4, 0x144

    iput v4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    goto/16 :goto_26

    .line 1506
    :cond_db
    if-ne v3, v8, :cond_ed

    .line 1507
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-wide/16 v5, -0x1

    invoke-virtual {v4, v5, v6}, Ljavassist/bytecode/Bytecode;->addLconst(J)V

    .line 1508
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v5, 0x83

    invoke-virtual {v4, v5}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto/16 :goto_26

    .line 1511
    :cond_ed
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badType(Ljavassist/compiler/ast/Expr;)V

    goto/16 :goto_26

    .line 1514
    :cond_f2
    const/16 v4, 0x2b

    if-ne v2, v4, :cond_fd

    .line 1515
    if-ne v3, v5, :cond_26

    .line 1516
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->badType(Ljavassist/compiler/ast/Expr;)V

    goto/16 :goto_26

    .line 1521
    :cond_fd
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    goto/16 :goto_26
.end method

.method protected abstract atFieldAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method public atFieldDecl(Ljavassist/compiler/ast/FieldDecl;)V
    .registers 3
    .param p1, "field"    # Ljavassist/compiler/ast/FieldDecl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 252
    invoke-virtual {p1}, Ljavassist/compiler/ast/FieldDecl;->getInit()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 253
    return-void
.end method

.method protected abstract atFieldPlusPlus(IZLjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/Expr;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method protected abstract atFieldRead(Ljavassist/compiler/ast/ASTree;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method public atInstanceOfExpr(Ljavassist/compiler/ast/InstanceOfExpr;)V
    .registers 5
    .param p1, "expr"    # Ljavassist/compiler/ast/InstanceOfExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1376
    invoke-virtual {p1}, Ljavassist/compiler/ast/InstanceOfExpr;->getClassName()Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljavassist/compiler/CodeGen;->resolveClassName(Ljavassist/compiler/ast/ASTList;)Ljava/lang/String;

    move-result-object v0

    .line 1377
    .local v0, "cname":Ljava/lang/String;
    invoke-direct {p0, p1, v0}, Ljavassist/compiler/CodeGen;->checkCastExpr(Ljavassist/compiler/ast/CastExpr;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1378
    .local v1, "toClass":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addInstanceof(Ljava/lang/String;)V

    .line 1379
    const/16 v2, 0x12d

    iput v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1380
    const/4 v2, 0x0

    iput v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1381
    return-void
.end method

.method public atIntConst(Ljavassist/compiler/ast/IntConst;)V
    .registers 7
    .param p1, "i"    # Ljavassist/compiler/ast/IntConst;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v4, 0x192

    .line 1898
    const/4 v3, 0x0

    iput v3, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1899
    invoke-virtual {p1}, Ljavassist/compiler/ast/IntConst;->get()J

    move-result-wide v1

    .line 1900
    .local v1, "value":J
    invoke-virtual {p1}, Ljavassist/compiler/ast/IntConst;->getType()I

    move-result v0

    .line 1901
    .local v0, "type":I
    if-eq v0, v4, :cond_13

    const/16 v3, 0x191

    if-ne v0, v3, :cond_23

    .line 1902
    :cond_13
    if-ne v0, v4, :cond_20

    const/16 v3, 0x144

    :goto_17
    iput v3, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1903
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    long-to-int v4, v1

    invoke-virtual {v3, v4}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1909
    :goto_1f
    return-void

    .line 1902
    :cond_20
    const/16 v3, 0x132

    goto :goto_17

    .line 1906
    :cond_23
    const/16 v3, 0x146

    iput v3, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1907
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3, v1, v2}, Ljavassist/bytecode/Bytecode;->addLconst(J)V

    goto :goto_1f
.end method

.method public atKeyword(Ljavassist/compiler/ast/Keyword;)V
    .registers 8
    .param p1, "k"    # Ljavassist/compiler/ast/Keyword;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v5, 0x153

    const/16 v4, 0x12d

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1857
    iput v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1858
    invoke-virtual {p1}, Ljavassist/compiler/ast/Keyword;->get()I

    move-result v0

    .line 1859
    .local v0, "token":I
    sparse-switch v0, :sswitch_data_6a

    .line 1886
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    .line 1888
    :goto_12
    return-void

    .line 1861
    :sswitch_13
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v1, v3}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1862
    iput v4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    goto :goto_12

    .line 1865
    :sswitch_1b
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1866
    iput v4, p0, Ljavassist/compiler/CodeGen;->exprType:I

    goto :goto_12

    .line 1869
    :sswitch_23
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v1, v3}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1870
    const/16 v1, 0x19c

    iput v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    goto :goto_12

    .line 1874
    :sswitch_2d
    iget-boolean v1, p0, Ljavassist/compiler/CodeGen;->inStaticMethod:Z

    if-eqz v1, :cond_51

    .line 1875
    new-instance v2, Ljavassist/compiler/CompileError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "not-available: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-ne v0, v5, :cond_4e

    const-string v1, "this"

    :goto_42
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_4e
    const-string v1, "super"

    goto :goto_42

    .line 1878
    :cond_51
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1879
    const/16 v1, 0x133

    iput v1, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1880
    if-ne v0, v5, :cond_63

    .line 1881
    invoke-virtual {p0}, Ljavassist/compiler/CodeGen;->getThisName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    goto :goto_12

    .line 1883
    :cond_63
    invoke-virtual {p0}, Ljavassist/compiler/CodeGen;->getSuperName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    goto :goto_12

    .line 1859
    :sswitch_data_6a
    .sparse-switch
        0x150 -> :sswitch_2d
        0x153 -> :sswitch_2d
        0x19a -> :sswitch_13
        0x19b -> :sswitch_1b
        0x19c -> :sswitch_23
    .end sparse-switch
.end method

.method public abstract atMember(Ljavassist/compiler/ast/Member;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method public atMethodBody(Ljavassist/compiler/ast/Stmnt;ZZ)V
    .registers 6
    .param p1, "s"    # Ljavassist/compiler/ast/Stmnt;
    .param p2, "isCons"    # Z
    .param p3, "isVoid"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 285
    if-nez p1, :cond_3

    .line 300
    :cond_2
    :goto_2
    return-void

    .line 288
    :cond_3
    if-eqz p2, :cond_e

    invoke-direct {p0, p1}, Ljavassist/compiler/CodeGen;->needsSuperCall(Ljavassist/compiler/ast/Stmnt;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 289
    invoke-virtual {p0}, Ljavassist/compiler/CodeGen;->insertDefaultSuperCall()V

    .line 291
    :cond_e
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 292
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Stmnt;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 293
    iget-boolean v0, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    if-nez v0, :cond_2

    .line 294
    if-eqz p3, :cond_25

    .line 295
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v1, 0xb1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 296
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    goto :goto_2

    .line 299
    :cond_25
    new-instance v0, Ljavassist/compiler/CompileError;

    const-string v1, "no return statement"

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public atMethodDecl(Ljavassist/compiler/ast/MethodDecl;)V
    .registers 11
    .param p1, "method"    # Ljavassist/compiler/ast/MethodDecl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 256
    invoke-virtual {p1}, Ljavassist/compiler/ast/MethodDecl;->getModifiers()Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    .line 257
    .local v1, "mods":Ljavassist/compiler/ast/ASTList;
    invoke-virtual {p0, v5}, Ljavassist/compiler/CodeGen;->setMaxLocals(I)V

    .line 258
    :cond_9
    :goto_9
    if-eqz v1, :cond_23

    .line 259
    invoke-virtual {v1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/Keyword;

    .line 260
    .local v0, "k":Ljavassist/compiler/ast/Keyword;
    invoke-virtual {v1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    .line 261
    invoke-virtual {v0}, Ljavassist/compiler/ast/Keyword;->get()I

    move-result v4

    const/16 v7, 0x14f

    if-ne v4, v7, :cond_9

    .line 262
    invoke-virtual {p0, v6}, Ljavassist/compiler/CodeGen;->setMaxLocals(I)V

    .line 263
    iput-boolean v5, p0, Ljavassist/compiler/CodeGen;->inStaticMethod:Z

    goto :goto_9

    .line 267
    .end local v0    # "k":Ljavassist/compiler/ast/Keyword;
    :cond_23
    invoke-virtual {p1}, Ljavassist/compiler/ast/MethodDecl;->getParams()Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    .line 268
    .local v2, "params":Ljavassist/compiler/ast/ASTList;
    :goto_27
    if-eqz v2, :cond_37

    .line 269
    invoke-virtual {v2}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v4

    check-cast v4, Ljavassist/compiler/ast/Declarator;

    invoke-virtual {p0, v4}, Ljavassist/compiler/CodeGen;->atDeclarator(Ljavassist/compiler/ast/Declarator;)V

    .line 270
    invoke-virtual {v2}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    goto :goto_27

    .line 273
    :cond_37
    invoke-virtual {p1}, Ljavassist/compiler/ast/MethodDecl;->getBody()Ljavassist/compiler/ast/Stmnt;

    move-result-object v3

    .line 274
    .local v3, "s":Ljavassist/compiler/ast/Stmnt;
    invoke-virtual {p1}, Ljavassist/compiler/ast/MethodDecl;->isConstructor()Z

    move-result v7

    invoke-virtual {p1}, Ljavassist/compiler/ast/MethodDecl;->getReturn()Ljavassist/compiler/ast/Declarator;

    move-result-object v4

    invoke-virtual {v4}, Ljavassist/compiler/ast/Declarator;->getType()I

    move-result v4

    const/16 v8, 0x158

    if-ne v4, v8, :cond_50

    move v4, v5

    :goto_4c
    invoke-virtual {p0, v3, v7, v4}, Ljavassist/compiler/CodeGen;->atMethodBody(Ljavassist/compiler/ast/Stmnt;ZZ)V

    .line 276
    return-void

    :cond_50
    move v4, v6

    .line 274
    goto :goto_4c
.end method

.method public abstract atNewExpr(Ljavassist/compiler/ast/NewExpr;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method atNumCastExpr(II)V
    .registers 9
    .param p1, "srcType"    # I
    .param p2, "destType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1412
    if-ne p1, p2, :cond_3

    .line 1444
    :cond_2
    :goto_2
    return-void

    .line 1416
    :cond_3
    invoke-static {p1}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v3

    .line 1417
    .local v3, "stype":I
    invoke-static {p2}, Ljavassist/compiler/CodeGen;->typePrecedence(I)I

    move-result v0

    .line 1418
    .local v0, "dtype":I
    if-ltz v3, :cond_3a

    const/4 v4, 0x3

    if-ge v3, v4, :cond_3a

    .line 1419
    sget-object v4, Ljavassist/compiler/CodeGen;->castOp:[I

    mul-int/lit8 v5, v3, 0x4

    add-int/2addr v5, v0

    aget v1, v4, v5

    .line 1423
    .local v1, "op":I
    :goto_17
    const/16 v4, 0x138

    if-ne p2, v4, :cond_3c

    .line 1424
    const/16 v2, 0x87

    .line 1438
    .local v2, "op2":I
    :goto_1d
    if-eqz v1, :cond_24

    .line 1439
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1441
    :cond_24
    if-eqz v1, :cond_32

    const/16 v4, 0x88

    if-eq v1, v4, :cond_32

    const/16 v4, 0x8b

    if-eq v1, v4, :cond_32

    const/16 v4, 0x8e

    if-ne v1, v4, :cond_2

    .line 1442
    :cond_32
    if-eqz v2, :cond_2

    .line 1443
    iget-object v4, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v4, v2}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_2

    .line 1421
    .end local v1    # "op":I
    .end local v2    # "op2":I
    :cond_3a
    const/4 v1, 0x0

    .restart local v1    # "op":I
    goto :goto_17

    .line 1425
    :cond_3c
    const/16 v4, 0x13d

    if-ne p2, v4, :cond_43

    .line 1426
    const/16 v2, 0x86

    .restart local v2    # "op2":I
    goto :goto_1d

    .line 1427
    .end local v2    # "op2":I
    :cond_43
    const/16 v4, 0x146

    if-ne p2, v4, :cond_4a

    .line 1428
    const/16 v2, 0x85

    .restart local v2    # "op2":I
    goto :goto_1d

    .line 1429
    .end local v2    # "op2":I
    :cond_4a
    const/16 v4, 0x14e

    if-ne p2, v4, :cond_51

    .line 1430
    const/16 v2, 0x93

    .restart local v2    # "op2":I
    goto :goto_1d

    .line 1431
    .end local v2    # "op2":I
    :cond_51
    const/16 v4, 0x132

    if-ne p2, v4, :cond_58

    .line 1432
    const/16 v2, 0x92

    .restart local v2    # "op2":I
    goto :goto_1d

    .line 1433
    .end local v2    # "op2":I
    :cond_58
    const/16 v4, 0x12f

    if-ne p2, v4, :cond_5f

    .line 1434
    const/16 v2, 0x91

    .restart local v2    # "op2":I
    goto :goto_1d

    .line 1436
    .end local v2    # "op2":I
    :cond_5f
    const/4 v2, 0x0

    .restart local v2    # "op2":I
    goto :goto_1d
.end method

.method public atPair(Ljavassist/compiler/ast/Pair;)V
    .registers 2
    .param p1, "n"    # Ljavassist/compiler/ast/Pair;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 247
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    return-void
.end method

.method protected atPlusPlusCore(IZIZLjavassist/compiler/ast/Expr;)V
    .registers 11
    .param p1, "dup_code"    # I
    .param p2, "doDup"    # Z
    .param p3, "token"    # I
    .param p4, "isPost"    # Z
    .param p5, "expr"    # Ljavassist/compiler/ast/Expr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v3, 0x144

    const/16 v4, 0x16a

    .line 1793
    iget v0, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1795
    .local v0, "t":I
    if-eqz p2, :cond_f

    if-eqz p4, :cond_f

    .line 1796
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1798
    :cond_f
    if-eq v0, v3, :cond_1d

    const/16 v1, 0x12f

    if-eq v0, v1, :cond_1d

    const/16 v1, 0x132

    if-eq v0, v1, :cond_1d

    const/16 v1, 0x14e

    if-ne v0, v1, :cond_3b

    .line 1799
    :cond_1d
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addIconst(I)V

    .line 1800
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-ne p3, v4, :cond_38

    const/16 v1, 0x60

    :goto_29
    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1801
    iput v3, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1818
    :goto_2e
    if-eqz p2, :cond_37

    if-nez p4, :cond_37

    .line 1819
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 1820
    :cond_37
    return-void

    .line 1800
    :cond_38
    const/16 v1, 0x64

    goto :goto_29

    .line 1803
    :cond_3b
    const/16 v1, 0x146

    if-ne v0, v1, :cond_53

    .line 1804
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-wide/16 v2, 0x1

    invoke-virtual {v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addLconst(J)V

    .line 1805
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-ne p3, v4, :cond_50

    const/16 v1, 0x61

    :goto_4c
    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_2e

    :cond_50
    const/16 v1, 0x65

    goto :goto_4c

    .line 1807
    :cond_53
    const/16 v1, 0x13d

    if-ne v0, v1, :cond_6b

    .line 1808
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Ljavassist/bytecode/Bytecode;->addFconst(F)V

    .line 1809
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-ne p3, v4, :cond_68

    const/16 v1, 0x62

    :goto_64
    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_2e

    :cond_68
    const/16 v1, 0x66

    goto :goto_64

    .line 1811
    :cond_6b
    const/16 v1, 0x138

    if-ne v0, v1, :cond_83

    .line 1812
    iget-object v1, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v1, v2, v3}, Ljavassist/bytecode/Bytecode;->addDconst(D)V

    .line 1813
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    if-ne p3, v4, :cond_80

    const/16 v1, 0x63

    :goto_7c
    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_2e

    :cond_80
    const/16 v1, 0x67

    goto :goto_7c

    .line 1816
    :cond_83
    invoke-static {p5}, Ljavassist/compiler/CodeGen;->badType(Ljavassist/compiler/ast/Expr;)V

    goto :goto_2e
.end method

.method protected atReturnStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 3
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 590
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljavassist/compiler/CodeGen;->atReturnStmnt2(Ljavassist/compiler/ast/ASTree;)V

    .line 591
    return-void
.end method

.method protected final atReturnStmnt2(Ljavassist/compiler/ast/ASTree;)V
    .registers 7
    .param p1, "result"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 595
    if-nez p1, :cond_14

    .line 596
    const/16 v1, 0xb1

    .line 616
    .local v1, "op":I
    :goto_5
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->returnHooks:Ljavassist/compiler/CodeGen$ReturnHook;

    .local v0, "har":Ljavassist/compiler/CodeGen$ReturnHook;
    :goto_7
    if-eqz v0, :cond_44

    .line 617
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, v3, v1}, Ljavassist/compiler/CodeGen$ReturnHook;->doit(Ljavassist/bytecode/Bytecode;I)Z

    move-result v3

    if-eqz v3, :cond_41

    .line 618
    iput-boolean v4, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 624
    :goto_13
    return-void

    .line 598
    .end local v0    # "har":Ljavassist/compiler/CodeGen$ReturnHook;
    .end local v1    # "op":I
    :cond_14
    invoke-virtual {p0, p1}, Ljavassist/compiler/CodeGen;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 599
    iget v3, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-lez v3, :cond_1e

    .line 600
    const/16 v1, 0xb0

    .restart local v1    # "op":I
    goto :goto_5

    .line 602
    .end local v1    # "op":I
    :cond_1e
    iget v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 603
    .local v2, "type":I
    const/16 v3, 0x138

    if-ne v2, v3, :cond_27

    .line 604
    const/16 v1, 0xaf

    .restart local v1    # "op":I
    goto :goto_5

    .line 605
    .end local v1    # "op":I
    :cond_27
    const/16 v3, 0x13d

    if-ne v2, v3, :cond_2e

    .line 606
    const/16 v1, 0xae

    .restart local v1    # "op":I
    goto :goto_5

    .line 607
    .end local v1    # "op":I
    :cond_2e
    const/16 v3, 0x146

    if-ne v2, v3, :cond_35

    .line 608
    const/16 v1, 0xad

    .restart local v1    # "op":I
    goto :goto_5

    .line 609
    .end local v1    # "op":I
    :cond_35
    invoke-static {v2}, Ljavassist/compiler/CodeGen;->isRefType(I)Z

    move-result v3

    if-eqz v3, :cond_3e

    .line 610
    const/16 v1, 0xb0

    .restart local v1    # "op":I
    goto :goto_5

    .line 612
    .end local v1    # "op":I
    :cond_3e
    const/16 v1, 0xac

    .restart local v1    # "op":I
    goto :goto_5

    .line 616
    .end local v2    # "type":I
    .restart local v0    # "har":Ljavassist/compiler/CodeGen$ReturnHook;
    :cond_41
    iget-object v0, v0, Ljavassist/compiler/CodeGen$ReturnHook;->next:Ljavassist/compiler/CodeGen$ReturnHook;

    goto :goto_7

    .line 622
    :cond_44
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v3, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 623
    iput-boolean v4, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    goto :goto_13
.end method

.method public atStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 12
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v9, 0x15a

    const/16 v8, 0x12e

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 324
    if-nez p1, :cond_9

    .line 378
    :cond_8
    :goto_8
    return-void

    .line 327
    :cond_9
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->getOperator()I

    move-result v4

    .line 328
    .local v4, "op":I
    const/16 v7, 0x45

    if-ne v4, v7, :cond_5a

    .line 329
    invoke-virtual {p1}, Ljavassist/compiler/ast/Stmnt;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 330
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0, v1}, Ljavassist/compiler/CodeGen;->doTypeCheck(Ljavassist/compiler/ast/ASTree;)V

    .line 331
    instance-of v5, v1, Ljavassist/compiler/ast/AssignExpr;

    if-eqz v5, :cond_22

    .line 332
    check-cast v1, Ljavassist/compiler/ast/AssignExpr;

    .end local v1    # "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0, v1, v6}, Ljavassist/compiler/CodeGen;->atAssignExpr(Ljavassist/compiler/ast/AssignExpr;Z)V

    goto :goto_8

    .line 333
    .restart local v1    # "expr":Ljavassist/compiler/ast/ASTree;
    :cond_22
    invoke-static {v1}, Ljavassist/compiler/CodeGen;->isPlusPlusExpr(Ljavassist/compiler/ast/ASTree;)Z

    move-result v5

    if-eqz v5, :cond_37

    move-object v0, v1

    .line 334
    check-cast v0, Ljavassist/compiler/ast/Expr;

    .line 335
    .local v0, "e":Ljavassist/compiler/ast/Expr;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v5

    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v7

    invoke-direct {p0, v5, v7, v0, v6}, Ljavassist/compiler/CodeGen;->atPlusPlus(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/Expr;Z)V

    goto :goto_8

    .line 338
    .end local v0    # "e":Ljavassist/compiler/ast/Expr;
    :cond_37
    invoke-virtual {v1, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 339
    iget v5, p0, Ljavassist/compiler/CodeGen;->exprType:I

    iget v6, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    invoke-static {v5, v6}, Ljavassist/compiler/CodeGen;->is2word(II)Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 340
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v6, 0x58

    invoke-virtual {v5, v6}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_8

    .line 341
    :cond_4c
    iget v5, p0, Ljavassist/compiler/CodeGen;->exprType:I

    const/16 v6, 0x158

    if-eq v5, v6, :cond_8

    .line 342
    iget-object v5, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    const/16 v6, 0x57

    invoke-virtual {v5, v6}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    goto :goto_8

    .line 345
    .end local v1    # "expr":Ljavassist/compiler/ast/ASTree;
    :cond_5a
    const/16 v7, 0x44

    if-eq v4, v7, :cond_62

    const/16 v7, 0x42

    if-ne v4, v7, :cond_73

    .line 346
    :cond_62
    move-object v3, p1

    .line 347
    .local v3, "list":Ljavassist/compiler/ast/ASTList;
    :cond_63
    :goto_63
    if-eqz v3, :cond_8

    .line 348
    invoke-virtual {v3}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .line 349
    .local v2, "h":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v3}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    .line 350
    if-eqz v2, :cond_63

    .line 351
    invoke-virtual {v2, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    goto :goto_63

    .line 354
    .end local v2    # "h":Ljavassist/compiler/ast/ASTree;
    .end local v3    # "list":Ljavassist/compiler/ast/ASTList;
    :cond_73
    const/16 v7, 0x140

    if-ne v4, v7, :cond_7b

    .line 355
    invoke-direct {p0, p1}, Ljavassist/compiler/CodeGen;->atIfStmnt(Ljavassist/compiler/ast/Stmnt;)V

    goto :goto_8

    .line 356
    :cond_7b
    if-eq v4, v9, :cond_81

    const/16 v7, 0x137

    if-ne v4, v7, :cond_89

    .line 357
    :cond_81
    if-ne v4, v9, :cond_87

    :goto_83
    invoke-direct {p0, p1, v5}, Ljavassist/compiler/CodeGen;->atWhileStmnt(Ljavassist/compiler/ast/Stmnt;Z)V

    goto :goto_8

    :cond_87
    move v5, v6

    goto :goto_83

    .line 358
    :cond_89
    const/16 v7, 0x13e

    if-ne v4, v7, :cond_92

    .line 359
    invoke-direct {p0, p1}, Ljavassist/compiler/CodeGen;->atForStmnt(Ljavassist/compiler/ast/Stmnt;)V

    goto/16 :goto_8

    .line 360
    :cond_92
    if-eq v4, v8, :cond_98

    const/16 v7, 0x135

    if-ne v4, v7, :cond_a1

    .line 361
    :cond_98
    if-ne v4, v8, :cond_9f

    :goto_9a
    invoke-direct {p0, p1, v5}, Ljavassist/compiler/CodeGen;->atBreakStmnt(Ljavassist/compiler/ast/Stmnt;Z)V

    goto/16 :goto_8

    :cond_9f
    move v5, v6

    goto :goto_9a

    .line 362
    :cond_a1
    const/16 v5, 0x14d

    if-ne v4, v5, :cond_aa

    .line 363
    invoke-virtual {p0, p1}, Ljavassist/compiler/CodeGen;->atReturnStmnt(Ljavassist/compiler/ast/Stmnt;)V

    goto/16 :goto_8

    .line 364
    :cond_aa
    const/16 v5, 0x154

    if-ne v4, v5, :cond_b3

    .line 365
    invoke-direct {p0, p1}, Ljavassist/compiler/CodeGen;->atThrowStmnt(Ljavassist/compiler/ast/Stmnt;)V

    goto/16 :goto_8

    .line 366
    :cond_b3
    const/16 v5, 0x157

    if-ne v4, v5, :cond_bc

    .line 367
    invoke-virtual {p0, p1}, Ljavassist/compiler/CodeGen;->atTryStmnt(Ljavassist/compiler/ast/Stmnt;)V

    goto/16 :goto_8

    .line 368
    :cond_bc
    const/16 v5, 0x151

    if-ne v4, v5, :cond_c5

    .line 369
    invoke-direct {p0, p1}, Ljavassist/compiler/CodeGen;->atSwitchStmnt(Ljavassist/compiler/ast/Stmnt;)V

    goto/16 :goto_8

    .line 370
    :cond_c5
    const/16 v5, 0x152

    if-ne v4, v5, :cond_ce

    .line 371
    invoke-direct {p0, p1}, Ljavassist/compiler/CodeGen;->atSyncStmnt(Ljavassist/compiler/ast/Stmnt;)V

    goto/16 :goto_8

    .line 374
    :cond_ce
    iput-boolean v6, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 375
    new-instance v5, Ljavassist/compiler/CompileError;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "sorry, not supported statement: TokenId "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public atStringL(Ljavassist/compiler/ast/StringL;)V
    .registers 4
    .param p1, "s"    # Ljavassist/compiler/ast/StringL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1891
    const/16 v0, 0x133

    iput v0, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1892
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1893
    const-string v0, "java/lang/String"

    iput-object v0, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 1894
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {p1}, Ljavassist/compiler/ast/StringL;->get()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/Bytecode;->addLdc(Ljava/lang/String;)V

    .line 1895
    return-void
.end method

.method public atSymbol(Ljavassist/compiler/ast/Symbol;)V
    .registers 2
    .param p1, "n"    # Ljavassist/compiler/ast/Symbol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 249
    invoke-static {}, Ljavassist/compiler/CodeGen;->fatal()V

    return-void
.end method

.method protected atTryStmnt(Ljavassist/compiler/ast/Stmnt;)V
    .registers 3
    .param p1, "st"    # Ljavassist/compiler/ast/Stmnt;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 639
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljavassist/compiler/CodeGen;->hasReturned:Z

    .line 640
    return-void
.end method

.method public atVariable(Ljavassist/compiler/ast/Variable;)V
    .registers 5
    .param p1, "v"    # Ljavassist/compiler/ast/Variable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1828
    invoke-virtual {p1}, Ljavassist/compiler/ast/Variable;->getDeclarator()Ljavassist/compiler/ast/Declarator;

    move-result-object v0

    .line 1829
    .local v0, "d":Ljavassist/compiler/ast/Declarator;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Declarator;->getType()I

    move-result v2

    iput v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    .line 1830
    invoke-virtual {v0}, Ljavassist/compiler/ast/Declarator;->getArrayDim()I

    move-result v2

    iput v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    .line 1831
    invoke-virtual {v0}, Ljavassist/compiler/ast/Declarator;->getClassName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Ljavassist/compiler/CodeGen;->className:Ljava/lang/String;

    .line 1832
    invoke-virtual {p0, v0}, Ljavassist/compiler/CodeGen;->getLocalVar(Ljavassist/compiler/ast/Declarator;)I

    move-result v1

    .line 1834
    .local v1, "var":I
    iget v2, p0, Ljavassist/compiler/CodeGen;->arrayDim:I

    if-lez v2, :cond_24

    .line 1835
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 1854
    :goto_23
    return-void

    .line 1837
    :cond_24
    iget v2, p0, Ljavassist/compiler/CodeGen;->exprType:I

    sparse-switch v2, :sswitch_data_48

    .line 1851
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addIload(I)V

    goto :goto_23

    .line 1839
    :sswitch_2f
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    goto :goto_23

    .line 1842
    :sswitch_35
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addLload(I)V

    goto :goto_23

    .line 1845
    :sswitch_3b
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addFload(I)V

    goto :goto_23

    .line 1848
    :sswitch_41
    iget-object v2, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/Bytecode;->addDload(I)V

    goto :goto_23

    .line 1837
    nop

    :sswitch_data_48
    .sparse-switch
        0x133 -> :sswitch_2f
        0x138 -> :sswitch_41
        0x13d -> :sswitch_3b
        0x146 -> :sswitch_35
    .end sparse-switch
.end method

.method public compileBooleanExpr(ZLjavassist/compiler/ast/ASTree;)Z
    .registers 4
    .param p1, "branchIf"    # Z
    .param p2, "expr"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 236
    invoke-virtual {p0, p2}, Ljavassist/compiler/CodeGen;->doTypeCheck(Ljavassist/compiler/ast/ASTree;)V

    .line 237
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/CodeGen;->booleanExpr(ZLjavassist/compiler/ast/ASTree;)Z

    move-result v0

    return v0
.end method

.method public compileExpr(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "expr"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 229
    invoke-virtual {p0, p1}, Ljavassist/compiler/CodeGen;->doTypeCheck(Ljavassist/compiler/ast/ASTree;)V

    .line 230
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 231
    return-void
.end method

.method public doTypeCheck(Ljavassist/compiler/ast/ASTree;)V
    .registers 3
    .param p1, "expr"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 241
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->typeChecker:Ljavassist/compiler/TypeChecker;

    if-eqz v0, :cond_9

    .line 242
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->typeChecker:Ljavassist/compiler/TypeChecker;

    invoke-virtual {p1, v0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 243
    :cond_9
    return-void
.end method

.method protected getLocalVar(Ljavassist/compiler/ast/Declarator;)I
    .registers 4
    .param p1, "d"    # Ljavassist/compiler/ast/Declarator;

    .prologue
    .line 130
    invoke-virtual {p1}, Ljavassist/compiler/ast/Declarator;->getLocalVar()I

    move-result v0

    .line 131
    .local v0, "v":I
    if-gez v0, :cond_11

    .line 132
    invoke-virtual {p0}, Ljavassist/compiler/CodeGen;->getMaxLocals()I

    move-result v0

    .line 133
    invoke-virtual {p1, v0}, Ljavassist/compiler/ast/Declarator;->setLocalVar(I)V

    .line 134
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljavassist/compiler/CodeGen;->incMaxLocals(I)V

    .line 137
    :cond_11
    return v0
.end method

.method public getMaxLocals()I
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v0

    return v0
.end method

.method protected abstract getSuperName()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method protected getTempVar()I
    .registers 2

    .prologue
    .line 121
    iget v0, p0, Ljavassist/compiler/CodeGen;->tempVar:I

    if-gez v0, :cond_e

    .line 122
    invoke-virtual {p0}, Ljavassist/compiler/CodeGen;->getMaxLocals()I

    move-result v0

    iput v0, p0, Ljavassist/compiler/CodeGen;->tempVar:I

    .line 123
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljavassist/compiler/CodeGen;->incMaxLocals(I)V

    .line 126
    :cond_e
    iget v0, p0, Ljavassist/compiler/CodeGen;->tempVar:I

    return v0
.end method

.method protected abstract getThisName()Ljava/lang/String;
.end method

.method protected incMaxLocals(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 113
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/Bytecode;->incMaxLocals(I)V

    .line 114
    return-void
.end method

.method protected abstract insertDefaultSuperCall()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method protected patchGoto(Ljava/util/ArrayList;I)V
    .registers 8
    .param p1, "list"    # Ljava/util/ArrayList;
    .param p2, "targetPc"    # I

    .prologue
    .line 448
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 449
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_1d

    .line 450
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 451
    .local v2, "pc":I
    iget-object v3, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    sub-int v4, p2, v2

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v2, v4}, Ljavassist/bytecode/Bytecode;->write16bit(II)V

    .line 449
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 453
    .end local v2    # "pc":I
    :cond_1d
    return-void
.end method

.method protected abstract resolveClassName(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method protected abstract resolveClassName(Ljavassist/compiler/ast/ASTList;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation
.end method

.method public setMaxLocals(I)V
    .registers 3
    .param p1, "n"    # I

    .prologue
    .line 109
    iget-object v0, p0, Ljavassist/compiler/CodeGen;->bytecode:Ljavassist/bytecode/Bytecode;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 110
    return-void
.end method

.method public setTypeChecker(Ljavassist/compiler/TypeChecker;)V
    .registers 2
    .param p1, "checker"    # Ljavassist/compiler/TypeChecker;

    .prologue
    .line 95
    iput-object p1, p0, Ljavassist/compiler/CodeGen;->typeChecker:Ljavassist/compiler/TypeChecker;

    .line 96
    return-void
.end method
