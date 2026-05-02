.class public Lkorex/mail/internet/MimePartDataSource;
.super Ljava/lang/Object;
.source "MimePartDataSource.java"

# interfaces
.implements Lkorex/activation/DataSource;
.implements Lkorex/mail/MessageAware;


# instance fields
.field private context:Lkorex/mail/MessageContext;

.field protected part:Lkorex/mail/internet/MimePart;


# direct methods
.method public constructor <init>(Lkorex/mail/internet/MimePart;)V
    .registers 2
    .param p1, "part"    # Lkorex/mail/internet/MimePart;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    .line 80
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 140
    :try_start_0
    iget-object v1, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    invoke-interface {v1}, Lkorex/mail/internet/MimePart;->getContentType()Ljava/lang/String;
    :try_end_5
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 146
    :goto_6
    return-object v1

    .line 141
    :catch_7
    move-exception v0

    .line 146
    .local v0, "mex":Lkorex/mail/MessagingException;
    const-string v1, "application/octet-stream"

    goto :goto_6
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    :try_start_0
    iget-object v4, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    instance-of v4, v4, Lkorex/mail/internet/MimeBodyPart;

    if-eqz v4, :cond_21

    .line 103
    iget-object v4, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    check-cast v4, Lkorex/mail/internet/MimeBodyPart;

    invoke-virtual {v4}, Lkorex/mail/internet/MimeBodyPart;->getContentStream()Ljava/io/InputStream;

    move-result-object v2

    .line 109
    .local v2, "is":Ljava/io/InputStream;
    :goto_e
    iget-object v4, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    iget-object v5, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    .line 110
    invoke-interface {v5}, Lkorex/mail/internet/MimePart;->getEncoding()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lkorex/mail/internet/MimeBodyPart;->restrictEncoding(Lkorex/mail/internet/MimePart;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "encoding":Ljava/lang/String;
    if-eqz v0, :cond_20

    .line 112
    invoke-static {v2, v0}, Lkorex/mail/internet/MimeUtility;->decode(Ljava/io/InputStream;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 114
    .end local v2    # "is":Ljava/io/InputStream;
    :cond_20
    return-object v2

    .line 104
    .end local v0    # "encoding":Ljava/lang/String;
    :cond_21
    iget-object v4, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    instance-of v4, v4, Lkorex/mail/internet/MimeMessage;

    if-eqz v4, :cond_30

    .line 105
    iget-object v4, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    check-cast v4, Lkorex/mail/internet/MimeMessage;

    invoke-virtual {v4}, Lkorex/mail/internet/MimeMessage;->getContentStream()Ljava/io/InputStream;

    move-result-object v2

    .restart local v2    # "is":Ljava/io/InputStream;
    goto :goto_e

    .line 107
    .end local v2    # "is":Ljava/io/InputStream;
    :cond_30
    new-instance v4, Lkorex/mail/MessagingException;

    const-string v5, "Unknown part"

    invoke-direct {v4, v5}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_38
    .catch Lkorex/mail/FolderClosedException; {:try_start_0 .. :try_end_38} :catch_38
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_38} :catch_47

    .line 115
    :catch_38
    move-exception v1

    .line 116
    .local v1, "fex":Lkorex/mail/FolderClosedException;
    new-instance v4, Lcom/sun/mail/util/FolderClosedIOException;

    invoke-virtual {v1}, Lkorex/mail/FolderClosedException;->getFolder()Lkorex/mail/Folder;

    move-result-object v5

    .line 117
    invoke-virtual {v1}, Lkorex/mail/FolderClosedException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/sun/mail/util/FolderClosedIOException;-><init>(Lkorex/mail/Folder;Ljava/lang/String;)V

    throw v4

    .line 118
    .end local v1    # "fex":Lkorex/mail/FolderClosedException;
    :catch_47
    move-exception v3

    .line 119
    .local v3, "mex":Lkorex/mail/MessagingException;
    new-instance v4, Ljava/io/IOException;

    invoke-virtual {v3}, Lkorex/mail/MessagingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public declared-synchronized getMessageContext()Lkorex/mail/MessageContext;
    .registers 3

    .prologue
    .line 170
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/internet/MimePartDataSource;->context:Lkorex/mail/MessageContext;

    if-nez v0, :cond_e

    .line 171
    new-instance v0, Lkorex/mail/MessageContext;

    iget-object v1, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    invoke-direct {v0, v1}, Lkorex/mail/MessageContext;-><init>(Lkorex/mail/Part;)V

    iput-object v0, p0, Lkorex/mail/internet/MimePartDataSource;->context:Lkorex/mail/MessageContext;

    .line 172
    :cond_e
    iget-object v0, p0, Lkorex/mail/internet/MimePartDataSource;->context:Lkorex/mail/MessageContext;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    monitor-exit p0

    return-object v0

    .line 170
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 157
    :try_start_0
    iget-object v0, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    instance-of v0, v0, Lkorex/mail/internet/MimeBodyPart;

    if-eqz v0, :cond_10

    .line 158
    iget-object v0, p0, Lkorex/mail/internet/MimePartDataSource;->part:Lkorex/mail/internet/MimePart;

    check-cast v0, Lkorex/mail/internet/MimeBodyPart;

    invoke-virtual {v0}, Lkorex/mail/internet/MimeBodyPart;->getFileName()Ljava/lang/String;
    :try_end_d
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_d} :catch_f

    move-result-object v0

    .line 162
    :goto_e
    return-object v0

    .line 159
    :catch_f
    move-exception v0

    .line 162
    :cond_10
    const-string v0, ""

    goto :goto_e
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    new-instance v0, Ljava/net/UnknownServiceException;

    const-string v1, "Writing not supported"

    invoke-direct {v0, v1}, Ljava/net/UnknownServiceException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
