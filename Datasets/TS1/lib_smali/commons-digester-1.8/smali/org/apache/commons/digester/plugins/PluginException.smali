.class public Lorg/apache/commons/digester/plugins/PluginException;
.super Ljava/lang/Exception;
.source "PluginException.java"


# instance fields
.field private cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginException;->cause:Ljava/lang/Throwable;

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;)V

    .line 53
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/PluginException;->cause:Ljava/lang/Throwable;

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 36
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;)V

    .line 37
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginException;->cause:Ljava/lang/Throwable;

    .line 38
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginException;->cause:Ljava/lang/Throwable;

    return-object v0
.end method
