.class Ljavassist/expr/NewExpr$ProceedForNew;
.super Ljava/lang/Object;
.source "NewExpr.java"

# interfaces
.implements Ljavassist/compiler/ProceedHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/expr/NewExpr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProceedForNew"
.end annotation


# instance fields
.field methodIndex:I

.field newIndex:I

.field newType:Ljavassist/CtClass;


# direct methods
.method constructor <init>(Ljavassist/CtClass;II)V
    .registers 4
    .param p1, "nt"    # Ljavassist/CtClass;
    .param p2, "ni"    # I
    .param p3, "mi"    # I

    .prologue
    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    iput-object p1, p0, Ljavassist/expr/NewExpr$ProceedForNew;->newType:Ljavassist/CtClass;

    .line 226
    iput p2, p0, Ljavassist/expr/NewExpr$ProceedForNew;->newIndex:I

    .line 227
    iput p3, p0, Ljavassist/expr/NewExpr$ProceedForNew;->methodIndex:I

    .line 228
    return-void
.end method


# virtual methods
.method public doit(Ljavassist/compiler/JvstCodeGen;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/ast/ASTList;)V
    .registers 12
    .param p1, "gen"    # Ljavassist/compiler/JvstCodeGen;
    .param p2, "bytecode"    # Ljavassist/bytecode/Bytecode;
    .param p3, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 233
    const/16 v0, 0xbb

    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 234
    iget v0, p0, Ljavassist/expr/NewExpr$ProceedForNew;->newIndex:I

    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->addIndex(I)V

    .line 235
    const/16 v0, 0x59

    invoke-virtual {p2, v0}, Ljavassist/bytecode/Bytecode;->addOpcode(I)V

    .line 236
    iget-object v1, p0, Ljavassist/expr/NewExpr$ProceedForNew;->newType:Ljavassist/CtClass;

    const-string v2, "<init>"

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, -0x1

    const/4 v7, 0x0

    move-object v0, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v7}, Ljavassist/compiler/JvstCodeGen;->atMethodCallCore(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/compiler/ast/ASTList;ZZILjavassist/compiler/MemberResolver$Method;)V

    .line 238
    iget-object v0, p0, Ljavassist/expr/NewExpr$ProceedForNew;->newType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstCodeGen;->setType(Ljavassist/CtClass;)V

    .line 239
    return-void
.end method

.method public setReturnType(Ljavassist/compiler/JvstTypeChecker;Ljavassist/compiler/ast/ASTList;)V
    .registers 5
    .param p1, "c"    # Ljavassist/compiler/JvstTypeChecker;
    .param p2, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 244
    iget-object v0, p0, Ljavassist/expr/NewExpr$ProceedForNew;->newType:Ljavassist/CtClass;

    const-string v1, "<init>"

    invoke-virtual {p1, v0, v1, p2}, Ljavassist/compiler/JvstTypeChecker;->atMethodCallCore(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/compiler/ast/ASTList;)Ljavassist/compiler/MemberResolver$Method;

    .line 245
    iget-object v0, p0, Ljavassist/expr/NewExpr$ProceedForNew;->newType:Ljavassist/CtClass;

    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstTypeChecker;->setType(Ljavassist/CtClass;)V

    .line 246
    return-void
.end method
