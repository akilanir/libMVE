.class Ljavassist/expr/NewArray$ProceedForArray;
.super Ljava/lang/Object;
.source "NewArray.java"

# interfaces
.implements Ljavassist/compiler/ProceedHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/expr/NewArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProceedForArray"
.end annotation


# instance fields
.field arrayType:Ljavassist/CtClass;

.field dimension:I

.field index:I

.field opcode:I


# direct methods
.method constructor <init>(Ljavassist/CtClass;III)V
    .registers 5
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "op"    # I
    .param p3, "i"    # I
    .param p4, "dim"    # I

    .prologue
    .line 246
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 247
    iput-object p1, p0, Ljavassist/expr/NewArray$ProceedForArray;->arrayType:Ljavassist/CtClass;

    .line 248
    iput p2, p0, Ljavassist/expr/NewArray$ProceedForArray;->opcode:I

    .line 249
    iput p3, p0, Ljavassist/expr/NewArray$ProceedForArray;->index:I

    .line 250
    iput p4, p0, Ljavassist/expr/NewArray$ProceedForArray;->dimension:I

    .line 251
    return-void
.end method


# virtual methods
.method public doit(Ljavassist/compiler/JvstCodeGen;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/ast/ASTList;)V
    .registers 8
    .param p1, "gen"    # Ljavassist/compiler/JvstCodeGen;
    .param p2, "bytecode"    # Ljavassist/bytecode/Bytecode;
    .param p3, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 256
    invoke-virtual {p1, p3}, Ljavassist/compiler/JvstCodeGen;->getMethodArgsLength(Ljavassist/compiler/ast/ASTList;)I

    move-result v0

    .line 257
    .local v0, "num":I
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->dimension:I

    if-eq v0, v1, :cond_10

    .line 258
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "$proceed() with a wrong number of parameters"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 261
    :cond_10
    new-array v1, v0, [I

    new-array v2, v0, [I

    new-array v3, v0, [Ljava/lang/String;

    invoke-virtual {p1, p3, v1, v2, v3}, Ljavassist/compiler/JvstCodeGen;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 263
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->opcode:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 264
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->opcode:I

    const/16 v2, 0xbd

    if-ne v1, v2, :cond_2f

    .line 265
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->index:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 274
    :goto_29
    iget-object v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->arrayType:Ljavassist/CtClass;

    invoke-virtual {p1, v1}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    .line 275
    return-void

    .line 266
    :cond_2f
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->opcode:I

    const/16 v2, 0xbc

    if-ne v1, v2, :cond_3b

    .line 267
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->index:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    goto :goto_29

    .line 269
    :cond_3b
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->index:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 270
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->dimension:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 271
    iget v1, p0, Ljavassist/expr/NewArray$ProceedForArray;->dimension:I

    rsub-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    goto :goto_29
.end method

.method public setReturnType(Ljavassist/compiler/JvstTypeChecker;Ljavassist/compiler/ast/ASTList;)V
    .registers 4
    .param p1, "c"    # Ljavassist/compiler/JvstTypeChecker;
    .param p2, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 280
    iget-object v0, p0, Ljavassist/expr/NewArray$ProceedForArray;->arrayType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;)V

    .line 281
    return-void
.end method
