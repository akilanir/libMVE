.class Lfreemarker/core/ExistenceBuiltins$existsBI;
.super Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;
.source "ExistenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/ExistenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "existsBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;-><init>(Lfreemarker/core/ExistenceBuiltins$1;)V

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
    .line 80
    invoke-virtual {p0, p1}, Lfreemarker/core/ExistenceBuiltins$existsBI;->evalMaybeNonexistentTarget(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    if-nez v0, :cond_9

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    :goto_8
    return-object v0

    :cond_9
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_8
.end method

.method evalToBoolean(Lfreemarker/core/Environment;)Z
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Lfreemarker/core/ExistenceBuiltins$existsBI;->_eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    sget-object v1, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
