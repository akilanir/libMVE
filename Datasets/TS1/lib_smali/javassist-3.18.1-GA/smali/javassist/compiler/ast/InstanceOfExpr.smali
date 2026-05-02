.class public Ljavassist/compiler/ast/InstanceOfExpr;
.super Ljavassist/compiler/ast/CastExpr;
.source "InstanceOfExpr.java"


# direct methods
.method public constructor <init>(IILjavassist/compiler/ast/ASTree;)V
    .registers 4
    .param p1, "type"    # I
    .param p2, "dim"    # I
    .param p3, "expr"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Ljavassist/compiler/ast/CastExpr;-><init>(IILjavassist/compiler/ast/ASTree;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljavassist/compiler/ast/ASTList;ILjavassist/compiler/ast/ASTree;)V
    .registers 4
    .param p1, "className"    # Ljavassist/compiler/ast/ASTList;
    .param p2, "dim"    # I
    .param p3, "expr"    # Ljavassist/compiler/ast/ASTree;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3}, Ljavassist/compiler/ast/CastExpr;-><init>(Ljavassist/compiler/ast/ASTList;ILjavassist/compiler/ast/ASTree;)V

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
    .line 38
    invoke-virtual {p1, p0}, Ljavassist/compiler/ast/Visitor;->atInstanceOfExpr(Ljavassist/compiler/ast/InstanceOfExpr;)V

    .line 39
    return-void
.end method

.method public getTag()Ljava/lang/String;
    .registers 3

    .prologue
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "instanceof:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/compiler/ast/InstanceOfExpr;->castType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/compiler/ast/InstanceOfExpr;->arrayDim:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
