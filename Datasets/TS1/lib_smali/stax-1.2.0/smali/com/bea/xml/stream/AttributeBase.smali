.class public Lcom/bea/xml/stream/AttributeBase;
.super Ljava/lang/Object;
.source "AttributeBase.java"

# interfaces
.implements Ljavax/xml/stream/events/Attribute;
.implements Ljavax/xml/stream/Location;


# instance fields
.field private attributeType:Ljavax/xml/namespace/QName;

.field private characterOffset:I

.field private column:I

.field private eventType:I

.field private line:I

.field private locationURI:Ljava/lang/String;

.field private name:Ljavax/xml/namespace/QName;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->eventType:I

    .line 38
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->line:I

    .line 39
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->column:I

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->characterOffset:I

    .line 58
    if-nez p1, :cond_11

    const-string p1, ""

    .line 59
    :cond_11
    new-instance v0, Ljavax/xml/namespace/QName;

    const-string v1, ""

    invoke-direct {v0, v1, p2, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    .line 60
    iput-object p3, p0, Lcom/bea/xml/stream/AttributeBase;->value:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;
    .param p5, "attributeType"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->eventType:I

    .line 38
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->line:I

    .line 39
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->column:I

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->characterOffset:I

    .line 47
    if-nez p1, :cond_11

    const-string p1, ""

    .line 49
    :cond_11
    new-instance v0, Ljavax/xml/namespace/QName;

    invoke-direct {v0, p2, p3, p1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    .line 50
    iput-object p4, p0, Lcom/bea/xml/stream/AttributeBase;->value:Ljava/lang/String;

    .line 51
    new-instance v0, Ljavax/xml/namespace/QName;

    invoke-direct {v0, p5}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->attributeType:Ljavax/xml/namespace/QName;

    .line 52
    return-void
.end method

.method public constructor <init>(Ljavax/xml/namespace/QName;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljavax/xml/namespace/QName;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->eventType:I

    .line 38
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->line:I

    .line 39
    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->column:I

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/AttributeBase;->characterOffset:I

    .line 65
    iput-object p1, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    .line 66
    iput-object p2, p0, Lcom/bea/xml/stream/AttributeBase;->value:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public static writeEncodedChar(Ljava/io/Writer;C)V
    .registers 3
    .param p0, "writer"    # Ljava/io/Writer;
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    const-string v0, "&#"

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 197
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 198
    const/16 v0, 0x3b

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    .line 199
    return-void
.end method


# virtual methods
.method public asCharacters()Ljavax/xml/stream/events/Characters;
    .registers 3

    .prologue
    .line 116
    new-instance v0, Ljava/lang/ClassCastException;

    const-string v1, "cannnot cast AttributeBase to Characters"

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public asEndElement()Ljavax/xml/stream/events/EndElement;
    .registers 3

    .prologue
    .line 115
    new-instance v0, Ljava/lang/ClassCastException;

    const-string v1, "cannnot cast AttributeBase to EndElement"

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public asStartElement()Ljavax/xml/stream/events/StartElement;
    .registers 3

    .prologue
    .line 114
    new-instance v0, Ljava/lang/ClassCastException;

    const-string v1, "cannnot cast AttributeBase to StartElement"

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCharacterOffset()I
    .registers 2

    .prologue
    .line 79
    iget v0, p0, Lcom/bea/xml/stream/AttributeBase;->characterOffset:I

    return v0
.end method

.method public getColumnNumber()I
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lcom/bea/xml/stream/AttributeBase;->column:I

    return v0
.end method

.method public getDTDType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    const-string v0, "CDATA"

    return-object v0
.end method

.method public getEventType()I
    .registers 2

    .prologue
    .line 84
    const/16 v0, 0xa

    return v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 75
    iget v0, p0, Lcom/bea/xml/stream/AttributeBase;->line:I

    return v0
.end method

.method public getLocalName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocation()Ljavax/xml/stream/Location;
    .registers 1

    .prologue
    .line 113
    return-object p0
.end method

.method public getLocationURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->locationURI:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljavax/xml/namespace/QName;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPublicId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 110
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSchemaType()Ljavax/xml/namespace/QName;
    .registers 2

    .prologue
    .line 120
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSourceName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 119
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSystemId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    const/4 v0, 0x0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hasName()Z
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isAttribute()Z
    .registers 2

    .prologue
    .line 104
    const/4 v0, 0x1

    return v0
.end method

.method public isCharacters()Z
    .registers 2

    .prologue
    .line 103
    const/4 v0, 0x0

    return v0
.end method

.method public isDefault()Z
    .registers 2

    .prologue
    .line 118
    const/4 v0, 0x1

    return v0
.end method

.method public isEndDocument()Z
    .registers 2

    .prologue
    .line 107
    const/4 v0, 0x0

    return v0
.end method

.method public isEndElement()Z
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method public isEndEntity()Z
    .registers 2

    .prologue
    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public isEntityReference()Z
    .registers 2

    .prologue
    .line 101
    const/4 v0, 0x0

    return v0
.end method

.method public isNamespace()Z
    .registers 2

    .prologue
    .line 105
    const/4 v0, 0x0

    return v0
.end method

.method public isNamespaceDeclaration()Z
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x0

    return v0
.end method

.method public isProcessingInstruction()Z
    .registers 2

    .prologue
    .line 102
    const/4 v0, 0x0

    return v0
.end method

.method public isSpecified()Z
    .registers 2

    .prologue
    .line 98
    const/4 v0, 0x1

    return v0
.end method

.method public isStartDocument()Z
    .registers 2

    .prologue
    .line 106
    const/4 v0, 0x0

    return v0
.end method

.method public isStartElement()Z
    .registers 2

    .prologue
    .line 99
    const/4 v0, 0x0

    return v0
.end method

.method public isStartEntity()Z
    .registers 2

    .prologue
    .line 109
    const/4 v0, 0x0

    return v0
.end method

.method public recycle()V
    .registers 1

    .prologue
    .line 117
    return-void
.end method

.method public setCharacterOffset(I)V
    .registers 2
    .param p1, "c"    # I

    .prologue
    .line 80
    iput p1, p0, Lcom/bea/xml/stream/AttributeBase;->characterOffset:I

    return-void
.end method

.method public setColumnNumber(I)V
    .registers 2
    .param p1, "col"    # I

    .prologue
    .line 78
    iput p1, p0, Lcom/bea/xml/stream/AttributeBase;->column:I

    return-void
.end method

.method public setLineNumber(I)V
    .registers 2
    .param p1, "line"    # I

    .prologue
    .line 76
    iput p1, p0, Lcom/bea/xml/stream/AttributeBase;->line:I

    return-void
.end method

.method public setLocationURI(Ljava/lang/String;)V
    .registers 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/bea/xml/stream/AttributeBase;->locationURI:Ljava/lang/String;

    return-void
.end method

.method public setNamespaceURI(Ljava/lang/String;)V
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 92
    new-instance v0, Ljavax/xml/namespace/QName;

    iget-object v1, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 70
    iget-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_62

    iget-object v0, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_62

    .line 72
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "[\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\']:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/AttributeBase;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 73
    :goto_61
    return-object v0

    :cond_62
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/bea/xml/stream/AttributeBase;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_61
.end method

.method public writeAsEncodedUnicode(Ljava/io/Writer;)V
    .registers 10
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x20

    .line 126
    :try_start_2
    iget-object v6, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v6}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v5

    .line 127
    .local v5, "prefix":Ljava/lang/String;
    if-eqz v5, :cond_18

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_18

    .line 128
    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 129
    const/16 v6, 0x3a

    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 131
    :cond_18
    iget-object v6, p0, Lcom/bea/xml/stream/AttributeBase;->name:Ljavax/xml/namespace/QName;

    invoke-virtual {v6}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 133
    const-string v6, "=\""

    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 134
    iget-object v1, p0, Lcom/bea/xml/stream/AttributeBase;->value:Ljava/lang/String;

    .line 135
    .local v1, "data":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    .line 137
    .local v4, "len":I
    if-lez v4, :cond_3f

    .line 138
    const/4 v3, 0x0

    .line 142
    .local v3, "i":I
    :goto_2f
    if-ge v3, v4, :cond_3a

    .line 143
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 144
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_7c

    .line 150
    if-ge v0, v7, :cond_45

    .line 157
    .end local v0    # "c":C
    :cond_3a
    :sswitch_3a
    if-ne v3, v4, :cond_48

    .line 158
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 186
    .end local v3    # "i":I
    :cond_3f
    const/16 v6, 0x22

    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 190
    return-void

    .line 142
    .restart local v0    # "c":C
    .restart local v3    # "i":I
    :cond_45
    add-int/lit8 v3, v3, 0x1

    goto :goto_2f

    .line 160
    .end local v0    # "c":C
    :cond_48
    if-lez v3, :cond_4e

    .line 161
    const/4 v6, 0x0

    invoke-virtual {p1, v1, v6, v3}, Ljava/io/Writer;->write(Ljava/lang/String;II)V

    .line 163
    :cond_4e
    :goto_4e
    if-ge v3, v4, :cond_3f

    .line 164
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 165
    .restart local v0    # "c":C
    sparse-switch v0, :sswitch_data_8a

    .line 176
    if-ge v0, v7, :cond_78

    .line 177
    invoke-static {p1, v0}, Lcom/bea/xml/stream/AttributeBase;->writeEncodedChar(Ljava/io/Writer;C)V

    .line 163
    :goto_5c
    add-int/lit8 v3, v3, 0x1

    goto :goto_4e

    .line 167
    :sswitch_5f
    const-string v6, "&amp;"

    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_64} :catch_65

    goto :goto_5c

    .line 187
    .end local v0    # "c":C
    .end local v1    # "data":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v5    # "prefix":Ljava/lang/String;
    :catch_65
    move-exception v2

    .line 188
    .local v2, "e":Ljava/io/IOException;
    new-instance v6, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v6, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 170
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "c":C
    .restart local v1    # "data":Ljava/lang/String;
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    .restart local v5    # "prefix":Ljava/lang/String;
    :sswitch_6c
    :try_start_6c
    const-string v6, "&lt;"

    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_5c

    .line 173
    :sswitch_72
    const-string v6, "&quot;"

    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_5c

    .line 179
    :cond_78
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_7b} :catch_65

    goto :goto_5c

    .line 144
    :sswitch_data_7c
    .sparse-switch
        0x22 -> :sswitch_3a
        0x26 -> :sswitch_3a
        0x3c -> :sswitch_3a
    .end sparse-switch

    .line 165
    :sswitch_data_8a
    .sparse-switch
        0x22 -> :sswitch_72
        0x26 -> :sswitch_5f
        0x3c -> :sswitch_6c
    .end sparse-switch
.end method
