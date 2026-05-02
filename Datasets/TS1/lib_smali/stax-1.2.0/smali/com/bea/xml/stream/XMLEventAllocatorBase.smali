.class public Lcom/bea/xml/stream/XMLEventAllocatorBase;
.super Ljava/lang/Object;
.source "XMLEventAllocatorBase.java"

# interfaces
.implements Ljavax/xml/stream/util/XMLEventAllocator;


# instance fields
.field factory:Ljavax/xml/stream/XMLEventFactory;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-static {}, Ljavax/xml/stream/XMLEventFactory;->newInstance()Ljavax/xml/stream/XMLEventFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    .line 48
    return-void
.end method

.method public static getAttributes(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;
    .registers 10
    .param p0, "reader"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 55
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getAttributeCount()I

    move-result v0

    if-nez v0, :cond_9

    sget-object v0, Lcom/bea/xml/stream/util/EmptyIterator;->emptyIterator:Lcom/bea/xml/stream/util/EmptyIterator;

    .line 65
    :goto_8
    return-object v0

    .line 56
    :cond_9
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getAttributeCount()I

    move-result v6

    .line 57
    .local v6, "attributeCount":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v7, "atts":Ljava/util/ArrayList;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_13
    if-ge v8, v6, :cond_34

    .line 59
    new-instance v0, Lcom/bea/xml/stream/AttributeBase;

    invoke-interface {p0, v8}, Ljavax/xml/stream/XMLStreamReader;->getAttributePrefix(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v8}, Ljavax/xml/stream/XMLStreamReader;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v8}, Ljavax/xml/stream/XMLStreamReader;->getAttributeLocalName(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v8}, Ljavax/xml/stream/XMLStreamReader;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0, v8}, Ljavax/xml/stream/XMLStreamReader;->getAttributeType(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/bea/xml/stream/AttributeBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    add-int/lit8 v8, v8, 0x1

    goto :goto_13

    .line 65
    :cond_34
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_8
.end method

.method public static getNamespaces(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;
    .registers 6
    .param p0, "reader"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 69
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceCount()I

    move-result v3

    if-nez v3, :cond_9

    sget-object v3, Lcom/bea/xml/stream/util/EmptyIterator;->emptyIterator:Lcom/bea/xml/stream/util/EmptyIterator;

    .line 81
    :goto_8
    return-object v3

    .line 70
    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .local v1, "ns":Ljava/util/ArrayList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceCount()I

    move-result v3

    if-ge v0, v3, :cond_3f

    .line 72
    invoke-interface {p0, v0}, Ljavax/xml/stream/XMLStreamReader;->getNamespacePrefix(I)Ljava/lang/String;

    move-result-object v2

    .line 73
    .local v2, "prefix":Ljava/lang/String;
    if-eqz v2, :cond_23

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 75
    :cond_23
    new-instance v3, Lcom/bea/xml/stream/NamespaceBase;

    invoke-interface {p0, v0}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/bea/xml/stream/NamespaceBase;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    :goto_2f
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 77
    :cond_32
    new-instance v3, Lcom/bea/xml/stream/NamespaceBase;

    invoke-interface {p0, v0}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lcom/bea/xml/stream/NamespaceBase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    .line 81
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_3f
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    goto :goto_8
.end method


# virtual methods
.method public allocate(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/XMLEvent;
    .registers 5
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 226
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v0

    packed-switch v0, :pswitch_data_74

    .line 240
    :pswitch_7
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to allocate event["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " , "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v2

    invoke-static {v2}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :pswitch_3c
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateStartElement(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartElement;

    move-result-object v0

    .line 238
    :goto_40
    return-object v0

    .line 228
    :pswitch_41
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateEndElement(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EndElement;

    move-result-object v0

    goto :goto_40

    .line 229
    :pswitch_46
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateCharacters(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;

    move-result-object v0

    goto :goto_40

    .line 230
    :pswitch_4b
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateCharacters(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;

    move-result-object v0

    goto :goto_40

    .line 231
    :pswitch_50
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateCData(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;

    move-result-object v0

    goto :goto_40

    .line 232
    :pswitch_55
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateEntityReference(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EntityReference;

    move-result-object v0

    goto :goto_40

    .line 233
    :pswitch_5a
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocatePI(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/ProcessingInstruction;

    move-result-object v0

    goto :goto_40

    .line 234
    :pswitch_5f
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateComment(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Comment;

    move-result-object v0

    goto :goto_40

    .line 236
    :pswitch_64
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateStartDocument(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartDocument;

    move-result-object v0

    goto :goto_40

    .line 237
    :pswitch_69
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateEndDocument(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EndDocument;

    move-result-object v0

    goto :goto_40

    .line 238
    :pswitch_6e
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateDTD(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/DTD;

    move-result-object v0

    goto :goto_40

    .line 226
    nop

    :pswitch_data_74
    .packed-switch 0x1
        :pswitch_3c
        :pswitch_41
        :pswitch_5a
        :pswitch_46
        :pswitch_5f
        :pswitch_4b
        :pswitch_64
        :pswitch_69
        :pswitch_55
        :pswitch_7
        :pswitch_6e
        :pswitch_50
    .end packed-switch
.end method

.method public allocate(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/util/XMLEventConsumer;)V
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .param p2, "consumer"    # Ljavax/xml/stream/util/XMLEventConsumer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 251
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocate(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    invoke-interface {p2, v0}, Ljavax/xml/stream/util/XMLEventConsumer;->add(Ljavax/xml/stream/events/XMLEvent;)V

    .line 252
    return-void
.end method

.method public allocateCData(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/xml/stream/XMLEventFactory;->createCData(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;

    move-result-object v0

    return-object v0
.end method

.method public allocateCharacters(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;
    .registers 6
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getTextStart()I

    move-result v2

    .line 116
    .local v2, "start":I
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getTextLength()I

    move-result v0

    .line 117
    .local v0, "length":I
    new-instance v1, Ljava/lang/String;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getTextCharacters()[C

    move-result-object v3

    invoke-direct {v1, v3, v2, v0}, Ljava/lang/String;-><init>([CII)V

    .line 120
    .local v1, "result":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->isWhiteSpace()Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 121
    iget-object v3, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-virtual {v3, v1}, Ljavax/xml/stream/XMLEventFactory;->createSpace(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;

    move-result-object v3

    .line 123
    :goto_1d
    return-object v3

    :cond_1e
    iget-object v3, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-virtual {v3, v1}, Ljavax/xml/stream/XMLEventFactory;->createCharacters(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;

    move-result-object v3

    goto :goto_1d
.end method

.method public allocateComment(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Comment;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/xml/stream/XMLEventFactory;->createComment(Ljava/lang/String;)Ljavax/xml/stream/events/Comment;

    move-result-object v0

    return-object v0
.end method

.method public allocateDTD(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/DTD;
    .registers 6
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 186
    instance-of v2, p1, Lcom/bea/xml/stream/MXParser;

    if-eqz v2, :cond_27

    move-object v1, p1

    .line 187
    check-cast v1, Lcom/bea/xml/stream/MXParser;

    .line 188
    .local v1, "mxp":Lcom/bea/xml/stream/MXParser;
    new-instance v0, Lcom/bea/xml/stream/events/DTDEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/bea/xml/stream/events/DTDEvent;-><init>(Ljava/lang/String;)V

    .line 189
    .local v0, "evt":Lcom/bea/xml/stream/events/DTDEvent;
    const-string v2, "javax.xml.stream.notations"

    invoke-virtual {v1, v2}, Lcom/bea/xml/stream/MXParser;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {v0, v2}, Lcom/bea/xml/stream/events/DTDEvent;->setNotations(Ljava/util/List;)V

    .line 190
    const-string v2, "javax.xml.stream.entities"

    invoke-virtual {v1, v2}, Lcom/bea/xml/stream/MXParser;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {v0, v2}, Lcom/bea/xml/stream/events/DTDEvent;->setEntities(Ljava/util/List;)V

    .line 195
    .end local v0    # "evt":Lcom/bea/xml/stream/events/DTDEvent;
    .end local v1    # "mxp":Lcom/bea/xml/stream/MXParser;
    :goto_26
    return-object v0

    :cond_27
    iget-object v2, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/xml/stream/XMLEventFactory;->createDTD(Ljava/lang/String;)Ljavax/xml/stream/events/DTD;

    move-result-object v0

    goto :goto_26
.end method

.method public allocateEndDocument(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EndDocument;
    .registers 3
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 176
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-virtual {v0}, Ljavax/xml/stream/XMLEventFactory;->createEndDocument()Ljavax/xml/stream/events/EndDocument;

    move-result-object v0

    return-object v0
.end method

.method public allocateEndElement(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EndElement;
    .registers 7
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPrefix()Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, "prefix":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, "uri":Ljava/lang/String;
    if-nez v0, :cond_c

    const-string v0, ""

    .line 104
    :cond_c
    if-nez v1, :cond_10

    const-string v1, ""

    .line 105
    :cond_10
    iget-object v2, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getNamespaces(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v4

    invoke-virtual {v2, v0, v1, v3, v4}, Ljavax/xml/stream/XMLEventFactory;->createEndElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Ljavax/xml/stream/events/EndElement;

    move-result-object v2

    return-object v2
.end method

.method public allocateEntityReference(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EntityReference;
    .registers 5
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v1

    .line 144
    .local v1, "name":Ljava/lang/String;
    instance-of v2, p1, Lcom/bea/xml/stream/MXParser;

    if-eqz v2, :cond_8

    .line 150
    :cond_8
    new-instance v0, Lcom/bea/xml/stream/events/EntityDeclarationEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/bea/xml/stream/events/EntityDeclarationEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .local v0, "ed":Lcom/bea/xml/stream/events/EntityDeclarationEvent;
    iget-object v2, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-virtual {v2, v1, v0}, Ljavax/xml/stream/XMLEventFactory;->createEntityReference(Ljava/lang/String;Ljavax/xml/stream/events/EntityDeclaration;)Ljavax/xml/stream/events/EntityReference;

    move-result-object v2

    return-object v2
.end method

.method public allocatePI(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/ProcessingInstruction;
    .registers 5
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPITarget()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPIData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljavax/xml/stream/XMLEventFactory;->createProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/ProcessingInstruction;

    move-result-object v0

    return-object v0
.end method

.method public allocateSpace(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/xml/stream/XMLEventFactory;->createSpace(Ljava/lang/String;)Ljavax/xml/stream/events/Characters;

    move-result-object v0

    return-object v0
.end method

.method public allocateStartDocument(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartDocument;
    .registers 3
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->allocateXMLDeclaration(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartDocument;

    move-result-object v0

    return-object v0
.end method

.method public allocateStartElement(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartElement;
    .registers 8
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPrefix()Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "prefix":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "uri":Ljava/lang/String;
    if-nez v1, :cond_c

    const-string v1, ""

    .line 90
    :cond_c
    if-nez v2, :cond_10

    const-string v2, ""

    .line 91
    :cond_10
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getAttributes(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v4

    invoke-static {p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getNamespaces(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Ljavax/xml/stream/XMLEventFactory;->createStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;Ljava/util/Iterator;)Ljavax/xml/stream/events/StartElement;

    move-result-object v0

    return-object v0
.end method

.method public allocateXMLDeclaration(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartDocument;
    .registers 6
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getCharacterEncodingScheme()Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "encoding":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getVersion()Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, "version":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->isStandalone()Z

    move-result v1

    .line 204
    .local v1, "standalone":Z
    if-eqz v0, :cond_19

    if-eqz v2, :cond_19

    if-nez v1, :cond_19

    .line 207
    iget-object v3, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-virtual {v3, v0, v2, v1}, Ljavax/xml/stream/XMLEventFactory;->createStartDocument(Ljava/lang/String;Ljava/lang/String;Z)Ljavax/xml/stream/events/StartDocument;

    move-result-object v3

    .line 219
    :goto_18
    return-object v3

    .line 211
    :cond_19
    if-eqz v2, :cond_24

    if-eqz v0, :cond_24

    .line 213
    iget-object v3, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-virtual {v3, v0, v2}, Ljavax/xml/stream/XMLEventFactory;->createStartDocument(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/stream/events/StartDocument;

    move-result-object v3

    goto :goto_18

    .line 216
    :cond_24
    if-eqz v0, :cond_2d

    .line 217
    iget-object v3, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-virtual {v3, v0}, Ljavax/xml/stream/XMLEventFactory;->createStartDocument(Ljava/lang/String;)Ljavax/xml/stream/events/StartDocument;

    move-result-object v3

    goto :goto_18

    .line 219
    :cond_2d
    iget-object v3, p0, Lcom/bea/xml/stream/XMLEventAllocatorBase;->factory:Ljavax/xml/stream/XMLEventFactory;

    invoke-virtual {v3}, Ljavax/xml/stream/XMLEventFactory;->createStartDocument()Ljavax/xml/stream/events/StartDocument;

    move-result-object v3

    goto :goto_18
.end method

.method public newInstance()Ljavax/xml/stream/util/XMLEventAllocator;
    .registers 2

    .prologue
    .line 51
    new-instance v0, Lcom/bea/xml/stream/XMLEventAllocatorBase;

    invoke-direct {v0}, Lcom/bea/xml/stream/XMLEventAllocatorBase;-><init>()V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 255
    const-string v0, "NonStaticAllocator"

    return-object v0
.end method
