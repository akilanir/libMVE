.class public Lorg/apache/commons/digester/plugins/PluginAssertionFailure;
.super Ljava/lang/RuntimeException;
.source "PluginAssertionFailure.java"


# instance fields
.field private cause:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;->cause:Ljava/lang/Throwable;

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;-><init>(Ljava/lang/String;)V

    .line 73
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;->cause:Ljava/lang/Throwable;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 56
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;-><init>(Ljava/lang/String;)V

    .line 57
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;->cause:Ljava/lang/Throwable;

    .line 58
    return-void
.end method


# virtual methods
.method public getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;->cause:Ljava/lang/Throwable;

    return-object v0
.end method
