.class final Lfreemarker/core/Include;
.super Lfreemarker/core/TemplateElement;
.source "Include.java"


# instance fields
.field private encoding:Ljava/lang/String;

.field private encodingExp:Lfreemarker/core/Expression;

.field private parse:Z

.field private parseExp:Lfreemarker/core/Expression;

.field private templateName:Lfreemarker/core/Expression;

.field private final templatePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lfreemarker/template/Template;Lfreemarker/core/Expression;Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 11
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "includedTemplateName"    # Lfreemarker/core/Expression;
    .param p3, "encodingExp"    # Lfreemarker/core/Expression;
    .param p4, "parseExp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 87
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 88
    invoke-virtual {p1}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "templatePath1":Ljava/lang/String;
    if-nez v2, :cond_c

    .line 91
    const-string v2, ""

    .line 93
    :cond_c
    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 94
    .local v1, "lastSlash":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_3a

    const-string v3, ""

    :goto_17
    iput-object v3, p0, Lfreemarker/core/Include;->templatePath:Ljava/lang/String;

    .line 95
    iput-object p2, p0, Lfreemarker/core/Include;->templateName:Lfreemarker/core/Expression;

    .line 96
    instance-of v3, p3, Lfreemarker/core/StringLiteral;

    if-eqz v3, :cond_42

    .line 97
    invoke-virtual {p3}, Lfreemarker/core/Expression;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/core/Include;->encoding:Ljava/lang/String;

    .line 98
    iget-object v3, p0, Lfreemarker/core/Include;->encoding:Ljava/lang/String;

    iget-object v4, p0, Lfreemarker/core/Include;->encoding:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/core/Include;->encoding:Ljava/lang/String;

    .line 103
    :goto_35
    if-nez p4, :cond_45

    .line 104
    iput-boolean v5, p0, Lfreemarker/core/Include;->parse:Z

    .line 128
    :goto_39
    return-void

    .line 94
    :cond_3a
    const/4 v3, 0x0

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_17

    .line 101
    :cond_42
    iput-object p3, p0, Lfreemarker/core/Include;->encodingExp:Lfreemarker/core/Expression;

    goto :goto_35

    .line 106
    :cond_45
    invoke-virtual {p4}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v3

    if-eqz v3, :cond_73

    .line 108
    :try_start_4b
    instance-of v3, p4, Lfreemarker/core/StringLiteral;

    if-eqz v3, :cond_62

    .line 109
    const/4 v3, 0x0

    invoke-virtual {p4, v3}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lfreemarker/core/Include;->parse:Z
    :try_end_5a
    .catch Lfreemarker/template/TemplateException; {:try_start_4b .. :try_end_5a} :catch_5b

    goto :goto_39

    .line 120
    :catch_5b
    move-exception v0

    .line 122
    .local v0, "e":Lfreemarker/template/TemplateException;
    new-instance v3, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v3, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 113
    .end local v0    # "e":Lfreemarker/template/TemplateException;
    :cond_62
    const/4 v3, 0x0

    :try_start_63
    invoke-virtual {p4, v3}, Lfreemarker/core/Expression;->evalToBoolean(Lfreemarker/core/Environment;)Z

    move-result v3

    iput-boolean v3, p0, Lfreemarker/core/Include;->parse:Z
    :try_end_69
    .catch Lfreemarker/core/NonBooleanException; {:try_start_63 .. :try_end_69} :catch_6a
    .catch Lfreemarker/template/TemplateException; {:try_start_63 .. :try_end_69} :catch_5b

    goto :goto_39

    .line 115
    :catch_6a
    move-exception v0

    .line 116
    .local v0, "e":Lfreemarker/core/NonBooleanException;
    :try_start_6b
    new-instance v3, Lfreemarker/core/ParseException;

    const-string v4, "Expected a boolean or string as the value of the parse attribute"

    invoke-direct {v3, v4, p4}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v3
    :try_end_73
    .catch Lfreemarker/template/TemplateException; {:try_start_6b .. :try_end_73} :catch_5b

    .line 126
    .end local v0    # "e":Lfreemarker/core/NonBooleanException;
    :cond_73
    iput-object p4, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    goto :goto_39
.end method

.method private getYesNo(Ljava/lang/String;)Z
    .registers 8
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 201
    :try_start_0
    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_3} :catch_5

    move-result v1

    return v1

    .line 203
    :catch_5
    move-exception v0

    .line 204
    .local v0, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    iget-object v2, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Value of include parse parameter must be boolean (or one of these strings: \"n\", \"no\", \"f\", \"false\", \"y\", \"yes\", \"t\", \"true\"), but it was "

    aput-object v5, v3, v4

    const/4 v4, 0x1

    new-instance v5, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v5, p1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "."

    aput-object v5, v3, v4

    invoke-direct {v1, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v1
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 16
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 131
    iget-object v7, p0, Lfreemarker/core/Include;->templateName:Lfreemarker/core/Expression;

    invoke-virtual {v7, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v5

    .line 132
    .local v5, "templateNameString":Ljava/lang/String;
    iget-object v0, p0, Lfreemarker/core/Include;->encoding:Ljava/lang/String;

    .line 133
    .local v0, "enc":Ljava/lang/String;
    iget-object v7, p0, Lfreemarker/core/Include;->encoding:Ljava/lang/String;

    if-nez v7, :cond_1b

    iget-object v7, p0, Lfreemarker/core/Include;->encodingExp:Lfreemarker/core/Expression;

    if-eqz v7, :cond_1b

    .line 134
    iget-object v7, p0, Lfreemarker/core/Include;->encodingExp:Lfreemarker/core/Expression;

    invoke-virtual {v7, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v0

    .line 137
    :cond_1b
    iget-boolean v3, p0, Lfreemarker/core/Include;->parse:Z

    .line 138
    .local v3, "parse":Z
    iget-object v7, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    if-eqz v7, :cond_40

    .line 139
    iget-object v7, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    invoke-virtual {v7, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    .line 140
    .local v6, "tm":Lfreemarker/template/TemplateModel;
    if-nez v6, :cond_30

    .line 141
    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v7

    if-eqz v7, :cond_4e

    .line 142
    const/4 v3, 0x0

    .line 148
    :cond_30
    :goto_30
    instance-of v7, v6, Lfreemarker/template/TemplateScalarModel;

    if-eqz v7, :cond_54

    .line 149
    check-cast v6, Lfreemarker/template/TemplateScalarModel;

    .end local v6    # "tm":Lfreemarker/template/TemplateModel;
    iget-object v7, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    invoke-static {v6, v7, p1}, Lfreemarker/core/EvalUtil;->modelToString(Lfreemarker/template/TemplateScalarModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lfreemarker/core/Include;->getYesNo(Ljava/lang/String;)Z

    move-result v3

    .line 158
    :cond_40
    :goto_40
    :try_start_40
    iget-object v7, p0, Lfreemarker/core/Include;->templatePath:Ljava/lang/String;

    invoke-static {p1, v7, v5}, Lfreemarker/cache/TemplateCache;->getFullTemplatePath(Lfreemarker/core/Environment;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 159
    invoke-virtual {p1, v5, v0, v3}, Lfreemarker/core/Environment;->getTemplateForInclusion(Ljava/lang/String;Ljava/lang/String;Z)Lfreemarker/template/Template;
    :try_end_49
    .catch Lfreemarker/core/ParseException; {:try_start_40 .. :try_end_49} :catch_5b
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_49} :catch_7a

    move-result-object v1

    .line 172
    .local v1, "includedTemplate":Lfreemarker/template/Template;
    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->include(Lfreemarker/template/Template;)V

    .line 173
    return-void

    .line 145
    .end local v1    # "includedTemplate":Lfreemarker/template/Template;
    .restart local v6    # "tm":Lfreemarker/template/TemplateModel;
    :cond_4e
    iget-object v7, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    invoke-virtual {v7, v6, p1}, Lfreemarker/core/Expression;->assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    goto :goto_30

    .line 152
    :cond_54
    iget-object v7, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    invoke-virtual {v7, p1}, Lfreemarker/core/Expression;->evalToBoolean(Lfreemarker/core/Environment;)Z

    move-result v3

    goto :goto_40

    .line 161
    .end local v6    # "tm":Lfreemarker/template/TemplateModel;
    :catch_5b
    move-exception v4

    .line 162
    .local v4, "pe":Lfreemarker/core/ParseException;
    new-instance v7, Lfreemarker/core/_MiscTemplateException;

    new-array v8, v8, [Ljava/lang/Object;

    const-string v9, "Error parsing included template "

    aput-object v9, v8, v10

    new-instance v9, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v9, v5}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v9, v8, v11

    const-string v9, ":\n"

    aput-object v9, v8, v12

    new-instance v9, Lfreemarker/core/_DelayedGetMessage;

    invoke-direct {v9, v4}, Lfreemarker/core/_DelayedGetMessage;-><init>(Ljava/lang/Throwable;)V

    aput-object v9, v8, v13

    invoke-direct {v7, v4, p1, v8}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v7

    .line 167
    .end local v4    # "pe":Lfreemarker/core/ParseException;
    :catch_7a
    move-exception v2

    .line 168
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v7, Lfreemarker/core/_MiscTemplateException;

    new-array v8, v8, [Ljava/lang/Object;

    const-string v9, "Error reading included file "

    aput-object v9, v8, v10

    new-instance v9, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v9, v5}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v9, v8, v11

    const-string v9, ":\n"

    aput-object v9, v8, v12

    new-instance v9, Lfreemarker/core/_DelayedGetMessage;

    invoke-direct {v9, v2}, Lfreemarker/core/_DelayedGetMessage;-><init>(Ljava/lang/Throwable;)V

    aput-object v9, v8, v13

    invoke-direct {v7, v2, p1, v8}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v7
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 5
    .param p1, "canonical"    # Z

    .prologue
    .line 176
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 177
    .local v0, "buf":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 178
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/Include;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 179
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 180
    iget-object v1, p0, Lfreemarker/core/Include;->templateName:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 181
    iget-object v1, p0, Lfreemarker/core/Include;->encoding:Ljava/lang/String;

    if-eqz v1, :cond_38

    .line 182
    const-string v1, " encoding=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 183
    iget-object v1, p0, Lfreemarker/core/Include;->encodingExp:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 184
    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 186
    :cond_38
    iget-object v1, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    if-eqz v1, :cond_64

    .line 187
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, " parse="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/Include;->parseExp:Lfreemarker/core/Expression;

    invoke-virtual {v2}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 191
    :cond_58
    :goto_58
    if-eqz p1, :cond_5f

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    :cond_5f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 188
    :cond_64
    iget-boolean v1, p0, Lfreemarker/core/Include;->parse:Z

    if-nez v1, :cond_58

    .line 189
    const-string v1, " parse=false"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_58
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 196
    const-string v0, "#include"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 212
    const/4 v0, 0x3

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 225
    packed-switch p1, :pswitch_data_12

    .line 229
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 226
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->TEMPLATE_NAME:Lfreemarker/core/ParameterRole;

    .line 228
    :goto_b
    return-object v0

    .line 227
    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->PARSE_PARAMETER:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 228
    :pswitch_f
    sget-object v0, Lfreemarker/core/ParameterRole;->ENCODING_PARAMETER:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 225
    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_f
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 216
    packed-switch p1, :pswitch_data_18

    .line 220
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 217
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/Include;->templateName:Lfreemarker/core/Expression;

    .line 219
    :goto_b
    return-object v0

    .line 218
    :pswitch_c
    new-instance v0, Ljava/lang/Boolean;

    iget-boolean v1, p0, Lfreemarker/core/Include;->parse:Z

    invoke-direct {v0, v1}, Ljava/lang/Boolean;-><init>(Z)V

    goto :goto_b

    .line 219
    :pswitch_14
    iget-object v0, p0, Lfreemarker/core/Include;->encoding:Ljava/lang/String;

    goto :goto_b

    .line 216
    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_14
    .end packed-switch
.end method
