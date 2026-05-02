.class public Lcom/sun/mail/util/MailConnectException;
.super Lkorex/mail/MessagingException;
.source "MailConnectException.java"


# static fields
.field private static final serialVersionUID:J = -0x34ff2166073d7061L


# instance fields
.field private cto:I

.field private host:Ljava/lang/String;

.field private port:I


# direct methods
.method public constructor <init>(Lcom/sun/mail/util/SocketConnectException;)V
    .registers 5
    .param p1, "cex"    # Lcom/sun/mail/util/SocketConnectException;

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Couldn\'t connect to host, port: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 71
    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; timeout "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 72
    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getConnectionTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 73
    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_71

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_4c
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    invoke-direct {p0, v0}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/util/MailConnectException;->host:Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getPort()I

    move-result v0

    iput v0, p0, Lcom/sun/mail/util/MailConnectException;->port:I

    .line 77
    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getConnectionTimeout()I

    move-result v0

    iput v0, p0, Lcom/sun/mail/util/MailConnectException;->cto:I

    .line 78
    invoke-virtual {p1}, Lcom/sun/mail/util/SocketConnectException;->getException()Ljava/lang/Exception;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sun/mail/util/MailConnectException;->setNextException(Ljava/lang/Exception;)Z

    .line 79
    return-void

    .line 73
    :cond_71
    const-string v0, ""

    goto :goto_4c
.end method


# virtual methods
.method public getConnectionTimeout()I
    .registers 2

    .prologue
    .line 105
    iget v0, p0, Lcom/sun/mail/util/MailConnectException;->cto:I

    return v0
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/sun/mail/util/MailConnectException;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 96
    iget v0, p0, Lcom/sun/mail/util/MailConnectException;->port:I

    return v0
.end method
