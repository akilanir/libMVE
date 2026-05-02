.class Lfreemarker/core/NodeBuiltins$childrenBI;
.super Lfreemarker/core/NodeBuiltins$NodeBuiltIn;
.source "NodeBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NodeBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "childrenBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/NodeBuiltins$NodeBuiltIn;-><init>(Lfreemarker/core/NodeBuiltins$1;)V

    return-void
.end method


# virtual methods
.method calculateResult(Lfreemarker/template/TemplateNodeModel;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "nodeModel"    # Lfreemarker/template/TemplateNodeModel;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getChildNodes()Lfreemarker/template/TemplateSequenceModel;

    move-result-object v0

    return-object v0
.end method
