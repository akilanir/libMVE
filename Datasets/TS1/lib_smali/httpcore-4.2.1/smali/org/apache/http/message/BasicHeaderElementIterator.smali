.class public Lorg/apache/http/message/BasicHeaderElementIterator;
.super Ljava/lang/Object;
.source "BasicHeaderElementIterator.java"

# interfaces
.implements Lorg/apache/http/HeaderElementIterator;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private buffer:Lorg/apache/http/util/CharArrayBuffer;

.field private currentElement:Lorg/apache/http/HeaderElement;

.field private cursor:Lorg/apache/http/message/ParserCursor;

.field private final headerIt:Lorg/apache/http/HeaderIterator;

.field private final parser:Lorg/apache/http/message/HeaderValueParser;


# direct methods
.method public constructor <init>(Lorg/apache/http/HeaderIterator;)V
    .registers 3
    .param p1, "headerIterator"    # Lorg/apache/http/HeaderIterator;

    .prologue
    .line 73
    sget-object v0, Lorg/apache/http/message/BasicHeaderValueParser;->DEFAULT:Lorg/apache/http/message/BasicHeaderValueParser;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/message/BasicHeaderElementIterator;-><init>(Lorg/apache/http/HeaderIterator;Lorg/apache/http/message/HeaderValueParser;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/HeaderIterator;Lorg/apache/http/message/HeaderValueParser;)V
    .registers 5
    .param p1, "headerIterator"    # Lorg/apache/http/HeaderIterator;
    .param p2, "parser"    # Lorg/apache/http/message/HeaderValueParser;

    .prologue
    const/4 v0, 0x0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object v0, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/http/HeaderElement;

    .line 52
    iput-object v0, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    .line 53
    iput-object v0, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    .line 61
    if-nez p1, :cond_14

    .line 62
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Header iterator may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_14
    if-nez p2, :cond_1e

    .line 65
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parser may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_1e
    iput-object p1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    .line 68
    iput-object p2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->parser:Lorg/apache/http/message/HeaderValueParser;

    .line 69
    return-void
.end method

.method private bufferHeaderValue()V
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 78
    iput-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    .line 79
    iput-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    .line 80
    :cond_6
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    invoke-interface {v2}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_39

    .line 81
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    invoke-interface {v2}, Lorg/apache/http/HeaderIterator;->nextHeader()Lorg/apache/http/Header;

    move-result-object v0

    .line 82
    .local v0, "h":Lorg/apache/http/Header;
    instance-of v2, v0, Lorg/apache/http/FormattedHeader;

    if-eqz v2, :cond_3a

    move-object v2, v0

    .line 83
    check-cast v2, Lorg/apache/http/FormattedHeader;

    invoke-interface {v2}, Lorg/apache/http/FormattedHeader;->getBuffer()Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    .line 84
    new-instance v2, Lorg/apache/http/message/ParserCursor;

    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v3}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v3

    invoke-direct {v2, v4, v3}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    iput-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    .line 85
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    check-cast v0, Lorg/apache/http/FormattedHeader;

    .end local v0    # "h":Lorg/apache/http/Header;
    invoke-interface {v0}, Lorg/apache/http/FormattedHeader;->getValuePos()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/apache/http/message/ParserCursor;->updatePos(I)V

    .line 97
    :cond_39
    :goto_39
    return-void

    .line 88
    .restart local v0    # "h":Lorg/apache/http/Header;
    :cond_3a
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_6

    .line 90
    new-instance v2, Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v2, v3}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    iput-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    .line 91
    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v2, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 92
    new-instance v2, Lorg/apache/http/message/ParserCursor;

    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v3}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v3

    invoke-direct {v2, v4, v3}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    iput-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    goto :goto_39
.end method

.method private parseNextElement()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 101
    :cond_1
    :goto_1
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->headerIt:Lorg/apache/http/HeaderIterator;

    invoke-interface {v1}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_d

    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    if-eqz v1, :cond_44

    .line 102
    :cond_d
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    if-eqz v1, :cond_19

    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    invoke-virtual {v1}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 104
    :cond_19
    invoke-direct {p0}, Lorg/apache/http/message/BasicHeaderElementIterator;->bufferHeaderValue()V

    .line 107
    :cond_1c
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    if-eqz v1, :cond_1

    .line 109
    :cond_20
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    invoke-virtual {v1}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v1

    if-nez v1, :cond_45

    .line 110
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->parser:Lorg/apache/http/message/HeaderValueParser;

    iget-object v2, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    iget-object v3, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    invoke-interface {v1, v2, v3}, Lorg/apache/http/message/HeaderValueParser;->parseHeaderElement(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)Lorg/apache/http/HeaderElement;

    move-result-object v0

    .line 111
    .local v0, "e":Lorg/apache/http/HeaderElement;
    invoke-interface {v0}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_42

    invoke-interface {v0}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_20

    .line 113
    :cond_42
    iput-object v0, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/http/HeaderElement;

    .line 125
    .end local v0    # "e":Lorg/apache/http/HeaderElement;
    :cond_44
    return-void

    .line 118
    :cond_45
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    invoke-virtual {v1}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 120
    iput-object v4, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->cursor:Lorg/apache/http/message/ParserCursor;

    .line 121
    iput-object v4, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->buffer:Lorg/apache/http/util/CharArrayBuffer;

    goto :goto_1
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/http/HeaderElement;

    if-nez v0, :cond_7

    .line 129
    invoke-direct {p0}, Lorg/apache/http/message/BasicHeaderElementIterator;->parseNextElement()V

    .line 131
    :cond_7
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/http/HeaderElement;

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public final next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-virtual {p0}, Lorg/apache/http/message/BasicHeaderElementIterator;->nextElement()Lorg/apache/http/HeaderElement;

    move-result-object v0

    return-object v0
.end method

.method public nextElement()Lorg/apache/http/HeaderElement;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/http/HeaderElement;

    if-nez v1, :cond_7

    .line 136
    invoke-direct {p0}, Lorg/apache/http/message/BasicHeaderElementIterator;->parseNextElement()V

    .line 139
    :cond_7
    iget-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/http/HeaderElement;

    if-nez v1, :cond_13

    .line 140
    new-instance v1, Ljava/util/NoSuchElementException;

    const-string v2, "No more header elements available"

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 143
    :cond_13
    iget-object v0, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/http/HeaderElement;

    .line 144
    .local v0, "element":Lorg/apache/http/HeaderElement;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/http/HeaderElement;

    .line 145
    return-object v0
.end method

.method public remove()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 153
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Remove not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
