.class public Lch/qos/logback/classic/pattern/color/HighlightingCompositeConverter;
.super Lch/qos/logback/core/pattern/color/ForegroundCompositeConverterBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/pattern/color/ForegroundCompositeConverterBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/pattern/color/ForegroundCompositeConverterBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected getForegroundColorCode(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 3

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v0

    invoke-virtual {v0}, Lch/qos/logback/classic/Level;->toInt()I

    move-result v0

    sparse-switch v0, :sswitch_data_18

    const-string v0, "39"

    :goto_d
    return-object v0

    :sswitch_e
    const-string v0, "1;31"

    goto :goto_d

    :sswitch_11
    const-string v0, "31"

    goto :goto_d

    :sswitch_14
    const-string v0, "34"

    goto :goto_d

    nop

    :sswitch_data_18
    .sparse-switch
        0x4e20 -> :sswitch_14
        0x7530 -> :sswitch_11
        0x9c40 -> :sswitch_e
    .end sparse-switch
.end method

.method protected bridge synthetic getForegroundColorCode(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/color/HighlightingCompositeConverter;->getForegroundColorCode(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
