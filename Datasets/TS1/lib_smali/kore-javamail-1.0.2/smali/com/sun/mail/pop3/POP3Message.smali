.class public Lcom/sun/mail/pop3/POP3Message;
.super Lkorex/mail/internet/MimeMessage;
.source "POP3Message.java"

# interfaces
.implements Lcom/sun/mail/util/ReadableMime;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final UNKNOWN:Ljava/lang/String; = "UNKNOWN"


# instance fields
.field private folder:Lcom/sun/mail/pop3/POP3Folder;

.field private hdrSize:I

.field private msgSize:I

.field private rawData:Ljava/lang/ref/SoftReference;

.field uid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const-class v0, Lcom/sun/mail/pop3/POP3Message;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/pop3/POP3Message;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lkorex/mail/Folder;I)V
    .registers 5
    .param p1, "folder"    # Lkorex/mail/Folder;
    .param p2, "msgno"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 81
    invoke-direct {p0, p1, p2}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Folder;I)V

    .line 72
    iput v0, p0, Lcom/sun/mail/pop3/POP3Message;->hdrSize:I

    .line 73
    iput v0, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    .line 74
    const-string v0, "UNKNOWN"

    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->uid:Ljava/lang/String;

    .line 77
    new-instance v0, Ljava/lang/ref/SoftReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->rawData:Ljava/lang/ref/SoftReference;

    .line 82
    sget-boolean v0, Lcom/sun/mail/pop3/POP3Message;->$assertionsDisabled:Z

    if-nez v0, :cond_22

    instance-of v0, p1, Lcom/sun/mail/pop3/POP3Folder;

    if-nez v0, :cond_22

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 83
    :cond_22
    check-cast p1, Lcom/sun/mail/pop3/POP3Folder;

    .end local p1    # "folder":Lkorex/mail/Folder;
    iput-object p1, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    .line 84
    return-void
.end method

.method private getRawStream(Z)Ljava/io/InputStream;
    .registers 16
    .param p1, "skipHeader"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 158
    const/4 v9, 0x0

    .line 160
    .local v9, "rawcontent":Ljava/io/InputStream;
    :try_start_1
    monitor-enter p0
    :try_end_2
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_2} :catch_88
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_2} :catch_136

    .line 161
    :try_start_2
    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->rawData:Ljava/lang/ref/SoftReference;

    invoke-virtual {v10}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljava/io/InputStream;

    move-object v9, v0

    .line 162
    if-nez v9, :cond_e9

    .line 163
    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v10}, Lcom/sun/mail/pop3/POP3Folder;->getFileCache()Lcom/sun/mail/pop3/TempFile;

    move-result-object v3

    .line 164
    .local v3, "cache":Lcom/sun/mail/pop3/TempFile;
    if-eqz v3, :cond_a0

    .line 165
    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    iget-object v10, v10, Lcom/sun/mail/pop3/POP3Folder;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v11, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v10, v11}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v10

    if-eqz v10, :cond_44

    .line 166
    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    iget-object v10, v10, Lcom/sun/mail/pop3/POP3Folder;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "caching message #"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " in temp file"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 168
    :cond_44
    invoke-virtual {v3}, Lcom/sun/mail/pop3/TempFile;->getAppendStream()Lcom/sun/mail/pop3/AppendStream;

    move-result-object v8

    .line 169
    .local v8, "os":Lcom/sun/mail/pop3/AppendStream;
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-direct {v1, v8}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_4d
    .catchall {:try_start_2 .. :try_end_4d} :catchall_85

    .line 171
    .local v1, "bos":Ljava/io/BufferedOutputStream;
    :try_start_4d
    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v10}, Lcom/sun/mail/pop3/POP3Folder;->getProtocol()Lcom/sun/mail/pop3/Protocol;

    move-result-object v10

    iget v11, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    invoke-virtual {v10, v11, v1}, Lcom/sun/mail/pop3/Protocol;->retr(ILjava/io/OutputStream;)Z
    :try_end_58
    .catchall {:try_start_4d .. :try_end_58} :catchall_9b

    .line 173
    :try_start_58
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    .line 175
    invoke-virtual {v8}, Lcom/sun/mail/pop3/AppendStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    .line 180
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .end local v8    # "os":Lcom/sun/mail/pop3/AppendStream;
    :goto_5f
    if-nez v9, :cond_b8

    .line 181
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/sun/mail/pop3/POP3Message;->expunged:Z

    .line 182
    new-instance v10, Lkorex/mail/MessageRemovedException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "can\'t retrieve message #"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " in POP3Message.getContentStream"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lkorex/mail/MessageRemovedException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 244
    .end local v3    # "cache":Lcom/sun/mail/pop3/TempFile;
    :catchall_85
    move-exception v10

    monitor-exit p0
    :try_end_87
    .catchall {:try_start_58 .. :try_end_87} :catchall_85

    :try_start_87
    throw v10
    :try_end_88
    .catch Ljava/io/EOFException; {:try_start_87 .. :try_end_88} :catch_88
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_88} :catch_136

    .line 245
    :catch_88
    move-exception v4

    .line 246
    .local v4, "eex":Ljava/io/EOFException;
    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lcom/sun/mail/pop3/POP3Folder;->close(Z)V

    .line 247
    new-instance v10, Lkorex/mail/FolderClosedException;

    iget-object v11, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v4}, Ljava/io/EOFException;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v10

    .line 173
    .end local v4    # "eex":Ljava/io/EOFException;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v3    # "cache":Lcom/sun/mail/pop3/TempFile;
    .restart local v8    # "os":Lcom/sun/mail/pop3/AppendStream;
    :catchall_9b
    move-exception v10

    :try_start_9c
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    throw v10

    .line 177
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .end local v8    # "os":Lcom/sun/mail/pop3/AppendStream;
    :cond_a0
    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v10}, Lcom/sun/mail/pop3/POP3Folder;->getProtocol()Lcom/sun/mail/pop3/Protocol;

    move-result-object v11

    iget v12, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    iget v10, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    if-lez v10, :cond_b6

    iget v10, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    iget v13, p0, Lcom/sun/mail/pop3/POP3Message;->hdrSize:I

    add-int/2addr v10, v13

    :goto_b1
    invoke-virtual {v11, v12, v10}, Lcom/sun/mail/pop3/Protocol;->retr(II)Ljava/io/InputStream;

    move-result-object v9

    goto :goto_5f

    :cond_b6
    const/4 v10, 0x0

    goto :goto_b1

    .line 187
    :cond_b8
    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-eqz v10, :cond_ca

    iget-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    .line 188
    invoke-virtual {v10}, Lcom/sun/mail/pop3/POP3Folder;->getStore()Lkorex/mail/Store;

    move-result-object v10

    check-cast v10, Lcom/sun/mail/pop3/POP3Store;

    check-cast v10, Lcom/sun/mail/pop3/POP3Store;

    iget-boolean v10, v10, Lcom/sun/mail/pop3/POP3Store;->forgetTopHeaders:Z

    if-eqz v10, :cond_f8

    .line 189
    :cond_ca
    new-instance v10, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v10, v9}, Lkorex/mail/internet/InternetHeaders;-><init>(Ljava/io/InputStream;)V

    iput-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 190
    move-object v0, v9

    check-cast v0, Lkorex/mail/internet/SharedInputStream;

    move-object v10, v0

    .line 191
    invoke-interface {v10}, Lkorex/mail/internet/SharedInputStream;->getPosition()J

    move-result-wide v10

    long-to-int v10, v10

    iput v10, p0, Lcom/sun/mail/pop3/POP3Message;->hdrSize:I

    .line 240
    :goto_dc
    invoke-virtual {v9}, Ljava/io/InputStream;->available()I

    move-result v10

    iput v10, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    .line 242
    new-instance v10, Ljava/lang/ref/SoftReference;

    invoke-direct {v10, v9}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v10, p0, Lcom/sun/mail/pop3/POP3Message;->rawData:Ljava/lang/ref/SoftReference;

    .line 244
    .end local v3    # "cache":Lcom/sun/mail/pop3/TempFile;
    :cond_e9
    monitor-exit p0
    :try_end_ea
    .catchall {:try_start_9c .. :try_end_ea} :catchall_85

    .line 257
    check-cast v9, Lkorex/mail/internet/SharedInputStream;

    .end local v9    # "rawcontent":Ljava/io/InputStream;
    if-eqz p1, :cond_13f

    iget v10, p0, Lcom/sun/mail/pop3/POP3Message;->hdrSize:I

    int-to-long v10, v10

    :goto_f1
    const-wide/16 v12, -0x1

    invoke-interface {v9, v10, v11, v12, v13}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;

    move-result-object v9

    .line 259
    .restart local v9    # "rawcontent":Ljava/io/InputStream;
    return-object v9

    .line 205
    .restart local v3    # "cache":Lcom/sun/mail/pop3/TempFile;
    :cond_f8
    const/4 v7, 0x0

    .line 207
    .local v7, "offset":I
    :cond_f9
    const/4 v6, 0x0

    .line 209
    .local v6, "len":I
    :goto_fa
    :try_start_fa
    invoke-virtual {v9}, Ljava/io/InputStream;->read()I

    move-result v2

    .local v2, "c1":I
    if-ltz v2, :cond_104

    .line 210
    const/16 v10, 0xa

    if-ne v2, v10, :cond_116

    .line 228
    :cond_104
    :goto_104
    invoke-virtual {v9}, Ljava/io/InputStream;->available()I

    move-result v10

    if-nez v10, :cond_133

    .line 235
    :goto_10a
    move-object v0, v9

    check-cast v0, Lkorex/mail/internet/SharedInputStream;

    move-object v10, v0

    .line 236
    invoke-interface {v10}, Lkorex/mail/internet/SharedInputStream;->getPosition()J

    move-result-wide v10

    long-to-int v10, v10

    iput v10, p0, Lcom/sun/mail/pop3/POP3Message;->hdrSize:I

    goto :goto_dc

    .line 212
    :cond_116
    const/16 v10, 0xd

    if-ne v2, v10, :cond_130

    .line 214
    invoke-virtual {v9}, Ljava/io/InputStream;->available()I

    move-result v10

    if-lez v10, :cond_104

    .line 215
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/io/InputStream;->mark(I)V

    .line 216
    invoke-virtual {v9}, Ljava/io/InputStream;->read()I

    move-result v10

    const/16 v11, 0xa

    if-eq v10, v11, :cond_104

    .line 217
    invoke-virtual {v9}, Ljava/io/InputStream;->reset()V
    :try_end_12f
    .catchall {:try_start_fa .. :try_end_12f} :catchall_85

    goto :goto_104

    .line 223
    :cond_130
    add-int/lit8 v6, v6, 0x1

    goto :goto_fa

    .line 232
    :cond_133
    if-nez v6, :cond_f9

    goto :goto_10a

    .line 248
    .end local v2    # "c1":I
    .end local v3    # "cache":Lcom/sun/mail/pop3/TempFile;
    .end local v6    # "len":I
    .end local v7    # "offset":I
    :catch_136
    move-exception v5

    .line 249
    .local v5, "ex":Ljava/io/IOException;
    new-instance v10, Lkorex/mail/MessagingException;

    const-string v11, "error fetching POP3 content"

    invoke-direct {v10, v11, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v10

    .line 257
    .end local v5    # "ex":Ljava/io/IOException;
    .end local v9    # "rawcontent":Ljava/io/InputStream;
    :cond_13f
    const-wide/16 v10, 0x0

    goto :goto_f1
.end method

.method private loadHeaders()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 602
    sget-boolean v5, Lcom/sun/mail/pop3/POP3Message;->$assertionsDisabled:Z

    if-nez v5, :cond_11

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 604
    :cond_11
    const/4 v3, 0x0

    .line 605
    .local v3, "fetchContent":Z
    :try_start_12
    monitor-enter p0
    :try_end_13
    .catch Ljava/io/EOFException; {:try_start_12 .. :try_end_13} :catch_46
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_13} :catch_6c

    .line 606
    :try_start_13
    iget-object v5, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-eqz v5, :cond_19

    .line 607
    monitor-exit p0

    .line 650
    :cond_18
    :goto_18
    return-void

    .line 608
    :cond_19
    const/4 v4, 0x0

    .line 609
    .local v4, "hdrs":Ljava/io/InputStream;
    iget-object v5, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v5}, Lcom/sun/mail/pop3/POP3Folder;->getStore()Lkorex/mail/Store;

    move-result-object v5

    check-cast v5, Lcom/sun/mail/pop3/POP3Store;

    check-cast v5, Lcom/sun/mail/pop3/POP3Store;

    iget-boolean v5, v5, Lcom/sun/mail/pop3/POP3Store;->disableTop:Z

    if-nez v5, :cond_37

    iget-object v5, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    .line 610
    invoke-virtual {v5}, Lcom/sun/mail/pop3/POP3Folder;->getProtocol()Lcom/sun/mail/pop3/Protocol;

    move-result-object v5

    iget v6, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lcom/sun/mail/pop3/Protocol;->top(II)Ljava/io/InputStream;

    move-result-object v4

    if-nez v4, :cond_58

    .line 614
    :cond_37
    const/4 v3, 0x1

    .line 623
    :goto_38
    monitor-exit p0
    :try_end_39
    .catchall {:try_start_13 .. :try_end_39} :catchall_69

    .line 635
    if-eqz v3, :cond_18

    .line 636
    const/4 v0, 0x0

    .line 638
    .local v0, "cs":Ljava/io/InputStream;
    :try_start_3c
    invoke-virtual {p0}, Lcom/sun/mail/pop3/POP3Message;->getContentStream()Ljava/io/InputStream;
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_7a

    move-result-object v0

    .line 640
    if-eqz v0, :cond_18

    .line 641
    :try_start_42
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_45
    .catch Ljava/io/EOFException; {:try_start_42 .. :try_end_45} :catch_46
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_45} :catch_6c

    goto :goto_18

    .line 644
    .end local v0    # "cs":Ljava/io/InputStream;
    .end local v4    # "hdrs":Ljava/io/InputStream;
    :catch_46
    move-exception v1

    .line 645
    .local v1, "eex":Ljava/io/EOFException;
    iget-object v5, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v5, v8}, Lcom/sun/mail/pop3/POP3Folder;->close(Z)V

    .line 646
    new-instance v5, Lkorex/mail/FolderClosedException;

    iget-object v6, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v1}, Ljava/io/EOFException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v5

    .line 617
    .end local v1    # "eex":Ljava/io/EOFException;
    .restart local v4    # "hdrs":Ljava/io/InputStream;
    :cond_58
    :try_start_58
    invoke-virtual {v4}, Ljava/io/InputStream;->available()I

    move-result v5

    iput v5, p0, Lcom/sun/mail/pop3/POP3Message;->hdrSize:I

    .line 618
    new-instance v5, Lkorex/mail/internet/InternetHeaders;

    invoke-direct {v5, v4}, Lkorex/mail/internet/InternetHeaders;-><init>(Ljava/io/InputStream;)V

    iput-object v5, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;
    :try_end_65
    .catchall {:try_start_58 .. :try_end_65} :catchall_75

    .line 620
    :try_start_65
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    goto :goto_38

    .line 623
    .end local v4    # "hdrs":Ljava/io/InputStream;
    :catchall_69
    move-exception v5

    monitor-exit p0
    :try_end_6b
    .catchall {:try_start_65 .. :try_end_6b} :catchall_69

    :try_start_6b
    throw v5
    :try_end_6c
    .catch Ljava/io/EOFException; {:try_start_6b .. :try_end_6c} :catch_46
    .catch Ljava/io/IOException; {:try_start_6b .. :try_end_6c} :catch_6c

    .line 647
    :catch_6c
    move-exception v2

    .line 648
    .local v2, "ex":Ljava/io/IOException;
    new-instance v5, Lkorex/mail/MessagingException;

    const-string v6, "error loading POP3 headers"

    invoke-direct {v5, v6, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5

    .line 620
    .end local v2    # "ex":Ljava/io/IOException;
    .restart local v4    # "hdrs":Ljava/io/InputStream;
    :catchall_75
    move-exception v5

    :try_start_76
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    throw v5
    :try_end_7a
    .catchall {:try_start_76 .. :try_end_7a} :catchall_69

    .line 640
    .restart local v0    # "cs":Ljava/io/InputStream;
    :catchall_7a
    move-exception v5

    if-eqz v0, :cond_80

    .line 641
    :try_start_7d
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_80
    throw v5
    :try_end_81
    .catch Ljava/io/EOFException; {:try_start_7d .. :try_end_81} :catch_46
    .catch Ljava/io/IOException; {:try_start_7d .. :try_end_81} :catch_6c
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 424
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "POP3 messages are read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addHeaderLine(Ljava/lang/String;)V
    .registers 4
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 497
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "POP3 messages are read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAllHeaderLines()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 508
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v0, :cond_7

    .line 509
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 510
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders;->getAllHeaderLines()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getAllHeaders()Ljava/util/Enumeration;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 455
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v0, :cond_7

    .line 456
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 457
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0}, Lkorex/mail/internet/InternetHeaders;->getAllHeaders()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method protected declared-synchronized getContentStream()Ljava/io/InputStream;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 270
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Message;->contentStream:Ljava/io/InputStream;

    if-eqz v3, :cond_13

    .line 271
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Message;->contentStream:Ljava/io/InputStream;

    check-cast v3, Lkorex/mail/internet/SharedInputStream;

    const-wide/16 v4, 0x0

    const-wide/16 v6, -0x1

    invoke-interface {v3, v4, v5, v6, v7}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_3d

    move-result-object v2

    .line 283
    :cond_11
    :goto_11
    monitor-exit p0

    return-object v2

    .line 273
    :cond_13
    const/4 v3, 0x1

    :try_start_14
    invoke-direct {p0, v3}, Lcom/sun/mail/pop3/POP3Message;->getRawStream(Z)Ljava/io/InputStream;

    move-result-object v2

    .line 279
    .local v2, "cstream":Ljava/io/InputStream;
    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v3}, Lcom/sun/mail/pop3/POP3Folder;->getFileCache()Lcom/sun/mail/pop3/TempFile;

    move-result-object v1

    .line 280
    .local v1, "cache":Lcom/sun/mail/pop3/TempFile;
    if-nez v1, :cond_2e

    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    .line 281
    invoke-virtual {v3}, Lcom/sun/mail/pop3/POP3Folder;->getStore()Lkorex/mail/Store;

    move-result-object v3

    check-cast v3, Lcom/sun/mail/pop3/POP3Store;

    check-cast v3, Lcom/sun/mail/pop3/POP3Store;

    iget-boolean v3, v3, Lcom/sun/mail/pop3/POP3Store;->keepMessageContent:Z

    if-eqz v3, :cond_11

    .line 282
    :cond_2e
    move-object v0, v2

    check-cast v0, Lkorex/mail/internet/SharedInputStream;

    move-object v3, v0

    const-wide/16 v4, 0x0

    const-wide/16 v6, -0x1

    invoke-interface {v3, v4, v5, v6, v7}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/pop3/POP3Message;->contentStream:Ljava/io/InputStream;
    :try_end_3c
    .catchall {:try_start_14 .. :try_end_3c} :catchall_3d

    goto :goto_11

    .line 270
    .end local v1    # "cache":Lcom/sun/mail/pop3/TempFile;
    .end local v2    # "cstream":Ljava/io/InputStream;
    :catchall_3d
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 385
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v0, :cond_7

    .line 386
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 387
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeader(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 366
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v0, :cond_7

    .line 367
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 368
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 522
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v0, :cond_7

    .line 523
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 524
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 468
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v0, :cond_7

    .line 469
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 470
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getMimeStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 293
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/sun/mail/pop3/POP3Message;->getRawStream(Z)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 536
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v0, :cond_7

    .line 537
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 538
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getNonMatchingHeaderLines([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 481
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v0, :cond_7

    .line 482
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 483
    :cond_7
    iget-object v0, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/InternetHeaders;->getNonMatchingHeaders([Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 114
    :try_start_0
    monitor-enter p0
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_1} :catch_2e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1} :catch_44

    .line 116
    :try_start_1
    iget v2, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    if-lez v2, :cond_9

    .line 117
    iget v2, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    monitor-exit p0

    .line 141
    :goto_8
    return v2

    .line 118
    :cond_9
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_41

    .line 135
    :try_start_a
    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    if-nez v2, :cond_11

    .line 136
    invoke-direct {p0}, Lcom/sun/mail/pop3/POP3Message;->loadHeaders()V

    .line 138
    :cond_11
    monitor-enter p0
    :try_end_12
    .catch Ljava/io/EOFException; {:try_start_a .. :try_end_12} :catch_2e
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_12} :catch_44

    .line 139
    :try_start_12
    iget v2, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    if-gez v2, :cond_27

    .line 140
    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v2}, Lcom/sun/mail/pop3/POP3Folder;->getProtocol()Lcom/sun/mail/pop3/Protocol;

    move-result-object v2

    iget v3, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    invoke-virtual {v2, v3}, Lcom/sun/mail/pop3/Protocol;->list(I)I

    move-result v2

    iget v3, p0, Lcom/sun/mail/pop3/POP3Message;->hdrSize:I

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    .line 141
    :cond_27
    iget v2, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    monitor-exit p0

    goto :goto_8

    .line 142
    :catchall_2b
    move-exception v2

    monitor-exit p0
    :try_end_2d
    .catchall {:try_start_12 .. :try_end_2d} :catchall_2b

    :try_start_2d
    throw v2
    :try_end_2e
    .catch Ljava/io/EOFException; {:try_start_2d .. :try_end_2e} :catch_2e
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_2e} :catch_44

    .line 143
    :catch_2e
    move-exception v0

    .line 144
    .local v0, "eex":Ljava/io/EOFException;
    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/sun/mail/pop3/POP3Folder;->close(Z)V

    .line 145
    new-instance v2, Lkorex/mail/FolderClosedException;

    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v0}, Ljava/io/EOFException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v2

    .line 118
    .end local v0    # "eex":Ljava/io/EOFException;
    :catchall_41
    move-exception v2

    :try_start_42
    monitor-exit p0
    :try_end_43
    .catchall {:try_start_42 .. :try_end_43} :catchall_41

    :try_start_43
    throw v2
    :try_end_44
    .catch Ljava/io/EOFException; {:try_start_43 .. :try_end_44} :catch_2e
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_44} :catch_44

    .line 146
    :catch_44
    move-exception v1

    .line 147
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Lkorex/mail/MessagingException;

    const-string v3, "error getting size"

    invoke-direct {v2, v3, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
.end method

.method public declared-synchronized invalidate(Z)V
    .registers 5
    .param p1, "invalidateHeaders"    # Z

    .prologue
    .line 305
    monitor-enter p0

    const/4 v1, 0x0

    :try_start_2
    iput-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->content:[B

    .line 306
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->rawData:Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/InputStream;
    :try_end_c
    .catchall {:try_start_2 .. :try_end_c} :catchall_34

    .line 307
    .local v0, "rstream":Ljava/io/InputStream;
    if-eqz v0, :cond_19

    .line 311
    :try_start_e
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_11} :catch_32
    .catchall {:try_start_e .. :try_end_11} :catchall_34

    .line 315
    :goto_11
    :try_start_11
    new-instance v1, Ljava/lang/ref/SoftReference;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->rawData:Ljava/lang/ref/SoftReference;

    .line 317
    :cond_19
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->contentStream:Ljava/io/InputStream;
    :try_end_1b
    .catchall {:try_start_11 .. :try_end_1b} :catchall_34

    if-eqz v1, :cond_25

    .line 319
    :try_start_1d
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->contentStream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_22} :catch_37
    .catchall {:try_start_1d .. :try_end_22} :catchall_34

    .line 323
    :goto_22
    const/4 v1, 0x0

    :try_start_23
    iput-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->contentStream:Ljava/io/InputStream;

    .line 325
    :cond_25
    const/4 v1, -0x1

    iput v1, p0, Lcom/sun/mail/pop3/POP3Message;->msgSize:I

    .line 326
    if-eqz p1, :cond_30

    .line 327
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->headers:Lkorex/mail/internet/InternetHeaders;

    .line 328
    const/4 v1, -0x1

    iput v1, p0, Lcom/sun/mail/pop3/POP3Message;->hdrSize:I
    :try_end_30
    .catchall {:try_start_23 .. :try_end_30} :catchall_34

    .line 330
    :cond_30
    monitor-exit p0

    return-void

    .line 312
    :catch_32
    move-exception v1

    goto :goto_11

    .line 305
    .end local v0    # "rstream":Ljava/io/InputStream;
    :catchall_34
    move-exception v1

    monitor-exit p0

    throw v1

    .line 320
    .restart local v0    # "rstream":Ljava/io/InputStream;
    :catch_37
    move-exception v1

    goto :goto_22
.end method

.method public removeHeader(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 439
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "POP3 messages are read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public saveChanges()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 550
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "POP3 messages are read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized setFlags(Lkorex/mail/Flags;Z)V
    .registers 6
    .param p1, "newFlags"    # Lkorex/mail/Flags;
    .param p2, "set"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 94
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->flags:Lkorex/mail/Flags;

    invoke-virtual {v1}, Lkorex/mail/Flags;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/Flags;

    .line 95
    .local v0, "oldFlags":Lkorex/mail/Flags;
    invoke-super {p0, p1, p2}, Lkorex/mail/internet/MimeMessage;->setFlags(Lkorex/mail/Flags;Z)V

    .line 96
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->flags:Lkorex/mail/Flags;

    invoke-virtual {v1, v0}, Lkorex/mail/Flags;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    .line 97
    iget-object v1, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, p0}, Lcom/sun/mail/pop3/POP3Folder;->notifyMessageChangedListeners(ILkorex/mail/Message;)V
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_1c

    .line 99
    :cond_1a
    monitor-exit p0

    return-void

    .line 94
    .end local v0    # "oldFlags":Lkorex/mail/Flags;
    :catchall_1c
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 406
    new-instance v0, Lkorex/mail/IllegalWriteException;

    const-string v1, "POP3 messages are read-only"

    invoke-direct {v0, v1}, Lkorex/mail/IllegalWriteException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public top(I)Ljava/io/InputStream;
    .registers 7
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 343
    :try_start_0
    monitor-enter p0
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_1} :catch_12
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1} :catch_25

    .line 344
    :try_start_1
    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v2}, Lcom/sun/mail/pop3/POP3Folder;->getProtocol()Lcom/sun/mail/pop3/Protocol;

    move-result-object v2

    iget v3, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    invoke-virtual {v2, v3, p1}, Lcom/sun/mail/pop3/Protocol;->top(II)Ljava/io/InputStream;

    move-result-object v2

    monitor-exit p0

    return-object v2

    .line 345
    :catchall_f
    move-exception v2

    monitor-exit p0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_f

    :try_start_11
    throw v2
    :try_end_12
    .catch Ljava/io/EOFException; {:try_start_11 .. :try_end_12} :catch_12
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_12} :catch_25

    .line 346
    :catch_12
    move-exception v0

    .line 347
    .local v0, "eex":Ljava/io/EOFException;
    iget-object v2, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/sun/mail/pop3/POP3Folder;->close(Z)V

    .line 348
    new-instance v2, Lkorex/mail/FolderClosedException;

    iget-object v3, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v0}, Ljava/io/EOFException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lkorex/mail/FolderClosedException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v2

    .line 349
    .end local v0    # "eex":Ljava/io/EOFException;
    :catch_25
    move-exception v1

    .line 350
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Lkorex/mail/MessagingException;

    const-string v3, "error getting size"

    invoke-direct {v2, v3, v1}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
.end method

.method public declared-synchronized writeTo(Ljava/io/OutputStream;[Ljava/lang/String;)V
    .registers 11
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "ignoreList"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 569
    monitor-enter p0

    :try_start_1
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Message;->rawData:Ljava/lang/ref/SoftReference;

    invoke-virtual {v4}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/InputStream;

    .line 570
    .local v3, "rawcontent":Ljava/io/InputStream;
    if-nez v3, :cond_78

    if-nez p2, :cond_78

    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    .line 571
    invoke-virtual {v4}, Lcom/sun/mail/pop3/POP3Folder;->getStore()Lkorex/mail/Store;

    move-result-object v4

    check-cast v4, Lcom/sun/mail/pop3/POP3Store;

    check-cast v4, Lcom/sun/mail/pop3/POP3Store;

    iget-boolean v4, v4, Lcom/sun/mail/pop3/POP3Store;->cacheWriteTo:Z

    if-nez v4, :cond_78

    .line 572
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    iget-object v4, v4, Lcom/sun/mail/pop3/POP3Folder;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v5, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_43

    .line 573
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    iget-object v4, v4, Lcom/sun/mail/pop3/POP3Folder;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "streaming msg "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 574
    :cond_43
    iget-object v4, p0, Lcom/sun/mail/pop3/POP3Message;->folder:Lcom/sun/mail/pop3/POP3Folder;

    invoke-virtual {v4}, Lcom/sun/mail/pop3/POP3Folder;->getProtocol()Lcom/sun/mail/pop3/Protocol;

    move-result-object v4

    iget v5, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    invoke-virtual {v4, v5, p1}, Lcom/sun/mail/pop3/Protocol;->retr(ILjava/io/OutputStream;)Z

    move-result v4

    if-nez v4, :cond_a1

    .line 575
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/sun/mail/pop3/POP3Message;->expunged:Z

    .line 576
    new-instance v4, Lkorex/mail/MessageRemovedException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "can\'t retrieve message #"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/sun/mail/pop3/POP3Message;->msgnum:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " in POP3Message.writeTo"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lkorex/mail/MessageRemovedException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_75
    .catchall {:try_start_1 .. :try_end_75} :catchall_75

    .line 569
    .end local v3    # "rawcontent":Ljava/io/InputStream;
    :catchall_75
    move-exception v4

    monitor-exit p0

    throw v4

    .line 579
    .restart local v3    # "rawcontent":Ljava/io/InputStream;
    :cond_78
    if-eqz v3, :cond_a3

    if-nez p2, :cond_a3

    .line 581
    :try_start_7c
    check-cast v3, Lkorex/mail/internet/SharedInputStream;

    .end local v3    # "rawcontent":Ljava/io/InputStream;
    const-wide/16 v4, 0x0

    const-wide/16 v6, -0x1

    invoke-interface {v3, v4, v5, v6, v7}, Lkorex/mail/internet/SharedInputStream;->newStream(JJ)Ljava/io/InputStream;
    :try_end_85
    .catchall {:try_start_7c .. :try_end_85} :catchall_75

    move-result-object v1

    .line 583
    .local v1, "in":Ljava/io/InputStream;
    const/16 v4, 0x4000

    :try_start_88
    new-array v0, v4, [B

    .line 585
    .local v0, "buf":[B
    :goto_8a
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    if-lez v2, :cond_9c

    .line 586
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_94
    .catchall {:try_start_88 .. :try_end_94} :catchall_95

    goto :goto_8a

    .line 588
    .end local v0    # "buf":[B
    .end local v2    # "len":I
    :catchall_95
    move-exception v4

    .line 589
    if-eqz v1, :cond_9b

    .line 590
    :try_start_98
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_9b
    .catch Ljava/io/IOException; {:try_start_98 .. :try_end_9b} :catch_a9
    .catchall {:try_start_98 .. :try_end_9b} :catchall_75

    .line 591
    :cond_9b
    :goto_9b
    :try_start_9b
    throw v4
    :try_end_9c
    .catchall {:try_start_9b .. :try_end_9c} :catchall_75

    .line 589
    .restart local v0    # "buf":[B
    .restart local v2    # "len":I
    :cond_9c
    if-eqz v1, :cond_a1

    .line 590
    :try_start_9e
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_9e .. :try_end_a1} :catch_a7
    .catchall {:try_start_9e .. :try_end_a1} :catchall_75

    .line 595
    .end local v0    # "buf":[B
    .end local v1    # "in":Ljava/io/InputStream;
    .end local v2    # "len":I
    :cond_a1
    :goto_a1
    monitor-exit p0

    return-void

    .line 594
    .restart local v3    # "rawcontent":Ljava/io/InputStream;
    :cond_a3
    :try_start_a3
    invoke-super {p0, p1, p2}, Lkorex/mail/internet/MimeMessage;->writeTo(Ljava/io/OutputStream;[Ljava/lang/String;)V
    :try_end_a6
    .catchall {:try_start_a3 .. :try_end_a6} :catchall_75

    goto :goto_a1

    .line 591
    .end local v3    # "rawcontent":Ljava/io/InputStream;
    .restart local v0    # "buf":[B
    .restart local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "len":I
    :catch_a7
    move-exception v4

    goto :goto_a1

    .end local v0    # "buf":[B
    .end local v2    # "len":I
    :catch_a9
    move-exception v5

    goto :goto_9b
.end method
