.class public abstract Lcom/bea/xml/stream/events/BaseEvent;
.super Ljava/lang/Object;
.source "BaseEvent.java"

# interfaces
.implements Ljavax/xml/stream/events/XMLEvent;
.implements Ljavax/xml/stream/Location;


# instance fields
.field private characterOffset:I

.field private column:I

.field private eventType:I

.field private line:I

.field private locationURI:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    .line 36
    iput v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->line:I

    .line 37
    iput v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->column:I

    .line 38
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->characterOffset:I

    .line 40
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "type"    # I

    .prologue
    const/4 v0, -0x1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    .line 36
    iput v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->line:I

    .line 37
    iput v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->column:I

    .line 38
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->characterOffset:I

    .line 42
    iput p1, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    .line 43
    return-void
.end method


# virtual methods
.method public asCharacters()Ljavax/xml/stream/events/Characters;
    .registers 1

    .prologue
    .line 106
    check-cast p0, Ljavax/xml/stream/events/Characters;

    .end local p0    # "this":Lcom/bea/xml/stream/events/BaseEvent;
    return-object p0
.end method

.method public asEndElement()Ljavax/xml/stream/events/EndElement;
    .registers 1

    .prologue
    .line 103
    check-cast p0, Ljavax/xml/stream/events/EndElement;

    .end local p0    # "this":Lcom/bea/xml/stream/events/BaseEvent;
    return-object p0
.end method

.method public asStartElement()Ljavax/xml/stream/events/StartElement;
    .registers 1

    .prologue
    .line 100
    check-cast p0, Ljavax/xml/stream/events/StartElement;

    .end local p0    # "this":Lcom/bea/xml/stream/events/BaseEvent;
    return-object p0
.end method

.method protected abstract doWriteAsEncodedUnicode(Ljava/io/Writer;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation
.end method

.method public getCharacterOffset()I
    .registers 2

    .prologue
    .line 95
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->characterOffset:I

    return v0
.end method

.method public getColumnNumber()I
    .registers 2

    .prologue
    .line 93
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->column:I

    return v0
.end method

.method public getEventType()I
    .registers 2

    .prologue
    .line 45
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    return v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 91
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->line:I

    return v0
.end method

.method public getLocation()Ljavax/xml/stream/Location;
    .registers 1

    .prologue
    .line 82
    return-object p0
.end method

.method public getLocationURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->locationURI:Ljava/lang/String;

    return-object v0
.end method

.method public getPublicId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSchemaType()Ljavax/xml/namespace/QName;
    .registers 2

    .prologue
    .line 110
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSourceName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSystemId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTypeAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    invoke-static {v0}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAttribute()Z
    .registers 3

    .prologue
    .line 75
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isCharacters()Z
    .registers 3

    .prologue
    .line 66
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public isEndDocument()Z
    .registers 3

    .prologue
    .line 72
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isEndElement()Z
    .registers 3

    .prologue
    .line 57
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public isEntityReference()Z
    .registers 3

    .prologue
    .line 60
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isNamespace()Z
    .registers 3

    .prologue
    .line 78
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    const/16 v1, 0xd

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isProcessingInstruction()Z
    .registers 3

    .prologue
    .line 63
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public isStartDocument()Z
    .registers 3

    .prologue
    .line 69
    iget v0, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public isStartElement()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 54
    iget v1, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    if-ne v1, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public recycle()V
    .registers 1

    .prologue
    .line 109
    return-void
.end method

.method public setCharacterOffset(I)V
    .registers 2
    .param p1, "c"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/bea/xml/stream/events/BaseEvent;->characterOffset:I

    return-void
.end method

.method public setColumnNumber(I)V
    .registers 2
    .param p1, "col"    # I

    .prologue
    .line 94
    iput p1, p0, Lcom/bea/xml/stream/events/BaseEvent;->column:I

    return-void
.end method

.method protected setEventType(I)V
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/bea/xml/stream/events/BaseEvent;->eventType:I

    .line 49
    return-void
.end method

.method public setLineNumber(I)V
    .registers 2
    .param p1, "line"    # I

    .prologue
    .line 92
    iput p1, p0, Lcom/bea/xml/stream/events/BaseEvent;->line:I

    return-void
.end method

.method public setLocationURI(Ljava/lang/String;)V
    .registers 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/bea/xml/stream/events/BaseEvent;->locationURI:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 130
    new-instance v1, Ljava/io/StringWriter;

    const/16 v2, 0x40

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 132
    .local v1, "sw":Ljava/io/StringWriter;
    :try_start_7
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/events/BaseEvent;->writeAsEncodedUnicode(Ljava/io/Writer;)V
    :try_end_a
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_7 .. :try_end_a} :catch_f

    .line 138
    :goto_a
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 133
    :catch_f
    move-exception v0

    .line 134
    .local v0, "e":Ljavax/xml/stream/XMLStreamException;
    const-string v2, "[ERROR: "

    invoke-virtual {v1, v2}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 135
    invoke-virtual {v0}, Ljavax/xml/stream/XMLStreamException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 136
    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    goto :goto_a
.end method

.method public final writeAsEncodedUnicode(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 116
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/events/BaseEvent;->doWriteAsEncodedUnicode(Ljava/io/Writer;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 120
    return-void

    .line 117
    :catch_4
    move-exception v0

    .line 118
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v1, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
