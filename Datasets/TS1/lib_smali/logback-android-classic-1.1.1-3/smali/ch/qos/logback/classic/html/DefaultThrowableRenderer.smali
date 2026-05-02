.class public Lch/qos/logback/classic/html/DefaultThrowableRenderer;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/html/IThrowableRenderer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lch/qos/logback/core/html/IThrowableRenderer",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# static fields
.field static final TRACE_PREFIX:Ljava/lang/String; = "<br />&nbsp;&nbsp;&nbsp;&nbsp;"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public printFirstLine(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 5

    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCommonFrames()I

    move-result v0

    if-lez v0, :cond_11

    const-string v0, "<br />"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "Caused by: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_11
    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/helpers/Transform;->escapeTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public render(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/ILoggingEvent;)V
    .registers 5

    invoke-interface {p2}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThrowableProxy()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    const-string v1, "<tr><td class=\"Exception\" colspan=\"6\">"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_9
    if-eqz v0, :cond_13

    invoke-virtual {p0, p1, v0}, Lch/qos/logback/classic/html/DefaultThrowableRenderer;->render(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V

    invoke-interface {v0}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCause()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    goto :goto_9

    :cond_13
    const-string v0, "</td></tr>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method render(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V
    .registers 8

    invoke-virtual {p0, p1, p2}, Lch/qos/logback/classic/html/DefaultThrowableRenderer;->printFirstLine(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/IThrowableProxy;)V

    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getCommonFrames()I

    move-result v1

    invoke-interface {p2}, Lch/qos/logback/classic/spi/IThrowableProxy;->getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v2

    const/4 v0, 0x0

    :goto_c
    array-length v3, v2

    sub-int/2addr v3, v1

    if-ge v0, v3, :cond_2a

    aget-object v3, v2, v0

    const-string v4, "<br />&nbsp;&nbsp;&nbsp;&nbsp;"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Lch/qos/logback/classic/spi/StackTraceElementProxy;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lch/qos/logback/core/helpers/Transform;->escapeTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_2a
    if-lez v1, :cond_46

    const-string v0, "<br />&nbsp;&nbsp;&nbsp;&nbsp;"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\t... "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " common frames omitted"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_46
    return-void
.end method

.method public bridge synthetic render(Ljava/lang/StringBuilder;Ljava/lang/Object;)V
    .registers 3

    check-cast p2, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1, p2}, Lch/qos/logback/classic/html/DefaultThrowableRenderer;->render(Ljava/lang/StringBuilder;Lch/qos/logback/classic/spi/ILoggingEvent;)V

    return-void
.end method
