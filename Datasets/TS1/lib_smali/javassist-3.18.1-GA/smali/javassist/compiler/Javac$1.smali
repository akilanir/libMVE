.class Ljavassist/compiler/Javac$1;
.super Ljava/lang/Object;
.source "Javac.java"

# interfaces
.implements Ljavassist/compiler/ProceedHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ljavassist/compiler/Javac;->recordProceed(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Ljavassist/compiler/Javac;

.field final synthetic val$m:Ljava/lang/String;

.field final synthetic val$texpr:Ljavassist/compiler/ast/ASTree;


# direct methods
.method constructor <init>(Ljavassist/compiler/Javac;Ljava/lang/String;Ljavassist/compiler/ast/ASTree;)V
    .registers 4

    .prologue
    .line 439
    iput-object p1, p0, Ljavassist/compiler/Javac$1;->this$0:Ljavassist/compiler/Javac;

    iput-object p2, p0, Ljavassist/compiler/Javac$1;->val$m:Ljava/lang/String;

    iput-object p3, p0, Ljavassist/compiler/Javac$1;->val$texpr:Ljavassist/compiler/ast/ASTree;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doit(Ljavassist/compiler/JvstCodeGen;Ljavassist/bytecode/Bytecode;Ljavassist/compiler/ast/ASTList;)V
    .registers 7
    .param p1, "gen"    # Ljavassist/compiler/JvstCodeGen;
    .param p2, "b"    # Ljavassist/bytecode/Bytecode;
    .param p3, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 443
    new-instance v0, Ljavassist/compiler/ast/Member;

    iget-object v1, p0, Ljavassist/compiler/Javac$1;->val$m:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljavassist/compiler/ast/Member;-><init>(Ljava/lang/String;)V

    .line 444
    .local v0, "expr":Ljavassist/compiler/ast/ASTree;
    iget-object v1, p0, Ljavassist/compiler/Javac$1;->val$texpr:Ljavassist/compiler/ast/ASTree;

    if-eqz v1, :cond_13

    .line 445
    const/16 v1, 0x2e

    iget-object v2, p0, Ljavassist/compiler/Javac$1;->val$texpr:Ljavassist/compiler/ast/ASTree;

    invoke-static {v1, v2, v0}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v0

    .line 447
    :cond_13
    invoke-static {v0, p3}, Ljavassist/compiler/ast/CallExpr;->makeCall(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/CallExpr;

    move-result-object v0

    .line 448
    invoke-virtual {p1, v0}, Ljavassist/compiler/JvstCodeGen;->compileExpr(Ljavassist/compiler/ast/ASTree;)V

    .line 449
    invoke-virtual {p1}, Ljavassist/compiler/JvstCodeGen;->addNullIfVoid()V

    .line 450
    return-void
.end method

.method public setReturnType(Ljavassist/compiler/JvstTypeChecker;Ljavassist/compiler/ast/ASTList;)V
    .registers 6
    .param p1, "check"    # Ljavassist/compiler/JvstTypeChecker;
    .param p2, "args"    # Ljavassist/compiler/ast/ASTList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 455
    new-instance v0, Ljavassist/compiler/ast/Member;

    iget-object v1, p0, Ljavassist/compiler/Javac$1;->val$m:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljavassist/compiler/ast/Member;-><init>(Ljava/lang/String;)V

    .line 456
    .local v0, "expr":Ljavassist/compiler/ast/ASTree;
    iget-object v1, p0, Ljavassist/compiler/Javac$1;->val$texpr:Ljavassist/compiler/ast/ASTree;

    if-eqz v1, :cond_13

    .line 457
    const/16 v1, 0x2e

    iget-object v2, p0, Ljavassist/compiler/Javac$1;->val$texpr:Ljavassist/compiler/ast/ASTree;

    invoke-static {v1, v2, v0}, Ljavassist/compiler/ast/Expr;->make(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/Expr;

    move-result-object v0

    .line 459
    :cond_13
    invoke-static {v0, p2}, Ljavassist/compiler/ast/CallExpr;->makeCall(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/CallExpr;

    move-result-object v0

    .line 460
    invoke-virtual {v0, p1}, Ljavassist/compiler/ast/ASTree;->accept(Ljavassist/compiler/ast/Visitor;)V

    .line 461
    invoke-virtual {p1}, Ljavassist/compiler/JvstTypeChecker;->addNullIfVoid()V

    .line 462
    return-void
.end method
