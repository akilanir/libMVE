.class Lfreemarker/ext/dom/XalanXPathSupport;
.super Ljava/lang/Object;
.source "XalanXPathSupport.java"

# interfaces
.implements Lfreemarker/ext/dom/XPathSupport;


# static fields
.field private static final ERRMSG_EMPTY_NODE_SET:Ljava/lang/String; = "Cannot perform an XPath query against an empty node set."

.field private static customPrefixResolver:Lorg/apache/xml/utils/PrefixResolver;


# instance fields
.field private xpathContext:Lorg/apache/xpath/XPathContext;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 154
    new-instance v0, Lfreemarker/ext/dom/XalanXPathSupport$1;

    invoke-direct {v0}, Lfreemarker/ext/dom/XalanXPathSupport$1;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/XalanXPathSupport;->customPrefixResolver:Lorg/apache/xml/utils/PrefixResolver;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Lorg/apache/xpath/XPathContext;

    invoke-direct {v0}, Lorg/apache/xpath/XPathContext;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/dom/XalanXPathSupport;->xpathContext:Lorg/apache/xpath/XPathContext;

    return-void
.end method

.method private static isNodeList(Ljava/lang/Object;)Z
    .registers 6
    .param p0, "context"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 180
    instance-of v4, p0, Ljava/util/List;

    if-eqz v4, :cond_17

    move-object v2, p0

    .line 181
    check-cast v2, Ljava/util/List;

    .line 182
    .local v2, "ls":Ljava/util/List;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 183
    .local v1, "ln":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-ge v0, v1, :cond_1b

    .line 184
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Lorg/w3c/dom/Node;

    if-nez v4, :cond_18

    .line 190
    .end local v0    # "i":I
    .end local v1    # "ln":I
    .end local v2    # "ls":Ljava/util/List;
    :cond_17
    :goto_17
    return v3

    .line 183
    .restart local v0    # "i":I
    .restart local v1    # "ln":I
    .restart local v2    # "ls":Ljava/util/List;
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 188
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
    .line 98
    monitor-enter p0

    :try_start_1
    move-object/from16 v0, p1

    instance-of v2, v0, Lorg/w3c/dom/Node;

    if-nez v2, :cond_70

    .line 99
    if-eqz p1, :cond_68

    .line 100
    invoke-static/range {p1 .. p1}, Lfreemarker/ext/dom/XalanXPathSupport;->isNodeList(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_41

    .line 101
    check-cast p1, Ljava/util/List;

    .end local p1    # "context":Ljava/lang/Object;
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v7

    .line 102
    .local v7, "cnt":I
    if-eqz v7, :cond_39

    .line 103
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Cannot perform an XPath query against a node set of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " nodes. Expecting a single node."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_36
    .catchall {:try_start_1 .. :try_end_36} :catchall_36

    .line 98
    .end local v7    # "cnt":I
    :catchall_36
    move-exception v2

    monitor-exit p0

    throw v2

    .line 107
    .restart local v7    # "cnt":I
    :cond_39
    :try_start_39
    new-instance v2, Lfreemarker/template/TemplateModelException;

    const-string v3, "Cannot perform an XPath query against an empty node set."

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 110
    .end local v7    # "cnt":I
    .restart local p1    # "context":Ljava/lang/Object;
    :cond_41
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Cannot perform an XPath query against a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ". Expecting a single org.w3c.dom.Node."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 115
    :cond_68
    new-instance v2, Lfreemarker/template/TemplateModelException;

    const-string v3, "Cannot perform an XPath query against an empty node set."

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 118
    :cond_70
    move-object/from16 v0, p1

    check-cast v0, Lorg/w3c/dom/Node;

    move-object v10, v0
    :try_end_75
    .catchall {:try_start_39 .. :try_end_75} :catchall_36

    .line 120
    .local v10, "node":Lorg/w3c/dom/Node;
    :try_start_75
    new-instance v1, Lorg/apache/xpath/XPath;

    const/4 v3, 0x0

    sget-object v4, Lfreemarker/ext/dom/XalanXPathSupport;->customPrefixResolver:Lorg/apache/xml/utils/PrefixResolver;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v2, p2

    invoke-direct/range {v1 .. v6}, Lorg/apache/xpath/XPath;-><init>(Ljava/lang/String;Ljavax/xml/transform/SourceLocator;Lorg/apache/xml/utils/PrefixResolver;ILjavax/xml/transform/ErrorListener;)V

    .line 121
    .local v1, "xpath":Lorg/apache/xpath/XPath;
    iget-object v2, p0, Lfreemarker/ext/dom/XalanXPathSupport;->xpathContext:Lorg/apache/xpath/XPathContext;

    invoke-virtual {v2, v10}, Lorg/apache/xpath/XPathContext;->getDTMHandleFromNode(Lorg/w3c/dom/Node;)I

    move-result v8

    .line 122
    .local v8, "ctxtNode":I
    iget-object v2, p0, Lfreemarker/ext/dom/XalanXPathSupport;->xpathContext:Lorg/apache/xpath/XPathContext;

    sget-object v3, Lfreemarker/ext/dom/XalanXPathSupport;->customPrefixResolver:Lorg/apache/xml/utils/PrefixResolver;

    invoke-virtual {v1, v2, v8, v3}, Lorg/apache/xpath/XPath;->execute(Lorg/apache/xpath/XPathContext;ILorg/apache/xml/utils/PrefixResolver;)Lorg/apache/xpath/objects/XObject;

    move-result-object v14

    .line 123
    .local v14, "xresult":Lorg/apache/xpath/objects/XObject;
    instance-of v2, v14, Lorg/apache/xpath/objects/XNodeSet;

    if-eqz v2, :cond_b7

    .line 124
    new-instance v12, Lfreemarker/ext/dom/NodeListModel;

    invoke-direct {v12, v10}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lorg/w3c/dom/Node;)V

    .line 125
    .local v12, "result":Lfreemarker/ext/dom/NodeListModel;
    iput-object p0, v12, Lfreemarker/ext/dom/NodeListModel;->xpathSupport:Lfreemarker/ext/dom/XPathSupport;

    .line 126
    invoke-virtual {v14}, Lorg/apache/xpath/objects/XObject;->nodeset()Lorg/w3c/dom/traversal/NodeIterator;

    move-result-object v11

    .line 129
    .local v11, "nodeIterator":Lorg/w3c/dom/traversal/NodeIterator;
    :cond_9e
    invoke-interface {v11}, Lorg/w3c/dom/traversal/NodeIterator;->nextNode()Lorg/w3c/dom/Node;

    move-result-object v9

    .line 130
    .local v9, "n":Lorg/w3c/dom/Node;
    if-eqz v9, :cond_a7

    .line 131
    invoke-virtual {v12, v9}, Lfreemarker/ext/dom/NodeListModel;->add(Ljava/lang/Object;)V

    .line 133
    :cond_a7
    if-nez v9, :cond_9e

    .line 134
    invoke-virtual {v12}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_b5

    const/4 v2, 0x0

    invoke-virtual {v12, v2}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;
    :try_end_b4
    .catch Ljavax/xml/transform/TransformerException; {:try_start_75 .. :try_end_b4} :catch_de
    .catchall {:try_start_75 .. :try_end_b4} :catchall_36

    move-result-object v12

    .line 146
    .end local v9    # "n":Lorg/w3c/dom/Node;
    .end local v11    # "nodeIterator":Lorg/w3c/dom/traversal/NodeIterator;
    .end local v12    # "result":Lfreemarker/ext/dom/NodeListModel;
    .end local v14    # "xresult":Lorg/apache/xpath/objects/XObject;
    :cond_b5
    :goto_b5
    monitor-exit p0

    return-object v12

    .line 136
    .restart local v14    # "xresult":Lorg/apache/xpath/objects/XObject;
    :cond_b7
    :try_start_b7
    instance-of v2, v14, Lorg/apache/xpath/objects/XBoolean;

    if-eqz v2, :cond_ca

    .line 137
    check-cast v14, Lorg/apache/xpath/objects/XBoolean;

    .end local v14    # "xresult":Lorg/apache/xpath/objects/XObject;
    invoke-virtual {v14}, Lorg/apache/xpath/objects/XBoolean;->bool()Z

    move-result v2

    if-eqz v2, :cond_c7

    sget-object v2, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_c5
    move-object v12, v2

    goto :goto_b5

    :cond_c7
    sget-object v2, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_c5

    .line 139
    .restart local v14    # "xresult":Lorg/apache/xpath/objects/XObject;
    :cond_ca
    instance-of v2, v14, Lorg/apache/xpath/objects/XNull;

    if-eqz v2, :cond_d0

    .line 140
    const/4 v12, 0x0

    goto :goto_b5

    .line 142
    :cond_d0
    instance-of v2, v14, Lorg/apache/xpath/objects/XString;

    if-eqz v2, :cond_e5

    .line 143
    new-instance v12, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v14}, Lorg/apache/xpath/objects/XObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v12, v2}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V
    :try_end_dd
    .catch Ljavax/xml/transform/TransformerException; {:try_start_b7 .. :try_end_dd} :catch_de
    .catchall {:try_start_b7 .. :try_end_dd} :catchall_36

    goto :goto_b5

    .line 149
    .end local v1    # "xpath":Lorg/apache/xpath/XPath;
    .end local v8    # "ctxtNode":I
    .end local v14    # "xresult":Lorg/apache/xpath/objects/XObject;
    :catch_de
    move-exception v13

    .line 150
    .local v13, "te":Ljavax/xml/transform/TransformerException;
    :try_start_df
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v13}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2
    :try_end_e5
    .catchall {:try_start_df .. :try_end_e5} :catchall_36

    .line 145
    .end local v13    # "te":Ljavax/xml/transform/TransformerException;
    .restart local v1    # "xpath":Lorg/apache/xpath/XPath;
    .restart local v8    # "ctxtNode":I
    .restart local v14    # "xresult":Lorg/apache/xpath/objects/XObject;
    :cond_e5
    :try_start_e5
    instance-of v2, v14, Lorg/apache/xpath/objects/XNumber;

    if-eqz v2, :cond_fa

    .line 146
    new-instance v12, Lfreemarker/template/SimpleNumber;

    new-instance v2, Ljava/lang/Double;

    check-cast v14, Lorg/apache/xpath/objects/XNumber;

    .end local v14    # "xresult":Lorg/apache/xpath/objects/XObject;
    invoke-virtual {v14}, Lorg/apache/xpath/objects/XNumber;->num()D

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/lang/Double;-><init>(D)V

    invoke-direct {v12, v2}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto :goto_b5

    .line 148
    .restart local v14    # "xresult":Lorg/apache/xpath/objects/XObject;
    :cond_fa
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Cannot deal with type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_11b
    .catch Ljavax/xml/transform/TransformerException; {:try_start_e5 .. :try_end_11b} :catch_de
    .catchall {:try_start_e5 .. :try_end_11b} :catchall_36
.end method
