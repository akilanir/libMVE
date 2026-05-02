.class public Lfreemarker/log/_Log4JLoggerFactory;
.super Ljava/lang/Object;
.source "_Log4JLoggerFactory.java"

# interfaces
.implements Lfreemarker/log/LoggerFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/log/_Log4JLoggerFactory$Log4JLogger;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method


# virtual methods
.method public getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;
    .registers 4
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 67
    new-instance v0, Lfreemarker/log/_Log4JLoggerFactory$Log4JLogger;

    invoke-static {p1}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/log/_Log4JLoggerFactory$Log4JLogger;-><init>(Lorg/apache/log4j/Logger;)V

    return-object v0
.end method
