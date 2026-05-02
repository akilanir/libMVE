.class public Lcom/bea/xml/stream/XMLEventPlayer;
.super Lcom/bea/xml/stream/XMLEventReaderBase;
.source "XMLEventPlayer.java"


# instance fields
.field private player:Lcom/bea/xml/stream/XMLStreamPlayer;


# direct methods
.method public constructor <init>(Lcom/bea/xml/stream/XMLStreamPlayer;)V
    .registers 2
    .param p1, "reader"    # Lcom/bea/xml/stream/XMLStreamPlayer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLEventReaderBase;-><init>(Ljavax/xml/stream/XMLStreamReader;)V

    .line 34
    iput-object p1, p0, Lcom/bea/xml/stream/XMLEventPlayer;->player:Lcom/bea/xml/stream/XMLStreamPlayer;

    .line 35
    return-void
.end method


# virtual methods
.method protected parseSome()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 40
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventPlayer;->allocator:Ljavax/xml/stream/util/XMLEventAllocator;

    iget-object v1, p0, Lcom/bea/xml/stream/XMLEventPlayer;->reader:Ljavax/xml/stream/XMLStreamReader;

    invoke-interface {v0, v1, p0}, Ljavax/xml/stream/util/XMLEventAllocator;->allocate(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/util/XMLEventConsumer;)V

    .line 41
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventPlayer;->reader:Ljavax/xml/stream/XMLStreamReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamReader;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 42
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventPlayer;->reader:Ljavax/xml/stream/XMLStreamReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamReader;->next()I

    .line 43
    :cond_14
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLEventPlayer;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventPlayer;->reader:Ljavax/xml/stream/XMLStreamReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_36

    .line 44
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventPlayer;->player:Lcom/bea/xml/stream/XMLStreamPlayer;

    invoke-virtual {v0}, Lcom/bea/xml/stream/XMLStreamPlayer;->endDocumentIsPresent()Z

    move-result v0

    if-eqz v0, :cond_33

    .line 45
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventPlayer;->allocator:Ljavax/xml/stream/util/XMLEventAllocator;

    iget-object v1, p0, Lcom/bea/xml/stream/XMLEventPlayer;->reader:Ljavax/xml/stream/XMLStreamReader;

    invoke-interface {v0, v1, p0}, Ljavax/xml/stream/util/XMLEventAllocator;->allocate(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/util/XMLEventConsumer;)V

    .line 46
    :cond_33
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLEventPlayer;->internal_close()V

    .line 48
    :cond_36
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLEventPlayer;->needsMore()Z

    move-result v0

    if-nez v0, :cond_3e

    const/4 v0, 0x1

    :goto_3d
    return v0

    :cond_3e
    const/4 v0, 0x0

    goto :goto_3d
.end method
