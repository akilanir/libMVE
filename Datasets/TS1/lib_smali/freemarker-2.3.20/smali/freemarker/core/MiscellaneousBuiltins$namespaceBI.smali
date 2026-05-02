.class Lfreemarker/core/MiscellaneousBuiltins$namespaceBI;
.super Lfreemarker/core/BuiltIn;
.source "MiscellaneousBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "namespaceBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 443
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 445
    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$namespaceBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 446
    .local v0, "tm":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/core/Macro;

    if-nez v1, :cond_14

    .line 447
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$namespaceBI;->target:Lfreemarker/core/Expression;

    const-string v3, "macro or function"

    invoke-direct {v1, v2, v0, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1

    .line 449
    :cond_14
    check-cast v0, Lfreemarker/core/Macro;

    .end local v0    # "tm":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->getMacroNamespace(Lfreemarker/core/Macro;)Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    return-object v1
.end method
