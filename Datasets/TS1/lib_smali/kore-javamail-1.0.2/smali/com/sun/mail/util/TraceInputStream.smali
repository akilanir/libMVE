.class public Lcom/sun/mail/util/TraceInputStream;
.super Ljava/io/FilterInputStream;
.source "TraceInputStream.java"


# instance fields
.field private quote:Z

.field private trace:Z

.field private traceOut:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lcom/sun/mail/util/MailLogger;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "logger"    # Lcom/sun/mail/util/MailLogger;

    .prologue
    const/4 v0, 0x0

    .line 68
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 56
    iput-boolean v0, p0, Lcom/sun/mail/util/TraceInputStream;->trace:Z

    .line 57
    iput-boolean v0, p0, Lcom/sun/mail/util/TraceInputStream;->quote:Z

    .line 69
    sget-object v0, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {p2, v0}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sun/mail/util/TraceInputStream;->trace:Z

    .line 70
    new-instance v0, Lcom/sun/mail/util/LogOutputStream;

    invoke-direct {v0, p2}, Lcom/sun/mail/util/LogOutputStream;-><init>(Lcom/sun/mail/util/MailLogger;)V

    iput-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "traceOut"    # Ljava/io/OutputStream;

    .prologue
    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 56
    iput-boolean v0, p0, Lcom/sun/mail/util/TraceInputStream;->trace:Z

    .line 57
    iput-boolean v0, p0, Lcom/sun/mail/util/TraceInputStream;->quote:Z

    .line 82
    iput-object p2, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    .line 83
    return-void
.end method

.method private final writeByte(I)V
    .registers 6
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0xa

    const/16 v2, 0x5c

    .line 139
    and-int/lit16 p1, p1, 0xff

    .line 140
    const/16 v0, 0x7f

    if-le p1, v0, :cond_1a

    .line 141
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x4d

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 142
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 143
    and-int/lit8 p1, p1, 0x7f

    .line 145
    :cond_1a
    const/16 v0, 0xd

    if-ne p1, v0, :cond_2b

    .line 146
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 147
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x72

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 161
    :goto_2a
    return-void

    .line 148
    :cond_2b
    if-ne p1, v3, :cond_3f

    .line 149
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 150
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x6e

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 151
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    goto :goto_2a

    .line 152
    :cond_3f
    const/16 v0, 0x9

    if-ne p1, v0, :cond_50

    .line 153
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 154
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x74

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_2a

    .line 155
    :cond_50
    const/16 v0, 0x20

    if-ge p1, v0, :cond_63

    .line 156
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x5e

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 157
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    add-int/lit8 v1, p1, 0x40

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_2a

    .line 159
    :cond_63
    iget-object v0, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_2a
.end method


# virtual methods
.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v1, p0, Lcom/sun/mail/util/TraceInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 108
    .local v0, "b":I
    iget-boolean v1, p0, Lcom/sun/mail/util/TraceInputStream;->trace:Z

    if-eqz v1, :cond_14

    const/4 v1, -0x1

    if-eq v0, v1, :cond_14

    .line 109
    iget-boolean v1, p0, Lcom/sun/mail/util/TraceInputStream;->quote:Z

    if-eqz v1, :cond_15

    .line 110
    invoke-direct {p0, v0}, Lcom/sun/mail/util/TraceInputStream;->writeByte(I)V

    .line 114
    :cond_14
    :goto_14
    return v0

    .line 112
    :cond_15
    iget-object v1, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    goto :goto_14
.end method

.method public read([BII)I
    .registers 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    iget-object v2, p0, Lcom/sun/mail/util/TraceInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 125
    .local v0, "count":I
    iget-boolean v2, p0, Lcom/sun/mail/util/TraceInputStream;->trace:Z

    if-eqz v2, :cond_23

    const/4 v2, -0x1

    if-eq v0, v2, :cond_23

    .line 126
    iget-boolean v2, p0, Lcom/sun/mail/util/TraceInputStream;->quote:Z

    if-eqz v2, :cond_1e

    .line 127
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    if-ge v1, v0, :cond_23

    .line 128
    add-int v2, p2, v1

    aget-byte v2, p1, v2

    invoke-direct {p0, v2}, Lcom/sun/mail/util/TraceInputStream;->writeByte(I)V

    .line 127
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 130
    .end local v1    # "i":I
    :cond_1e
    iget-object v2, p0, Lcom/sun/mail/util/TraceInputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v2, p1, p2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 132
    :cond_23
    return v0
.end method

.method public setQuote(Z)V
    .registers 2
    .param p1, "quote"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/sun/mail/util/TraceInputStream;->quote:Z

    .line 99
    return-void
.end method

.method public setTrace(Z)V
    .registers 2
    .param p1, "trace"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/sun/mail/util/TraceInputStream;->trace:Z

    .line 91
    return-void
.end method
