.class public Ljavassist/compiler/ast/FieldDecl;
.super Ljavassist/compiler/ast/ASTList;
.source "FieldDecl.java"


# direct methods
.method public constructor <init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V
    .registers 3
    .param p1, "_head"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "_tail"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 24
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
    .line 33
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atFieldDecl(Ljavassist/compiler/ast/FieldDecl;)V

    .line 34
    return-void
.end method

.method public getDeclarator()Ljavassist/compiler/ast/Declarator;
    .registers 2

    .prologue
    .line 28
    invoke-virtual {p0}, Ljavassist/compiler/ast/FieldDecl;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/Declarator;

    return-object v0
.end method

.method public getInit()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 30
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljavassist/compiler/ast/FieldDecl;->sublist(I)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    return-object v0
.end method

.method public getModifiers()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 26
    invoke-virtual {p0}, Ljavassist/compiler/ast/FieldDecl;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method
