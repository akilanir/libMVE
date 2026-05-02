.class public Lorg/slf4j/impl/StaticLoggerBinder;
.super Ljava/lang/Object;
.source "StaticLoggerBinder.java"

# interfaces
.implements Lorg/slf4j/spi/LoggerFactoryBinder;


# static fields
.field public static REQUESTED_API_VERSION:Ljava/lang/String;

.field private static final SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;

.field static class$org$slf4j$impl$SimpleLoggerFactory:Ljava/lang/Class;

.field private static final loggerFactoryClassStr:Ljava/lang/String;


# instance fields
.field private final loggerFactory:Lorg/slf4j/ILoggerFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    new-instance v0, Lorg/slf4j/impl/StaticLoggerBinder;

    invoke-direct {v0}, Lorg/slf4j/impl/StaticLoggerBinder;-><init>()V

    sput-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;

    .line 61
    const-string v0, "1.6"

    sput-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->REQUESTED_API_VERSION:Ljava/lang/String;

    .line 63
    sget-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->class$org$slf4j$impl$SimpleLoggerFactory:Ljava/lang/Class;

    if-nez v0, :cond_1e

    const-string v0, "org.slf4j.impl.SimpleLoggerFactory"

    invoke-static {v0}, Lorg/slf4j/impl/StaticLoggerBinder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->class$org$slf4j$impl$SimpleLoggerFactory:Ljava/lang/Class;

    :goto_17
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->loggerFactoryClassStr:Ljava/lang/String;

    return-void

    :cond_1e
    sget-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->class$org$slf4j$impl$SimpleLoggerFactory:Ljava/lang/Class;

    goto :goto_17
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Lorg/slf4j/impl/SimpleLoggerFactory;

    invoke-direct {v0}, Lorg/slf4j/impl/SimpleLoggerFactory;-><init>()V

    iput-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->loggerFactory:Lorg/slf4j/ILoggerFactory;

    .line 73
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 63
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

.method public static final getSingleton()Lorg/slf4j/impl/StaticLoggerBinder;
    .registers 1

    .prologue
    .line 52
    sget-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->SINGLETON:Lorg/slf4j/impl/StaticLoggerBinder;

    return-object v0
.end method


# virtual methods
.method public getLoggerFactory()Lorg/slf4j/ILoggerFactory;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lorg/slf4j/impl/StaticLoggerBinder;->loggerFactory:Lorg/slf4j/ILoggerFactory;

    return-object v0
.end method

.method public getLoggerFactoryClassStr()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    sget-object v0, Lorg/slf4j/impl/StaticLoggerBinder;->loggerFactoryClassStr:Ljava/lang/String;

    return-object v0
.end method
