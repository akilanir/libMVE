.class Lfreemarker/ext/dom/DocumentModel;
.super Lfreemarker/ext/dom/NodeModel;
.source "DocumentModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# instance fields
.field private rootElement:Lfreemarker/ext/dom/ElementModel;


# direct methods
.method constructor <init>(Lorg/w3c/dom/Document;)V
    .registers 2
    .param p1, "doc"    # Lorg/w3c/dom/Document;

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lfreemarker/ext/dom/NodeModel;-><init>(Lorg/w3c/dom/Node;)V

    .line 75
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 82
    const-string v2, "*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 83
    invoke-virtual {p0}, Lfreemarker/ext/dom/DocumentModel;->getRootElement()Lfreemarker/ext/dom/ElementModel;

    move-result-object v0

    .line 97
    :cond_c
    :goto_c
    return-object v0

    .line 85
    :cond_d
    const-string v2, "**"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 86
    iget-object v2, p0, Lfreemarker/ext/dom/DocumentModel;->node:Lorg/w3c/dom/Node;

    check-cast v2, Lorg/w3c/dom/Document;

    const-string v3, "*"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 87
    .local v1, "nl":Lorg/w3c/dom/NodeList;
    new-instance v0, Lfreemarker/ext/dom/NodeListModel;

    invoke-direct {v0, v1, p0}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lorg/w3c/dom/NodeList;Lfreemarker/ext/dom/NodeModel;)V

    goto :goto_c

    .line 89
    .end local v1    # "nl":Lorg/w3c/dom/NodeList;
    :cond_25
    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->isXMLID(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_49

    .line 90
    iget-object v2, p0, Lfreemarker/ext/dom/DocumentModel;->node:Lorg/w3c/dom/Node;

    check-cast v2, Lorg/w3c/dom/Document;

    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/dom/ElementModel;

    .line 91
    .local v0, "em":Lfreemarker/ext/dom/ElementModel;
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Lfreemarker/ext/dom/ElementModel;->matchesName(Ljava/lang/String;Lfreemarker/core/Environment;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 94
    new-instance v0, Lfreemarker/ext/dom/NodeListModel;

    .end local v0    # "em":Lfreemarker/ext/dom/ElementModel;
    invoke-direct {v0, p0}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lfreemarker/ext/dom/NodeModel;)V

    goto :goto_c

    .line 97
    :cond_49
    invoke-super {p0, p1}, Lfreemarker/ext/dom/NodeModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_c
.end method

.method public getNodeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    const-string v0, "@document"

    return-object v0
.end method

.method getRootElement()Lfreemarker/ext/dom/ElementModel;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lfreemarker/ext/dom/DocumentModel;->rootElement:Lfreemarker/ext/dom/ElementModel;

    if-nez v0, :cond_14

    .line 102
    iget-object v0, p0, Lfreemarker/ext/dom/DocumentModel;->node:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Document;

    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/ext/dom/DocumentModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/dom/ElementModel;

    iput-object v0, p0, Lfreemarker/ext/dom/DocumentModel;->rootElement:Lfreemarker/ext/dom/ElementModel;

    .line 104
    :cond_14
    iget-object v0, p0, Lfreemarker/ext/dom/DocumentModel;->rootElement:Lfreemarker/ext/dom/ElementModel;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 108
    const/4 v0, 0x0

    return v0
.end method
