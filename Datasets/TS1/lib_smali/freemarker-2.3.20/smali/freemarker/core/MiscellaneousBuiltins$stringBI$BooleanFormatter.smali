.class Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;
.super Ljava/lang/Object;
.source "MiscellaneousBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins$stringBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BooleanFormatter"
.end annotation


# instance fields
.field private final bool:Lfreemarker/template/TemplateBooleanModel;

.field private final env:Lfreemarker/core/Environment;

.field private final this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;


# direct methods
.method constructor <init>(Lfreemarker/core/MiscellaneousBuiltins$stringBI;Lfreemarker/template/TemplateBooleanModel;Lfreemarker/core/Environment;)V
    .registers 4
    .param p2, "bool"    # Lfreemarker/template/TemplateBooleanModel;
    .param p3, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 286
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;

    .line 287
    iput-object p2, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->bool:Lfreemarker/template/TemplateBooleanModel;

    .line 288
    iput-object p3, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->env:Lfreemarker/core/Environment;

    .line 289
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 4
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 305
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Lfreemarker/core/MiscellaneousBuiltins$stringBI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 306
    new-instance v1, Lfreemarker/template/SimpleScalar;

    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->bool:Lfreemarker/template/TemplateBooleanModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    :goto_11
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v1

    :cond_1b
    const/4 v0, 0x1

    goto :goto_11
.end method

.method public getAsString()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 293
    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->bool:Lfreemarker/template/TemplateBooleanModel;

    instance-of v1, v1, Lfreemarker/template/TemplateScalarModel;

    if-eqz v1, :cond_f

    .line 294
    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->bool:Lfreemarker/template/TemplateBooleanModel;

    check-cast v1, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v1

    .line 297
    :goto_e
    return-object v1

    :cond_f
    :try_start_f
    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->env:Lfreemarker/core/Environment;

    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;->bool:Lfreemarker/template/TemplateBooleanModel;

    invoke-interface {v2}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lfreemarker/core/Environment;->formatBoolean(ZZ)Ljava/lang/String;
    :try_end_1b
    .catch Lfreemarker/template/TemplateException; {:try_start_f .. :try_end_1b} :catch_1d

    move-result-object v1

    goto :goto_e

    .line 298
    :catch_1d
    move-exception v0

    .line 299
    .local v0, "e":Lfreemarker/template/TemplateException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method
