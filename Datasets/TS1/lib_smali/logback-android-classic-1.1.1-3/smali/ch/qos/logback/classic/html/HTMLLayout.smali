.class public Lch/qos/logback/classic/html/HTMLLayout;
.super Lch/qos/logback/core/html/HTMLLayoutBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/html/HTMLLayoutBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# static fields
.field static final DEFAULT_CONVERSION_PATTERN:Ljava/lang/String; = "%date%thread%level%logger%mdc%msg"


# instance fields
.field throwableRenderer:Lch/qos/logback/core/html/IThrowableRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/html/IThrowableRenderer",
            "<",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/html/HTMLLayoutBase;-><init>()V

    const-string v0, "%date%thread%level%logger%mdc%msg"

    iput-object v0, p0, Lch/qos/logback/classic/html/HTMLLayout;->pattern:Ljava/lang/String;

    new-instance v0, Lch/qos/logback/classic/html/DefaultThrowableRenderer;

    invoke-direct {v0}, Lch/qos/logback/classic/html/DefaultThrowableRenderer;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/html/HTMLLayout;->throwableRenderer:Lch/qos/logback/core/html/IThrowableRenderer;

    new-instance v0, Lch/qos/logback/classic/html/DefaultCssBuilder;

    invoke-direct {v0}, Lch/qos/logback/classic/html/DefaultCssBuilder;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/html/HTMLLayout;->cssBuilder:Lch/qos/logback/core/html/CssBuilder;

    return-void
.end method

.method private appendEventToBuffer(Ljava/lang/StringBuilder;Lch/qos/logback/core/pattern/Converter;Lch/qos/logback/classic/spi/ILoggingEvent;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Lch/qos/logback/core/pattern/Converter",
            "<",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ">;",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ")V"
        }
    .end annotation

    const-string v0, "<td class=\""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Lch/qos/logback/classic/html/HTMLLayout;->computeConverterName(Lch/qos/logback/core/pattern/Converter;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1, p3}, Lch/qos/logback/core/pattern/Converter;->write(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    const-string v0, "</td>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method protected computeConverterName(Lch/qos/logback/core/pattern/Converter;)Ljava/lang/String;
    .registers 3

    instance-of v0, p1, Lch/qos/logback/classic/pattern/MDCConverter;

    if-eqz v0, :cond_10

    check-cast p1, Lch/qos/logback/classic/pattern/MDCConverter;

    invoke-virtual {p1}, Lch/qos/logback/classic/pattern/MDCConverter;->getFirstOption()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_d

    :goto_c
    return-object v0

    :cond_d
    const-string v0, "MDC"

    goto :goto_c

    :cond_10
    invoke-super {p0, p1}, Lch/qos/logback/core/html/HTMLLayoutBase;->computeConverterName(Lch/qos/logback/core/pattern/Converter;)Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method public doLayout(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 10

    const-wide/16 v6, 0x1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Lch/qos/logback/classic/html/HTMLLayout;->startNewTableIfLimitReached(Ljava/lang/StringBuilder;)V

    const/4 v0, 0x1

    iget-wide v2, p0, Lch/qos/logback/classic/html/HTMLLayout;->counter:J

    add-long v4, v2, v6

    iput-wide v4, p0, Lch/qos/logback/classic/html/HTMLLayout;->counter:J

    and-long/2addr v2, v6

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_19

    const/4 v0, 0x0

    :cond_19
    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v2

    invoke-virtual {v2}, Lch/qos/logback/classic/Level;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "<tr class=\""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_4a

    const-string v0, " odd\">"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_39
    sget-object v0, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/html/HTMLLayout;->head:Lch/qos/logback/core/pattern/Converter;

    :goto_40
    if-eqz v0, :cond_50

    invoke-direct {p0, v1, v0, p1}, Lch/qos/logback/classic/html/HTMLLayout;->appendEventToBuffer(Ljava/lang/StringBuilder;Lch/qos/logback/core/pattern/Converter;Lch/qos/logback/classic/spi/ILoggingEvent;)V

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/Converter;->getNext()Lch/qos/logback/core/pattern/Converter;

    move-result-object v0

    goto :goto_40

    :cond_4a
    const-string v0, " even\">"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_39

    :cond_50
    const-string v0, "</tr>"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lch/qos/logback/core/CoreConstants;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThrowableProxy()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    if-eqz v0, :cond_65

    iget-object v0, p0, Lch/qos/logback/classic/html/HTMLLayout;->throwableRenderer:Lch/qos/logback/core/html/IThrowableRenderer;

    invoke-interface {v0, v1, p1}, Lch/qos/logback/core/html/IThrowableRenderer;->render(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    :cond_65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic doLayout(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/html/HTMLLayout;->doLayout(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getDefaultConverterMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lch/qos/logback/classic/PatternLayout;->defaultConverterMap:Ljava/util/Map;

    return-object v0
.end method

.method public getThrowableRenderer()Lch/qos/logback/core/html/IThrowableRenderer;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/html/HTMLLayout;->throwableRenderer:Lch/qos/logback/core/html/IThrowableRenderer;

    return-object v0
.end method

.method public setThrowableRenderer(Lch/qos/logback/core/html/IThrowableRenderer;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/html/IThrowableRenderer",
            "<",
            "Lch/qos/logback/classic/spi/ILoggingEvent;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/classic/html/HTMLLayout;->throwableRenderer:Lch/qos/logback/core/html/IThrowableRenderer;

    return-void
.end method

.method public start()V
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Lch/qos/logback/classic/html/HTMLLayout;->throwableRenderer:Lch/qos/logback/core/html/IThrowableRenderer;

    if-nez v1, :cond_b

    const-string v0, "ThrowableRender cannot be null."

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/html/HTMLLayout;->addError(Ljava/lang/String;)V

    const/4 v0, 0x1

    :cond_b
    if-nez v0, :cond_10

    invoke-super {p0}, Lch/qos/logback/core/html/HTMLLayoutBase;->start()V

    :cond_10
    return-void
.end method
