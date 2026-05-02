.class public Lcom/bea/xml/stream/events/EntityReferenceEvent;
.super Lcom/bea/xml/stream/events/BaseEvent;
.source "EntityReferenceEvent.java"

# interfaces
.implements Ljavax/xml/stream/events/EntityReference;


# instance fields
.field private ed:Ljavax/xml/stream/events/EntityDeclaration;

.field private name:Ljava/lang/String;

.field private replacementText:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    invoke-virtual {p0}, Lcom/bea/xml/stream/events/EntityReferenceEvent;->init()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljavax/xml/stream/events/EntityDeclaration;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ed"    # Ljavax/xml/stream/events/EntityDeclaration;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    .line 32
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/EntityReferenceEvent;->init()V

    .line 33
    iput-object p1, p0, Lcom/bea/xml/stream/events/EntityReferenceEvent;->name:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/bea/xml/stream/events/EntityReferenceEvent;->ed:Ljavax/xml/stream/events/EntityDeclaration;

    .line 35
    return-void
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
    .line 65
    const/16 v0, 0x26

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    .line 66
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/EntityReferenceEvent;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 67
    const/16 v0, 0x3b

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    .line 68
    return-void
.end method

.method public getBaseURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 49
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDeclaration()Ljavax/xml/stream/events/EntityDeclaration;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/bea/xml/stream/events/EntityReferenceEvent;->ed:Ljavax/xml/stream/events/EntityDeclaration;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/bea/xml/stream/events/EntityReferenceEvent;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPublicId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    const/4 v0, 0x0

    return-object v0
.end method

.method public getReplacementText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/bea/xml/stream/events/EntityReferenceEvent;->ed:Ljavax/xml/stream/events/EntityDeclaration;

    invoke-interface {v0}, Ljavax/xml/stream/events/EntityDeclaration;->getReplacementText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSystemId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    const/4 v0, 0x0

    return-object v0
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 60
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/events/EntityReferenceEvent;->setEventType(I)V

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/bea/xml/stream/events/EntityReferenceEvent;->name:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setReplacementText(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/bea/xml/stream/events/EntityReferenceEvent;->replacementText:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 75
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/EntityReferenceEvent;->getReplacementText()Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "replacement":Ljava/lang/String;
    if-nez v0, :cond_8

    const-string v0, ""

    .line 77
    :cond_8
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "&"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lcom/bea/xml/stream/events/EntityReferenceEvent;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ":=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
