.class public Lch/qos/logback/classic/pattern/LoggerConverter;
.super Lch/qos/logback/classic/pattern/NamedConverter;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/NamedConverter;-><init>()V

    return-void
.end method


# virtual methods
.method protected getFullyQualifiedName(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 3

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
