.class Lfreemarker/core/MiscellaneousBuiltins$sizeBI;
.super Lfreemarker/core/BuiltIn;
.source "MiscellaneousBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "sizeBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 38
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
    .line 42
    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$sizeBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 43
    .local v0, "model":Lfreemarker/template/TemplateModel;
    instance-of v2, v0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v2, :cond_16

    .line 44
    check-cast v0, Lfreemarker/template/TemplateSequenceModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v1

    .line 45
    .local v1, "size":I
    new-instance v2, Lfreemarker/template/SimpleNumber;

    invoke-direct {v2, v1}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    .line 49
    :goto_15
    return-object v2

    .line 47
    .end local v1    # "size":I
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_16
    instance-of v2, v0, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v2, :cond_26

    .line 48
    check-cast v0, Lfreemarker/template/TemplateHashModelEx;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateHashModelEx;->size()I

    move-result v1

    .line 49
    .restart local v1    # "size":I
    new-instance v2, Lfreemarker/template/SimpleNumber;

    invoke-direct {v2, v1}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    goto :goto_15

    .line 51
    .end local v1    # "size":I
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_26
    new-instance v2, Lfreemarker/core/UnexpectedTypeException;

    iget-object v3, p0, Lfreemarker/core/MiscellaneousBuiltins$sizeBI;->target:Lfreemarker/core/Expression;

    const-string v4, "extended-hash or sequence"

    invoke-direct {v2, v3, v0, v4, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v2
.end method
