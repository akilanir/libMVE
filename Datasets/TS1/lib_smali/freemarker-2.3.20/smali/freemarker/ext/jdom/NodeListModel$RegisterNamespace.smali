.class final Lfreemarker/ext/jdom/NodeListModel$RegisterNamespace;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RegisterNamespace"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/ext/jdom/NodeListModel;


# direct methods
.method private constructor <init>(Lfreemarker/ext/jdom/NodeListModel;)V
    .registers 2

    .prologue
    .line 1142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jdom/NodeListModel$RegisterNamespace;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel;Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel;
    .param p2, "x1"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 1142
    invoke-direct {p0, p1}, Lfreemarker/ext/jdom/NodeListModel$RegisterNamespace;-><init>(Lfreemarker/ext/jdom/NodeListModel;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 5
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1152
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_f

    .line 1153
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "_registerNamespace(prefix, uri) requires two arguments"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1155
    :cond_f
    iget-object v2, p0, Lfreemarker/ext/jdom/NodeListModel$RegisterNamespace;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lfreemarker/ext/jdom/NodeListModel;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 1157
    sget-object v0, Lfreemarker/template/TemplateScalarModel;->EMPTY_STRING:Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 1145
    const/4 v0, 0x0

    return v0
.end method
