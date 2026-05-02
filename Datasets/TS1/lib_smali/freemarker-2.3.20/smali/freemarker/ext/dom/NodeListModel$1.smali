.class final Lfreemarker/ext/dom/NodeListModel$1;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/ObjectWrapper;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 80
    instance-of v0, p1, Lfreemarker/ext/dom/NodeModel;

    if-eqz v0, :cond_7

    .line 81
    check-cast p1, Lfreemarker/ext/dom/NodeModel;

    .line 83
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p1

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_7
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object p1

    goto :goto_6
.end method
