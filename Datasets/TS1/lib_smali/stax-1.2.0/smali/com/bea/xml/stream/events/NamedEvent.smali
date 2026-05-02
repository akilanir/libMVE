.class public abstract Lcom/bea/xml/stream/events/NamedEvent;
.super Lcom/bea/xml/stream/events/BaseEvent;
.source "NamedEvent.java"


# instance fields
.field private name:Ljavax/xml/namespace/QName;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "localName"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    .line 30
    new-instance v0, Ljavax/xml/namespace/QName;

    invoke-direct {v0, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    .line 35
    new-instance v0, Ljavax/xml/namespace/QName;

    invoke-direct {v0, p2, p3, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    .line 36
    return-void
.end method

.method public constructor <init>(Ljavax/xml/namespace/QName;)V
    .registers 2
    .param p1, "name"    # Ljavax/xml/namespace/QName;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    .line 28
    return-void
.end method


# virtual methods
.method protected abstract doWriteAsEncodedUnicode(Ljava/io/Writer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public getName()Ljavax/xml/namespace/QName;
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    return-object v0
.end method

.method public nameAsString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 45
    const-string v0, ""

    iget-object v1, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 46
    iget-object v0, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v0

    .line 53
    :goto_14
    return-object v0

    .line 47
    :cond_15
    iget-object v0, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_65

    iget-object v0, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_65

    .line 49
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "[\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\']:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_14

    .line 53
    :cond_65
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "[\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\']:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_14
.end method

.method public setName(Ljavax/xml/namespace/QName;)V
    .registers 2
    .param p1, "n"    # Ljavax/xml/namespace/QName;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/bea/xml/stream/events/NamedEvent;->name:Ljavax/xml/namespace/QName;

    .line 42
    return-void
.end method
