.class public Lfreemarker/log/SLF4JLoggerFactory;
.super Ljava/lang/Object;
.source "SLF4JLoggerFactory.java"

# interfaces
.implements Lfreemarker/log/LoggerFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;,
        Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;
    }
.end annotation


# static fields
.field static class$freemarker$log$SLF4JLoggerFactory$LocationAwareSLF4JLogger:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 80
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;
    .registers 4
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-static {p1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 66
    .local v0, "slf4jLogger":Lorg/slf4j/Logger;
    instance-of v1, v0, Lorg/slf4j/spi/LocationAwareLogger;

    if-eqz v1, :cond_10

    .line 67
    new-instance v1, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;

    check-cast v0, Lorg/slf4j/spi/LocationAwareLogger;

    .end local v0    # "slf4jLogger":Lorg/slf4j/Logger;
    invoke-direct {v1, v0}, Lfreemarker/log/SLF4JLoggerFactory$LocationAwareSLF4JLogger;-><init>(Lorg/slf4j/spi/LocationAwareLogger;)V

    .line 69
    :goto_f
    return-object v1

    .restart local v0    # "slf4jLogger":Lorg/slf4j/Logger;
    :cond_10
    new-instance v1, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;

    invoke-direct {v1, v0}, Lfreemarker/log/SLF4JLoggerFactory$LocationUnawareSLF4JLogger;-><init>(Lorg/slf4j/Logger;)V

    goto :goto_f
.end method
