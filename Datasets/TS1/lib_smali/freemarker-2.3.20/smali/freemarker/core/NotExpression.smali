.class final Lfreemarker/core/NotExpression;
.super Lfreemarker/core/BooleanExpression;
.source "NotExpression.java"


# instance fields
.field private final target:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;)V
    .registers 2
    .param p1, "target"    # Lfreemarker/core/Expression;

    .prologue
    .line 61
    invoke-direct {p0}, Lfreemarker/core/BooleanExpression;-><init>()V

    .line 62
    iput-object p1, p0, Lfreemarker/core/NotExpression;->target:Lfreemarker/core/Expression;

    .line 63
    return-void
.end method


# virtual methods
.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 6
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 83
    new-instance v0, Lfreemarker/core/NotExpression;

    iget-object v1, p0, Lfreemarker/core/NotExpression;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/core/NotExpression;-><init>(Lfreemarker/core/Expression;)V

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
    .line 66
    iget-object v0, p0, Lfreemarker/core/NotExpression;->target:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->evalToBoolean(Lfreemarker/core/Environment;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/NotExpression;->target:Lfreemarker/core/Expression;

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
    .line 74
    const-string v0, "!"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 88
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 97
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 98
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->RIGHT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 92
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 93
    :cond_8
    iget-object v0, p0, Lfreemarker/core/NotExpression;->target:Lfreemarker/core/Expression;

    return-object v0
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lfreemarker/core/NotExpression;->target:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    return v0
.end method
