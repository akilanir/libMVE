.class Lfreemarker/core/Environment$3;
.super Ljava/lang/Object;
.source "Environment.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# instance fields
.field private final this$0:Lfreemarker/core/Environment;


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;)V
    .registers 2

    .prologue
    .line 1466
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Environment$3;->this$0:Lfreemarker/core/Environment;

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1472
    iget-object v1, p0, Lfreemarker/core/Environment$3;->this$0:Lfreemarker/core/Environment;

    invoke-static {v1}, Lfreemarker/core/Environment;->access$100(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateHashModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1473
    .local v0, "value":Lfreemarker/template/TemplateModel;
    if-nez v0, :cond_16

    .line 1474
    iget-object v1, p0, Lfreemarker/core/Environment$3;->this$0:Lfreemarker/core/Environment;

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v1

    invoke-virtual {v1, p1}, Lfreemarker/template/Configuration;->getSharedVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1476
    :cond_16
    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 1468
    const/4 v0, 0x0

    return v0
.end method
