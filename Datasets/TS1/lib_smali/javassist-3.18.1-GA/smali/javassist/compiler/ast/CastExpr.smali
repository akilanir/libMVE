.class public Ljavassist/compiler/ast/CastExpr;
.super Ljavassist/compiler/ast/ASTList;
.source "CastExpr.java"

# interfaces
.implements Ljavassist/compiler/TokenId;


# instance fields
.field protected arrayDim:I

.field protected castType:I


# direct methods
.method public constructor <init>(IILjavassist/compiler/ast/ASTree;)V
    .registers 6
    .param p1, "type"    # I
    .param p2, "dim"    # I
    .param p3, "expr"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 36
    const/4 v0, 0x0

    new-instance v1, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v1, p3}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {p0, v0, v1}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 37
    iput p1, p0, Ljavassist/compiler/ast/CastExpr;->castType:I

    .line 38
    iput p2, p0, Ljavassist/compiler/ast/CastExpr;->arrayDim:I

    .line 39
    return-void
.end method

.method public constructor <init>(Ljavassist/compiler/ast/ASTList;ILjavassist/compiler/ast/ASTree;)V
    .registers 5
    .param p1, "className"    # Ljavassist/compiler/ast/ASTList;
    .param p2, "dim"    # I
    .param p3, "expr"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 30
    new-instance v0, Ljavassist/compiler/ast/ASTList;

    invoke-direct {v0, p3}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;)V

    invoke-direct {p0, p1, v0}, Ljavassist/compiler/ast/ASTList;-><init>(Ljavassist/compiler/ast/ASTree;Ljavassist/compiler/ast/ASTList;)V

    .line 31
    const/16 v0, 0x133

    iput v0, p0, Ljavassist/compiler/ast/CastExpr;->castType:I

    .line 32
    iput p2, p0, Ljavassist/compiler/ast/CastExpr;->arrayDim:I

    .line 33
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
    .line 55
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atCastExpr(Ljavassist/compiler/ast/CastExpr;)V

    return-void
.end method

.method public getArrayDim()I
    .registers 2

    .prologue
    .line 45
    iget v0, p0, Ljavassist/compiler/ast/CastExpr;->arrayDim:I

    return v0
.end method

.method public getClassName()Ljavassist/compiler/ast/ASTList;
    .registers 2

    .prologue
    .line 47
    invoke-virtual {p0}, Ljavassist/compiler/ast/CastExpr;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    check-cast v0, Ljavassist/compiler/ast/ASTList;

    return-object v0
.end method

.method public getOprand()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 49
    invoke-virtual {p0}, Ljavassist/compiler/ast/CastExpr;->getRight()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/compiler/ast/ASTree;->getLeft()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .registers 3

    .prologue
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cast:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/compiler/ast/CastExpr;->castType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/compiler/ast/CastExpr;->arrayDim:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 43
    iget v0, p0, Ljavassist/compiler/ast/CastExpr;->castType:I

    return v0
.end method

.method public setOprand(Ljavassist/compiler/ast/ASTree;)V
    .registers 3
    .param p1, "t"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 51
    invoke-virtual {p0}, Ljavassist/compiler/ast/CastExpr;->getRight()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljavassist/compiler/ast/ASTree;->setLeft(Ljavassist/compiler/ast/ASTree;)V

    return-void
.end method
