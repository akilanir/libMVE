.class Lfreemarker/core/StringBuiltins$evalBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "evalBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 179
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 16
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x0

    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 182
    new-instance v3, Lfreemarker/core/SimpleCharStream;

    new-instance v5, Ljava/io/StringReader;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    const v6, -0x3b9aca00

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x2

    invoke-direct {v3, v5, v6, v8, v7}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/Reader;III)V

    .line 184
    .local v3, "scs":Lfreemarker/core/SimpleCharStream;
    new-instance v4, Lfreemarker/core/FMParserTokenManager;

    invoke-direct {v4, v3}, Lfreemarker/core/FMParserTokenManager;-><init>(Lfreemarker/core/SimpleCharStream;)V

    .line 185
    .local v4, "token_source":Lfreemarker/core/FMParserTokenManager;
    invoke-virtual {p2}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v5

    invoke-virtual {v5}, Lfreemarker/template/Configuration;->getIncompatibleImprovements()Lfreemarker/template/Version;

    move-result-object v5

    invoke-virtual {v5}, Lfreemarker/template/Version;->intValue()I

    move-result v5

    iput v5, v4, Lfreemarker/core/FMParserTokenManager;->incompatibleImprovements:I

    .line 186
    invoke-virtual {v4, v9}, Lfreemarker/core/FMParserTokenManager;->SwitchTo(I)V

    .line 187
    new-instance v2, Lfreemarker/core/FMParser;

    invoke-direct {v2, v4}, Lfreemarker/core/FMParser;-><init>(Lfreemarker/core/FMParserTokenManager;)V

    .line 188
    .local v2, "parser":Lfreemarker/core/FMParser;
    invoke-virtual {p0}, Lfreemarker/core/StringBuiltins$evalBI;->getTemplate()Lfreemarker/template/Template;

    move-result-object v5

    invoke-virtual {v2, v5}, Lfreemarker/core/FMParser;->setTemplate(Lfreemarker/template/Template;)V

    .line 189
    const/4 v1, 0x0

    .line 192
    .local v1, "exp":Lfreemarker/core/Expression;
    :try_start_54
    invoke-virtual {v2}, Lfreemarker/core/FMParser;->Expression()Lfreemarker/core/Expression;
    :try_end_57
    .catch Lfreemarker/core/TokenMgrError; {:try_start_54 .. :try_end_57} :catch_5d
    .catch Lfreemarker/core/ParseException; {:try_start_54 .. :try_end_57} :catch_67

    move-result-object v1

    .line 205
    :try_start_58
    invoke-virtual {v1, p2}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    :try_end_5b
    .catch Lfreemarker/template/TemplateException; {:try_start_58 .. :try_end_5b} :catch_92

    move-result-object v5

    return-object v5

    .line 193
    :catch_5d
    move-exception v0

    .line 194
    .local v0, "e":Lfreemarker/core/TokenMgrError;
    :try_start_5e
    invoke-virtual {p0}, Lfreemarker/core/StringBuiltins$evalBI;->getTemplate()Lfreemarker/template/Template;

    move-result-object v5

    invoke-virtual {v0, v5}, Lfreemarker/core/TokenMgrError;->toParseException(Lfreemarker/template/Template;)Lfreemarker/core/ParseException;

    move-result-object v5

    throw v5
    :try_end_67
    .catch Lfreemarker/core/ParseException; {:try_start_5e .. :try_end_67} :catch_67

    .line 196
    .end local v0    # "e":Lfreemarker/core/TokenMgrError;
    :catch_67
    move-exception v0

    .line 197
    .local v0, "e":Lfreemarker/core/ParseException;
    new-instance v5, Lfreemarker/core/_MiscTemplateException;

    const/4 v6, 0x7

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "Failed to \"?"

    aput-object v7, v6, v10

    iget-object v7, p0, Lfreemarker/core/StringBuiltins$evalBI;->key:Ljava/lang/String;

    aput-object v7, v6, v8

    const-string v7, "\" string with this error:\n\n"

    aput-object v7, v6, v9

    const-string v7, "---begin-message---\n"

    aput-object v7, v6, v11

    new-instance v7, Lfreemarker/core/_DelayedGetMessage;

    invoke-direct {v7, v0}, Lfreemarker/core/_DelayedGetMessage;-><init>(Ljava/lang/Throwable;)V

    aput-object v7, v6, v12

    const/4 v7, 0x5

    const-string v8, "\n---end-message---"

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-string v8, "\n\nThe failing expression:"

    aput-object v8, v6, v7

    invoke-direct {v5, p0, v6}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v5

    .line 206
    .end local v0    # "e":Lfreemarker/core/ParseException;
    :catch_92
    move-exception v0

    .line 207
    .local v0, "e":Lfreemarker/template/TemplateException;
    new-instance v5, Lfreemarker/core/_MiscTemplateException;

    const/4 v6, 0x7

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "Failed to \"?"

    aput-object v7, v6, v10

    iget-object v7, p0, Lfreemarker/core/StringBuiltins$evalBI;->key:Ljava/lang/String;

    aput-object v7, v6, v8

    const-string v7, "\" string with this error:\n\n"

    aput-object v7, v6, v9

    const-string v7, "---begin-message---\n"

    aput-object v7, v6, v11

    new-instance v7, Lfreemarker/core/_DelayedGetMessageWithoutStackTop;

    invoke-direct {v7, v0}, Lfreemarker/core/_DelayedGetMessageWithoutStackTop;-><init>(Lfreemarker/template/TemplateException;)V

    aput-object v7, v6, v12

    const/4 v7, 0x5

    const-string v8, "\n---end-message---"

    aput-object v8, v6, v7

    const/4 v7, 0x6

    const-string v8, "\n\nThe failing expression:"

    aput-object v8, v6, v7

    invoke-direct {v5, p0, v6}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v5
.end method
