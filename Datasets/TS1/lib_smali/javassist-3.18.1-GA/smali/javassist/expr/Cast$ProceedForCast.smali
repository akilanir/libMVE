.class Ljavassist/expr/Cast$ProceedForCast;
.super Ljava/lang/Object;
.source "Cast.java"

# interfaces
.implements Ljavassist/compiler/ProceedHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/expr/Cast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProceedForCast"
.end annotation


# instance fields
.field index:I

.field retType:Ljavassist/CtClass;


# direct methods
.method constructor <init>(ILjavassist/CtClass;)V
    .registers 3
    .param p1, "i"    # I
    .param p2, "t"    # Ljavassist/CtClass;

    .prologue
    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput p1, p0, Ljavassist/expr/Cast$ProceedForCast;->index:I

    .line 142
    iput-object p2, p0, Ljavassist/expr/Cast$ProceedForCast;->retType:Ljavassist/CtClass;

    .line 143
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
    const/4 v2, 0x1

    .line 148
    invoke-virtual {p1, p3}, Ljavassist/compiler/JvstCodeGen;->getMethodArgsLength(Ljavassist/compiler/ast/ASTList;)I

    move-result v0

    if-eq v0, v2, :cond_f

    .line 149
    new-instance v0, Ljavassist/compiler/CompileError;

    const-string v1, "$proceed() cannot take more than one parameter for cast"

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_f
    new-array v0, v2, [I

    new-array v1, v2, [I

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p1, p3, v0, v1, v2}, Ljavassist/compiler/JvstCodeGen;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 154
    const/16 v0, 0xc0

    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 155
    iget v0, p0, Ljavassist/expr/Cast$ProceedForCast;->index:I

    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 156
    iget-object v0, p0, Ljavassist/expr/Cast$ProceedForCast;->retType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    .line 157
    return-void
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

    .line 162
    new-array v0, v2, [I

    new-array v1, v2, [I

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p1, p2, v0, v1, v2}, Ljavassist/compiler/JvstTypeChecker;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 163
    iget-object v0, p0, Ljavassist/expr/Cast$ProceedForCast;->retType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;)V

    .line 164
    return-void
.end method
