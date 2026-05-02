.class public Lcom/sun/mail/util/TraceOutputStream;
.super Ljava/io/FilterOutputStream;
.source "TraceOutputStream.java"


# instance fields
.field private quote:Z

.field private trace:Z

.field private traceOut:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lcom/sun/mail/util/MailLogger;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "logger"    # Lcom/sun/mail/util/MailLogger;

    .prologue
    const/4 v0, 0x0

    .line 68
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 56
    iput-boolean v0, p0, Lcom/sun/mail/util/TraceOutputStream;->trace:Z

    .line 57
    iput-boolean v0, p0, Lcom/sun/mail/util/TraceOutputStream;->quote:Z

    .line 69
    sget-object v0, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    invoke-virtual {p2, v0}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sun/mail/util/TraceOutputStream;->trace:Z

    .line 70
    new-instance v0, Lcom/sun/mail/util/LogOutputStream;

    invoke-direct {v0, p2}, Lcom/sun/mail/util/LogOutputStream;-><init>(Lcom/sun/mail/util/MailLogger;)V

    iput-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "traceOut"    # Ljava/io/OutputStream;

    .prologue
    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 56
    iput-boolean v0, p0, Lcom/sun/mail/util/TraceOutputStream;->trace:Z

    .line 57
    iput-boolean v0, p0, Lcom/sun/mail/util/TraceOutputStream;->quote:Z

    .line 82
    iput-object p2, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

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

    .line 135
    and-int/lit16 p1, p1, 0xff

    .line 136
    const/16 v0, 0x7f

    if-le p1, v0, :cond_1a

    .line 137
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x4d

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 138
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 139
    and-int/lit8 p1, p1, 0x7f

    .line 141
    :cond_1a
    const/16 v0, 0xd

    if-ne p1, v0, :cond_2b

    .line 142
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 143
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x72

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 157
    :goto_2a
    return-void

    .line 144
    :cond_2b
    if-ne p1, v3, :cond_3f

    .line 145
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 146
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x6e

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 147
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, v3}, Ljava/io/OutputStream;->write(I)V

    goto :goto_2a

    .line 148
    :cond_3f
    const/16 v0, 0x9

    if-ne p1, v0, :cond_50

    .line 149
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 150
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x74

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_2a

    .line 151
    :cond_50
    const/16 v0, 0x20

    if-ge p1, v0, :cond_63

    .line 152
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    const/16 v1, 0x5e

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 153
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    add-int/lit8 v1, p1, 0x40

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_2a

    .line 155
    :cond_63
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_2a
.end method


# virtual methods
.method public setQuote(Z)V
    .registers 2
    .param p1, "quote"    # Z

    .prologue
    .line 97
    iput-boolean p1, p0, Lcom/sun/mail/util/TraceOutputStream;->quote:Z

    .line 98
    return-void
.end method

.method public setTrace(Z)V
    .registers 2
    .param p1, "trace"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/sun/mail/util/TraceOutputStream;->trace:Z

    .line 90
    return-void
.end method

.method public write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/sun/mail/util/TraceOutputStream;->trace:Z

    if-eqz v0, :cond_b

    .line 107
    iget-boolean v0, p0, Lcom/sun/mail/util/TraceOutputStream;->quote:Z

    if-eqz v0, :cond_11

    .line 108
    invoke-direct {p0, p1}, Lcom/sun/mail/util/TraceOutputStream;->writeByte(I)V

    .line 112
    :cond_b
    :goto_b
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 113
    return-void

    .line 110
    :cond_11
    iget-object v0, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_b
.end method

.method public write([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    iget-boolean v1, p0, Lcom/sun/mail/util/TraceOutputStream;->trace:Z

    if-eqz v1, :cond_1a

    .line 122
    iget-boolean v1, p0, Lcom/sun/mail/util/TraceOutputStream;->quote:Z

    if-eqz v1, :cond_15

    .line 123
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    if-ge v0, p3, :cond_1a

    .line 124
    add-int v1, p2, v0

    aget-byte v1, p1, v1

    invoke-direct {p0, v1}, Lcom/sun/mail/util/TraceOutputStream;->writeByte(I)V

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 126
    .end local v0    # "i":I
    :cond_15
    iget-object v1, p0, Lcom/sun/mail/util/TraceOutputStream;->traceOut:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 128
    :cond_1a
    iget-object v1, p0, Lcom/sun/mail/util/TraceOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 129
    return-void
.end method
