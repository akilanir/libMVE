.class Lfreemarker/ext/jdom/NodeListModel$1;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/TemplateModelIterator;


# instance fields
.field private final it:Ljava/util/Iterator;

.field private final this$0:Lfreemarker/ext/jdom/NodeListModel;


# direct methods
.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel;)V
    .registers 3

    .prologue
    .line 540
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jdom/NodeListModel$1;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    .line 541
    iget-object v0, p0, Lfreemarker/ext/jdom/NodeListModel$1;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    invoke-static {v0}, Lfreemarker/ext/jdom/NodeListModel;->access$800(Lfreemarker/ext/jdom/NodeListModel;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/jdom/NodeListModel$1;->it:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 550
    iget-object v0, p0, Lfreemarker/ext/jdom/NodeListModel$1;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Lfreemarker/template/TemplateModel;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 545
    iget-object v0, p0, Lfreemarker/ext/jdom/NodeListModel$1;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1b

    new-instance v0, Lfreemarker/ext/jdom/NodeListModel;

    iget-object v2, p0, Lfreemarker/ext/jdom/NodeListModel$1;->it:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/ext/jdom/NodeListModel$1;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    invoke-static {v3}, Lfreemarker/ext/jdom/NodeListModel;->access$900(Lfreemarker/ext/jdom/NodeListModel;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {v0, v2, v3, v1}, Lfreemarker/ext/jdom/NodeListModel;-><init>(Ljava/lang/Object;Ljava/util/Map;Lfreemarker/ext/jdom/NodeListModel$1;)V

    :goto_1a
    return-object v0

    :cond_1b
    move-object v0, v1

    goto :goto_1a
.end method
