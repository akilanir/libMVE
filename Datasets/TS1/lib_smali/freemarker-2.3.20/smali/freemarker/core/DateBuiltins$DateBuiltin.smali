.class abstract Lfreemarker/core/DateBuiltins$DateBuiltin;
.super Lfreemarker/core/BuiltIn;
.source "DateBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/DateBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "DateBuiltin"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 78
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/DateBuiltins$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/DateBuiltins$1;

    .prologue
    .line 78
    invoke-direct {p0}, Lfreemarker/core/DateBuiltins$DateBuiltin;-><init>()V

    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v2, p0, Lfreemarker/core/DateBuiltins$DateBuiltin;->target:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 83
    .local v0, "model":Lfreemarker/template/TemplateModel;
    instance-of v2, v0, Lfreemarker/template/TemplateDateModel;

    if-eqz v2, :cond_1c

    move-object v1, v0

    .line 84
    check-cast v1, Lfreemarker/template/TemplateDateModel;

    .line 85
    .local v1, "tdm":Lfreemarker/template/TemplateDateModel;
    iget-object v2, p0, Lfreemarker/core/DateBuiltins$DateBuiltin;->target:Lfreemarker/core/Expression;

    invoke-static {v1, v2}, Lfreemarker/core/EvalUtil;->modelToDate(Lfreemarker/template/TemplateDateModel;Lfreemarker/core/Expression;)Ljava/util/Date;

    move-result-object v2

    invoke-interface {v1}, Lfreemarker/template/TemplateDateModel;->getDateType()I

    move-result v3

    invoke-virtual {p0, v2, v3, p1}, Lfreemarker/core/DateBuiltins$DateBuiltin;->calculateResult(Ljava/util/Date;ILfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    return-object v2

    .line 87
    .end local v1    # "tdm":Lfreemarker/template/TemplateDateModel;
    :cond_1c
    if-nez v0, :cond_25

    .line 88
    iget-object v2, p0, Lfreemarker/core/DateBuiltins$DateBuiltin;->target:Lfreemarker/core/Expression;

    invoke-static {v2, p1}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v2

    throw v2

    .line 90
    :cond_25
    new-instance v2, Lfreemarker/core/NonDateException;

    iget-object v3, p0, Lfreemarker/core/DateBuiltins$DateBuiltin;->target:Lfreemarker/core/Expression;

    const-string v4, "date"

    invoke-direct {v2, v3, v0, v4, p1}, Lfreemarker/core/NonDateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v2
.end method

.method protected abstract calculateResult(Ljava/util/Date;ILfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method
