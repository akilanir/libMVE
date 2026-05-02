.class public Lkorex/mail/internet/PreencodedMimeBodyPart;
.super Lkorex/mail/internet/MimeBodyPart;
.source "PreencodedMimeBodyPart.java"


# instance fields
.field private encoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-direct {p0}, Lkorex/mail/internet/MimeBodyPart;-><init>()V

    .line 75
    iput-object p1, p0, Lkorex/mail/internet/PreencodedMimeBodyPart;->encoding:Ljava/lang/String;

    .line 76
    return-void
.end method


# virtual methods
.method public getEncoding()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lkorex/mail/internet/PreencodedMimeBodyPart;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method protected updateHeaders()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-super {p0}, Lkorex/mail/internet/MimeBodyPart;->updateHeaders()V

    .line 125
    iget-object v0, p0, Lkorex/mail/internet/PreencodedMimeBodyPart;->encoding:Ljava/lang/String;

    invoke-static {p0, v0}, Lkorex/mail/internet/MimeBodyPart;->setEncoding(Lkorex/mail/internet/MimePart;Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 5
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 99
    const/4 v1, 0x0

    .line 100
    .local v1, "los":Lcom/sun/mail/util/LineOutputStream;
    instance-of v2, p1, Lcom/sun/mail/util/LineOutputStream;

    if-eqz v2, :cond_1c

    move-object v1, p1

    .line 101
    check-cast v1, Lcom/sun/mail/util/LineOutputStream;

    .line 107
    :goto_8
    invoke-virtual {p0}, Lkorex/mail/internet/PreencodedMimeBodyPart;->getAllHeaderLines()Ljava/util/Enumeration;

    move-result-object v0

    .line 108
    .local v0, "hdrLines":Ljava/util/Enumeration;
    :goto_c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 109
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/sun/mail/util/LineOutputStream;->writeln(Ljava/lang/String;)V

    goto :goto_c

    .line 103
    .end local v0    # "hdrLines":Ljava/util/Enumeration;
    :cond_1c
    new-instance v1, Lcom/sun/mail/util/LineOutputStream;

    .end local v1    # "los":Lcom/sun/mail/util/LineOutputStream;
    invoke-direct {v1, p1}, Lcom/sun/mail/util/LineOutputStream;-><init>(Ljava/io/OutputStream;)V

    .restart local v1    # "los":Lcom/sun/mail/util/LineOutputStream;
    goto :goto_8

    .line 112
    .restart local v0    # "hdrLines":Ljava/util/Enumeration;
    :cond_22
    invoke-virtual {v1}, Lcom/sun/mail/util/LineOutputStream;->writeln()V

    .line 115
    invoke-virtual {p0}, Lkorex/mail/internet/PreencodedMimeBodyPart;->getDataHandler()Lkorex/activation/DataHandler;

    move-result-object v2

    invoke-virtual {v2, p1}, Lkorex/activation/DataHandler;->writeTo(Ljava/io/OutputStream;)V

    .line 116
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 117
    return-void
.end method
