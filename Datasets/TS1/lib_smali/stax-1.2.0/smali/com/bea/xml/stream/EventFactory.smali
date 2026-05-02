.class public Lcom/bea/xml/stream/EventFactory;
.super Ljavax/xml/stream/XMLEventFactory;
.source "EventFactory.java"


# instance fields
.field private location:Ljavax/xml/stream/Location;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljavax/xml/stream/XMLEventFactory;-><init>()V

    return-void
.end method

.method public static checkPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 1
    .param p0, "prefix"    # Ljava/lang/String;

    .prologue
    .line 103
    if-nez p0, :cond_4

    const-string p0, ""

    .line 104
    .end local p0    # "prefix":Ljava/lang/String;
    :cond_4
    return-object p0
.end method


# virtual methods
.method public createAttribute(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/Attribute;
    .registers 5
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 67
    new-instance v0, Lcom/bea/xml/stream/AttributeBase;

    const-string v1, ""

    invoke-direct {v0, v1, p1, p2}, Lcom/bea/xml/stream/AttributeBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/Attribute;
    .registers 11
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v0, Lcom/bea/xml/stream/AttributeBase;

    const-string v5, "CDATA"

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/bea/xml/stream/AttributeBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createAttribute(Ljavax/xml/namespace/QName;Ljava/lang/String;)Ljavax/xml/stream/events/Attribute;
    .registers 4
    .param p1, "name"    # Ljavax/xml/namespace/QName;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 62
    new-instance v0, Lcom/bea/xml/stream/AttributeBase;

    invoke-direct {v0, p1, p2}, Lcom/bea/xml/stream/AttributeBase;-><init>(Ljavax/xml/namespace/QName;Ljava/lang/String;)V

    return-object v0
.end method

.method public createCData(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;
    .registers 4
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 172
    new-instance v0, Lcom/bea/xml/stream/events/CharactersEvent;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lcom/bea/xml/stream/events/CharactersEvent;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method

.method public createCharacters(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;
    .registers 3
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 169
    new-instance v0, Lcom/bea/xml/stream/events/CharactersEvent;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/events/CharactersEvent;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public createComment(Ljava/lang/String;)Ljavax/xml/stream/events/Comment;
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 232
    new-instance v0, Lcom/bea/xml/stream/events/CommentEvent;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/events/CommentEvent;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public createDTD(Ljava/lang/String;)Ljavax/xml/stream/events/DTD;
    .registers 3
    .param p1, "dtd"    # Ljava/lang/String;

    .prologue
    .line 240
    new-instance v0, Lcom/bea/xml/stream/events/DTDEvent;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/events/DTDEvent;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public createEndDocument()Ljavax/xml/stream/events/EndDocument;
    .registers 2

    .prologue
    .line 199
    new-instance v0, Lcom/bea/xml/stream/events/EndDocumentEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/EndDocumentEvent;-><init>()V

    return-object v0
.end method

.method public createEndElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/EndElement;
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;

    .prologue
    .line 150
    invoke-static {p1}, Lcom/bea/xml/stream/EventFactory;->checkPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 151
    new-instance v0, Lcom/bea/xml/stream/events/EndElementEvent;

    new-instance v1, Ljavax/xml/namespace/QName;

    invoke-direct {v1, p2, p3, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/events/EndElementEvent;-><init>(Ljavax/xml/namespace/QName;)V

    return-object v0
.end method

.method public createEndElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Ljavax/xml/stream/events/EndElement;
    .registers 7
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .param p4, "namespaces"    # Ljava/util/Iterator;

    .prologue
    .line 158
    invoke-static {p1}, Lcom/bea/xml/stream/EventFactory;->checkPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 159
    new-instance v0, Lcom/bea/xml/stream/events/EndElementEvent;

    new-instance v1, Ljavax/xml/namespace/QName;

    invoke-direct {v1, p2, p3, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/events/EndElementEvent;-><init>(Ljavax/xml/namespace/QName;)V

    .line 161
    .local v0, "e":Lcom/bea/xml/stream/events/EndElementEvent;
    :goto_e
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 162
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/EndElementEvent;->addNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_e

    .line 163
    :cond_1e
    return-object v0
.end method

.method public createEndElement(Ljavax/xml/namespace/QName;Ljava/util/Iterator;)Ljavax/xml/stream/events/EndElement;
    .registers 5
    .param p1, "name"    # Ljavax/xml/namespace/QName;
    .param p2, "namespaces"    # Ljava/util/Iterator;

    .prologue
    .line 139
    new-instance v0, Lcom/bea/xml/stream/events/EndElementEvent;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/events/EndElementEvent;-><init>(Ljavax/xml/namespace/QName;)V

    .line 141
    .local v0, "e":Lcom/bea/xml/stream/events/EndElementEvent;
    :goto_5
    if-eqz p2, :cond_17

    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 142
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/EndElementEvent;->addNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_5

    .line 143
    :cond_17
    return-object v0
.end method

.method public createEntityReference(Ljava/lang/String;Ljavax/xml/stream/events/EntityDeclaration;)Ljavax/xml/stream/events/EntityReference;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "declaration"    # Ljavax/xml/stream/events/EntityDeclaration;

    .prologue
    .line 215
    new-instance v0, Lcom/bea/xml/stream/events/EntityReferenceEvent;

    invoke-direct {v0, p1, p2}, Lcom/bea/xml/stream/events/EntityReferenceEvent;-><init>(Ljava/lang/String;Ljavax/xml/stream/events/EntityDeclaration;)V

    return-object v0
.end method

.method public createIgnorableSpace(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;
    .registers 4
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 225
    new-instance v0, Lcom/bea/xml/stream/events/CharactersEvent;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/events/CharactersEvent;-><init>(Ljava/lang/String;)V

    .line 226
    .local v0, "c":Lcom/bea/xml/stream/events/CharactersEvent;
    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/CharactersEvent;->setSpace(Z)V

    .line 227
    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/CharactersEvent;->setIgnorable(Z)V

    .line 228
    return-object v0
.end method

.method public createNamespace(Ljava/lang/String;)Ljavax/xml/stream/events/Namespace;
    .registers 3
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 76
    new-instance v0, Lcom/bea/xml/stream/NamespaceBase;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/NamespaceBase;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public createNamespace(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/Namespace;
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;

    .prologue
    .line 79
    if-nez p1, :cond_a

    .line 80
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "The prefix of a namespace may not be set to null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_a
    new-instance v0, Lcom/bea/xml/stream/NamespaceBase;

    invoke-direct {v0, p1, p2}, Lcom/bea/xml/stream/NamespaceBase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/ProcessingInstruction;
    .registers 4
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 236
    new-instance v0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;

    invoke-direct {v0, p1, p2}, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createSpace(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;
    .registers 4
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 219
    new-instance v0, Lcom/bea/xml/stream/events/CharactersEvent;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/events/CharactersEvent;-><init>(Ljava/lang/String;)V

    .line 220
    .local v0, "c":Lcom/bea/xml/stream/events/CharactersEvent;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/CharactersEvent;->setSpace(Z)V

    .line 221
    return-object v0
.end method

.method public createStartDocument()Ljavax/xml/stream/events/StartDocument;
    .registers 2

    .prologue
    .line 175
    new-instance v0, Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/StartDocumentEvent;-><init>()V

    return-object v0
.end method

.method public createStartDocument(Ljava/lang/String;)Ljavax/xml/stream/events/StartDocument;
    .registers 3
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 193
    new-instance v0, Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/StartDocumentEvent;-><init>()V

    .line 194
    .local v0, "e":Lcom/bea/xml/stream/events/StartDocumentEvent;
    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setEncoding(Ljava/lang/String;)V

    .line 195
    return-object v0
.end method

.method public createStartDocument(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/StartDocument;
    .registers 4
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;

    .prologue
    .line 186
    new-instance v0, Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/StartDocumentEvent;-><init>()V

    .line 187
    .local v0, "e":Lcom/bea/xml/stream/events/StartDocumentEvent;
    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setEncoding(Ljava/lang/String;)V

    .line 188
    invoke-virtual {v0, p2}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setVersion(Ljava/lang/String;)V

    .line 189
    return-object v0
.end method

.method public createStartDocument(Ljava/lang/String;Ljava/lang/String;Z)Ljavax/xml/stream/events/StartDocument;
    .registers 5
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "standalone"    # Z

    .prologue
    .line 179
    new-instance v0, Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/StartDocumentEvent;-><init>()V

    .line 180
    .local v0, "e":Lcom/bea/xml/stream/events/StartDocumentEvent;
    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setEncoding(Ljava/lang/String;)V

    .line 181
    invoke-virtual {v0, p2}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setVersion(Ljava/lang/String;)V

    .line 182
    invoke-virtual {v0, p3}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setStandalone(Z)V

    .line 183
    return-object v0
.end method

.method public createStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/StartElement;
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;

    .prologue
    .line 100
    new-instance v0, Lcom/bea/xml/stream/events/StartElementEvent;

    new-instance v1, Ljavax/xml/namespace/QName;

    invoke-direct {v1, p2, p3, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;-><init>(Ljavax/xml/namespace/QName;)V

    return-object v0
.end method

.method public createStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;Ljava/util/Iterator;)Ljavax/xml/stream/events/StartElement;
    .registers 8
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .param p4, "attributes"    # Ljava/util/Iterator;
    .param p5, "namespaces"    # Ljava/util/Iterator;

    .prologue
    .line 111
    invoke-static {p1}, Lcom/bea/xml/stream/EventFactory;->checkPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 112
    new-instance v0, Lcom/bea/xml/stream/events/StartElementEvent;

    new-instance v1, Ljavax/xml/namespace/QName;

    invoke-direct {v1, p2, p3, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;-><init>(Ljavax/xml/namespace/QName;)V

    .line 114
    .local v0, "e":Lcom/bea/xml/stream/events/StartElementEvent;
    :goto_e
    if-eqz p4, :cond_20

    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 115
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/Attribute;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;->addAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_e

    .line 116
    :cond_20
    :goto_20
    if-eqz p5, :cond_32

    invoke-interface {p5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 117
    invoke-interface {p5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;->addNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_20

    .line 118
    :cond_32
    return-object v0
.end method

.method public createStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;Ljava/util/Iterator;Ljavax/xml/namespace/NamespaceContext;)Ljavax/xml/stream/events/StartElement;
    .registers 9
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .param p4, "attributes"    # Ljava/util/Iterator;
    .param p5, "namespaces"    # Ljava/util/Iterator;
    .param p6, "context"    # Ljavax/xml/namespace/NamespaceContext;

    .prologue
    .line 126
    invoke-static {p1}, Lcom/bea/xml/stream/EventFactory;->checkPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 127
    new-instance v0, Lcom/bea/xml/stream/events/StartElementEvent;

    new-instance v1, Ljavax/xml/namespace/QName;

    invoke-direct {v1, p2, p3, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;-><init>(Ljavax/xml/namespace/QName;)V

    .line 129
    .local v0, "e":Lcom/bea/xml/stream/events/StartElementEvent;
    :goto_e
    if-eqz p4, :cond_20

    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 130
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/Attribute;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;->addAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_e

    .line 131
    :cond_20
    :goto_20
    if-eqz p5, :cond_32

    invoke-interface {p5}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 132
    invoke-interface {p5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;->addNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_20

    .line 133
    :cond_32
    invoke-virtual {v0, p6}, Lcom/bea/xml/stream/events/StartElementEvent;->setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V

    .line 134
    return-object v0
.end method

.method public createStartElement(Ljavax/xml/namespace/QName;Ljava/util/Iterator;Ljava/util/Iterator;)Ljavax/xml/stream/events/StartElement;
    .registers 6
    .param p1, "name"    # Ljavax/xml/namespace/QName;
    .param p2, "attributes"    # Ljava/util/Iterator;
    .param p3, "namespaces"    # Ljava/util/Iterator;

    .prologue
    .line 87
    new-instance v0, Lcom/bea/xml/stream/events/StartElementEvent;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/events/StartElementEvent;-><init>(Ljavax/xml/namespace/QName;)V

    .line 89
    .local v0, "e":Lcom/bea/xml/stream/events/StartElementEvent;
    :goto_5
    if-eqz p2, :cond_17

    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 90
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/Attribute;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;->addAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_5

    .line 91
    :cond_17
    :goto_17
    if-eqz p3, :cond_29

    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 92
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/StartElementEvent;->addNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_17

    .line 93
    :cond_29
    return-object v0
.end method

.method public setLocation(Ljavax/xml/stream/Location;)V
    .registers 2
    .param p1, "l"    # Ljavax/xml/stream/Location;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/bea/xml/stream/EventFactory;->location:Ljavax/xml/stream/Location;

    .line 59
    return-void
.end method
