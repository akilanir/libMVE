.class final Lfreemarker/core/AndExpression;
.super Lfreemarker/core/BooleanExpression;
.source "AndExpression.java"


# instance fields
.field private final lho:Lfreemarker/core/Expression;

.field private final rho:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "lho"    # Lfreemarker/core/Expression;
    .param p2, "rho"    # Lfreemarker/core/Expression;

    .prologue
    .line 62
    invoke-direct {p0}, Lfreemarker/core/BooleanExpression;-><init>()V

    .line 63
    iput-object p1, p0, Lfreemarker/core/AndExpression;->lho:Lfreemarker/core/Expression;

    .line 64
    iput-object p2, p0, Lfreemarker/core/AndExpression;->rho:Lfreemarker/core/Expression;

    .line 65
    return-void
.end method


# virtual methods
.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 85
    new-instance v0, Lfreemarker/core/AndExpression;

    iget-object v1, p0, Lfreemarker/core/AndExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/AndExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lfreemarker/core/AndExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    return-object v0
.end method

.method evalToBoolean(Lfreemarker/core/Environment;)Z
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lfreemarker/core/AndExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->evalToBoolean(Lfreemarker/core/Environment;)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lfreemarker/core/AndExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->evalToBoolean(Lfreemarker/core/Environment;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/AndExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " && "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/AndExpression;->rho:Lfreemarker/core/Expression;

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
    .line 76
    const-string v0, "&&"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 91
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 103
    invoke-static {p1}, Lfreemarker/core/ParameterRole;->forBinaryOperatorOperand(I)Lfreemarker/core/ParameterRole;

    move-result-object v0

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 95
    packed-switch p1, :pswitch_data_10

    .line 98
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 96
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/AndExpression;->lho:Lfreemarker/core/Expression;

    .line 97
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/AndExpression;->rho:Lfreemarker/core/Expression;

    goto :goto_b

    .line 95
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lfreemarker/core/AndExpression;->constantValue:Lfreemarker/template/TemplateModel;

    if-nez v0, :cond_14

    iget-object v0, p0, Lfreemarker/core/AndExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lfreemarker/core/AndExpression;->rho:Lfreemarker/core/Expression;

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
