.class Lfreemarker/core/Environment$5;
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
    .line 1515
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Environment$5;->this$0:Lfreemarker/core/Environment;

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
    .line 1520
    iget-object v1, p0, Lfreemarker/core/Environment$5;->this$0:Lfreemarker/core/Environment;

    invoke-static {v1}, Lfreemarker/core/Environment;->access$200(Lfreemarker/core/Environment;)Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    invoke-virtual {v1, p1}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1521
    .local v0, "result":Lfreemarker/template/TemplateModel;
    if-nez v0, :cond_16

    .line 1522
    iget-object v1, p0, Lfreemarker/core/Environment$5;->this$0:Lfreemarker/core/Environment;

    invoke-static {v1}, Lfreemarker/core/Environment;->access$100(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateHashModel;

    move-result-object v1

    invoke-interface {v1, p1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1524
    :cond_16
    if-nez v0, :cond_22

    .line 1525
    iget-object v1, p0, Lfreemarker/core/Environment$5;->this$0:Lfreemarker/core/Environment;

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v1

    invoke-virtual {v1, p1}, Lfreemarker/template/Configuration;->getSharedVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1527
    :cond_22
    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 1517
    const/4 v0, 0x0

    return v0
.end method
