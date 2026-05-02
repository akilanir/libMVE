.class Ljavassist/expr/Instanceof$ProceedForInstanceof;
.super Ljava/lang/Object;
.source "Instanceof.java"

# interfaces
.implements Ljavassist/compiler/ProceedHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/expr/Instanceof;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProceedForInstanceof"
.end annotation


# instance fields
.field index:I


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "i"    # I

    .prologue
    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput p1, p0, Ljavassist/expr/Instanceof$ProceedForInstanceof;->index:I

    .line 147
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

    .line 152
    invoke-virtual {p1, p3}, Ljavassist/compiler/JvstCodeGen;->getMethodArgsLength(Ljavassist/compiler/ast/ASTList;)I

    move-result v0

    if-eq v0, v2, :cond_f

    .line 153
    new-instance v0, Ljavassist/compiler/CompileError;

    const-string v1, "$proceed() cannot take more than one parameter for instanceof"

    invoke-direct {v0, v1}, Ljavassist/compiler/CompileError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :cond_f
    new-array v0, v2, [I

    new-array v1, v2, [I

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p1, p3, v0, v1, v2}, Ljavassist/compiler/JvstCodeGen;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 158
    const/16 v0, 0xc1

    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 159
    iget v0, p0, Ljavassist/expr/Instanceof$ProceedForInstanceof;->index:I

    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 160
    sget-object v0, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    .line 161
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

    .line 166
    new-array v0, v2, [I

    new-array v1, v2, [I

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p1, p2, v0, v1, v2}, Ljavassist/compiler/JvstTypeChecker;->atMethodArgs(Ljavassist/compiler/ast/ASTList;[I[I[Ljava/lang/String;)V

    .line 167
    sget-object v0, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;)V

    .line 168
    return-void
.end method
