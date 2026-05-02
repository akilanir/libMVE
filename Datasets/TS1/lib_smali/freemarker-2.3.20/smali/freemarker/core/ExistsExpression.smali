.class Lfreemarker/core/ExistsExpression;
.super Lfreemarker/core/Expression;
.source "ExistsExpression.java"


# instance fields
.field protected final exp:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;)V
    .registers 2
    .param p1, "exp"    # Lfreemarker/core/Expression;

    .prologue
    .line 65
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 66
    iput-object p1, p0, Lfreemarker/core/ExistsExpression;->exp:Lfreemarker/core/Expression;

    .line 67
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
    .line 71
    iget-object v3, p0, Lfreemarker/core/ExistsExpression;->exp:Lfreemarker/core/Expression;

    instance-of v3, v3, Lfreemarker/core/ParentheticalExpression;

    if-eqz v3, :cond_24

    .line 72
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    move-result v1

    .line 74
    .local v1, "lastFIRE":Z
    :try_start_b
    iget-object v3, p0, Lfreemarker/core/ExistsExpression;->exp:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    :try_end_10
    .catch Lfreemarker/core/InvalidReferenceException; {:try_start_b .. :try_end_10} :catch_19
    .catchall {:try_start_b .. :try_end_10} :catchall_1f

    move-result-object v2

    .line 78
    .local v2, "tm":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    .line 83
    .end local v1    # "lastFIRE":Z
    :goto_14
    if-nez v2, :cond_2b

    sget-object v3, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    :goto_18
    return-object v3

    .line 75
    .end local v2    # "tm":Lfreemarker/template/TemplateModel;
    .restart local v1    # "lastFIRE":Z
    :catch_19
    move-exception v0

    .line 76
    .local v0, "ire":Lfreemarker/core/InvalidReferenceException;
    const/4 v2, 0x0

    .line 78
    .restart local v2    # "tm":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    goto :goto_14

    .end local v0    # "ire":Lfreemarker/core/InvalidReferenceException;
    .end local v2    # "tm":Lfreemarker/template/TemplateModel;
    :catchall_1f
    move-exception v3

    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    throw v3

    .line 81
    .end local v1    # "lastFIRE":Z
    :cond_24
    iget-object v3, p0, Lfreemarker/core/ExistsExpression;->exp:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .restart local v2    # "tm":Lfreemarker/template/TemplateModel;
    goto :goto_14

    .line 83
    :cond_2b
    sget-object v3, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_18
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 6
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 91
    new-instance v0, Lfreemarker/core/ExistsExpression;

    iget-object v1, p0, Lfreemarker/core/ExistsExpression;->exp:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/core/ExistsExpression;-><init>(Lfreemarker/core/Expression;)V

    return-object v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 96
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/ExistsExpression;->exp:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/core/ExistsExpression;->getNodeTypeSymbol()Ljava/lang/String;

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
    .line 100
    const-string v0, "??"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 104
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 112
    sget-object v0, Lfreemarker/core/ParameterRole;->LEFT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 108
    iget-object v0, p0, Lfreemarker/core/ExistsExpression;->exp:Lfreemarker/core/Expression;

    return-object v0
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x0

    return v0
.end method
