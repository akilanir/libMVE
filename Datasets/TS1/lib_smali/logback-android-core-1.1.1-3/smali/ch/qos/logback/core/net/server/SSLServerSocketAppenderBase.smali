.class public abstract Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;
.super Lch/qos/logback/core/net/server/AbstractServerSocketAppender;

# interfaces
.implements Lch/qos/logback/core/net/ssl/SSLComponent;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/net/server/AbstractServerSocketAppender",
        "<TE;>;",
        "Lch/qos/logback/core/net/ssl/SSLComponent;"
    }
.end annotation


# instance fields
.field private socketFactory:Ljavax/net/ServerSocketFactory;

.field private ssl:Lch/qos/logback/core/net/ssl/SSLConfiguration;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/net/server/AbstractServerSocketAppender;-><init>()V

    return-void
.end method


# virtual methods
.method protected getServerSocketFactory()Ljavax/net/ServerSocketFactory;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->socketFactory:Ljavax/net/ServerSocketFactory;

    return-object v0
.end method

.method public getSsl()Lch/qos/logback/core/net/ssl/SSLConfiguration;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->ssl:Lch/qos/logback/core/net/ssl/SSLConfiguration;

    if-nez v0, :cond_b

    new-instance v0, Lch/qos/logback/core/net/ssl/SSLConfiguration;

    invoke-direct {v0}, Lch/qos/logback/core/net/ssl/SSLConfiguration;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->ssl:Lch/qos/logback/core/net/ssl/SSLConfiguration;

    :cond_b
    iget-object v0, p0, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->ssl:Lch/qos/logback/core/net/ssl/SSLConfiguration;

    return-object v0
.end method

.method public setSsl(Lch/qos/logback/core/net/ssl/SSLConfiguration;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->ssl:Lch/qos/logback/core/net/ssl/SSLConfiguration;

    return-void
.end method

.method public start()V
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->getSsl()Lch/qos/logback/core/net/ssl/SSLConfiguration;

    move-result-object v0

    invoke-virtual {v0, p0}, Lch/qos/logback/core/net/ssl/SSLConfiguration;->createContext(Lch/qos/logback/core/spi/ContextAware;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->getSsl()Lch/qos/logback/core/net/ssl/SSLConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lch/qos/logback/core/net/ssl/SSLConfiguration;->getParameters()Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    move-result-object v1

    invoke-virtual {p0}, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->getContext()Lch/qos/logback/core/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;->setContext(Lch/qos/logback/core/Context;)V

    new-instance v2, Lch/qos/logback/core/net/ssl/ConfigurableSSLServerSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getServerSocketFactory()Ljavax/net/ssl/SSLServerSocketFactory;

    move-result-object v0

    invoke-direct {v2, v1, v0}, Lch/qos/logback/core/net/ssl/ConfigurableSSLServerSocketFactory;-><init>(Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;Ljavax/net/ssl/SSLServerSocketFactory;)V

    iput-object v2, p0, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->socketFactory:Ljavax/net/ServerSocketFactory;

    invoke-super {p0}, Lch/qos/logback/core/net/server/AbstractServerSocketAppender;->start()V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_25} :catch_26

    :goto_25
    return-void

    :catch_26
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/net/server/SSLServerSocketAppenderBase;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_25
.end method
