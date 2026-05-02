.class public abstract Lch/qos/logback/classic/pattern/NamedConverter;
.super Lch/qos/logback/classic/pattern/ClassicConverter;


# instance fields
.field abbreviator:Lch/qos/logback/classic/pattern/Abbreviator;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/classic/pattern/ClassicConverter;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/classic/pattern/NamedConverter;->abbreviator:Lch/qos/logback/classic/pattern/Abbreviator;

    return-void
.end method


# virtual methods
.method public convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/NamedConverter;->getFullyQualifiedName(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/pattern/NamedConverter;->abbreviator:Lch/qos/logback/classic/pattern/Abbreviator;

    if-nez v1, :cond_9

    :goto_8
    return-object v0

    :cond_9
    iget-object v1, p0, Lch/qos/logback/classic/pattern/NamedConverter;->abbreviator:Lch/qos/logback/classic/pattern/Abbreviator;

    invoke-interface {v1, v0}, Lch/qos/logback/classic/pattern/Abbreviator;->abbreviate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method

.method public bridge synthetic convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/pattern/NamedConverter;->convert(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getFullyQualifiedName(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
.end method

.method public start()V
    .registers 3

    invoke-virtual {p0}, Lch/qos/logback/classic/pattern/NamedConverter;->getFirstOption()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_13

    :try_start_6
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_14

    new-instance v0, Lch/qos/logback/classic/pattern/ClassNameOnlyAbbreviator;

    invoke-direct {v0}, Lch/qos/logback/classic/pattern/ClassNameOnlyAbbreviator;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/pattern/NamedConverter;->abbreviator:Lch/qos/logback/classic/pattern/Abbreviator;

    :cond_13
    :goto_13
    return-void

    :cond_14
    if-lez v0, :cond_13

    new-instance v1, Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;

    invoke-direct {v1, v0}, Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;-><init>(I)V

    iput-object v1, p0, Lch/qos/logback/classic/pattern/NamedConverter;->abbreviator:Lch/qos/logback/classic/pattern/Abbreviator;
    :try_end_1d
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_1d} :catch_1e

    goto :goto_13

    :catch_1e
    move-exception v0

    goto :goto_13
.end method
