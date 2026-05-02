.class Lfreemarker/core/MiscellaneousBuiltins$cBI;
.super Lfreemarker/core/BuiltIn;
.source "MiscellaneousBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "cBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 454
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

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
    .line 456
    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$cBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 457
    .local v0, "model":Lfreemarker/template/TemplateModel;
    instance-of v2, v0, Lfreemarker/template/TemplateNumberModel;

    if-eqz v2, :cond_32

    .line 458
    check-cast v0, Lfreemarker/template/TemplateNumberModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$cBI;->target:Lfreemarker/core/Expression;

    invoke-static {v0, v2}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v1

    .line 459
    .local v1, "num":Ljava/lang/Number;
    instance-of v2, v1, Ljava/lang/Integer;

    if-nez v2, :cond_1a

    instance-of v2, v1, Ljava/lang/Long;

    if-eqz v2, :cond_24

    .line 461
    :cond_1a
    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 466
    .end local v1    # "num":Ljava/lang/Number;
    :goto_23
    return-object v2

    .line 463
    .restart local v1    # "num":Ljava/lang/Number;
    :cond_24
    new-instance v2, Lfreemarker/template/SimpleScalar;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getCNumberFormat()Ljava/text/NumberFormat;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_23

    .line 465
    .end local v1    # "num":Ljava/lang/Number;
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_32
    instance-of v2, v0, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v2, :cond_4a

    .line 466
    new-instance v3, Lfreemarker/template/SimpleScalar;

    check-cast v0, Lfreemarker/template/TemplateBooleanModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v2

    if-eqz v2, :cond_47

    const-string v2, "true"

    :goto_42
    invoke-direct {v3, v2}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    goto :goto_23

    :cond_47
    const-string v2, "false"

    goto :goto_42

    .line 469
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_4a
    new-instance v2, Lfreemarker/core/UnexpectedTypeException;

    iget-object v3, p0, Lfreemarker/core/MiscellaneousBuiltins$cBI;->target:Lfreemarker/core/Expression;

    const-string v4, "number or boolean"

    invoke-direct {v2, v3, v0, v4, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v2
.end method
