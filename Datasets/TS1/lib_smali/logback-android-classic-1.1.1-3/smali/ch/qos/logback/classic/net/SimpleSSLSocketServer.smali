.class public Lch/qos/logback/classic/net/SimpleSSLSocketServer;
.super Lch/qos/logback/classic/net/SimpleSocketServer;


# instance fields
.field private final socketFactory:Ljavax/net/ServerSocketFactory;


# direct methods
.method public constructor <init>(Lch/qos/logback/classic/LoggerContext;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    invoke-static {}, Ljavax/net/ssl/SSLContext;->getDefault()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lch/qos/logback/classic/net/SimpleSSLSocketServer;-><init>(Lch/qos/logback/classic/LoggerContext;ILjavax/net/ssl/SSLContext;)V

    return-void
.end method

.method public constructor <init>(Lch/qos/logback/classic/LoggerContext;ILjavax/net/ssl/SSLContext;)V
    .registers 7

    invoke-direct {p0, p1, p2}, Lch/qos/logback/classic/net/SimpleSocketServer;-><init>(Lch/qos/logback/classic/LoggerContext;I)V

    if-nez p3, :cond_d

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "SSL context required"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    new-instance v0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    invoke-direct {v0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;-><init>()V

    invoke-virtual {v0, p1}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->setContext(Lch/qos/logback/core/Context;)V

    new-instance v1, Lch/qos/logback/core/net/ssl/ConfigurableSSLServerSocketFactory;

    invoke-virtual {p3}, Ljavax/net/ssl/SSLContext;->getServerSocketFactory()Ljavax/net/ssl/SSLServerSocketFactory;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lch/qos/logback/core/net/ssl/ConfigurableSSLServerSocketFactory;-><init>(Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;Ljavax/net/ssl/SSLServerSocketFactory;)V

    iput-object v1, p0, Lch/qos/logback/classic/net/SimpleSSLSocketServer;->socketFactory:Ljavax/net/ServerSocketFactory;

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lch/qos/logback/classic/net/SimpleSSLSocketServer;

    invoke-static {v0, p0}, Lch/qos/logback/classic/net/SimpleSSLSocketServer;->doMain(Ljava/lang/Class;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getServerSocketFactory()Ljavax/net/ServerSocketFactory;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/net/SimpleSSLSocketServer;->socketFactory:Ljavax/net/ServerSocketFactory;

    return-object v0
.end method
