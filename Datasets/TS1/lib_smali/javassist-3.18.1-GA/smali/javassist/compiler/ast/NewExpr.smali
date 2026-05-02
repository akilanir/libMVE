.class public Ljavassist/compiler/ast/NewExpr;
.super Ljavassist/compiler/ast/ASTList;
.source "NewExpr.java"

# interfaces
.implements Ljavassist/compiler/TokenId;


# instance fields
.field protected arrayType:I

.field protected newArray:Z


# direct methods
.method public constructor <init>(ILjavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ArrayInit;)V
    .registers 6
    .param p1, "type"    # I
    .param p2, "arraySize"    # Ljavassist/compiler/ast/ASTList;
    .param p3, "init"    # Ljavassist/compiler/ast/ArrayInit;

    .prologue
    .line 36
    const/4 v0, 0x0

    new-instance v1, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v1, p2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {p0, v0, v1}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavassist/compiler/ast/NewExpr;->newArray:Z

    .line 38
    iput p1, p0, Ljavassist/compiler/ast/NewExpr;->arrayType:I

    .line 39
    if-eqz p3, :cond_13

    .line 40
    invoke-static {p0, p3}, Ljavassist/compiler/ast/NewExpr;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    .line 41
    :cond_13
    return-void
.end method

.method public constructor <init>(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)V
    .registers 4
    .param p1, "className"    # Ljavassist/compiler/ast/ASTList;
    .param p2, "args"    # Ljavassist/compiler/ast/ASTList;

    .prologue
    .line 30
    new-instance v0, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v0, p2}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {p0, p1, v0}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Ljavassist/compiler/ast/NewExpr;->newArray:Z

    .line 32
    const/16 v0, 0x133

    iput v0, p0, Ljavassist/compiler/ast/NewExpr;->arrayType:I

    .line 33
    return-void
.end method

.method public static makeObjectArray(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ArrayInit;)Ljavassist/compiler/ast/NewExpr;
    .registers 5
    .param p0, "className"    # Ljavassist/compiler/ast/ASTList;
    .param p1, "arraySize"    # Ljavassist/compiler/ast/ASTList;
    .param p2, "init"    # Ljavassist/compiler/ast/ArrayInit;

    .prologue
    .line 45
    new-instance v0, Ljavassist/compiler/ast/NewExpr;

    invoke-direct {v0, p0, p1}, Ljavassist/compiler/ast/NewExpr;-><init>(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTList;)V

    .line 46
    .local v0, "e":Ljavassist/compiler/ast/NewExpr;
    const/4 v1, 0x1

    iput-boolean v1, v0, Ljavassist/compiler/ast/NewExpr;->newArray:Z

    .line 47
    if-eqz p2, :cond_d

    .line 48
    invoke-static {v0, p2}, Ljavassist/compiler/ast/NewExpr;->append(Ljavassist/compiler/ast/ASTList;Ljavassist/compiler/ast/ASTree;)Ljavassist/compiler/ast/ASTList;

    .line 50
    :cond_d
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
    .line 73
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atNewExpr(Ljavassist/compiler/ast/NewExpr;)V

    return-void
.end method

.method public getArguments()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 61
    invoke-virtual {p0}, Ljavassist/compiler/ast/NewExpr;->getRight()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTree;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method

.method public getArraySize()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Ljavassist/compiler/ast/NewExpr;->getArguments()Ljavassist/compiler/ast/ASTList;

    move-result-object v0

    return-object v0
.end method

.method public getArrayType()I
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Ljavassist/compiler/ast/NewExpr;->arrayType:I

    return v0
.end method

.method public getClassName()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 59
    invoke-virtual {p0}, Ljavassist/compiler/ast/NewExpr;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method

.method public getInitializer()Ljavassist/compiler/ast/ArrayInit;
    .registers 3

    .prologue
    .line 66
    invoke-virtual {p0}, Ljavassist/compiler/ast/NewExpr;->getRight()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/compiler/ast/ASTree;->getRight()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 67
    .local v0, "t":Ljavassist/compiler/ast/ASTree;
    if-nez v0, :cond_c

    .line 68
    const/4 v1, 0x0

    .line 70
    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTree;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v1

    check-cast v1, Ljavassist/compiler/ast/ArrayInit;

    goto :goto_b
.end method

.method protected getTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-boolean v0, p0, Ljavassist/compiler/ast/NewExpr;->newArray:Z

    if-eqz v0, :cond_7

    const-string v0, "new[]"

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "new"

    goto :goto_6
.end method

.method public isArray()Z
    .registers 2

    .prologue
    .line 53
    iget-boolean v0, p0, Ljavassist/compiler/ast/NewExpr;->newArray:Z

    return v0
.end method
