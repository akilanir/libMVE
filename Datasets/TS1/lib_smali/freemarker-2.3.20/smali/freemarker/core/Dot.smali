.class final Lfreemarker/core/Dot;
.super Lfreemarker/core/Expression;
.source "Dot.java"


# instance fields
.field private final key:Ljava/lang/String;

.field private final target:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 3
    .param p1, "target"    # Lfreemarker/core/Expression;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 68
    iput-object p1, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    .line 69
    iput-object p2, p0, Lfreemarker/core/Dot;->key:Ljava/lang/String;

    .line 70
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v1, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 75
    .local v0, "leftModel":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/template/TemplateHashModel;

    if-eqz v1, :cond_13

    .line 76
    check-cast v0, Lfreemarker/template/TemplateHashModel;

    .end local v0    # "leftModel":Lfreemarker/template/TemplateModel;
    iget-object v1, p0, Lfreemarker/core/Dot;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 79
    :goto_12
    return-object v1

    .line 78
    .restart local v0    # "leftModel":Lfreemarker/template/TemplateModel;
    :cond_13
    if-nez v0, :cond_1d

    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 79
    const/4 v1, 0x0

    goto :goto_12

    .line 81
    :cond_1d
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    const-string v3, "hash"

    invoke-direct {v1, v2, v0, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 98
    new-instance v0, Lfreemarker/core/Dot;

    iget-object v1, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/Dot;->key:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lfreemarker/core/Dot;-><init>(Lfreemarker/core/Expression;Ljava/lang/String;)V

    return-object v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/core/Dot;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/Dot;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    const-string v0, "."

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 104
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 112
    invoke-static {p1}, Lfreemarker/core/ParameterRole;->forBinaryOperatorOperand(I)Lfreemarker/core/ParameterRole;

    move-result-object v0

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 108
    if-nez p1, :cond_5

    iget-object v0, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    :goto_4
    return-object v0

    :cond_5
    iget-object v0, p0, Lfreemarker/core/Dot;->key:Ljava/lang/String;

    goto :goto_4
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    return v0
.end method

.method onlyHasIdentifiers()Z
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    instance-of v0, v0, Lfreemarker/core/Identifier;

    if-nez v0, :cond_16

    iget-object v0, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    instance-of v0, v0, Lfreemarker/core/Dot;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lfreemarker/core/Dot;->target:Lfreemarker/core/Expression;

    check-cast v0, Lfreemarker/core/Dot;

    invoke-virtual {v0}, Lfreemarker/core/Dot;->onlyHasIdentifiers()Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method
