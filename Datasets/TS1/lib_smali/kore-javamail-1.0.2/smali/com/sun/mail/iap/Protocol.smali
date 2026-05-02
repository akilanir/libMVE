.class public Lcom/sun/mail/iap/Protocol;
.super Ljava/lang/Object;
.source "Protocol.java"


# static fields
.field private static final CRLF:[B


# instance fields
.field private final handlers:Ljava/util/Vector;

.field protected host:Ljava/lang/String;

.field private volatile input:Lcom/sun/mail/iap/ResponseInputStream;

.field private localHostName:Ljava/lang/String;

.field protected logger:Lcom/sun/mail/util/MailLogger;

.field private volatile output:Ljava/io/DataOutputStream;

.field protected prefix:Ljava/lang/String;

.field protected props:Ljava/util/Properties;

.field protected quote:Z

.field private socket:Ljava/net/Socket;

.field private tagCounter:I

.field private volatile timestamp:J

.field private traceInput:Lcom/sun/mail/util/TraceInputStream;

.field protected traceLogger:Lcom/sun/mail/util/MailLogger;

.field private traceOutput:Lcom/sun/mail/util/TraceOutputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 91
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/iap/Protocol;->CRLF:[B

    return-void

    nop

    :array_a
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/util/Properties;Z)V
    .registers 9
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/PrintStream;
    .param p3, "props"    # Ljava/util/Properties;
    .param p4, "debug"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput v1, p0, Lcom/sun/mail/iap/Protocol;->tagCounter:I

    .line 87
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->handlers:Ljava/util/Vector;

    .line 157
    const-string v0, "localhost"

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->host:Ljava/lang/String;

    .line 158
    iput-object p3, p0, Lcom/sun/mail/iap/Protocol;->props:Ljava/util/Properties;

    .line 159
    iput-boolean v1, p0, Lcom/sun/mail/iap/Protocol;->quote:Z

    .line 160
    new-instance v0, Lcom/sun/mail/util/MailLogger;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "DEBUG"

    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v0, v1, v2, p4, v3}, Lcom/sun/mail/util/MailLogger;-><init>(Ljava/lang/Class;Ljava/lang/String;ZLjava/io/PrintStream;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    .line 161
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v1, "protocol"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/sun/mail/util/MailLogger;->getSubLogger(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    .line 164
    new-instance v0, Lcom/sun/mail/util/TraceInputStream;

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    invoke-direct {v0, p1, v1}, Lcom/sun/mail/util/TraceInputStream;-><init>(Ljava/io/InputStream;Lcom/sun/mail/util/MailLogger;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    .line 165
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    iget-boolean v1, p0, Lcom/sun/mail/iap/Protocol;->quote:Z

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/TraceInputStream;->setQuote(Z)V

    .line 166
    new-instance v0, Lcom/sun/mail/iap/ResponseInputStream;

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/ResponseInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->input:Lcom/sun/mail/iap/ResponseInputStream;

    .line 168
    new-instance v0, Lcom/sun/mail/util/TraceOutputStream;

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    invoke-direct {v0, p2, v1}, Lcom/sun/mail/util/TraceOutputStream;-><init>(Ljava/io/OutputStream;Lcom/sun/mail/util/MailLogger;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    .line 169
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    iget-boolean v1, p0, Lcom/sun/mail/iap/Protocol;->quote:Z

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/TraceOutputStream;->setQuote(Z)V

    .line 170
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v1, Ljava/io/BufferedOutputStream;

    iget-object v2, p0, Lcom/sun/mail/iap/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->output:Ljava/io/DataOutputStream;

    .line 172
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sun/mail/iap/Protocol;->timestamp:J

    .line 173
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/util/Properties;Ljava/lang/String;ZLcom/sun/mail/util/MailLogger;)V
    .registers 10
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "props"    # Ljava/util/Properties;
    .param p4, "prefix"    # Ljava/lang/String;
    .param p5, "isSSL"    # Z
    .param p6, "logger"    # Lcom/sun/mail/util/MailLogger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput v1, p0, Lcom/sun/mail/iap/Protocol;->tagCounter:I

    .line 87
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->handlers:Ljava/util/Vector;

    .line 109
    const/4 v0, 0x0

    .line 111
    .local v0, "connected":Z
    :try_start_e
    iput-object p1, p0, Lcom/sun/mail/iap/Protocol;->host:Ljava/lang/String;

    .line 112
    iput-object p3, p0, Lcom/sun/mail/iap/Protocol;->props:Ljava/util/Properties;

    .line 113
    iput-object p4, p0, Lcom/sun/mail/iap/Protocol;->prefix:Ljava/lang/String;

    .line 114
    iput-object p6, p0, Lcom/sun/mail/iap/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    .line 115
    const-string v1, "protocol"

    const/4 v2, 0x0

    invoke-virtual {p6, v1, v2}, Lcom/sun/mail/util/MailLogger;->getSubLogger(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    .line 117
    invoke-static {p1, p2, p3, p4, p5}, Lcom/sun/mail/util/SocketFetcher;->getSocket(Ljava/lang/String;ILjava/util/Properties;Ljava/lang/String;Z)Ljava/net/Socket;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    .line 118
    const-string v1, "mail.debug.quote"

    const/4 v2, 0x0

    invoke-static {p3, v1, v2}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/sun/mail/iap/Protocol;->quote:Z

    .line 121
    invoke-direct {p0}, Lcom/sun/mail/iap/Protocol;->initStreams()V

    .line 124
    invoke-virtual {p0}, Lcom/sun/mail/iap/Protocol;->readResponse()Lcom/sun/mail/iap/Response;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/sun/mail/iap/Protocol;->processGreeting(Lcom/sun/mail/iap/Response;)V

    .line 126
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/sun/mail/iap/Protocol;->timestamp:J
    :try_end_3e
    .catchall {:try_start_e .. :try_end_3e} :catchall_45

    .line 128
    const/4 v0, 0x1

    .line 136
    if-nez v0, :cond_44

    .line 137
    invoke-virtual {p0}, Lcom/sun/mail/iap/Protocol;->disconnect()V

    .line 139
    :cond_44
    return-void

    .line 136
    :catchall_45
    move-exception v1

    if-nez v0, :cond_4b

    .line 137
    invoke-virtual {p0}, Lcom/sun/mail/iap/Protocol;->disconnect()V

    :cond_4b
    throw v1
.end method

.method private commandEnd()V
    .registers 1

    .prologue
    .line 517
    return-void
.end method

.method private commandStart(Ljava/lang/String;)V
    .registers 2
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 516
    return-void
.end method

.method private initStreams()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    new-instance v0, Lcom/sun/mail/util/TraceInputStream;

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/TraceInputStream;-><init>(Ljava/io/InputStream;Lcom/sun/mail/util/MailLogger;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    .line 143
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    iget-boolean v1, p0, Lcom/sun/mail/iap/Protocol;->quote:Z

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/TraceInputStream;->setQuote(Z)V

    .line 144
    new-instance v0, Lcom/sun/mail/iap/ResponseInputStream;

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/ResponseInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->input:Lcom/sun/mail/iap/ResponseInputStream;

    .line 146
    new-instance v0, Lcom/sun/mail/util/TraceOutputStream;

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    .line 147
    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    iget-object v2, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    invoke-direct {v0, v1, v2}, Lcom/sun/mail/util/TraceOutputStream;-><init>(Ljava/io/OutputStream;Lcom/sun/mail/util/MailLogger;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    .line 148
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    iget-boolean v1, p0, Lcom/sun/mail/iap/Protocol;->quote:Z

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/TraceOutputStream;->setQuote(Z)V

    .line 149
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v1, Ljava/io/BufferedOutputStream;

    iget-object v2, p0, Lcom/sun/mail/iap/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->output:Ljava/io/DataOutputStream;

    .line 150
    return-void
.end method


# virtual methods
.method public addResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V
    .registers 3
    .param p1, "h"    # Lcom/sun/mail/iap/ResponseHandler;

    .prologue
    .line 187
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->handlers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 188
    return-void
.end method

.method public declared-synchronized command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;
    .registers 15
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "args"    # Lcom/sun/mail/iap/Argument;

    .prologue
    .line 294
    monitor-enter p0

    :try_start_1
    invoke-direct {p0, p1}, Lcom/sun/mail/iap/Protocol;->commandStart(Ljava/lang/String;)V

    .line 295
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_6b

    .line 296
    .local v9, "v":Ljava/util/Vector;
    const/4 v1, 0x0

    .line 297
    .local v1, "done":Z
    const/4 v8, 0x0

    .line 298
    .local v8, "tag":Ljava/lang/String;
    const/4 v6, 0x0

    .line 302
    .local v6, "r":Lcom/sun/mail/iap/Response;
    :try_start_c
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/iap/Protocol;->writeCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)Ljava/lang/String;
    :try_end_f
    .catch Lcom/sun/mail/iap/LiteralException; {:try_start_c .. :try_end_f} :catch_1f
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_f} :catch_29
    .catchall {:try_start_c .. :try_end_f} :catchall_6b

    move-result-object v8

    .line 312
    :goto_10
    const/4 v0, 0x0

    .line 313
    .local v0, "byeResp":Lcom/sun/mail/iap/Response;
    :cond_11
    :goto_11
    if-nez v1, :cond_36

    .line 315
    :try_start_13
    invoke-virtual {p0}, Lcom/sun/mail/iap/Protocol;->readResponse()Lcom/sun/mail/iap/Response;
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_16} :catch_33
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_13 .. :try_end_16} :catch_54
    .catchall {:try_start_13 .. :try_end_16} :catchall_6b

    move-result-object v6

    .line 325
    :goto_17
    :try_start_17
    invoke-virtual {v6}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v10

    if-eqz v10, :cond_56

    .line 326
    move-object v0, v6

    .line 327
    goto :goto_11

    .line 303
    .end local v0    # "byeResp":Lcom/sun/mail/iap/Response;
    :catch_1f
    move-exception v4

    .line 304
    .local v4, "lex":Lcom/sun/mail/iap/LiteralException;
    invoke-virtual {v4}, Lcom/sun/mail/iap/LiteralException;->getResponse()Lcom/sun/mail/iap/Response;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 305
    const/4 v1, 0x1

    .line 310
    goto :goto_10

    .line 306
    .end local v4    # "lex":Lcom/sun/mail/iap/LiteralException;
    :catch_29
    move-exception v2

    .line 308
    .local v2, "ex":Ljava/lang/Exception;
    invoke-static {v2}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 309
    const/4 v1, 0x1

    goto :goto_10

    .line 316
    .end local v2    # "ex":Ljava/lang/Exception;
    .restart local v0    # "byeResp":Lcom/sun/mail/iap/Response;
    :catch_33
    move-exception v3

    .line 317
    .local v3, "ioex":Ljava/io/IOException;
    if-eqz v0, :cond_4f

    .line 337
    .end local v3    # "ioex":Ljava/io/IOException;
    :cond_36
    if-eqz v0, :cond_3b

    .line 338
    invoke-virtual {v9, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 339
    :cond_3b
    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v10

    new-array v7, v10, [Lcom/sun/mail/iap/Response;

    .line 340
    .local v7, "responses":[Lcom/sun/mail/iap/Response;
    invoke-virtual {v9, v7}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 341
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iput-wide v10, p0, Lcom/sun/mail/iap/Protocol;->timestamp:J

    .line 342
    invoke-direct {p0}, Lcom/sun/mail/iap/Protocol;->commandEnd()V
    :try_end_4d
    .catchall {:try_start_17 .. :try_end_4d} :catchall_6b

    .line 343
    monitor-exit p0

    return-object v7

    .line 320
    .end local v7    # "responses":[Lcom/sun/mail/iap/Response;
    .restart local v3    # "ioex":Ljava/io/IOException;
    :cond_4f
    :try_start_4f
    invoke-static {v3}, Lcom/sun/mail/iap/Response;->byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;

    move-result-object v6

    .line 323
    goto :goto_17

    .line 321
    .end local v3    # "ioex":Ljava/io/IOException;
    :catch_54
    move-exception v5

    .line 322
    .local v5, "pex":Lcom/sun/mail/iap/ProtocolException;
    goto :goto_11

    .line 330
    .end local v5    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :cond_56
    invoke-virtual {v9, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 333
    invoke-virtual {v6}, Lcom/sun/mail/iap/Response;->isTagged()Z

    move-result v10

    if-eqz v10, :cond_11

    invoke-virtual {v6}, Lcom/sun/mail/iap/Response;->getTag()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_66
    .catchall {:try_start_4f .. :try_end_66} :catchall_6b

    move-result v10

    if-eqz v10, :cond_11

    .line 334
    const/4 v1, 0x1

    goto :goto_11

    .line 294
    .end local v0    # "byeResp":Lcom/sun/mail/iap/Response;
    .end local v1    # "done":Z
    .end local v6    # "r":Lcom/sun/mail/iap/Response;
    .end local v8    # "tag":Ljava/lang/String;
    .end local v9    # "v":Ljava/util/Vector;
    :catchall_6b
    move-exception v10

    monitor-exit p0

    throw v10
.end method

.method protected declared-synchronized disconnect()V
    .registers 2

    .prologue
    .line 427
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_f

    if-eqz v0, :cond_d

    .line 429
    :try_start_5
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_a} :catch_12
    .catchall {:try_start_5 .. :try_end_a} :catchall_f

    .line 433
    :goto_a
    const/4 v0, 0x0

    :try_start_b
    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;
    :try_end_d
    .catchall {:try_start_b .. :try_end_d} :catchall_f

    .line 435
    :cond_d
    monitor-exit p0

    return-void

    .line 427
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0

    .line 430
    :catch_12
    move-exception v0

    goto :goto_a
.end method

.method protected finalize()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 509
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 510
    invoke-virtual {p0}, Lcom/sun/mail/iap/Protocol;->disconnect()V

    .line 511
    return-void
.end method

.method public getChannel()Ljava/nio/channels/SocketChannel;
    .registers 2

    .prologue
    .line 420
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getChannel()Ljava/nio/channels/SocketChannel;

    move-result-object v0

    return-object v0
.end method

.method public getInetAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 411
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method protected getInputStream()Lcom/sun/mail/iap/ResponseInputStream;
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->input:Lcom/sun/mail/iap/ResponseInputStream;

    return-object v0
.end method

.method protected declared-synchronized getLocalHost()Ljava/lang/String;
    .registers 5

    .prologue
    .line 445
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_2a

    .line 446
    :cond_d
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->props:Ljava/util/Properties;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sun/mail/iap/Protocol;->prefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".localhost"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 447
    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    .line 448
    :cond_2a
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    if-eqz v1, :cond_36

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_53

    .line 449
    :cond_36
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->props:Ljava/util/Properties;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sun/mail/iap/Protocol;->prefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".localaddress"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 450
    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;
    :try_end_53
    .catchall {:try_start_1 .. :try_end_53} :catchall_d7

    .line 452
    :cond_53
    :try_start_53
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    if-eqz v1, :cond_5f

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_8c

    .line 453
    :cond_5f
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v0

    .line 454
    .local v0, "localHost":Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    .line 456
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    if-nez v1, :cond_8c

    .line 458
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;
    :try_end_8c
    .catch Ljava/net/UnknownHostException; {:try_start_53 .. :try_end_8c} :catch_da
    .catchall {:try_start_53 .. :try_end_8c} :catchall_d7

    .line 464
    .end local v0    # "localHost":Ljava/net/InetAddress;
    :cond_8c
    :goto_8c
    :try_start_8c
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    if-eqz v1, :cond_98

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_d3

    .line 465
    :cond_98
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    if-eqz v1, :cond_d3

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->isBound()Z

    move-result v1

    if-eqz v1, :cond_d3

    .line 466
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 467
    .restart local v0    # "localHost":Ljava/net/InetAddress;
    invoke-virtual {v0}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    .line 469
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    if-nez v1, :cond_d3

    .line 471
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;

    .line 474
    .end local v0    # "localHost":Ljava/net/InetAddress;
    :cond_d3
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->localHostName:Ljava/lang/String;
    :try_end_d5
    .catchall {:try_start_8c .. :try_end_d5} :catchall_d7

    monitor-exit p0

    return-object v1

    .line 445
    :catchall_d7
    move-exception v1

    monitor-exit p0

    throw v1

    .line 460
    :catch_da
    move-exception v1

    goto :goto_8c
.end method

.method protected getOutputStream()Ljava/io/OutputStream;
    .registers 2

    .prologue
    .line 239
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->output:Ljava/io/DataOutputStream;

    return-object v0
.end method

.method protected getResponseBuffer()Lcom/sun/mail/iap/ByteArray;
    .registers 2

    .prologue
    .line 263
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTimestamp()J
    .registers 3

    .prologue
    .line 180
    iget-wide v0, p0, Lcom/sun/mail/iap/Protocol;->timestamp:J

    return-wide v0
.end method

.method public handleResult(Lcom/sun/mail/iap/Response;)V
    .registers 3
    .param p1, "response"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 350
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isOK()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 360
    :cond_6
    return-void

    .line 352
    :cond_7
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isNO()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 353
    new-instance v0, Lcom/sun/mail/iap/CommandFailedException;

    invoke-direct {v0, p1}, Lcom/sun/mail/iap/CommandFailedException;-><init>(Lcom/sun/mail/iap/Response;)V

    throw v0

    .line 354
    :cond_13
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBAD()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 355
    new-instance v0, Lcom/sun/mail/iap/BadCommandException;

    invoke-direct {v0, p1}, Lcom/sun/mail/iap/BadCommandException;-><init>(Lcom/sun/mail/iap/Response;)V

    throw v0

    .line 356
    :cond_1f
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 357
    invoke-virtual {p0}, Lcom/sun/mail/iap/Protocol;->disconnect()V

    .line 358
    new-instance v0, Lcom/sun/mail/iap/ConnectionException;

    invoke-direct {v0, p0, p1}, Lcom/sun/mail/iap/ConnectionException;-><init>(Lcom/sun/mail/iap/Protocol;Lcom/sun/mail/iap/Response;)V

    throw v0
.end method

.method public isSSL()Z
    .registers 2

    .prologue
    .line 401
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    return v0
.end method

.method protected isTracing()Z
    .registers 3

    .prologue
    .line 481
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method public notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V
    .registers 7
    .param p1, "responses"    # [Lcom/sun/mail/iap/Response;

    .prologue
    .line 201
    iget-object v4, p0, Lcom/sun/mail/iap/Protocol;->handlers:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-nez v4, :cond_9

    .line 221
    :cond_8
    return-void

    .line 204
    :cond_9
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v4, p1

    if-ge v1, v4, :cond_8

    .line 205
    aget-object v3, p1, v1

    .line 208
    .local v3, "r":Lcom/sun/mail/iap/Response;
    if-nez v3, :cond_14

    .line 204
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 213
    :cond_14
    iget-object v4, p0, Lcom/sun/mail/iap/Protocol;->handlers:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->toArray()[Ljava/lang/Object;

    move-result-object v0

    .line 216
    .local v0, "h":[Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1b
    array-length v4, v0

    if-ge v2, v4, :cond_11

    .line 217
    aget-object v4, v0, v2

    if-eqz v4, :cond_29

    .line 218
    aget-object v4, v0, v2

    check-cast v4, Lcom/sun/mail/iap/ResponseHandler;

    invoke-interface {v4, v3}, Lcom/sun/mail/iap/ResponseHandler;->handleResponse(Lcom/sun/mail/iap/Response;)V

    .line 216
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b
.end method

.method protected processGreeting(Lcom/sun/mail/iap/Response;)V
    .registers 3
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 224
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->isBYE()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 225
    new-instance v0, Lcom/sun/mail/iap/ConnectionException;

    invoke-direct {v0, p0, p1}, Lcom/sun/mail/iap/ConnectionException;-><init>(Lcom/sun/mail/iap/Protocol;Lcom/sun/mail/iap/Response;)V

    throw v0

    .line 226
    :cond_c
    return-void
.end method

.method public readResponse()Lcom/sun/mail/iap/Response;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 252
    new-instance v0, Lcom/sun/mail/iap/Response;

    invoke-direct {v0, p0}, Lcom/sun/mail/iap/Response;-><init>(Lcom/sun/mail/iap/Protocol;)V

    return-object v0
.end method

.method public removeResponseHandler(Lcom/sun/mail/iap/ResponseHandler;)V
    .registers 3
    .param p1, "h"    # Lcom/sun/mail/iap/ResponseHandler;

    .prologue
    .line 194
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->handlers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 195
    return-void
.end method

.method protected resumeTracing()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 499
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 500
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceInputStream;->setTrace(Z)V

    .line 501
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceOutputStream;->setTrace(Z)V

    .line 503
    :cond_15
    return-void
.end method

.method public simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V
    .registers 5
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "args"    # Lcom/sun/mail/iap/Argument;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 369
    invoke-virtual {p0, p1, p2}, Lcom/sun/mail/iap/Protocol;->command(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)[Lcom/sun/mail/iap/Response;

    move-result-object v0

    .line 372
    .local v0, "r":[Lcom/sun/mail/iap/Response;
    invoke-virtual {p0, v0}, Lcom/sun/mail/iap/Protocol;->notifyResponseHandlers([Lcom/sun/mail/iap/Response;)V

    .line 375
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    invoke-virtual {p0, v1}, Lcom/sun/mail/iap/Protocol;->handleResult(Lcom/sun/mail/iap/Response;)V

    .line 376
    return-void
.end method

.method public declared-synchronized startTLS(Ljava/lang/String;)V
    .registers 6
    .param p1, "cmd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 387
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_1f

    if-eqz v0, :cond_9

    .line 392
    :goto_7
    monitor-exit p0

    return-void

    .line 389
    :cond_9
    const/4 v0, 0x0

    :try_start_a
    invoke-virtual {p0, p1, v0}, Lcom/sun/mail/iap/Protocol;->simpleCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)V

    .line 390
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->host:Ljava/lang/String;

    iget-object v2, p0, Lcom/sun/mail/iap/Protocol;->props:Ljava/util/Properties;

    iget-object v3, p0, Lcom/sun/mail/iap/Protocol;->prefix:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/sun/mail/util/SocketFetcher;->startTLS(Ljava/net/Socket;Ljava/lang/String;Ljava/util/Properties;Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/iap/Protocol;->socket:Ljava/net/Socket;

    .line 391
    invoke-direct {p0}, Lcom/sun/mail/iap/Protocol;->initStreams()V
    :try_end_1e
    .catchall {:try_start_a .. :try_end_1e} :catchall_1f

    goto :goto_7

    .line 387
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized supportsNonSyncLiterals()Z
    .registers 2

    .prologue
    .line 247
    monitor-enter p0

    const/4 v0, 0x0

    monitor-exit p0

    return v0
.end method

.method protected suspendTracing()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 489
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 490
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceInputStream;->setTrace(Z)V

    .line 491
    iget-object v0, p0, Lcom/sun/mail/iap/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceOutputStream;->setTrace(Z)V

    .line 493
    :cond_15
    return-void
.end method

.method public writeCommand(Ljava/lang/String;Lcom/sun/mail/iap/Argument;)Ljava/lang/String;
    .registers 7
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "args"    # Lcom/sun/mail/iap/Argument;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 270
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "A"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/sun/mail/iap/Protocol;->tagCounter:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/sun/mail/iap/Protocol;->tagCounter:I

    const/16 v3, 0xa

    invoke-static {v2, v3}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 272
    .local v0, "tag":Ljava/lang/String;
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->output:Ljava/io/DataOutputStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 274
    if-eqz p2, :cond_47

    .line 275
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->output:Ljava/io/DataOutputStream;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->write(I)V

    .line 276
    invoke-virtual {p2, p0}, Lcom/sun/mail/iap/Argument;->write(Lcom/sun/mail/iap/Protocol;)V

    .line 279
    :cond_47
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->output:Ljava/io/DataOutputStream;

    sget-object v2, Lcom/sun/mail/iap/Protocol;->CRLF:[B

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->write([B)V

    .line 280
    iget-object v1, p0, Lcom/sun/mail/iap/Protocol;->output:Ljava/io/DataOutputStream;

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 281
    return-object v0
.end method
