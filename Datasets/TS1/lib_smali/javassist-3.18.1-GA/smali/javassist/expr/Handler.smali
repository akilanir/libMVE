.class public Ljavassist/expr/Handler;
.super Ljavassist/expr/Expr;
.source "Handler.java"


# static fields
.field private static EXCEPTION_NAME:Ljava/lang/String;


# instance fields
.field private etable:Ljavassist/bytecode/ExceptionTable;

.field private index:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const-string v0, "$1"

    sput-object v0, Ljavassist/expr/Handler;->EXCEPTION_NAME:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Ljavassist/bytecode/ExceptionTable;ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V
    .registers 7
    .param p1, "et"    # Ljavassist/bytecode/ExceptionTable;
    .param p2, "nth"    # I
    .param p3, "it"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "declaring"    # Ljavassist/CtClass;
    .param p5, "m"    # Ljavassist/bytecode/MethodInfo;

    .prologue
    .line 36
    invoke-virtual {p1, p2}, Ljavassist/bytecode/ExceptionTable;->handlerPc(I)I

    move-result v0

    invoke-direct {p0, v0, p3, p4, p5}, Ljavassist/expr/Expr;-><init>(ILjavassist/bytecode/CodeIterator;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 37
    iput-object p1, p0, Ljavassist/expr/Handler;->etable:Ljavassist/bytecode/ExceptionTable;

    .line 38
    iput p2, p0, Ljavassist/expr/Handler;->index:I

    .line 39
    return-void
.end method


# virtual methods
.method public getFileName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    invoke-super {p0}, Ljavassist/expr/Expr;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 52
    invoke-super {p0}, Ljavassist/expr/Expr;->getLineNumber()I

    move-result v0

    return v0
.end method

.method public getType()Ljavassist/CtClass;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 76
    iget-object v3, p0, Ljavassist/expr/Handler;->etable:Ljavassist/bytecode/ExceptionTable;

    iget v4, p0, Ljavassist/expr/Handler;->index:I

    invoke-virtual {v3, v4}, Ljavassist/bytecode/ExceptionTable;->catchType(I)I

    move-result v2

    .line 77
    .local v2, "type":I
    if-nez v2, :cond_c

    .line 78
    const/4 v3, 0x0

    .line 82
    :goto_b
    return-object v3

    .line 80
    :cond_c
    invoke-virtual {p0}, Ljavassist/expr/Handler;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 81
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {v0, v2}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, "name":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/expr/Handler;->thisClass:Ljavassist/CtClass;

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljavassist/ClassPool;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v3

    goto :goto_b
.end method

.method public insertBefore(Ljava/lang/String;)V
    .registers 13
    .param p1, "src"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 110
    iput-boolean v10, p0, Ljavassist/expr/Handler;->edited:Z

    .line 112
    invoke-virtual {p0}, Ljavassist/expr/Handler;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    .line 113
    .local v2, "cp":Ljavassist/bytecode/ConstPool;
    iget-object v9, p0, Ljavassist/expr/Handler;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v9}, Ljavassist/bytecode/CodeIterator;->get()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    .line 114
    .local v1, "ca":Ljavassist/bytecode/CodeAttribute;
    new-instance v4, Ljavassist/compiler/Javac;

    iget-object v9, p0, Ljavassist/expr/Handler;->thisClass:Ljavassist/CtClass;

    invoke-direct {v4, v9}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 115
    .local v4, "jv":Ljavassist/compiler/Javac;
    invoke-virtual {v4}, Ljavassist/compiler/Javac;->getBytecode()Ljavassist/bytecode/Bytecode;

    move-result-object v0

    .line 116
    .local v0, "b":Ljavassist/bytecode/Bytecode;
    invoke-virtual {v0, v10}, Ljavassist/bytecode/Bytecode;->setStackDepth(I)V

    .line 117
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v9

    invoke-virtual {v0, v9}, Ljavassist/bytecode/Bytecode;->setMaxLocals(I)V

    .line 120
    :try_start_22
    invoke-virtual {p0}, Ljavassist/expr/Handler;->getType()Ljavassist/CtClass;

    move-result-object v7

    .line 121
    .local v7, "type":Ljavassist/CtClass;
    sget-object v9, Ljavassist/expr/Handler;->EXCEPTION_NAME:Ljava/lang/String;

    invoke-virtual {v4, v7, v9}, Ljavassist/compiler/Javac;->recordVariable(Ljavassist/CtClass;Ljava/lang/String;)I

    move-result v8

    .line 122
    .local v8, "var":I
    const/4 v9, 0x0

    invoke-virtual {v4, v7, v9}, Ljavassist/compiler/Javac;->recordReturnType(Ljavassist/CtClass;Z)I

    .line 123
    invoke-virtual {v0, v8}, Ljavassist/bytecode/Bytecode;->addAstore(I)V

    .line 124
    invoke-virtual {v4, p1}, Ljavassist/compiler/Javac;->compileStmnt(Ljava/lang/String;)V

    .line 125
    invoke-virtual {v0, v8}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    .line 127
    iget-object v9, p0, Ljavassist/expr/Handler;->etable:Ljavassist/bytecode/ExceptionTable;

    iget v10, p0, Ljavassist/expr/Handler;->index:I

    invoke-virtual {v9, v10}, Ljavassist/bytecode/ExceptionTable;->handlerPc(I)I

    move-result v5

    .line 128
    .local v5, "oldHandler":I
    const/16 v9, 0xa7

    invoke-virtual {v0, v9}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 129
    iget-object v9, p0, Ljavassist/expr/Handler;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v9}, Ljavassist/bytecode/CodeIterator;->getCodeLength()I

    move-result v9

    sub-int v9, v5, v9

    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->currentPc()I

    move-result v10

    sub-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v0, v9}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 132
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getMaxStack()I

    move-result v9

    iput v9, p0, Ljavassist/expr/Handler;->maxStack:I

    .line 133
    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getMaxLocals()I

    move-result v9

    iput v9, p0, Ljavassist/expr/Handler;->maxLocals:I

    .line 135
    iget-object v9, p0, Ljavassist/expr/Handler;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->get()[B

    move-result-object v10

    invoke-virtual {v9, v10}, Ljavassist/bytecode/CodeIterator;->append([B)I

    move-result v6

    .line 136
    .local v6, "pos":I
    iget-object v9, p0, Ljavassist/expr/Handler;->iterator:Ljavassist/bytecode/CodeIterator;

    invoke-virtual {v0}, Ljavassist/bytecode/Bytecode;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v10

    invoke-virtual {v9, v10, v6}, Ljavassist/bytecode/CodeIterator;->append(Ljavassist/bytecode/ExceptionTable;I)V

    .line 137
    iget-object v9, p0, Ljavassist/expr/Handler;->etable:Ljavassist/bytecode/ExceptionTable;

    iget v10, p0, Ljavassist/expr/Handler;->index:I

    invoke-virtual {v9, v10, v6}, Ljavassist/bytecode/ExceptionTable;->setHandlerPc(II)V
    :try_end_7e
    .catch Ljavassist/NotFoundException; {:try_start_22 .. :try_end_7e} :catch_7f
    .catch Ljavassist/compiler/CompileError; {:try_start_22 .. :try_end_7e} :catch_86

    .line 145
    return-void

    .line 139
    .end local v5    # "oldHandler":I
    .end local v6    # "pos":I
    .end local v7    # "type":Ljavassist/CtClass;
    .end local v8    # "var":I
    :catch_7f
    move-exception v3

    .line 140
    .local v3, "e":Ljavassist/NotFoundException;
    new-instance v9, Ljavassist/CannotCompileException;

    invoke-direct {v9, v3}, Ljavassist/CannotCompileException;-><init>(Ljavassist/NotFoundException;)V

    throw v9

    .line 142
    .end local v3    # "e":Ljavassist/NotFoundException;
    :catch_86
    move-exception v3

    .line 143
    .local v3, "e":Ljavassist/compiler/CompileError;
    new-instance v9, Ljavassist/CannotCompileException;

    invoke-direct {v9, v3}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v9
.end method

.method public isFinally()Z
    .registers 3

    .prologue
    .line 90
    iget-object v0, p0, Ljavassist/expr/Handler;->etable:Ljavassist/bytecode/ExceptionTable;

    iget v1, p0, Ljavassist/expr/Handler;->index:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ExceptionTable;->catchType(I)I

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public mayThrow()[Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 68
    invoke-super {p0}, Ljavassist/expr/Expr;->mayThrow()[Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public replace(Ljava/lang/String;)V
    .registers 4
    .param p1, "statement"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 99
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "not implemented yet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public where()Ljavassist/CtBehavior;
    .registers 2

    .prologue
    .line 44
    invoke-super {p0}, Ljavassist/expr/Expr;->where()Ljavassist/CtBehavior;

    move-result-object v0

    return-object v0
.end method
