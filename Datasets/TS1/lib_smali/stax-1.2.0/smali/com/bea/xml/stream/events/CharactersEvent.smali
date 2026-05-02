.class public Lcom/bea/xml/stream/events/CharactersEvent;
.super Lcom/bea/xml/stream/events/BaseEvent;
.source "CharactersEvent.java"

# interfaces
.implements Ljavax/xml/stream/events/Characters;


# instance fields
.field private data:Ljava/lang/String;

.field private isCData:Z

.field private isIgnorable:Z

.field private isSpace:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    .line 28
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isCData:Z

    .line 29
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isSpace:Z

    .line 30
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isIgnorable:Z

    .line 33
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/CharactersEvent;->init()V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    .line 28
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isCData:Z

    .line 29
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isSpace:Z

    .line 30
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isIgnorable:Z

    .line 37
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/CharactersEvent;->init()V

    .line 38
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/events/CharactersEvent;->setData(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "isCData"    # Z

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    .line 28
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isCData:Z

    .line 29
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isSpace:Z

    .line 30
    iput-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isIgnorable:Z

    .line 42
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/CharactersEvent;->init()V

    .line 43
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/events/CharactersEvent;->setData(Ljava/lang/String;)V

    .line 44
    iput-boolean p2, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isCData:Z

    .line 45
    return-void
.end method


# virtual methods
.method protected doWriteAsEncodedUnicode(Ljava/io/Writer;)V
    .registers 7
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    iget-boolean v4, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isCData:Z

    if-eqz v4, :cond_16

    .line 71
    const-string v4, "<![CDATA["

    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/CharactersEvent;->getData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 73
    const-string v4, "]]>"

    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 117
    :cond_15
    :goto_15
    return-void

    .line 75
    :cond_16
    invoke-virtual {p0}, Lcom/bea/xml/stream/events/CharactersEvent;->getData()Ljava/lang/String;

    move-result-object v1

    .line 76
    .local v1, "data":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    .line 78
    .local v3, "len":I
    if-lez v3, :cond_15

    .line 79
    const/4 v2, 0x0

    .line 83
    .local v2, "i":I
    :goto_21
    if-ge v2, v3, :cond_2d

    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    sparse-switch v4, :sswitch_data_5a

    .line 83
    add-int/lit8 v2, v2, 0x1

    goto :goto_21

    .line 92
    :cond_2d
    :sswitch_2d
    if-ne v2, v3, :cond_33

    .line 93
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_15

    .line 95
    :cond_33
    if-lez v2, :cond_39

    .line 96
    const/4 v4, 0x0

    invoke-virtual {p1, v1, v4, v2}, Ljava/io/Writer;->write(Ljava/lang/String;II)V

    .line 98
    :cond_39
    :goto_39
    if-ge v2, v3, :cond_15

    .line 99
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 100
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_68

    .line 111
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    .line 98
    :goto_45
    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 102
    :sswitch_48
    const-string v4, "&amp;"

    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_45

    .line 105
    :sswitch_4e
    const-string v4, "&lt;"

    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_45

    .line 108
    :sswitch_54
    const-string v4, "&gt;"

    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_45

    .line 84
    :sswitch_data_5a
    .sparse-switch
        0x26 -> :sswitch_2d
        0x3c -> :sswitch_2d
        0x3e -> :sswitch_2d
    .end sparse-switch

    .line 100
    :sswitch_data_68
    .sparse-switch
        0x26 -> :sswitch_48
        0x3c -> :sswitch_4e
        0x3e -> :sswitch_54
    .end sparse-switch
.end method

.method public getData()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->data:Ljava/lang/String;

    return-object v0
.end method

.method public getDataAsArray()[C
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->data:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    return-object v0
.end method

.method public hasData()Z
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->data:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 58
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/events/CharactersEvent;->setEventType(I)V

    return-void
.end method

.method public isCData()Z
    .registers 2

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isCData:Z

    return v0
.end method

.method public isIgnorableWhiteSpace()Z
    .registers 2

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isIgnorable:Z

    return v0
.end method

.method public isWhiteSpace()Z
    .registers 2

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isSpace:Z

    return v0
.end method

.method public setData(Ljava/lang/String;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/bea/xml/stream/events/CharactersEvent;->data:Ljava/lang/String;

    return-void
.end method

.method public setIgnorable(Z)V
    .registers 2
    .param p1, "ignorable"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isIgnorable:Z

    .line 57
    return-void
.end method

.method public setSpace(Z)V
    .registers 2
    .param p1, "space"    # Z

    .prologue
    .line 47
    iput-boolean p1, p0, Lcom/bea/xml/stream/events/CharactersEvent;->isSpace:Z

    .line 48
    return-void
.end method
