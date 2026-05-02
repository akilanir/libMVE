.class public Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;
.super Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;
.source "DefaultBHttpServerConnection.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpServerConnection;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final requestParser:Lcz/msebera/android/httpclient/io/HttpMessageParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/io/HttpMessageParser",
            "<",
            "Lcz/msebera/android/httpclient/HttpRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final responseWriter:Lcz/msebera/android/httpclient/io/HttpMessageWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/io/HttpMessageWriter",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .registers 12
    .param p1, "buffersize"    # I

    .prologue
    const/4 v3, 0x0

    .line 114
    move-object v0, p0

    move v1, p1

    move v2, p1

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    move-object v8, v3

    move-object v9, v3

    invoke-direct/range {v0 .. v9}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lcz/msebera/android/httpclient/config/MessageConstraints;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;)V

    .line 115
    return-void
.end method

.method public constructor <init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lcz/msebera/android/httpclient/config/MessageConstraints;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;)V
    .registers 19
    .param p1, "buffersize"    # I
    .param p2, "fragmentSizeHint"    # I
    .param p3, "chardecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p4, "charencoder"    # Ljava/nio/charset/CharsetEncoder;
    .param p5, "constraints"    # Lcz/msebera/android/httpclient/config/MessageConstraints;
    .param p6, "incomingContentStrategy"    # Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;
    .param p7, "outgoingContentStrategy"    # Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/nio/charset/CharsetDecoder;",
            "Ljava/nio/charset/CharsetEncoder;",
            "Lcz/msebera/android/httpclient/config/MessageConstraints;",
            "Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;",
            "Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;",
            "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory",
            "<",
            "Lcz/msebera/android/httpclient/HttpRequest;",
            ">;",
            "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 96
    .local p8, "requestParserFactory":Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory<Lcz/msebera/android/httpclient/HttpRequest;>;"
    .local p9, "responseWriterFactory":Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory<Lcz/msebera/android/httpclient/HttpResponse;>;"
    if-eqz p6, :cond_2b

    move-object v7, p6

    :goto_3
    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lcz/msebera/android/httpclient/config/MessageConstraints;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;)V

    .line 99
    if-eqz p8, :cond_2e

    .line 100
    .end local p8    # "requestParserFactory":Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory<Lcz/msebera/android/httpclient/HttpRequest;>;"
    :goto_10
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->getSessionInputBuffer()Lcz/msebera/android/httpclient/io/SessionInputBuffer;

    move-result-object v1

    move-object/from16 v0, p8

    invoke-interface {v0, v1, p5}, Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;->create(Lcz/msebera/android/httpclient/io/SessionInputBuffer;Lcz/msebera/android/httpclient/config/MessageConstraints;)Lcz/msebera/android/httpclient/io/HttpMessageParser;

    move-result-object v1

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->requestParser:Lcz/msebera/android/httpclient/io/HttpMessageParser;

    .line 101
    if-eqz p9, :cond_31

    .line 102
    .end local p9    # "responseWriterFactory":Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory<Lcz/msebera/android/httpclient/HttpResponse;>;"
    :goto_1e
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->getSessionOutputBuffer()Lcz/msebera/android/httpclient/io/SessionOutputBuffer;

    move-result-object v1

    move-object/from16 v0, p9

    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;->create(Lcz/msebera/android/httpclient/io/SessionOutputBuffer;)Lcz/msebera/android/httpclient/io/HttpMessageWriter;

    move-result-object v1

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->responseWriter:Lcz/msebera/android/httpclient/io/HttpMessageWriter;

    .line 103
    return-void

    .line 96
    .restart local p8    # "requestParserFactory":Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory<Lcz/msebera/android/httpclient/HttpRequest;>;"
    .restart local p9    # "responseWriterFactory":Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory<Lcz/msebera/android/httpclient/HttpResponse;>;"
    :cond_2b
    sget-object v7, Lcz/msebera/android/httpclient/impl/entity/DisallowIdentityContentLengthStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/entity/DisallowIdentityContentLengthStrategy;

    goto :goto_3

    .line 99
    :cond_2e
    sget-object p8, Lcz/msebera/android/httpclient/impl/io/DefaultHttpRequestParserFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/io/DefaultHttpRequestParserFactory;

    goto :goto_10

    .line 101
    .end local p8    # "requestParserFactory":Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory<Lcz/msebera/android/httpclient/HttpRequest;>;"
    :cond_31
    sget-object p9, Lcz/msebera/android/httpclient/impl/io/DefaultHttpResponseWriterFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/io/DefaultHttpResponseWriterFactory;

    goto :goto_1e
.end method

.method public constructor <init>(ILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lcz/msebera/android/httpclient/config/MessageConstraints;)V
    .registers 15
    .param p1, "buffersize"    # I
    .param p2, "chardecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p3, "charencoder"    # Ljava/nio/charset/CharsetEncoder;
    .param p4, "constraints"    # Lcz/msebera/android/httpclient/config/MessageConstraints;

    .prologue
    const/4 v6, 0x0

    .line 110
    move-object v0, p0

    move v1, p1

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v7, v6

    move-object v8, v6

    move-object v9, v6

    invoke-direct/range {v0 .. v9}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;-><init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lcz/msebera/android/httpclient/config/MessageConstraints;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;)V

    .line 111
    return-void
.end method


# virtual methods
.method public bind(Ljava/net/Socket;)V
    .registers 2
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-super {p0, p1}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->bind(Ljava/net/Socket;)V

    .line 126
    return-void
.end method

.method public flush()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 171
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->doFlush()V

    .line 172
    return-void
.end method

.method protected onRequestReceived(Lcz/msebera/android/httpclient/HttpRequest;)V
    .registers 2
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;

    .prologue
    .line 118
    return-void
.end method

.method protected onResponseSubmitted(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 2
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 121
    return-void
.end method

.method public receiveRequestEntity(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V
    .registers 4
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    const-string v1, "HTTP request"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 141
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->prepareInput(Lcz/msebera/android/httpclient/HttpMessage;)Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 142
    .local v0, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    invoke-interface {p1, v0}, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;->setEntity(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 143
    return-void
.end method

.method public receiveRequestHeader()Lcz/msebera/android/httpclient/HttpRequest;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 131
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->requestParser:Lcz/msebera/android/httpclient/io/HttpMessageParser;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/io/HttpMessageParser;->parse()Lcz/msebera/android/httpclient/HttpMessage;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpRequest;

    .line 132
    .local v0, "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->onRequestReceived(Lcz/msebera/android/httpclient/HttpRequest;)V

    .line 133
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->incrementRequestCount()V

    .line 134
    return-object v0
.end method

.method public sendResponseEntity(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 5
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    const-string v2, "HTTP response"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 160
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 161
    .local v0, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    if-nez v0, :cond_f

    .line 167
    :goto_e
    return-void

    .line 164
    :cond_f
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->prepareOutput(Lcz/msebera/android/httpclient/HttpMessage;)Ljava/io/OutputStream;

    move-result-object v1

    .line 165
    .local v1, "outstream":Ljava/io/OutputStream;
    invoke-interface {v0, v1}, Lcz/msebera/android/httpclient/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 166
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    goto :goto_e
.end method

.method public sendResponseHeader(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 4
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    const-string v0, "HTTP response"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 148
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->ensureOpen()V

    .line 149
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->responseWriter:Lcz/msebera/android/httpclient/io/HttpMessageWriter;

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/io/HttpMessageWriter;->write(Lcz/msebera/android/httpclient/HttpMessage;)V

    .line 150
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->onResponseSubmitted(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 151
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-lt v0, v1, :cond_1f

    .line 152
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/DefaultBHttpServerConnection;->incrementResponseCount()V

    .line 154
    :cond_1f
    return-void
.end method
