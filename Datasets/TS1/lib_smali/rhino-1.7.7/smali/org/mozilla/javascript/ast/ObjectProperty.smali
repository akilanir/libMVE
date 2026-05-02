.class public Lorg/mozilla/javascript/ast/ObjectProperty;
.super Lorg/mozilla/javascript/ast/InfixExpression;
.source "ObjectProperty.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>()V

    .line 36
    const/16 v0, 0x67

    iput v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    .line 55
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(I)V

    .line 36
    const/16 v0, 0x67

    iput v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    .line 59
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 62
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/ast/InfixExpression;-><init>(II)V

    .line 36
    const/16 v0, 0x67

    iput v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    .line 63
    return-void
.end method


# virtual methods
.method public isGetterMethod()Z
    .registers 3

    .prologue
    .line 76
    iget v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    const/16 v1, 0x97

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isMethod()Z
    .registers 2

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ObjectProperty;->isGetterMethod()Z

    move-result v0

    if-nez v0, :cond_12

    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ObjectProperty;->isSetterMethod()Z

    move-result v0

    if-nez v0, :cond_12

    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ObjectProperty;->isNormalMethod()Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public isNormalMethod()Z
    .registers 3

    .prologue
    .line 98
    iget v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    const/16 v1, 0xa3

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isSetterMethod()Z
    .registers 3

    .prologue
    .line 90
    iget v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    const/16 v1, 0x98

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setIsGetterMethod()V
    .registers 2

    .prologue
    .line 69
    const/16 v0, 0x97

    iput v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    .line 70
    return-void
.end method

.method public setIsNormalMethod()V
    .registers 2

    .prologue
    .line 94
    const/16 v0, 0xa3

    iput v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    .line 95
    return-void
.end method

.method public setIsSetterMethod()V
    .registers 2

    .prologue
    .line 83
    const/16 v0, 0x98

    iput v0, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    .line 84
    return-void
.end method

.method public setNodeType(I)V
    .registers 5
    .param p1, "nodeType"    # I

    .prologue
    .line 45
    const/16 v0, 0x67

    if-eq p1, v0, :cond_29

    const/16 v0, 0x97

    if-eq p1, v0, :cond_29

    const/16 v0, 0x98

    if-eq p1, v0, :cond_29

    const/16 v0, 0xa3

    if-eq p1, v0, :cond_29

    .line 49
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid node type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_29
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/ObjectProperty;->setType(I)Lorg/mozilla/javascript/Node;

    .line 52
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 7
    .param p1, "depth"    # I

    .prologue
    const/4 v2, 0x0

    const/16 v4, 0x67

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/ObjectProperty;->makeIndent(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ObjectProperty;->isGetterMethod()Z

    move-result v1

    if-eqz v1, :cond_4e

    .line 111
    const-string v1, "get "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    :cond_21
    :goto_21
    iget-object v3, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->left:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ObjectProperty;->getType()I

    move-result v1

    if-ne v1, v4, :cond_5a

    move v1, v2

    :goto_2a
    invoke-virtual {v3, v1}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    iget v1, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->type:I

    if-ne v1, v4, :cond_3a

    .line 117
    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    :cond_3a
    iget-object v1, p0, Lorg/mozilla/javascript/ast/ObjectProperty;->right:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ObjectProperty;->getType()I

    move-result v3

    if-ne v3, v4, :cond_5c

    :goto_42
    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 112
    :cond_4e
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/ObjectProperty;->isSetterMethod()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 113
    const-string v1, "set "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_21

    :cond_5a
    move v1, p1

    .line 115
    goto :goto_2a

    .line 119
    :cond_5c
    add-int/lit8 v2, p1, 0x1

    goto :goto_42
.end method
