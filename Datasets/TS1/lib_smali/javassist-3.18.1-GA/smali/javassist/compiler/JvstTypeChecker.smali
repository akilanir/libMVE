.class public Ljavassist/compiler/JvstTypeChecker;
.super Ljavassist/compiler/TypeChecker;
.source "JvstTypeChecker.java"


# instance fields
.field private codeGen:Ljavassist/compiler/JvstCodeGen;


# direct methods
.method public constructor <init>(Ljavassist/CtClass;Ljavassist/ClassPool;Ljavassist/compiler/JvstCodeGen;)V
    .registers 4
    .param p1, "cc"    # Ljavassist/CtClass;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "gen"    # Ljavassist/compiler/JvstCodeGen;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/TypeChecker;-><init>(Ljavassist/CtClass;Ljavassist/ClassPool;)V

    .line 30
    iput-object p3, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    .line 31
    return-void
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
    .line 263
    invoke-virtual {p1}, Ljavassist/CtClass;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_19

    move-object v1, p1

    .line 264
    check-cast v1, Ljavassist/CtPrimitiveType;

    .line 265
    .local v1, "pt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v2

    invoke-static {v2}, Ljavassist/compiler/MemberResolver;->descToType(C)I

    move-result v2

    iput v2, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 266
    iput p2, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 267
    const/4 v2, 0x0

    iput-object v2, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    .line 281
    .end local v1    # "pt":Ljavassist/CtPrimitiveType;
    :goto_18
    return-void

    .line 269
    :cond_19
    invoke-virtual {p1}, Ljavassist/CtClass;->isArray()Z

    move-result v2

    if-eqz v2, :cond_47

    .line 271
    :try_start_1f
    invoke-virtual {p1}, Ljavassist/CtClass;->getComponentType()Ljavassist/CtClass;

    move-result-object v2

    add-int/lit8 v3, p2, 0x1

    invoke-direct {p0, v2, v3}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;I)V
    :try_end_28
    .catch Ljavassist/NotFoundException; {:try_start_1f .. :try_end_28} :catch_29

    goto :goto_18

    .line 273
    :catch_29
    move-exception v0

    .line 274
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

    .line 277
    .end local v0    # "e":Ljavassist/NotFoundException;
    :cond_47
    const/16 v2, 0x133

    iput v2, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 278
    iput p2, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 279
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljavassist/compiler/MemberResolver;->javaToJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    goto :goto_18
.end method


# virtual methods
.method public addNullIfVoid()V
    .registers 3

    .prologue
    .line 37
    iget v0, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    const/16 v1, 0x158

    if-ne v0, v1, :cond_11

    .line 38
    const/16 v0, 0x133

    iput v0, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 39
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 40
    const-string v0, "java/lang/Object"

    iput-object v0, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    .line 42
    :cond_11
    return-void
.end method

.method public atCallExpr(Ljavassist/compiler/ast/CallExpr;)V
    .registers 6
    .param p1, "expr"    # Ljavassist/compiler/ast/CallExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 142
    invoke-virtual {p1}, Ljavassist/compiler/ast/CallExpr;->oprand1()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 143
    .local v0, "method":Ljavassist/compiler/ast/ASTree;
    instance-of v2, v0, Ljavassist/compiler/ast/Member;

    if-eqz v2, :cond_3e

    .line 144
    check-cast v0, Ljavassist/compiler/ast/Member;

    .end local v0    # "method":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, "name":Ljava/lang/String;
    iget-object v2, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v2, v2, Ljavassist/compiler/JvstCodeGen;->procHandler:Ljavassist/compiler/ProceedHandler;

    if-eqz v2, :cond_2c

    iget-object v2, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v2, v2, Ljavassist/compiler/JvstCodeGen;->proceedName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 147
    iget-object v2, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v3, v2, Ljavassist/compiler/JvstCodeGen;->procHandler:Ljavassist/compiler/ProceedHandler;

    invoke-virtual {p1}, Ljavassist/compiler/ast/CallExpr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    check-cast v2, Ljavassist/compiler/ast/ASTList;

    invoke-interface {v3, p0, v2}, Ljavassist/compiler/ProceedHandler;->setReturnType(Ljavassist/compiler/JvstTypeChecker;Ljavassist/compiler/ast/ASTList;)V

    .line 158
    .end local v1    # "name":Ljava/lang/String;
    :goto_2b
    return-void

    .line 151
    .restart local v1    # "name":Ljava/lang/String;
    :cond_2c
    const-string v2, "$cflow"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 152
    invoke-virtual {p1}, Ljavassist/compiler/ast/CallExpr;->oprand2()Ljavassist/compiler/ast/ASTree;

    move-result-object v2

    check-cast v2, Ljavassist/compiler/ast/ASTList;

    invoke-virtual {p0, v2}, Ljavassist/compiler/JvstTypeChecker;->atCflow(Ljavassist/compiler/ast/ASTList;)V

    goto :goto_2b

    .line 157
    .end local v1    # "name":Ljava/lang/String;
    :cond_3e
    invoke-super {p0, p1}, Ljavassist/compiler/TypeChecker;->atCallExpr(Ljavassist/compiler/ast/CallExpr;)V

    goto :goto_2b
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
    .line 88
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getClassName()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    .line 89
    .local v0, "classname":Ljavassist/compiler/ast/ASTList;
    if-eqz v0, :cond_3a

    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getArrayDim()I

    move-result v3

    if-nez v3, :cond_3a

    .line 90
    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    .line 91
    .local v1, "p":Ljavassist/compiler/ast/ASTree;
    instance-of v3, v1, Ljavassist/compiler/ast/Symbol;

    if-eqz v3, :cond_3a

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v3

    if-nez v3, :cond_3a

    .line 92
    check-cast v1, Ljavassist/compiler/ast/Symbol;

    .end local v1    # "p":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v1}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v2

    .line 93
    .local v2, "typename":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v3, v3, Ljavassist/compiler/JvstCodeGen;->returnCastName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 94
    invoke-virtual {p0, p1}, Ljavassist/compiler/JvstTypeChecker;->atCastToRtype(Ljavassist/compiler/ast/CastExpr;)V

    .line 105
    .end local v2    # "typename":Ljava/lang/String;
    :goto_2d
    return-void

    .line 97
    .restart local v2    # "typename":Ljava/lang/String;
    :cond_2e
    const-string v3, "$w"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 98
    invoke-virtual {p0, p1}, Ljavassist/compiler/JvstTypeChecker;->atCastToWrapper(Ljavassist/compiler/ast/CastExpr;)V

    goto :goto_2d

    .line 104
    .end local v2    # "typename":Ljava/lang/String;
    :cond_3a
    invoke-super {p0, p1}, Ljavassist/compiler/TypeChecker;->atCastExpr(Ljavassist/compiler/ast/CastExpr;)V

    goto :goto_2d
.end method

.method protected atCastToRtype(Ljavassist/compiler/ast/CastExpr;)V
    .registers 7
    .param p1, "expr"    # Ljavassist/compiler/ast/CastExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v3, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v2, v3, Ljavassist/compiler/JvstCodeGen;->returnType:Ljavassist/CtClass;

    .line 113
    .local v2, "returnType":Ljavassist/CtClass;
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getOprand()Ljavassist/compiler/ast/ASTree;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 114
    iget v3, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    const/16 v4, 0x158

    if-eq v3, v4, :cond_1d

    iget v3, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    invoke-static {v3}, Ljavassist/compiler/CodeGen;->isRefType(I)Z

    move-result v3

    if-nez v3, :cond_1d

    iget v3, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    if-lez v3, :cond_21

    .line 115
    :cond_1d
    invoke-virtual {p0, v2}, Ljavassist/compiler/JvstTypeChecker;->compileUnwrapValue(Ljavassist/CtClass;)V

    .line 123
    :cond_20
    :goto_20
    return-void

    .line 116
    :cond_21
    instance-of v3, v2, Ljavassist/CtPrimitiveType;

    if-eqz v3, :cond_20

    move-object v1, v2

    .line 117
    check-cast v1, Ljavassist/CtPrimitiveType;

    .line 118
    .local v1, "pt":Ljavassist/CtPrimitiveType;
    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getDescriptor()C

    move-result v3

    invoke-static {v3}, Ljavassist/compiler/MemberResolver;->descToType(C)I

    move-result v0

    .line 119
    .local v0, "destType":I
    iput v0, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 120
    const/4 v3, 0x0

    iput v3, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 121
    const/4 v3, 0x0

    iput-object v3, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    goto :goto_20
.end method

.method protected atCastToWrapper(Ljavassist/compiler/ast/CastExpr;)V
    .registers 7
    .param p1, "expr"    # Ljavassist/compiler/ast/CastExpr;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 126
    invoke-virtual {p1}, Ljavassist/compiler/ast/CastExpr;->getOprand()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 127
    iget v1, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    invoke-static {v1}, Ljavassist/compiler/CodeGen;->isRefType(I)Z

    move-result v1

    if-nez v1, :cond_13

    iget v1, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    if-lez v1, :cond_14

    .line 136
    :cond_13
    :goto_13
    return-void

    .line 130
    :cond_14
    iget-object v1, p0, Ljavassist/compiler/JvstTypeChecker;->resolver:Ljavassist/compiler/MemberResolver;

    iget v2, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    iget v3, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    iget-object v4, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Ljavassist/compiler/MemberResolver;->lookupClass(IILjava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 131
    .local v0, "clazz":Ljavassist/CtClass;
    instance-of v1, v0, Ljavassist/CtPrimitiveType;

    if-eqz v1, :cond_13

    .line 132
    const/16 v1, 0x133

    iput v1, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 133
    const/4 v1, 0x0

    iput v1, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 134
    const-string v1, "java/lang/Object"

    iput-object v1, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    goto :goto_13
.end method

.method protected atCflow(Ljavassist/compiler/ast/ASTList;)V
    .registers 3
    .param p1, "cname"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 163
    const/16 v0, 0x144

    iput v0, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 164
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 165
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    .line 166
    return-void
.end method

.method protected atFieldAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V
    .registers 10
    .param p1, "expr"    # Ljavassist/compiler/ast/Expr;
    .param p2, "op"    # I
    .param p3, "left"    # Ljavassist/compiler/ast/ASTree;
    .param p4, "right"    # Ljavassist/compiler/ast/ASTree;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 72
    instance-of v3, p3, Ljavassist/compiler/ast/Member;

    if-eqz v3, :cond_2b

    move-object v3, p3

    check-cast v3, Ljavassist/compiler/ast/Member;

    invoke-virtual {v3}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v4, v4, Ljavassist/compiler/JvstCodeGen;->paramArrayName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 74
    invoke-virtual {p4, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 75
    iget-object v3, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v2, v3, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    .line 76
    .local v2, "params":[Ljavassist/CtClass;
    if-nez v2, :cond_1f

    .line 85
    .end local v2    # "params":[Ljavassist/CtClass;
    :cond_1e
    :goto_1e
    return-void

    .line 79
    .restart local v2    # "params":[Ljavassist/CtClass;
    :cond_1f
    array-length v1, v2

    .line 80
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    if-ge v0, v1, :cond_1e

    .line 81
    aget-object v3, v2, v0

    invoke-virtual {p0, v3}, Ljavassist/compiler/JvstTypeChecker;->compileUnwrapValue(Ljavassist/CtClass;)V

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 84
    .end local v0    # "i":I
    .end local v1    # "n":I
    .end local v2    # "params":[Ljavassist/CtClass;
    :cond_2b
    invoke-super {p0, p1, p2, p3, p4}, Ljavassist/compiler/TypeChecker;->atFieldAssign(Ljavassist/compiler/ast/Expr;ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V

    goto :goto_1e
.end method

.method public atMember(Ljavassist/compiler/ast/Member;)V
    .registers 6
    .param p1, "mem"    # Ljavassist/compiler/ast/Member;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/16 v2, 0x133

    .line 48
    invoke-virtual {p1}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v1, v1, Ljavassist/compiler/JvstCodeGen;->paramArrayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 50
    iput v2, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 51
    iput v3, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 52
    const-string v1, "java/lang/Object"

    iput-object v1, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    .line 67
    :goto_19
    return-void

    .line 54
    :cond_1a
    const-string v1, "$sig"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 55
    iput v2, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 56
    iput v3, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 57
    const-string v1, "java/lang/Class"

    iput-object v1, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    goto :goto_19

    .line 59
    :cond_2b
    const-string v1, "$type"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3b

    const-string v1, "$class"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 61
    :cond_3b
    iput v2, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    .line 62
    const/4 v1, 0x0

    iput v1, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    .line 63
    const-string v1, "java/lang/Class"

    iput-object v1, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    goto :goto_19

    .line 66
    :cond_45
    invoke-super {p0, p1}, Ljavassist/compiler/TypeChecker;->atMember(Ljavassist/compiler/ast/Member;)V

    goto :goto_19
.end method

.method public atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V
    .registers 13
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
    .line 202
    iget-object v7, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v5, v7, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    .line 203
    .local v5, "params":[Ljavassist/CtClass;
    iget-object v7, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v6, v7, Ljavassist/compiler/JvstCodeGen;->paramListName:Ljava/lang/String;

    .line 204
    .local v6, "pname":Ljava/lang/String;
    const/4 v1, 0x0

    .line 205
    .local v1, "i":I
    :goto_9
    if-eqz p1, :cond_52

    .line 206
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 207
    .local v0, "a":Ljavassist/compiler/ast/ASTree;
    instance-of v7, v0, Ljavassist/compiler/ast/Member;

    if-eqz v7, :cond_3c

    move-object v7, v0

    check-cast v7, Ljavassist/compiler/ast/Member;

    invoke-virtual {v7}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3c

    .line 208
    if-eqz v5, :cond_4d

    .line 209
    array-length v3, v5

    .line 210
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_24
    if-ge v2, v3, :cond_4d

    .line 211
    aget-object v4, v5, v2

    .line 212
    .local v4, "p":Ljavassist/CtClass;
    invoke-virtual {p0, v4}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;)V

    .line 213
    iget v7, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    aput v7, p2, v1

    .line 214
    iget v7, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    aput v7, p3, v1

    .line 215
    iget-object v7, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    aput-object v7, p4, v1

    .line 216
    add-int/lit8 v1, v1, 0x1

    .line 210
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 221
    .end local v2    # "k":I
    .end local v3    # "n":I
    .end local v4    # "p":Ljavassist/CtClass;
    :cond_3c
    invoke-virtual {v0, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 222
    iget v7, p0, Ljavassist/compiler/JvstTypeChecker;->exprType:I

    aput v7, p2, v1

    .line 223
    iget v7, p0, Ljavassist/compiler/JvstTypeChecker;->arrayDim:I

    aput v7, p3, v1

    .line 224
    iget-object v7, p0, Ljavassist/compiler/JvstTypeChecker;->className:Ljava/lang/String;

    aput-object v7, p4, v1

    .line 225
    add-int/lit8 v1, v1, 0x1

    .line 228
    :cond_4d
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object p1

    .line 229
    goto :goto_9

    .line 230
    .end local v0    # "a":Ljavassist/compiler/ast/ASTree;
    :cond_52
    return-void
.end method

.method compileInvokeSpecial(Ljavassist/compiler/ast/ASTree;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljavassist/compiler/ast/ASTList;)V
    .registers 10
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
    .line 239
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 240
    invoke-virtual {p0, p5}, Ljavassist/compiler/JvstTypeChecker;->getMethodArgsLength(Ljavassist/compiler/ast/ASTList;)I

    move-result v0

    .line 241
    .local v0, "nargs":I
    new-array v1, v0, [I

    new-array v2, v0, [I

    new-array v3, v0, [Ljava/lang/String;

    invoke-virtual {p0, p5, v1, v2, v3}, Ljavassist/compiler/JvstTypeChecker;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 243
    invoke-virtual {p0, p4}, Ljavassist/compiler/JvstTypeChecker;->setReturnType(Ljava/lang/String;)V

    .line 244
    invoke-virtual {p0}, Ljavassist/compiler/JvstTypeChecker;->addNullIfVoid()V

    .line 245
    return-void
.end method

.method protected compileUnwrapValue(Ljavassist/CtClass;)V
    .registers 3
    .param p1, "type"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 249
    sget-object v0, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    if-ne p1, v0, :cond_8

    .line 250
    invoke-virtual {p0}, Ljavassist/compiler/JvstTypeChecker;->addNullIfVoid()V

    .line 253
    :goto_7
    return-void

    .line 252
    :cond_8
    invoke-virtual {p0, p1}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;)V

    goto :goto_7
.end method

.method public getMethodArgsLength(Ljavassist/compiler/ast/ASTList;)I
    .registers 6
    .param p1, "args"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 183
    iget-object v3, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v2, v3, Ljavassist/compiler/JvstCodeGen;->paramListName:Ljava/lang/String;

    .line 184
    .local v2, "pname":Ljava/lang/String;
    const/4 v1, 0x0

    .line 185
    .local v1, "n":I
    :goto_5
    if-eqz p1, :cond_2f

    .line 186
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 187
    .local v0, "a":Ljavassist/compiler/ast/ASTree;
    instance-of v3, v0, Ljavassist/compiler/ast/Member;

    if-eqz v3, :cond_2c

    check-cast v0, Ljavassist/compiler/ast/Member;

    .end local v0    # "a":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 188
    iget-object v3, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v3, v3, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    if-eqz v3, :cond_27

    .line 189
    iget-object v3, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v3, v3, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    array-length v3, v3

    add-int/2addr v1, v3

    .line 194
    :cond_27
    :goto_27
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object p1

    .line 195
    goto :goto_5

    .line 192
    :cond_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 197
    :cond_2f
    return v1
.end method

.method public isParamListName(Ljavassist/compiler/ast/ASTList;)Z
    .registers 6
    .param p1, "args"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    const/4 v1, 0x0

    .line 172
    iget-object v2, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v2, v2, Ljavassist/compiler/JvstCodeGen;->paramTypeList:[Ljavassist/CtClass;

    if-eqz v2, :cond_28

    if-eqz p1, :cond_28

    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v2

    if-nez v2, :cond_28

    .line 174
    invoke-virtual {p1}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 175
    .local v0, "left":Ljavassist/compiler/ast/ASTree;
    instance-of v2, v0, Ljavassist/compiler/ast/Member;

    if-eqz v2, :cond_28

    check-cast v0, Ljavassist/compiler/ast/Member;

    .end local v0    # "left":Ljavassist/compiler/ast/ASTree;
    invoke-virtual {v0}, Ljavassist/compiler/ast/Member;->get()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Ljavassist/compiler/JvstTypeChecker;->codeGen:Ljavassist/compiler/JvstCodeGen;

    iget-object v3, v3, Ljavassist/compiler/JvstCodeGen;->paramListName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    const/4 v1, 0x1

    .line 179
    :cond_28
    return v1
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
    .line 259
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;I)V

    .line 260
    return-void
.end method
