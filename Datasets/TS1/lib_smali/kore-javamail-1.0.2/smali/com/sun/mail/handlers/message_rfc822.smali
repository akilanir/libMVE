.class public Lcom/sun/mail/handlers/message_rfc822;
.super Ljava/lang/Object;
.source "message_rfc822.java"

# interfaces
.implements Lkorex/activation/DataContentHandler;


# instance fields
.field ourDataFlavor:Lkorex/activation/ActivationDataFlavor;


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Lkorex/activation/ActivationDataFlavor;

    const-class v1, Lkorex/mail/Message;

    const-string v2, "message/rfc822"

    const-string v3, "Message"

    invoke-direct {v0, v1, v2, v3}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/sun/mail/handlers/message_rfc822;->ourDataFlavor:Lkorex/activation/ActivationDataFlavor;

    return-void
.end method


# virtual methods
.method public getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 9
    .param p1, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    :try_start_0
    instance-of v4, p1, Lkorex/mail/MessageAware;

    if-eqz v4, :cond_1a

    .line 101
    move-object v0, p1

    check-cast v0, Lkorex/mail/MessageAware;

    move-object v4, v0

    invoke-interface {v4}, Lkorex/mail/MessageAware;->getMessageContext()Lkorex/mail/MessageContext;

    move-result-object v1

    .line 102
    .local v1, "mc":Lkorex/mail/MessageContext;
    invoke-virtual {v1}, Lkorex/mail/MessageContext;->getSession()Lkorex/mail/Session;

    move-result-object v3

    .line 110
    .end local v1    # "mc":Lkorex/mail/MessageContext;
    .local v3, "session":Lkorex/mail/Session;
    :goto_10
    new-instance v4, Lkorex/mail/internet/MimeMessage;

    invoke-interface {p1}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lkorex/mail/internet/MimeMessage;-><init>(Lkorex/mail/Session;Ljava/io/InputStream;)V

    return-object v4

    .line 108
    .end local v3    # "session":Lkorex/mail/Session;
    :cond_1a
    new-instance v4, Ljava/util/Properties;

    invoke-direct {v4}, Ljava/util/Properties;-><init>()V

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lkorex/mail/Session;->getDefaultInstance(Ljava/util/Properties;Lkorex/mail/Authenticator;)Lkorex/mail/Session;
    :try_end_23
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_23} :catch_25

    move-result-object v3

    .restart local v3    # "session":Lkorex/mail/Session;
    goto :goto_10

    .line 111
    .end local v3    # "session":Lkorex/mail/Session;
    :catch_25
    move-exception v2

    .line 112
    .local v2, "me":Lkorex/mail/MessagingException;
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception creating MimeMessage in message/rfc822 DataContentHandler: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 113
    invoke-virtual {v2}, Lkorex/mail/MessagingException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public getTransferData(Lkore/awt/datatransfer/DataFlavor;Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 4
    .param p1, "df"    # Lkore/awt/datatransfer/DataFlavor;
    .param p2, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/sun/mail/handlers/message_rfc822;->ourDataFlavor:Lkorex/activation/ActivationDataFlavor;

    invoke-virtual {v0, p1}, Lkorex/activation/ActivationDataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 88
    invoke-virtual {p0, p2}, Lcom/sun/mail/handlers/message_rfc822;->getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v0

    .line 90
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
    .registers 4

    .prologue
    .line 75
    const/4 v0, 0x1

    new-array v0, v0, [Lkore/awt/datatransfer/DataFlavor;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/sun/mail/handlers/message_rfc822;->ourDataFlavor:Lkorex/activation/ActivationDataFlavor;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 8
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    instance-of v2, p1, Lkorex/mail/Message;

    if-eqz v2, :cond_16

    move-object v0, p1

    .line 126
    check-cast v0, Lkorex/mail/Message;

    .line 128
    .local v0, "m":Lkorex/mail/Message;
    :try_start_7
    invoke-virtual {v0, p3}, Lkorex/mail/Message;->writeTo(Ljava/io/OutputStream;)V
    :try_end_a
    .catch Lkorex/mail/MessagingException; {:try_start_7 .. :try_end_a} :catch_b

    .line 136
    return-void

    .line 129
    :catch_b
    move-exception v1

    .line 130
    .local v1, "me":Lkorex/mail/MessagingException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Lkorex/mail/MessagingException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 134
    .end local v0    # "m":Lkorex/mail/Message;
    .end local v1    # "me":Lkorex/mail/MessagingException;
    :cond_16
    new-instance v2, Ljava/io/IOException;

    const-string v3, "unsupported object"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
