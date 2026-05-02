.class final Lfreemarker/core/Range;
.super Lfreemarker/core/Expression;
.source "Range.java"


# instance fields
.field final lho:Lfreemarker/core/Expression;

.field final rho:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "lho"    # Lfreemarker/core/Expression;
    .param p2, "rho"    # Lfreemarker/core/Expression;

    .prologue
    .line 66
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 67
    iput-object p1, p0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    .line 68
    iput-object p2, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    .line 69
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v2, p0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1}, Lfreemarker/core/Expression;->evalToNumber(Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 79
    .local v1, "min":I
    const/4 v0, 0x0

    .line 80
    .local v0, "max":I
    iget-object v2, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    if-eqz v2, :cond_1f

    .line 81
    iget-object v2, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1}, Lfreemarker/core/Expression;->evalToNumber(Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 82
    new-instance v2, Lfreemarker/core/NumericalRange;

    invoke-direct {v2, v1, v0}, Lfreemarker/core/NumericalRange;-><init>(II)V

    .line 84
    :goto_1e
    return-object v2

    :cond_1f
    new-instance v2, Lfreemarker/core/NumericalRange;

    invoke-direct {v2, v1}, Lfreemarker/core/NumericalRange;-><init>(I)V

    goto :goto_1e
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 108
    new-instance v0, Lfreemarker/core/Range;

    iget-object v1, p0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lfreemarker/core/Range;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    return-object v0
.end method

.method evalToBoolean(Lfreemarker/core/Environment;)Z
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 89
    new-instance v0, Lfreemarker/core/NonBooleanException;

    new-instance v1, Lfreemarker/core/NumericalRange;

    invoke-direct {v1, v2, v2}, Lfreemarker/core/NumericalRange;-><init>(II)V

    invoke-direct {v0, p0, v1, p1}, Lfreemarker/core/NonBooleanException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    throw v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 4

    .prologue
    .line 93
    iget-object v1, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    if-eqz v1, :cond_28

    iget-object v1, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "rhs":Ljava/lang/String;
    :goto_a
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v2}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ".."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 93
    .end local v0    # "rhs":Ljava/lang/String;
    :cond_28
    const-string v0, ""

    goto :goto_a
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    const-string v0, ".."

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 114
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 126
    invoke-static {p1}, Lfreemarker/core/ParameterRole;->forBinaryOperatorOperand(I)Lfreemarker/core/ParameterRole;

    move-result-object v0

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 118
    packed-switch p1, :pswitch_data_10

    .line 121
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 119
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    .line 120
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    goto :goto_b

    .line 118
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method hasRho()Z
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method isLiteral()Z
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 102
    iget-object v3, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v3}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v3

    if-eqz v3, :cond_1f

    :cond_e
    move v0, v2

    .line 103
    .local v0, "rightIsLiteral":Z
    :goto_f
    iget-object v3, p0, Lfreemarker/core/Range;->constantValue:Lfreemarker/template/TemplateModel;

    if-nez v3, :cond_1d

    iget-object v3, p0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v3}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v3

    if-eqz v3, :cond_1e

    if-eqz v0, :cond_1e

    :cond_1d
    move v1, v2

    :cond_1e
    return v1

    .end local v0    # "rightIsLiteral":Z
    :cond_1f
    move v0, v1

    .line 102
    goto :goto_f
.end method
