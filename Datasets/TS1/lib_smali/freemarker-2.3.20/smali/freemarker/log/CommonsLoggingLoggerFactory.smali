.class public Lfreemarker/log/CommonsLoggingLoggerFactory;
.super Ljava/lang/Object;
.source "CommonsLoggingLoggerFactory.java"

# interfaces
.implements Lfreemarker/log/LoggerFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    return-void
.end method


# virtual methods
.method public getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;
    .registers 4
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 63
    new-instance v0, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;

    invoke-static {p1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/log/CommonsLoggingLoggerFactory$CommonsLoggingLogger;-><init>(Lorg/apache/commons/logging/Log;)V

    return-object v0
.end method
