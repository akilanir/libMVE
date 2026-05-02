.class abstract Lfreemarker/core/BooleanExpression;
.super Lfreemarker/core/Expression;
.source "BooleanExpression.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-virtual {p0, p1}, Lfreemarker/core/BooleanExpression;->evalToBoolean(Lfreemarker/core/Environment;)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_8
    return-object v0

    :cond_9
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_8
.end method
