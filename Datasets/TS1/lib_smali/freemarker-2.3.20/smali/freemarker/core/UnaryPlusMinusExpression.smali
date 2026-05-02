.class final Lfreemarker/core/UnaryPlusMinusExpression;
.super Lfreemarker/core/Expression;
.source "UnaryPlusMinusExpression.java"


# static fields
.field private static final MINUS_ONE:Ljava/lang/Integer;


# instance fields
.field private final TYPE_MINUS:I

.field private final TYPE_PLUS:I

.field private final isMinus:Z

.field private final target:Lfreemarker/core/Expression;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 67
    new-instance v0, Ljava/lang/Integer;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lfreemarker/core/UnaryPlusMinusExpression;->MINUS_ONE:Ljava/lang/Integer;

    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Z)V
    .registers 4
    .param p1, "target"    # Lfreemarker/core/Expression;
    .param p2, "isMinus"    # Z

    .prologue
    .line 69
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/core/UnaryPlusMinusExpression;->TYPE_MINUS:I

    .line 63
    const/4 v0, 0x1

    iput v0, p0, Lfreemarker/core/UnaryPlusMinusExpression;->TYPE_PLUS:I

    .line 70
    iput-object p1, p0, Lfreemarker/core/UnaryPlusMinusExpression;->target:Lfreemarker/core/Expression;

    .line 71
    iput-boolean p2, p0, Lfreemarker/core/UnaryPlusMinusExpression;->isMinus:Z

    .line 72
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 9
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 75
    const/4 v3, 0x0

    .line 76
    .local v3, "targetModel":Lfreemarker/template/TemplateNumberModel;
    iget-object v5, p0, Lfreemarker/core/UnaryPlusMinusExpression;->target:Lfreemarker/core/Expression;

    invoke-virtual {v5, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 78
    .local v4, "tm":Lfreemarker/template/TemplateModel;
    :try_start_7
    move-object v0, v4

    check-cast v0, Lfreemarker/template/TemplateNumberModel;

    move-object v3, v0
    :try_end_b
    .catch Ljava/lang/ClassCastException; {:try_start_7 .. :try_end_b} :catch_10

    .line 82
    iget-boolean v5, p0, Lfreemarker/core/UnaryPlusMinusExpression;->isMinus:Z

    if-nez v5, :cond_19

    .line 88
    .end local v3    # "targetModel":Lfreemarker/template/TemplateNumberModel;
    :goto_f
    return-object v3

    .line 79
    .restart local v3    # "targetModel":Lfreemarker/template/TemplateNumberModel;
    :catch_10
    move-exception v1

    .line 80
    .local v1, "cce":Ljava/lang/ClassCastException;
    new-instance v5, Lfreemarker/core/NonNumericalException;

    iget-object v6, p0, Lfreemarker/core/UnaryPlusMinusExpression;->target:Lfreemarker/core/Expression;

    invoke-direct {v5, v6, v4, p1}, Lfreemarker/core/NonNumericalException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    throw v5

    .line 85
    .end local v1    # "cce":Ljava/lang/ClassCastException;
    :cond_19
    iget-object v5, p0, Lfreemarker/core/UnaryPlusMinusExpression;->target:Lfreemarker/core/Expression;

    invoke-virtual {v5, v3, p1}, Lfreemarker/core/Expression;->assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    .line 86
    invoke-interface {v3}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v2

    .line 87
    .local v2, "n":Ljava/lang/Number;
    sget-object v5, Lfreemarker/core/ArithmeticEngine;->CONSERVATIVE_ENGINE:Lfreemarker/core/ArithmeticEngine$ConservativeEngine;

    sget-object v6, Lfreemarker/core/UnaryPlusMinusExpression;->MINUS_ONE:Ljava/lang/Integer;

    invoke-virtual {v5, v6, v2}, Lfreemarker/core/ArithmeticEngine$ConservativeEngine;->multiply(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v2

    .line 88
    new-instance v3, Lfreemarker/template/SimpleNumber;

    .end local v3    # "targetModel":Lfreemarker/template/TemplateNumberModel;
    invoke-direct {v3, v2}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto :goto_f
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 106
    new-instance v0, Lfreemarker/core/UnaryPlusMinusExpression;

    iget-object v1, p0, Lfreemarker/core/UnaryPlusMinusExpression;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    iget-boolean v2, p0, Lfreemarker/core/UnaryPlusMinusExpression;->isMinus:Z

    invoke-direct {v0, v1, v2}, Lfreemarker/core/UnaryPlusMinusExpression;-><init>(Lfreemarker/core/Expression;Z)V

    return-object v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 4

    .prologue
    .line 92
    iget-boolean v1, p0, Lfreemarker/core/UnaryPlusMinusExpression;->isMinus:Z

    if-eqz v1, :cond_1e

    const-string v0, "-"

    .line 93
    .local v0, "op":Ljava/lang/String;
    :goto_6
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/UnaryPlusMinusExpression;->target:Lfreemarker/core/Expression;

    invoke-virtual {v2}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 92
    .end local v0    # "op":Ljava/lang/String;
    :cond_1e
    const-string v0, "+"

    goto :goto_6
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-boolean v0, p0, Lfreemarker/core/UnaryPlusMinusExpression;->isMinus:Z

    if-eqz v0, :cond_7

    const-string v0, "-..."

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "+..."

    goto :goto_6
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 117
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 129
    packed-switch p1, :pswitch_data_10

    .line 132
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 130
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->RIGHT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    .line 131
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->AST_NODE_SUBTYPE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 129
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 121
    packed-switch p1, :pswitch_data_1a

    .line 124
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 122
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/UnaryPlusMinusExpression;->target:Lfreemarker/core/Expression;

    .line 123
    :goto_b
    return-object v0

    :pswitch_c
    new-instance v1, Ljava/lang/Integer;

    iget-boolean v0, p0, Lfreemarker/core/UnaryPlusMinusExpression;->isMinus:Z

    if-eqz v0, :cond_18

    const/4 v0, 0x0

    :goto_13
    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(I)V

    move-object v0, v1

    goto :goto_b

    :cond_18
    const/4 v0, 0x1

    goto :goto_13

    .line 121
    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method isIgnorable()Z
    .registers 2

    .prologue
    .line 113
    const/4 v0, 0x1

    return v0
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lfreemarker/core/UnaryPlusMinusExpression;->target:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    return v0
.end method
