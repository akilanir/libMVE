.class public Lcom/bea/xml/stream/events/StartElementEvent;
.super Lcom/bea/xml/stream/events/NamedEvent;
.source "StartElementEvent.java"

# interfaces
.implements Ljavax/xml/stream/events/StartElement;


# instance fields
.field private attributes:Ljava/util/List;

.field private context:Ljavax/xml/namespace/NamespaceContext;

.field private namespaces:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/bea/xml/stream/events/NamedEvent;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljavax/xml/namespace/QName;)V
    .registers 2
    .param p1, "name"    # Ljavax/xml/namespace/QName;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/events/NamedEvent;-><init>(Ljavax/xml/namespace/QName;)V

    .line 45
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->init()V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljavax/xml/stream/events/StartElement;)V
    .registers 5
    .param p1, "element"    # Ljavax/xml/stream/events/StartElement;

    .prologue
    .line 54
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/bea/xml/stream/events/NamedEvent;-><init>(Ljavax/xml/namespace/QName;)V

    .line 55
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->init()V

    .line 56
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/events/StartElementEvent;->setName(Ljavax/xml/namespace/QName;)V

    .line 58
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getAttributes()Ljava/util/Iterator;

    move-result-object v0

    .line 59
    .local v0, "ai":Ljava/util/Iterator;
    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 60
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/xml/stream/events/Attribute;

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/events/StartElementEvent;->addAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_15

    .line 62
    :cond_25
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getNamespaces()Ljava/util/Iterator;

    move-result-object v1

    .line 63
    .local v1, "ni":Ljava/util/Iterator;
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getNamespaces()Ljava/util/Iterator;

    move-result-object v1

    .line 64
    :goto_2d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 65
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/events/StartElementEvent;->addNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_2d

    .line 66
    :cond_3d
    return-void
.end method


# virtual methods
.method public addAttribute(Ljavax/xml/stream/events/Attribute;)V
    .registers 3
    .param p1, "attribute"    # Ljavax/xml/stream/events/Attribute;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->attributes:Ljava/util/List;

    if-nez v0, :cond_b

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->attributes:Ljava/util/List;

    .line 93
    :cond_b
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->attributes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    return-void
.end method

.method public addNamespace(Ljavax/xml/stream/events/Namespace;)V
    .registers 3
    .param p1, "attribute"    # Ljavax/xml/stream/events/Namespace;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->namespaces:Ljava/util/List;

    if-nez v0, :cond_b

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->namespaces:Ljava/util/List;

    .line 98
    :cond_b
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->namespaces:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    return-void
.end method

.method protected doWriteAsEncodedUnicode(Ljava/io/Writer;)V
    .registers 9
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x20

    .line 128
    const/16 v5, 0x3c

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 129
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    .line 130
    .local v2, "name":Ljavax/xml/namespace/QName;
    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v4

    .line 131
    .local v4, "prefix":Ljava/lang/String;
    if-eqz v4, :cond_1f

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1f

    .line 132
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 133
    const/16 v5, 0x3a

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 135
    :cond_1f
    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 138
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->getNamespaces()Ljava/util/Iterator;

    move-result-object v3

    .line 139
    .local v3, "ni":Ljava/util/Iterator;
    :goto_2a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 140
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 142
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/XMLEvent;

    .line 143
    .local v1, "evt":Ljavax/xml/stream/events/XMLEvent;
    invoke-interface {v1, p1}, Ljavax/xml/stream/events/XMLEvent;->writeAsEncodedUnicode(Ljava/io/Writer;)V

    goto :goto_2a

    .line 147
    .end local v1    # "evt":Ljavax/xml/stream/events/XMLEvent;
    :cond_3d
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->getAttributes()Ljava/util/Iterator;

    move-result-object v0

    .line 148
    .local v0, "ai":Ljava/util/Iterator;
    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_54

    .line 149
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 150
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/stream/events/XMLEvent;

    .line 151
    .restart local v1    # "evt":Ljavax/xml/stream/events/XMLEvent;
    invoke-interface {v1, p1}, Ljavax/xml/stream/events/XMLEvent;->writeAsEncodedUnicode(Ljava/io/Writer;)V

    goto :goto_41

    .line 154
    .end local v1    # "evt":Ljavax/xml/stream/events/XMLEvent;
    :cond_54
    const/16 v5, 0x3e

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 155
    return-void
.end method

.method public getAttributeByName(Ljavax/xml/namespace/QName;)Ljavax/xml/stream/events/Attribute;
    .registers 6
    .param p1, "name"    # Ljavax/xml/namespace/QName;

    .prologue
    const/4 v2, 0x0

    .line 78
    if-nez p1, :cond_5

    move-object v0, v2

    .line 85
    :goto_4
    return-object v0

    .line 79
    :cond_5
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->getAttributes()Ljava/util/Iterator;

    move-result-object v1

    .line 80
    .local v1, "i":Ljava/util/Iterator;
    :cond_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    .line 81
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/stream/events/Attribute;

    .line 82
    .local v0, "a":Ljavax/xml/stream/events/Attribute;
    invoke-interface {v0}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljavax/xml/namespace/QName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    goto :goto_4

    .end local v0    # "a":Ljavax/xml/stream/events/Attribute;
    :cond_20
    move-object v0, v2

    .line 85
    goto :goto_4
.end method

.method public getAttributes()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->attributes:Ljava/util/List;

    if-nez v0, :cond_7

    sget-object v0, Lcom/bea/xml/stream/util/EmptyIterator;->emptyIterator:Lcom/bea/xml/stream/util/EmptyIterator;

    .line 70
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->attributes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_6
.end method

.method public getNamespaceContext()Ljavax/xml/namespace/NamespaceContext;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->context:Ljavax/xml/namespace/NamespaceContext;

    return-object v0
.end method

.method public getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->context:Ljavax/xml/namespace/NamespaceContext;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    .line 102
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->context:Ljavax/xml/namespace/NamespaceContext;

    invoke-interface {v0, p1}, Ljavax/xml/namespace/NamespaceContext;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public getNamespaces()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->namespaces:Ljava/util/List;

    if-nez v0, :cond_7

    sget-object v0, Lcom/bea/xml/stream/util/EmptyIterator;->emptyIterator:Lcom/bea/xml/stream/util/EmptyIterator;

    .line 74
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->namespaces:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_6
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/events/StartElementEvent;->setEventType(I)V

    return-void
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->attributes:Ljava/util/List;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->attributes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 50
    :cond_9
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->namespaces:Ljava/util/List;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->namespaces:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 51
    :cond_12
    iget-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->context:Ljavax/xml/namespace/NamespaceContext;

    if-eqz v0, :cond_19

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bea/xml/stream/events/StartElementEvent;->context:Ljavax/xml/namespace/NamespaceContext;

    .line 52
    :cond_19
    return-void
.end method

.method public setAttributes(Ljava/util/List;)V
    .registers 2
    .param p1, "attributes"    # Ljava/util/List;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/bea/xml/stream/events/StartElementEvent;->attributes:Ljava/util/List;

    .line 89
    return-void
.end method

.method public setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V
    .registers 2
    .param p1, "c"    # Ljavax/xml/namespace/NamespaceContext;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/bea/xml/stream/events/StartElementEvent;->context:Ljavax/xml/namespace/NamespaceContext;

    .line 107
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 113
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->nameAsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 114
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->getAttributes()Ljava/util/Iterator;

    move-result-object v0

    .line 115
    .local v0, "ai":Ljava/util/Iterator;
    :goto_1b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_41

    .line 116
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1b

    .line 117
    :cond_41
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/StartElementEvent;->getNamespaces()Ljava/util/Iterator;

    move-result-object v1

    .line 118
    .local v1, "ni":Ljava/util/Iterator;
    :goto_45
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6b

    .line 119
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_45

    .line 121
    :cond_6b
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 122
    return-object v2
.end method
