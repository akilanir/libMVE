.class Lfreemarker/core/MiscellaneousBuiltins$is_directiveBI;
.super Lfreemarker/core/BuiltIn;
.source "MiscellaneousBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "is_directiveBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 433
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 435
    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$is_directiveBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 436
    .local v0, "tm":Lfreemarker/template/TemplateModel;
    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$is_directiveBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, v0, p1}, Lfreemarker/core/Expression;->assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    .line 438
    instance-of v1, v0, Lfreemarker/template/TemplateTransformModel;

    if-nez v1, :cond_17

    instance-of v1, v0, Lfreemarker/core/Macro;

    if-nez v1, :cond_17

    instance-of v1, v0, Lfreemarker/template/TemplateDirectiveModel;

    if-eqz v1, :cond_1a

    :cond_17
    sget-object v1, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_19
    return-object v1

    :cond_1a
    sget-object v1, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_19
.end method
