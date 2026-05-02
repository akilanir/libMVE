.class Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "TaglibFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jsp/TaglibFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebXmlParser"
.end annotation


# instance fields
.field private buf:Ljava/lang/StringBuffer;

.field private location:Ljava/lang/String;

.field private locator:Lorg/xml/sax/Locator;

.field private final this$0:Lfreemarker/ext/jsp/TaglibFactory;

.field private uri:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lfreemarker/ext/jsp/TaglibFactory;)V
    .registers 2

    .prologue
    .line 294
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->this$0:Lfreemarker/ext/jsp/TaglibFactory;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jsp/TaglibFactory;Lfreemarker/ext/jsp/TaglibFactory$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/ext/jsp/TaglibFactory;
    .param p2, "x1"    # Lfreemarker/ext/jsp/TaglibFactory$1;

    .prologue
    .line 294
    invoke-direct {p0, p1}, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;-><init>(Lfreemarker/ext/jsp/TaglibFactory;)V

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .registers 5
    .param p1, "chars"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 316
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->buf:Ljava/lang/StringBuffer;

    if-eqz v0, :cond_9

    .line 317
    iget-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 319
    :cond_9
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "nsuri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 322
    const-string v2, "taglib-uri"

    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 323
    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->uri:Ljava/lang/String;

    .line 324
    iput-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->buf:Ljava/lang/StringBuffer;

    .line 348
    :cond_17
    :goto_17
    return-void

    .line 326
    :cond_18
    const-string v2, "taglib-location"

    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 327
    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->location:Ljava/lang/String;

    .line 329
    :try_start_2c
    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->location:Ljava/lang/String;

    invoke-static {v2}, Lfreemarker/ext/jsp/TaglibFactory;->access$100(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_4c

    .line 330
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "/WEB-INF/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->location:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->location:Ljava/lang/String;
    :try_end_4c
    .catch Lfreemarker/template/TemplateModelException; {:try_start_2c .. :try_end_4c} :catch_4f

    .line 336
    :cond_4c
    iput-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->buf:Ljava/lang/StringBuffer;

    goto :goto_17

    .line 333
    :catch_4f
    move-exception v0

    .line 334
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v2, Lorg/xml/sax/SAXParseException;

    invoke-virtual {v0}, Lfreemarker/template/TemplateModelException;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->locator:Lorg/xml/sax/Locator;

    invoke-direct {v2, v3, v4, v0}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;Ljava/lang/Exception;)V

    throw v2

    .line 338
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :cond_5c
    const-string v2, "taglib"

    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 340
    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->location:Ljava/lang/String;

    const-string v3, ".jar"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_78

    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->location:Ljava/lang/String;

    const-string v3, ".zip"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_86

    .line 341
    :cond_78
    const-string v1, "META-INF/taglib.tld"

    .line 346
    .local v1, "zname":Ljava/lang/String;
    :goto_7a
    iget-object v2, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->this$0:Lfreemarker/ext/jsp/TaglibFactory;

    const-string v3, "web.xml"

    iget-object v4, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->location:Ljava/lang/String;

    iget-object v5, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->uri:Ljava/lang/String;

    invoke-static {v2, v3, v4, v1, v5}, Lfreemarker/ext/jsp/TaglibFactory;->access$200(Lfreemarker/ext/jsp/TaglibFactory;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_17

    .line 344
    .end local v1    # "zname":Ljava/lang/String;
    :cond_86
    const/4 v1, 0x0

    .restart local v1    # "zname":Ljava/lang/String;
    goto :goto_7a
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .registers 2
    .param p1, "locator"    # Lorg/xml/sax/Locator;

    .prologue
    .line 301
    iput-object p1, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->locator:Lorg/xml/sax/Locator;

    .line 302
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 6
    .param p1, "nsuri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "atts"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 309
    const-string v0, "taglib-uri"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "taglib-location"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 311
    :cond_10
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/TaglibFactory$WebXmlParser;->buf:Ljava/lang/StringBuffer;

    .line 313
    :cond_17
    return-void
.end method
