.class public Lch/qos/logback/core/net/ssl/SSLConfiguration;
.super Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;


# instance fields
.field private parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/net/ssl/SSLContextFactoryBean;-><init>()V

    return-void
.end method


# virtual methods
.method public getParameters()Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLConfiguration;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    if-nez v0, :cond_b

    new-instance v0, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    invoke-direct {v0}, Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/net/ssl/SSLConfiguration;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    :cond_b
    iget-object v0, p0, Lch/qos/logback/core/net/ssl/SSLConfiguration;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    return-object v0
.end method

.method public setParameters(Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/ssl/SSLConfiguration;->parameters:Lch/qos/logback/core/net/ssl/SSLParametersConfiguration;

    return-void
.end method
