.class public Lorg/apache/commons/digester/plugins/PluginInvalidInputException;
.super Lorg/apache/commons/digester/plugins/PluginException;
.source "PluginInvalidInputException.java"


# instance fields
.field private cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;)V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;->cause:Ljava/lang/Throwable;

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;-><init>(Ljava/lang/String;)V

    .line 51
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;->cause:Ljava/lang/Throwable;

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 34
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;-><init>(Ljava/lang/String;)V

    .line 35
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;->cause:Ljava/lang/Throwable;

    .line 36
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;->cause:Ljava/lang/Throwable;

    return-object v0
.end method
