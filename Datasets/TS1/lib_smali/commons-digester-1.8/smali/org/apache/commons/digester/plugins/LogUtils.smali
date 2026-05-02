.class Lorg/apache/commons/digester/plugins/LogUtils;
.super Ljava/lang/Object;
.source "LogUtils.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getLogger(Lorg/apache/commons/digester/Digester;)Lorg/apache/commons/logging/Log;
    .registers 2
    .param p0, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 67
    if-nez p0, :cond_8

    .line 68
    new-instance v0, Lorg/apache/commons/logging/impl/NoOpLog;

    invoke-direct {v0}, Lorg/apache/commons/logging/impl/NoOpLog;-><init>()V

    .line 71
    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v0

    goto :goto_7
.end method
