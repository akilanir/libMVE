.class public Lch/qos/logback/classic/pattern/ClassOfCallerConverter;
.super Lch/qos/logback/classic/pattern/NamedConverter;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/NamedConverter;-><init>()V

    return-void
.end method


# virtual methods
.method protected getFullyQualifiedName(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 4

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getCallerData()[Ljava/lang/StackTraceElement;

    move-result-object v0

    if-eqz v0, :cond_11

    array-length v1, v0

    if-lez v1, :cond_11

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    :goto_10
    return-object v0

    :cond_11
    const-string v0, "?"

    goto :goto_10
.end method
