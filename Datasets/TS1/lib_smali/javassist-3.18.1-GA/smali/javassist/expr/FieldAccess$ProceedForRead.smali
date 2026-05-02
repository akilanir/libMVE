.class Ljavassist/expr/FieldAccess$ProceedForRead;
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
    name = "ProceedForRead"
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
    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 231
    iput-object p1, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->fieldType:Ljavassist/CtClass;

    .line 232
    iput p4, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->targetVar:I

    .line 233
    iput p2, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->opcode:I

    .line 234
    iput p3, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->index:I

    .line 235
    return-void
.end method


# virtual methods
.method public doit(Ljavassist/compiler/JvstCodeGen;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/ast/ASTList;)V
    .registers 7
    .param p1, "gen"    # Ljavassist/compiler/JvstCodeGen;
    .param p2, "bytecode"    # Ljavassist/bytecode/Bytecode;
    .param p3, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 240
    if-eqz p3, :cond_10

    invoke-virtual {p1, p3}, Ljavassist/compiler/JvstCodeGen;->isParamListName(Ljavassist/compiler/ast/ASTList;)Z

    move-result v1

    if-nez v1, :cond_10

    .line 241
    new-instance v1, Ljavassist/compiler/CompileError;

    const-string v2, "$proceed() cannot take a parameter for field reading"

    invoke-direct {v1, v2}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v1

    .line 245
    :cond_10
    iget v1, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->opcode:I

    invoke-static {v1}, Ljavassist/expr/FieldAccess;->isStatic(I)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 246
    const/4 v0, 0x0

    .line 252
    .local v0, "stack":I
    :goto_19
    iget-object v1, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->fieldType:Ljavassist/CtClass;

    instance-of v1, v1, Ljavassist/CtPrimitiveType;

    if-eqz v1, :cond_42

    .line 253
    iget-object v1, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->fieldType:Ljavassist/CtClass;

    check-cast v1, Ljavassist/CtPrimitiveType;

    invoke-virtual {v1}, Ljavassist/CtPrimitiveType;->getDataSize()I

    move-result v1

    add-int/2addr v0, v1

    .line 257
    :goto_28
    iget v1, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->opcode:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->add(I)V

    .line 258
    iget v1, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->index:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 259
    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->growStack(I)V

    .line 260
    iget-object v1, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->fieldType:Ljavassist/CtClass;

    invoke-virtual {p1, v1}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    .line 261
    return-void

    .line 248
    .end local v0    # "stack":I
    :cond_3b
    const/4 v0, -0x1

    .line 249
    .restart local v0    # "stack":I
    iget v1, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->targetVar:I

    invoke-virtual {p2, v1}, Ljavassist/bytecode/Bytecode;->addAload(I)V

    goto :goto_19

    .line 255
    :cond_42
    add-int/lit8 v0, v0, 0x1

    goto :goto_28
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
    .line 266
    iget-object v0, p0, Ljavassist/expr/FieldAccess$ProceedForRead;->fieldType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;)V

    .line 267
    return-void
.end method
