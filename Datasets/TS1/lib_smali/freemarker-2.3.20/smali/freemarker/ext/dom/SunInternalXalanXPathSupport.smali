.class Lfreemarker/ext/dom/SunInternalXalanXPathSupport;
.super Ljava/lang/Object;
.source "SunInternalXalanXPathSupport.java"

# interfaces
.implements Lfreemarker/ext/dom/XPathSupport;


# static fields
.field private static final ERRMSG_EMPTY_NODE_SET:Ljava/lang/String; = "Cannot perform an XPath query against an empty node set.(Note that there is no such restriction if you configure FreeMarker to use Jaxen instead of Xalan.)"

.field private static final ERRMSG_RECOMMEND_JAXEN:Ljava/lang/String; = "(Note that there is no such restriction if you configure FreeMarker to use Jaxen instead of Xalan.)"

.field private static customPrefixResolver:Lcom/sun/org/apache/xml/internal/utils/PrefixResolver;


# instance fields
.field private xpathContext:Lcom/sun/org/apache/xpath/internal/XPathContext;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 139
    new-instance v0, Lfreemarker/ext/dom/SunInternalXalanXPathSupport$1;

    invoke-direct {v0}, Lfreemarker/ext/dom/SunInternalXalanXPathSupport$1;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/SunInternalXalanXPathSupport;->customPrefixResolver:Lcom/sun/org/apache/xml/internal/utils/PrefixResolver;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Lcom/sun/org/apache/xpath/internal/XPathContext;

    invoke-direct {v0}, Lcom/sun/org/apache/xpath/internal/XPathContext;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/dom/SunInternalXalanXPathSupport;->xpathContext:Lcom/sun/org/apache/xpath/internal/XPathContext;

    return-void
.end method

.method private static isNodeList(Ljava/lang/Object;)Z
    .registers 6
    .param p0, "context"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 165
    instance-of v4, p0, Ljava/util/List;

    if-eqz v4, :cond_17

    move-object v2, p0

    .line 166
    check-cast v2, Ljava/util/List;

    .line 167
    .local v2, "ls":Ljava/util/List;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 168
    .local v1, "ln":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v1, :cond_1b

    .line 169
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Lorg/w3c/dom/Node;

    if-nez v4, :cond_18

    .line 175
    .end local v0    # "i":I
    .end local v1    # "ln":I
    .end local v2    # "ls":Ljava/util/List;
    :cond_17
    :goto_17
    return v3

    .line 168
    .restart local v0    # "i":I
    .restart local v1    # "ln":I
    .restart local v2    # "ls":Ljava/util/List;
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 173
    :cond_1b
    const/4 v3, 0x1

    goto :goto_17
.end method


# virtual methods
.method public declared-synchronized executeQuery(Ljava/lang/Object;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 18
    .param p1, "context"    # Ljava/lang/Object;
    .param p2, "xpathQuery"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 83
    monitor-enter p0

    :try_start_1
    move-object/from16 v0, p1

    instance-of v2, v0, Lorg/w3c/dom/Node;

    if-nez v2, :cond_76

    .line 84
    if-eqz p1, :cond_6e

    .line 85
    invoke-static/range {p1 .. p1}, Lfreemarker/ext/dom/SunInternalXalanXPathSupport;->isNodeList(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_47

    .line 86
    check-cast p1, Ljava/util/List;

    .end local p1    # "context":Ljava/lang/Object;
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v7

    .line 87
    .local v7, "cnt":I
    if-eqz v7, :cond_3f

    .line 88
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot perform an XPath query against a node set of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " nodes. Expecting a single node."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "(Note that there is no such restriction if you configure FreeMarker to use Jaxen instead of Xalan.)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_3c
    .catchall {:try_start_1 .. :try_end_3c} :catchall_3c

    .line 83
    .end local v7    # "cnt":I
    :catchall_3c
    move-exception v2

    monitor-exit p0

    throw v2

    .line 92
    .restart local v7    # "cnt":I
    :cond_3f
    :try_start_3f
    new-instance v2, Lfreemarker/template/TemplateModelException;

    const-string v3, "Cannot perform an XPath query against an empty node set.(Note that there is no such restriction if you configure FreeMarker to use Jaxen instead of Xalan.)"

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 95
    .end local v7    # "cnt":I
    .restart local p1    # "context":Ljava/lang/Object;
    :cond_47
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot perform an XPath query against a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". Expecting a single org.w3c.dom.Node."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 100
    :cond_6e
    new-instance v2, Lfreemarker/template/TemplateModelException;

    const-string v3, "Cannot perform an XPath query against an empty node set.(Note that there is no such restriction if you configure FreeMarker to use Jaxen instead of Xalan.)"

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 103
    :cond_76
    move-object/from16 v0, p1

    check-cast v0, Lorg/w3c/dom/Node;

    move-object v10, v0
    :try_end_7b
    .catchall {:try_start_3f .. :try_end_7b} :catchall_3c

    .line 105
    .local v10, "node":Lorg/w3c/dom/Node;
    :try_start_7b
    new-instance v1, Lcom/sun/org/apache/xpath/internal/XPath;

    const/4 v3, 0x0

    sget-object v4, Lfreemarker/ext/dom/SunInternalXalanXPathSupport;->customPrefixResolver:Lcom/sun/org/apache/xml/internal/utils/PrefixResolver;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v2, p2

    invoke-direct/range {v1 .. v6}, Lcom/sun/org/apache/xpath/internal/XPath;-><init>(Ljava/lang/String;Ljavax/xml/transform/SourceLocator;Lcom/sun/org/apache/xml/internal/utils/PrefixResolver;ILjavax/xml/transform/ErrorListener;)V

    .line 106
    .local v1, "xpath":Lcom/sun/org/apache/xpath/internal/XPath;
    iget-object v2, p0, Lfreemarker/ext/dom/SunInternalXalanXPathSupport;->xpathContext:Lcom/sun/org/apache/xpath/internal/XPathContext;

    invoke-virtual {v2, v10}, Lcom/sun/org/apache/xpath/internal/XPathContext;->getDTMHandleFromNode(Lorg/w3c/dom/Node;)I

    move-result v8

    .line 107
    .local v8, "ctxtNode":I
    iget-object v2, p0, Lfreemarker/ext/dom/SunInternalXalanXPathSupport;->xpathContext:Lcom/sun/org/apache/xpath/internal/XPathContext;

    sget-object v3, Lfreemarker/ext/dom/SunInternalXalanXPathSupport;->customPrefixResolver:Lcom/sun/org/apache/xml/internal/utils/PrefixResolver;

    invoke-virtual {v1, v2, v8, v3}, Lcom/sun/org/apache/xpath/internal/XPath;->execute(Lcom/sun/org/apache/xpath/internal/XPathContext;ILcom/sun/org/apache/xml/internal/utils/PrefixResolver;)Lcom/sun/org/apache/xpath/internal/objects/XObject;

    move-result-object v14

    .line 108
    .local v14, "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    instance-of v2, v14, Lcom/sun/org/apache/xpath/internal/objects/XNodeSet;

    if-eqz v2, :cond_bd

    .line 109
    new-instance v12, Lfreemarker/ext/dom/NodeListModel;

    invoke-direct {v12, v10}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lorg/w3c/dom/Node;)V

    .line 110
    .local v12, "result":Lfreemarker/ext/dom/NodeListModel;
    iput-object p0, v12, Lfreemarker/ext/dom/NodeListModel;->xpathSupport:Lfreemarker/ext/dom/XPathSupport;

    .line 111
    invoke-virtual {v14}, Lcom/sun/org/apache/xpath/internal/objects/XObject;->nodeset()Lorg/w3c/dom/traversal/NodeIterator;

    move-result-object v11

    .line 114
    .local v11, "nodeIterator":Lorg/w3c/dom/traversal/NodeIterator;
    :cond_a4
    invoke-interface {v11}, Lorg/w3c/dom/traversal/NodeIterator;->nextNode()Lorg/w3c/dom/Node;

    move-result-object v9

    .line 115
    .local v9, "n":Lorg/w3c/dom/Node;
    if-eqz v9, :cond_ad

    .line 116
    invoke-virtual {v12, v9}, Lfreemarker/ext/dom/NodeListModel;->add(Ljava/lang/Object;)V

    .line 118
    :cond_ad
    if-nez v9, :cond_a4

    .line 119
    invoke-virtual {v12}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_bb

    const/4 v2, 0x0

    invoke-virtual {v12, v2}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;
    :try_end_ba
    .catch Ljavax/xml/transform/TransformerException; {:try_start_7b .. :try_end_ba} :catch_e4
    .catchall {:try_start_7b .. :try_end_ba} :catchall_3c

    move-result-object v12

    .line 131
    .end local v9    # "n":Lorg/w3c/dom/Node;
    .end local v11    # "nodeIterator":Lorg/w3c/dom/traversal/NodeIterator;
    .end local v12    # "result":Lfreemarker/ext/dom/NodeListModel;
    .end local v14    # "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    :cond_bb
    :goto_bb
    monitor-exit p0

    return-object v12

    .line 121
    .restart local v14    # "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    :cond_bd
    :try_start_bd
    instance-of v2, v14, Lcom/sun/org/apache/xpath/internal/objects/XBoolean;

    if-eqz v2, :cond_d0

    .line 122
    check-cast v14, Lcom/sun/org/apache/xpath/internal/objects/XBoolean;

    .end local v14    # "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    invoke-virtual {v14}, Lcom/sun/org/apache/xpath/internal/objects/XBoolean;->bool()Z

    move-result v2

    if-eqz v2, :cond_cd

    sget-object v2, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_cb
    move-object v12, v2

    goto :goto_bb

    :cond_cd
    sget-object v2, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_cb

    .line 124
    .restart local v14    # "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    :cond_d0
    instance-of v2, v14, Lcom/sun/org/apache/xpath/internal/objects/XNull;

    if-eqz v2, :cond_d6

    .line 125
    const/4 v12, 0x0

    goto :goto_bb

    .line 127
    :cond_d6
    instance-of v2, v14, Lcom/sun/org/apache/xpath/internal/objects/XString;

    if-eqz v2, :cond_eb

    .line 128
    new-instance v12, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v14}, Lcom/sun/org/apache/xpath/internal/objects/XObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v12, v2}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V
    :try_end_e3
    .catch Ljavax/xml/transform/TransformerException; {:try_start_bd .. :try_end_e3} :catch_e4
    .catchall {:try_start_bd .. :try_end_e3} :catchall_3c

    goto :goto_bb

    .line 134
    .end local v1    # "xpath":Lcom/sun/org/apache/xpath/internal/XPath;
    .end local v8    # "ctxtNode":I
    .end local v14    # "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    :catch_e4
    move-exception v13

    .line 135
    .local v13, "te":Ljavax/xml/transform/TransformerException;
    :try_start_e5
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v13}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2
    :try_end_eb
    .catchall {:try_start_e5 .. :try_end_eb} :catchall_3c

    .line 130
    .end local v13    # "te":Ljavax/xml/transform/TransformerException;
    .restart local v1    # "xpath":Lcom/sun/org/apache/xpath/internal/XPath;
    .restart local v8    # "ctxtNode":I
    .restart local v14    # "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    :cond_eb
    :try_start_eb
    instance-of v2, v14, Lcom/sun/org/apache/xpath/internal/objects/XNumber;

    if-eqz v2, :cond_100

    .line 131
    new-instance v12, Lfreemarker/template/SimpleNumber;

    new-instance v2, Ljava/lang/Double;

    check-cast v14, Lcom/sun/org/apache/xpath/internal/objects/XNumber;

    .end local v14    # "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    invoke-virtual {v14}, Lcom/sun/org/apache/xpath/internal/objects/XNumber;->num()D

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/lang/Double;-><init>(D)V

    invoke-direct {v12, v2}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto :goto_bb

    .line 133
    .restart local v14    # "xresult":Lcom/sun/org/apache/xpath/internal/objects/XObject;
    :cond_100
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot deal with type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_121
    .catch Ljavax/xml/transform/TransformerException; {:try_start_eb .. :try_end_121} :catch_e4
    .catchall {:try_start_eb .. :try_end_121} :catchall_3c
.end method
