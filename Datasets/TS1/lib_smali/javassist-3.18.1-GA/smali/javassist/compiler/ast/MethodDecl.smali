.class public Ljavassist/compiler/ast/MethodDecl;
.super Ljavassist/compiler/ast/ASTList;
.source "MethodDecl.java"


# static fields
.field public static final initName:Ljava/lang/String; = "<init>"


# direct methods
.method public constructor <init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V
    .registers 3
    .param p1, "_head"    # Ljavassist/compiler/ast/ASTree;
    .param p2, "_tail"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 26
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
    .line 44
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atMethodDecl(Ljavassist/compiler/ast/MethodDecl;)V

    .line 45
    return-void
.end method

.method public getBody()Ljavassist/compiler/ast/Stmnt;
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljavassist/compiler/ast/MethodDecl;->sublist(I)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/Stmnt;

    return-object v0
.end method

.method public getModifiers()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 33
    invoke-virtual {p0}, Ljavassist/compiler/ast/MethodDecl;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method

.method public getParams()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljavassist/compiler/ast/MethodDecl;->sublist(I)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method

.method public getReturn()Ljavassist/compiler/ast/Declarator;
    .registers 2

    .prologue
    .line 35
    invoke-virtual {p0}, Ljavassist/compiler/ast/MethodDecl;->tail()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/Declarator;

    return-object v0
.end method

.method public getThrows()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 39
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Ljavassist/compiler/ast/MethodDecl;->sublist(I)Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTList;->head()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method

.method public isConstructor()Z
    .registers 4

    .prologue
    .line 29
    invoke-virtual {p0}, Ljavassist/compiler/ast/MethodDecl;->getReturn()Ljavassist/compiler/ast/Declarator;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/compiler/ast/Declarator;->getVariable()Ljavassist/compiler/ast/Symbol;

    move-result-object v0

    .line 30
    .local v0, "sym":Ljavassist/compiler/ast/Symbol;
    if-eqz v0, :cond_18

    const-string v1, "<init>"

    invoke-virtual {v0}, Ljavassist/compiler/ast/Symbol;->get()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    const/4 v1, 0x1

    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method
