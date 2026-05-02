.class public Lcom/bea/xml/stream/SubReader;
.super Lcom/bea/xml/stream/ReaderDelegate;
.source "SubReader.java"


# instance fields
.field private depth:I

.field private open:Z


# direct methods
.method public constructor <init>(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 36
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/ReaderDelegate;-><init>(Ljavax/xml/stream/XMLStreamReader;)V

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Lcom/bea/xml/stream/SubReader;->depth:I

    .line 32
    iput-boolean v1, p0, Lcom/bea/xml/stream/SubReader;->open:Z

    .line 37
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->isStartElement()Z

    move-result v0

    if-nez v0, :cond_17

    .line 38
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "Unable to instantiate a subReader because the underlying reader was not on a start element."

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_17
    iput-boolean v1, p0, Lcom/bea/xml/stream/SubReader;->open:Z

    .line 42
    iget v0, p0, Lcom/bea/xml/stream/SubReader;->depth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bea/xml/stream/SubReader;->depth:I

    .line 43
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 6
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 159
    new-instance v0, Lcom/bea/xml/stream/MXParser;

    invoke-direct {v0}, Lcom/bea/xml/stream/MXParser;-><init>()V

    .line 160
    .local v0, "r":Lcom/bea/xml/stream/MXParser;
    new-instance v2, Ljava/io/FileReader;

    const/4 v3, 0x0

    aget-object v3, p0, v3

    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/bea/xml/stream/MXParser;->setInput(Ljava/io/Reader;)V

    .line 161
    invoke-virtual {v0}, Lcom/bea/xml/stream/MXParser;->moveToStartElement()Z

    invoke-virtual {v0}, Lcom/bea/xml/stream/MXParser;->next()I

    .line 162
    :goto_16
    invoke-virtual {v0}, Lcom/bea/xml/stream/MXParser;->moveToStartElement()Z

    move-result v2

    if-eqz v2, :cond_41

    .line 163
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "SE->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lcom/bea/xml/stream/MXParser;->getName()Ljavax/xml/namespace/QName;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v0}, Lcom/bea/xml/stream/MXParser;->subReader()Ljavax/xml/stream/XMLStreamReader;

    move-result-object v1

    .line 165
    .local v1, "subr":Ljavax/xml/stream/XMLStreamReader;
    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/bea/xml/stream/SubReader;->sub(Ljavax/xml/stream/XMLStreamReader;I)V

    goto :goto_16

    .line 167
    .end local v1    # "subr":Ljavax/xml/stream/XMLStreamReader;
    :cond_41
    return-void
.end method

.method public static print(Ljavax/xml/stream/XMLStreamReader;I)V
    .registers 5
    .param p0, "r"    # Ljavax/xml/stream/XMLStreamReader;
    .param p1, "depth"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 145
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "]Sub: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v2

    invoke-static {v2}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 146
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasName()Z

    move-result v0

    if-eqz v0, :cond_4d

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 149
    :goto_4c
    return-void

    .line 147
    :cond_4d
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasText()Z

    move-result v0

    if-eqz v0, :cond_76

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "->["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4c

    .line 148
    :cond_76
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    goto :goto_4c
.end method

.method public static sub(Ljavax/xml/stream/XMLStreamReader;I)V
    .registers 3
    .param p0, "r"    # Ljavax/xml/stream/XMLStreamReader;
    .param p1, "depth"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 152
    :goto_0
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 153
    invoke-static {p0, p1}, Lcom/bea/xml/stream/SubReader;->print(Ljavax/xml/stream/XMLStreamReader;I)V

    .line 154
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->next()I

    goto :goto_0

    .line 156
    :cond_d
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 68
    iget-boolean v0, p0, Lcom/bea/xml/stream/SubReader;->open:Z

    if-nez v0, :cond_6

    const/4 v0, 0x0

    .line 69
    :goto_5
    return v0

    :cond_6
    invoke-super {p0}, Lcom/bea/xml/stream/ReaderDelegate;->hasNext()Z

    move-result v0

    goto :goto_5
.end method

.method public moveToEndElement()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 111
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->isEndElement()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 117
    :goto_7
    return v0

    .line 115
    :cond_8
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->next()I

    .line 112
    :cond_b
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 113
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->isEndElement()Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_7

    .line 117
    :cond_18
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public moveToEndElement(Ljava/lang/String;)Z
    .registers 4
    .param p1, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 123
    if-nez p1, :cond_7

    .line 129
    :cond_3
    :goto_3
    return v0

    .line 127
    :cond_4
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->next()I

    .line 124
    :cond_7
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->moveToEndElement()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 125
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v0, 0x1

    goto :goto_3

    .line 126
    :cond_19
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_3
.end method

.method public moveToEndElement(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 135
    if-eqz p1, :cond_5

    if-nez p2, :cond_9

    .line 141
    :cond_5
    :goto_5
    return v0

    .line 139
    :cond_6
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->next()I

    .line 136
    :cond_9
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/SubReader;->moveToEndElement(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 137
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const/4 v0, 0x1

    goto :goto_5

    .line 138
    :cond_1b
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->hasNext()Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_5
.end method

.method public moveToStartElement()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 75
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->isStartElement()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 81
    :goto_7
    return v0

    .line 79
    :cond_8
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->next()I

    .line 76
    :cond_b
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 77
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->isStartElement()Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_7

    .line 81
    :cond_18
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public moveToStartElement(Ljava/lang/String;)Z
    .registers 4
    .param p1, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 87
    if-nez p1, :cond_7

    .line 93
    :cond_3
    :goto_3
    return v0

    .line 91
    :cond_4
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->next()I

    .line 88
    :cond_7
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->moveToStartElement()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 89
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_19

    const/4 v0, 0x1

    goto :goto_3

    .line 90
    :cond_19
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_3
.end method

.method public moveToStartElement(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "namespaceUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 99
    if-eqz p1, :cond_5

    if-nez p2, :cond_9

    .line 105
    :cond_5
    :goto_5
    return v0

    .line 103
    :cond_6
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->next()I

    .line 100
    :cond_9
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/SubReader;->moveToStartElement(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 101
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    const/4 v0, 0x1

    goto :goto_5

    .line 102
    :cond_1b
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->hasNext()Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_5
.end method

.method public next()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 48
    iget v1, p0, Lcom/bea/xml/stream/SubReader;->depth:I

    if-gtz v1, :cond_7

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/bea/xml/stream/SubReader;->open:Z

    .line 49
    :cond_7
    invoke-super {p0}, Lcom/bea/xml/stream/ReaderDelegate;->next()I

    move-result v0

    .line 50
    .local v0, "type":I
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->isStartElement()Z

    move-result v1

    if-eqz v1, :cond_17

    iget v1, p0, Lcom/bea/xml/stream/SubReader;->depth:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bea/xml/stream/SubReader;->depth:I

    .line 51
    :cond_17
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->isEndElement()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 52
    iget v1, p0, Lcom/bea/xml/stream/SubReader;->depth:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/bea/xml/stream/SubReader;->depth:I

    .line 54
    :cond_23
    return v0
.end method

.method public nextElement()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->next()I

    .line 61
    :goto_3
    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->isStartElement()Z

    move-result v0

    if-nez v0, :cond_19

    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->isEndElement()Z

    move-result v0

    if-nez v0, :cond_19

    invoke-virtual {p0}, Lcom/bea/xml/stream/SubReader;->next()I

    goto :goto_3

    .line 62
    :cond_19
    invoke-super {p0}, Lcom/bea/xml/stream/ReaderDelegate;->getEventType()I

    move-result v0

    return v0
.end method
