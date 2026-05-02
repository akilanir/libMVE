.class public final Ljavassist/compiler/Parser;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Ljavassist/compiler/TokenId;


# static fields
.field private static final binaryOpPrecedence:[I


# instance fields
.field private lex:Ljavassist/compiler/Lex;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 821
    const/16 v0, 0x1f

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Ljavassist/compiler/Parser;->binaryOpPrecedence:[I

    return-void

    :array_a
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x1
        0x6
        0x0
        0x0
        0x0
        0x1
        0x2
        0x0
        0x2
        0x0
        0x1
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x4
        0x0
        0x4
        0x0
    .end array-data
.end method

.method public constructor <init>(Ljavassist/compiler/Lex;)V
    .registers 2
    .param p1, "lex"    # Ljavassist/compiler/Lex;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    .line 26
    return-void
.end method

.method private binaryExpr2(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTree;I)Ljavassist/compiler/ast/ASTree;
    .registers 9
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "expr"    # Ljavassist/compiler/ast/ASTree;
    .param p3, "prec"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 805
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 806
    .local v2, "t":I
    const/16 v4, 0x143

    if-ne v2, v4, :cond_f

    .line 807
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/Parser;->parseInstanceOf(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTree;

    move-result-object v4

    .line 816
    :goto_e
    return-object v4

    .line 809
    :cond_f
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseUnaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 811
    .local v0, "expr2":Ljavassist/compiler/ast/ASTree;
    :goto_13
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v3

    .line 812
    .local v3, "t2":I
    invoke-direct {p0, v3}, Ljavassist/compiler/Parser;->getOpPrecedence(I)I

    move-result v1

    .line 813
    .local v1, "p2":I
    if-eqz v1, :cond_26

    if-le p3, v1, :cond_26

    .line 814
    invoke-direct {p0, p1, v0, v1}, Ljavassist/compiler/Parser;->binaryExpr2(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTree;I)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    goto :goto_13

    .line 816
    :cond_26
    invoke-static {v2, p2, v0}, Ljavassist/compiler/ast/BinExpr;->makeBin(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/BinExpr;

    move-result-object v4

    goto :goto_e
.end method

.method private getOpPrecedence(I)I
    .registers 4
    .param p1, "c"    # I

    .prologue
    .line 828
    const/16 v0, 0x21

    if-gt v0, p1, :cond_f

    const/16 v0, 0x3f

    if-gt p1, v0, :cond_f

    .line 829
    sget-object v0, Ljavassist/compiler/Parser;->binaryOpPrecedence:[I

    add-int/lit8 v1, p1, -0x21

    aget v0, v0, v1

    .line 845
    :goto_e
    return v0

    .line 830
    :cond_f
    const/16 v0, 0x5e

    if-ne p1, v0, :cond_15

    .line 831
    const/4 v0, 0x7

    goto :goto_e

    .line 832
    :cond_15
    const/16 v0, 0x7c

    if-ne p1, v0, :cond_1c

    .line 833
    const/16 v0, 0x8

    goto :goto_e

    .line 834
    :cond_1c
    const/16 v0, 0x171

    if-ne p1, v0, :cond_23

    .line 835
    const/16 v0, 0x9

    goto :goto_e

    .line 836
    :cond_23
    const/16 v0, 0x170

    if-ne p1, v0, :cond_2a

    .line 837
    const/16 v0, 0xa

    goto :goto_e

    .line 838
    :cond_2a
    const/16 v0, 0x166

    if-eq p1, v0, :cond_32

    const/16 v0, 0x15e

    if-ne p1, v0, :cond_34

    .line 839
    :cond_32
    const/4 v0, 0x5

    goto :goto_e

    .line 840
    :cond_34
    const/16 v0, 0x165

    if-eq p1, v0, :cond_40

    const/16 v0, 0x167

    if-eq p1, v0, :cond_40

    const/16 v0, 0x143

    if-ne p1, v0, :cond_42

    .line 841
    :cond_40
    const/4 v0, 0x4

    goto :goto_e

    .line 842
    :cond_42
    const/16 v0, 0x16c

    if-eq p1, v0, :cond_4e

    const/16 v0, 0x16e

    if-eq p1, v0, :cond_4e

    const/16 v0, 0x172

    if-ne p1, v0, :cond_50

    .line 843
    :cond_4e
    const/4 v0, 0x3

    goto :goto_e

    .line 845
    :cond_50
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private static isAssignOp(I)Z
    .registers 2
    .param p0, "t"    # I

    .prologue
    .line 709
    const/16 v0, 0x3d

    if-eq p0, v0, :cond_30

    const/16 v0, 0x15f

    if-eq p0, v0, :cond_30

    const/16 v0, 0x160

    if-eq p0, v0, :cond_30

    const/16 v0, 0x161

    if-eq p0, v0, :cond_30

    const/16 v0, 0x162

    if-eq p0, v0, :cond_30

    const/16 v0, 0x163

    if-eq p0, v0, :cond_30

    const/16 v0, 0x164

    if-eq p0, v0, :cond_30

    const/16 v0, 0x168

    if-eq p0, v0, :cond_30

    const/16 v0, 0x169

    if-eq p0, v0, :cond_30

    const/16 v0, 0x16d

    if-eq p0, v0, :cond_30

    const/16 v0, 0x16f

    if-eq p0, v0, :cond_30

    const/16 v0, 0x173

    if-ne p0, v0, :cond_32

    :cond_30
    const/4 v0, 0x1

    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method private static isBuiltinType(I)Z
    .registers 2
    .param p0, "t"    # I

    .prologue
    .line 199
    const/16 v0, 0x12d

    if-eq p0, v0, :cond_20

    const/16 v0, 0x12f

    if-eq p0, v0, :cond_20

    const/16 v0, 0x132

    if-eq p0, v0, :cond_20

    const/16 v0, 0x14e

    if-eq p0, v0, :cond_20

    const/16 v0, 0x144

    if-eq p0, v0, :cond_20

    const/16 v0, 0x146

    if-eq p0, v0, :cond_20

    const/16 v0, 0x13d

    if-eq p0, v0, :cond_20

    const/16 v0, 0x138

    if-ne p0, v0, :cond_22

    :cond_20
    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method private nextIsBuiltinCast()Z
    .registers 7

    .prologue
    const/4 v3, 0x0

    .line 926
    const/4 v0, 0x2

    .line 927
    .local v0, "i":I
    :cond_2
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    invoke-virtual {v4, v0}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v2

    .local v2, "t":I
    const/16 v4, 0x5b

    if-ne v2, v4, :cond_1b

    .line 928
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    invoke-virtual {v4, v1}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v4

    const/16 v5, 0x5d

    if-eq v4, v5, :cond_2

    .line 931
    :goto_1a
    return v3

    .end local v0    # "i":I
    .restart local v1    # "i":I
    :cond_1b
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    add-int/lit8 v5, v1, -0x1

    invoke-virtual {v4, v5}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v4

    const/16 v5, 0x29

    if-ne v4, v5, :cond_28

    const/4 v3, 0x1

    :cond_28
    move v0, v1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_1a
.end method

.method private nextIsClassCast()Z
    .registers 7

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 935
    invoke-direct {p0, v3}, Ljavassist/compiler/Parser;->nextIsClassType(I)I

    move-result v0

    .line 936
    .local v0, "i":I
    if-gez v0, :cond_9

    .line 944
    :cond_8
    :goto_8
    return v2

    .line 939
    :cond_9
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4, v0}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v1

    .line 940
    .local v1, "t":I
    const/16 v4, 0x29

    if-ne v1, v4, :cond_8

    .line 943
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v4, v5}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v1

    .line 944
    const/16 v4, 0x28

    if-eq v1, v4, :cond_53

    const/16 v4, 0x19c

    if-eq v1, v4, :cond_53

    const/16 v4, 0x196

    if-eq v1, v4, :cond_53

    const/16 v4, 0x190

    if-eq v1, v4, :cond_53

    const/16 v4, 0x153

    if-eq v1, v4, :cond_53

    const/16 v4, 0x150

    if-eq v1, v4, :cond_53

    const/16 v4, 0x148

    if-eq v1, v4, :cond_53

    const/16 v4, 0x19a

    if-eq v1, v4, :cond_53

    const/16 v4, 0x19b

    if-eq v1, v4, :cond_53

    const/16 v4, 0x193

    if-eq v1, v4, :cond_53

    const/16 v4, 0x192

    if-eq v1, v4, :cond_53

    const/16 v4, 0x191

    if-eq v1, v4, :cond_53

    const/16 v4, 0x195

    if-eq v1, v4, :cond_53

    const/16 v4, 0x194

    if-ne v1, v4, :cond_8

    :cond_53
    move v2, v3

    goto :goto_8
.end method

.method private nextIsClassType(I)I
    .registers 7
    .param p1, "i"    # I

    .prologue
    const/4 v2, -0x1

    .line 953
    :cond_1
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v3, p1}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v3

    const/16 v4, 0x2e

    if-ne v3, v4, :cond_1a

    .line 954
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v3, p1}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v3

    const/16 v4, 0x190

    if-eq v3, v4, :cond_1

    .line 961
    :goto_19
    return v2

    .line 957
    :cond_1a
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    add-int/lit8 v0, p1, 0x1

    .end local p1    # "i":I
    .local v0, "i":I
    invoke-virtual {v3, p1}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v1

    .local v1, "t":I
    const/16 v3, 0x5b

    if-ne v1, v3, :cond_33

    .line 958
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    add-int/lit8 p1, v0, 0x1

    .end local v0    # "i":I
    .restart local p1    # "i":I
    invoke-virtual {v3, v0}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v3

    const/16 v4, 0x5d

    if-eq v3, v4, :cond_1a

    goto :goto_19

    .line 961
    .end local p1    # "i":I
    .restart local v0    # "i":I
    :cond_33
    add-int/lit8 v2, v0, -0x1

    move p1, v0

    .end local v0    # "i":I
    .restart local p1    # "i":I
    goto :goto_19
.end method

.method private parseArgumentList(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v3, 0x29

    .line 1324
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    const/16 v2, 0x28

    if-eq v1, v2, :cond_16

    .line 1325
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "( is missing"

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v1, v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v1

    .line 1327
    :cond_16
    const/4 v0, 0x0

    .line 1328
    .local v0, "list":Ljavassist/compiler/ast/ASTList;
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    if-eq v1, v3, :cond_37

    .line 1330
    :goto_1f
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-static {v0, v1}, Ljavassist/compiler/ast/ASTList;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .line 1331
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    const/16 v2, 0x2c

    if-ne v1, v2, :cond_37

    .line 1332
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    goto :goto_1f

    .line 1337
    :cond_37
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    if-eq v1, v3, :cond_49

    .line 1338
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, ") is missing"

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v1, v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v1

    .line 1340
    :cond_49
    return-object v0
.end method

.method private parseArrayDimension()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 967
    const/4 v0, 0x0

    .line 968
    .local v0, "arrayDim":I
    :cond_1
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_26

    .line 969
    add-int/lit8 v0, v0, 0x1

    .line 970
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    .line 971
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    const/16 v2, 0x5d

    if-eq v1, v2, :cond_1

    .line 972
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "] is missing"

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v1, v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v1

    .line 975
    :cond_26
    return v0
.end method

.method private parseArrayIndex(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v2, 0x5d

    .line 1307
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    .line 1308
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    if-ne v1, v2, :cond_16

    .line 1309
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    .line 1310
    const/4 v0, 0x0

    .line 1317
    :cond_15
    return-object v0

    .line 1313
    :cond_16
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 1314
    .local v0, "index":Ljavassist/compiler/ast/ASTree;
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    if-eq v1, v2, :cond_15

    .line 1315
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "] is missing"

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v1, v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v1
.end method

.method private parseArrayInitializer(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ArrayInit;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 667
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 668
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 669
    .local v0, "expr":Ljavassist/compiler/ast/ASTree;
    new-instance v1, Ljavassist/compiler/ast/ArrayInit;

    invoke-direct {v1, v0}, Ljavassist/compiler/ast/ArrayInit;-><init>(Ljavassist/compiler/ast/ASTree;)V

    .line 670
    .local v1, "init":Ljavassist/compiler/ast/ArrayInit;
    :goto_e
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    const/16 v3, 0x2c

    if-ne v2, v3, :cond_25

    .line 671
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 672
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 673
    invoke-static {v1, v0}, Ljavassist/compiler/ast/ASTList;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    goto :goto_e

    .line 676
    :cond_25
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    const/16 v3, 0x7d

    if-eq v2, v3, :cond_37

    .line 677
    new-instance v2, Ljavassist/compiler/SyntaxError;

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v2

    .line 679
    :cond_37
    return-object v1
.end method

.method private parseArraySize(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;
    .registers 5
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1297
    const/4 v0, 0x0

    .line 1298
    .local v0, "list":Ljavassist/compiler/ast/ASTList;
    :goto_1
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_14

    .line 1299
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArrayIndex(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-static {v0, v1}, Ljavassist/compiler/ast/ASTList;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    goto :goto_1

    .line 1301
    :cond_14
    return-object v0
.end method

.method private parseBinaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 775
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseUnaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 777
    .local v0, "expr":Ljavassist/compiler/ast/ASTree;
    :goto_4
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    .line 778
    .local v2, "t":I
    invoke-direct {p0, v2}, Ljavassist/compiler/Parser;->getOpPrecedence(I)I

    move-result v1

    .line 779
    .local v1, "p":I
    if-nez v1, :cond_11

    .line 780
    return-object v0

    .line 782
    :cond_11
    invoke-direct {p0, p1, v0, v1}, Ljavassist/compiler/Parser;->binaryExpr2(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTree;I)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 783
    goto :goto_4
.end method

.method private parseBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 8
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v5, 0x42

    .line 283
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x7b

    if-eq v3, v4, :cond_14

    .line 284
    new-instance v3, Ljavassist/compiler/SyntaxError;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v3

    .line 286
    :cond_14
    const/4 v0, 0x0

    .line 287
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    new-instance v2, Ljavassist/compiler/SymbolTable;

    invoke-direct {v2, p1}, Ljavassist/compiler/SymbolTable;-><init>(Ljavassist/compiler/SymbolTable;)V

    .line 288
    .local v2, "tbl2":Ljavassist/compiler/SymbolTable;
    :cond_1a
    :goto_1a
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v3

    const/16 v4, 0x7d

    if-eq v3, v4, :cond_36

    .line 289
    invoke-virtual {p0, v2}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v1

    .line 290
    .local v1, "s":Ljavassist/compiler/ast/Stmnt;
    if-eqz v1, :cond_1a

    .line 291
    new-instance v3, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v3, v5, v1}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    invoke-static {v0, v3}, Ljavassist/compiler/ast/ASTList;->concat(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .end local v0    # "body":Ljavassist/compiler/ast/Stmnt;
    check-cast v0, Ljavassist/compiler/ast/Stmnt;

    .restart local v0    # "body":Ljavassist/compiler/ast/Stmnt;
    goto :goto_1a

    .line 294
    .end local v1    # "s":Ljavassist/compiler/ast/Stmnt;
    :cond_36
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 295
    if-nez v0, :cond_42

    .line 296
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    .end local v0    # "body":Ljavassist/compiler/ast/Stmnt;
    invoke-direct {v0, v5}, Ljavassist/compiler/ast/Stmnt;-><init>(I)V

    .line 298
    :cond_42
    return-object v0
.end method

.method private parseBreak(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 3
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 531
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseContinue(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    return-object v0
.end method

.method private parseCast(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 8
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v5, 0x29

    .line 901
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v2

    .line 902
    .local v2, "t":I
    invoke-static {v2}, Ljavassist/compiler/Parser;->isBuiltinType(I)Z

    move-result v3

    if-eqz v3, :cond_3f

    invoke-direct {p0}, Ljavassist/compiler/Parser;->nextIsBuiltinCast()Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 903
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 904
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 905
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 906
    .local v0, "dim":I
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    if-eq v3, v5, :cond_35

    .line 907
    new-instance v3, Ljavassist/compiler/CompileError;

    const-string v4, ") is missing"

    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4, v5}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v3

    .line 909
    :cond_35
    new-instance v3, Ljavassist/compiler/ast/CastExpr;

    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseUnaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v4

    invoke-direct {v3, v2, v0, v4}, Ljavassist/compiler/ast/CastExpr;-><init>(IILjavassist/compiler/ast/ASTree;)V

    .line 921
    .end local v0    # "dim":I
    :goto_3e
    return-object v3

    .line 911
    :cond_3f
    const/16 v3, 0x190

    if-ne v2, v3, :cond_72

    invoke-direct {p0}, Ljavassist/compiler/Parser;->nextIsClassCast()Z

    move-result v3

    if-eqz v3, :cond_72

    .line 912
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 913
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseClassType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    .line 914
    .local v1, "name":Ljavassist/compiler/ast/ASTList;
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 915
    .restart local v0    # "dim":I
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    if-eq v3, v5, :cond_68

    .line 916
    new-instance v3, Ljavassist/compiler/CompileError;

    const-string v4, ") is missing"

    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4, v5}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v3

    .line 918
    :cond_68
    new-instance v3, Ljavassist/compiler/ast/CastExpr;

    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseUnaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v4

    invoke-direct {v3, v1, v0, v4}, Ljavassist/compiler/ast/CastExpr;-><init>(Ljavassist/compiler/ast/ASTList;ILjavassist/compiler/ast/ASTree;)V

    goto :goto_3e

    .line 921
    .end local v0    # "dim":I
    .end local v1    # "name":Ljavassist/compiler/ast/ASTList;
    :cond_72
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parsePostfix(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    goto :goto_3e
.end method

.method private parseClassType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;
    .registers 5
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 981
    const/4 v0, 0x0

    .line 983
    .local v0, "list":Ljavassist/compiler/ast/ASTList;
    :goto_1
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    const/16 v2, 0x190

    if-eq v1, v2, :cond_13

    .line 984
    new-instance v1, Ljavassist/compiler/SyntaxError;

    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v1, v2}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v1

    .line 986
    :cond_13
    new-instance v1, Ljavassist/compiler/ast/Symbol;

    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Ljavassist/compiler/ast/ASTList;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .line 987
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    const/16 v2, 0x2e

    if-ne v1, v2, :cond_32

    .line 988
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    goto :goto_1

    .line 993
    :cond_32
    return-object v0
.end method

.method private parseConditionalExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 8
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 719
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseBinaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 720
    .local v0, "cond":Ljavassist/compiler/ast/ASTree;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v3

    const/16 v4, 0x3f

    if-ne v3, v4, :cond_35

    .line 721
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 722
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .line 723
    .local v2, "thenExpr":Ljavassist/compiler/ast/ASTree;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x3a

    if-eq v3, v4, :cond_2b

    .line 724
    new-instance v3, Ljavassist/compiler/CompileError;

    const-string v4, ": is missing"

    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4, v5}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v3

    .line 726
    :cond_2b
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 727
    .local v1, "elseExpr":Ljavassist/compiler/ast/ASTree;
    new-instance v3, Ljavassist/compiler/ast/CondExpr;

    invoke-direct {v3, v0, v2, v1}, Ljavassist/compiler/ast/CondExpr;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V

    move-object v0, v3

    .line 730
    .end local v0    # "cond":Ljavassist/compiler/ast/ASTree;
    .end local v1    # "elseExpr":Ljavassist/compiler/ast/ASTree;
    .end local v2    # "thenExpr":Ljavassist/compiler/ast/ASTree;
    :cond_35
    return-object v0
.end method

.method private parseContinue(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 8
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 539
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    .line 540
    .local v1, "t":I
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v0, v1}, Ljavassist/compiler/ast/Stmnt;-><init>(I)V

    .line 541
    .local v0, "s":Ljavassist/compiler/ast/Stmnt;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 542
    .local v2, "t2":I
    const/16 v3, 0x190

    if-ne v2, v3, :cond_29

    .line 543
    new-instance v3, Ljavassist/compiler/ast/Symbol;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljavassist/compiler/ast/Stmnt;->setLeft(Ljavassist/compiler/ast/ASTree;)V

    .line 544
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 547
    :cond_29
    const/16 v3, 0x3b

    if-eq v2, v3, :cond_37

    .line 548
    new-instance v3, Ljavassist/compiler/CompileError;

    const-string v4, "; is missing"

    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4, v5}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v3

    .line 550
    :cond_37
    return-object v0
.end method

.method private parseDeclarationOrExpression(Ljavassist/compiler/SymbolTable;Z)Ljavassist/compiler/ast/Stmnt;
    .registers 11
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "exprList"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v6, 0x190

    .line 566
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v4

    .line 567
    .local v4, "t":I
    :goto_8
    const/16 v5, 0x13b

    if-ne v4, v5, :cond_18

    .line 568
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    .line 569
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v4

    goto :goto_8

    .line 572
    :cond_18
    invoke-static {v4}, Ljavassist/compiler/Parser;->isBuiltinType(I)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 573
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    move-result v4

    .line 574
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 575
    .local v0, "dim":I
    new-instance v5, Ljavassist/compiler/ast/Declarator;

    invoke-direct {v5, v4, v0}, Ljavassist/compiler/ast/Declarator;-><init>(II)V

    invoke-direct {p0, p1, v5}, Ljavassist/compiler/Parser;->parseDeclarators(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v1

    .line 596
    .end local v0    # "dim":I
    :cond_31
    :goto_31
    return-object v1

    .line 577
    :cond_32
    if-ne v4, v6, :cond_55

    .line 578
    const/4 v5, 0x0

    invoke-direct {p0, v5}, Ljavassist/compiler/Parser;->nextIsClassType(I)I

    move-result v2

    .line 579
    .local v2, "i":I
    if-ltz v2, :cond_55

    .line 580
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5, v2}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v5

    if-ne v5, v6, :cond_55

    .line 581
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseClassType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    .line 582
    .local v3, "name":Ljavassist/compiler/ast/ASTList;
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 583
    .restart local v0    # "dim":I
    new-instance v5, Ljavassist/compiler/ast/Declarator;

    invoke-direct {v5, v3, v0}, Ljavassist/compiler/ast/Declarator;-><init>(Ljavassist/compiler/ast/ASTList;I)V

    invoke-direct {p0, p1, v5}, Ljavassist/compiler/Parser;->parseDeclarators(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v1

    goto :goto_31

    .line 588
    .end local v0    # "dim":I
    .end local v2    # "i":I
    .end local v3    # "name":Ljavassist/compiler/ast/ASTList;
    :cond_55
    if-eqz p2, :cond_6f

    .line 589
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseExprList(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v1

    .line 593
    .local v1, "expr":Ljavassist/compiler/ast/Stmnt;
    :goto_5b
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    move-result v5

    const/16 v6, 0x3b

    if-eq v5, v6, :cond_31

    .line 594
    new-instance v5, Ljavassist/compiler/CompileError;

    const-string v6, "; is missing"

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v5, v6, v7}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v5

    .line 591
    .end local v1    # "expr":Ljavassist/compiler/ast/Stmnt;
    :cond_6f
    new-instance v1, Ljavassist/compiler/ast/Stmnt;

    const/16 v5, 0x45

    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v6

    invoke-direct {v1, v5, v6}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    .restart local v1    # "expr":Ljavassist/compiler/ast/Stmnt;
    goto :goto_5b
.end method

.method private parseDeclarator(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/Declarator;
    .registers 10
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "d"    # Ljavassist/compiler/ast/Declarator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 635
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    move-result v5

    const/16 v6, 0x190

    if-ne v5, v6, :cond_12

    invoke-virtual {p2}, Ljavassist/compiler/ast/Declarator;->getType()I

    move-result v5

    const/16 v6, 0x158

    if-ne v5, v6, :cond_1a

    .line 636
    :cond_12
    new-instance v5, Ljavassist/compiler/SyntaxError;

    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v5, v6}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v5

    .line 638
    :cond_1a
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v3

    .line 639
    .local v3, "name":Ljava/lang/String;
    new-instance v4, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v4, v3}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    .line 640
    .local v4, "symbol":Ljavassist/compiler/ast/Symbol;
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v1

    .line 641
    .local v1, "dim":I
    const/4 v2, 0x0

    .line 642
    .local v2, "init":Ljavassist/compiler/ast/ASTree;
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v5

    const/16 v6, 0x3d

    if-ne v5, v6, :cond_3d

    .line 643
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    .line 644
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseInitializer(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .line 647
    :cond_3d
    invoke-virtual {p2, v4, v1, v2}, Ljavassist/compiler/ast/Declarator;->make(Ljavassist/compiler/ast/Symbol;ILjavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Declarator;

    move-result-object v0

    .line 648
    .local v0, "decl":Ljavassist/compiler/ast/Declarator;
    invoke-virtual {p1, v3, v0}, Ljavassist/compiler/SymbolTable;->append(Ljava/lang/String;Ljavassist/compiler/ast/Declarator;)V

    .line 649
    return-object v0
.end method

.method private parseDeclarators(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/Stmnt;
    .registers 8
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "d"    # Ljavassist/compiler/ast/Declarator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 618
    const/4 v0, 0x0

    .line 620
    .local v0, "decl":Ljavassist/compiler/ast/Stmnt;
    :cond_1
    new-instance v2, Ljavassist/compiler/ast/Stmnt;

    const/16 v3, 0x44

    invoke-direct {p0, p1, p2}, Ljavassist/compiler/Parser;->parseDeclarator(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/Declarator;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    invoke-static {v0, v2}, Ljavassist/compiler/ast/ASTList;->concat(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .end local v0    # "decl":Ljavassist/compiler/ast/Stmnt;
    check-cast v0, Ljavassist/compiler/ast/Stmnt;

    .line 622
    .restart local v0    # "decl":Ljavassist/compiler/ast/Stmnt;
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    .line 623
    .local v1, "t":I
    const/16 v2, 0x3b

    if-ne v1, v2, :cond_1d

    .line 624
    return-object v0

    .line 625
    :cond_1d
    const/16 v2, 0x2c

    if-eq v1, v2, :cond_1

    .line 626
    new-instance v2, Ljavassist/compiler/CompileError;

    const-string v3, "; is missing"

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v2
.end method

.method private parseDo(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 333
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 334
    .local v2, "t":I
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 335
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x15a

    if-ne v3, v4, :cond_1e

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x28

    if-eq v3, v4, :cond_26

    .line 336
    :cond_1e
    new-instance v3, Ljavassist/compiler/SyntaxError;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v3

    .line 338
    :cond_26
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 339
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x29

    if-ne v3, v4, :cond_3e

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x3b

    if-eq v3, v4, :cond_46

    .line 340
    :cond_3e
    new-instance v3, Ljavassist/compiler/SyntaxError;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v3

    .line 342
    :cond_46
    new-instance v3, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v3, v2, v1, v0}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v3
.end method

.method private parseDotClass(II)Ljavassist/compiler/ast/ASTree;
    .registers 8
    .param p1, "builtinType"    # I
    .param p2, "dim"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1114
    if-lez p2, :cond_19

    .line 1115
    invoke-static {p1, p2}, Ljavassist/compiler/CodeGen;->toJvmTypeName(II)Ljava/lang/String;

    move-result-object v0

    .line 1116
    .local v0, "cname":Ljava/lang/String;
    const/16 v1, 0x2e

    new-instance v2, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v2, v0}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljavassist/compiler/ast/Member;

    const-string v4, "class"

    invoke-direct {v3, v4}, Ljavassist/compiler/ast/Member;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2, v3}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v1

    .line 1153
    :goto_18
    return-object v1

    .line 1120
    .end local v0    # "cname":Ljava/lang/String;
    :cond_19
    sparse-switch p1, :sswitch_data_62

    .line 1149
    new-instance v1, Ljavassist/compiler/CompileError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid builtin type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1122
    :sswitch_35
    const-string v0, "java.lang.Boolean"

    .line 1153
    .restart local v0    # "cname":Ljava/lang/String;
    :goto_37
    const/16 v1, 0x23

    new-instance v2, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v2, v0}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljavassist/compiler/ast/Member;

    const-string v4, "TYPE"

    invoke-direct {v3, v4}, Ljavassist/compiler/ast/Member;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v2, v3}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v1

    goto :goto_18

    .line 1125
    .end local v0    # "cname":Ljava/lang/String;
    :sswitch_4a
    const-string v0, "java.lang.Byte"

    .line 1126
    .restart local v0    # "cname":Ljava/lang/String;
    goto :goto_37

    .line 1128
    .end local v0    # "cname":Ljava/lang/String;
    :sswitch_4d
    const-string v0, "java.lang.Character"

    .line 1129
    .restart local v0    # "cname":Ljava/lang/String;
    goto :goto_37

    .line 1131
    .end local v0    # "cname":Ljava/lang/String;
    :sswitch_50
    const-string v0, "java.lang.Short"

    .line 1132
    .restart local v0    # "cname":Ljava/lang/String;
    goto :goto_37

    .line 1134
    .end local v0    # "cname":Ljava/lang/String;
    :sswitch_53
    const-string v0, "java.lang.Integer"

    .line 1135
    .restart local v0    # "cname":Ljava/lang/String;
    goto :goto_37

    .line 1137
    .end local v0    # "cname":Ljava/lang/String;
    :sswitch_56
    const-string v0, "java.lang.Long"

    .line 1138
    .restart local v0    # "cname":Ljava/lang/String;
    goto :goto_37

    .line 1140
    .end local v0    # "cname":Ljava/lang/String;
    :sswitch_59
    const-string v0, "java.lang.Float"

    .line 1141
    .restart local v0    # "cname":Ljava/lang/String;
    goto :goto_37

    .line 1143
    .end local v0    # "cname":Ljava/lang/String;
    :sswitch_5c
    const-string v0, "java.lang.Double"

    .line 1144
    .restart local v0    # "cname":Ljava/lang/String;
    goto :goto_37

    .line 1146
    .end local v0    # "cname":Ljava/lang/String;
    :sswitch_5f
    const-string v0, "java.lang.Void"

    .line 1147
    .restart local v0    # "cname":Ljava/lang/String;
    goto :goto_37

    .line 1120
    :sswitch_data_62
    .sparse-switch
        0x12d -> :sswitch_35
        0x12f -> :sswitch_4a
        0x132 -> :sswitch_4d
        0x138 -> :sswitch_5c
        0x13d -> :sswitch_59
        0x144 -> :sswitch_53
        0x146 -> :sswitch_56
        0x14e -> :sswitch_50
        0x158 -> :sswitch_5f
    .end sparse-switch
.end method

.method private parseDotClass(Ljavassist/compiler/ast/ASTree;I)Ljavassist/compiler/ast/ASTree;
    .registers 10
    .param p1, "className"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "dim"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2e

    .line 1094
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->toClassName(Ljavassist/compiler/ast/ASTree;)Ljava/lang/String;

    move-result-object v0

    .line 1095
    .local v0, "cname":Ljava/lang/String;
    if-lez p2, :cond_32

    .line 1096
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .local v2, "sbuf":Ljava/lang/StringBuffer;
    move v1, p2

    .line 1097
    .end local p2    # "dim":I
    .local v1, "dim":I
    :goto_e
    add-int/lit8 p2, v1, -0x1

    .end local v1    # "dim":I
    .restart local p2    # "dim":I
    if-lez v1, :cond_19

    .line 1098
    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move v1, p2

    .end local p2    # "dim":I
    .restart local v1    # "dim":I
    goto :goto_e

    .line 1100
    .end local v1    # "dim":I
    .restart local p2    # "dim":I
    :cond_19
    const/16 v3, 0x4c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x2f

    invoke-virtual {v0, v6, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x3b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1101
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1104
    .end local v2    # "sbuf":Ljava/lang/StringBuffer;
    :cond_32
    new-instance v3, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v3, v0}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljavassist/compiler/ast/Member;

    const-string v5, "class"

    invoke-direct {v4, v5}, Ljavassist/compiler/ast/Member;-><init>(Ljava/lang/String;)V

    invoke-static {v6, v3, v4}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v3

    return-object v3
.end method

.method private parseExprList(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 602
    const/4 v1, 0x0

    .line 604
    .local v1, "expr":Ljavassist/compiler/ast/Stmnt;
    :goto_1
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    const/16 v2, 0x45

    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    .line 605
    .local v0, "e":Ljavassist/compiler/ast/Stmnt;
    new-instance v2, Ljavassist/compiler/ast/Stmnt;

    const/16 v3, 0x42

    invoke-direct {v2, v3, v0}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    invoke-static {v1, v2}, Ljavassist/compiler/ast/ASTList;->concat(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    .end local v1    # "expr":Ljavassist/compiler/ast/Stmnt;
    check-cast v1, Ljavassist/compiler/ast/Stmnt;

    .line 606
    .restart local v1    # "expr":Ljavassist/compiler/ast/Stmnt;
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    const/16 v3, 0x2c

    if-ne v2, v3, :cond_29

    .line 607
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    goto :goto_1

    .line 609
    :cond_29
    return-object v1
.end method

.method private parseField(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/FieldDecl;
    .registers 9
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "mods"    # Ljavassist/compiler/ast/ASTList;
    .param p3, "d"    # Ljavassist/compiler/ast/Declarator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 78
    const/4 v1, 0x0

    .line 79
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    const/16 v3, 0x3d

    if-ne v2, v3, :cond_14

    .line 80
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 81
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 84
    :cond_14
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v0

    .line 85
    .local v0, "c":I
    const/16 v2, 0x3b

    if-ne v0, v2, :cond_2e

    .line 86
    new-instance v2, Ljavassist/compiler/ast/FieldDecl;

    new-instance v3, Ljavassist/compiler/ast/ASTList;

    new-instance v4, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v4, v1}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {v3, p3, v4}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    invoke-direct {v2, p2, v3}, Ljavassist/compiler/ast/FieldDecl;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v2

    .line 87
    :cond_2e
    const/16 v2, 0x2c

    if-ne v0, v2, :cond_3c

    .line 88
    new-instance v2, Ljavassist/compiler/CompileError;

    const-string v3, "only one field can be declared in one declaration"

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v2

    .line 91
    :cond_3c
    new-instance v2, Ljavassist/compiler/SyntaxError;

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v2
.end method

.method private parseFor(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 12
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v9, 0x29

    const/16 v8, 0x3b

    .line 351
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v4

    .line 353
    .local v4, "t":I
    new-instance v5, Ljavassist/compiler/SymbolTable;

    invoke-direct {v5, p1}, Ljavassist/compiler/SymbolTable;-><init>(Ljavassist/compiler/SymbolTable;)V

    .line 355
    .local v5, "tbl2":Ljavassist/compiler/SymbolTable;
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v6

    const/16 v7, 0x28

    if-eq v6, v7, :cond_21

    .line 356
    new-instance v6, Ljavassist/compiler/SyntaxError;

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v6

    .line 358
    :cond_21
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v6

    if-ne v6, v8, :cond_4a

    .line 359
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 360
    const/4 v1, 0x0

    .line 365
    .local v1, "expr1":Ljavassist/compiler/ast/Stmnt;
    :goto_2f
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v6

    if-ne v6, v8, :cond_50

    .line 366
    const/4 v2, 0x0

    .line 370
    .local v2, "expr2":Ljavassist/compiler/ast/ASTree;
    :goto_38
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v6

    if-eq v6, v8, :cond_55

    .line 371
    new-instance v6, Ljavassist/compiler/CompileError;

    const-string v7, "; is missing"

    iget-object v8, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7, v8}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v6

    .line 363
    .end local v1    # "expr1":Ljavassist/compiler/ast/Stmnt;
    .end local v2    # "expr2":Ljavassist/compiler/ast/ASTree;
    :cond_4a
    const/4 v6, 0x1

    invoke-direct {p0, v5, v6}, Ljavassist/compiler/Parser;->parseDeclarationOrExpression(Ljavassist/compiler/SymbolTable;Z)Ljavassist/compiler/ast/Stmnt;

    move-result-object v1

    .restart local v1    # "expr1":Ljavassist/compiler/ast/Stmnt;
    goto :goto_2f

    .line 368
    :cond_50
    invoke-virtual {p0, v5}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .restart local v2    # "expr2":Ljavassist/compiler/ast/ASTree;
    goto :goto_38

    .line 373
    :cond_55
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v6

    if-ne v6, v9, :cond_70

    .line 374
    const/4 v3, 0x0

    .line 378
    .local v3, "expr3":Ljavassist/compiler/ast/Stmnt;
    :goto_5e
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v6

    if-eq v6, v9, :cond_75

    .line 379
    new-instance v6, Ljavassist/compiler/CompileError;

    const-string v7, ") is missing"

    iget-object v8, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7, v8}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v6

    .line 376
    .end local v3    # "expr3":Ljavassist/compiler/ast/Stmnt;
    :cond_70
    invoke-direct {p0, v5}, Ljavassist/compiler/Parser;->parseExprList(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v3

    .restart local v3    # "expr3":Ljavassist/compiler/ast/Stmnt;
    goto :goto_5e

    .line 381
    :cond_75
    invoke-virtual {p0, v5}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 382
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    new-instance v6, Ljavassist/compiler/ast/Stmnt;

    new-instance v7, Ljavassist/compiler/ast/ASTList;

    new-instance v8, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v8, v3, v0}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    invoke-direct {v7, v2, v8}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    invoke-direct {v6, v4, v1, v7}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v6
.end method

.method private parseFormalParam(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Declarator;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 208
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseFormalType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Declarator;

    move-result-object v0

    .line 209
    .local v0, "d":Ljavassist/compiler/ast/Declarator;
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    const/16 v3, 0x190

    if-eq v2, v3, :cond_16

    .line 210
    new-instance v2, Ljavassist/compiler/SyntaxError;

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v2

    .line 212
    :cond_16
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v1

    .line 213
    .local v1, "name":Ljava/lang/String;
    new-instance v2, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v2, v1}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljavassist/compiler/ast/Declarator;->setVariable(Ljavassist/compiler/ast/Symbol;)V

    .line 214
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v2

    invoke-virtual {v0, v2}, Ljavassist/compiler/ast/Declarator;->addArrayDim(I)V

    .line 215
    invoke-virtual {p1, v1, v0}, Ljavassist/compiler/SymbolTable;->append(Ljava/lang/String;Ljavassist/compiler/ast/Declarator;)V

    .line 216
    return-object v0
.end method

.method private parseFormalType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Declarator;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 185
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    .line 186
    .local v2, "t":I
    invoke-static {v2}, Ljavassist/compiler/Parser;->isBuiltinType(I)Z

    move-result v3

    if-nez v3, :cond_10

    const/16 v3, 0x158

    if-ne v2, v3, :cond_1f

    .line 187
    :cond_10
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 188
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 189
    .local v0, "dim":I
    new-instance v3, Ljavassist/compiler/ast/Declarator;

    invoke-direct {v3, v2, v0}, Ljavassist/compiler/ast/Declarator;-><init>(II)V

    .line 194
    :goto_1e
    return-object v3

    .line 192
    .end local v0    # "dim":I
    :cond_1f
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseClassType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    .line 193
    .local v1, "name":Ljavassist/compiler/ast/ASTList;
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 194
    .restart local v0    # "dim":I
    new-instance v3, Ljavassist/compiler/ast/Declarator;

    invoke-direct {v3, v1, v0}, Ljavassist/compiler/ast/Declarator;-><init>(Ljavassist/compiler/ast/ASTList;I)V

    goto :goto_1e
.end method

.method private parseIf(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 9
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 305
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 306
    .local v2, "t":I
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseParExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 307
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v3

    .line 309
    .local v3, "thenp":Ljavassist/compiler/ast/Stmnt;
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v4

    const/16 v5, 0x139

    if-ne v4, v5, :cond_31

    .line 310
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->get()I

    .line 311
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 316
    .local v0, "elsep":Ljavassist/compiler/ast/Stmnt;
    :goto_21
    new-instance v4, Ljavassist/compiler/ast/Stmnt;

    new-instance v5, Ljavassist/compiler/ast/ASTList;

    new-instance v6, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v6, v0}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {v5, v3, v6}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    invoke-direct {v4, v2, v1, v5}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v4

    .line 314
    .end local v0    # "elsep":Ljavassist/compiler/ast/Stmnt;
    :cond_31
    const/4 v0, 0x0

    .restart local v0    # "elsep":Ljavassist/compiler/ast/Stmnt;
    goto :goto_21
.end method

.method private parseInitializer(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 4
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 655
    iget-object v0, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v0}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v0

    const/16 v1, 0x7b

    if-ne v0, v1, :cond_f

    .line 656
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArrayInitializer(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ArrayInit;

    move-result-object v0

    .line 658
    :goto_e
    return-object v0

    :cond_f
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    goto :goto_e
.end method

.method private parseInstanceOf(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTree;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "expr"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 789
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    .line 790
    .local v2, "t":I
    invoke-static {v2}, Ljavassist/compiler/Parser;->isBuiltinType(I)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 791
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 792
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 793
    .local v0, "dim":I
    new-instance v3, Ljavassist/compiler/ast/InstanceOfExpr;

    invoke-direct {v3, v2, v0, p2}, Ljavassist/compiler/ast/InstanceOfExpr;-><init>(IILjavassist/compiler/ast/ASTree;)V

    .line 798
    :goto_1a
    return-object v3

    .line 796
    .end local v0    # "dim":I
    :cond_1b
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseClassType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    .line 797
    .local v1, "name":Ljavassist/compiler/ast/ASTList;
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 798
    .restart local v0    # "dim":I
    new-instance v3, Ljavassist/compiler/ast/InstanceOfExpr;

    invoke-direct {v3, v1, v0, p2}, Ljavassist/compiler/ast/InstanceOfExpr;-><init>(Ljavassist/compiler/ast/ASTList;ILjavassist/compiler/ast/ASTree;)V

    goto :goto_1a
.end method

.method private parseMemberMods()Ljavassist/compiler/ast/ASTList;
    .registers 6

    .prologue
    .line 168
    const/4 v0, 0x0

    .line 170
    .local v0, "list":Ljavassist/compiler/ast/ASTList;
    :goto_1
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    .line 171
    .local v2, "t":I
    const/16 v3, 0x12c

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x13b

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x14c

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x14b

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x14a

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x152

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x14f

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x159

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x156

    if-eq v2, v3, :cond_2f

    const/16 v3, 0x15b

    if-ne v2, v3, :cond_41

    .line 174
    :cond_2f
    new-instance v1, Ljavassist/compiler/ast/ASTList;

    new-instance v3, Ljavassist/compiler/ast/Keyword;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->get()I

    move-result v4

    invoke-direct {v3, v4}, Ljavassist/compiler/ast/Keyword;-><init>(I)V

    invoke-direct {v1, v3, v0}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .end local v0    # "list":Ljavassist/compiler/ast/ASTList;
    .local v1, "list":Ljavassist/compiler/ast/ASTList;
    move-object v0, v1

    .end local v1    # "list":Ljavassist/compiler/ast/ASTList;
    .restart local v0    # "list":Ljavassist/compiler/ast/ASTList;
    goto :goto_1

    .line 179
    :cond_41
    return-object v0
.end method

.method private parseMethod1(Ljavassist/compiler/SymbolTable;ZLjavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/MethodDecl;
    .registers 12
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "isConstructor"    # Z
    .param p3, "mods"    # Ljavassist/compiler/ast/ASTList;
    .param p4, "d"    # Ljavassist/compiler/ast/Declarator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2c

    const/16 v5, 0x29

    .line 108
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x28

    if-eq v3, v4, :cond_16

    .line 109
    new-instance v3, Ljavassist/compiler/SyntaxError;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v3

    .line 111
    :cond_16
    const/4 v0, 0x0

    .line 112
    .local v0, "parms":Ljavassist/compiler/ast/ASTList;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v3

    if-eq v3, v5, :cond_37

    .line 114
    :cond_1f
    :goto_1f
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseFormalParam(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Declarator;

    move-result-object v3

    invoke-static {v0, v3}, Ljavassist/compiler/ast/ASTList;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .line 115
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    .line 116
    .local v1, "t":I
    if-ne v1, v6, :cond_35

    .line 117
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    goto :goto_1f

    .line 118
    :cond_35
    if-ne v1, v5, :cond_1f

    .line 122
    .end local v1    # "t":I
    :cond_37
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 123
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v3

    invoke-virtual {p4, v3}, Ljavassist/compiler/ast/Declarator;->addArrayDim(I)V

    .line 124
    if-eqz p2, :cond_53

    invoke-virtual {p4}, Ljavassist/compiler/ast/Declarator;->getArrayDim()I

    move-result v3

    if-lez v3, :cond_53

    .line 125
    new-instance v3, Ljavassist/compiler/SyntaxError;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v3

    .line 127
    :cond_53
    const/4 v2, 0x0

    .line 128
    .local v2, "throwsList":Ljavassist/compiler/ast/ASTList;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v3

    const/16 v4, 0x155

    if-ne v3, v4, :cond_79

    .line 129
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    .line 131
    :goto_63
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseClassType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    invoke-static {v2, v3}, Ljavassist/compiler/ast/ASTList;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    .line 132
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v3

    if-ne v3, v6, :cond_79

    .line 133
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    goto :goto_63

    .line 139
    :cond_79
    new-instance v3, Ljavassist/compiler/ast/MethodDecl;

    new-instance v4, Ljavassist/compiler/ast/ASTList;

    const/4 v5, 0x0

    invoke-static {v0, v2, v5}, Ljavassist/compiler/ast/ASTList;->make(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    move-result-object v5

    invoke-direct {v4, p4, v5}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    invoke-direct {v3, p3, v4}, Ljavassist/compiler/ast/MethodDecl;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v3
.end method

.method private parseMethodCall(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTree;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "expr"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1165
    instance-of v2, p2, Ljavassist/compiler/ast/Keyword;

    if-eqz v2, :cond_1b

    move-object v2, p2

    .line 1166
    check-cast v2, Ljavassist/compiler/ast/Keyword;

    invoke-virtual {v2}, Ljavassist/compiler/ast/Keyword;->get()I

    move-result v1

    .line 1167
    .local v1, "token":I
    const/16 v2, 0x153

    if-eq v1, v2, :cond_1f

    const/16 v2, 0x150

    if-eq v1, v2, :cond_1f

    .line 1168
    new-instance v2, Ljavassist/compiler/SyntaxError;

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v2

    .line 1170
    .end local v1    # "token":I
    :cond_1b
    instance-of v2, p2, Ljavassist/compiler/ast/Symbol;

    if-eqz v2, :cond_28

    .line 1178
    :cond_1f
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArgumentList(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    invoke-static {p2, v2}, Ljavassist/compiler/ast/CallExpr;->makeCall(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/CallExpr;

    move-result-object v2

    return-object v2

    .line 1172
    :cond_28
    instance-of v2, p2, Ljavassist/compiler/ast/Expr;

    if-eqz v2, :cond_1f

    move-object v2, p2

    .line 1173
    check-cast v2, Ljavassist/compiler/ast/Expr;

    invoke-virtual {v2}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v0

    .line 1174
    .local v0, "op":I
    const/16 v2, 0x2e

    if-eq v0, v2, :cond_1f

    const/16 v2, 0x23

    if-eq v0, v2, :cond_1f

    .line 1175
    new-instance v2, Ljavassist/compiler/SyntaxError;

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v2
.end method

.method private parseNew(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/NewExpr;
    .registers 9
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v6, 0x7b

    .line 1265
    const/4 v1, 0x0

    .line 1266
    .local v1, "init":Ljavassist/compiler/ast/ArrayInit;
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v4

    .line 1267
    .local v4, "t":I
    invoke-static {v4}, Ljavassist/compiler/Parser;->isBuiltinType(I)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 1268
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    .line 1269
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArraySize(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    .line 1270
    .local v3, "size":Ljavassist/compiler/ast/ASTList;
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v5

    if-ne v5, v6, :cond_24

    .line 1271
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArrayInitializer(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ArrayInit;

    move-result-object v1

    .line 1273
    :cond_24
    new-instance v5, Ljavassist/compiler/ast/NewExpr;

    invoke-direct {v5, v4, v3, v1}, Ljavassist/compiler/ast/NewExpr;-><init>(ILjavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ArrayInit;)V

    .line 1287
    .end local v3    # "size":Ljavassist/compiler/ast/ASTList;
    :goto_29
    return-object v5

    .line 1275
    :cond_2a
    const/16 v5, 0x190

    if-ne v4, v5, :cond_5f

    .line 1276
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseClassType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    .line 1277
    .local v2, "name":Ljavassist/compiler/ast/ASTList;
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v4

    .line 1278
    const/16 v5, 0x28

    if-ne v4, v5, :cond_46

    .line 1279
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArgumentList(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .line 1280
    .local v0, "args":Ljavassist/compiler/ast/ASTList;
    new-instance v5, Ljavassist/compiler/ast/NewExpr;

    invoke-direct {v5, v2, v0}, Ljavassist/compiler/ast/NewExpr;-><init>(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)V

    goto :goto_29

    .line 1282
    .end local v0    # "args":Ljavassist/compiler/ast/ASTList;
    :cond_46
    const/16 v5, 0x5b

    if-ne v4, v5, :cond_5f

    .line 1283
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArraySize(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    .line 1284
    .restart local v3    # "size":Ljavassist/compiler/ast/ASTList;
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v5

    if-ne v5, v6, :cond_5a

    .line 1285
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArrayInitializer(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ArrayInit;

    move-result-object v1

    .line 1287
    :cond_5a
    invoke-static {v2, v3, v1}, Ljavassist/compiler/ast/NewExpr;->makeObjectArray(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ArrayInit;)Ljavassist/compiler/ast/NewExpr;

    move-result-object v5

    goto :goto_29

    .line 1291
    .end local v2    # "name":Ljavassist/compiler/ast/ASTList;
    .end local v3    # "size":Ljavassist/compiler/ast/ASTList;
    :cond_5f
    new-instance v5, Ljavassist/compiler/SyntaxError;

    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v5, v6}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v5
.end method

.method private parseParExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 5
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 685
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    const/16 v2, 0x28

    if-eq v1, v2, :cond_12

    .line 686
    new-instance v1, Ljavassist/compiler/SyntaxError;

    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v1, v2}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v1

    .line 688
    :cond_12
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 689
    .local v0, "expr":Ljavassist/compiler/ast/ASTree;
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    const/16 v2, 0x29

    if-eq v1, v2, :cond_28

    .line 690
    new-instance v1, Ljavassist/compiler/SyntaxError;

    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v1, v2}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v1

    .line 692
    :cond_28
    return-object v0
.end method

.method private parsePostfix(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 14
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v11, 0x190

    const/16 v10, 0x133

    const/16 v9, 0x2e

    .line 1013
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v5

    .line 1014
    .local v5, "token":I
    packed-switch v5, :pswitch_data_f6

    .line 1030
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parsePrimaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 1033
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    :goto_13
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v6

    sparse-switch v6, :sswitch_data_104

    .line 1082
    .end local v1    # "expr":Ljavassist/compiler/ast/ASTree;
    :goto_1c
    return-object v1

    .line 1018
    :pswitch_1d
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 1019
    new-instance v1, Ljavassist/compiler/ast/IntConst;

    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->getLong()J

    move-result-wide v6

    invoke-direct {v1, v6, v7, v5}, Ljavassist/compiler/ast/IntConst;-><init>(JI)V

    goto :goto_1c

    .line 1022
    :pswitch_2e
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 1023
    new-instance v1, Ljavassist/compiler/ast/DoubleConst;

    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->getDouble()D

    move-result-wide v6

    invoke-direct {v1, v6, v7, v5}, Ljavassist/compiler/ast/DoubleConst;-><init>(DI)V

    goto :goto_1c

    .line 1035
    .restart local v1    # "expr":Ljavassist/compiler/ast/ASTree;
    :sswitch_3f
    invoke-direct {p0, p1, v1}, Ljavassist/compiler/Parser;->parseMethodCall(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 1036
    goto :goto_13

    .line 1038
    :sswitch_44
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v6

    const/16 v7, 0x5d

    if-ne v6, v7, :cond_70

    .line 1039
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v0

    .line 1040
    .local v0, "dim":I
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v6

    if-ne v6, v9, :cond_63

    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v6

    if-eq v6, v10, :cond_6b

    .line 1041
    :cond_63
    new-instance v6, Ljavassist/compiler/SyntaxError;

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v6

    .line 1043
    :cond_6b
    invoke-direct {p0, v1, v0}, Ljavassist/compiler/Parser;->parseDotClass(Ljavassist/compiler/ast/ASTree;I)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 1044
    goto :goto_13

    .line 1046
    .end local v0    # "dim":I
    :cond_70
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseArrayIndex(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .line 1047
    .local v2, "index":Ljavassist/compiler/ast/ASTree;
    if-nez v2, :cond_7e

    .line 1048
    new-instance v6, Ljavassist/compiler/SyntaxError;

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v6

    .line 1050
    :cond_7e
    const/16 v6, 0x41

    invoke-static {v6, v1, v2}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v1

    .line 1052
    goto :goto_13

    .line 1055
    .end local v2    # "index":Ljavassist/compiler/ast/ASTree;
    :sswitch_85
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v4

    .line 1056
    .local v4, "t":I
    const/4 v6, 0x0

    invoke-static {v4, v6, v1}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v1

    .line 1057
    goto :goto_13

    .line 1059
    .end local v4    # "t":I
    :sswitch_91
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 1060
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v4

    .line 1061
    .restart local v4    # "t":I
    if-ne v4, v10, :cond_a5

    .line 1062
    const/4 v6, 0x0

    invoke-direct {p0, v1, v6}, Ljavassist/compiler/Parser;->parseDotClass(Ljavassist/compiler/ast/ASTree;I)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    goto/16 :goto_13

    .line 1064
    :cond_a5
    if-ne v4, v11, :cond_b8

    .line 1065
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v3

    .line 1066
    .local v3, "str":Ljava/lang/String;
    new-instance v6, Ljavassist/compiler/ast/Member;

    invoke-direct {v6, v3}, Ljavassist/compiler/ast/Member;-><init>(Ljava/lang/String;)V

    invoke-static {v9, v1, v6}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v1

    goto/16 :goto_13

    .line 1069
    .end local v3    # "str":Ljava/lang/String;
    :cond_b8
    new-instance v6, Ljavassist/compiler/CompileError;

    const-string v7, "missing member name"

    iget-object v8, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7, v8}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v6

    .line 1072
    .end local v4    # "t":I
    :sswitch_c2
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 1073
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v4

    .line 1074
    .restart local v4    # "t":I
    if-eq v4, v11, :cond_d9

    .line 1075
    new-instance v6, Ljavassist/compiler/CompileError;

    const-string v7, "missing static member name"

    iget-object v8, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7, v8}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v6

    .line 1077
    :cond_d9
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v3

    .line 1078
    .restart local v3    # "str":Ljava/lang/String;
    const/16 v6, 0x23

    new-instance v7, Ljavassist/compiler/ast/Symbol;

    invoke-direct {p0, v1}, Ljavassist/compiler/Parser;->toClassName(Ljavassist/compiler/ast/ASTree;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljavassist/compiler/ast/Member;

    invoke-direct {v8, v3}, Ljavassist/compiler/ast/Member;-><init>(Ljava/lang/String;)V

    invoke-static {v6, v7, v8}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v1

    .line 1080
    goto/16 :goto_13

    .line 1014
    nop

    :pswitch_data_f6
    .packed-switch 0x191
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_2e
        :pswitch_2e
    .end packed-switch

    .line 1033
    :sswitch_data_104
    .sparse-switch
        0x23 -> :sswitch_c2
        0x28 -> :sswitch_3f
        0x2e -> :sswitch_91
        0x5b -> :sswitch_44
        0x16a -> :sswitch_85
        0x16b -> :sswitch_85
    .end sparse-switch
.end method

.method private parsePrimaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 10
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1225
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    move-result v4

    .local v4, "t":I
    sparse-switch v4, :sswitch_data_80

    .line 1250
    invoke-static {v4}, Ljavassist/compiler/Parser;->isBuiltinType(I)Z

    move-result v5

    if-nez v5, :cond_13

    const/16 v5, 0x158

    if-ne v4, v5, :cond_77

    .line 1251
    :cond_13
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseArrayDimension()I

    move-result v1

    .line 1252
    .local v1, "dim":I
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    move-result v5

    const/16 v6, 0x2e

    if-ne v5, v6, :cond_77

    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    move-result v5

    const/16 v6, 0x133

    if-ne v5, v6, :cond_77

    .line 1253
    invoke-direct {p0, v4, v1}, Ljavassist/compiler/Parser;->parseDotClass(II)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .end local v1    # "dim":I
    :cond_2f
    :goto_2f
    return-object v2

    .line 1231
    :sswitch_30
    new-instance v2, Ljavassist/compiler/ast/Keyword;

    invoke-direct {v2, v4}, Ljavassist/compiler/ast/Keyword;-><init>(I)V

    goto :goto_2f

    .line 1233
    :sswitch_36
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v3

    .line 1234
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljavassist/compiler/SymbolTable;->lookup(Ljava/lang/String;)Ljavassist/compiler/ast/Declarator;

    move-result-object v0

    .line 1235
    .local v0, "decl":Ljavassist/compiler/ast/Declarator;
    if-nez v0, :cond_48

    .line 1236
    new-instance v2, Ljavassist/compiler/ast/Member;

    invoke-direct {v2, v3}, Ljavassist/compiler/ast/Member;-><init>(Ljava/lang/String;)V

    goto :goto_2f

    .line 1238
    :cond_48
    new-instance v2, Ljavassist/compiler/ast/Variable;

    invoke-direct {v2, v3, v0}, Ljavassist/compiler/ast/Variable;-><init>(Ljava/lang/String;Ljavassist/compiler/ast/Declarator;)V

    goto :goto_2f

    .line 1240
    .end local v0    # "decl":Ljavassist/compiler/ast/Declarator;
    .end local v3    # "name":Ljava/lang/String;
    :sswitch_4e
    new-instance v2, Ljavassist/compiler/ast/StringL;

    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljavassist/compiler/ast/StringL;-><init>(Ljava/lang/String;)V

    goto :goto_2f

    .line 1242
    :sswitch_5a
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseNew(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/NewExpr;

    move-result-object v2

    goto :goto_2f

    .line 1244
    :sswitch_5f
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    .line 1245
    .local v2, "expr":Ljavassist/compiler/ast/ASTree;
    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v5}, Ljavassist/compiler/Lex;->get()I

    move-result v5

    const/16 v6, 0x29

    if-eq v5, v6, :cond_2f

    .line 1248
    new-instance v5, Ljavassist/compiler/CompileError;

    const-string v6, ") is missing"

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v5, v6, v7}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v5

    .line 1256
    .end local v2    # "expr":Ljavassist/compiler/ast/ASTree;
    :cond_77
    new-instance v5, Ljavassist/compiler/SyntaxError;

    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v5, v6}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v5

    .line 1225
    nop

    :sswitch_data_80
    .sparse-switch
        0x28 -> :sswitch_5f
        0x148 -> :sswitch_5a
        0x150 -> :sswitch_30
        0x153 -> :sswitch_30
        0x190 -> :sswitch_36
        0x196 -> :sswitch_4e
        0x19a -> :sswitch_30
        0x19b -> :sswitch_30
        0x19c -> :sswitch_30
    .end sparse-switch
.end method

.method private parseReturn(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v3, 0x3b

    .line 504
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    .line 505
    .local v1, "t":I
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v0, v1}, Ljavassist/compiler/ast/Stmnt;-><init>(I)V

    .line 506
    .local v0, "s":Ljavassist/compiler/ast/Stmnt;
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    if-eq v2, v3, :cond_1c

    .line 507
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavassist/compiler/ast/Stmnt;->setLeft(Ljavassist/compiler/ast/ASTree;)V

    .line 509
    :cond_1c
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    if-eq v2, v3, :cond_2e

    .line 510
    new-instance v2, Ljavassist/compiler/CompileError;

    const-string v3, "; is missing"

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v2

    .line 512
    :cond_2e
    return-object v0
.end method

.method private parseStmntOrCase(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v4, 0x136

    const/16 v3, 0x130

    .line 433
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    .line 434
    .local v1, "t":I
    if-eq v1, v3, :cond_13

    if-eq v1, v4, :cond_13

    .line 435
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 447
    :cond_12
    return-object v0

    .line 437
    :cond_13
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 439
    if-ne v1, v3, :cond_37

    .line 440
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    .line 444
    .local v0, "s":Ljavassist/compiler/ast/Stmnt;
    :goto_23
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    const/16 v3, 0x3a

    if-eq v2, v3, :cond_12

    .line 445
    new-instance v2, Ljavassist/compiler/CompileError;

    const-string v3, ": is missing"

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v2

    .line 442
    .end local v0    # "s":Ljavassist/compiler/ast/Stmnt;
    :cond_37
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v0, v4}, Ljavassist/compiler/ast/Stmnt;-><init>(I)V

    .restart local v0    # "s":Ljavassist/compiler/ast/Stmnt;
    goto :goto_23
.end method

.method private parseSwitch(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 394
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 395
    .local v2, "t":I
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseParExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 396
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseSwitchBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 397
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    new-instance v3, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v3, v2, v1, v0}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v3
.end method

.method private parseSwitchBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 13
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v10, 0x136

    const/16 v9, 0x130

    const/16 v8, 0x42

    .line 401
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v6

    const/16 v7, 0x7b

    if-eq v6, v7, :cond_18

    .line 402
    new-instance v6, Ljavassist/compiler/SyntaxError;

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v6

    .line 404
    :cond_18
    new-instance v5, Ljavassist/compiler/SymbolTable;

    invoke-direct {v5, p1}, Ljavassist/compiler/SymbolTable;-><init>(Ljavassist/compiler/SymbolTable;)V

    .line 405
    .local v5, "tbl2":Ljavassist/compiler/SymbolTable;
    invoke-direct {p0, v5}, Ljavassist/compiler/Parser;->parseStmntOrCase(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v3

    .line 406
    .local v3, "s":Ljavassist/compiler/ast/Stmnt;
    if-nez v3, :cond_2d

    .line 407
    new-instance v6, Ljavassist/compiler/CompileError;

    const-string v7, "empty switch block"

    iget-object v8, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7, v8}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v6

    .line 409
    :cond_2d
    invoke-virtual {v3}, Ljavassist/compiler/ast/Stmnt;->getOperator()I

    move-result v1

    .line 410
    .local v1, "op":I
    if-eq v1, v9, :cond_3f

    if-eq v1, v10, :cond_3f

    .line 411
    new-instance v6, Ljavassist/compiler/CompileError;

    const-string v7, "no case or default in a switch block"

    iget-object v8, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7, v8}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v6

    .line 414
    :cond_3f
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v0, v8, v3}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    .line 415
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    :cond_44
    :goto_44
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v6

    const/16 v7, 0x7d

    if-eq v6, v7, :cond_75

    .line 416
    invoke-direct {p0, v5}, Ljavassist/compiler/Parser;->parseStmntOrCase(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v4

    .line 417
    .local v4, "s2":Ljavassist/compiler/ast/Stmnt;
    if-eqz v4, :cond_44

    .line 418
    invoke-virtual {v4}, Ljavassist/compiler/ast/Stmnt;->getOperator()I

    move-result v2

    .line 419
    .local v2, "op2":I
    if-eq v2, v9, :cond_5c

    if-ne v2, v10, :cond_69

    .line 420
    :cond_5c
    new-instance v6, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v6, v8, v4}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    invoke-static {v0, v6}, Ljavassist/compiler/ast/ASTList;->concat(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .end local v0    # "body":Ljavassist/compiler/ast/Stmnt;
    check-cast v0, Ljavassist/compiler/ast/Stmnt;

    .line 421
    .restart local v0    # "body":Ljavassist/compiler/ast/Stmnt;
    move-object v3, v4

    goto :goto_44

    .line 424
    :cond_69
    new-instance v6, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v6, v8, v4}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    invoke-static {v3, v6}, Ljavassist/compiler/ast/ASTList;->concat(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    .end local v3    # "s":Ljavassist/compiler/ast/Stmnt;
    check-cast v3, Ljavassist/compiler/ast/Stmnt;

    .restart local v3    # "s":Ljavassist/compiler/ast/Stmnt;
    goto :goto_44

    .line 428
    .end local v2    # "op2":I
    .end local v4    # "s2":Ljavassist/compiler/ast/Stmnt;
    :cond_75
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 429
    return-object v0
.end method

.method private parseSynchronized(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 454
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 455
    .local v2, "t":I
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x28

    if-eq v3, v4, :cond_18

    .line 456
    new-instance v3, Ljavassist/compiler/SyntaxError;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v3

    .line 458
    :cond_18
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 459
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v3

    const/16 v4, 0x29

    if-eq v3, v4, :cond_2e

    .line 460
    new-instance v3, Ljavassist/compiler/SyntaxError;

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v3, v4}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v3

    .line 462
    :cond_2e
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 463
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    new-instance v3, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v3, v2, v1, v0}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v3
.end method

.method private parseThrow(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 518
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v1

    .line 519
    .local v1, "t":I
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 520
    .local v0, "expr":Ljavassist/compiler/ast/ASTree;
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    const/16 v3, 0x3b

    if-eq v2, v3, :cond_1e

    .line 521
    new-instance v2, Ljavassist/compiler/CompileError;

    const-string v3, "; is missing"

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v2, v3, v4}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v2

    .line 523
    :cond_1e
    new-instance v2, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v2, v1, v0}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;)V

    return-object v2
.end method

.method private parseTry(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 10
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 472
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 473
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v1

    .line 474
    .local v1, "block":Ljavassist/compiler/ast/Stmnt;
    const/4 v2, 0x0

    .line 475
    .local v2, "catchList":Ljavassist/compiler/ast/ASTList;
    :goto_a
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v6

    const/16 v7, 0x131

    if-ne v6, v7, :cond_6a

    .line 476
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 477
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v6

    const/16 v7, 0x28

    if-eq v6, v7, :cond_2b

    .line 478
    new-instance v6, Ljavassist/compiler/SyntaxError;

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v6

    .line 480
    :cond_2b
    new-instance v5, Ljavassist/compiler/SymbolTable;

    invoke-direct {v5, p1}, Ljavassist/compiler/SymbolTable;-><init>(Ljavassist/compiler/SymbolTable;)V

    .line 481
    .local v5, "tbl2":Ljavassist/compiler/SymbolTable;
    invoke-direct {p0, v5}, Ljavassist/compiler/Parser;->parseFormalParam(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Declarator;

    move-result-object v3

    .line 482
    .local v3, "d":Ljavassist/compiler/ast/Declarator;
    invoke-virtual {v3}, Ljavassist/compiler/ast/Declarator;->getArrayDim()I

    move-result v6

    if-gtz v6, :cond_42

    invoke-virtual {v3}, Ljavassist/compiler/ast/Declarator;->getType()I

    move-result v6

    const/16 v7, 0x133

    if-eq v6, v7, :cond_4a

    .line 483
    :cond_42
    new-instance v6, Ljavassist/compiler/SyntaxError;

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v6

    .line 485
    :cond_4a
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    move-result v6

    const/16 v7, 0x29

    if-eq v6, v7, :cond_5c

    .line 486
    new-instance v6, Ljavassist/compiler/SyntaxError;

    iget-object v7, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v6, v7}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v6

    .line 488
    :cond_5c
    invoke-direct {p0, v5}, Ljavassist/compiler/Parser;->parseBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 489
    .local v0, "b":Ljavassist/compiler/ast/Stmnt;
    new-instance v6, Ljavassist/compiler/ast/Pair;

    invoke-direct {v6, v3, v0}, Ljavassist/compiler/ast/Pair;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V

    invoke-static {v2, v6}, Ljavassist/compiler/ast/ASTList;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    .line 490
    goto :goto_a

    .line 492
    .end local v0    # "b":Ljavassist/compiler/ast/Stmnt;
    .end local v3    # "d":Ljavassist/compiler/ast/Declarator;
    .end local v5    # "tbl2":Ljavassist/compiler/SymbolTable;
    :cond_6a
    const/4 v4, 0x0

    .line 493
    .local v4, "finallyBlock":Ljavassist/compiler/ast/Stmnt;
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v6

    const/16 v7, 0x13c

    if-ne v6, v7, :cond_7e

    .line 494
    iget-object v6, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v6}, Ljavassist/compiler/Lex;->get()I

    .line 495
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v4

    .line 498
    :cond_7e
    const/16 v6, 0x157

    invoke-static {v6, v1, v2, v4}, Ljavassist/compiler/ast/Stmnt;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v6

    return-object v6
.end method

.method private parseUnaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 859
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v2

    sparse-switch v2, :sswitch_data_54

    .line 888
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parsePostfix(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    :goto_d
    return-object v2

    .line 866
    :sswitch_e
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    move-result v0

    .line 867
    .local v0, "t":I
    const/16 v2, 0x2d

    if-ne v0, v2, :cond_21

    .line 868
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    .line 869
    .local v1, "t2":I
    packed-switch v1, :pswitch_data_72

    .line 884
    .end local v1    # "t2":I
    :cond_21
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseUnaryExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    invoke-static {v0, v2}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v2

    goto :goto_d

    .line 873
    .restart local v1    # "t2":I
    :pswitch_2a
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 874
    new-instance v2, Ljavassist/compiler/ast/IntConst;

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->getLong()J

    move-result-wide v3

    neg-long v3, v3

    invoke-direct {v2, v3, v4, v1}, Ljavassist/compiler/ast/IntConst;-><init>(JI)V

    goto :goto_d

    .line 877
    :pswitch_3c
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 878
    new-instance v2, Ljavassist/compiler/ast/DoubleConst;

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->getDouble()D

    move-result-wide v3

    neg-double v3, v3

    invoke-direct {v2, v3, v4, v1}, Ljavassist/compiler/ast/DoubleConst;-><init>(DI)V

    goto :goto_d

    .line 886
    .end local v0    # "t":I
    .end local v1    # "t2":I
    :sswitch_4e
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseCast(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    goto :goto_d

    .line 859
    nop

    :sswitch_data_54
    .sparse-switch
        0x21 -> :sswitch_e
        0x28 -> :sswitch_4e
        0x2b -> :sswitch_e
        0x2d -> :sswitch_e
        0x7e -> :sswitch_e
        0x16a -> :sswitch_e
        0x16b -> :sswitch_e
    .end sparse-switch

    .line 869
    :pswitch_data_72
    .packed-switch 0x191
        :pswitch_2a
        :pswitch_2a
        :pswitch_2a
        :pswitch_3c
        :pswitch_3c
    .end packed-switch
.end method

.method private parseWhile(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 324
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 325
    .local v2, "t":I
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseParExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 326
    .local v1, "expr":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 327
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    new-instance v3, Ljavassist/compiler/ast/Stmnt;

    invoke-direct {v3, v2, v1, v0}, Ljavassist/compiler/ast/Stmnt;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v3
.end method

.method private toClassName(Ljavassist/compiler/ast/ASTree;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 1184
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 1185
    .local v0, "sbuf":Ljava/lang/StringBuffer;
    invoke-direct {p0, p1, v0}, Ljavassist/compiler/Parser;->toClassName(Ljavassist/compiler/ast/ASTree;Ljava/lang/StringBuffer;)V

    .line 1186
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private toClassName(Ljavassist/compiler/ast/ASTree;Ljava/lang/StringBuffer;)V
    .registers 7
    .param p1, "name"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "sbuf"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v2, 0x2e

    .line 1192
    instance-of v1, p1, Ljavassist/compiler/ast/Symbol;

    if-eqz v1, :cond_10

    .line 1193
    check-cast p1, Ljavassist/compiler/ast/Symbol;

    .end local p1    # "name":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {p1}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1202
    :goto_f
    return-void

    .line 1196
    .restart local p1    # "name":Ljavassist/compiler/ast/ASTree;
    :cond_10
    instance-of v1, p1, Ljavassist/compiler/ast/Expr;

    if-eqz v1, :cond_2f

    move-object v0, p1

    .line 1197
    check-cast v0, Ljavassist/compiler/ast/Expr;

    .line 1198
    .local v0, "expr":Ljavassist/compiler/ast/Expr;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->getOperator()I

    move-result v1

    if-ne v1, v2, :cond_2f

    .line 1199
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Ljavassist/compiler/Parser;->toClassName(Ljavassist/compiler/ast/ASTree;Ljava/lang/StringBuffer;)V

    .line 1200
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1201
    invoke-virtual {v0}, Ljavassist/compiler/ast/Expr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Ljavassist/compiler/Parser;->toClassName(Ljavassist/compiler/ast/ASTree;Ljava/lang/StringBuffer;)V

    goto :goto_f

    .line 1206
    .end local v0    # "expr":Ljavassist/compiler/ast/Expr;
    :cond_2f
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "bad static member access"

    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v1, v2, v3}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;Ljavassist/compiler/Lex;)V

    throw v1
.end method


# virtual methods
.method public hasMore()Z
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v0}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v0

    if-ltz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 699
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseConditionalExpr(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 700
    .local v0, "left":Ljavassist/compiler/ast/ASTree;
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v3

    invoke-static {v3}, Ljavassist/compiler/Parser;->isAssignOp(I)Z

    move-result v3

    if-nez v3, :cond_11

    .line 705
    .end local v0    # "left":Ljavassist/compiler/ast/ASTree;
    :goto_10
    return-object v0

    .line 703
    .restart local v0    # "left":Ljavassist/compiler/ast/ASTree;
    :cond_11
    iget-object v3, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v3}, Ljavassist/compiler/Lex;->get()I

    move-result v2

    .line 704
    .local v2, "t":I
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseExpression(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 705
    .local v1, "right":Ljavassist/compiler/ast/ASTree;
    invoke-static {v2, v0, v1}, Ljavassist/compiler/ast/AssignExpr;->makeAssign(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/AssignExpr;

    move-result-object v0

    goto :goto_10
.end method

.method public parseMember(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;
    .registers 4
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseMember1(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .line 35
    .local v0, "mem":Ljavassist/compiler/ast/ASTList;
    instance-of v1, v0, Ljavassist/compiler/ast/MethodDecl;

    if-eqz v1, :cond_e

    .line 36
    check-cast v0, Ljavassist/compiler/ast/MethodDecl;

    .end local v0    # "mem":Ljavassist/compiler/ast/ASTList;
    invoke-virtual {p0, p1, v0}, Ljavassist/compiler/Parser;->parseMethod2(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/MethodDecl;)Ljavassist/compiler/ast/MethodDecl;

    move-result-object v0

    .line 38
    :cond_e
    return-object v0
.end method

.method public parseMember1(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/ASTList;
    .registers 10
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/16 v7, 0x190

    const/16 v6, 0x28

    .line 44
    invoke-direct {p0}, Ljavassist/compiler/Parser;->parseMemberMods()Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    .line 46
    .local v2, "mods":Ljavassist/compiler/ast/ASTList;
    const/4 v1, 0x0

    .line 47
    .local v1, "isConstructor":Z
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v4

    if-ne v4, v7, :cond_33

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v4

    if-ne v4, v6, :cond_33

    .line 48
    new-instance v0, Ljavassist/compiler/ast/Declarator;

    const/16 v4, 0x158

    const/4 v5, 0x0

    invoke-direct {v0, v4, v5}, Ljavassist/compiler/ast/Declarator;-><init>(II)V

    .line 49
    .local v0, "d":Ljavassist/compiler/ast/Declarator;
    const/4 v1, 0x1

    .line 54
    :goto_23
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->get()I

    move-result v4

    if-eq v4, v7, :cond_38

    .line 55
    new-instance v4, Ljavassist/compiler/SyntaxError;

    iget-object v5, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-direct {v4, v5}, Ljavassist/compiler/SyntaxError;-><init>(Ljavassist/compiler/Lex;)V

    throw v4

    .line 52
    .end local v0    # "d":Ljavassist/compiler/ast/Declarator;
    :cond_33
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseFormalType(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Declarator;

    move-result-object v0

    .restart local v0    # "d":Ljavassist/compiler/ast/Declarator;
    goto :goto_23

    .line 58
    :cond_38
    if-eqz v1, :cond_53

    .line 59
    const-string v3, "<init>"

    .line 63
    .local v3, "name":Ljava/lang/String;
    :goto_3c
    new-instance v4, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v4, v3}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Ljavassist/compiler/ast/Declarator;->setVariable(Ljavassist/compiler/ast/Symbol;)V

    .line 64
    if-nez v1, :cond_4e

    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v4

    if-ne v4, v6, :cond_5a

    .line 65
    :cond_4e
    invoke-direct {p0, p1, v1, v2, v0}, Ljavassist/compiler/Parser;->parseMethod1(Ljavassist/compiler/SymbolTable;ZLjavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/MethodDecl;

    move-result-object v4

    .line 67
    :goto_52
    return-object v4

    .line 61
    .end local v3    # "name":Ljava/lang/String;
    :cond_53
    iget-object v4, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v4}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "name":Ljava/lang/String;
    goto :goto_3c

    .line 67
    :cond_5a
    invoke-direct {p0, p1, v2, v0}, Ljavassist/compiler/Parser;->parseField(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/Declarator;)Ljavassist/compiler/ast/FieldDecl;

    move-result-object v4

    goto :goto_52
.end method

.method public parseMethod2(Ljavassist/compiler/SymbolTable;Ljavassist/compiler/ast/MethodDecl;)Ljavassist/compiler/ast/MethodDecl;
    .registers 6
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .param p2, "md"    # Ljavassist/compiler/ast/MethodDecl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 148
    const/4 v0, 0x0

    .line 149
    .local v0, "body":Ljavassist/compiler/ast/Stmnt;
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    const/16 v2, 0x3b

    if-ne v1, v2, :cond_19

    .line 150
    iget-object v1, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v1}, Ljavassist/compiler/Lex;->get()I

    .line 157
    :cond_10
    :goto_10
    const/4 v1, 0x4

    invoke-virtual {p2, v1}, Ljavassist/compiler/ast/MethodDecl;->sublist(I)Ljavassist/compiler/ast/ASTList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljavassist/compiler/ast/ASTList;->setHead(Ljavassist/compiler/ast/ASTree;)V

    .line 158
    return-object p2

    .line 152
    :cond_19
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v0

    .line 153
    if-nez v0, :cond_10

    .line 154
    new-instance v0, Ljavassist/compiler/ast/Stmnt;

    .end local v0    # "body":Ljavassist/compiler/ast/Stmnt;
    const/16 v1, 0x42

    invoke-direct {v0, v1}, Ljavassist/compiler/ast/Stmnt;-><init>(I)V

    .restart local v0    # "body":Ljavassist/compiler/ast/Stmnt;
    goto :goto_10
.end method

.method public parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;
    .registers 7
    .param p1, "tbl"    # Ljavassist/compiler/SymbolTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 241
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->lookAhead()I

    move-result v1

    .line 242
    .local v1, "t":I
    const/16 v2, 0x7b

    if-ne v1, v2, :cond_f

    .line 243
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseBlock(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    .line 277
    :goto_e
    return-object v2

    .line 244
    :cond_f
    const/16 v2, 0x3b

    if-ne v1, v2, :cond_20

    .line 245
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 246
    new-instance v2, Ljavassist/compiler/ast/Stmnt;

    const/16 v3, 0x42

    invoke-direct {v2, v3}, Ljavassist/compiler/ast/Stmnt;-><init>(I)V

    goto :goto_e

    .line 248
    :cond_20
    const/16 v2, 0x190

    if-ne v1, v2, :cond_4f

    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljavassist/compiler/Lex;->lookAhead(I)I

    move-result v2

    const/16 v3, 0x3a

    if-ne v2, v3, :cond_4f

    .line 249
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 250
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->getString()Ljava/lang/String;

    move-result-object v0

    .line 251
    .local v0, "label":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/compiler/Parser;->lex:Ljavassist/compiler/Lex;

    invoke-virtual {v2}, Ljavassist/compiler/Lex;->get()I

    .line 252
    const/16 v2, 0x4c

    new-instance v3, Ljavassist/compiler/ast/Symbol;

    invoke-direct {v3, v0}, Ljavassist/compiler/ast/Symbol;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljavassist/compiler/Parser;->parseStatement(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v4

    invoke-static {v2, v3, v4}, Ljavassist/compiler/ast/Stmnt;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto :goto_e

    .line 254
    .end local v0    # "label":Ljava/lang/String;
    :cond_4f
    const/16 v2, 0x140

    if-ne v1, v2, :cond_58

    .line 255
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseIf(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto :goto_e

    .line 256
    :cond_58
    const/16 v2, 0x15a

    if-ne v1, v2, :cond_61

    .line 257
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseWhile(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto :goto_e

    .line 258
    :cond_61
    const/16 v2, 0x137

    if-ne v1, v2, :cond_6a

    .line 259
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseDo(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto :goto_e

    .line 260
    :cond_6a
    const/16 v2, 0x13e

    if-ne v1, v2, :cond_73

    .line 261
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseFor(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto :goto_e

    .line 262
    :cond_73
    const/16 v2, 0x157

    if-ne v1, v2, :cond_7c

    .line 263
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseTry(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto :goto_e

    .line 264
    :cond_7c
    const/16 v2, 0x151

    if-ne v1, v2, :cond_85

    .line 265
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseSwitch(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto :goto_e

    .line 266
    :cond_85
    const/16 v2, 0x152

    if-ne v1, v2, :cond_8e

    .line 267
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseSynchronized(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto :goto_e

    .line 268
    :cond_8e
    const/16 v2, 0x14d

    if-ne v1, v2, :cond_98

    .line 269
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseReturn(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto/16 :goto_e

    .line 270
    :cond_98
    const/16 v2, 0x154

    if-ne v1, v2, :cond_a2

    .line 271
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseThrow(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto/16 :goto_e

    .line 272
    :cond_a2
    const/16 v2, 0x12e

    if-ne v1, v2, :cond_ac

    .line 273
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseBreak(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto/16 :goto_e

    .line 274
    :cond_ac
    const/16 v2, 0x135

    if-ne v1, v2, :cond_b6

    .line 275
    invoke-direct {p0, p1}, Ljavassist/compiler/Parser;->parseContinue(Ljavassist/compiler/SymbolTable;)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto/16 :goto_e

    .line 277
    :cond_b6
    const/4 v2, 0x0

    invoke-direct {p0, p1, v2}, Ljavassist/compiler/Parser;->parseDeclarationOrExpression(Ljavassist/compiler/SymbolTable;Z)Ljavassist/compiler/ast/Stmnt;

    move-result-object v2

    goto/16 :goto_e
.end method
