.class public Ljavassist/compiler/ast/CondExpr;
.super Ljavassist/compiler/ast/ASTList;
.source "CondExpr.java"


# direct methods
.method public constructor <init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)V
    .registers 6
    .param p1, "cond"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "thenp"    # Ljavassist/compiler/ast/ASTree;
    .param p3, "elsep"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 26
    new-instance v0, Ljavassist/compiler/ast/ASTList;

    new-instance v1, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v1, p3}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {v0, p2, v1}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    invoke-direct {p0, p1, v0}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 27
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/compiler/ast/Visitor;)V
    .registers 2
    .param p1, "v"    # Ljavassist/compiler/ast/Visitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/compiler/CompileError;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atCondExpr(Ljavassist/compiler/ast/CondExpr;)V

    return-void
.end method

.method public condExpr()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 29
    invoke-virtual {p0}, Ljavassist/compiler/ast/CondExpr;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    return-object v0
.end method

.method public elseExpr()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 37
    invoke-virtual {p0}, Ljavassist/compiler/ast/CondExpr;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 41
    const-string v0, "?:"

    return-object v0
.end method

.method public setCond(Ljavassist/compiler/ast/ASTree;)V
    .registers 2
    .param p1, "t"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Ljavassist/compiler/ast/CondExpr;->setHead(Ljavassist/compiler/ast/ASTree;)V

    return-void
.end method

.method public setElse(Ljavassist/compiler/ast/ASTree;)V
    .registers 3
    .param p1, "t"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 39
    invoke-virtual {p0}, Ljavassist/compiler/ast/CondExpr;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavassist/compiler/ast/ASTList;->setHead(Ljavassist/compiler/ast/ASTree;)V

    return-void
.end method

.method public setThen(Ljavassist/compiler/ast/ASTree;)V
    .registers 3
    .param p1, "t"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 35
    invoke-virtual {p0}, Ljavassist/compiler/ast/CondExpr;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavassist/compiler/ast/ASTList;->setHead(Ljavassist/compiler/ast/ASTree;)V

    return-void
.end method

.method public thenExpr()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 33
    invoke-virtual {p0}, Ljavassist/compiler/ast/CondExpr;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    return-object v0
.end method
