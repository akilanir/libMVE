.class public Lch/qos/logback/classic/log4j/XMLLayout;
.super Lch/qos/logback/core/LayoutBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/LayoutBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_SIZE:I = 0x100

.field private static final UPPER_LIMIT:I = 0x800


# instance fields
.field private buf:Ljava/lang/StringBuilder;

.field private locationInfo:Z

.field private properties:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    const/4 v2, 0x0

    invoke-direct {p0}, Lch/qos/logback/core/LayoutBase;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    iput-boolean v2, p0, Lch/qos/logback/classic/log4j/XMLLayout;->locationInfo:Z

    iput-boolean v2, p0, Lch/qos/logback/classic/log4j/XMLLayout;->properties:Z

    return-void
.end method


# virtual methods
.method public doLayout(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 9

    const/4 v1, 0x0

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->capacity()I

    move-result v0

    const/16 v2, 0x800

    if-le v0, v2, :cond_aa

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x100

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    :goto_14
    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "<log4j:event logger=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "\"\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "             timestamp=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getTimeStamp()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "\" level=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "\" thread=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThreadName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "\">\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "  <log4j:message><![CDATA["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getFormattedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lch/qos/logback/core/helpers/Transform;->appendEscapingCDATA(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "]]></log4j:message>\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getThrowableProxy()Lch/qos/logback/classic/spi/IThrowableProxy;

    move-result-object v0

    if-eqz v0, :cond_b8

    invoke-interface {v0}, Lch/qos/logback/classic/spi/IThrowableProxy;->getStackTraceElementProxyArray()[Lch/qos/logback/classic/spi/StackTraceElementProxy;

    move-result-object v2

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v3, "  <log4j:throwable><![CDATA["

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v3, v2

    move v0, v1

    :goto_8c
    if-ge v0, v3, :cond_b1

    aget-object v4, v2, v0

    iget-object v5, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const/16 v6, 0x9

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lch/qos/logback/classic/spi/StackTraceElementProxy;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v5, "\r\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_8c

    :cond_aa
    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    goto/16 :goto_14

    :cond_b1
    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "]]></log4j:throwable>\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b8
    iget-boolean v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->locationInfo:Z

    if-eqz v0, :cond_119

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getCallerData()[Ljava/lang/StackTraceElement;

    move-result-object v0

    if-eqz v0, :cond_119

    array-length v2, v0

    if-lez v2, :cond_119

    aget-object v0, v0, v1

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "  <log4j:locationInfo class=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "\"\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "                      method=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lch/qos/logback/core/helpers/Transform;->escapeTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "\" file=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "\" line=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v1, "\"/>\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_119
    invoke-virtual {p0}, Lch/qos/logback/classic/log4j/XMLLayout;->getProperties()Z

    move-result v0

    if-eqz v0, :cond_1ac

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getMDCPropertyMap()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1ac

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-eqz v1, :cond_1ac

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v2, "  <log4j:properties>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_13a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v3, "\r\n    <log4j:data"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " name=\'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lch/qos/logback/core/helpers/Transform;->escapeTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "\'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " value=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lch/qos/logback/core/helpers/Transform;->escapeTags(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v1, " />"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_13a

    :cond_1a5
    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v1, "\r\n  </log4j:properties>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1ac
    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    const-string v1, "\r\n</log4j:event>\r\n\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->buf:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic doLayout(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/log4j/XMLLayout;->doLayout(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    const-string v0, "text/xml"

    return-object v0
.end method

.method public getLocationInfo()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->locationInfo:Z

    return v0
.end method

.method public getProperties()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/classic/log4j/XMLLayout;->properties:Z

    return v0
.end method

.method public setLocationInfo(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->locationInfo:Z

    return-void
.end method

.method public setProperties(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/classic/log4j/XMLLayout;->properties:Z

    return-void
.end method

.method public start()V
    .registers 1

    invoke-super {p0}, Lch/qos/logback/core/LayoutBase;->start()V

    return-void
.end method
