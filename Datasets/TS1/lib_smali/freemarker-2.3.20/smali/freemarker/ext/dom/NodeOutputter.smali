.class Lfreemarker/ext/dom/NodeOutputter;
.super Ljava/lang/Object;
.source "NodeOutputter.java"


# instance fields
.field private contextNode:Lorg/w3c/dom/Element;

.field private defaultNS:Ljava/lang/String;

.field private env:Lfreemarker/core/Environment;

.field private explicitDefaultNSPrefix:Z

.field private hasDefaultNS:Z

.field private namespaceDecl:Ljava/lang/String;

.field private namespacesToPrefixLookup:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lorg/w3c/dom/Node;)V
    .registers 3
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    .line 81
    instance-of v0, p1, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_14

    .line 82
    check-cast p1, Lorg/w3c/dom/Element;

    .end local p1    # "node":Lorg/w3c/dom/Node;
    invoke-direct {p0, p1}, Lfreemarker/ext/dom/NodeOutputter;->setContext(Lorg/w3c/dom/Element;)V

    .line 90
    :cond_13
    :goto_13
    return-void

    .line 84
    .restart local p1    # "node":Lorg/w3c/dom/Node;
    :cond_14
    instance-of v0, p1, Lorg/w3c/dom/Attr;

    if-eqz v0, :cond_22

    .line 85
    check-cast p1, Lorg/w3c/dom/Attr;

    .end local p1    # "node":Lorg/w3c/dom/Node;
    invoke-interface {p1}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-direct {p0, v0}, Lfreemarker/ext/dom/NodeOutputter;->setContext(Lorg/w3c/dom/Element;)V

    goto :goto_13

    .line 87
    .restart local p1    # "node":Lorg/w3c/dom/Node;
    :cond_22
    instance-of v0, p1, Lorg/w3c/dom/Document;

    if-eqz v0, :cond_13

    .line 88
    check-cast p1, Lorg/w3c/dom/Document;

    .end local p1    # "node":Lorg/w3c/dom/Node;
    invoke-interface {p1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-direct {p0, v0}, Lfreemarker/ext/dom/NodeOutputter;->setContext(Lorg/w3c/dom/Element;)V

    goto :goto_13
.end method

.method private buildPrefixLookup(Lorg/w3c/dom/Node;)V
    .registers 10
    .param p1, "n"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v7, 0x1

    .line 107
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, "nsURI":Ljava/lang/String;
    if-eqz v2, :cond_2d

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2d

    .line 109
    iget-object v4, p0, Lfreemarker/ext/dom/NodeOutputter;->env:Lfreemarker/core/Environment;

    invoke-virtual {v4, v2}, Lfreemarker/core/Environment;->getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 110
    .local v3, "prefix":Ljava/lang/String;
    iget-object v4, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .end local v3    # "prefix":Ljava/lang/String;
    :cond_18
    :goto_18
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 119
    .local v0, "childNodes":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1d
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v1, v4, :cond_62

    .line 120
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-direct {p0, v4}, Lfreemarker/ext/dom/NodeOutputter;->buildPrefixLookup(Lorg/w3c/dom/Node;)V

    .line 119
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 111
    .end local v0    # "childNodes":Lorg/w3c/dom/NodeList;
    .end local v1    # "i":I
    :cond_2d
    iget-boolean v4, p0, Lfreemarker/ext/dom/NodeOutputter;->hasDefaultNS:Z

    if-eqz v4, :cond_43

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    if-ne v4, v7, :cond_43

    .line 112
    iget-object v4, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    iget-object v5, p0, Lfreemarker/ext/dom/NodeOutputter;->defaultNS:Ljava/lang/String;

    const-string v6, "D"

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    iput-boolean v7, p0, Lfreemarker/ext/dom/NodeOutputter;->explicitDefaultNSPrefix:Z

    goto :goto_18

    .line 114
    :cond_43
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_18

    iget-boolean v4, p0, Lfreemarker/ext/dom/NodeOutputter;->hasDefaultNS:Z

    if-eqz v4, :cond_18

    iget-object v4, p0, Lfreemarker/ext/dom/NodeOutputter;->defaultNS:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 115
    iget-object v4, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    iget-object v5, p0, Lfreemarker/ext/dom/NodeOutputter;->defaultNS:Ljava/lang/String;

    const-string v6, "D"

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    iput-boolean v7, p0, Lfreemarker/ext/dom/NodeOutputter;->explicitDefaultNSPrefix:Z

    goto :goto_18

    .line 122
    .restart local v0    # "childNodes":Lorg/w3c/dom/NodeList;
    .restart local v1    # "i":I
    :cond_62
    return-void
.end method

.method private constructNamespaceDecl()V
    .registers 9

    .prologue
    .line 125
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 126
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-boolean v6, p0, Lfreemarker/ext/dom/NodeOutputter;->explicitDefaultNSPrefix:Z

    if-eqz v6, :cond_18

    .line 127
    const-string v6, " xmlns=\""

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    iget-object v6, p0, Lfreemarker/ext/dom/NodeOutputter;->defaultNS:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    const-string v6, "\""

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    :cond_18
    iget-object v6, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :cond_22
    :goto_22
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8f

    .line 132
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 133
    .local v4, "nsURI":Ljava/lang/String;
    if-eqz v4, :cond_22

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_22

    .line 136
    iget-object v6, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 137
    .local v5, "prefix":Ljava/lang/String;
    if-nez v5, :cond_6e

    .line 140
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_41
    const/16 v6, 0x1a

    if-ge v2, v6, :cond_5b

    .line 141
    const/4 v6, 0x1

    new-array v1, v6, [C

    .line 142
    .local v1, "cc":[C
    const/4 v6, 0x0

    add-int/lit8 v7, v2, 0x61

    int-to-char v7, v7

    aput-char v7, v1, v6

    .line 143
    new-instance v5, Ljava/lang/String;

    .end local v5    # "prefix":Ljava/lang/String;
    invoke-direct {v5, v1}, Ljava/lang/String;-><init>([C)V

    .line 144
    .restart local v5    # "prefix":Ljava/lang/String;
    iget-object v6, p0, Lfreemarker/ext/dom/NodeOutputter;->env:Lfreemarker/core/Environment;

    invoke-virtual {v6, v5}, Lfreemarker/core/Environment;->getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_65

    .line 149
    .end local v1    # "cc":[C
    :cond_5b
    if-nez v5, :cond_69

    .line 150
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "This will almost never happen!"

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 147
    .restart local v1    # "cc":[C
    :cond_65
    const/4 v5, 0x0

    .line 140
    add-int/lit8 v2, v2, 0x1

    goto :goto_41

    .line 152
    .end local v1    # "cc":[C
    :cond_69
    iget-object v6, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    invoke-virtual {v6, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .end local v2    # "i":I
    :cond_6e
    const-string v6, " xmlns"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 155
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_81

    .line 156
    const-string v6, ":"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 157
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 159
    :cond_81
    const-string v6, "=\""

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 160
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 161
    const-string v6, "\""

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_22

    .line 163
    .end local v4    # "nsURI":Ljava/lang/String;
    .end local v5    # "prefix":Ljava/lang/String;
    :cond_8f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lfreemarker/ext/dom/NodeOutputter;->namespaceDecl:Ljava/lang/String;

    .line 164
    return-void
.end method

.method private outputQualifiedName(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V
    .registers 6
    .param p1, "n"    # Lorg/w3c/dom/Node;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 167
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, "nsURI":Ljava/lang/String;
    if-eqz v0, :cond_c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_14

    .line 169
    :cond_c
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 183
    :goto_13
    return-void

    .line 171
    :cond_14
    iget-object v2, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 172
    .local v1, "prefix":Ljava/lang/String;
    if-nez v1, :cond_26

    .line 174
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_13

    .line 176
    :cond_26
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_34

    .line 177
    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 178
    const/16 v2, 0x3a

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 180
    :cond_34
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_13
.end method

.method private setContext(Lorg/w3c/dom/Element;)V
    .registers 5
    .param p1, "contextNode"    # Lorg/w3c/dom/Element;

    .prologue
    .line 93
    iput-object p1, p0, Lfreemarker/ext/dom/NodeOutputter;->contextNode:Lorg/w3c/dom/Element;

    .line 94
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->env:Lfreemarker/core/Environment;

    .line 95
    iget-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->env:Lfreemarker/core/Environment;

    invoke-virtual {v0}, Lfreemarker/core/Environment;->getDefaultNS()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->defaultNS:Ljava/lang/String;

    .line 96
    iget-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->defaultNS:Ljava/lang/String;

    if-eqz v0, :cond_48

    iget-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->defaultNS:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_48

    const/4 v0, 0x1

    :goto_1d
    iput-boolean v0, p0, Lfreemarker/ext/dom/NodeOutputter;->hasDefaultNS:Z

    .line 97
    iget-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    const/4 v1, 0x0

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    iget-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    const-string v1, ""

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    invoke-direct {p0, p1}, Lfreemarker/ext/dom/NodeOutputter;->buildPrefixLookup(Lorg/w3c/dom/Node;)V

    .line 100
    iget-boolean v0, p0, Lfreemarker/ext/dom/NodeOutputter;->explicitDefaultNSPrefix:Z

    if-nez v0, :cond_44

    iget-boolean v0, p0, Lfreemarker/ext/dom/NodeOutputter;->hasDefaultNS:Z

    if-eqz v0, :cond_44

    .line 101
    iget-object v0, p0, Lfreemarker/ext/dom/NodeOutputter;->namespacesToPrefixLookup:Ljava/util/HashMap;

    iget-object v1, p0, Lfreemarker/ext/dom/NodeOutputter;->defaultNS:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    :cond_44
    invoke-direct {p0}, Lfreemarker/ext/dom/NodeOutputter;->constructNamespaceDecl()V

    .line 104
    return-void

    .line 96
    :cond_48
    const/4 v0, 0x0

    goto :goto_1d
.end method


# virtual methods
.method getClosingTag(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .registers 4
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 292
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 293
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 294
    invoke-direct {p0, p1, v0}, Lfreemarker/ext/dom/NodeOutputter;->outputQualifiedName(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 295
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 296
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getOpeningTag(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .registers 4
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 282
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 283
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 284
    invoke-direct {p0, p1, v0}, Lfreemarker/ext/dom/NodeOutputter;->outputQualifiedName(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 285
    iget-object v1, p0, Lfreemarker/ext/dom/NodeOutputter;->namespaceDecl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 286
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/NamedNodeMap;Ljava/lang/StringBuffer;)V

    .line 287
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 288
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method outputContent(Lorg/w3c/dom/NamedNodeMap;Ljava/lang/StringBuffer;)V
    .registers 7
    .param p1, "nodes"    # Lorg/w3c/dom/NamedNodeMap;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 271
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v2

    if-ge v0, v2, :cond_30

    .line 272
    invoke-interface {p1, v0}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 273
    .local v1, "n":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2a

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "xmlns:"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2d

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "xmlns"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2d

    .line 276
    :cond_2a
    invoke-virtual {p0, v1, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 271
    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 279
    .end local v1    # "n":Lorg/w3c/dom/Node;
    :cond_30
    return-void
.end method

.method outputContent(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V
    .registers 10
    .param p1, "n"    # Lorg/w3c/dom/Node;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v6, 0x20

    const/16 v5, 0x3e

    const/16 v4, 0x22

    .line 186
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    packed-switch v2, :pswitch_data_138

    .line 262
    :cond_d
    :goto_d
    return-void

    :pswitch_e
    move-object v2, p1

    .line 188
    check-cast v2, Lorg/w3c/dom/Attr;

    invoke-interface {v2}, Lorg/w3c/dom/Attr;->getSpecified()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 189
    invoke-virtual {p2, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 190
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputQualifiedName(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 191
    const-string v2, "=\""

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lfreemarker/template/utility/StringUtil;->XMLEncQAttr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_d

    .line 198
    :pswitch_33
    const-string v2, "<!--"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "-->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_d

    .line 202
    :pswitch_47
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V

    goto :goto_d

    .line 206
    :pswitch_4f
    const-string v2, "<!DOCTYPE "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-object v1, p1

    .line 207
    check-cast v1, Lorg/w3c/dom/DocumentType;

    .line 208
    .local v1, "dt":Lorg/w3c/dom/DocumentType;
    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_76

    .line 209
    const-string v2, " PUBLIC \""

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 211
    :cond_76
    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_8d

    .line 212
    const-string v2, " \""

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 214
    :cond_8d
    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getInternalSubset()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a6

    .line 215
    const-string v2, " ["

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {v1}, Lorg/w3c/dom/DocumentType;->getInternalSubset()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const/16 v3, 0x5d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 217
    :cond_a6
    invoke-virtual {p2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 221
    .end local v1    # "dt":Lorg/w3c/dom/DocumentType;
    :pswitch_ab
    const/16 v2, 0x3c

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 222
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputQualifiedName(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 223
    iget-object v2, p0, Lfreemarker/ext/dom/NodeOutputter;->contextNode:Lorg/w3c/dom/Element;

    if-ne p1, v2, :cond_bc

    .line 224
    iget-object v2, p0, Lfreemarker/ext/dom/NodeOutputter;->namespaceDecl:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 226
    :cond_bc
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/NamedNodeMap;Ljava/lang/StringBuffer;)V

    .line 227
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 228
    .local v0, "children":Lorg/w3c/dom/NodeList;
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-nez v2, :cond_d4

    .line 229
    const-string v2, " />"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 231
    :cond_d4
    invoke-virtual {p2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 232
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V

    .line 233
    const-string v2, "</"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 234
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputQualifiedName(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 235
    invoke-virtual {p2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 240
    .end local v0    # "children":Lorg/w3c/dom/NodeList;
    :pswitch_eb
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V

    goto/16 :goto_d

    .line 244
    :pswitch_f4
    const/16 v2, 0x26

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const/16 v3, 0x3b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 248
    :pswitch_109
    const-string v2, "<?"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "?>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 258
    :pswitch_12a
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/template/utility/StringUtil;->XMLEncNQG(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 186
    nop

    :pswitch_data_138
    .packed-switch 0x1
        :pswitch_ab
        :pswitch_e
        :pswitch_12a
        :pswitch_12a
        :pswitch_f4
        :pswitch_eb
        :pswitch_109
        :pswitch_33
        :pswitch_47
        :pswitch_4f
    .end packed-switch
.end method

.method outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V
    .registers 5
    .param p1, "nodes"    # Lorg/w3c/dom/NodeList;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 265
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 266
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 265
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 268
    :cond_11
    return-void
.end method
