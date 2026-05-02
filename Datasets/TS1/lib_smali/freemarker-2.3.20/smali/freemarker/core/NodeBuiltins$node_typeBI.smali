.class Lfreemarker/core/NodeBuiltins$node_typeBI;
.super Lfreemarker/core/NodeBuiltins$NodeBuiltIn;
.source "NodeBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NodeBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "node_typeBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 114
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
    .line 116
    new-instance v0, Lfreemarker/template/SimpleScalar;

    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getNodeType()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
