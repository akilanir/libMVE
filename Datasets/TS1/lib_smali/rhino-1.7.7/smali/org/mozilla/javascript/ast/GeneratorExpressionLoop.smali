.class public Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
.super Lorg/mozilla/javascript/ast/ForInLoop;
.source "GeneratorExpressionLoop.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/ForInLoop;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "pos"    # I

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/ForInLoop;-><init>(I)V

    .line 18
    return-void
.end method

.method public constructor <init>(II)V
    .registers 3
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/ForInLoop;-><init>(II)V

    .line 22
    return-void
.end method


# virtual methods
.method public isForEach()Z
    .registers 2

    .prologue
    .line 29
    const/4 v0, 0x0

    return v0
.end method

.method public setIsForEach(Z)V
    .registers 4
    .param p1, "isForEach"    # Z

    .prologue
    .line 37
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "this node type does not support for each"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 5
    .param p1, "depth"    # I

    .prologue
    const/4 v2, 0x0

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->isForEach()Z

    move-result v0

    if-eqz v0, :cond_4b

    const-string v0, "each "

    :goto_1c
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->iterator:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->iteratedObject:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_4b
    const-string v0, ""

    goto :goto_1c
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 3
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 58
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 59
    iget-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->iterator:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 60
    iget-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->iteratedObject:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 62
    :cond_10
    return-void
.end method
