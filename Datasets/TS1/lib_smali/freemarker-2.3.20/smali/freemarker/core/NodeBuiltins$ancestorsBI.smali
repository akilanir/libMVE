.class Lfreemarker/core/NodeBuiltins$ancestorsBI;
.super Lfreemarker/core/NodeBuiltins$NodeBuiltIn;
.source "NodeBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NodeBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ancestorsBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/NodeBuiltins$NodeBuiltIn;-><init>(Lfreemarker/core/NodeBuiltins$1;)V

    return-void
.end method


# virtual methods
.method calculateResult(Lfreemarker/template/TemplateNodeModel;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "nodeModel"    # Lfreemarker/template/TemplateNodeModel;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v1, Lfreemarker/core/NodeBuiltins$AncestorSequence;

    invoke-direct {v1, p2}, Lfreemarker/core/NodeBuiltins$AncestorSequence;-><init>(Lfreemarker/core/Environment;)V

    .line 92
    .local v1, "result":Lfreemarker/core/NodeBuiltins$AncestorSequence;
    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getParentNode()Lfreemarker/template/TemplateNodeModel;

    move-result-object v0

    .line 93
    .local v0, "parent":Lfreemarker/template/TemplateNodeModel;
    :goto_9
    if-eqz v0, :cond_13

    .line 94
    invoke-virtual {v1, v0}, Lfreemarker/core/NodeBuiltins$AncestorSequence;->add(Ljava/lang/Object;)V

    .line 95
    invoke-interface {v0}, Lfreemarker/template/TemplateNodeModel;->getParentNode()Lfreemarker/template/TemplateNodeModel;

    move-result-object v0

    goto :goto_9

    .line 97
    :cond_13
    return-object v1
.end method
