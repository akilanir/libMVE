.class Lfreemarker/ext/dom/NodeListModel;
.super Lfreemarker/template/SimpleSequence;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# static fields
.field private static nodeWrapper:Lfreemarker/template/ObjectWrapper;


# instance fields
.field contextNode:Lfreemarker/ext/dom/NodeModel;

.field xpathSupport:Lfreemarker/ext/dom/XPathSupport;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 78
    new-instance v0, Lfreemarker/ext/dom/NodeListModel$1;

    invoke-direct {v0}, Lfreemarker/ext/dom/NodeListModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/NodeListModel;->nodeWrapper:Lfreemarker/template/ObjectWrapper;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/dom/NodeModel;)V
    .registers 3
    .param p1, "contextNode"    # Lfreemarker/ext/dom/NodeModel;

    .prologue
    .line 93
    sget-object v0, Lfreemarker/ext/dom/NodeListModel;->nodeWrapper:Lfreemarker/template/ObjectWrapper;

    invoke-direct {p0, v0}, Lfreemarker/template/SimpleSequence;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 94
    iput-object p1, p0, Lfreemarker/ext/dom/NodeListModel;->contextNode:Lfreemarker/ext/dom/NodeModel;

    .line 95
    return-void
.end method

.method constructor <init>(Ljava/util/List;Lfreemarker/ext/dom/NodeModel;)V
    .registers 4
    .param p1, "list"    # Ljava/util/List;
    .param p2, "contextNode"    # Lfreemarker/ext/dom/NodeModel;

    .prologue
    .line 114
    sget-object v0, Lfreemarker/ext/dom/NodeListModel;->nodeWrapper:Lfreemarker/template/ObjectWrapper;

    invoke-direct {p0, p1, v0}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    .line 115
    iput-object p2, p0, Lfreemarker/ext/dom/NodeListModel;->contextNode:Lfreemarker/ext/dom/NodeModel;

    .line 116
    return-void
.end method

.method constructor <init>(Lorg/w3c/dom/NamedNodeMap;Lfreemarker/ext/dom/NodeModel;)V
    .registers 6
    .param p1, "nodeList"    # Lorg/w3c/dom/NamedNodeMap;
    .param p2, "contextNode"    # Lfreemarker/ext/dom/NodeModel;

    .prologue
    .line 106
    sget-object v1, Lfreemarker/ext/dom/NodeListModel;->nodeWrapper:Lfreemarker/template/ObjectWrapper;

    invoke-direct {p0, v1}, Lfreemarker/template/SimpleSequence;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 107
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-interface {p1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_18

    .line 108
    iget-object v1, p0, Lfreemarker/ext/dom/NodeListModel;->list:Ljava/util/List;

    invoke-interface {p1, v0}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 110
    :cond_18
    iput-object p2, p0, Lfreemarker/ext/dom/NodeListModel;->contextNode:Lfreemarker/ext/dom/NodeModel;

    .line 111
    return-void
.end method

.method constructor <init>(Lorg/w3c/dom/Node;)V
    .registers 3
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 89
    invoke-static {p1}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v0

    invoke-direct {p0, v0}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lfreemarker/ext/dom/NodeModel;)V

    .line 90
    return-void
.end method

.method constructor <init>(Lorg/w3c/dom/NodeList;Lfreemarker/ext/dom/NodeModel;)V
    .registers 6
    .param p1, "nodeList"    # Lorg/w3c/dom/NodeList;
    .param p2, "contextNode"    # Lfreemarker/ext/dom/NodeModel;

    .prologue
    .line 98
    sget-object v1, Lfreemarker/ext/dom/NodeListModel;->nodeWrapper:Lfreemarker/template/ObjectWrapper;

    invoke-direct {p0, v1}, Lfreemarker/template/SimpleSequence;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 99
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_18

    .line 100
    iget-object v1, p0, Lfreemarker/ext/dom/NodeListModel;->list:Ljava/util/List;

    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 102
    :cond_18
    iput-object p2, p0, Lfreemarker/ext/dom/NodeListModel;->contextNode:Lfreemarker/ext/dom/NodeModel;

    .line 103
    return-void
.end method

.method private rawNodeList()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v2

    .line 191
    .local v2, "size":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 192
    .local v0, "al":Ljava/util/ArrayList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    if-ge v1, v2, :cond_1a

    .line 193
    invoke-virtual {p0, v1}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/dom/NodeModel;

    iget-object v3, v3, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 195
    :cond_1a
    return-object v0
.end method


# virtual methods
.method filterByName(Ljava/lang/String;)Lfreemarker/ext/dom/NodeListModel;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v3, Lfreemarker/ext/dom/NodeListModel;

    iget-object v5, p0, Lfreemarker/ext/dom/NodeListModel;->contextNode:Lfreemarker/ext/dom/NodeModel;

    invoke-direct {v3, v5}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lfreemarker/ext/dom/NodeModel;)V

    .line 120
    .local v3, "result":Lfreemarker/ext/dom/NodeListModel;
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v4

    .line 121
    .local v4, "size":I
    if-nez v4, :cond_e

    .line 133
    :cond_d
    return-object v3

    .line 124
    :cond_e
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    .line 125
    .local v0, "env":Lfreemarker/core/Environment;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    if-ge v1, v4, :cond_d

    .line 126
    invoke-virtual {p0, v1}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v2

    check-cast v2, Lfreemarker/ext/dom/NodeModel;

    .line 127
    .local v2, "nm":Lfreemarker/ext/dom/NodeModel;
    instance-of v5, v2, Lfreemarker/ext/dom/ElementModel;

    if-eqz v5, :cond_2b

    move-object v5, v2

    .line 128
    check-cast v5, Lfreemarker/ext/dom/ElementModel;

    invoke-virtual {v5, p1, v0}, Lfreemarker/ext/dom/ElementModel;->matchesName(Ljava/lang/String;Lfreemarker/core/Environment;)Z

    move-result v5

    if-eqz v5, :cond_2b

    .line 129
    invoke-virtual {v3, v2}, Lfreemarker/ext/dom/NodeListModel;->add(Ljava/lang/Object;)V

    .line 125
    :cond_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_13
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 14
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v9, 0x0

    .line 141
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v10

    if-ne v10, v11, :cond_13

    .line 142
    invoke-virtual {p0, v9}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/dom/NodeModel;

    .line 143
    .local v3, "nm":Lfreemarker/ext/dom/NodeModel;
    invoke-virtual {v3, p1}, Lfreemarker/ext/dom/NodeModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 180
    .end local v3    # "nm":Lfreemarker/ext/dom/NodeModel;
    :cond_12
    :goto_12
    return-object v4

    .line 145
    :cond_13
    const-string v10, "@@markup"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2b

    const-string v10, "@@nested_markup"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2b

    const-string v10, "@@text"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_58

    .line 149
    :cond_2b
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 150
    .local v4, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_31
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v9

    if-ge v1, v9, :cond_4d

    .line 151
    invoke-virtual {p0, v1}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/dom/NodeModel;

    .line 152
    .restart local v3    # "nm":Lfreemarker/ext/dom/NodeModel;
    invoke-virtual {v3, p1}, Lfreemarker/ext/dom/NodeModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateScalarModel;

    .line 153
    .local v6, "textModel":Lfreemarker/template/TemplateScalarModel;
    invoke-interface {v6}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 150
    add-int/lit8 v1, v1, 0x1

    goto :goto_31

    .line 155
    .end local v3    # "nm":Lfreemarker/ext/dom/NodeModel;
    .end local v6    # "textModel":Lfreemarker/template/TemplateScalarModel;
    :cond_4d
    new-instance v9, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    move-object v4, v9

    goto :goto_12

    .line 157
    .end local v1    # "i":I
    .end local v4    # "result":Ljava/lang/StringBuffer;
    :cond_58
    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->isXMLID(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_90

    const-string v10, "@"

    invoke-virtual {p1, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_70

    invoke-virtual {p1, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->isXMLID(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_90

    :cond_70
    const-string v10, "*"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_90

    const-string v10, "**"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_90

    const-string v10, "@@"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_90

    const-string v10, "@*"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_d4

    .line 161
    :cond_90
    new-instance v4, Lfreemarker/ext/dom/NodeListModel;

    iget-object v10, p0, Lfreemarker/ext/dom/NodeListModel;->contextNode:Lfreemarker/ext/dom/NodeModel;

    invoke-direct {v4, v10}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lfreemarker/ext/dom/NodeModel;)V

    .line 162
    .local v4, "result":Lfreemarker/ext/dom/NodeListModel;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_98
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v10

    if-ge v1, v10, :cond_c8

    .line 163
    invoke-virtual {p0, v1}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/dom/NodeModel;

    .line 164
    .restart local v3    # "nm":Lfreemarker/ext/dom/NodeModel;
    instance-of v10, v3, Lfreemarker/ext/dom/ElementModel;

    if-eqz v10, :cond_c5

    .line 165
    check-cast v3, Lfreemarker/ext/dom/ElementModel;

    .end local v3    # "nm":Lfreemarker/ext/dom/NodeModel;
    invoke-virtual {v3, p1}, Lfreemarker/ext/dom/ElementModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v7

    check-cast v7, Lfreemarker/template/TemplateSequenceModel;

    .line 166
    .local v7, "tsm":Lfreemarker/template/TemplateSequenceModel;
    if-nez v7, :cond_c0

    move v5, v9

    .line 167
    .local v5, "size":I
    :goto_b3
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_b4
    if-ge v2, v5, :cond_c5

    .line 168
    invoke-interface {v7, v2}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v10

    invoke-virtual {v4, v10}, Lfreemarker/ext/dom/NodeListModel;->add(Ljava/lang/Object;)V

    .line 167
    add-int/lit8 v2, v2, 0x1

    goto :goto_b4

    .line 166
    .end local v2    # "j":I
    .end local v5    # "size":I
    :cond_c0
    invoke-interface {v7}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v5

    goto :goto_b3

    .line 162
    .end local v7    # "tsm":Lfreemarker/template/TemplateSequenceModel;
    :cond_c5
    add-int/lit8 v1, v1, 0x1

    goto :goto_98

    .line 172
    :cond_c8
    invoke-virtual {v4}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v10

    if-ne v10, v11, :cond_12

    .line 173
    invoke-virtual {v4, v9}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v4

    goto/16 :goto_12

    .line 177
    .end local v1    # "i":I
    .end local v4    # "result":Lfreemarker/ext/dom/NodeListModel;
    :cond_d4
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->getXPathSupport()Lfreemarker/ext/dom/XPathSupport;

    move-result-object v8

    .line 178
    .local v8, "xps":Lfreemarker/ext/dom/XPathSupport;
    if-eqz v8, :cond_ec

    .line 179
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v9

    if-nez v9, :cond_e7

    const/4 v0, 0x0

    .line 180
    .local v0, "context":Ljava/util/List;
    :goto_e1
    invoke-interface {v8, v0, p1}, Lfreemarker/ext/dom/XPathSupport;->executeQuery(Ljava/lang/Object;Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    goto/16 :goto_12

    .line 179
    .end local v0    # "context":Ljava/util/List;
    :cond_e7
    invoke-direct {p0}, Lfreemarker/ext/dom/NodeListModel;->rawNodeList()Ljava/util/List;

    move-result-object v0

    goto :goto_e1

    .line 182
    :cond_ec
    new-instance v9, Lfreemarker/template/TemplateModelException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "Key: \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "\' is not legal for a node sequence ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "). This node sequence contains "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " node(s). "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "Some keys are valid only for node sequences of size 1. "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "If you use Xalan (instead of Jaxen), XPath expression keys work only with "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "node lists of size 1."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method getXPathSupport()Lfreemarker/ext/dom/XPathSupport;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lfreemarker/ext/dom/NodeListModel;->xpathSupport:Lfreemarker/ext/dom/XPathSupport;

    if-nez v0, :cond_10

    .line 200
    iget-object v0, p0, Lfreemarker/ext/dom/NodeListModel;->contextNode:Lfreemarker/ext/dom/NodeModel;

    if-eqz v0, :cond_13

    .line 201
    iget-object v0, p0, Lfreemarker/ext/dom/NodeListModel;->contextNode:Lfreemarker/ext/dom/NodeModel;

    invoke-virtual {v0}, Lfreemarker/ext/dom/NodeModel;->getXPathSupport()Lfreemarker/ext/dom/XPathSupport;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/dom/NodeListModel;->xpathSupport:Lfreemarker/ext/dom/XPathSupport;

    .line 207
    :cond_10
    :goto_10
    iget-object v0, p0, Lfreemarker/ext/dom/NodeListModel;->xpathSupport:Lfreemarker/ext/dom/XPathSupport;

    return-object v0

    .line 203
    :cond_13
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v0

    if-lez v0, :cond_10

    .line 204
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/dom/NodeModel;

    invoke-virtual {v0}, Lfreemarker/ext/dom/NodeModel;->getXPathSupport()Lfreemarker/ext/dom/XPathSupport;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/dom/NodeListModel;->xpathSupport:Lfreemarker/ext/dom/XPathSupport;

    goto :goto_10
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 137
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
