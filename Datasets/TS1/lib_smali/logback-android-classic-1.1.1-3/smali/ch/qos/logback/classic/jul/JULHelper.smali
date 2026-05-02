.class public Lch/qos/logback/classic/jul/JULHelper;
.super Ljava/lang/Object;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asJULLevel(Lch/qos/logback/classic/Level;)Ljava/util/logging/Level;
    .registers 4

    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unexpected level [null]"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    iget v0, p0, Lch/qos/logback/classic/Level;->levelInt:I

    sparse-switch v0, :sswitch_data_44

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected level ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_2e
    sget-object v0, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    :goto_30
    return-object v0

    :sswitch_31
    sget-object v0, Ljava/util/logging/Level;->FINEST:Ljava/util/logging/Level;

    goto :goto_30

    :sswitch_34
    sget-object v0, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    goto :goto_30

    :sswitch_37
    sget-object v0, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    goto :goto_30

    :sswitch_3a
    sget-object v0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    goto :goto_30

    :sswitch_3d
    sget-object v0, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    goto :goto_30

    :sswitch_40
    sget-object v0, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    goto :goto_30

    nop

    :sswitch_data_44
    .sparse-switch
        -0x80000000 -> :sswitch_2e
        0x1388 -> :sswitch_31
        0x2710 -> :sswitch_34
        0x4e20 -> :sswitch_37
        0x7530 -> :sswitch_3a
        0x9c40 -> :sswitch_3d
        0x7fffffff -> :sswitch_40
    .end sparse-switch
.end method

.method public static asJULLogger(Lch/qos/logback/classic/Logger;)Ljava/util/logging/Logger;
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/classic/Logger;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/classic/jul/JULHelper;->asJULLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    return-object v0
.end method

.method public static asJULLogger(Ljava/lang/String;)Ljava/util/logging/Logger;
    .registers 2

    invoke-static {p0}, Lch/qos/logback/classic/jul/JULHelper;->asJULLoggerName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    return-object v0
.end method

.method public static asJULLoggerName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    const-string v0, "ROOT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-string p0, ""

    :cond_a
    return-object p0
.end method

.method public static final isRegularNonRootLogger(Ljava/util/logging/Logger;)Z
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_4

    :cond_3
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0}, Ljava/util/logging/Logger;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public static final isRoot(Ljava/util/logging/Logger;)Z
    .registers 3

    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0}, Ljava/util/logging/Logger;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method
