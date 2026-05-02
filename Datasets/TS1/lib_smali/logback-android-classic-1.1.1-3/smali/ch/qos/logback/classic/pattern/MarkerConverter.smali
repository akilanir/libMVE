.class public Lch/qos/logback/classic/pattern/MarkerConverter;
.super Lch/qos/logback/classic/pattern/ClassicConverter;


# static fields
.field private static EMPTY:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, ""

    sput-object v0, Lch/qos/logback/classic/pattern/MarkerConverter;->EMPTY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 3

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getMarker()Lorg/slf4j/Marker;

    move-result-object v0

    if-nez v0, :cond_9

    sget-object v0, Lch/qos/logback/classic/pattern/MarkerConverter;->EMPTY:Ljava/lang/String;

    :goto_8
    return-object v0

    :cond_9
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method public bridge synthetic convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/MarkerConverter;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
