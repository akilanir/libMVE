.class Lfreemarker/core/ExistenceBuiltins$if_existsBI;
.super Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;
.source "ExistenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/ExistenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "if_existsBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 100
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
    .line 104
    invoke-virtual {p0, p1}, Lfreemarker/core/ExistenceBuiltins$if_existsBI;->evalMaybeNonexistentTarget(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 105
    .local v0, "model":Lfreemarker/template/TemplateModel;
    if-nez v0, :cond_8

    sget-object v0, Lfreemarker/template/TemplateModel;->NOTHING:Lfreemarker/template/TemplateModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_8
    return-object v0
.end method
