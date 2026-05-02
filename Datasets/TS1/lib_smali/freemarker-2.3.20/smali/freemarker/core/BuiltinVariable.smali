.class final Lfreemarker/core/BuiltinVariable;
.super Lfreemarker/core/Expression;
.source "BuiltinVariable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/BuiltinVariable$VarsHash;
    }
.end annotation


# static fields
.field static final CURRENT_NODE:Ljava/lang/String; = "current_node"

.field static final DATA_MODEL:Ljava/lang/String; = "data_model"

.field static final ERROR:Ljava/lang/String; = "error"

.field static final GLOBALS:Ljava/lang/String; = "globals"

.field static final LANG:Ljava/lang/String; = "lang"

.field static final LOCALE:Ljava/lang/String; = "locale"

.field static final LOCALS:Ljava/lang/String; = "locals"

.field static final MAIN:Ljava/lang/String; = "main"

.field static final NAMESPACE:Ljava/lang/String; = "namespace"

.field static final NODE:Ljava/lang/String; = "node"

.field static final NOW:Ljava/lang/String; = "now"

.field static final OUTPUT_ENCODING:Ljava/lang/String; = "output_encoding"

.field static final PASS:Ljava/lang/String; = "pass"

.field static final TEMPLATE_NAME:Ljava/lang/String; = "template_name"

.field static final URL_ESCAPING_CHARSET:Ljava/lang/String; = "url_escaping_charset"

.field static final VARS:Ljava/lang/String; = "vars"

.field static final VERSION:Ljava/lang/String; = "version"


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 92
    invoke-virtual {p1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p1

    .line 93
    iput-object p1, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    .line 94
    const-string v0, "template_name"

    if-eq p1, v0, :cond_66

    const-string v0, "namespace"

    if-eq p1, v0, :cond_66

    const-string v0, "main"

    if-eq p1, v0, :cond_66

    const-string v0, "globals"

    if-eq p1, v0, :cond_66

    const-string v0, "locals"

    if-eq p1, v0, :cond_66

    const-string v0, "lang"

    if-eq p1, v0, :cond_66

    const-string v0, "locale"

    if-eq p1, v0, :cond_66

    const-string v0, "data_model"

    if-eq p1, v0, :cond_66

    const-string v0, "current_node"

    if-eq p1, v0, :cond_66

    const-string v0, "node"

    if-eq p1, v0, :cond_66

    const-string v0, "pass"

    if-eq p1, v0, :cond_66

    const-string v0, "vars"

    if-eq p1, v0, :cond_66

    const-string v0, "version"

    if-eq p1, v0, :cond_66

    const-string v0, "output_encoding"

    if-eq p1, v0, :cond_66

    const-string v0, "url_escaping_charset"

    if-eq p1, v0, :cond_66

    const-string v0, "error"

    if-eq p1, v0, :cond_66

    const-string v0, "now"

    if-eq p1, v0, :cond_66

    .line 112
    new-instance v0, Lfreemarker/core/ParseException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unknown built-in variable: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/core/TemplateObject;)V

    throw v0

    .line 114
    :cond_66
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 8
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 117
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "namespace"

    if-ne v3, v4, :cond_c

    .line 118
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getCurrentNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v2

    .line 166
    :cond_b
    :goto_b
    return-object v2

    .line 120
    :cond_c
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "main"

    if-ne v3, v4, :cond_17

    .line 121
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getMainNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v2

    goto :goto_b

    .line 123
    :cond_17
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "globals"

    if-ne v3, v4, :cond_22

    .line 124
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getGlobalVariables()Lfreemarker/template/TemplateHashModel;

    move-result-object v2

    goto :goto_b

    .line 126
    :cond_22
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "locals"

    if-ne v3, v4, :cond_33

    .line 127
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getCurrentMacroContext()Lfreemarker/core/Macro$Context;

    move-result-object v0

    .line 128
    .local v0, "ctx":Lfreemarker/core/Macro$Context;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lfreemarker/core/Macro$Context;->getLocals()Lfreemarker/core/Environment$Namespace;

    move-result-object v2

    goto :goto_b

    .line 130
    .end local v0    # "ctx":Lfreemarker/core/Macro$Context;
    :cond_33
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "data_model"

    if-ne v3, v4, :cond_3e

    .line 131
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getDataModel()Lfreemarker/template/TemplateHashModel;

    move-result-object v2

    goto :goto_b

    .line 133
    :cond_3e
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "vars"

    if-ne v3, v4, :cond_4a

    .line 134
    new-instance v2, Lfreemarker/core/BuiltinVariable$VarsHash;

    invoke-direct {v2, p1}, Lfreemarker/core/BuiltinVariable$VarsHash;-><init>(Lfreemarker/core/Environment;)V

    goto :goto_b

    .line 136
    :cond_4a
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "locale"

    if-ne v3, v4, :cond_5e

    .line 137
    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_b

    .line 139
    :cond_5e
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "lang"

    if-ne v3, v4, :cond_72

    .line 140
    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_b

    .line 142
    :cond_72
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "current_node"

    if-eq v3, v4, :cond_7e

    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "node"

    if-ne v3, v4, :cond_83

    .line 143
    :cond_7e
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getCurrentVisitorNode()Lfreemarker/template/TemplateNodeModel;

    move-result-object v2

    goto :goto_b

    .line 145
    :cond_83
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "template_name"

    if-ne v3, v4, :cond_98

    .line 146
    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v3

    invoke-virtual {v3}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 148
    :cond_98
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "pass"

    if-ne v3, v4, :cond_a2

    .line 149
    sget-object v2, Lfreemarker/core/Macro;->DO_NOTHING_MACRO:Lfreemarker/core/Macro;

    goto/16 :goto_b

    .line 151
    :cond_a2
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "version"

    if-ne v3, v4, :cond_b3

    .line 152
    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-static {}, Lfreemarker/template/Configuration;->getVersionNumber()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 154
    :cond_b3
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "output_encoding"

    if-ne v3, v4, :cond_c6

    .line 155
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getOutputEncoding()Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_b

    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-direct {v2, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 158
    .end local v1    # "s":Ljava/lang/String;
    :cond_c6
    iget-object v3, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v4, "url_escaping_charset"

    if-ne v3, v4, :cond_d9

    .line 159
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getURLEscapingCharset()Ljava/lang/String;

    move-result-object v1

    .line 160
    .restart local v1    # "s":Ljava/lang/String;
    if-eqz v1, :cond_b

    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-direct {v2, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 162
    .end local v1    # "s":Ljava/lang/String;
    :cond_d9
    iget-object v2, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v3, "error"

    if-ne v2, v3, :cond_ea

    .line 163
    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getCurrentRecoveredErrorMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto/16 :goto_b

    .line 165
    :cond_ea
    iget-object v2, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    const-string v3, "now"

    if-ne v2, v3, :cond_fd

    .line 166
    new-instance v2, Lfreemarker/template/SimpleDate;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    const/4 v4, 0x3

    invoke-direct {v2, v3, v4}, Lfreemarker/template/SimpleDate;-><init>(Ljava/util/Date;I)V

    goto/16 :goto_b

    .line 168
    :cond_fd
    new-instance v2, Lfreemarker/core/_MiscTemplateException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "Invalid built-in variable: "

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-direct {v2, p0, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v2
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 4
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 189
    return-object p0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 176
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 180
    invoke-virtual {p0}, Lfreemarker/core/BuiltinVariable;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 210
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 218
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 214
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 184
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 172
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/BuiltinVariable;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
