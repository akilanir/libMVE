.class public Lorg/apache/james/mime4j/parser/MimeStreamParser;
.super Ljava/lang/Object;
.source "MimeStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/james/mime4j/parser/MimeStreamParser$1;
    }
.end annotation


# instance fields
.field private contentDecoding:Z

.field private handler:Lorg/apache/james/mime4j/parser/ContentHandler;

.field private final mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 81
    new-instance v0, Lorg/apache/james/mime4j/stream/MimeTokenStream;

    new-instance v1, Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-direct {v1}, Lorg/apache/james/mime4j/stream/MimeConfig;-><init>()V

    invoke-direct {v0, v1, v2, v2}, Lorg/apache/james/mime4j/stream/MimeTokenStream;-><init>(Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V

    invoke-direct {p0, v0}, Lorg/apache/james/mime4j/parser/MimeStreamParser;-><init>(Lorg/apache/james/mime4j/stream/MimeTokenStream;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Lorg/apache/james/mime4j/stream/MimeConfig;)V
    .registers 3
    .param p1, "config"    # Lorg/apache/james/mime4j/stream/MimeConfig;

    .prologue
    const/4 v0, 0x0

    .line 77
    invoke-direct {p0, p1, v0, v0}, Lorg/apache/james/mime4j/parser/MimeStreamParser;-><init>(Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V
    .registers 6
    .param p1, "config"    # Lorg/apache/james/mime4j/stream/MimeConfig;
    .param p2, "monitor"    # Lorg/apache/james/mime4j/codec/DecodeMonitor;
    .param p3, "bodyDescBuilder"    # Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;

    .prologue
    .line 72
    new-instance v1, Lorg/apache/james/mime4j/stream/MimeTokenStream;

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Lorg/apache/james/mime4j/stream/MimeConfig;->clone()Lorg/apache/james/mime4j/stream/MimeConfig;

    move-result-object v0

    :goto_8
    invoke-direct {v1, v0, p2, p3}, Lorg/apache/james/mime4j/stream/MimeTokenStream;-><init>(Lorg/apache/james/mime4j/stream/MimeConfig;Lorg/apache/james/mime4j/codec/DecodeMonitor;Lorg/apache/james/mime4j/stream/BodyDescriptorBuilder;)V

    invoke-direct {p0, v1}, Lorg/apache/james/mime4j/parser/MimeStreamParser;-><init>(Lorg/apache/james/mime4j/stream/MimeTokenStream;)V

    .line 74
    return-void

    .line 72
    :cond_f
    new-instance v0, Lorg/apache/james/mime4j/stream/MimeConfig;

    invoke-direct {v0}, Lorg/apache/james/mime4j/stream/MimeConfig;-><init>()V

    goto :goto_8
.end method

.method public constructor <init>(Lorg/apache/james/mime4j/stream/MimeTokenStream;)V
    .registers 3
    .param p1, "tokenStream"    # Lorg/apache/james/mime4j/stream/MimeTokenStream;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    .line 64
    iput-object p1, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->contentDecoding:Z

    .line 66
    return-void
.end method


# virtual methods
.method public isContentDecoding()Z
    .registers 2

    .prologue
    .line 89
    iget-boolean v0, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->contentDecoding:Z

    return v0
.end method

.method public isRaw()Z
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v0}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->isRaw()Z

    move-result v0

    return v0
.end method

.method public parse(Ljava/io/InputStream;)V
    .registers 10
    .param p1, "instream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v5}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getConfig()Lorg/apache/james/mime4j/stream/MimeConfig;

    move-result-object v1

    .line 112
    .local v1, "config":Lorg/apache/james/mime4j/stream/MimeConfig;
    invoke-virtual {v1}, Lorg/apache/james/mime4j/stream/MimeConfig;->getHeadlessParsing()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_54

    .line 113
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v1}, Lorg/apache/james/mime4j/stream/MimeConfig;->getHeadlessParsing()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, p1, v6}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->parseHeadless(Ljava/io/InputStream;Ljava/lang/String;)Lorg/apache/james/mime4j/stream/Field;

    move-result-object v2

    .line 115
    .local v2, "contentType":Lorg/apache/james/mime4j/stream/Field;
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->startMessage()V

    .line 116
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->startHeader()V

    .line 117
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5, v2}, Lorg/apache/james/mime4j/parser/ContentHandler;->field(Lorg/apache/james/mime4j/stream/Field;)V

    .line 118
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->endHeader()V

    .line 123
    .end local v2    # "contentType":Lorg/apache/james/mime4j/stream/Field;
    :goto_2a
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v5}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getState()Lorg/apache/james/mime4j/stream/EntityState;

    move-result-object v4

    .line 124
    .local v4, "state":Lorg/apache/james/mime4j/stream/EntityState;
    sget-object v5, Lorg/apache/james/mime4j/parser/MimeStreamParser$1;->$SwitchMap$org$apache$james$mime4j$stream$EntityState:[I

    invoke-virtual {v4}, Lorg/apache/james/mime4j/stream/EntityState;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_e4

    .line 174
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid state: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 120
    .end local v4    # "state":Lorg/apache/james/mime4j/stream/EntityState;
    :cond_54
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v5, p1}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->parse(Ljava/io/InputStream;)V

    goto :goto_2a

    .line 126
    .restart local v4    # "state":Lorg/apache/james/mime4j/stream/EntityState;
    :pswitch_5a
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v5}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getBodyDescriptor()Lorg/apache/james/mime4j/stream/BodyDescriptor;

    move-result-object v3

    .line 128
    .local v3, "desc":Lorg/apache/james/mime4j/stream/BodyDescriptor;
    iget-boolean v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->contentDecoding:Z

    if-eqz v5, :cond_75

    .line 129
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v5}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getDecodedInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 133
    .local v0, "bodyContent":Ljava/io/InputStream;
    :goto_6a
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5, v3, v0}, Lorg/apache/james/mime4j/parser/ContentHandler;->body(Lorg/apache/james/mime4j/stream/BodyDescriptor;Ljava/io/InputStream;)V

    .line 176
    .end local v0    # "bodyContent":Ljava/io/InputStream;
    .end local v3    # "desc":Lorg/apache/james/mime4j/stream/BodyDescriptor;
    :goto_6f
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v5}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->next()Lorg/apache/james/mime4j/stream/EntityState;

    goto :goto_2a

    .line 131
    .restart local v3    # "desc":Lorg/apache/james/mime4j/stream/BodyDescriptor;
    :cond_75
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v5}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .restart local v0    # "bodyContent":Ljava/io/InputStream;
    goto :goto_6a

    .line 136
    .end local v0    # "bodyContent":Ljava/io/InputStream;
    .end local v3    # "desc":Lorg/apache/james/mime4j/stream/BodyDescriptor;
    :pswitch_7c
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->endBodyPart()V

    goto :goto_6f

    .line 139
    :pswitch_82
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->endHeader()V

    goto :goto_6f

    .line 142
    :pswitch_88
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->endMessage()V

    goto :goto_6f

    .line 145
    :pswitch_8e
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->endMultipart()V

    goto :goto_6f

    .line 150
    :pswitch_94
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    iget-object v6, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/james/mime4j/parser/ContentHandler;->epilogue(Ljava/io/InputStream;)V

    goto :goto_6f

    .line 153
    :pswitch_a0
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    iget-object v6, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getField()Lorg/apache/james/mime4j/stream/Field;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/james/mime4j/parser/ContentHandler;->field(Lorg/apache/james/mime4j/stream/Field;)V

    goto :goto_6f

    .line 156
    :pswitch_ac
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    iget-object v6, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/james/mime4j/parser/ContentHandler;->preamble(Ljava/io/InputStream;)V

    goto :goto_6f

    .line 159
    :pswitch_b8
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    iget-object v6, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/james/mime4j/parser/ContentHandler;->raw(Ljava/io/InputStream;)V

    goto :goto_6f

    .line 162
    :pswitch_c4
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->startBodyPart()V

    goto :goto_6f

    .line 165
    :pswitch_ca
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->startHeader()V

    goto :goto_6f

    .line 168
    :pswitch_d0
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    invoke-interface {v5}, Lorg/apache/james/mime4j/parser/ContentHandler;->startMessage()V

    goto :goto_6f

    .line 171
    :pswitch_d6
    iget-object v5, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    iget-object v6, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v6}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->getBodyDescriptor()Lorg/apache/james/mime4j/stream/BodyDescriptor;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/james/mime4j/parser/ContentHandler;->startMultipart(Lorg/apache/james/mime4j/stream/BodyDescriptor;)V

    goto :goto_6f

    .line 178
    :pswitch_e2
    return-void

    .line 124
    nop

    :pswitch_data_e4
    .packed-switch 0x1
        :pswitch_5a
        :pswitch_7c
        :pswitch_82
        :pswitch_88
        :pswitch_8e
        :pswitch_e2
        :pswitch_94
        :pswitch_a0
        :pswitch_ac
        :pswitch_b8
        :pswitch_c4
        :pswitch_ca
        :pswitch_d0
        :pswitch_d6
    .end packed-switch
.end method

.method public setContentDecoding(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 97
    iput-boolean p1, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->contentDecoding:Z

    .line 98
    return-void
.end method

.method public setContentHandler(Lorg/apache/james/mime4j/parser/ContentHandler;)V
    .registers 2
    .param p1, "h"    # Lorg/apache/james/mime4j/parser/ContentHandler;

    .prologue
    .line 241
    iput-object p1, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->handler:Lorg/apache/james/mime4j/parser/ContentHandler;

    .line 242
    return-void
.end method

.method public setFlat()V
    .registers 3

    .prologue
    .line 207
    iget-object v0, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    sget-object v1, Lorg/apache/james/mime4j/stream/RecursionMode;->M_FLAT:Lorg/apache/james/mime4j/stream/RecursionMode;

    invoke-virtual {v0, v1}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->setRecursionMode(Lorg/apache/james/mime4j/stream/RecursionMode;)V

    .line 208
    return-void
.end method

.method public setRaw()V
    .registers 3

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    sget-object v1, Lorg/apache/james/mime4j/stream/RecursionMode;->M_RAW:Lorg/apache/james/mime4j/stream/RecursionMode;

    invoke-virtual {v0, v1}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->setRecursionMode(Lorg/apache/james/mime4j/stream/RecursionMode;)V

    .line 200
    return-void
.end method

.method public setRecurse()V
    .registers 3

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    sget-object v1, Lorg/apache/james/mime4j/stream/RecursionMode;->M_RECURSE:Lorg/apache/james/mime4j/stream/RecursionMode;

    invoke-virtual {v0, v1}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->setRecursionMode(Lorg/apache/james/mime4j/stream/RecursionMode;)V

    .line 216
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/james/mime4j/parser/MimeStreamParser;->mimeTokenStream:Lorg/apache/james/mime4j/stream/MimeTokenStream;

    invoke-virtual {v0}, Lorg/apache/james/mime4j/stream/MimeTokenStream;->stop()V

    .line 232
    return-void
.end method
