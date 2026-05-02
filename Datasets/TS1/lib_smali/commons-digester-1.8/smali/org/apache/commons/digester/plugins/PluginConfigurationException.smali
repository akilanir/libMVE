.class public Lorg/apache/commons/digester/plugins/PluginConfigurationException;
.super Ljava/lang/RuntimeException;
.source "PluginConfigurationException.java"


# instance fields
.field private cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginConfigurationException;->cause:Ljava/lang/Throwable;

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/apache/commons/digester/plugins/PluginConfigurationException;-><init>(Ljava/lang/String;)V

    .line 55
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/PluginConfigurationException;->cause:Ljava/lang/Throwable;

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 38
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/PluginConfigurationException;-><init>(Ljava/lang/String;)V

    .line 39
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginConfigurationException;->cause:Ljava/lang/Throwable;

    .line 40
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginConfigurationException;->cause:Ljava/lang/Throwable;

    return-object v0
.end method
