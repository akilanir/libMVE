.class Lfreemarker/ext/dom/AttributeNodeModel;
.super Lfreemarker/ext/dom/NodeModel;
.source "AttributeNodeModel.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Attr;)V
    .registers 2
    .param p1, "att"    # Lorg/w3c/dom/Attr;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lfreemarker/ext/dom/NodeModel;-><init>(Lorg/w3c/dom/Node;)V

    .line 64
    return-void
.end method


# virtual methods
.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lfreemarker/ext/dom/AttributeNodeModel;->node:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Attr;

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNodeName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 71
    iget-object v1, p0, Lfreemarker/ext/dom/AttributeNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_10

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 73
    :cond_10
    iget-object v1, p0, Lfreemarker/ext/dom/AttributeNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 75
    :cond_16
    return-object v0
.end method

.method getQualifiedName()Ljava/lang/String;
    .registers 7

    .prologue
    .line 83
    iget-object v4, p0, Lfreemarker/ext/dom/AttributeNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 84
    .local v2, "nsURI":Ljava/lang/String;
    if-eqz v2, :cond_10

    const-string v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 85
    :cond_10
    iget-object v4, p0, Lfreemarker/ext/dom/AttributeNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    .line 97
    :goto_16
    return-object v4

    .line 86
    :cond_17
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v1

    .line 87
    .local v1, "env":Lfreemarker/core/Environment;
    invoke-virtual {v1}, Lfreemarker/core/Environment;->getDefaultNS()Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "defaultNS":Ljava/lang/String;
    const/4 v3, 0x0

    .line 89
    .local v3, "prefix":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 90
    const-string v3, "D"

    .line 94
    :goto_28
    if-nez v3, :cond_31

    .line 95
    const/4 v4, 0x0

    goto :goto_16

    .line 92
    :cond_2c
    invoke-virtual {v1, v2}, Lfreemarker/core/Environment;->getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_28

    .line 97
    :cond_31
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lfreemarker/ext/dom/AttributeNodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_16
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 79
    const/4 v0, 0x1

    return v0
.end method
