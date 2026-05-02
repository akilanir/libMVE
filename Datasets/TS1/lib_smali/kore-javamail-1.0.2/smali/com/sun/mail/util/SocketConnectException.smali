.class public Lcom/sun/mail/util/SocketConnectException;
.super Ljava/io/IOException;
.source "SocketConnectException.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final serialVersionUID:J = 0x377b4b00af8c9187L


# instance fields
.field private cto:I

.field private host:Ljava/lang/String;

.field private port:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    const-class v0, Lcom/sun/mail/util/SocketConnectException;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/util/SocketConnectException;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;Ljava/lang/String;II)V
    .registers 6
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Exception;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I
    .param p5, "cto"    # I

    .prologue
    .line 84
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0, p2}, Lcom/sun/mail/util/SocketConnectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 86
    iput-object p3, p0, Lcom/sun/mail/util/SocketConnectException;->host:Ljava/lang/String;

    .line 87
    iput p4, p0, Lcom/sun/mail/util/SocketConnectException;->port:I

    .line 88
    iput p5, p0, Lcom/sun/mail/util/SocketConnectException;->cto:I

    .line 89
    return-void
.end method


# virtual methods
.method public getConnectionTimeout()I
    .registers 2

    .prologue
    .line 127
    iget v0, p0, Lcom/sun/mail/util/SocketConnectException;->cto:I

    return v0
.end method

.method public getException()Ljava/lang/Exception;
    .registers 3

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/sun/mail/util/SocketConnectException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 99
    .local v0, "t":Ljava/lang/Throwable;
    sget-boolean v1, Lcom/sun/mail/util/SocketConnectException;->$assertionsDisabled:Z

    if-nez v1, :cond_14

    if-eqz v0, :cond_14

    instance-of v1, v0, Ljava/lang/Exception;

    if-nez v1, :cond_14

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 100
    :cond_14
    check-cast v0, Ljava/lang/Exception;

    .end local v0    # "t":Ljava/lang/Throwable;
    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/sun/mail/util/SocketConnectException;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .registers 2

    .prologue
    .line 118
    iget v0, p0, Lcom/sun/mail/util/SocketConnectException;->port:I

    return v0
.end method
