.class abstract Lfreemarker/ext/xml/Navigator;
.super Ljava/lang/Object;
.source "Navigator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/xml/Navigator$1;,
        Lfreemarker/ext/xml/Navigator$TypeOp;,
        Lfreemarker/ext/xml/Navigator$NamespaceUriOp;,
        Lfreemarker/ext/xml/Navigator$NamespacePrefixOp;,
        Lfreemarker/ext/xml/Navigator$QualifiedNameOp;,
        Lfreemarker/ext/xml/Navigator$LocalNameOp;,
        Lfreemarker/ext/xml/Navigator$TextOp;,
        Lfreemarker/ext/xml/Navigator$ContentOp;,
        Lfreemarker/ext/xml/Navigator$DocumentTypeOp;,
        Lfreemarker/ext/xml/Navigator$DocumentOp;,
        Lfreemarker/ext/xml/Navigator$ParentOp;,
        Lfreemarker/ext/xml/Navigator$AncestorOp;,
        Lfreemarker/ext/xml/Navigator$AncestorOrSelfOp;,
        Lfreemarker/ext/xml/Navigator$DescendantOp;,
        Lfreemarker/ext/xml/Navigator$DescendantOrSelfOp;,
        Lfreemarker/ext/xml/Navigator$AttributesOp;,
        Lfreemarker/ext/xml/Navigator$ChildrenOp;,
        Lfreemarker/ext/xml/Navigator$XPathEx;
    }
.end annotation


# instance fields
.field private final attributeOperator:Lfreemarker/ext/xml/NodeOperator;

.field private final childrenOperator:Lfreemarker/ext/xml/NodeOperator;

.field private final operators:Ljava/util/Map;

.field private final xpathCache:Ljava/util/Map;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/xml/Navigator;->xpathCache:Ljava/util/Map;

    .line 72
    invoke-direct {p0}, Lfreemarker/ext/xml/Navigator;->createOperatorMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/xml/Navigator;->operators:Ljava/util/Map;

    .line 73
    const-string v0, "_attributes"

    invoke-virtual {p0, v0}, Lfreemarker/ext/xml/Navigator;->getOperator(Ljava/lang/String;)Lfreemarker/ext/xml/NodeOperator;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/xml/Navigator;->attributeOperator:Lfreemarker/ext/xml/NodeOperator;

    .line 74
    const-string v0, "_children"

    invoke-virtual {p0, v0}, Lfreemarker/ext/xml/Navigator;->getOperator(Ljava/lang/String;)Lfreemarker/ext/xml/NodeOperator;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/xml/Navigator;->childrenOperator:Lfreemarker/ext/xml/NodeOperator;

    .line 331
    return-void
.end method

.method static access$1600(Lfreemarker/ext/xml/Navigator;Ljava/lang/Object;Ljava/util/List;)V
    .registers 3
    .param p0, "x0"    # Lfreemarker/ext/xml/Navigator;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Ljava/util/List;

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/xml/Navigator;->getAncestors(Ljava/lang/Object;Ljava/util/List;)V

    return-void
.end method

.method private createOperatorMap()Ljava/util/Map;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 178
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 179
    .local v0, "map":Ljava/util/Map;
    const-string v1, "_attributes"

    new-instance v2, Lfreemarker/ext/xml/Navigator$AttributesOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$AttributesOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    const-string v1, "@*"

    const-string v2, "_attributes"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    const-string v1, "_children"

    new-instance v2, Lfreemarker/ext/xml/Navigator$ChildrenOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$ChildrenOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    const-string v1, "*"

    const-string v2, "_children"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    const-string v1, "_descendantOrSelf"

    new-instance v2, Lfreemarker/ext/xml/Navigator$DescendantOrSelfOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$DescendantOrSelfOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    const-string v1, "_descendant"

    new-instance v2, Lfreemarker/ext/xml/Navigator$DescendantOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$DescendantOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    const-string v1, "_document"

    new-instance v2, Lfreemarker/ext/xml/Navigator$DocumentOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$DocumentOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    const-string v1, "_doctype"

    new-instance v2, Lfreemarker/ext/xml/Navigator$DocumentTypeOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$DocumentTypeOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    const-string v1, "_ancestor"

    new-instance v2, Lfreemarker/ext/xml/Navigator$AncestorOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$AncestorOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    const-string v1, "_ancestorOrSelf"

    new-instance v2, Lfreemarker/ext/xml/Navigator$AncestorOrSelfOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$AncestorOrSelfOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    const-string v1, "_content"

    new-instance v2, Lfreemarker/ext/xml/Navigator$ContentOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$ContentOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    const-string v1, "_name"

    new-instance v2, Lfreemarker/ext/xml/Navigator$LocalNameOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$LocalNameOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string v1, "_nsprefix"

    new-instance v2, Lfreemarker/ext/xml/Navigator$NamespacePrefixOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$NamespacePrefixOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string v1, "_nsuri"

    new-instance v2, Lfreemarker/ext/xml/Navigator$NamespaceUriOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$NamespaceUriOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const-string v1, "_parent"

    new-instance v2, Lfreemarker/ext/xml/Navigator$ParentOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$ParentOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    const-string v1, "_qname"

    new-instance v2, Lfreemarker/ext/xml/Navigator$QualifiedNameOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$QualifiedNameOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    const-string v1, "_text"

    new-instance v2, Lfreemarker/ext/xml/Navigator$TextOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$TextOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const-string v1, "_type"

    new-instance v2, Lfreemarker/ext/xml/Navigator$TypeOp;

    invoke-direct {v2, p0, v3}, Lfreemarker/ext/xml/Navigator$TypeOp;-><init>(Lfreemarker/ext/xml/Navigator;Lfreemarker/ext/xml/Navigator$1;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    return-object v0
.end method

.method private getAncestors(Ljava/lang/Object;Ljava/util/List;)V
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 138
    :goto_0
    invoke-virtual {p0, p1}, Lfreemarker/ext/xml/Navigator;->getParent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 139
    .local v0, "parent":Ljava/lang/Object;
    if-nez v0, :cond_7

    .line 145
    return-void

    .line 142
    :cond_7
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    move-object p1, v0

    .line 144
    goto :goto_0
.end method


# virtual methods
.method applyXPath(Ljava/util/List;Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;
    .registers 10
    .param p1, "nodes"    # Ljava/util/List;
    .param p2, "xpathString"    # Ljava/lang/String;
    .param p3, "namespaces"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v2, 0x0

    .line 99
    .local v2, "xpath":Lfreemarker/ext/xml/Navigator$XPathEx;
    :try_start_1
    iget-object v4, p0, Lfreemarker/ext/xml/Navigator;->xpathCache:Ljava/util/Map;

    monitor-enter v4
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_24

    .line 101
    :try_start_4
    iget-object v3, p0, Lfreemarker/ext/xml/Navigator;->xpathCache:Ljava/util/Map;

    invoke-interface {v3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lfreemarker/ext/xml/Navigator$XPathEx;

    move-object v2, v0

    .line 102
    if-nez v2, :cond_19

    .line 104
    invoke-virtual {p0, p2}, Lfreemarker/ext/xml/Navigator;->createXPathEx(Ljava/lang/String;)Lfreemarker/ext/xml/Navigator$XPathEx;

    move-result-object v2

    .line 105
    iget-object v3, p0, Lfreemarker/ext/xml/Navigator;->xpathCache:Ljava/util/Map;

    invoke-interface {v3, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    :cond_19
    monitor-exit v4
    :try_end_1a
    .catchall {:try_start_4 .. :try_end_1a} :catchall_21

    .line 108
    :try_start_1a
    check-cast p3, Lorg/jaxen/NamespaceContext;

    .end local p3    # "namespaces":Ljava/lang/Object;
    invoke-interface {v2, p1, p3}, Lfreemarker/ext/xml/Navigator$XPathEx;->selectNodes(Ljava/lang/Object;Lorg/jaxen/NamespaceContext;)Ljava/util/List;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1f} :catch_24

    move-result-object v3

    return-object v3

    .line 107
    .restart local p3    # "namespaces":Ljava/lang/Object;
    :catchall_21
    move-exception v3

    :try_start_22
    monitor-exit v4
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    :try_start_23
    throw v3
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_24} :catch_24

    .line 110
    .end local p3    # "namespaces":Ljava/lang/Object;
    :catch_24
    move-exception v1

    .line 112
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Lfreemarker/template/TemplateModelException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Could not evaulate XPath expression "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
.end method

.method abstract createXPathEx(Ljava/lang/String;)Lfreemarker/ext/xml/Navigator$XPathEx;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method

.method equal(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p1, "s1"    # Ljava/lang/String;
    .param p2, "s2"    # Ljava/lang/String;

    .prologue
    .line 174
    if-nez p1, :cond_8

    if-nez p2, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5

    :cond_8
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method abstract getAsString(Ljava/lang/Object;Ljava/io/StringWriter;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method

.method getAttributeOperator()Lfreemarker/ext/xml/NodeOperator;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lfreemarker/ext/xml/Navigator;->attributeOperator:Lfreemarker/ext/xml/NodeOperator;

    return-object v0
.end method

.method abstract getAttributes(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
.end method

.method abstract getChildren(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
.end method

.method getChildrenOperator()Lfreemarker/ext/xml/NodeOperator;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lfreemarker/ext/xml/Navigator;->childrenOperator:Lfreemarker/ext/xml/NodeOperator;

    return-object v0
.end method

.method abstract getContent(Ljava/lang/Object;Ljava/util/List;)V
.end method

.method abstract getDescendants(Ljava/lang/Object;Ljava/util/List;)V
.end method

.method abstract getDocument(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract getDocumentType(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract getLocalName(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method abstract getNamespacePrefix(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method abstract getNamespaceUri(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method getOperator(Ljava/lang/String;)Lfreemarker/ext/xml/NodeOperator;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-object v0, p0, Lfreemarker/ext/xml/Navigator;->operators:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/xml/NodeOperator;

    return-object v0
.end method

.method abstract getParent(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method getQualifiedName(Ljava/lang/Object;)Ljava/lang/String;
    .registers 6
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 156
    invoke-virtual {p0, p1}, Lfreemarker/ext/xml/Navigator;->getLocalName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "lname":Ljava/lang/String;
    if-nez v0, :cond_8

    .line 158
    const/4 v0, 0x0

    .line 165
    .end local v0    # "lname":Ljava/lang/String;
    :cond_7
    :goto_7
    return-object v0

    .line 160
    .restart local v0    # "lname":Ljava/lang/String;
    :cond_8
    invoke-virtual {p0, p1}, Lfreemarker/ext/xml/Navigator;->getNamespacePrefix(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 161
    .local v1, "nsprefix":Ljava/lang/String;
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_7

    .line 165
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method

.method abstract getText(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method abstract getType(Ljava/lang/Object;)Ljava/lang/String;
.end method
