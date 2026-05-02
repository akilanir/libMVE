.class public Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;
.super Ljavax/net/SocketFactory;


# instance fields
.field private final delegate:Ljavax/net/ssl/SSLSocketFactory;

.field private final parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;Ljavax/net/ssl/SSLSocketFactory;)V
    .registers 3

    invoke-direct {p0}, Ljavax/net/SocketFactory;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    iput-object p2, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    return-void
.end method


# virtual methods
.method public createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    iget-object v1, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    new-instance v2, Lch/qos/logback/core/net/ssl/SSLConfigurableSocket;

    invoke-direct {v2, v0}, Lch/qos/logback/core/net/ssl/SSLConfigurableSocket;-><init>(Ljavax/net/ssl/SSLSocket;)V

    invoke-virtual {v1, v2}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->configure(Lch/qos/logback/core/net/ssl/SSLConfigurable;)V

    return-object v0
.end method

.method public createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    iget-object v1, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    new-instance v2, Lch/qos/logback/core/net/ssl/SSLConfigurableSocket;

    invoke-direct {v2, v0}, Lch/qos/logback/core/net/ssl/SSLConfigurableSocket;-><init>(Ljavax/net/ssl/SSLSocket;)V

    invoke-virtual {v1, v2}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->configure(Lch/qos/logback/core/net/ssl/SSLConfigurable;)V

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    iget-object v1, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    new-instance v2, Lch/qos/logback/core/net/ssl/SSLConfigurableSocket;

    invoke-direct {v2, v0}, Lch/qos/logback/core/net/ssl/SSLConfigurableSocket;-><init>(Ljavax/net/ssl/SSLSocket;)V

    invoke-virtual {v1, v2}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->configure(Lch/qos/logback/core/net/ssl/SSLConfigurable;)V

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    iget-object v1, p0, Lch/qos/logback/core/net/ssl/ConfigurableSSLSocketFactory;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    new-instance v2, Lch/qos/logback/core/net/ssl/SSLConfigurableSocket;

    invoke-direct {v2, v0}, Lch/qos/logback/core/net/ssl/SSLConfigurableSocket;-><init>(Ljavax/net/ssl/SSLSocket;)V

    invoke-virtual {v1, v2}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->configure(Lch/qos/logback/core/net/ssl/SSLConfigurable;)V

    return-object v0
.end method
