.class public Lch/qos/logback/core/joran/event/SaxEventRecorder;
.super Lorg/xml/sax/helpers/DefaultHandler;

# interfaces
.implements Lch/qos/logback/core/spi/ContextAware;


# instance fields
.field private final cai:Lch/qos/logback/core/spi/ContextAwareImpl;

.field globalElementPath:Lch/qos/logback/core/joran/spi/ElementPath;

.field private locator:Lorg/xml/sax/Locator;

.field private saxEventList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    new-instance v0, Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-direct {v0}, Lch/qos/logback/core/joran/spi/ElementPath;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->globalElementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    new-instance v0, Lch/qos/logback/core/spi/ContextAwareImpl;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/spi/ContextAwareImpl;-><init>(Lch/qos/logback/core/Context;Ljava/lang/Object;)V

    iput-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    return-void
.end method

.method public constructor <init>(Lch/qos/logback/core/Context;)V
    .registers 3

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    new-instance v0, Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-direct {v0}, Lch/qos/logback/core/joran/spi/ElementPath;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->globalElementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    new-instance v0, Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-direct {v0, p1, p0}, Lch/qos/logback/core/spi/ContextAwareImpl;-><init>(Lch/qos/logback/core/Context;Ljava/lang/Object;)V

    iput-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    return-void
.end method

.method private buildPullParser()Lorg/xmlpull/v1/sax2/Driver;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Lorg/xmlpull/v1/sax2/Driver;

    invoke-direct {v0}, Lorg/xmlpull/v1/sax2/Driver;-><init>()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_12

    :try_start_5
    const-string v1, "http://xml.org/sax/features/validation"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/xmlpull/v1/sax2/Driver;->setFeature(Ljava/lang/String;Z)V
    :try_end_b
    .catch Lorg/xml/sax/SAXNotSupportedException; {:try_start_5 .. :try_end_b} :catch_1e
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_b} :catch_12

    :goto_b
    :try_start_b
    const-string v1, "http://xml.org/sax/features/namespaces"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/xmlpull/v1/sax2/Driver;->setFeature(Ljava/lang/String;Z)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_11} :catch_12

    return-object v0

    :catch_12
    move-exception v0

    const-string v1, "Parser configuration error occurred"

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v2, Lch/qos/logback/core/joran/spi/JoranException;

    invoke-direct {v2, v1, v0}, Lch/qos/logback/core/joran/spi/JoranException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_1e
    move-exception v1

    goto :goto_b
.end method

.method private handleError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v0, Lch/qos/logback/core/joran/spi/JoranException;

    invoke-direct {v0, p1, p2}, Lch/qos/logback/core/joran/spi/JoranException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public addError(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareImpl;->addError(Ljava/lang/String;)V

    return-void
.end method

.method public addError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0, p1, p2}, Lch/qos/logback/core/spi/ContextAwareImpl;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public addInfo(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareImpl;->addInfo(Ljava/lang/String;)V

    return-void
.end method

.method public addInfo(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0, p1, p2}, Lch/qos/logback/core/spi/ContextAwareImpl;->addInfo(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public addStatus(Lch/qos/logback/core/status/Status;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareImpl;->addStatus(Lch/qos/logback/core/status/Status;)V

    return-void
.end method

.method public addWarn(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareImpl;->addWarn(Ljava/lang/String;)V

    return-void
.end method

.method public addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0, p1, p2}, Lch/qos/logback/core/spi/ContextAwareImpl;->addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public characters([CII)V
    .registers 8

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {p0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->getLastEvent()Lch/qos/logback/core/joran/event/SaxEvent;

    move-result-object v0

    instance-of v2, v0, Lch/qos/logback/core/joran/event/BodyEvent;

    if-eqz v2, :cond_13

    check-cast v0, Lch/qos/logback/core/joran/event/BodyEvent;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/joran/event/BodyEvent;->append(Ljava/lang/String;)V

    :cond_12
    :goto_12
    return-void

    :cond_13
    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->isSpaceOnly(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    new-instance v2, Lch/qos/logback/core/joran/event/BodyEvent;

    invoke-virtual {p0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lch/qos/logback/core/joran/event/BodyEvent;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_12
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    if-eqz p3, :cond_8

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_8

    :cond_8
    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    new-instance v1, Lch/qos/logback/core/joran/event/EndEvent;

    invoke-virtual {p0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v2

    invoke-direct {v1, p1, p2, p3, v2}, Lch/qos/logback/core/joran/event/EndEvent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Locator;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->globalElementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ElementPath;->pop()V

    return-void
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XML_PARSING - Parsing error on line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and column "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XML_PARSING - Parsing fatal error on line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and column "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public getContext()Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0}, Lch/qos/logback/core/spi/ContextAwareImpl;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    return-object v0
.end method

.method getLastEvent()Lch/qos/logback/core/joran/event/SaxEvent;
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    add-int/lit8 v0, v0, -0x1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/event/SaxEvent;

    goto :goto_9
.end method

.method public getLocator()Lorg/xml/sax/Locator;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->locator:Lorg/xml/sax/Locator;

    return-object v0
.end method

.method public getSaxEventList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    return-object v0
.end method

.method getTagName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_a

    :cond_9
    move-object p1, p2

    :cond_a
    return-object p1
.end method

.method isSpaceOnly(Ljava/lang/String;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public recordEvents(Lorg/xml/sax/InputSource;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xml/sax/InputSource;",
            ")",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/joran/event/SaxEvent;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    invoke-direct {p0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->buildPullParser()Lorg/xmlpull/v1/sax2/Driver;

    move-result-object v0

    :try_start_4
    invoke-virtual {v0, p0}, Lorg/xmlpull/v1/sax2/Driver;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    invoke-virtual {v0, p0}, Lorg/xmlpull/v1/sax2/Driver;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    invoke-virtual {v0, p1}, Lorg/xmlpull/v1/sax2/Driver;->parse(Lorg/xml/sax/InputSource;)V

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;
    :try_end_f
    .catch Ljava/io/EOFException; {:try_start_4 .. :try_end_f} :catch_10
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_f} :catch_2b
    .catch Lorg/xml/sax/SAXException; {:try_start_4 .. :try_end_f} :catch_32
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_f} :catch_3b

    return-object v0

    :catch_10
    move-exception v0

    invoke-virtual {v0}, Ljava/io/EOFException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/xml/sax/SAXParseException;

    invoke-virtual {v0}, Ljava/io/EOFException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->locator:Lorg/xml/sax/Locator;

    invoke-direct {v2, v3, v4, v0}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;Ljava/lang/Exception;)V

    invoke-direct {p0, v1, v2}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->handleError(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_23
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This point can never be reached"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_2b
    move-exception v0

    const-string v1, "I/O error occurred while parsing xml file"

    invoke-direct {p0, v1, v0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->handleError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_23

    :catch_32
    move-exception v0

    new-instance v1, Lch/qos/logback/core/joran/spi/JoranException;

    const-string v2, "Problem parsing XML document. See previously reported errors."

    invoke-direct {v1, v2, v0}, Lch/qos/logback/core/joran/spi/JoranException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_3b
    move-exception v0

    const-string v1, "Unexpected exception while parsing XML document."

    invoke-direct {p0, v1, v0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->handleError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_23
.end method

.method public final recordEvents(Ljava/io/InputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->recordEvents(Lorg/xml/sax/InputSource;)Ljava/util/List;

    return-void
.end method

.method public setContext(Lch/qos/logback/core/Context;)V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->cai:Lch/qos/logback/core/spi/ContextAwareImpl;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/spi/ContextAwareImpl;->setContext(Lch/qos/logback/core/Context;)V

    return-void
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->locator:Lorg/xml/sax/Locator;

    return-void
.end method

.method public startDocument()V
    .registers 1

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 13

    if-eqz p3, :cond_8

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_8

    :cond_8
    invoke-virtual {p0, p2, p3}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->getTagName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->globalElementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v1, v0}, Lch/qos/logback/core/joran/spi/ElementPath;->push(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->globalElementPath:Lch/qos/logback/core/joran/spi/ElementPath;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/spi/ElementPath;->duplicate()Lch/qos/logback/core/joran/spi/ElementPath;

    move-result-object v1

    iget-object v7, p0, Lch/qos/logback/core/joran/event/SaxEventRecorder;->saxEventList:Ljava/util/List;

    new-instance v0, Lch/qos/logback/core/joran/event/StartEvent;

    invoke-virtual {p0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->getLocator()Lorg/xml/sax/Locator;

    move-result-object v6

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lch/qos/logback/core/joran/event/StartEvent;-><init>(Lch/qos/logback/core/joran/spi/ElementPath;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;Lorg/xml/sax/Locator;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XML_PARSING - Parsing warning on line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and column "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
