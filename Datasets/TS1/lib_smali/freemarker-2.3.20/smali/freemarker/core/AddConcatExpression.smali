.class final Lfreemarker/core/AddConcatExpression;
.super Lfreemarker/core/Expression;
.source "AddConcatExpression.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;,
        Lfreemarker/core/AddConcatExpression$ConcatenatedHash;,
        Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;
    }
.end annotation


# instance fields
.field private final left:Lfreemarker/core/Expression;

.field private final right:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "left"    # Lfreemarker/core/Expression;
    .param p2, "right"    # Lfreemarker/core/Expression;

    .prologue
    .line 83
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 84
    iput-object p1, p0, Lfreemarker/core/AddConcatExpression;->left:Lfreemarker/core/Expression;

    .line 85
    iput-object p2, p0, Lfreemarker/core/AddConcatExpression;->right:Lfreemarker/core/Expression;

    .line 86
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 13
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v10, p0, Lfreemarker/core/AddConcatExpression;->left:Lfreemarker/core/Expression;

    invoke-virtual {v10, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 92
    .local v3, "leftModel":Lfreemarker/template/TemplateModel;
    iget-object v10, p0, Lfreemarker/core/AddConcatExpression;->right:Lfreemarker/core/Expression;

    invoke-virtual {v10, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v5

    .line 93
    .local v5, "rightModel":Lfreemarker/template/TemplateModel;
    instance-of v10, v3, Lfreemarker/template/TemplateNumberModel;

    if-eqz v10, :cond_3d

    instance-of v10, v5, Lfreemarker/template/TemplateNumberModel;

    if-eqz v10, :cond_3d

    .line 95
    check-cast v3, Lfreemarker/template/TemplateNumberModel;

    .end local v3    # "leftModel":Lfreemarker/template/TemplateModel;
    iget-object v10, p0, Lfreemarker/core/AddConcatExpression;->left:Lfreemarker/core/Expression;

    invoke-static {v3, v10}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v2

    .line 96
    .local v2, "first":Ljava/lang/Number;
    check-cast v5, Lfreemarker/template/TemplateNumberModel;

    .end local v5    # "rightModel":Lfreemarker/template/TemplateModel;
    iget-object v10, p0, Lfreemarker/core/AddConcatExpression;->right:Lfreemarker/core/Expression;

    invoke-static {v5, v10}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v9

    .line 97
    .local v9, "second":Ljava/lang/Number;
    if-eqz p1, :cond_34

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v0

    .line 101
    .local v0, "ae":Lfreemarker/core/ArithmeticEngine;
    :goto_2a
    new-instance v6, Lfreemarker/template/SimpleNumber;

    invoke-virtual {v0, v2, v9}, Lfreemarker/core/ArithmeticEngine;->add(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v10

    invoke-direct {v6, v10}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    .line 128
    .end local v0    # "ae":Lfreemarker/core/ArithmeticEngine;
    .end local v2    # "first":Ljava/lang/Number;
    .end local v9    # "second":Ljava/lang/Number;
    :cond_33
    :goto_33
    return-object v6

    .line 97
    .restart local v2    # "first":Ljava/lang/Number;
    .restart local v9    # "second":Ljava/lang/Number;
    :cond_34
    invoke-virtual {p0}, Lfreemarker/core/AddConcatExpression;->getTemplate()Lfreemarker/template/Template;

    move-result-object v10

    invoke-virtual {v10}, Lfreemarker/template/Template;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v0

    goto :goto_2a

    .line 103
    .end local v2    # "first":Ljava/lang/Number;
    .end local v9    # "second":Ljava/lang/Number;
    .restart local v3    # "leftModel":Lfreemarker/template/TemplateModel;
    .restart local v5    # "rightModel":Lfreemarker/template/TemplateModel;
    :cond_3d
    instance-of v10, v3, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v10, :cond_4f

    instance-of v10, v5, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v10, :cond_4f

    .line 105
    new-instance v6, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;

    check-cast v3, Lfreemarker/template/TemplateSequenceModel;

    .end local v3    # "leftModel":Lfreemarker/template/TemplateModel;
    check-cast v5, Lfreemarker/template/TemplateSequenceModel;

    .end local v5    # "rightModel":Lfreemarker/template/TemplateModel;
    invoke-direct {v6, v3, v5}, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;Lfreemarker/template/TemplateSequenceModel;)V

    goto :goto_33

    .line 110
    .restart local v3    # "leftModel":Lfreemarker/template/TemplateModel;
    .restart local v5    # "rightModel":Lfreemarker/template/TemplateModel;
    :cond_4f
    :try_start_4f
    iget-object v10, p0, Lfreemarker/core/AddConcatExpression;->left:Lfreemarker/core/Expression;

    invoke-static {v3, v10, p1}, Lfreemarker/core/Expression;->coerceModelToString(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v7

    .line 111
    .local v7, "s1":Ljava/lang/String;
    if-nez v7, :cond_59

    const-string v7, "null"

    .line 112
    :cond_59
    iget-object v10, p0, Lfreemarker/core/AddConcatExpression;->right:Lfreemarker/core/Expression;

    invoke-static {v5, v10, p1}, Lfreemarker/core/Expression;->coerceModelToString(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v8

    .line 113
    .local v8, "s2":Ljava/lang/String;
    if-nez v8, :cond_63

    const-string v8, "null"

    .line 114
    :cond_63
    new-instance v6, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v7, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, v10}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V
    :try_end_6c
    .catch Lfreemarker/core/NonStringException; {:try_start_4f .. :try_end_6c} :catch_6d

    goto :goto_33

    .line 115
    .end local v7    # "s1":Ljava/lang/String;
    .end local v8    # "s2":Ljava/lang/String;
    :catch_6d
    move-exception v1

    .line 116
    .local v1, "e":Lfreemarker/core/NonStringException;
    instance-of v10, v3, Lfreemarker/template/TemplateHashModel;

    if-eqz v10, :cond_a3

    instance-of v10, v5, Lfreemarker/template/TemplateHashModel;

    if-eqz v10, :cond_a3

    .line 117
    instance-of v10, v3, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v10, :cond_99

    instance-of v10, v5, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v10, :cond_99

    move-object v4, v3

    .line 118
    check-cast v4, Lfreemarker/template/TemplateHashModelEx;

    .local v4, "leftModelEx":Lfreemarker/template/TemplateHashModelEx;
    move-object v6, v5

    .line 119
    check-cast v6, Lfreemarker/template/TemplateHashModelEx;

    .line 120
    .local v6, "rightModelEx":Lfreemarker/template/TemplateHashModelEx;
    invoke-interface {v4}, Lfreemarker/template/TemplateHashModelEx;->size()I

    move-result v10

    if-eqz v10, :cond_33

    .line 122
    invoke-interface {v6}, Lfreemarker/template/TemplateHashModelEx;->size()I

    move-result v10

    if-nez v10, :cond_92

    move-object v6, v4

    .line 123
    goto :goto_33

    .line 125
    :cond_92
    new-instance v10, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;

    invoke-direct {v10, v4, v6}, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;-><init>(Lfreemarker/template/TemplateHashModelEx;Lfreemarker/template/TemplateHashModelEx;)V

    move-object v6, v10

    goto :goto_33

    .line 128
    .end local v4    # "leftModelEx":Lfreemarker/template/TemplateHashModelEx;
    .end local v6    # "rightModelEx":Lfreemarker/template/TemplateHashModelEx;
    :cond_99
    new-instance v6, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;

    check-cast v3, Lfreemarker/template/TemplateHashModel;

    .end local v3    # "leftModel":Lfreemarker/template/TemplateModel;
    check-cast v5, Lfreemarker/template/TemplateHashModel;

    .end local v5    # "rightModel":Lfreemarker/template/TemplateModel;
    invoke-direct {v6, v3, v5}, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;-><init>(Lfreemarker/template/TemplateHashModel;Lfreemarker/template/TemplateHashModel;)V

    goto :goto_33

    .line 132
    .restart local v3    # "leftModel":Lfreemarker/template/TemplateModel;
    .restart local v5    # "rightModel":Lfreemarker/template/TemplateModel;
    :cond_a3
    throw v1
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 144
    new-instance v0, Lfreemarker/core/AddConcatExpression;

    iget-object v1, p0, Lfreemarker/core/AddConcatExpression;->left:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/AddConcatExpression;->right:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lfreemarker/core/AddConcatExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    return-object v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 150
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/AddConcatExpression;->left:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " + "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/AddConcatExpression;->right:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    const-string v0, "+"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 158
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 166
    invoke-static {p1}, Lfreemarker/core/ParameterRole;->forBinaryOperatorOperand(I)Lfreemarker/core/ParameterRole;

    move-result-object v0

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 162
    if-nez p1, :cond_5

    iget-object v0, p0, Lfreemarker/core/AddConcatExpression;->left:Lfreemarker/core/Expression;

    :goto_4
    return-object v0

    :cond_5
    iget-object v0, p0, Lfreemarker/core/AddConcatExpression;->right:Lfreemarker/core/Expression;

    goto :goto_4
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lfreemarker/core/AddConcatExpression;->constantValue:Lfreemarker/template/TemplateModel;

    if-nez v0, :cond_14

    iget-object v0, p0, Lfreemarker/core/AddConcatExpression;->left:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lfreemarker/core/AddConcatExpression;->right:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
