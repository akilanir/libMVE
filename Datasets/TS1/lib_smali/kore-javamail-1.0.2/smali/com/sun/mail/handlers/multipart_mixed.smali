.class public Lcom/sun/mail/handlers/multipart_mixed;
.super Ljava/lang/Object;
.source "multipart_mixed.java"

# interfaces
.implements Lkorex/activation/DataContentHandler;


# instance fields
.field private myDF:Lkorex/activation/ActivationDataFlavor;


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Lkorex/activation/ActivationDataFlavor;

    const-class v1, Lkorex/mail/internet/MimeMultipart;

    const-string v2, "multipart/mixed"

    const-string v3, "Multipart"

    invoke-direct {v0, v1, v2, v3}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/sun/mail/handlers/multipart_mixed;->myDF:Lkorex/activation/ActivationDataFlavor;

    return-void
.end method


# virtual methods
.method public getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 5
    .param p1, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    :try_start_0
    new-instance v2, Lkorex/mail/internet/MimeMultipart;

    invoke-direct {v2, p1}, Lkorex/mail/internet/MimeMultipart;-><init>(Lkorex/activation/DataSource;)V
    :try_end_5
    .catch Lkorex/mail/MessagingException; {:try_start_0 .. :try_end_5} :catch_6

    return-object v2

    .line 91
    :catch_6
    move-exception v0

    .line 92
    .local v0, "e":Lkorex/mail/MessagingException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Exception while constructing MimeMultipart"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 94
    .local v1, "ioex":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 95
    throw v1
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
    .line 79
    iget-object v0, p0, Lcom/sun/mail/handlers/multipart_mixed;->myDF:Lkorex/activation/ActivationDataFlavor;

    invoke-virtual {v0, p1}, Lkorex/activation/ActivationDataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 80
    invoke-virtual {p0, p2}, Lcom/sun/mail/handlers/multipart_mixed;->getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v0

    .line 82
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
    .registers 4

    .prologue
    .line 65
    const/4 v0, 0x1

    new-array v0, v0, [Lkore/awt/datatransfer/DataFlavor;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/sun/mail/handlers/multipart_mixed;->myDF:Lkorex/activation/ActivationDataFlavor;

    aput-object v2, v0, v1

    return-object v0
.end method

.method public writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    instance-of v1, p1, Lkorex/mail/internet/MimeMultipart;

    if-eqz v1, :cond_9

    .line 106
    :try_start_4
    check-cast p1, Lkorex/mail/internet/MimeMultipart;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Lkorex/mail/internet/MimeMultipart;->writeTo(Ljava/io/OutputStream;)V
    :try_end_9
    .catch Lkorex/mail/MessagingException; {:try_start_4 .. :try_end_9} :catch_a

    .line 111
    :cond_9
    return-void

    .line 107
    :catch_a
    move-exception v0

    .line 108
    .local v0, "e":Lkorex/mail/MessagingException;
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Lkorex/mail/MessagingException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
