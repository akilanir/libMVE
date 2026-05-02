.class public Lch/qos/logback/classic/android/ASaxEventRecorder;
.super Lch/qos/logback/core/joran/event/SaxEventRecorder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;
    }
.end annotation


# instance fields
.field private elemAttrs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private elemNameToWatch:Ljava/lang/String;

.field private filter:Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

.field private holderForStartAndLength:[I


# direct methods
.method public constructor <init>()V
    .registers 4

    const/4 v2, 0x0

    invoke-direct {p0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;-><init>()V

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->holderForStartAndLength:[I

    new-instance v0, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-direct {v0, v1}, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;-><init>([Ljava/lang/String;)V

    iput-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->filter:Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    iput-object v2, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemNameToWatch:Ljava/lang/String;

    iput-object v2, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemAttrs:Ljava/util/Map;

    return-void
.end method

.method private characters(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 6

    iget-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->filter:Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    invoke-virtual {v0}, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;->passed()Z

    move-result v0

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->holderForStartAndLength:[I

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getTextCharacters([I)[C

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->holderForStartAndLength:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v2, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->holderForStartAndLength:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-super {p0, v0, v1, v2}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->characters([CII)V

    :cond_1b
    return-void
.end method

.method private checkForWatchedAttributes(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 8

    iget-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemNameToWatch:Ljava/lang/String;

    if-eqz v0, :cond_77

    iget-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemAttrs:Ljava/util/Map;

    if-nez v0, :cond_77

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemNameToWatch:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_77

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const/4 v0, 0x0

    :goto_1a
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v1

    if-ge v0, v1, :cond_75

    const-string v2, ""

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_78

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v4, -0x1

    if-le v2, v4, :cond_43

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_43

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_43
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_56
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_75
    iput-object v3, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemAttrs:Ljava/util/Map;

    :cond_77
    return-void

    :cond_78
    move-object v1, v2

    goto :goto_56
.end method

.method private endElement(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 4

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->filter:Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    invoke-virtual {v1, v0}, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;->checkEnd(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0, v0}, Lch/qos/logback/classic/android/ASaxEventRecorder;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_13
    return-void
.end method

.method private startDocument(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 3

    invoke-super {p0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->startDocument()V

    new-instance v0, Lorg/xml/sax/helpers/LocatorImpl;

    invoke-direct {v0}, Lorg/xml/sax/helpers/LocatorImpl;-><init>()V

    invoke-super {p0, v0}, Lch/qos/logback/core/joran/event/SaxEventRecorder;->setDocumentLocator(Lorg/xml/sax/Locator;)V

    return-void
.end method

.method private startElement(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 10

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    iget-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->filter:Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    invoke-virtual {v0, v7}, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;->checkStart(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3b

    new-instance v0, Lorg/xml/sax/helpers/AttributesImpl;

    invoke-direct {v0}, Lorg/xml/sax/helpers/AttributesImpl;-><init>()V

    const/4 v1, 0x0

    move v6, v1

    :goto_13
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v1

    if-ge v6, v1, :cond_34

    invoke-interface {p1, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeType(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lorg/xml/sax/helpers/AttributesImpl;->addAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v1, v6, 0x1

    move v6, v1

    goto :goto_13

    :cond_34
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v7, v7, v0}, Lch/qos/logback/classic/android/ASaxEventRecorder;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    :cond_3b
    invoke-direct {p0, p1}, Lch/qos/logback/classic/android/ASaxEventRecorder;->checkForWatchedAttributes(Lorg/xmlpull/v1/XmlPullParser;)V

    return-void
.end method


# virtual methods
.method public getAttributeWatchValues()Ljava/util/Map;
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

    iget-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemAttrs:Ljava/util/Map;

    return-object v0
.end method

.method public recordEvents(Lorg/xml/sax/InputSource;)Ljava/util/List;
    .registers 5
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

    invoke-virtual {p1}, Lorg/xml/sax/InputSource;->getByteStream()Ljava/io/InputStream;

    move-result-object v0

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input source must specify an input stream"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    :try_start_e
    new-instance v1, Lbrut/androlib/res/decoder/AXmlResourceParser;

    invoke-direct {v1, v0}, Lbrut/androlib/res/decoder/AXmlResourceParser;-><init>(Ljava/io/InputStream;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemAttrs:Ljava/util/Map;

    :cond_16
    :goto_16
    invoke-virtual {v1}, Lbrut/androlib/res/decoder/AXmlResourceParser;->next()I

    move-result v0

    const/4 v2, -0x1

    if-le v0, v2, :cond_43

    if-nez v0, :cond_38

    iget-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->filter:Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    invoke-virtual {v0}, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;->reset()V

    invoke-direct {p0, v1}, Lch/qos/logback/classic/android/ASaxEventRecorder;->startDocument(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_27} :catch_28

    goto :goto_16

    :catch_28
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/classic/android/ASaxEventRecorder;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Lch/qos/logback/core/joran/spi/JoranException;

    const-string v2, "Can\'t parse Android XML resource"

    invoke-direct {v1, v2, v0}, Lch/qos/logback/core/joran/spi/JoranException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_38
    const/4 v2, 0x1

    if-ne v2, v0, :cond_48

    :try_start_3b
    iget-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->filter:Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    invoke-virtual {v0}, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;->reset()V

    invoke-virtual {p0}, Lch/qos/logback/classic/android/ASaxEventRecorder;->endDocument()V

    :cond_43
    invoke-virtual {p0}, Lch/qos/logback/classic/android/ASaxEventRecorder;->getSaxEventList()Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_48
    const/4 v2, 0x2

    if-ne v2, v0, :cond_4f

    invoke-direct {p0, v1}, Lch/qos/logback/classic/android/ASaxEventRecorder;->startElement(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_16

    :cond_4f
    const/4 v2, 0x3

    if-ne v2, v0, :cond_56

    invoke-direct {p0, v1}, Lch/qos/logback/classic/android/ASaxEventRecorder;->endElement(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_16

    :cond_56
    const/4 v2, 0x4

    if-ne v2, v0, :cond_16

    invoke-direct {p0, v1}, Lch/qos/logback/classic/android/ASaxEventRecorder;->characters(Lorg/xmlpull/v1/XmlPullParser;)V
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_5c} :catch_28

    goto :goto_16
.end method

.method public setAttributeWatch(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->elemNameToWatch:Ljava/lang/String;

    return-void
.end method

.method public varargs setFilter([Ljava/lang/String;)V
    .registers 3

    new-instance v0, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    invoke-direct {v0, p1}, Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;-><init>([Ljava/lang/String;)V

    iput-object v0, p0, Lch/qos/logback/classic/android/ASaxEventRecorder;->filter:Lch/qos/logback/classic/android/ASaxEventRecorder$StatePassFilter;

    return-void
.end method
