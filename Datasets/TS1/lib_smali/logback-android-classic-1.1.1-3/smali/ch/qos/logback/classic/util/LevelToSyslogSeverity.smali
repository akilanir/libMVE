.class public Lch/qos/logback/classic/util/LevelToSyslogSeverity;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convert(Lch/qos/logback/classic/spi/ILoggingEvent;)I
    .registers 5

    invoke-interface {p0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v0

    iget v1, v0, Lch/qos/logback/classic/Level;->levelInt:I

    sparse-switch v1, :sswitch_data_30

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Level "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " is not a valid level for a printing method"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :sswitch_28
    const/4 v0, 0x3

    :goto_29
    return v0

    :sswitch_2a
    const/4 v0, 0x4

    goto :goto_29

    :sswitch_2c
    const/4 v0, 0x6

    goto :goto_29

    :sswitch_2e
    const/4 v0, 0x7

    goto :goto_29

    :sswitch_data_30
    .sparse-switch
        0x1388 -> :sswitch_2e
        0x2710 -> :sswitch_2e
        0x4e20 -> :sswitch_2c
        0x7530 -> :sswitch_2a
        0x9c40 -> :sswitch_28
    .end sparse-switch
.end method
