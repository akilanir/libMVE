.class public Lcom/bea/xml/stream/events/DTDEvent;
.super Lcom/bea/xml/stream/events/BaseEvent;
.source "DTDEvent.java"

# interfaces
.implements Ljavax/xml/stream/events/DTD;


# instance fields
.field private dtd:Ljava/lang/String;

.field private entities:Ljava/util/List;

.field private notations:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    invoke-virtual {p0}, Lcom/bea/xml/stream/events/DTDEvent;->init()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "dtd"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    .line 42
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/DTDEvent;->init()V

    .line 43
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/events/DTDEvent;->setDTD(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public static createEntityDeclaration(Lcom/wutka/dtd/DTDEntity;)Ljavax/xml/stream/events/EntityDeclaration;
    .registers 4
    .param p0, "dtdEntity"    # Lcom/wutka/dtd/DTDEntity;

    .prologue
    .line 50
    new-instance v0, Lcom/bea/xml/stream/events/EntityDeclarationEvent;

    invoke-virtual {p0}, Lcom/wutka/dtd/DTDEntity;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/wutka/dtd/DTDEntity;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/bea/xml/stream/events/EntityDeclarationEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static createNotationDeclaration(Lcom/wutka/dtd/DTDNotation;)Ljavax/xml/stream/events/NotationDeclaration;
    .registers 6
    .param p0, "dtdNotation"    # Lcom/wutka/dtd/DTDNotation;

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDNotation;->getExternalID()Lcom/wutka/dtd/DTDExternalID;

    move-result-object v0

    .line 56
    .local v0, "extId":Lcom/wutka/dtd/DTDExternalID;
    invoke-virtual {v0}, Lcom/wutka/dtd/DTDExternalID;->getSystem()Ljava/lang/String;

    move-result-object v2

    .line 57
    .local v2, "systemId":Ljava/lang/String;
    instance-of v3, v0, Lcom/wutka/dtd/DTDPublic;

    if-eqz v3, :cond_1c

    check-cast v0, Lcom/wutka/dtd/DTDPublic;

    .end local v0    # "extId":Lcom/wutka/dtd/DTDExternalID;
    invoke-virtual {v0}, Lcom/wutka/dtd/DTDPublic;->getPub()Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "publicId":Ljava/lang/String;
    :goto_12
    new-instance v3, Lcom/bea/xml/stream/events/NotationDeclarationEvent;

    invoke-virtual {p0}, Lcom/wutka/dtd/DTDNotation;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1, v2}, Lcom/bea/xml/stream/events/NotationDeclarationEvent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 57
    .end local v1    # "publicId":Ljava/lang/String;
    .restart local v0    # "extId":Lcom/wutka/dtd/DTDExternalID;
    :cond_1c
    const/4 v1, 0x0

    goto :goto_12
.end method


# virtual methods
.method protected doWriteAsEncodedUnicode(Ljava/io/Writer;)V
    .registers 3
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    const-string v0, "<!DOCTYPE "

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 93
    iget-object v0, p0, Lcom/bea/xml/stream/events/DTDEvent;->dtd:Ljava/lang/String;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/bea/xml/stream/events/DTDEvent;->dtd:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_20

    .line 94
    const/16 v0, 0x5b

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    .line 95
    iget-object v0, p0, Lcom/bea/xml/stream/events/DTDEvent;->dtd:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 96
    const/16 v0, 0x5d

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    .line 98
    :cond_20
    const/16 v0, 0x3e

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    .line 99
    return-void
.end method

.method public getDocumentTypeDeclaration()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/bea/xml/stream/events/DTDEvent;->dtd:Ljava/lang/String;

    return-object v0
.end method

.method public getEntities()Ljava/util/List;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/bea/xml/stream/events/DTDEvent;->entities:Ljava/util/List;

    return-object v0
.end method

.method public getNotations()Ljava/util/List;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/bea/xml/stream/events/DTDEvent;->notations:Ljava/util/List;

    return-object v0
.end method

.method public getProcessedDTD()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x0

    return-object v0
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 46
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/events/DTDEvent;->setEventType(I)V

    return-void
.end method

.method public setDTD(Ljava/lang/String;)V
    .registers 2
    .param p1, "dtd"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/bea/xml/stream/events/DTDEvent;->dtd:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setEntities(Ljava/util/List;)V
    .registers 2
    .param p1, "l"    # Ljava/util/List;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/bea/xml/stream/events/DTDEvent;->entities:Ljava/util/List;

    .line 73
    return-void
.end method

.method public setNotations(Ljava/util/List;)V
    .registers 2
    .param p1, "l"    # Ljava/util/List;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/bea/xml/stream/events/DTDEvent;->notations:Ljava/util/List;

    .line 69
    return-void
.end method
