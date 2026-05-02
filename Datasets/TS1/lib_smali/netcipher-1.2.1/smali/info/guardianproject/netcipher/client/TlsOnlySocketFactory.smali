.class public Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;
.super Ljavax/net/ssl/SSLSocketFactory;
.source "TlsOnlySocketFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$1;,
        Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$DelegateSSLSocket;,
        Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "TlsOnlySocketFactory"


# instance fields
.field private final compatible:Z

.field private final delegate:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 56
    invoke-direct {p0}, Ljavax/net/ssl/SSLSocketFactory;-><init>()V

    .line 57
    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    iput-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->compatible:Z

    .line 59
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;)V
    .registers 3
    .param p1, "delegate"    # Ljavax/net/ssl/SSLSocketFactory;

    .prologue
    .line 61
    invoke-direct {p0}, Ljavax/net/ssl/SSLSocketFactory;-><init>()V

    .line 62
    iput-object p1, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->compatible:Z

    .line 64
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;Z)V
    .registers 3
    .param p1, "delegate"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p2, "compatible"    # Z

    .prologue
    .line 72
    invoke-direct {p0}, Ljavax/net/ssl/SSLSocketFactory;-><init>()V

    .line 73
    iput-object p1, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    .line 74
    iput-boolean p2, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->compatible:Z

    .line 75
    return-void
.end method

.method private makeSocketSafe(Ljava/net/Socket;)Ljava/net/Socket;
    .registers 5
    .param p1, "socket"    # Ljava/net/Socket;

    .prologue
    .line 88
    instance-of v1, p1, Ljavax/net/ssl/SSLSocket;

    if-eqz v1, :cond_f

    .line 89
    new-instance v0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;

    check-cast p1, Ljavax/net/ssl/SSLSocket;

    .end local p1    # "socket":Ljava/net/Socket;
    iget-boolean v1, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->compatible:Z

    const/4 v2, 0x0

    invoke-direct {v0, p0, p1, v1, v2}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory$TlsOnlySSLSocket;-><init>(Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;Ljavax/net/ssl/SSLSocket;ZLinfo/guardianproject/netcipher/client/TlsOnlySocketFactory$1;)V

    .local v0, "socket":Ljava/net/Socket;
    move-object p1, v0

    .line 91
    .end local v0    # "socket":Ljava/net/Socket;
    .restart local p1    # "socket":Ljava/net/Socket;
    :cond_f
    return-object p1
.end method


# virtual methods
.method public createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->makeSocketSafe(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "localHost"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->makeSocketSafe(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .registers 4
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->makeSocketSafe(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->makeSocketSafe(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "s"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->makeSocketSafe(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultCipherSuites()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->getDefaultCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedCipherSuites()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Linfo/guardianproject/netcipher/client/TlsOnlySocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
