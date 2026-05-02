.class final Lfreemarker/core/ComparisonExpression;
.super Lfreemarker/core/BooleanExpression;
.source "ComparisonExpression.java"


# instance fields
.field private final left:Lfreemarker/core/Expression;

.field private final opString:Ljava/lang/String;

.field private final operation:I

.field private final right:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 7
    .param p1, "left"    # Lfreemarker/core/Expression;
    .param p2, "right"    # Lfreemarker/core/Expression;
    .param p3, "opString"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0}, Lfreemarker/core/BooleanExpression;-><init>()V

    .line 71
    iput-object p1, p0, Lfreemarker/core/ComparisonExpression;->left:Lfreemarker/core/Expression;

    .line 72
    iput-object p2, p0, Lfreemarker/core/ComparisonExpression;->right:Lfreemarker/core/Expression;

    .line 73
    invoke-virtual {p3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p3

    .line 74
    iput-object p3, p0, Lfreemarker/core/ComparisonExpression;->opString:Ljava/lang/String;

    .line 75
    const-string v0, "=="

    if-eq p3, v0, :cond_15

    const-string v0, "="

    if-ne p3, v0, :cond_19

    .line 76
    :cond_15
    const/4 v0, 0x1

    iput v0, p0, Lfreemarker/core/ComparisonExpression;->operation:I

    .line 96
    :goto_18
    return-void

    .line 78
    :cond_19
    const-string v0, "!="

    if-ne p3, v0, :cond_21

    .line 79
    const/4 v0, 0x2

    iput v0, p0, Lfreemarker/core/ComparisonExpression;->operation:I

    goto :goto_18

    .line 81
    :cond_21
    const-string v0, "gt"

    if-eq p3, v0, :cond_31

    const-string v0, "\\gt"

    if-eq p3, v0, :cond_31

    const-string v0, ">"

    if-eq p3, v0, :cond_31

    const-string v0, "&gt;"

    if-ne p3, v0, :cond_35

    .line 82
    :cond_31
    const/4 v0, 0x4

    iput v0, p0, Lfreemarker/core/ComparisonExpression;->operation:I

    goto :goto_18

    .line 84
    :cond_35
    const-string v0, "gte"

    if-eq p3, v0, :cond_45

    const-string v0, "\\gte"

    if-eq p3, v0, :cond_45

    const-string v0, ">="

    if-eq p3, v0, :cond_45

    const-string v0, "&gt;="

    if-ne p3, v0, :cond_49

    .line 85
    :cond_45
    const/4 v0, 0x6

    iput v0, p0, Lfreemarker/core/ComparisonExpression;->operation:I

    goto :goto_18

    .line 87
    :cond_49
    const-string v0, "lt"

    if-eq p3, v0, :cond_59

    const-string v0, "\\lt"

    if-eq p3, v0, :cond_59

    const-string v0, "<"

    if-eq p3, v0, :cond_59

    const-string v0, "&lt;"

    if-ne p3, v0, :cond_5d

    .line 88
    :cond_59
    const/4 v0, 0x3

    iput v0, p0, Lfreemarker/core/ComparisonExpression;->operation:I

    goto :goto_18

    .line 90
    :cond_5d
    const-string v0, "lte"

    if-eq p3, v0, :cond_6d

    const-string v0, "\\lte"

    if-eq p3, v0, :cond_6d

    const-string v0, "<="

    if-eq p3, v0, :cond_6d

    const-string v0, "&lt;="

    if-ne p3, v0, :cond_71

    .line 91
    :cond_6d
    const/4 v0, 0x5

    iput v0, p0, Lfreemarker/core/ComparisonExpression;->operation:I

    goto :goto_18

    .line 94
    :cond_71
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unknown comparison operator "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 8
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 120
    new-instance v0, Lfreemarker/core/ComparisonExpression;

    iget-object v1, p0, Lfreemarker/core/ComparisonExpression;->left:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/ComparisonExpression;->right:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/core/ComparisonExpression;->opString:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/ComparisonExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;Ljava/lang/String;)V

    return-object v0
.end method

.method evalToBoolean(Lfreemarker/core/Environment;)Z
    .registers 8
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lfreemarker/core/ComparisonExpression;->left:Lfreemarker/core/Expression;

    iget v1, p0, Lfreemarker/core/ComparisonExpression;->operation:I

    iget-object v2, p0, Lfreemarker/core/ComparisonExpression;->opString:Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/core/ComparisonExpression;->right:Lfreemarker/core/Expression;

    move-object v4, p0

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/core/Expression;ILjava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 4

    .prologue
    const/16 v2, 0x20

    .line 107
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/ComparisonExpression;->left:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/ComparisonExpression;->opString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/ComparisonExpression;->right:Lfreemarker/core/Expression;

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
    .line 111
    iget-object v0, p0, Lfreemarker/core/ComparisonExpression;->opString:Ljava/lang/String;

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 127
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 135
    invoke-static {p1}, Lfreemarker/core/ParameterRole;->forBinaryOperatorOperand(I)Lfreemarker/core/ParameterRole;

    move-result-object v0

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 131
    if-nez p1, :cond_5

    iget-object v0, p0, Lfreemarker/core/ComparisonExpression;->left:Lfreemarker/core/Expression;

    :goto_4
    return-object v0

    :cond_5
    iget-object v0, p0, Lfreemarker/core/ComparisonExpression;->right:Lfreemarker/core/Expression;

    goto :goto_4
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lfreemarker/core/ComparisonExpression;->constantValue:Lfreemarker/template/TemplateModel;

    if-nez v0, :cond_14

    iget-object v0, p0, Lfreemarker/core/ComparisonExpression;->left:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lfreemarker/core/ComparisonExpression;->right:Lfreemarker/core/Expression;

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
