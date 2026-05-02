.class Lfreemarker/core/Environment$4;
.super Ljava/lang/Object;
.source "Environment.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# instance fields
.field private final this$0:Lfreemarker/core/Environment;

.field private final val$result:Lfreemarker/template/TemplateHashModel;


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;Lfreemarker/template/TemplateHashModel;)V
    .registers 3

    .prologue
    .line 1481
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/Environment$4;->this$0:Lfreemarker/core/Environment;

    iput-object p2, p0, Lfreemarker/core/Environment$4;->val$result:Lfreemarker/template/TemplateHashModel;

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1486
    iget-object v0, p0, Lfreemarker/core/Environment$4;->val$result:Lfreemarker/template/TemplateHashModel;

    invoke-interface {v0, p1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1483
    iget-object v0, p0, Lfreemarker/core/Environment$4;->val$result:Lfreemarker/template/TemplateHashModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateHashModel;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1496
    iget-object v0, p0, Lfreemarker/core/Environment$4;->this$0:Lfreemarker/core/Environment;

    invoke-static {v0}, Lfreemarker/core/Environment;->access$100(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateHashModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateHashModelEx;

    invoke-interface {v0}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1499
    iget-object v0, p0, Lfreemarker/core/Environment$4;->this$0:Lfreemarker/core/Environment;

    invoke-static {v0}, Lfreemarker/core/Environment;->access$100(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateHashModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateHashModelEx;

    invoke-interface {v0}, Lfreemarker/template/TemplateHashModelEx;->size()I

    move-result v0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1493
    iget-object v0, p0, Lfreemarker/core/Environment$4;->this$0:Lfreemarker/core/Environment;

    invoke-static {v0}, Lfreemarker/core/Environment;->access$100(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateHashModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateHashModelEx;

    invoke-interface {v0}, Lfreemarker/template/TemplateHashModelEx;->values()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    return-object v0
.end method
