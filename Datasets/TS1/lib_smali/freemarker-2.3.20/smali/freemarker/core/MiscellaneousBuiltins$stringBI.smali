.class Lfreemarker/core/MiscellaneousBuiltins$stringBI;
.super Lfreemarker/core/BuiltIn;
.source "MiscellaneousBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "stringBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;,
        Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;,
        Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 157
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 278
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
    .line 160
    iget-object v3, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 161
    .local v2, "model":Lfreemarker/template/TemplateModel;
    instance-of v3, v2, Lfreemarker/template/TemplateNumberModel;

    if-eqz v3, :cond_19

    .line 162
    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;

    check-cast v2, Lfreemarker/template/TemplateNumberModel;

    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    iget-object v4, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI;->target:Lfreemarker/core/Expression;

    invoke-static {v2, v4}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v4

    invoke-direct {v3, p0, v4, p1}, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;-><init>(Lfreemarker/core/MiscellaneousBuiltins$stringBI;Ljava/lang/Number;Lfreemarker/core/Environment;)V

    move-object v2, v3

    .line 174
    :cond_18
    :goto_18
    return-object v2

    .line 163
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_19
    instance-of v3, v2, Lfreemarker/template/TemplateDateModel;

    if-eqz v3, :cond_30

    move-object v1, v2

    .line 164
    check-cast v1, Lfreemarker/template/TemplateDateModel;

    .line 165
    .local v1, "dm":Lfreemarker/template/TemplateDateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateDateModel;->getDateType()I

    move-result v0

    .line 166
    .local v0, "dateType":I
    new-instance v2, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;

    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    iget-object v3, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI;->target:Lfreemarker/core/Expression;

    invoke-static {v1, v3}, Lfreemarker/core/EvalUtil;->modelToDate(Lfreemarker/template/TemplateDateModel;Lfreemarker/core/Expression;)Ljava/util/Date;

    move-result-object v3

    invoke-direct {v2, p0, v3, v0, p1}, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;-><init>(Lfreemarker/core/MiscellaneousBuiltins$stringBI;Ljava/util/Date;ILfreemarker/core/Environment;)V

    goto :goto_18

    .line 167
    .end local v0    # "dateType":I
    .end local v1    # "dm":Lfreemarker/template/TemplateDateModel;
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_30
    instance-of v3, v2, Lfreemarker/template/SimpleScalar;

    if-nez v3, :cond_18

    .line 169
    instance-of v3, v2, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v3, :cond_41

    .line 170
    new-instance v3, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;

    check-cast v2, Lfreemarker/template/TemplateBooleanModel;

    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    invoke-direct {v3, p0, v2, p1}, Lfreemarker/core/MiscellaneousBuiltins$stringBI$BooleanFormatter;-><init>(Lfreemarker/core/MiscellaneousBuiltins$stringBI;Lfreemarker/template/TemplateBooleanModel;Lfreemarker/core/Environment;)V

    move-object v2, v3

    goto :goto_18

    .line 171
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_41
    instance-of v3, v2, Lfreemarker/template/TemplateScalarModel;

    if-eqz v3, :cond_52

    .line 172
    new-instance v3, Lfreemarker/template/SimpleScalar;

    check-cast v2, Lfreemarker/template/TemplateScalarModel;

    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v2}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    goto :goto_18

    .line 173
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_52
    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v3

    if-eqz v3, :cond_69

    instance-of v3, v2, Lfreemarker/ext/beans/BeanModel;

    if-eqz v3, :cond_69

    .line 174
    new-instance v3, Lfreemarker/template/SimpleScalar;

    check-cast v2, Lfreemarker/ext/beans/BeanModel;

    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    invoke-static {v2}, Lfreemarker/ext/beans/_BeansAPI;->getAsClassicCompatibleString(Lfreemarker/ext/beans/BeanModel;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    goto :goto_18

    .line 176
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_69
    new-instance v3, Lfreemarker/core/UnexpectedTypeException;

    iget-object v4, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI;->target:Lfreemarker/core/Expression;

    const-string v5, "number, date, or string"

    invoke-direct {v3, v4, v2, v5, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v3
.end method
