.class Lfreemarker/core/Interpret;
.super Lfreemarker/core/BuiltIn;
.source "Interpret.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/Interpret$TemplateProcessorModel;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 79
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 143
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 15
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 99
    iget-object v7, p0, Lfreemarker/core/Interpret;->target:Lfreemarker/core/Expression;

    invoke-virtual {v7, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 100
    .local v3, "model":Lfreemarker/template/TemplateModel;
    const/4 v5, 0x0

    .line 101
    .local v5, "sourceExpr":Lfreemarker/core/Expression;
    const-string v1, "anonymous_interpreted"

    .line 102
    .local v1, "id":Ljava/lang/String;
    instance-of v7, v3, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v7, :cond_8c

    .line 104
    new-instance v7, Lfreemarker/core/DynamicKeyName;

    iget-object v8, p0, Lfreemarker/core/Interpret;->target:Lfreemarker/core/Expression;

    new-instance v9, Lfreemarker/core/NumberLiteral;

    new-instance v10, Ljava/lang/Integer;

    invoke-direct {v10, v12}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {v9, v10}, Lfreemarker/core/NumberLiteral;-><init>(Ljava/lang/Number;)V

    invoke-direct {v7, v8, v9}, Lfreemarker/core/DynamicKeyName;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    iget-object v8, p0, Lfreemarker/core/Interpret;->target:Lfreemarker/core/Expression;

    invoke-virtual {v7, v8}, Lfreemarker/core/DynamicKeyName;->copyLocationFrom(Lfreemarker/core/TemplateObject;)Lfreemarker/core/TemplateObject;

    move-result-object v5

    .end local v5    # "sourceExpr":Lfreemarker/core/Expression;
    check-cast v5, Lfreemarker/core/Expression;

    .line 105
    .restart local v5    # "sourceExpr":Lfreemarker/core/Expression;
    check-cast v3, Lfreemarker/template/TemplateSequenceModel;

    .end local v3    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v3}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v7

    if-le v7, v11, :cond_4d

    .line 107
    new-instance v7, Lfreemarker/core/DynamicKeyName;

    iget-object v8, p0, Lfreemarker/core/Interpret;->target:Lfreemarker/core/Expression;

    new-instance v9, Lfreemarker/core/NumberLiteral;

    new-instance v10, Ljava/lang/Integer;

    invoke-direct {v10, v11}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {v9, v10}, Lfreemarker/core/NumberLiteral;-><init>(Ljava/lang/Number;)V

    invoke-direct {v7, v8, v9}, Lfreemarker/core/DynamicKeyName;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    iget-object v8, p0, Lfreemarker/core/Interpret;->target:Lfreemarker/core/Expression;

    invoke-virtual {v7, v8}, Lfreemarker/core/DynamicKeyName;->copyLocationFrom(Lfreemarker/core/TemplateObject;)Lfreemarker/core/TemplateObject;

    move-result-object v7

    check-cast v7, Lfreemarker/core/Expression;

    invoke-virtual {v7, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    .line 118
    :cond_4d
    :goto_4d
    invoke-virtual {v5, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v6

    .line 119
    .local v6, "templateSource":Ljava/lang/String;
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v4

    .line 124
    .local v4, "parentTemplate":Lfreemarker/template/Template;
    :try_start_55
    new-instance v2, Lfreemarker/template/Template;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_9d

    invoke-virtual {v4}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v7

    :goto_66
    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "->"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4}, Lfreemarker/template/Template;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v8

    invoke-direct {v2, v7, v6, v8}, Lfreemarker/template/Template;-><init>(Ljava/lang/String;Ljava/lang/String;Lfreemarker/template/Configuration;)V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_7f} :catch_a0

    .line 139
    .local v2, "interpretedTemplate":Lfreemarker/template/Template;
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v2, v7}, Lfreemarker/template/Template;->setLocale(Ljava/util/Locale;)V

    .line 140
    new-instance v7, Lfreemarker/core/Interpret$TemplateProcessorModel;

    invoke-direct {v7, p0, v2}, Lfreemarker/core/Interpret$TemplateProcessorModel;-><init>(Lfreemarker/core/Interpret;Lfreemarker/template/Template;)V

    return-object v7

    .line 110
    .end local v2    # "interpretedTemplate":Lfreemarker/template/Template;
    .end local v4    # "parentTemplate":Lfreemarker/template/Template;
    .end local v6    # "templateSource":Ljava/lang/String;
    .restart local v3    # "model":Lfreemarker/template/TemplateModel;
    :cond_8c
    instance-of v7, v3, Lfreemarker/template/TemplateScalarModel;

    if-eqz v7, :cond_93

    .line 112
    iget-object v5, p0, Lfreemarker/core/Interpret;->target:Lfreemarker/core/Expression;

    goto :goto_4d

    .line 116
    :cond_93
    new-instance v7, Lfreemarker/core/UnexpectedTypeException;

    iget-object v8, p0, Lfreemarker/core/Interpret;->target:Lfreemarker/core/Expression;

    const-string v9, "sequence or string"

    invoke-direct {v7, v8, v3, v9, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v7

    .line 124
    .end local v3    # "model":Lfreemarker/template/TemplateModel;
    .restart local v4    # "parentTemplate":Lfreemarker/template/Template;
    .restart local v6    # "templateSource":Ljava/lang/String;
    :cond_9d
    :try_start_9d
    const-string v7, "nameless_template"
    :try_end_9f
    .catch Ljava/io/IOException; {:try_start_9d .. :try_end_9f} :catch_a0

    goto :goto_66

    .line 129
    :catch_a0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/io/IOException;
    new-instance v7, Lfreemarker/core/_MiscTemplateException;

    const/4 v8, 0x7

    new-array v8, v8, [Ljava/lang/Object;

    const-string v9, "Template parsing with \"?"

    aput-object v9, v8, v12

    iget-object v9, p0, Lfreemarker/core/Interpret;->key:Ljava/lang/String;

    aput-object v9, v8, v11

    const/4 v9, 0x2

    const-string v10, "\" has failed with this error:\n\n"

    aput-object v10, v8, v9

    const/4 v9, 0x3

    const-string v10, "---begin-message---\n"

    aput-object v10, v8, v9

    const/4 v9, 0x4

    new-instance v10, Lfreemarker/core/_DelayedGetMessage;

    invoke-direct {v10, v0}, Lfreemarker/core/_DelayedGetMessage;-><init>(Ljava/lang/Throwable;)V

    aput-object v10, v8, v9

    const/4 v9, 0x5

    const-string v10, "\n---end-message---"

    aput-object v10, v8, v9

    const/4 v9, 0x6

    const-string v10, "\n\nThe failed expression:"

    aput-object v10, v8, v9

    invoke-direct {v7, p0, v0, p1, v8}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v7
.end method
