.class Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;
.super Ljava/lang/Object;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins$urlBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "urlBIResult"
.end annotation


# instance fields
.field private cachedResult:Ljava/lang/String;

.field private final env:Lfreemarker/core/Environment;

.field private final target:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 314
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 315
    iput-object p1, p0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;->target:Ljava/lang/String;

    .line 316
    iput-object p2, p0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;->env:Lfreemarker/core/Environment;

    .line 317
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/core/StringBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lfreemarker/core/Environment;
    .param p3, "x2"    # Lfreemarker/core/StringBuiltins$1;

    .prologue
    .line 307
    invoke-direct {p0, p1, p2}, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 6
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 344
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_f

    .line 345
    new-instance v1, Lfreemarker/core/_TemplateModelException;

    const-string v2, "The \"url\" built-in needs exactly 1 parameter, the charset."

    invoke-direct {v1, v2}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 349
    :cond_f
    :try_start_f
    new-instance v2, Lfreemarker/template/SimpleScalar;

    iget-object v3, p0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;->target:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v3, v1}, Lfreemarker/template/utility/StringUtil;->URLEnc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V
    :try_end_21
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_f .. :try_end_21} :catch_22

    return-object v2

    .line 351
    :catch_22
    move-exception v0

    .line 352
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lfreemarker/core/_TemplateModelException;

    const-string v2, "Failed to execute URL encoding."

    invoke-direct {v1, v0, v2}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;)V

    throw v1
.end method

.method public getAsString()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 320
    iget-object v2, p0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;->cachedResult:Ljava/lang/String;

    if-nez v2, :cond_1c

    .line 321
    iget-object v2, p0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;->env:Lfreemarker/core/Environment;

    invoke-virtual {v2}, Lfreemarker/core/Environment;->getEffectiveURLEscapingCharset()Ljava/lang/String;

    move-result-object v0

    .line 322
    .local v0, "cs":Ljava/lang/String;
    if-nez v0, :cond_14

    .line 323
    new-instance v2, Lfreemarker/core/_TemplateModelException;

    const-string v3, "To do URL encoding, the framework that encloses FreeMarker must specify the output encoding or the URL encoding charset, so ask the programmers to fix it. Or, as a last chance, you can set the url_encoding_charset setting in the template, e.g. <#setting url_escaping_charset=\'ISO-8859-1\'>, or give the charset explicitly to the buit-in, e.g. foo?url(\'ISO-8859-1\')."

    invoke-direct {v2, v3}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 335
    :cond_14
    :try_start_14
    iget-object v2, p0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;->target:Ljava/lang/String;

    invoke-static {v2, v0}, Lfreemarker/template/utility/StringUtil;->URLEnc(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;->cachedResult:Ljava/lang/String;
    :try_end_1c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_14 .. :try_end_1c} :catch_1f

    .line 340
    .end local v0    # "cs":Ljava/lang/String;
    :cond_1c
    iget-object v2, p0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;->cachedResult:Ljava/lang/String;

    return-object v2

    .line 336
    .restart local v0    # "cs":Ljava/lang/String;
    :catch_1f
    move-exception v1

    .line 337
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lfreemarker/core/_TemplateModelException;

    const-string v3, "Failed to execute URL encoding."

    invoke-direct {v2, v1, v3}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;)V

    throw v2
.end method
