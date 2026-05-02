.class Lcom/sun/mail/pop3/Protocol;
.super Ljava/lang/Object;
.source "Protocol.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final CRLF:Ljava/lang/String; = "\r\n"

.field private static final POP3_PORT:I = 0x6e

.field private static final SLOP:I = 0x80

.field private static digits:[C


# instance fields
.field private apopChallenge:Ljava/lang/String;

.field private capabilities:Ljava/util/Map;

.field private host:Ljava/lang/String;

.field private input:Ljava/io/DataInputStream;

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private noauthdebug:Z

.field private output:Ljava/io/PrintWriter;

.field private pipelining:Z

.field private prefix:Ljava/lang/String;

.field private props:Ljava/util/Properties;

.field private socket:Ljava/net/Socket;

.field private traceInput:Lcom/sun/mail/util/TraceInputStream;

.field private traceLogger:Lcom/sun/mail/util/MailLogger;

.field private traceOutput:Lcom/sun/mail/util/TraceOutputStream;

.field private traceSuspended:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    const-class v0, Lcom/sun/mail/pop3/Protocol;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/pop3/Protocol;->$assertionsDisabled:Z

    .line 318
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_18

    sput-object v0, Lcom/sun/mail/pop3/Protocol;->digits:[C

    return-void

    .line 66
    :cond_15
    const/4 v0, 0x0

    goto :goto_9

    .line 318
    nop

    :array_18
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method constructor <init>(Ljava/lang/String;ILcom/sun/mail/util/MailLogger;Ljava/util/Properties;Ljava/lang/String;Z)V
    .registers 16
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "logger"    # Lcom/sun/mail/util/MailLogger;
    .param p4, "props"    # Ljava/util/Properties;
    .param p5, "prefix"    # Ljava/lang/String;
    .param p6, "isSSL"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/sun/mail/pop3/Protocol;->apopChallenge:Ljava/lang/String;

    .line 78
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/sun/mail/pop3/Protocol;->capabilities:Ljava/util/Map;

    .line 80
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/sun/mail/pop3/Protocol;->noauthdebug:Z

    .line 94
    iput-object p1, p0, Lcom/sun/mail/pop3/Protocol;->host:Ljava/lang/String;

    .line 95
    iput-object p4, p0, Lcom/sun/mail/pop3/Protocol;->props:Ljava/util/Properties;

    .line 96
    iput-object p5, p0, Lcom/sun/mail/pop3/Protocol;->prefix:Ljava/lang/String;

    .line 97
    iput-object p3, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    .line 98
    const-string v6, "protocol"

    const/4 v7, 0x0

    invoke-virtual {p3, v6, v7}, Lcom/sun/mail/util/MailLogger;->getSubLogger(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;

    move-result-object v6

    iput-object v6, p0, Lcom/sun/mail/pop3/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    .line 99
    const-string v6, "mail.debug.auth"

    const/4 v7, 0x0

    invoke-static {p4, v6, v7}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_ad

    const/4 v6, 0x1

    :goto_27
    iput-boolean v6, p0, Lcom/sun/mail/pop3/Protocol;->noauthdebug:Z

    .line 103
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".apop.enable"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p4, v6}, Lcom/sun/mail/pop3/Protocol;->getBoolProp(Ljava/util/Properties;Ljava/lang/String;)Z

    move-result v3

    .line 104
    .local v3, "enableAPOP":Z
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".disablecapa"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, p4, v6}, Lcom/sun/mail/pop3/Protocol;->getBoolProp(Ljava/util/Properties;Ljava/lang/String;)Z

    move-result v2

    .line 106
    .local v2, "disableCapa":Z
    const/4 v6, -0x1

    if-ne p2, v6, :cond_5c

    .line 107
    const/16 p2, 0x6e

    .line 108
    :cond_5c
    :try_start_5c
    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {p3, v6}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_8e

    .line 109
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "connecting to host \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\", port "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", isSSL "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 112
    :cond_8e
    invoke-static {p1, p2, p4, p5, p6}, Lcom/sun/mail/util/SocketFetcher;->getSocket(Ljava/lang/String;ILjava/util/Properties;Ljava/lang/String;Z)Ljava/net/Socket;

    move-result-object v6

    iput-object v6, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 113
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->initStreams()V

    .line 114
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;
    :try_end_9b
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_9b} :catch_b0

    move-result-object v5

    .line 123
    .local v5, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v6, v5, Lcom/sun/mail/pop3/Response;->ok:Z

    if-nez v6, :cond_c2

    .line 125
    :try_start_a0
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->close()V
    :try_end_a5
    .catchall {:try_start_a0 .. :try_end_a5} :catchall_b9

    .line 127
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Connect failed"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 99
    .end local v2    # "disableCapa":Z
    .end local v3    # "enableAPOP":Z
    .end local v5    # "r":Lcom/sun/mail/pop3/Response;
    :cond_ad
    const/4 v6, 0x0

    goto/16 :goto_27

    .line 115
    .restart local v2    # "disableCapa":Z
    .restart local v3    # "enableAPOP":Z
    :catch_b0
    move-exception v4

    .line 117
    .local v4, "ioe":Ljava/io/IOException;
    :try_start_b1
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->close()V
    :try_end_b6
    .catchall {:try_start_b1 .. :try_end_b6} :catchall_b7

    .line 119
    throw v4

    :catchall_b7
    move-exception v6

    throw v4

    .line 127
    .end local v4    # "ioe":Ljava/io/IOException;
    .restart local v5    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_b9
    move-exception v6

    new-instance v6, Ljava/io/IOException;

    const-string v7, "Connect failed"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 130
    :cond_c2
    if-eqz v3, :cond_ed

    .line 131
    iget-object v6, v5, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    const/16 v7, 0x3c

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 132
    .local v1, "challStart":I
    iget-object v6, v5, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    const/16 v7, 0x3e

    invoke-virtual {v6, v7, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 133
    .local v0, "challEnd":I
    const/4 v6, -0x1

    if-eq v1, v6, :cond_e4

    const/4 v6, -0x1

    if-eq v0, v6, :cond_e4

    .line 134
    iget-object v6, v5, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    add-int/lit8 v7, v0, 0x1

    invoke-virtual {v6, v1, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/sun/mail/pop3/Protocol;->apopChallenge:Ljava/lang/String;

    .line 135
    :cond_e4
    sget-object v6, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v7, "APOP challenge: {0}"

    iget-object v8, p0, Lcom/sun/mail/pop3/Protocol;->apopChallenge:Ljava/lang/String;

    invoke-virtual {p3, v6, v7, v8}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 139
    .end local v0    # "challEnd":I
    .end local v1    # "challStart":I
    :cond_ed
    if-nez v2, :cond_f6

    .line 140
    invoke-virtual {p0}, Lcom/sun/mail/pop3/Protocol;->capa()Ljava/io/InputStream;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/sun/mail/pop3/Protocol;->setCapabilities(Ljava/io/InputStream;)V

    .line 142
    :cond_f6
    const-string v6, "PIPELINING"

    invoke-virtual {p0, v6}, Lcom/sun/mail/pop3/Protocol;->hasCapability(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_118

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".pipelining"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    .line 143
    invoke-static {p4, v6, v7}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_125

    :cond_118
    const/4 v6, 0x1

    :goto_119
    iput-boolean v6, p0, Lcom/sun/mail/pop3/Protocol;->pipelining:Z

    .line 144
    iget-boolean v6, p0, Lcom/sun/mail/pop3/Protocol;->pipelining:Z

    if-eqz v6, :cond_124

    .line 145
    const-string v6, "PIPELINING enabled"

    invoke-virtual {p3, v6}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V

    .line 146
    :cond_124
    return-void

    .line 143
    :cond_125
    const/4 v6, 0x0

    goto :goto_119
.end method

.method private batchCommandContinue(Ljava/lang/String;)V
    .registers 2
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 848
    return-void
.end method

.method private batchCommandEnd()V
    .registers 1

    .prologue
    .line 849
    return-void
.end method

.method private batchCommandStart(Ljava/lang/String;)V
    .registers 2
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 847
    return-void
.end method

.method private final declared-synchronized getBoolProp(Ljava/util/Properties;Ljava/lang/String;)Z
    .registers 7
    .param p1, "props"    # Ljava/util/Properties;
    .param p2, "prop"    # Ljava/lang/String;

    .prologue
    .line 154
    monitor-enter p0

    const/4 v1, 0x0

    :try_start_2
    invoke-static {p1, p2, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v0

    .line 155
    .local v0, "val":Z
    iget-object v1, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v2, Ljava/util/logging/Level;->CONFIG:Ljava/util/logging/Level;

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 156
    iget-object v1, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/MailLogger;->config(Ljava/lang/String;)V
    :try_end_2c
    .catchall {:try_start_2 .. :try_end_2c} :catchall_2e

    .line 157
    :cond_2c
    monitor-exit p0

    return v0

    .line 154
    .end local v0    # "val":Z
    :catchall_2e
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private getDigest(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 305
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/sun/mail/pop3/Protocol;->apopChallenge:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 308
    .local v1, "key":Ljava/lang/String;
    :try_start_14
    const-string v6, "MD5"

    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 309
    .local v2, "md":Ljava/security/MessageDigest;
    const-string v6, "iso-8859-1"

    invoke-virtual {v1, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/security/MessageDigest;->digest([B)[B
    :try_end_23
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_14 .. :try_end_23} :catch_29
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_14 .. :try_end_23} :catch_2b

    move-result-object v0

    .line 315
    .local v0, "digest":[B
    invoke-static {v0}, Lcom/sun/mail/pop3/Protocol;->toHex([B)Ljava/lang/String;

    move-result-object v5

    .end local v0    # "digest":[B
    .end local v2    # "md":Ljava/security/MessageDigest;
    :goto_28
    return-object v5

    .line 310
    :catch_29
    move-exception v3

    .line 311
    .local v3, "nsae":Ljava/security/NoSuchAlgorithmException;
    goto :goto_28

    .line 312
    .end local v3    # "nsae":Ljava/security/NoSuchAlgorithmException;
    :catch_2b
    move-exception v4

    .line 313
    .local v4, "uee":Ljava/io/UnsupportedEncodingException;
    goto :goto_28
.end method

.method private initStreams()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    iget-object v1, p0, Lcom/sun/mail/pop3/Protocol;->props:Ljava/util/Properties;

    const-string v2, "mail.debug.quote"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lcom/sun/mail/util/PropUtil;->getBooleanProperty(Ljava/util/Properties;Ljava/lang/String;Z)Z

    move-result v0

    .line 163
    .local v0, "quote":Z
    new-instance v1, Lcom/sun/mail/util/TraceInputStream;

    iget-object v2, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 164
    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/pop3/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    invoke-direct {v1, v2, v3}, Lcom/sun/mail/util/TraceInputStream;-><init>(Ljava/io/InputStream;Lcom/sun/mail/util/MailLogger;)V

    iput-object v1, p0, Lcom/sun/mail/pop3/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    .line 165
    iget-object v1, p0, Lcom/sun/mail/pop3/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-virtual {v1, v0}, Lcom/sun/mail/util/TraceInputStream;->setQuote(Z)V

    .line 167
    new-instance v1, Lcom/sun/mail/util/TraceOutputStream;

    iget-object v2, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 168
    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iget-object v3, p0, Lcom/sun/mail/pop3/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    invoke-direct {v1, v2, v3}, Lcom/sun/mail/util/TraceOutputStream;-><init>(Ljava/io/OutputStream;Lcom/sun/mail/util/MailLogger;)V

    iput-object v1, p0, Lcom/sun/mail/pop3/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    .line 169
    iget-object v1, p0, Lcom/sun/mail/pop3/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-virtual {v1, v0}, Lcom/sun/mail/util/TraceOutputStream;->setQuote(Z)V

    .line 171
    new-instance v1, Ljava/io/DataInputStream;

    new-instance v2, Ljava/io/BufferedInputStream;

    iget-object v3, p0, Lcom/sun/mail/pop3/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    .line 172
    new-instance v1, Ljava/io/PrintWriter;

    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/OutputStreamWriter;

    iget-object v4, p0, Lcom/sun/mail/pop3/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    const-string v5, "iso-8859-1"

    invoke-direct {v3, v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    iput-object v1, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;

    .line 176
    return-void
.end method

.method private issueCommand(Ljava/lang/String;)V
    .registers 4
    .param p1, "cmd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 701
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    if-nez v0, :cond_c

    .line 702
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Folder is closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 704
    :cond_c
    if-eqz p1, :cond_2b

    .line 705
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 706
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 707
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 709
    :cond_2b
    return-void
.end method

.method private multilineCommand(Ljava/lang/String;I)Lcom/sun/mail/pop3/Response;
    .registers 5
    .param p1, "cmd"    # Ljava/lang/String;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 764
    invoke-direct {p0, p1}, Lcom/sun/mail/pop3/Protocol;->multilineCommandStart(Ljava/lang/String;)V

    .line 765
    invoke-direct {p0, p1}, Lcom/sun/mail/pop3/Protocol;->issueCommand(Ljava/lang/String;)V

    .line 766
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 767
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v1, v0, Lcom/sun/mail/pop3/Response;->ok:Z

    if-nez v1, :cond_12

    .line 768
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->multilineCommandEnd()V

    .line 773
    :goto_11
    return-object v0

    .line 771
    :cond_12
    invoke-direct {p0, p2}, Lcom/sun/mail/pop3/Protocol;->readMultilineResponse(I)Ljava/io/InputStream;

    move-result-object v1

    iput-object v1, v0, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;

    .line 772
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->multilineCommandEnd()V

    goto :goto_11
.end method

.method private multilineCommandEnd()V
    .registers 1

    .prologue
    .line 846
    return-void
.end method

.method private multilineCommandStart(Ljava/lang/String;)V
    .registers 2
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 845
    return-void
.end method

.method private readMultilineResponse(I)Ljava/io/InputStream;
    .registers 8
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 783
    new-instance v1, Lcom/sun/mail/util/SharedByteArrayOutputStream;

    invoke-direct {v1, p1}, Lcom/sun/mail/util/SharedByteArrayOutputStream;-><init>(I)V

    .line 784
    .local v1, "buf":Lcom/sun/mail/util/SharedByteArrayOutputStream;
    const/16 v3, 0xa

    .line 786
    .local v3, "lastb":I
    :goto_7
    :try_start_7
    iget-object v4, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .local v0, "b":I
    if-ltz v0, :cond_27

    .line 787
    const/16 v4, 0xa

    if-ne v3, v4, :cond_31

    const/16 v4, 0x2e

    if-ne v0, v4, :cond_31

    .line 788
    iget-object v4, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 789
    const/16 v4, 0xd

    if-ne v0, v4, :cond_31

    .line 791
    iget-object v4, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->read()I
    :try_end_26
    .catch Ljava/io/InterruptedIOException; {:try_start_7 .. :try_end_26} :catch_36

    move-result v0

    .line 807
    :cond_27
    if-gez v0, :cond_3d

    .line 808
    new-instance v4, Ljava/io/EOFException;

    const-string v5, "EOF on socket"

    invoke-direct {v4, v5}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 795
    :cond_31
    :try_start_31
    invoke-virtual {v1, v0}, Lcom/sun/mail/util/SharedByteArrayOutputStream;->write(I)V
    :try_end_34
    .catch Ljava/io/InterruptedIOException; {:try_start_31 .. :try_end_34} :catch_36

    .line 796
    move v3, v0

    goto :goto_7

    .line 798
    .end local v0    # "b":I
    :catch_36
    move-exception v2

    .line 803
    .local v2, "iioex":Ljava/io/InterruptedIOException;
    :try_start_37
    iget-object v4, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v4}, Ljava/net/Socket;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3c} :catch_42

    .line 805
    :goto_3c
    throw v2

    .line 809
    .end local v2    # "iioex":Ljava/io/InterruptedIOException;
    .restart local v0    # "b":I
    :cond_3d
    invoke-virtual {v1}, Lcom/sun/mail/util/SharedByteArrayOutputStream;->toStream()Ljava/io/InputStream;

    move-result-object v4

    return-object v4

    .line 804
    .end local v0    # "b":I
    .restart local v2    # "iioex":Ljava/io/InterruptedIOException;
    :catch_42
    move-exception v4

    goto :goto_3c
.end method

.method private readResponse()Lcom/sun/mail/pop3/Response;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 715
    const/4 v3, 0x0

    .line 717
    .local v3, "line":Ljava/lang/String;
    :try_start_1
    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    invoke-virtual {v5}, Ljava/io/DataInputStream;->readLine()Ljava/lang/String;
    :try_end_6
    .catch Ljava/io/InterruptedIOException; {:try_start_1 .. :try_end_6} :catch_18
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_6} :catch_28

    move-result-object v3

    .line 742
    if-nez v3, :cond_38

    .line 743
    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    const-string v6, "<EOF>"

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->finest(Ljava/lang/String;)V

    .line 744
    new-instance v5, Ljava/io/EOFException;

    const-string v6, "EOF on socket"

    invoke-direct {v5, v6}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 718
    :catch_18
    move-exception v2

    .line 726
    .local v2, "iioex":Ljava/io/InterruptedIOException;
    :try_start_19
    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->close()V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1e} :catch_80

    .line 728
    :goto_1e
    new-instance v5, Ljava/io/EOFException;

    invoke-virtual {v2}, Ljava/io/InterruptedIOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 729
    .end local v2    # "iioex":Ljava/io/InterruptedIOException;
    :catch_28
    move-exception v0

    .line 737
    .local v0, "ex":Ljava/net/SocketException;
    :try_start_29
    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v5}, Ljava/net/Socket;->close()V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_2e} :catch_7e

    .line 739
    :goto_2e
    new-instance v5, Ljava/io/EOFException;

    invoke-virtual {v0}, Ljava/net/SocketException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 746
    .end local v0    # "ex":Ljava/net/SocketException;
    :cond_38
    new-instance v4, Lcom/sun/mail/pop3/Response;

    invoke-direct {v4}, Lcom/sun/mail/pop3/Response;-><init>()V

    .line 747
    .local v4, "r":Lcom/sun/mail/pop3/Response;
    const-string v5, "+OK"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_59

    .line 748
    const/4 v5, 0x1

    iput-boolean v5, v4, Lcom/sun/mail/pop3/Response;->ok:Z

    .line 754
    :goto_48
    const/16 v5, 0x20

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .local v1, "i":I
    if-ltz v1, :cond_58

    .line 755
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    .line 756
    :cond_58
    return-object v4

    .line 749
    .end local v1    # "i":I
    :cond_59
    const-string v5, "-ERR"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_65

    .line 750
    const/4 v5, 0x0

    iput-boolean v5, v4, Lcom/sun/mail/pop3/Response;->ok:Z

    goto :goto_48

    .line 752
    :cond_65
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 738
    .end local v4    # "r":Lcom/sun/mail/pop3/Response;
    .restart local v0    # "ex":Ljava/net/SocketException;
    :catch_7e
    move-exception v5

    goto :goto_2e

    .line 727
    .end local v0    # "ex":Ljava/net/SocketException;
    .restart local v2    # "iioex":Ljava/io/InterruptedIOException;
    :catch_80
    move-exception v5

    goto :goto_1e
.end method

.method private resumeTracing()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 834
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 835
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceInputStream;->setTrace(Z)V

    .line 836
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceOutputStream;->setTrace(Z)V

    .line 838
    :cond_15
    return-void
.end method

.method private simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;
    .registers 3
    .param p1, "cmd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 690
    invoke-direct {p0, p1}, Lcom/sun/mail/pop3/Protocol;->simpleCommandStart(Ljava/lang/String;)V

    .line 691
    invoke-direct {p0, p1}, Lcom/sun/mail/pop3/Protocol;->issueCommand(Ljava/lang/String;)V

    .line 692
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 693
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->simpleCommandEnd()V

    .line 694
    return-object v0
.end method

.method private simpleCommandEnd()V
    .registers 1

    .prologue
    .line 844
    return-void
.end method

.method private simpleCommandStart(Ljava/lang/String;)V
    .registers 2
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 843
    return-void
.end method

.method private suspendTracing()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 824
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 825
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->traceInput:Lcom/sun/mail/util/TraceInputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceInputStream;->setTrace(Z)V

    .line 826
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->traceOutput:Lcom/sun/mail/util/TraceOutputStream;

    invoke-virtual {v0, v2}, Lcom/sun/mail/util/TraceOutputStream;->setTrace(Z)V

    .line 828
    :cond_15
    return-void
.end method

.method private static toHex([B)Ljava/lang/String;
    .registers 8
    .param p0, "bytes"    # [B

    .prologue
    .line 327
    array-length v5, p0

    mul-int/lit8 v5, v5, 0x2

    new-array v3, v5, [C

    .line 329
    .local v3, "result":[C
    const/4 v2, 0x0

    .local v2, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    array-length v5, p0

    if-ge v2, v5, :cond_25

    .line 330
    aget-byte v5, p0, v2

    and-int/lit16 v4, v5, 0xff

    .line 331
    .local v4, "temp":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    sget-object v5, Lcom/sun/mail/pop3/Protocol;->digits:[C

    shr-int/lit8 v6, v4, 0x4

    aget-char v5, v5, v6

    aput-char v5, v3, v0

    .line 332
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    sget-object v5, Lcom/sun/mail/pop3/Protocol;->digits:[C

    and-int/lit8 v6, v4, 0xf

    aget-char v5, v5, v6

    aput-char v5, v3, v1

    .line 329
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 334
    .end local v4    # "temp":I
    :cond_25
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v3}, Ljava/lang/String;-><init>([C)V

    return-object v5
.end method


# virtual methods
.method declared-synchronized capa()Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 680
    monitor-enter p0

    :try_start_1
    const-string v1, "CAPA"

    const/16 v2, 0x80

    invoke-direct {p0, v1, v2}, Lcom/sun/mail/pop3/Protocol;->multilineCommand(Ljava/lang/String;I)Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 681
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v1, v0, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_13

    if-nez v1, :cond_10

    .line 682
    const/4 v1, 0x0

    .line 683
    :goto_e
    monitor-exit p0

    return-object v1

    :cond_10
    :try_start_10
    iget-object v1, v0, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;
    :try_end_12
    .catchall {:try_start_10 .. :try_end_12} :catchall_13

    goto :goto_e

    .line 680
    .end local v0    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_13
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized dele(I)Z
    .registers 5
    .param p1, "msg"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 578
    monitor-enter p0

    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DELE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 579
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v1, v0, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_1c

    monitor-exit p0

    return v1

    .line 578
    .end local v0    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_1c
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 179
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 180
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_a

    .line 181
    invoke-virtual {p0}, Lcom/sun/mail/pop3/Protocol;->quit()Z

    .line 183
    :cond_a
    return-void
.end method

.method declared-synchronized getCapabilities()Ljava/util/Map;
    .registers 2

    .prologue
    .line 234
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->capabilities:Ljava/util/Map;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized hasCapability(Ljava/lang/String;)Z
    .registers 4
    .param p1, "c"    # Ljava/lang/String;

    .prologue
    .line 226
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->capabilities:Ljava/util/Map;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->capabilities:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 227
    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_18

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_14
    monitor-exit p0

    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_14

    .line 226
    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized isSSL()Z
    .registers 2

    .prologue
    .line 672
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_7

    monitor-exit p0

    return v0

    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected isTracing()Z
    .registers 3

    .prologue
    .line 816
    iget-object v0, p0, Lcom/sun/mail/pop3/Protocol;->traceLogger:Lcom/sun/mail/util/MailLogger;

    sget-object v1, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    return v0
.end method

.method declared-synchronized list(I)I
    .registers 7
    .param p1, "msg"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 391
    monitor-enter p0

    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LIST "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 392
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    const/4 v1, -0x1

    .line 393
    .local v1, "size":I
    iget-boolean v3, v0, Lcom/sun/mail/pop3/Response;->ok:Z

    if-eqz v3, :cond_33

    iget-object v3, v0, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_35

    if-eqz v3, :cond_33

    .line 395
    :try_start_21
    new-instance v2, Ljava/util/StringTokenizer;

    iget-object v3, v0, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 396
    .local v2, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 397
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_32
    .catch Ljava/lang/RuntimeException; {:try_start_21 .. :try_end_32} :catch_38
    .catchall {:try_start_21 .. :try_end_32} :catchall_35

    move-result v1

    .line 402
    .end local v2    # "st":Ljava/util/StringTokenizer;
    :cond_33
    :goto_33
    monitor-exit p0

    return v1

    .line 391
    .end local v0    # "r":Lcom/sun/mail/pop3/Response;
    .end local v1    # "size":I
    :catchall_35
    move-exception v3

    monitor-exit p0

    throw v3

    .line 398
    .restart local v0    # "r":Lcom/sun/mail/pop3/Response;
    .restart local v1    # "size":I
    :catch_38
    move-exception v3

    goto :goto_33
.end method

.method declared-synchronized list()Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 409
    monitor-enter p0

    :try_start_1
    const-string v1, "LIST"

    const/16 v2, 0x80

    invoke-direct {p0, v1, v2}, Lcom/sun/mail/pop3/Protocol;->multilineCommand(Ljava/lang/String;I)Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 410
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    iget-object v1, v0, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    monitor-exit p0

    return-object v1

    .line 409
    .end local v0    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_d
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized login(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    monitor-enter p0

    :try_start_1
    iget-boolean v5, p0, Lcom/sun/mail/pop3/Protocol;->pipelining:Z

    if-eqz v5, :cond_78

    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    instance-of v5, v5, Ljavax/net/ssl/SSLSocket;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_d8

    if-eqz v5, :cond_78

    const/4 v0, 0x1

    .line 248
    .local v0, "batch":Z
    :goto_c
    :try_start_c
    iget-boolean v5, p0, Lcom/sun/mail/pop3/Protocol;->noauthdebug:Z

    if-eqz v5, :cond_20

    invoke-virtual {p0}, Lcom/sun/mail/pop3/Protocol;->isTracing()Z

    move-result v5

    if-eqz v5, :cond_20

    .line 249
    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    const-string v6, "authentication command trace suppressed"

    invoke-virtual {v5, v6}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 250
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->suspendTracing()V

    .line 252
    :cond_20
    const/4 v2, 0x0

    .line 253
    .local v2, "dpw":Ljava/lang/String;
    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->apopChallenge:Ljava/lang/String;

    if-eqz v5, :cond_29

    .line 254
    invoke-direct {p0, p2}, Lcom/sun/mail/pop3/Protocol;->getDigest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 255
    :cond_29
    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->apopChallenge:Ljava/lang/String;

    if-eqz v5, :cond_7a

    if-eqz v2, :cond_7a

    .line 256
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "APOP "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v4

    .line 279
    .local v4, "r":Lcom/sun/mail/pop3/Response;
    :goto_50
    iget-boolean v5, p0, Lcom/sun/mail/pop3/Protocol;->noauthdebug:Z

    if-eqz v5, :cond_69

    invoke-virtual {p0}, Lcom/sun/mail/pop3/Protocol;->isTracing()Z

    move-result v5

    if-eqz v5, :cond_69

    .line 280
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v8, "authentication command {0}"

    iget-boolean v5, v4, Lcom/sun/mail/pop3/Response;->ok:Z

    if-eqz v5, :cond_11d

    const-string v5, "succeeded"

    :goto_66
    invoke-virtual {v6, v7, v8, v5}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 282
    :cond_69
    iget-boolean v5, v4, Lcom/sun/mail/pop3/Response;->ok:Z

    if-nez v5, :cond_125

    .line 283
    iget-object v5, v4, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    if-eqz v5, :cond_121

    iget-object v5, v4, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;
    :try_end_73
    .catchall {:try_start_c .. :try_end_73} :catchall_d3

    .line 287
    :goto_73
    :try_start_73
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->resumeTracing()V
    :try_end_76
    .catchall {:try_start_73 .. :try_end_76} :catchall_d8

    :goto_76
    monitor-exit p0

    return-object v5

    .line 244
    .end local v0    # "batch":Z
    .end local v2    # "dpw":Ljava/lang/String;
    .end local v4    # "r":Lcom/sun/mail/pop3/Response;
    :cond_78
    const/4 v0, 0x0

    goto :goto_c

    .line 257
    .restart local v0    # "batch":Z
    .restart local v2    # "dpw":Ljava/lang/String;
    :cond_7a
    if-eqz v0, :cond_db

    .line 258
    :try_start_7c
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "USER "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 259
    .local v1, "cmd":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->batchCommandStart(Ljava/lang/String;)V

    .line 260
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->issueCommand(Ljava/lang/String;)V

    .line 261
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "PASS "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 262
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->batchCommandContinue(Ljava/lang/String;)V

    .line 263
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->issueCommand(Ljava/lang/String;)V

    .line 264
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    move-result-object v4

    .line 265
    .restart local v4    # "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v5, v4, Lcom/sun/mail/pop3/Response;->ok:Z

    if-nez v5, :cond_ca

    .line 266
    iget-object v5, v4, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    if-eqz v5, :cond_c7

    iget-object v3, v4, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    .line 267
    .local v3, "err":Ljava/lang/String;
    :goto_bc
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    .line 268
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->batchCommandEnd()V
    :try_end_c2
    .catchall {:try_start_7c .. :try_end_c2} :catchall_d3

    .line 287
    :try_start_c2
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->resumeTracing()V
    :try_end_c5
    .catchall {:try_start_c2 .. :try_end_c5} :catchall_d8

    move-object v5, v3

    goto :goto_76

    .line 266
    .end local v3    # "err":Ljava/lang/String;
    :cond_c7
    :try_start_c7
    const-string v3, "USER command failed"

    goto :goto_bc

    .line 271
    :cond_ca
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    move-result-object v4

    .line 272
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->batchCommandEnd()V
    :try_end_d1
    .catchall {:try_start_c7 .. :try_end_d1} :catchall_d3

    goto/16 :goto_50

    .line 287
    .end local v1    # "cmd":Ljava/lang/String;
    .end local v2    # "dpw":Ljava/lang/String;
    .end local v4    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_d3
    move-exception v5

    :try_start_d4
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->resumeTracing()V

    throw v5
    :try_end_d8
    .catchall {:try_start_d4 .. :try_end_d8} :catchall_d8

    .line 244
    .end local v0    # "batch":Z
    :catchall_d8
    move-exception v5

    monitor-exit p0

    throw v5

    .line 274
    .restart local v0    # "batch":Z
    .restart local v2    # "dpw":Ljava/lang/String;
    :cond_db
    :try_start_db
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "USER "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v4

    .line 275
    .restart local v4    # "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v5, v4, Lcom/sun/mail/pop3/Response;->ok:Z

    if-nez v5, :cond_104

    .line 276
    iget-object v5, v4, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    if-eqz v5, :cond_101

    iget-object v5, v4, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;
    :try_end_fc
    .catchall {:try_start_db .. :try_end_fc} :catchall_d3

    .line 287
    :goto_fc
    :try_start_fc
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->resumeTracing()V
    :try_end_ff
    .catchall {:try_start_fc .. :try_end_ff} :catchall_d8

    goto/16 :goto_76

    .line 276
    :cond_101
    :try_start_101
    const-string v5, "USER command failed"

    goto :goto_fc

    .line 277
    :cond_104
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "PASS "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v4

    goto/16 :goto_50

    .line 280
    :cond_11d
    const-string v5, "failed"

    goto/16 :goto_66

    .line 283
    :cond_121
    const-string v5, "login failed"
    :try_end_123
    .catchall {:try_start_101 .. :try_end_123} :catchall_d3

    goto/16 :goto_73

    .line 284
    :cond_125
    const/4 v5, 0x0

    .line 287
    :try_start_126
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->resumeTracing()V
    :try_end_129
    .catchall {:try_start_126 .. :try_end_129} :catchall_d8

    goto/16 :goto_76
.end method

.method declared-synchronized noop()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 626
    monitor-enter p0

    :try_start_1
    const-string v1, "NOOP"

    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 627
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v1, v0, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return v1

    .line 626
    .end local v0    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized quit()Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 341
    monitor-enter p0

    const/4 v0, 0x0

    .line 343
    .local v0, "ok":Z
    :try_start_2
    const-string v2, "QUIT"

    invoke-direct {p0, v2}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v1

    .line 344
    .local v1, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v0, v1, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_a
    .catchall {:try_start_2 .. :try_end_a} :catchall_28

    .line 347
    :try_start_a
    iget-object v2, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->close()V
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_1a

    .line 349
    const/4 v2, 0x0

    :try_start_10
    iput-object v2, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 350
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    .line 351
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_25

    .line 354
    monitor-exit p0

    return v0

    .line 349
    :catchall_1a
    move-exception v2

    const/4 v3, 0x0

    :try_start_1c
    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 350
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    .line 351
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;

    throw v2
    :try_end_25
    .catchall {:try_start_1c .. :try_end_25} :catchall_25

    .line 341
    .end local v1    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_25
    move-exception v2

    monitor-exit p0

    throw v2

    .line 346
    :catchall_28
    move-exception v2

    .line 347
    :try_start_29
    iget-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_2e
    .catchall {:try_start_29 .. :try_end_2e} :catchall_38

    .line 349
    const/4 v3, 0x0

    :try_start_2f
    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 350
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    .line 351
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;

    throw v2

    .line 349
    :catchall_38
    move-exception v2

    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 350
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    .line 351
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;

    throw v2
    :try_end_43
    .catchall {:try_start_2f .. :try_end_43} :catchall_25
.end method

.method declared-synchronized retr(II)Ljava/io/InputStream;
    .registers 12
    .param p1, "msg"    # I
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v8, 0x40000000    # 2.0f

    .line 422
    monitor-enter p0

    if-nez p2, :cond_a6

    :try_start_5
    iget-boolean v6, p0, Lcom/sun/mail/pop3/Protocol;->pipelining:Z

    if-eqz v6, :cond_a6

    const/4 v0, 0x1

    .line 423
    .local v0, "batch":Z
    :goto_a
    if-eqz v0, :cond_ce

    .line 424
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LIST "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 425
    .local v1, "cmd":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->batchCommandStart(Ljava/lang/String;)V

    .line 426
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->issueCommand(Ljava/lang/String;)V

    .line 427
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "RETR "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 428
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->batchCommandContinue(Ljava/lang/String;)V

    .line 429
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->issueCommand(Ljava/lang/String;)V

    .line 430
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    move-result-object v3

    .line 431
    .local v3, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v6, v3, Lcom/sun/mail/pop3/Response;->ok:Z

    if-eqz v6, :cond_61

    iget-object v6, v3, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;
    :try_end_48
    .catchall {:try_start_5 .. :try_end_48} :catchall_125

    if-eqz v6, :cond_61

    .line 434
    :try_start_4a
    new-instance v5, Ljava/util/StringTokenizer;

    iget-object v6, v3, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 435
    .local v5, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 436
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_5b
    .catch Ljava/lang/RuntimeException; {:try_start_4a .. :try_end_5b} :catch_14f
    .catchall {:try_start_4a .. :try_end_5b} :catchall_125

    move-result p2

    .line 438
    if-gt p2, v8, :cond_60

    if-gez p2, :cond_a9

    .line 439
    :cond_60
    const/4 p2, 0x0

    .line 448
    .end local v5    # "st":Ljava/util/StringTokenizer;
    :cond_61
    :goto_61
    :try_start_61
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    move-result-object v3

    .line 449
    iget-boolean v6, v3, Lcom/sun/mail/pop3/Response;->ok:Z

    if-eqz v6, :cond_71

    .line 450
    add-int/lit16 v6, p2, 0x80

    invoke-direct {p0, v6}, Lcom/sun/mail/pop3/Protocol;->readMultilineResponse(I)Ljava/io/InputStream;

    move-result-object v6

    iput-object v6, v3, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;

    .line 451
    :cond_71
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->batchCommandEnd()V

    .line 491
    :goto_74
    iget-boolean v6, v3, Lcom/sun/mail/pop3/Response;->ok:Z

    if-eqz v6, :cond_a2

    .line 492
    if-lez p2, :cond_a2

    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_a2

    .line 493
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "got message size "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v3, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;

    invoke-virtual {v8}, Ljava/io/InputStream;->available()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 495
    :cond_a2
    iget-object v6, v3, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;
    :try_end_a4
    .catchall {:try_start_61 .. :try_end_a4} :catchall_125

    :goto_a4
    monitor-exit p0

    return-object v6

    .line 422
    .end local v0    # "batch":Z
    .end local v1    # "cmd":Ljava/lang/String;
    .end local v3    # "r":Lcom/sun/mail/pop3/Response;
    :cond_a6
    const/4 v0, 0x0

    goto/16 :goto_a

    .line 441
    .restart local v0    # "batch":Z
    .restart local v1    # "cmd":Ljava/lang/String;
    .restart local v3    # "r":Lcom/sun/mail/pop3/Response;
    .restart local v5    # "st":Ljava/util/StringTokenizer;
    :cond_a9
    :try_start_a9
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_cb

    .line 442
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "pipeline message size "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_cb
    .catch Ljava/lang/RuntimeException; {:try_start_a9 .. :try_end_cb} :catch_14f
    .catchall {:try_start_a9 .. :try_end_cb} :catchall_125

    .line 443
    :cond_cb
    add-int/lit16 p2, p2, 0x80

    goto :goto_61

    .line 453
    .end local v1    # "cmd":Ljava/lang/String;
    .end local v3    # "r":Lcom/sun/mail/pop3/Response;
    .end local v5    # "st":Ljava/util/StringTokenizer;
    :cond_ce
    :try_start_ce
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "RETR "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 454
    .restart local v1    # "cmd":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->multilineCommandStart(Ljava/lang/String;)V

    .line 455
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->issueCommand(Ljava/lang/String;)V

    .line 456
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    move-result-object v3

    .line 457
    .restart local v3    # "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v6, v3, Lcom/sun/mail/pop3/Response;->ok:Z

    if-nez v6, :cond_f4

    .line 458
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->multilineCommandEnd()V

    .line 459
    const/4 v6, 0x0

    goto :goto_a4

    .line 469
    :cond_f4
    if-gtz p2, :cond_11a

    iget-object v6, v3, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;
    :try_end_f8
    .catchall {:try_start_ce .. :try_end_f8} :catchall_125

    if-eqz v6, :cond_11a

    .line 471
    :try_start_fa
    new-instance v5, Ljava/util/StringTokenizer;

    iget-object v6, v3, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 472
    .restart local v5    # "st":Ljava/util/StringTokenizer;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 473
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 474
    .local v2, "octets":Ljava/lang/String;
    const-string v6, "octets"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11a

    .line 475
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_114
    .catch Ljava/lang/RuntimeException; {:try_start_fa .. :try_end_114} :catch_14d
    .catchall {:try_start_fa .. :try_end_114} :catchall_125

    move-result p2

    .line 477
    if-gt p2, v8, :cond_119

    if-gez p2, :cond_128

    .line 478
    :cond_119
    const/4 p2, 0x0

    .line 488
    .end local v2    # "octets":Ljava/lang/String;
    .end local v4    # "s":Ljava/lang/String;
    .end local v5    # "st":Ljava/util/StringTokenizer;
    :cond_11a
    :goto_11a
    :try_start_11a
    invoke-direct {p0, p2}, Lcom/sun/mail/pop3/Protocol;->readMultilineResponse(I)Ljava/io/InputStream;

    move-result-object v6

    iput-object v6, v3, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;

    .line 489
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->multilineCommandEnd()V
    :try_end_123
    .catchall {:try_start_11a .. :try_end_123} :catchall_125

    goto/16 :goto_74

    .line 422
    .end local v0    # "batch":Z
    .end local v1    # "cmd":Ljava/lang/String;
    .end local v3    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_125
    move-exception v6

    monitor-exit p0

    throw v6

    .line 480
    .restart local v0    # "batch":Z
    .restart local v1    # "cmd":Ljava/lang/String;
    .restart local v2    # "octets":Ljava/lang/String;
    .restart local v3    # "r":Lcom/sun/mail/pop3/Response;
    .restart local v4    # "s":Ljava/lang/String;
    .restart local v5    # "st":Ljava/util/StringTokenizer;
    :cond_128
    :try_start_128
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_14a

    .line 481
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "guessing message size: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_14a
    .catch Ljava/lang/RuntimeException; {:try_start_128 .. :try_end_14a} :catch_14d
    .catchall {:try_start_128 .. :try_end_14a} :catchall_125

    .line 482
    :cond_14a
    add-int/lit16 p2, p2, 0x80

    goto :goto_11a

    .line 485
    .end local v2    # "octets":Ljava/lang/String;
    .end local v4    # "s":Ljava/lang/String;
    .end local v5    # "st":Ljava/util/StringTokenizer;
    :catch_14d
    move-exception v6

    goto :goto_11a

    .line 445
    :catch_14f
    move-exception v6

    goto/16 :goto_61
.end method

.method declared-synchronized retr(ILjava/io/OutputStream;)Z
    .registers 13
    .param p1, "msg"    # I
    .param p2, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 503
    monitor-enter p0

    :try_start_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "RETR "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 504
    .local v1, "cmd":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->multilineCommandStart(Ljava/lang/String;)V

    .line 505
    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->issueCommand(Ljava/lang/String;)V

    .line 506
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->readResponse()Lcom/sun/mail/pop3/Response;

    move-result-object v5

    .line 507
    .local v5, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v7, v5, Lcom/sun/mail/pop3/Response;->ok:Z

    if-nez v7, :cond_28

    .line 508
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->multilineCommandEnd()V
    :try_end_25
    .catchall {:try_start_1 .. :try_end_25} :catchall_55

    .line 509
    const/4 v7, 0x0

    .line 563
    :goto_26
    monitor-exit p0

    return v7

    .line 512
    :cond_28
    const/4 v6, 0x0

    .line 513
    .local v6, "terr":Ljava/lang/Throwable;
    const/16 v4, 0xa

    .line 515
    .local v4, "lastb":I
    :goto_2b
    :try_start_2b
    iget-object v7, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    invoke-virtual {v7}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .local v0, "b":I
    if-ltz v0, :cond_4b

    .line 516
    const/16 v7, 0xa

    if-ne v4, v7, :cond_58

    const/16 v7, 0x2e

    if-ne v0, v7, :cond_58

    .line 517
    iget-object v7, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    invoke-virtual {v7}, Ljava/io/DataInputStream;->read()I

    move-result v0

    .line 518
    const/16 v7, 0xd

    if-ne v0, v7, :cond_58

    .line 520
    iget-object v7, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    invoke-virtual {v7}, Ljava/io/DataInputStream;->read()I
    :try_end_4a
    .catch Ljava/io/InterruptedIOException; {:try_start_2b .. :try_end_4a} :catch_77
    .catchall {:try_start_2b .. :try_end_4a} :catchall_55

    move-result v0

    .line 551
    :cond_4b
    if-gez v0, :cond_7e

    .line 552
    :try_start_4d
    new-instance v7, Ljava/io/EOFException;

    const-string v8, "EOF on socket"

    invoke-direct {v7, v8}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_55
    .catchall {:try_start_4d .. :try_end_55} :catchall_55

    .line 503
    .end local v0    # "b":I
    .end local v1    # "cmd":Ljava/lang/String;
    .end local v4    # "lastb":I
    .end local v5    # "r":Lcom/sun/mail/pop3/Response;
    .end local v6    # "terr":Ljava/lang/Throwable;
    :catchall_55
    move-exception v7

    monitor-exit p0

    throw v7

    .line 529
    .restart local v0    # "b":I
    .restart local v1    # "cmd":Ljava/lang/String;
    .restart local v4    # "lastb":I
    .restart local v5    # "r":Lcom/sun/mail/pop3/Response;
    .restart local v6    # "terr":Ljava/lang/Throwable;
    :cond_58
    if-nez v6, :cond_5d

    .line 531
    :try_start_5a
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_5d} :catch_5f
    .catch Ljava/lang/RuntimeException; {:try_start_5a .. :try_end_5d} :catch_6b
    .catch Ljava/io/InterruptedIOException; {:try_start_5a .. :try_end_5d} :catch_77
    .catchall {:try_start_5a .. :try_end_5d} :catchall_55

    .line 540
    :cond_5d
    :goto_5d
    move v4, v0

    goto :goto_2b

    .line 532
    :catch_5f
    move-exception v2

    .line 533
    .local v2, "ex":Ljava/io/IOException;
    :try_start_60
    iget-object v7, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v9, "exception while streaming"

    invoke-virtual {v7, v8, v9, v2}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 534
    move-object v6, v2

    .line 538
    goto :goto_5d

    .line 535
    .end local v2    # "ex":Ljava/io/IOException;
    :catch_6b
    move-exception v2

    .line 536
    .local v2, "ex":Ljava/lang/RuntimeException;
    iget-object v7, p0, Lcom/sun/mail/pop3/Protocol;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v8, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v9, "exception while streaming"

    invoke-virtual {v7, v8, v9, v2}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_75
    .catch Ljava/io/InterruptedIOException; {:try_start_60 .. :try_end_75} :catch_77
    .catchall {:try_start_60 .. :try_end_75} :catchall_55

    .line 537
    move-object v6, v2

    goto :goto_5d

    .line 542
    .end local v0    # "b":I
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    :catch_77
    move-exception v3

    .line 547
    .local v3, "iioex":Ljava/io/InterruptedIOException;
    :try_start_78
    iget-object v7, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v7}, Ljava/net/Socket;->close()V
    :try_end_7d
    .catch Ljava/io/IOException; {:try_start_78 .. :try_end_7d} :catch_9d
    .catchall {:try_start_78 .. :try_end_7d} :catchall_55

    .line 549
    :goto_7d
    :try_start_7d
    throw v3

    .line 555
    .end local v3    # "iioex":Ljava/io/InterruptedIOException;
    .restart local v0    # "b":I
    :cond_7e
    if-eqz v6, :cond_98

    .line 556
    instance-of v7, v6, Ljava/io/IOException;

    if-eqz v7, :cond_87

    .line 557
    check-cast v6, Ljava/io/IOException;

    .end local v6    # "terr":Ljava/lang/Throwable;
    throw v6

    .line 558
    .restart local v6    # "terr":Ljava/lang/Throwable;
    :cond_87
    instance-of v7, v6, Ljava/lang/RuntimeException;

    if-eqz v7, :cond_8e

    .line 559
    check-cast v6, Ljava/lang/RuntimeException;

    .end local v6    # "terr":Ljava/lang/Throwable;
    throw v6

    .line 560
    .restart local v6    # "terr":Ljava/lang/Throwable;
    :cond_8e
    sget-boolean v7, Lcom/sun/mail/pop3/Protocol;->$assertionsDisabled:Z

    if-nez v7, :cond_98

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 562
    :cond_98
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->multilineCommandEnd()V
    :try_end_9b
    .catchall {:try_start_7d .. :try_end_9b} :catchall_55

    .line 563
    const/4 v7, 0x1

    goto :goto_26

    .line 548
    .end local v0    # "b":I
    .restart local v3    # "iioex":Ljava/io/InterruptedIOException;
    :catch_9d
    move-exception v7

    goto :goto_7d
.end method

.method declared-synchronized rset()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 634
    monitor-enter p0

    :try_start_1
    const-string v1, "RSET"

    invoke-direct {p0, v1}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 635
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v1, v0, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return v1

    .line 634
    .end local v0    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_b
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized setCapabilities(Ljava/io/InputStream;)V
    .registers 10
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 189
    monitor-enter p0

    if-nez p1, :cond_8

    .line 190
    const/4 v6, 0x0

    :try_start_4
    iput-object v6, p0, Lcom/sun/mail/pop3/Protocol;->capabilities:Ljava/util/Map;
    :try_end_6
    .catchall {:try_start_4 .. :try_end_6} :catchall_51

    .line 218
    :goto_6
    monitor-exit p0

    return-void

    .line 194
    :cond_8
    :try_start_8
    new-instance v6, Ljava/util/HashMap;

    const/16 v7, 0xa

    invoke-direct {v6, v7}, Ljava/util/HashMap;-><init>(I)V

    iput-object v6, p0, Lcom/sun/mail/pop3/Protocol;->capabilities:Ljava/util/Map;
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_51

    .line 195
    const/4 v3, 0x0

    .line 197
    .local v3, "r":Ljava/io/BufferedReader;
    :try_start_12
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    const-string v7, "us-ascii"

    invoke-direct {v6, p1, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_12 .. :try_end_1e} :catch_46
    .catchall {:try_start_12 .. :try_end_1e} :catchall_51

    .end local v3    # "r":Ljava/io/BufferedReader;
    .local v4, "r":Ljava/io/BufferedReader;
    move-object v3, v4

    .line 204
    .end local v4    # "r":Ljava/io/BufferedReader;
    .restart local v3    # "r":Ljava/io/BufferedReader;
    :cond_1f
    :goto_1f
    :try_start_1f
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "s":Ljava/lang/String;
    if-eqz v5, :cond_54

    .line 205
    move-object v0, v5

    .line 206
    .local v0, "cap":Ljava/lang/String;
    const/16 v6, 0x20

    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 207
    .local v2, "i":I
    if-lez v2, :cond_33

    .line 208
    const/4 v6, 0x0

    invoke-virtual {v0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 209
    :cond_33
    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->capabilities:Ljava/util/Map;

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_3e} :catch_3f
    .catchall {:try_start_1f .. :try_end_3e} :catchall_5a

    goto :goto_1f

    .line 211
    .end local v0    # "cap":Ljava/lang/String;
    .end local v2    # "i":I
    .end local v5    # "s":Ljava/lang/String;
    :catch_3f
    move-exception v6

    .line 215
    :try_start_40
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_43
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_43} :catch_44
    .catchall {:try_start_40 .. :try_end_43} :catchall_51

    goto :goto_6

    .line 216
    :catch_44
    move-exception v6

    goto :goto_6

    .line 198
    :catch_46
    move-exception v1

    .line 200
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    :try_start_47
    sget-boolean v6, Lcom/sun/mail/pop3/Protocol;->$assertionsDisabled:Z

    if-nez v6, :cond_1f

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6
    :try_end_51
    .catchall {:try_start_47 .. :try_end_51} :catchall_51

    .line 189
    .end local v1    # "ex":Ljava/io/UnsupportedEncodingException;
    .end local v3    # "r":Ljava/io/BufferedReader;
    :catchall_51
    move-exception v6

    monitor-exit p0

    throw v6

    .line 215
    .restart local v3    # "r":Ljava/io/BufferedReader;
    .restart local v5    # "s":Ljava/lang/String;
    :cond_54
    :try_start_54
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_57
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_57} :catch_58
    .catchall {:try_start_54 .. :try_end_57} :catchall_51

    goto :goto_6

    .line 216
    :catch_58
    move-exception v6

    goto :goto_6

    .line 214
    .end local v5    # "s":Ljava/lang/String;
    :catchall_5a
    move-exception v6

    .line 215
    :try_start_5b
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5e} :catch_5f
    .catchall {:try_start_5b .. :try_end_5e} :catchall_51

    .line 216
    :goto_5e
    :try_start_5e
    throw v6
    :try_end_5f
    .catchall {:try_start_5e .. :try_end_5f} :catchall_51

    :catch_5f
    move-exception v7

    goto :goto_5e
.end method

.method declared-synchronized stat()Lcom/sun/mail/pop3/Status;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 362
    monitor-enter p0

    :try_start_1
    const-string v3, "STAT"

    invoke-direct {p0, v3}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 363
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    new-instance v1, Lcom/sun/mail/pop3/Status;

    invoke-direct {v1}, Lcom/sun/mail/pop3/Status;-><init>()V

    .line 373
    .local v1, "s":Lcom/sun/mail/pop3/Status;
    iget-boolean v3, v0, Lcom/sun/mail/pop3/Response;->ok:Z

    if-nez v3, :cond_2e

    .line 374
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "STAT command failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v0, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_2b
    .catchall {:try_start_1 .. :try_end_2b} :catchall_2b

    .line 362
    .end local v0    # "r":Lcom/sun/mail/pop3/Response;
    .end local v1    # "s":Lcom/sun/mail/pop3/Status;
    :catchall_2b
    move-exception v3

    monitor-exit p0

    throw v3

    .line 376
    .restart local v0    # "r":Lcom/sun/mail/pop3/Response;
    .restart local v1    # "s":Lcom/sun/mail/pop3/Status;
    :cond_2e
    :try_start_2e
    iget-object v3, v0, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;
    :try_end_30
    .catchall {:try_start_2e .. :try_end_30} :catchall_2b

    if-eqz v3, :cond_4d

    .line 378
    :try_start_32
    new-instance v2, Ljava/util/StringTokenizer;

    iget-object v3, v0, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 379
    .local v2, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v1, Lcom/sun/mail/pop3/Status;->total:I

    .line 380
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v1, Lcom/sun/mail/pop3/Status;->size:I
    :try_end_4d
    .catch Ljava/lang/RuntimeException; {:try_start_32 .. :try_end_4d} :catch_4f
    .catchall {:try_start_32 .. :try_end_4d} :catchall_2b

    .line 384
    .end local v2    # "st":Ljava/util/StringTokenizer;
    :cond_4d
    :goto_4d
    monitor-exit p0

    return-object v1

    .line 381
    :catch_4f
    move-exception v3

    goto :goto_4d
.end method

.method declared-synchronized stls()Z
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 643
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    instance-of v3, v3, Ljavax/net/ssl/SSLSocket;
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_42

    if-eqz v3, :cond_a

    .line 644
    const/4 v3, 0x1

    .line 665
    :goto_8
    monitor-exit p0

    return v3

    .line 645
    :cond_a
    :try_start_a
    const-string v3, "STLS"

    invoke-direct {p0, v3}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v1

    .line 646
    .local v1, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v3, v1, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_12
    .catchall {:try_start_a .. :try_end_12} :catchall_42

    if-eqz v3, :cond_25

    .line 649
    :try_start_14
    iget-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    iget-object v4, p0, Lcom/sun/mail/pop3/Protocol;->host:Ljava/lang/String;

    iget-object v5, p0, Lcom/sun/mail/pop3/Protocol;->props:Ljava/util/Properties;

    iget-object v6, p0, Lcom/sun/mail/pop3/Protocol;->prefix:Ljava/lang/String;

    invoke-static {v3, v4, v5, v6}, Lcom/sun/mail/util/SocketFetcher;->startTLS(Ljava/net/Socket;Ljava/lang/String;Ljava/util/Properties;Ljava/lang/String;)Ljava/net/Socket;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 650
    invoke-direct {p0}, Lcom/sun/mail/pop3/Protocol;->initStreams()V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_25} :catch_28
    .catchall {:try_start_14 .. :try_end_25} :catchall_42

    .line 665
    :cond_25
    :try_start_25
    iget-boolean v3, v1, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_27
    .catchall {:try_start_25 .. :try_end_27} :catchall_42

    goto :goto_8

    .line 651
    :catch_28
    move-exception v0

    .line 653
    .local v0, "ioex":Ljava/io/IOException;
    :try_start_29
    iget-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_2e
    .catchall {:try_start_29 .. :try_end_2e} :catchall_45

    .line 655
    const/4 v3, 0x0

    :try_start_2f
    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 656
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    .line 657
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;

    .line 659
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Could not convert socket to TLS"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 661
    .local v2, "sioex":Ljava/io/IOException;
    invoke-virtual {v2, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 662
    throw v2
    :try_end_42
    .catchall {:try_start_2f .. :try_end_42} :catchall_42

    .line 643
    .end local v0    # "ioex":Ljava/io/IOException;
    .end local v1    # "r":Lcom/sun/mail/pop3/Response;
    .end local v2    # "sioex":Ljava/io/IOException;
    :catchall_42
    move-exception v3

    monitor-exit p0

    throw v3

    .line 655
    .restart local v0    # "ioex":Ljava/io/IOException;
    .restart local v1    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_45
    move-exception v3

    const/4 v4, 0x0

    :try_start_47
    iput-object v4, p0, Lcom/sun/mail/pop3/Protocol;->socket:Ljava/net/Socket;

    .line 656
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/sun/mail/pop3/Protocol;->input:Ljava/io/DataInputStream;

    .line 657
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/sun/mail/pop3/Protocol;->output:Ljava/io/PrintWriter;

    throw v3
    :try_end_50
    .catchall {:try_start_47 .. :try_end_50} :catchall_42
.end method

.method declared-synchronized top(II)Ljava/io/InputStream;
    .registers 6
    .param p1, "msg"    # I
    .param p2, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 570
    monitor-enter p0

    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TOP "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/sun/mail/pop3/Protocol;->multilineCommand(Ljava/lang/String;I)Lcom/sun/mail/pop3/Response;

    move-result-object v0

    .line 571
    .local v0, "r":Lcom/sun/mail/pop3/Response;
    iget-object v1, v0, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;
    :try_end_25
    .catchall {:try_start_1 .. :try_end_25} :catchall_27

    monitor-exit p0

    return-object v1

    .line 570
    .end local v0    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_27
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized uidl(I)Ljava/lang/String;
    .registers 7
    .param p1, "msg"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 586
    monitor-enter p0

    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UIDL "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/sun/mail/pop3/Protocol;->simpleCommand(Ljava/lang/String;)Lcom/sun/mail/pop3/Response;

    move-result-object v1

    .line 587
    .local v1, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v3, v1, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_1b
    .catchall {:try_start_2 .. :try_end_1b} :catchall_32

    if-nez v3, :cond_1f

    .line 593
    :cond_1d
    :goto_1d
    monitor-exit p0

    return-object v2

    .line 589
    :cond_1f
    :try_start_1f
    iget-object v3, v1, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 590
    .local v0, "i":I
    if-lez v0, :cond_1d

    .line 591
    iget-object v2, v1, Lcom/sun/mail/pop3/Response;->data:Ljava/lang/String;

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_30
    .catchall {:try_start_1f .. :try_end_30} :catchall_32

    move-result-object v2

    goto :goto_1d

    .line 586
    .end local v0    # "i":I
    .end local v1    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_32
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method declared-synchronized uidl([Ljava/lang/String;)Z
    .registers 11
    .param p1, "uids"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 601
    monitor-enter p0

    :try_start_3
    const-string v7, "UIDL"

    array-length v8, p1

    mul-int/lit8 v8, v8, 0xf

    invoke-direct {p0, v7, v8}, Lcom/sun/mail/pop3/Protocol;->multilineCommand(Ljava/lang/String;I)Lcom/sun/mail/pop3/Response;

    move-result-object v4

    .line 602
    .local v4, "r":Lcom/sun/mail/pop3/Response;
    iget-boolean v7, v4, Lcom/sun/mail/pop3/Response;->ok:Z
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_47

    if-nez v7, :cond_12

    .line 619
    :goto_10
    monitor-exit p0

    return v5

    .line 604
    :cond_12
    :try_start_12
    new-instance v2, Lcom/sun/mail/util/LineInputStream;

    iget-object v5, v4, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;

    invoke-direct {v2, v5}, Lcom/sun/mail/util/LineInputStream;-><init>(Ljava/io/InputStream;)V

    .line 605
    .local v2, "lis":Lcom/sun/mail/util/LineInputStream;
    const/4 v1, 0x0

    .line 606
    .local v1, "line":Ljava/lang/String;
    :cond_1a
    :goto_1a
    invoke-virtual {v2}, Lcom/sun/mail/util/LineInputStream;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4a

    .line 607
    const/16 v5, 0x20

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 608
    .local v0, "i":I
    if-lt v0, v6, :cond_1a

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v0, v5, :cond_1a

    .line 610
    const/4 v5, 0x0

    invoke-virtual {v1, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 611
    .local v3, "n":I
    if-lez v3, :cond_1a

    array-length v5, p1

    if-gt v3, v5, :cond_1a

    .line 612
    add-int/lit8 v5, v3, -0x1

    add-int/lit8 v7, v0, 0x1

    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, p1, v5
    :try_end_46
    .catchall {:try_start_12 .. :try_end_46} :catchall_47

    goto :goto_1a

    .line 601
    .end local v0    # "i":I
    .end local v1    # "line":Ljava/lang/String;
    .end local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    .end local v3    # "n":I
    .end local v4    # "r":Lcom/sun/mail/pop3/Response;
    :catchall_47
    move-exception v5

    monitor-exit p0

    throw v5

    .line 615
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v2    # "lis":Lcom/sun/mail/util/LineInputStream;
    .restart local v4    # "r":Lcom/sun/mail/pop3/Response;
    :cond_4a
    :try_start_4a
    iget-object v5, v4, Lcom/sun/mail/pop3/Response;->bytes:Ljava/io/InputStream;

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4f} :catch_51
    .catchall {:try_start_4a .. :try_end_4f} :catchall_47

    :goto_4f
    move v5, v6

    .line 619
    goto :goto_10

    .line 616
    :catch_51
    move-exception v5

    goto :goto_4f
.end method
