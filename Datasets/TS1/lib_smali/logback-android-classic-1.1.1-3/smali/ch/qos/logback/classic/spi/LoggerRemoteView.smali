.class public Lch/qos/logback/classic/spi/LoggerRemoteView;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final serialVersionUID:J = 0x45c7d6c89d9f4ae0L


# instance fields
.field final loggerContextView:Lch/qos/logback/classic/spi/LoggerContextVO;

.field final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lch/qos/logback/classic/spi/LoggerRemoteView;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lch/qos/logback/classic/spi/LoggerRemoteView;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/lang/String;Lch/qos/logback/classic/LoggerContext;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/classic/spi/LoggerRemoteView;->name:Ljava/lang/String;

    sget-boolean v0, Lch/qos/logback/classic/spi/LoggerRemoteView;->$assertionsDisabled:Z

    if-nez v0, :cond_15

    invoke-virtual {p2}, Lch/qos/logback/classic/LoggerContext;->getLoggerContextRemoteView()Lch/qos/logback/classic/spi/LoggerContextVO;

    move-result-object v0

    if-nez v0, :cond_15

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_15
    invoke-virtual {p2}, Lch/qos/logback/classic/LoggerContext;->getLoggerContextRemoteView()Lch/qos/logback/classic/spi/LoggerContextVO;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/spi/LoggerRemoteView;->loggerContextView:Lch/qos/logback/classic/spi/LoggerContextVO;

    return-void
.end method


# virtual methods
.method public getLoggerContextView()Lch/qos/logback/classic/spi/LoggerContextVO;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/LoggerRemoteView;->loggerContextView:Lch/qos/logback/classic/spi/LoggerContextVO;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/spi/LoggerRemoteView;->name:Ljava/lang/String;

    return-object v0
.end method
