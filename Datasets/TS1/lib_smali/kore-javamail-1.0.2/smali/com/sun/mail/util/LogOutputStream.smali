.class public Lcom/sun/mail/util/LogOutputStream;
.super Ljava/io/OutputStream;
.source "LogOutputStream.java"


# instance fields
.field private buf:[B

.field private lastb:I

.field protected level:Ljava/util/logging/Level;

.field protected logger:Lcom/sun/mail/util/MailLogger;

.field private pos:I


# direct methods
.method public constructor <init>(Lcom/sun/mail/util/MailLogger;)V
    .registers 3
    .param p1, "logger"    # Lcom/sun/mail/util/MailLogger;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lcom/sun/mail/util/LogOutputStream;->lastb:I

    .line 55
    const/16 v0, 0x50

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    .line 62
    iput-object p1, p0, Lcom/sun/mail/util/LogOutputStream;->logger:Lcom/sun/mail/util/MailLogger;

    .line 63
    sget-object v0, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    iput-object v0, p0, Lcom/sun/mail/util/LogOutputStream;->level:Ljava/util/logging/Level;

    .line 64
    return-void
.end method

.method private expandCapacity(I)V
    .registers 6
    .param p1, "len"    # I

    .prologue
    const/4 v3, 0x0

    .line 139
    :goto_1
    iget v1, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    array-length v2, v2

    if-le v1, v2, :cond_1a

    .line 140
    iget-object v1, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    new-array v0, v1, [B

    .line 141
    .local v0, "nb":[B
    iget-object v1, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    iget v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    iput-object v0, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    goto :goto_1

    .line 144
    .end local v0    # "nb":[B
    :cond_1a
    return-void
.end method

.method private logBuf()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 129
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    iget v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    invoke-direct {v0, v1, v3, v2}, Ljava/lang/String;-><init>([BII)V

    .line 130
    .local v0, "msg":Ljava/lang/String;
    iput v3, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    .line 131
    invoke-virtual {p0, v0}, Lcom/sun/mail/util/LogOutputStream;->log(Ljava/lang/String;)V

    .line 132
    return-void
.end method


# virtual methods
.method protected log(Ljava/lang/String;)V
    .registers 4
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/sun/mail/util/LogOutputStream;->logger:Lcom/sun/mail/util/MailLogger;

    iget-object v1, p0, Lcom/sun/mail/util/LogOutputStream;->level:Ljava/util/logging/Level;

    invoke-virtual {v0, v1, p1}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public write(I)V
    .registers 5
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0xd

    .line 67
    iget-object v0, p0, Lcom/sun/mail/util/LogOutputStream;->logger:Lcom/sun/mail/util/MailLogger;

    iget-object v1, p0, Lcom/sun/mail/util/LogOutputStream;->level:Ljava/util/logging/Level;

    invoke-virtual {v0, v1}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 80
    :goto_c
    return-void

    .line 70
    :cond_d
    if-ne p1, v2, :cond_15

    .line 71
    invoke-direct {p0}, Lcom/sun/mail/util/LogOutputStream;->logBuf()V

    .line 79
    :cond_12
    :goto_12
    iput p1, p0, Lcom/sun/mail/util/LogOutputStream;->lastb:I

    goto :goto_c

    .line 72
    :cond_15
    const/16 v0, 0xa

    if-ne p1, v0, :cond_21

    .line 73
    iget v0, p0, Lcom/sun/mail/util/LogOutputStream;->lastb:I

    if-eq v0, v2, :cond_12

    .line 74
    invoke-direct {p0}, Lcom/sun/mail/util/LogOutputStream;->logBuf()V

    goto :goto_12

    .line 76
    :cond_21
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/sun/mail/util/LogOutputStream;->expandCapacity(I)V

    .line 77
    iget-object v0, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    iget v1, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    goto :goto_12
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/sun/mail/util/LogOutputStream;->write([BII)V

    .line 84
    return-void
.end method

.method public write([BII)V
    .registers 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0xd

    .line 87
    move v1, p2

    .line 89
    .local v1, "start":I
    iget-object v2, p0, Lcom/sun/mail/util/LogOutputStream;->logger:Lcom/sun/mail/util/MailLogger;

    iget-object v3, p0, Lcom/sun/mail/util/LogOutputStream;->level:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-nez v2, :cond_e

    .line 115
    :cond_d
    :goto_d
    return-void

    .line 91
    :cond_e
    add-int/2addr p3, p2

    .line 92
    move v0, v1

    .local v0, "i":I
    :goto_10
    if-ge v0, p3, :cond_5c

    .line 93
    aget-byte v2, p1, v0

    if-ne v2, v5, :cond_37

    .line 94
    sub-int v2, v0, v1

    invoke-direct {p0, v2}, Lcom/sun/mail/util/LogOutputStream;->expandCapacity(I)V

    .line 95
    iget-object v2, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    iget v3, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    sub-int v4, v0, v1

    invoke-static {p1, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 96
    iget v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    sub-int v3, v0, v1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    .line 97
    invoke-direct {p0}, Lcom/sun/mail/util/LogOutputStream;->logBuf()V

    .line 98
    add-int/lit8 v1, v0, 0x1

    .line 108
    :cond_30
    :goto_30
    aget-byte v2, p1, v0

    iput v2, p0, Lcom/sun/mail/util/LogOutputStream;->lastb:I

    .line 92
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 99
    :cond_37
    aget-byte v2, p1, v0

    const/16 v3, 0xa

    if-ne v2, v3, :cond_30

    .line 100
    iget v2, p0, Lcom/sun/mail/util/LogOutputStream;->lastb:I

    if-eq v2, v5, :cond_59

    .line 101
    sub-int v2, v0, v1

    invoke-direct {p0, v2}, Lcom/sun/mail/util/LogOutputStream;->expandCapacity(I)V

    .line 102
    iget-object v2, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    iget v3, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    sub-int v4, v0, v1

    invoke-static {p1, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    iget v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    sub-int v3, v0, v1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    .line 104
    invoke-direct {p0}, Lcom/sun/mail/util/LogOutputStream;->logBuf()V

    .line 106
    :cond_59
    add-int/lit8 v1, v0, 0x1

    goto :goto_30

    .line 110
    :cond_5c
    sub-int v2, p3, v1

    if-lez v2, :cond_d

    .line 111
    sub-int v2, p3, v1

    invoke-direct {p0, v2}, Lcom/sun/mail/util/LogOutputStream;->expandCapacity(I)V

    .line 112
    iget-object v2, p0, Lcom/sun/mail/util/LogOutputStream;->buf:[B

    iget v3, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    sub-int v4, p3, v1

    invoke-static {p1, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 113
    iget v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    sub-int v3, p3, v1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/sun/mail/util/LogOutputStream;->pos:I

    goto :goto_d
.end method
