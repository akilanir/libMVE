.class public Ljavassist/compiler/ast/AssignExpr;
.super Ljavassist/compiler/ast/Expr;
.source "AssignExpr.java"


# direct methods
.method private constructor <init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V
    .registers 4
    .param p1, "op"    # I
    .param p2, "_head"    # Ljavassist/compiler/ast/ASTree;
    .param p3, "_tail"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Ljavassist/compiler/ast/Expr;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 31
    return-void
.end method

.method public static makeAssign(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/AssignExpr;
    .registers 5
    .param p0, "op"    # I
    .param p1, "oprand1"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "oprand2"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 35
    new-instance v0, Ljavassist/compiler/ast/AssignExpr;

    new-instance v1, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v1, p2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {v0, p0, p1, v1}, Ljavassist/compiler/ast/AssignExpr;-><init>(ILjavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    return-object v0
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
    .line 39
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atAssignExpr(Ljavassist/compiler/ast/AssignExpr;)V

    .line 40
    return-void
.end method
