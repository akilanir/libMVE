.class public Lcom/bea/xml/stream/filters/NameFilter;
.super Ljava/lang/Object;
.source "NameFilter.java"

# interfaces
.implements Ljavax/xml/stream/EventFilter;
.implements Ljavax/xml/stream/StreamFilter;


# instance fields
.field private name:Ljavax/xml/namespace/QName;


# direct methods
.method public constructor <init>(Ljavax/xml/namespace/QName;)V
    .registers 2
    .param p1, "name"    # Ljavax/xml/namespace/QName;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/bea/xml/stream/filters/NameFilter;->name:Ljavax/xml/namespace/QName;

    .line 32
    return-void
.end method


# virtual methods
.method public accept(Ljavax/xml/stream/XMLStreamReader;)Z
    .registers 6
    .param p1, "r"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->isStartElement()Z

    move-result v2

    if-nez v2, :cond_e

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->isEndElement()Z

    move-result v2

    if-nez v2, :cond_e

    .line 52
    :cond_d
    :goto_d
    return v1

    .line 48
    :cond_e
    new-instance v0, Ljavax/xml/namespace/QName;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .local v0, "eName":Ljavax/xml/namespace/QName;
    iget-object v2, p0, Lcom/bea/xml/stream/filters/NameFilter;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v2, v0}, Ljavax/xml/namespace/QName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 51
    const/4 v1, 0x1

    goto :goto_d
.end method

.method public accept(Ljavax/xml/stream/events/XMLEvent;)Z
    .registers 5
    .param p1, "e"    # Ljavax/xml/stream/events/XMLEvent;

    .prologue
    const/4 v1, 0x0

    .line 35
    invoke-interface {p1}, Ljavax/xml/stream/events/XMLEvent;->isStartElement()Z

    move-result v2

    if-nez v2, :cond_e

    invoke-interface {p1}, Ljavax/xml/stream/events/XMLEvent;->isEndElement()Z

    move-result v2

    if-nez v2, :cond_e

    .line 43
    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :cond_d
    :goto_d
    return v1

    .line 36
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :cond_e
    const/4 v0, 0x0

    .line 37
    .local v0, "eName":Ljavax/xml/namespace/QName;
    invoke-interface {p1}, Ljavax/xml/stream/events/XMLEvent;->isStartElement()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 38
    check-cast p1, Ljavax/xml/stream/events/StartElement;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v0

    .line 41
    :goto_1b
    iget-object v2, p0, Lcom/bea/xml/stream/filters/NameFilter;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v2, v0}, Ljavax/xml/namespace/QName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 42
    const/4 v1, 0x1

    goto :goto_d

    .line 40
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :cond_25
    check-cast p1, Ljavax/xml/stream/events/EndElement;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-interface {p1}, Ljavax/xml/stream/events/EndElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v0

    goto :goto_1b
.end method
