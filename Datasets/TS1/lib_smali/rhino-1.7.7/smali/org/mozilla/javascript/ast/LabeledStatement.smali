.class public Lorg/mozilla/javascript/ast/LabeledStatement;
.super Lorg/mozilla/javascript/ast/AstNode;
.source "LabeledStatement.java"


# instance fields
.field private labels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/Label;",
            ">;"
        }
    .end annotation
.end field

.field private statement:Lorg/mozilla/javascript/ast/AstNode;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/AstNode;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    .line 27
    const/16 v0, 0x85

    iput v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->type:I

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/AstNode;-><init>(I)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    .line 27
    const/16 v0, 0x85

    iput v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->type:I

    .line 35
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/AstNode;-><init>(II)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    .line 27
    const/16 v0, 0x85

    iput v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->type:I

    .line 39
    return-void
.end method


# virtual methods
.method public addLabel(Lorg/mozilla/javascript/ast/Label;)V
    .registers 3
    .param p1, "label"    # Lorg/mozilla/javascript/ast/Label;

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/LabeledStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 68
    iget-object v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/Label;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 70
    return-void
.end method

.method public getFirstLabel()Lorg/mozilla/javascript/ast/Label;
    .registers 3

    .prologue
    .line 104
    iget-object v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/ast/Label;

    return-object v0
.end method

.method public getLabelByName(Ljava/lang/String;)Lorg/mozilla/javascript/ast/Label;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 85
    iget-object v2, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/Label;

    .line 86
    .local v1, "label":Lorg/mozilla/javascript/ast/Label;
    invoke-virtual {v1}, Lorg/mozilla/javascript/ast/Label;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 90
    .end local v1    # "label":Lorg/mozilla/javascript/ast/Label;
    :goto_1c
    return-object v1

    :cond_1d
    const/4 v1, 0x0

    goto :goto_1c
.end method

.method public getLabels()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/Label;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    iget-object v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    return-object v0
.end method

.method public getStatement()Lorg/mozilla/javascript/ast/AstNode;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->statement:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public hasSideEffects()Z
    .registers 2

    .prologue
    .line 110
    const/4 v0, 0x1

    return v0
.end method

.method public setLabels(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/Label;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "labels":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/Label;>;"
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/LabeledStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 55
    iget-object v2, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    if-eqz v2, :cond_c

    .line 56
    iget-object v2, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 57
    :cond_c
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/Label;

    .line 58
    .local v1, "l":Lorg/mozilla/javascript/ast/Label;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/LabeledStatement;->addLabel(Lorg/mozilla/javascript/ast/Label;)V

    goto :goto_10

    .line 60
    .end local v1    # "l":Lorg/mozilla/javascript/ast/Label;
    :cond_20
    return-void
.end method

.method public setStatement(Lorg/mozilla/javascript/ast/AstNode;)V
    .registers 2
    .param p1, "statement"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/LabeledStatement;->assertNotNull(Ljava/lang/Object;)V

    .line 99
    iput-object p1, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->statement:Lorg/mozilla/javascript/ast/AstNode;

    .line 100
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 101
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 7
    .param p1, "depth"    # I

    .prologue
    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/Label;

    .line 117
    .local v1, "label":Lorg/mozilla/javascript/ast/Label;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/Label;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 119
    .end local v1    # "label":Lorg/mozilla/javascript/ast/Label;
    :cond_1f
    iget-object v3, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->statement:Lorg/mozilla/javascript/ast/AstNode;

    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 5
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 129
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 130
    iget-object v2, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->labels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/AstNode;

    .line 131
    .local v1, "label":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_c

    .line 133
    .end local v1    # "label":Lorg/mozilla/javascript/ast/AstNode;
    :cond_1c
    iget-object v2, p0, Lorg/mozilla/javascript/ast/LabeledStatement;->statement:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 135
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_21
    return-void
.end method
