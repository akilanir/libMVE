.class Lfreemarker/core/NumericalBuiltins$longBI;
.super Lfreemarker/core/BuiltIn;
.source "NumericalBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NumericalBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "longBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 117
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
    .line 121
    iget-object v3, p0, Lfreemarker/core/NumericalBuiltins$longBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 122
    .local v1, "model":Lfreemarker/template/TemplateModel;
    instance-of v3, v1, Lfreemarker/template/TemplateNumberModel;

    if-nez v3, :cond_20

    instance-of v3, v1, Lfreemarker/template/TemplateDateModel;

    if-eqz v3, :cond_20

    .line 124
    check-cast v1, Lfreemarker/template/TemplateDateModel;

    .end local v1    # "model":Lfreemarker/template/TemplateModel;
    iget-object v3, p0, Lfreemarker/core/NumericalBuiltins$longBI;->target:Lfreemarker/core/Expression;

    invoke-static {v1, v3}, Lfreemarker/core/EvalUtil;->modelToDate(Lfreemarker/template/TemplateDateModel;Lfreemarker/core/Expression;)Ljava/util/Date;

    move-result-object v0

    .line 125
    .local v0, "date":Ljava/util/Date;
    new-instance v1, Lfreemarker/template/SimpleNumber;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    invoke-direct {v1, v3, v4}, Lfreemarker/template/SimpleNumber;-><init>(J)V

    .line 131
    .end local v0    # "date":Ljava/util/Date;
    :cond_1f
    :goto_1f
    return-object v1

    .line 127
    .restart local v1    # "model":Lfreemarker/template/TemplateModel;
    :cond_20
    iget-object v3, p0, Lfreemarker/core/NumericalBuiltins$longBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v3, v1, p1}, Lfreemarker/core/Expression;->modelToNumber(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v2

    .line 128
    .local v2, "num":Ljava/lang/Number;
    instance-of v3, v2, Ljava/lang/Long;

    if-nez v3, :cond_1f

    .line 131
    new-instance v1, Lfreemarker/template/SimpleNumber;

    .end local v1    # "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    invoke-direct {v1, v3, v4}, Lfreemarker/template/SimpleNumber;-><init>(J)V

    goto :goto_1f
.end method
