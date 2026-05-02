.class Ljavassist/expr/FieldAccess$ProceedForWrite;
.super Ljava/lang/Object;
.source "FieldAccess.java"

# interfaces
.implements Ljavassist/compiler/ProceedHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/expr/FieldAccess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProceedForWrite"
.end annotation


# instance fields
.field fieldType:Ljavassist/CtClass;

.field index:I

.field opcode:I

.field targetVar:I


# direct methods
.method constructor <init>(Ljavassist/CtClass;III)V
    .registers 5
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "op"    # I
    .param p3, "i"    # I
    .param p4, "var"    # I

    .prologue
    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    iput-object p1, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->fieldType:Ljavassist/CtClass;

    .line 280
    iput p4, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->targetVar:I

    .line 281
    iput p2, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->opcode:I

    .line 282
    iput p3, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->index:I

    .line 283
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
    const/4 v3, 0x1

    .line 288
    invoke-virtual {p1, p3}, Ljavassist/compiler/JvstCodeGen;->getMethodArgsLength(Ljavassist/compiler/ast/ASTList;)I

    move-result v1

    if-eq v1, v3, :cond_f

    .line 289
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "$proceed() cannot take more than one parameter for field writing"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 294
    :cond_f
    iget v1, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->opcode:I

    invoke-static {v1}, Ljavassist/expr/FieldAccess;->isStatic(I)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 295
    const/4 v0, 0x0

    .line 301
    .local v0, "stack":I
    :goto_18
    new-array v1, v3, [I

    new-array v2, v3, [I

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p1, p3, v1, v2, v3}, Ljavassist/compiler/JvstCodeGen;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 302
    iget-object v1, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->fieldType:Ljavassist/CtClass;

    invoke-virtual {p1, v1}, Ljavassist/compiler/JvstCodeGen;->doNumCast(Ljavassist/CtClass;)V

    .line 303
    iget-object v1, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->fieldType:Ljavassist/CtClass;

    instance-of v1, v1, Ljavassist/CtPrimitiveType;

    if-eqz v1, :cond_52

    .line 304
    iget-object v1, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->fieldType:Ljavassist/CtClass;

    check-cast v1, Ljavassist/CtPrimitiveType;

    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getDataSize()I

    move-result v1

    sub-int/2addr v0, v1

    .line 308
    :goto_35
    iget v1, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->opcode:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 309
    iget v1, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->index:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 310
    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 311
    sget-object v1, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    invoke-virtual {p1, v1}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    .line 312
    invoke-virtual {p1}, Ljavassist/compiler/JvstCodeGen;->addNullIfVoid()V

    .line 313
    return-void

    .line 297
    .end local v0    # "stack":I
    :cond_4b
    const/4 v0, -0x1

    .line 298
    .restart local v0    # "stack":I
    iget v1, p0, Ljavassist/expr/FieldAccess$ProceedForWrite;->targetVar:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    goto :goto_18

    .line 306
    :cond_52
    add-int/lit8 v0, v0, -0x1

    goto :goto_35
.end method

.method public setReturnType(Ljavassist/compiler/JvstTypeChecker;Ljavassist/compiler/ast/ASTList;)V
    .registers 6
    .param p1, "c"    # Ljavassist/compiler/JvstTypeChecker;
    .param p2, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 318
    new-array v0, v2, [I

    new-array v1, v2, [I

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p1, p2, v0, v1, v2}, Ljavassist/compiler/JvstTypeChecker;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 319
    sget-object v0, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;)V

    .line 320
    invoke-virtual {p1}, Ljavassist/compiler/JvstTypeChecker;->addNullIfVoid()V

    .line 321
    return-void
.end method
