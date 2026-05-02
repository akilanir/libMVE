.class public Lorg/mozilla/javascript/ast/GeneratorExpression;
.super Lorg/mozilla/javascript/ast/Scope;
.source "GeneratorExpression.java"


# instance fields
.field private filter:Lorg/mozilla/javascript/ast/AstNode;

.field private ifPosition:I

.field private loops:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;",
            ">;"
        }
    .end annotation
.end field

.field private lp:I

.field private result:Lorg/mozilla/javascript/ast/AstNode;

.field private rp:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 29
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/Scope;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->loops:Ljava/util/List;

    .line 21
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->ifPosition:I

    .line 22
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->lp:I

    .line 23
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->rp:I

    .line 26
    const/16 v0, 0xa2

    iput v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->type:I

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "pos"    # I

    .prologue
    const/4 v1, -0x1

    .line 33
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/Scope;-><init>(I)V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->loops:Ljava/util/List;

    .line 21
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->ifPosition:I

    .line 22
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->lp:I

    .line 23
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->rp:I

    .line 26
    const/16 v0, 0xa2

    iput v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->type:I

    .line 34
    return-void
.end method

.method public constructor <init>(II)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    const/4 v1, -0x1

    .line 37
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/Scope;-><init>(II)V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->loops:Ljava/util/List;

    .line 21
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->ifPosition:I

    .line 22
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->lp:I

    .line 23
    iput v1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->rp:I

    .line 26
    const/16 v0, 0xa2

    iput v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->type:I

    .line 38
    return-void
.end method


# virtual methods
.method public addLoop(Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;)V
    .registers 3
    .param p1, "acl"    # Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;

    .prologue
    .line 81
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/GeneratorExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 82
    iget-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->loops:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 84
    return-void
.end method

.method public getFilter()Lorg/mozilla/javascript/ast/AstNode;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->filter:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public getFilterLp()I
    .registers 2

    .prologue
    .line 121
    iget v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->lp:I

    return v0
.end method

.method public getFilterRp()I
    .registers 2

    .prologue
    .line 135
    iget v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->rp:I

    return v0
.end method

.method public getIfPosition()I
    .registers 2

    .prologue
    .line 107
    iget v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->ifPosition:I

    return v0
.end method

.method public getLoops()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->loops:Ljava/util/List;

    return-object v0
.end method

.method public getResult()Lorg/mozilla/javascript/ast/AstNode;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->result:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public setFilter(Lorg/mozilla/javascript/ast/AstNode;)V
    .registers 2
    .param p1, "filter"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 98
    iput-object p1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->filter:Lorg/mozilla/javascript/ast/AstNode;

    .line 99
    if-eqz p1, :cond_7

    .line 100
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 101
    :cond_7
    return-void
.end method

.method public setFilterLp(I)V
    .registers 2
    .param p1, "lp"    # I

    .prologue
    .line 128
    iput p1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->lp:I

    .line 129
    return-void
.end method

.method public setFilterRp(I)V
    .registers 2
    .param p1, "rp"    # I

    .prologue
    .line 142
    iput p1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->rp:I

    .line 143
    return-void
.end method

.method public setIfPosition(I)V
    .registers 2
    .param p1, "ifPosition"    # I

    .prologue
    .line 114
    iput p1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->ifPosition:I

    .line 115
    return-void
.end method

.method public setLoops(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p1, "loops":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/GeneratorExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 70
    iget-object v2, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->loops:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 71
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;

    .line 72
    .local v0, "acl":Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/ast/GeneratorExpression;->addLoop(Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;)V

    goto :goto_c

    .line 74
    .end local v0    # "acl":Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
    :cond_1c
    return-void
.end method

.method public setResult(Lorg/mozilla/javascript/ast/AstNode;)V
    .registers 2
    .param p1, "result"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/GeneratorExpression;->assertNotNull(Ljava/lang/Object;)V

    .line 53
    iput-object p1, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->result:Lorg/mozilla/javascript/ast/AstNode;

    .line 54
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 55
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 7
    .param p1, "depth"    # I

    .prologue
    const/4 v4, 0x0

    .line 147
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0xfa

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 148
    .local v2, "sb":Ljava/lang/StringBuilder;
    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    iget-object v3, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->result:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    iget-object v3, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->loops:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;

    .line 151
    .local v1, "loop":Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
    invoke-virtual {v1, v4}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 153
    .end local v1    # "loop":Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
    :cond_30
    iget-object v3, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->filter:Lorg/mozilla/javascript/ast/AstNode;

    if-eqz v3, :cond_47

    .line 154
    const-string v3, " if ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    iget-object v3, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->filter:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    :cond_47
    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 5
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 168
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 178
    :cond_6
    :goto_6
    return-void

    .line 171
    :cond_7
    iget-object v2, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->result:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 172
    iget-object v2, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->loops:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;

    .line 173
    .local v1, "loop":Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_12

    .line 175
    .end local v1    # "loop":Lorg/mozilla/javascript/ast/GeneratorExpressionLoop;
    :cond_22
    iget-object v2, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->filter:Lorg/mozilla/javascript/ast/AstNode;

    if-eqz v2, :cond_6

    .line 176
    iget-object v2, p0, Lorg/mozilla/javascript/ast/GeneratorExpression;->filter:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_6
.end method
