.class public Lcom/sun/mail/imap/IMAPInputStream;
.super Ljava/io/InputStream;
.source "IMAPInputStream.java"


# static fields
.field private static final slop:I = 0x40


# instance fields
.field private blksize:I

.field private buf:[B

.field private bufcount:I

.field private bufpos:I

.field private lastBuffer:Z

.field private max:I

.field private msg:Lcom/sun/mail/imap/IMAPMessage;

.field private peek:Z

.field private pos:I

.field private readbuf:Lcom/sun/mail/iap/ByteArray;

.field private section:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/sun/mail/imap/IMAPMessage;Ljava/lang/String;IZ)V
    .registers 6
    .param p1, "msg"    # Lcom/sun/mail/imap/IMAPMessage;
    .param p2, "section"    # Ljava/lang/String;
    .param p3, "max"    # I
    .param p4, "peek"    # Z

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 87
    iput-object p1, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    .line 88
    iput-object p2, p0, Lcom/sun/mail/imap/IMAPInputStream;->section:Ljava/lang/String;

    .line 89
    iput p3, p0, Lcom/sun/mail/imap/IMAPInputStream;->max:I

    .line 90
    iput-boolean p4, p0, Lcom/sun/mail/imap/IMAPInputStream;->peek:Z

    .line 91
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    .line 92
    invoke-virtual {p1}, Lcom/sun/mail/imap/IMAPMessage;->getFetchBlockSize()I

    move-result v0

    iput v0, p0, Lcom/sun/mail/imap/IMAPInputStream;->blksize:I

    .line 93
    return-void
.end method

.method private checkSeen()V
    .registers 5

    .prologue
    const/4 v2, 0x1

    .line 265
    iget-boolean v1, p0, Lcom/sun/mail/imap/IMAPInputStream;->peek:Z

    if-eqz v1, :cond_6

    .line 275
    :cond_5
    :goto_5
    return-void

    .line 268
    :cond_6
    :try_start_6
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v1}, Lcom/sun/mail/imap/IMAPMessage;->getFolder()Lkorex/mail/Folder;

    move-result-object v0

    .line 269
    .local v0, "f":Lkorex/mail/Folder;
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lkorex/mail/Folder;->getMode()I

    move-result v1

    if-eq v1, v2, :cond_5

    iget-object v1, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    sget-object v2, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    .line 270
    invoke-virtual {v1, v2}, Lcom/sun/mail/imap/IMAPMessage;->isSet(Lkorex/mail/Flags$Flag;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 271
    iget-object v1, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    sget-object v2, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/sun/mail/imap/IMAPMessage;->setFlag(Lkorex/mail/Flags$Flag;Z)V
    :try_end_26
    .catch Lkorex/mail/MessagingException; {:try_start_6 .. :try_end_26} :catch_27

    goto :goto_5

    .line 272
    .end local v0    # "f":Lkorex/mail/Folder;
    :catch_27
    move-exception v1

    goto :goto_5
.end method

.method private fill()V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 128
    iget-boolean v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->lastBuffer:Z

    if-nez v2, :cond_f

    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->max:I

    if-eq v2, v5, :cond_1a

    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->max:I

    if-lt v2, v3, :cond_1a

    .line 129
    :cond_f
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    if-nez v2, :cond_16

    .line 130
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPInputStream;->checkSeen()V

    .line 131
    :cond_16
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->readbuf:Lcom/sun/mail/iap/ByteArray;

    .line 186
    :goto_19
    return-void

    .line 135
    :cond_1a
    const/4 v6, 0x0

    .line 136
    .local v6, "b":Lcom/sun/mail/imap/protocol/BODY;
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->readbuf:Lcom/sun/mail/iap/ByteArray;

    if-nez v2, :cond_2a

    .line 137
    new-instance v2, Lcom/sun/mail/iap/ByteArray;

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->blksize:I

    add-int/lit8 v3, v3, 0x40

    invoke-direct {v2, v3}, Lcom/sun/mail/iap/ByteArray;-><init>(I)V

    iput-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->readbuf:Lcom/sun/mail/iap/ByteArray;

    .line 142
    :cond_2a
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v11

    monitor-enter v11

    .line 144
    :try_start_31
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v0

    .line 147
    .local v0, "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->isExpunged()Z

    move-result v2

    if-eqz v2, :cond_58

    .line 148
    new-instance v2, Lcom/sun/mail/util/MessageRemovedIOException;

    const-string v3, "No content for expunged message"

    invoke-direct {v2, v3}, Lcom/sun/mail/util/MessageRemovedIOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_47
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_31 .. :try_end_47} :catch_47
    .catch Lkorex/mail/FolderClosedException; {:try_start_31 .. :try_end_47} :catch_9f
    .catchall {:try_start_31 .. :try_end_47} :catchall_55

    .line 159
    .end local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :catch_47
    move-exception v10

    .line 160
    .local v10, "pex":Lcom/sun/mail/iap/ProtocolException;
    :try_start_48
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPInputStream;->forceCheckExpunged()V

    .line 161
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v10}, Lcom/sun/mail/iap/ProtocolException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 171
    .end local v10    # "pex":Lcom/sun/mail/iap/ProtocolException;
    :catchall_55
    move-exception v2

    monitor-exit v11
    :try_end_57
    .catchall {:try_start_48 .. :try_end_57} :catchall_55

    throw v2

    .line 151
    .restart local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    :cond_58
    :try_start_58
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v1

    .line 152
    .local v1, "seqnum":I
    iget v4, p0, Lcom/sun/mail/imap/IMAPInputStream;->blksize:I

    .line 153
    .local v4, "cnt":I
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->max:I

    if-eq v2, v5, :cond_73

    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->blksize:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->max:I

    if-le v2, v3, :cond_73

    .line 154
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->max:I

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    sub-int v4, v2, v3

    .line 155
    :cond_73
    iget-boolean v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->peek:Z

    if-eqz v2, :cond_94

    .line 156
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->section:Ljava/lang/String;

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPInputStream;->readbuf:Lcom/sun/mail/iap/ByteArray;

    invoke-virtual/range {v0 .. v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->peekBody(ILjava/lang/String;IILcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;
    :try_end_80
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_58 .. :try_end_80} :catch_47
    .catch Lkorex/mail/FolderClosedException; {:try_start_58 .. :try_end_80} :catch_9f
    .catchall {:try_start_58 .. :try_end_80} :catchall_55

    move-result-object v6

    .line 167
    :goto_81
    if-eqz v6, :cond_89

    :try_start_83
    invoke-virtual {v6}, Lcom/sun/mail/imap/protocol/BODY;->getByteArray()Lcom/sun/mail/iap/ByteArray;

    move-result-object v7

    .local v7, "ba":Lcom/sun/mail/iap/ByteArray;
    if-nez v7, :cond_ae

    .line 168
    .end local v7    # "ba":Lcom/sun/mail/iap/ByteArray;
    :cond_89
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPInputStream;->forceCheckExpunged()V

    .line 169
    new-instance v2, Ljava/io/IOException;

    const-string v3, "No content"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_94
    .catchall {:try_start_83 .. :try_end_94} :catchall_55

    .line 158
    :cond_94
    :try_start_94
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->section:Ljava/lang/String;

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    iget-object v5, p0, Lcom/sun/mail/imap/IMAPInputStream;->readbuf:Lcom/sun/mail/iap/ByteArray;

    invoke-virtual/range {v0 .. v5}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->fetchBody(ILjava/lang/String;IILcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/imap/protocol/BODY;
    :try_end_9d
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_94 .. :try_end_9d} :catch_47
    .catch Lkorex/mail/FolderClosedException; {:try_start_94 .. :try_end_9d} :catch_9f
    .catchall {:try_start_94 .. :try_end_9d} :catchall_55

    move-result-object v6

    goto :goto_81

    .line 162
    .end local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .end local v1    # "seqnum":I
    .end local v4    # "cnt":I
    :catch_9f
    move-exception v8

    .line 163
    .local v8, "fex":Lkorex/mail/FolderClosedException;
    :try_start_a0
    new-instance v2, Lcom/sun/mail/util/FolderClosedIOException;

    invoke-virtual {v8}, Lkorex/mail/FolderClosedException;->getFolder()Lkorex/mail/Folder;

    move-result-object v3

    .line 164
    invoke-virtual {v8}, Lkorex/mail/FolderClosedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v5}, Lcom/sun/mail/util/FolderClosedIOException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v2

    .line 171
    .end local v8    # "fex":Lkorex/mail/FolderClosedException;
    .restart local v0    # "p":Lcom/sun/mail/imap/protocol/IMAPProtocol;
    .restart local v1    # "seqnum":I
    .restart local v4    # "cnt":I
    .restart local v7    # "ba":Lcom/sun/mail/iap/ByteArray;
    :cond_ae
    monitor-exit v11
    :try_end_af
    .catchall {:try_start_a0 .. :try_end_af} :catchall_55

    .line 174
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    if-nez v2, :cond_b6

    .line 175
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPInputStream;->checkSeen()V

    .line 178
    :cond_b6
    invoke-virtual {v7}, Lcom/sun/mail/iap/ByteArray;->getBytes()[B

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->buf:[B

    .line 179
    invoke-virtual {v7}, Lcom/sun/mail/iap/ByteArray;->getStart()I

    move-result v2

    iput v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    .line 180
    invoke-virtual {v7}, Lcom/sun/mail/iap/ByteArray;->getCount()I

    move-result v9

    .line 183
    .local v9, "n":I
    if-ge v9, v4, :cond_d7

    const/4 v2, 0x1

    :goto_c9
    iput-boolean v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->lastBuffer:Z

    .line 184
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    add-int/2addr v2, v9

    iput v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufcount:I

    .line 185
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    add-int/2addr v2, v9

    iput v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->pos:I

    goto/16 :goto_19

    .line 183
    :cond_d7
    const/4 v2, 0x0

    goto :goto_c9
.end method

.method private forceCheckExpunged()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/util/MessageRemovedIOException;,
            Lcom/sun/mail/util/FolderClosedIOException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getMessageCacheLock()Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 103
    :try_start_7
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getProtocol()Lcom/sun/mail/imap/protocol/IMAPProtocol;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPProtocol;->noop()V
    :try_end_10
    .catch Lcom/sun/mail/iap/ConnectionException; {:try_start_7 .. :try_end_10} :catch_1f
    .catch Lkorex/mail/FolderClosedException; {:try_start_7 .. :try_end_10} :catch_33
    .catch Lcom/sun/mail/iap/ProtocolException; {:try_start_7 .. :try_end_10} :catch_43
    .catchall {:try_start_7 .. :try_end_10} :catchall_30

    .line 113
    :goto_10
    :try_start_10
    monitor-exit v3
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_30

    .line 114
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->isExpunged()Z

    move-result v2

    if-eqz v2, :cond_42

    .line 115
    new-instance v2, Lcom/sun/mail/util/MessageRemovedIOException;

    invoke-direct {v2}, Lcom/sun/mail/util/MessageRemovedIOException;-><init>()V

    throw v2

    .line 104
    :catch_1f
    move-exception v0

    .line 105
    .local v0, "cex":Lcom/sun/mail/iap/ConnectionException;
    :try_start_20
    new-instance v2, Lcom/sun/mail/util/FolderClosedIOException;

    iget-object v4, p0, Lcom/sun/mail/imap/IMAPInputStream;->msg:Lcom/sun/mail/imap/IMAPMessage;

    invoke-virtual {v4}, Lcom/sun/mail/imap/IMAPMessage;->getFolder()Lkorex/mail/Folder;

    move-result-object v4

    .line 106
    invoke-virtual {v0}, Lcom/sun/mail/iap/ConnectionException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Lcom/sun/mail/util/FolderClosedIOException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v2

    .line 113
    .end local v0    # "cex":Lcom/sun/mail/iap/ConnectionException;
    :catchall_30
    move-exception v2

    monitor-exit v3
    :try_end_32
    .catchall {:try_start_20 .. :try_end_32} :catchall_30

    throw v2

    .line 107
    :catch_33
    move-exception v1

    .line 108
    .local v1, "fex":Lkorex/mail/FolderClosedException;
    :try_start_34
    new-instance v2, Lcom/sun/mail/util/FolderClosedIOException;

    invoke-virtual {v1}, Lkorex/mail/FolderClosedException;->getFolder()Lkorex/mail/Folder;

    move-result-object v4

    .line 109
    invoke-virtual {v1}, Lkorex/mail/FolderClosedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Lcom/sun/mail/util/FolderClosedIOException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v2
    :try_end_42
    .catchall {:try_start_34 .. :try_end_42} :catchall_30

    .line 116
    .end local v1    # "fex":Lkorex/mail/FolderClosedException;
    :cond_42
    return-void

    .line 110
    :catch_43
    move-exception v2

    goto :goto_10
.end method


# virtual methods
.method public declared-synchronized available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 254
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufcount:I

    iget v1, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I
    :try_end_5
    .catchall {:try_start_1 .. :try_end_5} :catchall_8

    sub-int/2addr v0, v1

    monitor-exit p0

    return v0

    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 193
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    iget v1, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufcount:I

    if-lt v0, v1, :cond_13

    .line 194
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPInputStream;->fill()V

    .line 195
    iget v0, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    iget v1, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufcount:I
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_20

    if-lt v0, v1, :cond_13

    .line 196
    const/4 v0, -0x1

    .line 198
    :goto_11
    monitor-exit p0

    return v0

    :cond_13
    :try_start_13
    iget-object v0, p0, Lcom/sun/mail/imap/IMAPInputStream;->buf:[B

    iget v1, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    aget-byte v0, v0, v1
    :try_end_1d
    .catchall {:try_start_13 .. :try_end_1d} :catchall_20

    and-int/lit16 v0, v0, 0xff

    goto :goto_11

    .line 193
    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public read([B)I
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/sun/mail/imap/IMAPInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public declared-synchronized read([BII)I
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    monitor-enter p0

    :try_start_1
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufcount:I

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    sub-int v0, v2, v3

    .line 219
    .local v0, "avail":I
    if-gtz v0, :cond_17

    .line 220
    invoke-direct {p0}, Lcom/sun/mail/imap/IMAPInputStream;->fill()V

    .line 221
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufcount:I

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_27

    sub-int v0, v2, v3

    .line 222
    if-gtz v0, :cond_17

    .line 223
    const/4 v1, -0x1

    .line 228
    :goto_15
    monitor-exit p0

    return v1

    .line 225
    :cond_17
    if-ge v0, p3, :cond_2a

    move v1, v0

    .line 226
    .local v1, "cnt":I
    :goto_1a
    :try_start_1a
    iget-object v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->buf:[B

    iget v3, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 227
    iget v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/sun/mail/imap/IMAPInputStream;->bufpos:I
    :try_end_26
    .catchall {:try_start_1a .. :try_end_26} :catchall_27

    goto :goto_15

    .line 218
    .end local v0    # "avail":I
    .end local v1    # "cnt":I
    :catchall_27
    move-exception v2

    monitor-exit p0

    throw v2

    .restart local v0    # "avail":I
    :cond_2a
    move v1, p3

    .line 225
    goto :goto_1a
.end method
