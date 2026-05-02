.class abstract Lfreemarker/core/NodeBuiltins$NodeBuiltIn;
.super Lfreemarker/core/BuiltIn;
.source "NodeBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NodeBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "NodeBuiltIn"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 74
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/NodeBuiltins$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/NodeBuiltins$1;

    .prologue
    .line 74
    invoke-direct {p0}, Lfreemarker/core/NodeBuiltins$NodeBuiltIn;-><init>()V

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
    .line 78
    iget-object v1, p0, Lfreemarker/core/NodeBuiltins$NodeBuiltIn;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 79
    .local v0, "model":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/template/TemplateNodeModel;

    if-eqz v1, :cond_11

    .line 80
    check-cast v0, Lfreemarker/template/TemplateNodeModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0, v0, p1}, Lfreemarker/core/NodeBuiltins$NodeBuiltIn;->calculateResult(Lfreemarker/template/TemplateNodeModel;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    return-object v1

    .line 82
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_11
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/NodeBuiltins$NodeBuiltIn;->target:Lfreemarker/core/Expression;

    const-string v3, "node"

    invoke-direct {v1, v2, v0, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1
.end method

.method abstract calculateResult(Lfreemarker/template/TemplateNodeModel;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method
