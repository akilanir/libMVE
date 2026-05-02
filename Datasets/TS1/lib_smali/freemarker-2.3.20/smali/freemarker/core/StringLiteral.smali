.class final Lfreemarker/core/StringLiteral;
.super Lfreemarker/core/Expression;
.source "StringLiteral.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;


# instance fields
.field private dynamicValue:Lfreemarker/core/TemplateElement;

.field private final value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 71
    iput-object p1, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    .line 72
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v0, Lfreemarker/template/SimpleScalar;

    invoke-virtual {p0, p1}, Lfreemarker/core/StringLiteral;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method checkInterpolation()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v4, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x3

    if-le v4, v5, :cond_52

    iget-object v4, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    const-string v5, "${"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_1d

    iget-object v4, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    const-string v5, "#{"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ltz v4, :cond_52

    .line 76
    :cond_1d
    new-instance v2, Lfreemarker/core/SimpleCharStream;

    new-instance v4, Ljava/io/StringReader;

    iget-object v5, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lfreemarker/core/StringLiteral;->beginLine:I

    iget v6, p0, Lfreemarker/core/StringLiteral;->beginColumn:I

    add-int/lit8 v6, v6, 0x1

    iget-object v7, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-direct {v2, v4, v5, v6, v7}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/Reader;III)V

    .line 77
    .local v2, "scs":Lfreemarker/core/SimpleCharStream;
    new-instance v3, Lfreemarker/core/FMParserTokenManager;

    invoke-direct {v3, v2}, Lfreemarker/core/FMParserTokenManager;-><init>(Lfreemarker/core/SimpleCharStream;)V

    .line 78
    .local v3, "token_source":Lfreemarker/core/FMParserTokenManager;
    const/4 v4, 0x1

    iput-boolean v4, v3, Lfreemarker/core/FMParserTokenManager;->onlyTextOutput:Z

    .line 79
    new-instance v1, Lfreemarker/core/FMParser;

    invoke-direct {v1, v3}, Lfreemarker/core/FMParser;-><init>(Lfreemarker/core/FMParserTokenManager;)V

    .line 80
    .local v1, "parser":Lfreemarker/core/FMParser;
    invoke-virtual {p0}, Lfreemarker/core/StringLiteral;->getTemplate()Lfreemarker/template/Template;

    move-result-object v4

    invoke-virtual {v1, v4}, Lfreemarker/core/FMParser;->setTemplate(Lfreemarker/template/Template;)V

    .line 82
    :try_start_49
    invoke-virtual {v1}, Lfreemarker/core/FMParser;->FreeMarkerText()Lfreemarker/core/TemplateElement;

    move-result-object v4

    iput-object v4, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;
    :try_end_4f
    .catch Lfreemarker/core/ParseException; {:try_start_49 .. :try_end_4f} :catch_53

    .line 88
    const/4 v4, 0x0

    iput-object v4, p0, Lfreemarker/core/StringLiteral;->constantValue:Lfreemarker/template/TemplateModel;

    .line 90
    .end local v1    # "parser":Lfreemarker/core/FMParser;
    .end local v2    # "scs":Lfreemarker/core/SimpleCharStream;
    .end local v3    # "token_source":Lfreemarker/core/FMParserTokenManager;
    :cond_52
    return-void

    .line 84
    .restart local v1    # "parser":Lfreemarker/core/FMParser;
    .restart local v2    # "scs":Lfreemarker/core/SimpleCharStream;
    .restart local v3    # "token_source":Lfreemarker/core/FMParserTokenManager;
    :catch_53
    move-exception v0

    .line 85
    .local v0, "e":Lfreemarker/core/ParseException;
    invoke-virtual {p0}, Lfreemarker/core/StringLiteral;->getTemplate()Lfreemarker/template/Template;

    move-result-object v4

    invoke-virtual {v4}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lfreemarker/core/ParseException;->setTemplateName(Ljava/lang/String;)V

    .line 86
    throw v0
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 6
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 141
    new-instance v0, Lfreemarker/core/StringLiteral;

    iget-object v1, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    invoke-direct {v0, v1}, Lfreemarker/core/StringLiteral;-><init>(Ljava/lang/String;)V

    .line 143
    .local v0, "cloned":Lfreemarker/core/StringLiteral;
    iget-object v1, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    iput-object v1, v0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    .line 144
    return-object v0
.end method

.method evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v2, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    if-nez v2, :cond_7

    .line 110
    iget-object v2, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    .line 122
    :goto_6
    return-object v2

    .line 113
    :cond_7
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getTemplateExceptionHandler()Lfreemarker/template/TemplateExceptionHandler;

    move-result-object v1

    .line 114
    .local v1, "teh":Lfreemarker/template/TemplateExceptionHandler;
    sget-object v2, Lfreemarker/template/TemplateExceptionHandler;->RETHROW_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    invoke-virtual {p1, v2}, Lfreemarker/core/Environment;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    .line 116
    :try_start_10
    iget-object v2, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v2}, Lfreemarker/core/Environment;->renderElementToString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_15} :catch_1a
    .catchall {:try_start_10 .. :try_end_15} :catchall_21

    move-result-object v2

    .line 122
    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto :goto_6

    .line 118
    :catch_1a
    move-exception v0

    .line 119
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_1b
    new-instance v2, Lfreemarker/core/_MiscTemplateException;

    invoke-direct {v2, v0, p1}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    throw v2
    :try_end_21
    .catchall {:try_start_1b .. :try_end_21} :catchall_21

    .line 122
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_21
    move-exception v2

    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    throw v2
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 128
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/StringLiteral;->value:Ljava/lang/String;

    invoke-static {v1}, Lfreemarker/template/utility/StringUtil;->FTLStringLiteralEnc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lfreemarker/core/StringLiteral;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    const-string v0, "dynamic \"...\""

    goto :goto_8
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 148
    const/4 v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 157
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 158
    :cond_8
    sget-object v0, Lfreemarker/core/ParameterRole;->EMBEDDED_TEMPLATE:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 152
    if-eqz p1, :cond_8

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 153
    :cond_8
    iget-object v0, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    return-object v0
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method isSingleInterpolationLiteral()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 104
    iget-object v2, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    if-eqz v2, :cond_19

    iget-object v2, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    invoke-virtual {v2}, Lfreemarker/core/TemplateElement;->getChildCount()I

    move-result v2

    if-ne v2, v0, :cond_19

    iget-object v2, p0, Lfreemarker/core/StringLiteral;->dynamicValue:Lfreemarker/core/TemplateElement;

    invoke-virtual {v2, v1}, Lfreemarker/core/TemplateElement;->getChildAt(I)Ljavax/swing/tree/TreeNode;

    move-result-object v2

    instance-of v2, v2, Lfreemarker/core/DollarVariable;

    if-eqz v2, :cond_19

    :goto_18
    return v0

    :cond_19
    move v0, v1

    goto :goto_18
.end method
