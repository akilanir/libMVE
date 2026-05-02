.class Lfreemarker/core/NodeBuiltins$rootBI;
.super Lfreemarker/core/NodeBuiltins$NodeBuiltIn;
.source "NodeBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NodeBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "rootBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 126
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
    .line 128
    move-object v1, p1

    .line 129
    .local v1, "result":Lfreemarker/template/TemplateNodeModel;
    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getParentNode()Lfreemarker/template/TemplateNodeModel;

    move-result-object v0

    .line 130
    .local v0, "parent":Lfreemarker/template/TemplateNodeModel;
    :goto_5
    if-eqz v0, :cond_d

    .line 131
    move-object v1, v0

    .line 132
    invoke-interface {v1}, Lfreemarker/template/TemplateNodeModel;->getParentNode()Lfreemarker/template/TemplateNodeModel;

    move-result-object v0

    goto :goto_5

    .line 134
    :cond_d
    return-object v1
.end method
