.class public Lcom/bea/xml/stream/StaticAllocator;
.super Ljava/lang/Object;
.source "StaticAllocator.java"

# interfaces
.implements Ljavax/xml/stream/util/XMLEventAllocator;


# static fields
.field public static final FEATURE_STAX_ENTITIES:Ljava/lang/String; = "javax.xml.stream.entities"

.field public static final FEATURE_STAX_NOTATIONS:Ljava/lang/String; = "javax.xml.stream.notations"


# instance fields
.field cData:Lcom/bea/xml/stream/events/CharactersEvent;

.field characters:Lcom/bea/xml/stream/events/CharactersEvent;

.field comment:Lcom/bea/xml/stream/events/CommentEvent;

.field dtd:Lcom/bea/xml/stream/events/DTDEvent;

.field endDoc:Lcom/bea/xml/stream/events/EndDocumentEvent;

.field endElement:Lcom/bea/xml/stream/events/EndElementEvent;

.field entity:Lcom/bea/xml/stream/events/EntityReferenceEvent;

.field pi:Lcom/bea/xml/stream/events/ProcessingInstructionEvent;

.field space:Lcom/bea/xml/stream/events/CharactersEvent;

.field startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

.field startElement:Lcom/bea/xml/stream/events/StartElementEvent;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Lcom/bea/xml/stream/events/StartElementEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/StartElementEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->startElement:Lcom/bea/xml/stream/events/StartElementEvent;

    .line 65
    new-instance v0, Lcom/bea/xml/stream/events/EndElementEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/EndElementEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->endElement:Lcom/bea/xml/stream/events/EndElementEvent;

    .line 66
    new-instance v0, Lcom/bea/xml/stream/events/CharactersEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/CharactersEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->characters:Lcom/bea/xml/stream/events/CharactersEvent;

    .line 67
    new-instance v0, Lcom/bea/xml/stream/events/CharactersEvent;

    const-string v1, ""

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/bea/xml/stream/events/CharactersEvent;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->cData:Lcom/bea/xml/stream/events/CharactersEvent;

    .line 68
    new-instance v0, Lcom/bea/xml/stream/events/CharactersEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/CharactersEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->space:Lcom/bea/xml/stream/events/CharactersEvent;

    .line 69
    new-instance v0, Lcom/bea/xml/stream/events/CommentEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/CommentEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->comment:Lcom/bea/xml/stream/events/CommentEvent;

    .line 70
    new-instance v0, Lcom/bea/xml/stream/events/EntityReferenceEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/EntityReferenceEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->entity:Lcom/bea/xml/stream/events/EntityReferenceEvent;

    .line 71
    new-instance v0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->pi:Lcom/bea/xml/stream/events/ProcessingInstructionEvent;

    .line 72
    new-instance v0, Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/StartDocumentEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    .line 73
    new-instance v0, Lcom/bea/xml/stream/events/EndDocumentEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/EndDocumentEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->endDoc:Lcom/bea/xml/stream/events/EndDocumentEvent;

    .line 74
    new-instance v0, Lcom/bea/xml/stream/events/DTDEvent;

    invoke-direct {v0}, Lcom/bea/xml/stream/events/DTDEvent;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->dtd:Lcom/bea/xml/stream/events/DTDEvent;

    .line 76
    return-void
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
    .line 210
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v0

    packed-switch v0, :pswitch_data_66

    .line 224
    :pswitch_7
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to allocate event["

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

    .line 211
    :pswitch_2e
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateStartElement(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartElement;

    move-result-object v0

    .line 222
    :goto_32
    return-object v0

    .line 212
    :pswitch_33
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateEndElement(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EndElement;

    move-result-object v0

    goto :goto_32

    .line 213
    :pswitch_38
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateCharacters(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;

    move-result-object v0

    goto :goto_32

    .line 214
    :pswitch_3d
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateCharacters(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;

    move-result-object v0

    goto :goto_32

    .line 215
    :pswitch_42
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateCData(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;

    move-result-object v0

    goto :goto_32

    .line 216
    :pswitch_47
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateEntityReference(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EntityReference;

    move-result-object v0

    goto :goto_32

    .line 217
    :pswitch_4c
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocatePI(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/ProcessingInstruction;

    move-result-object v0

    goto :goto_32

    .line 218
    :pswitch_51
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateComment(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Comment;

    move-result-object v0

    goto :goto_32

    .line 220
    :pswitch_56
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateStartDocument(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartDocument;

    move-result-object v0

    goto :goto_32

    .line 221
    :pswitch_5b
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateEndDocument(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EndDocument;

    move-result-object v0

    goto :goto_32

    .line 222
    :pswitch_60
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateDTD(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/DTD;

    move-result-object v0

    goto :goto_32

    .line 210
    nop

    :pswitch_data_66
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_33
        :pswitch_4c
        :pswitch_38
        :pswitch_51
        :pswitch_3d
        :pswitch_56
        :pswitch_5b
        :pswitch_47
        :pswitch_7
        :pswitch_60
        :pswitch_42
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
    .line 234
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocate(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    invoke-interface {p2, v0}, Ljavax/xml/stream/util/XMLEventConsumer;->add(Ljavax/xml/stream/events/XMLEvent;)V

    .line 235
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
    .line 124
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->cData:Lcom/bea/xml/stream/events/CharactersEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/CharactersEvent;->setData(Ljava/lang/String;)V

    .line 125
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->cData:Lcom/bea/xml/stream/events/CharactersEvent;

    return-object v0
.end method

.method public allocateCharacters(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/Characters;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->characters:Lcom/bea/xml/stream/events/CharactersEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/CharactersEvent;->setData(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->characters:Lcom/bea/xml/stream/events/CharactersEvent;

    return-object v0
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
    .line 156
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->comment:Lcom/bea/xml/stream/events/CommentEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/CommentEvent;->setData(Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->comment:Lcom/bea/xml/stream/events/CommentEvent;

    return-object v0
.end method

.method public allocateDTD(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/DTD;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 176
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->dtd:Lcom/bea/xml/stream/events/DTDEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/DTDEvent;->setDTD(Ljava/lang/String;)V

    .line 177
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->dtd:Lcom/bea/xml/stream/events/DTDEvent;

    return-object v0
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
    .line 170
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->endDoc:Lcom/bea/xml/stream/events/EndDocumentEvent;

    return-object v0
.end method

.method public allocateEndElement(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EndElement;
    .registers 8
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 102
    iget-object v2, p0, Lcom/bea/xml/stream/StaticAllocator;->endElement:Lcom/bea/xml/stream/events/EndElementEvent;

    invoke-virtual {v2}, Lcom/bea/xml/stream/events/EndElementEvent;->reset()V

    .line 103
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/bea/xml/stream/EventFactory;->checkPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "prefix":Ljava/lang/String;
    iget-object v2, p0, Lcom/bea/xml/stream/StaticAllocator;->endElement:Lcom/bea/xml/stream/events/EndElementEvent;

    new-instance v3, Ljavax/xml/namespace/QName;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/bea/xml/stream/events/EndElementEvent;->setName(Ljavax/xml/namespace/QName;)V

    .line 108
    invoke-static {p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getNamespaces(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v0

    .line 109
    .local v0, "ni":Ljava/util/Iterator;
    :goto_23
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 110
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->endElement:Lcom/bea/xml/stream/events/EndElementEvent;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {v3, v2}, Lcom/bea/xml/stream/events/EndElementEvent;->addNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_23

    .line 111
    :cond_35
    iget-object v2, p0, Lcom/bea/xml/stream/StaticAllocator;->endElement:Lcom/bea/xml/stream/events/EndElementEvent;

    return-object v2
.end method

.method public allocateEntityReference(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/EntityReference;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->entity:Lcom/bea/xml/stream/events/EntityReferenceEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/EntityReferenceEvent;->setName(Ljava/lang/String;)V

    .line 141
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->entity:Lcom/bea/xml/stream/events/EntityReferenceEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/EntityReferenceEvent;->setReplacementText(Ljava/lang/String;)V

    .line 142
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->entity:Lcom/bea/xml/stream/events/EntityReferenceEvent;

    return-object v0
.end method

.method public allocatePI(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/ProcessingInstruction;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 148
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->pi:Lcom/bea/xml/stream/events/ProcessingInstructionEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPITarget()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->setTarget(Ljava/lang/String;)V

    .line 149
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->pi:Lcom/bea/xml/stream/events/ProcessingInstructionEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPIData()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->setData(Ljava/lang/String;)V

    .line 150
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->pi:Lcom/bea/xml/stream/events/ProcessingInstructionEvent;

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
    .line 131
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->space:Lcom/bea/xml/stream/events/CharactersEvent;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/CharactersEvent;->setSpace(Z)V

    .line 132
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->space:Lcom/bea/xml/stream/events/CharactersEvent;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/events/CharactersEvent;->setData(Ljava/lang/String;)V

    .line 133
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->space:Lcom/bea/xml/stream/events/CharactersEvent;

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
    .line 163
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/StaticAllocator;->allocateXMLDeclaration(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartDocument;

    .line 164
    iget-object v0, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    return-object v0
.end method

.method public allocateStartElement(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/events/StartElement;
    .registers 9
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startElement:Lcom/bea/xml/stream/events/StartElementEvent;

    invoke-virtual {v3}, Lcom/bea/xml/stream/events/StartElementEvent;->reset()V

    .line 85
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/bea/xml/stream/EventFactory;->checkPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 86
    .local v2, "prefix":Ljava/lang/String;
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startElement:Lcom/bea/xml/stream/events/StartElementEvent;

    new-instance v4, Ljavax/xml/namespace/QName;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v2}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/bea/xml/stream/events/StartElementEvent;->setName(Ljavax/xml/namespace/QName;)V

    .line 89
    invoke-static {p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getAttributes(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v0

    .line 90
    .local v0, "ai":Ljava/util/Iterator;
    :goto_23
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 91
    iget-object v4, p0, Lcom/bea/xml/stream/StaticAllocator;->startElement:Lcom/bea/xml/stream/events/StartElementEvent;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/xml/stream/events/Attribute;

    invoke-virtual {v4, v3}, Lcom/bea/xml/stream/events/StartElementEvent;->addAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_23

    .line 93
    :cond_35
    invoke-static {p1}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getNamespaces(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v1

    .line 94
    .local v1, "ni":Ljava/util/Iterator;
    :goto_39
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4b

    .line 95
    iget-object v4, p0, Lcom/bea/xml/stream/StaticAllocator;->startElement:Lcom/bea/xml/stream/events/StartElementEvent;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {v4, v3}, Lcom/bea/xml/stream/events/StartElementEvent;->addAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_39

    .line 96
    :cond_4b
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startElement:Lcom/bea/xml/stream/events/StartElementEvent;

    return-object v3
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
    .line 183
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-virtual {v3}, Lcom/bea/xml/stream/events/StartDocumentEvent;->clear()V

    .line 184
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getCharacterEncodingScheme()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "encoding":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getVersion()Ljava/lang/String;

    move-result-object v2

    .line 186
    .local v2, "version":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->isStandalone()Z

    move-result v1

    .line 187
    .local v1, "standalone":Z
    if-eqz v0, :cond_29

    if-eqz v2, :cond_29

    if-nez v1, :cond_29

    .line 190
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-virtual {v3, v0}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setEncoding(Ljava/lang/String;)V

    .line 191
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-virtual {v3, v2}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setVersion(Ljava/lang/String;)V

    .line 192
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-virtual {v3, v1}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setStandalone(Z)V

    .line 193
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    .line 204
    :goto_28
    return-object v3

    .line 195
    :cond_29
    if-eqz v2, :cond_3a

    if-eqz v0, :cond_3a

    .line 197
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-virtual {v3, v0}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setEncoding(Ljava/lang/String;)V

    .line 198
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-virtual {v3, v2}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setVersion(Ljava/lang/String;)V

    .line 199
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    goto :goto_28

    .line 202
    :cond_3a
    if-eqz v0, :cond_41

    .line 203
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    invoke-virtual {v3, v0}, Lcom/bea/xml/stream/events/StartDocumentEvent;->setEncoding(Ljava/lang/String;)V

    .line 204
    :cond_41
    iget-object v3, p0, Lcom/bea/xml/stream/StaticAllocator;->startDoc:Lcom/bea/xml/stream/events/StartDocumentEvent;

    goto :goto_28
.end method

.method public newInstance()Ljavax/xml/stream/util/XMLEventAllocator;
    .registers 2

    .prologue
    .line 78
    new-instance v0, Lcom/bea/xml/stream/StaticAllocator;

    invoke-direct {v0}, Lcom/bea/xml/stream/StaticAllocator;-><init>()V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 238
    const-string v0, "Static Allocator"

    return-object v0
.end method
