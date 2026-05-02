.class public Lezvcard/io/xml/XCardWriter;
.super Lezvcard/io/StreamWriter;
.source "XCardWriter.java"


# instance fields
.field private final DOC:Lorg/w3c/dom/Document;

.field private final handler:Ljavax/xml/transform/sax/TransformerHandler;

.field private final indent:Ljava/lang/String;

.field private level:I

.field private final parameterDataTypes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lezvcard/VCardDataType;",
            ">;"
        }
    .end annotation
.end field

.field private started:Z

.field private final targetVersion:Lezvcard/VCardVersion;

.field private textNodeJustPrinted:Z

.field private final vcardsElementExists:Z

.field private final writer:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/File;)Ljava/io/Writer;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardWriter;-><init>(Ljava/io/Writer;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "indent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/File;)Ljava/io/Writer;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lezvcard/io/xml/XCardWriter;-><init>(Ljava/io/Writer;Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 134
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardWriter;-><init>(Ljava/io/Writer;)V

    .line 135
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "indent"    # Ljava/lang/String;

    .prologue
    .line 144
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lezvcard/io/xml/XCardWriter;-><init>(Ljava/io/Writer;Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;)V
    .registers 3
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    .line 172
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/xml/XCardWriter;-><init>(Ljava/io/Writer;Ljava/lang/String;)V

    .line 173
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;Ljava/lang/String;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "indent"    # Ljava/lang/String;

    .prologue
    .line 182
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lezvcard/io/xml/XCardWriter;-><init>(Ljava/io/Writer;Ljava/lang/String;Lorg/w3c/dom/Node;)V

    .line 183
    return-void
.end method

.method private constructor <init>(Ljava/io/Writer;Ljava/lang/String;Lorg/w3c/dom/Node;)V
    .registers 11
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "indent"    # Ljava/lang/String;
    .param p3, "parent"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v6, 0x0

    .line 193
    invoke-direct {p0}, Lezvcard/io/StreamWriter;-><init>()V

    .line 100
    sget-object v4, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    iput-object v4, p0, Lezvcard/io/xml/XCardWriter;->targetVersion:Lezvcard/VCardVersion;

    .line 101
    invoke-static {}, Lezvcard/util/XmlUtils;->createDocument()Lorg/w3c/dom/Document;

    move-result-object v4

    iput-object v4, p0, Lezvcard/io/xml/XCardWriter;->DOC:Lorg/w3c/dom/Document;

    .line 107
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lezvcard/io/xml/XCardWriter;->parameterDataTypes:Ljava/util/Map;

    .line 109
    const-string v4, "ALTID"

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 110
    const-string v4, "CALSCALE"

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 111
    const-string v4, "GEO"

    sget-object v5, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 112
    const-string v4, "LABEL"

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 113
    const-string v4, "LANGUAGE"

    sget-object v5, Lezvcard/VCardDataType;->LANGUAGE_TAG:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 114
    const-string v4, "MEDIATYPE"

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 115
    const-string v4, "PID"

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 116
    const-string v4, "PREF"

    sget-object v5, Lezvcard/VCardDataType;->INTEGER:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 117
    const-string v4, "SORT-AS"

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 118
    const-string v4, "TYPE"

    sget-object v5, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 119
    const-string v4, "TZ"

    sget-object v5, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {p0, v4, v5}, Lezvcard/io/xml/XCardWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 126
    iput v6, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 127
    iput-boolean v6, p0, Lezvcard/io/xml/XCardWriter;->textNodeJustPrinted:Z

    iput-boolean v6, p0, Lezvcard/io/xml/XCardWriter;->started:Z

    .line 194
    iput-object p1, p0, Lezvcard/io/xml/XCardWriter;->writer:Ljava/io/Writer;

    .line 195
    iput-object p2, p0, Lezvcard/io/xml/XCardWriter;->indent:Ljava/lang/String;

    .line 197
    instance-of v4, p3, Lorg/w3c/dom/Document;

    if-eqz v4, :cond_77

    .line 198
    invoke-interface {p3}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v3

    .line 199
    .local v3, "root":Lorg/w3c/dom/Node;
    if-eqz v3, :cond_77

    .line 200
    move-object p3, v3

    .line 203
    .end local v3    # "root":Lorg/w3c/dom/Node;
    :cond_77
    invoke-direct {p0, p3}, Lezvcard/io/xml/XCardWriter;->isVCardsElement(Lorg/w3c/dom/Node;)Z

    move-result v4

    iput-boolean v4, p0, Lezvcard/io/xml/XCardWriter;->vcardsElementExists:Z

    .line 206
    :try_start_7d
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v1

    check-cast v1, Ljavax/xml/transform/sax/SAXTransformerFactory;

    .line 207
    .local v1, "factory":Ljavax/xml/transform/sax/SAXTransformerFactory;
    invoke-virtual {v1}, Ljavax/xml/transform/sax/SAXTransformerFactory;->newTransformerHandler()Ljavax/xml/transform/sax/TransformerHandler;

    move-result-object v4

    iput-object v4, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;
    :try_end_89
    .catch Ljavax/xml/transform/TransformerConfigurationException; {:try_start_7d .. :try_end_89} :catch_96

    .line 212
    if-nez p1, :cond_9d

    new-instance v2, Ljavax/xml/transform/dom/DOMResult;

    invoke-direct {v2, p3}, Ljavax/xml/transform/dom/DOMResult;-><init>(Lorg/w3c/dom/Node;)V

    .line 213
    .local v2, "result":Ljavax/xml/transform/Result;
    :goto_90
    iget-object v4, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    invoke-interface {v4, v2}, Ljavax/xml/transform/sax/TransformerHandler;->setResult(Ljavax/xml/transform/Result;)V

    .line 214
    return-void

    .line 208
    .end local v1    # "factory":Ljavax/xml/transform/sax/SAXTransformerFactory;
    .end local v2    # "result":Ljavax/xml/transform/Result;
    :catch_96
    move-exception v0

    .line 209
    .local v0, "e":Ljavax/xml/transform/TransformerConfigurationException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 212
    .end local v0    # "e":Ljavax/xml/transform/TransformerConfigurationException;
    .restart local v1    # "factory":Ljavax/xml/transform/sax/SAXTransformerFactory;
    :cond_9d
    new-instance v2, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v2, p1}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    goto :goto_90
.end method

.method public constructor <init>(Lorg/w3c/dom/Node;)V
    .registers 3
    .param p1, "parent"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v0, 0x0

    .line 190
    invoke-direct {p0, v0, v0, p1}, Lezvcard/io/xml/XCardWriter;-><init>(Ljava/io/Writer;Ljava/lang/String;Lorg/w3c/dom/Node;)V

    .line 191
    return-void
.end method

.method private childless(Lorg/w3c/dom/Element;)V
    .registers 7
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 442
    invoke-direct {p0, p1}, Lezvcard/io/xml/XCardWriter;->getElementAttributes(Lorg/w3c/dom/Element;)Lorg/xml/sax/Attributes;

    move-result-object v0

    .line 443
    .local v0, "attributes":Lorg/xml/sax/Attributes;
    invoke-direct {p0}, Lezvcard/io/xml/XCardWriter;->indent()V

    .line 444
    iget-object v1, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v2, v3, v4, v0}, Ljavax/xml/transform/sax/TransformerHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 445
    iget-object v1, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v2, v3, v4}, Ljavax/xml/transform/sax/TransformerHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    return-void
.end method

.method private end(Ljava/lang/String;)V
    .registers 3
    .param p1, "element"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 479
    iget-object v0, p0, Lezvcard/io/xml/XCardWriter;->targetVersion:Lezvcard/VCardVersion;

    invoke-virtual {v0}, Lezvcard/VCardVersion;->getXmlNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lezvcard/io/xml/XCardWriter;->end(Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    return-void
.end method

.method private end(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "element"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 487
    iget-boolean v0, p0, Lezvcard/io/xml/XCardWriter;->textNodeJustPrinted:Z

    if-nez v0, :cond_7

    .line 488
    invoke-direct {p0}, Lezvcard/io/xml/XCardWriter;->indent()V

    .line 491
    :cond_7
    iget-object v0, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    const-string v1, ""

    invoke-interface {v0, p1, v1, p2}, Ljavax/xml/transform/sax/TransformerHandler;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    const/4 v0, 0x0

    iput-boolean v0, p0, Lezvcard/io/xml/XCardWriter;->textNodeJustPrinted:Z

    .line 493
    return-void
.end method

.method private end(Ljavax/xml/namespace/QName;)V
    .registers 4
    .param p1, "qname"    # Ljavax/xml/namespace/QName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 483
    invoke-virtual {p1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lezvcard/io/xml/XCardWriter;->end(Ljava/lang/String;Ljava/lang/String;)V

    .line 484
    return-void
.end method

.method private end(Lorg/w3c/dom/Element;)V
    .registers 4
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 475
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lezvcard/io/xml/XCardWriter;->end(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    return-void
.end method

.method private getElementAttributes(Lorg/w3c/dom/Element;)Lorg/xml/sax/Attributes;
    .registers 11
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 501
    new-instance v0, Lorg/xml/sax/helpers/AttributesImpl;

    invoke-direct {v0}, Lorg/xml/sax/helpers/AttributesImpl;-><init>()V

    .line 502
    .local v0, "attributes":Lorg/xml/sax/helpers/AttributesImpl;
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v6

    .line 503
    .local v6, "attributeNodes":Lorg/w3c/dom/NamedNodeMap;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_a
    invoke-interface {v6}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v1

    if-ge v7, v1, :cond_2a

    .line 504
    invoke-interface {v6, v7}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 505
    .local v8, "node":Lorg/w3c/dom/Node;
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lorg/xml/sax/helpers/AttributesImpl;->addAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 503
    add-int/lit8 v7, v7, 0x1

    goto :goto_a

    .line 507
    .end local v8    # "node":Lorg/w3c/dom/Node;
    :cond_2a
    return-object v0
.end method

.method private indent()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 427
    iget-object v3, p0, Lezvcard/io/xml/XCardWriter;->indent:Ljava/lang/String;

    if-nez v3, :cond_5

    .line 439
    :goto_4
    return-void

    .line 432
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 433
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    iget v3, p0, Lezvcard/io/xml/XCardWriter;->level:I

    if-ge v0, v3, :cond_19

    .line 434
    iget-object v3, p0, Lezvcard/io/xml/XCardWriter;->indent:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 433
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 437
    :cond_19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 438
    .local v2, "str":Ljava/lang/String;
    iget-object v3, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    invoke-interface {v3, v4, v5, v6}, Ljavax/xml/transform/sax/TransformerHandler;->ignorableWhitespace([CII)V

    goto :goto_4
.end method

.method private isVCardsElement(Lorg/w3c/dom/Node;)Z
    .registers 6
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v1, 0x0

    .line 217
    if-nez p1, :cond_4

    .line 226
    :cond_3
    :goto_3
    return v1

    .line 221
    :cond_4
    instance-of v2, p1, Lorg/w3c/dom/Element;

    if-eqz v2, :cond_3

    .line 225
    sget-object v0, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    .line 226
    .local v0, "vcards":Ljavax/xml/namespace/QName;
    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v1, 0x1

    goto :goto_3
.end method

.method private start(Ljava/lang/String;)V
    .registers 3
    .param p1, "element"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 454
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/xml/XCardWriter;->start(Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 455
    return-void
.end method

.method private start(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 6
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "element"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 470
    invoke-direct {p0}, Lezvcard/io/xml/XCardWriter;->indent()V

    .line 471
    iget-object v0, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    const-string v1, ""

    invoke-interface {v0, p1, v1, p2, p3}, Ljavax/xml/transform/sax/TransformerHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 472
    return-void
.end method

.method private start(Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 4
    .param p1, "element"    # Ljava/lang/String;
    .param p2, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 466
    iget-object v0, p0, Lezvcard/io/xml/XCardWriter;->targetVersion:Lezvcard/VCardVersion;

    invoke-virtual {v0}, Lezvcard/VCardVersion;->getXmlNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lezvcard/io/xml/XCardWriter;->start(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 467
    return-void
.end method

.method private start(Ljavax/xml/namespace/QName;)V
    .registers 3
    .param p1, "qname"    # Ljavax/xml/namespace/QName;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 458
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/xml/XCardWriter;->start(Ljavax/xml/namespace/QName;Lorg/xml/sax/Attributes;)V

    .line 459
    return-void
.end method

.method private start(Ljavax/xml/namespace/QName;Lorg/xml/sax/Attributes;)V
    .registers 5
    .param p1, "qname"    # Ljavax/xml/namespace/QName;
    .param p2, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 462
    invoke-virtual {p1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2}, Lezvcard/io/xml/XCardWriter;->start(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 463
    return-void
.end method

.method private start(Lorg/w3c/dom/Element;)V
    .registers 5
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 449
    invoke-direct {p0, p1}, Lezvcard/io/xml/XCardWriter;->getElementAttributes(Lorg/w3c/dom/Element;)Lorg/xml/sax/Attributes;

    move-result-object v0

    .line 450
    .local v0, "attributes":Lorg/xml/sax/Attributes;
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2, v0}, Lezvcard/io/xml/XCardWriter;->start(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 451
    return-void
.end method

.method private text(Ljava/lang/String;)V
    .registers 6
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 496
    iget-object v0, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-interface {v0, v1, v2, v3}, Ljavax/xml/transform/sax/TransformerHandler;->characters([CII)V

    .line 497
    const/4 v0, 0x1

    iput-boolean v0, p0, Lezvcard/io/xml/XCardWriter;->textNodeJustPrinted:Z

    .line 498
    return-void
.end method

.method private write(Lezvcard/parameter/VCardParameters;)V
    .registers 10
    .param p1, "parameters"    # Lezvcard/parameter/VCardParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 397
    invoke-virtual {p1}, Lezvcard/parameter/VCardParameters;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 424
    :goto_6
    return-void

    .line 401
    :cond_7
    sget-object v7, Lezvcard/io/xml/XCardQNames;->PARAMETERS:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v7}, Lezvcard/io/xml/XCardWriter;->start(Ljavax/xml/namespace/QName;)V

    .line 402
    iget v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 404
    invoke-virtual {p1}, Lezvcard/parameter/VCardParameters;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_74

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 405
    .local v4, "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 406
    .local v5, "parameterName":Ljava/lang/String;
    invoke-direct {p0, v5}, Lezvcard/io/xml/XCardWriter;->start(Ljava/lang/String;)V

    .line 407
    iget v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 409
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_3f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 410
    .local v6, "parameterValue":Ljava/lang/String;
    iget-object v7, p0, Lezvcard/io/xml/XCardWriter;->parameterDataTypes:Ljava/util/Map;

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/VCardDataType;

    .line 411
    .local v0, "dataType":Lezvcard/VCardDataType;
    if-nez v0, :cond_61

    const-string v1, "unknown"

    .line 413
    .local v1, "dataTypeElementName":Ljava/lang/String;
    :goto_57
    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->start(Ljava/lang/String;)V

    .line 414
    invoke-direct {p0, v6}, Lezvcard/io/xml/XCardWriter;->text(Ljava/lang/String;)V

    .line 415
    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->end(Ljava/lang/String;)V

    goto :goto_3f

    .line 411
    .end local v1    # "dataTypeElementName":Ljava/lang/String;
    :cond_61
    invoke-virtual {v0}, Lezvcard/VCardDataType;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    goto :goto_57

    .line 418
    .end local v0    # "dataType":Lezvcard/VCardDataType;
    .end local v6    # "parameterValue":Ljava/lang/String;
    :cond_6a
    iget v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 419
    invoke-direct {p0, v5}, Lezvcard/io/xml/XCardWriter;->end(Ljava/lang/String;)V

    goto :goto_16

    .line 422
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v5    # "parameterName":Ljava/lang/String;
    :cond_74
    iget v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 423
    sget-object v7, Lezvcard/io/xml/XCardQNames;->PARAMETERS:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v7}, Lezvcard/io/xml/XCardWriter;->end(Ljavax/xml/namespace/QName;)V

    goto :goto_6
.end method

.method private write(Lezvcard/property/VCardProperty;Lezvcard/VCard;)V
    .registers 13
    .param p1, "property"    # Lezvcard/property/VCardProperty;
    .param p2, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 330
    iget-object v7, p0, Lezvcard/io/xml/XCardWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v7, p1}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Lezvcard/property/VCardProperty;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v4

    .line 331
    .local v4, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;
    iget-object v7, p0, Lezvcard/io/xml/XCardWriter;->targetVersion:Lezvcard/VCardVersion;

    invoke-virtual {v4, p1, v7, p2}, Lezvcard/io/scribe/VCardPropertyScribe;->prepareParameters(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;Lezvcard/VCard;)Lezvcard/parameter/VCardParameters;

    move-result-object v1

    .line 335
    .local v1, "parameters":Lezvcard/parameter/VCardParameters;
    instance-of v7, p1, Lezvcard/property/Xml;

    if-eqz v7, :cond_39

    move-object v6, p1

    .line 336
    check-cast v6, Lezvcard/property/Xml;

    .line 337
    .local v6, "xml":Lezvcard/property/Xml;
    invoke-virtual {v6}, Lezvcard/property/Xml;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Document;

    .line 338
    .local v5, "value":Lorg/w3c/dom/Document;
    if-nez v5, :cond_1c

    .line 362
    .end local v5    # "value":Lorg/w3c/dom/Document;
    .end local v6    # "xml":Lezvcard/property/Xml;
    :goto_1b
    return-void

    .line 341
    .restart local v5    # "value":Lorg/w3c/dom/Document;
    .restart local v6    # "xml":Lezvcard/property/Xml;
    :cond_1c
    invoke-static {v5}, Lezvcard/util/XmlUtils;->getRootElement(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 354
    .end local v5    # "value":Lorg/w3c/dom/Document;
    .end local v6    # "xml":Lezvcard/property/Xml;
    .local v2, "propertyElement":Lorg/w3c/dom/Element;
    :goto_20
    invoke-direct {p0, v2}, Lezvcard/io/xml/XCardWriter;->start(Lorg/w3c/dom/Element;)V

    .line 355
    iget v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 357
    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->write(Lezvcard/parameter/VCardParameters;)V

    .line 358
    invoke-direct {p0, v2}, Lezvcard/io/xml/XCardWriter;->write(Lorg/w3c/dom/Element;)V

    .line 360
    iget v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 361
    invoke-direct {p0, v2}, Lezvcard/io/xml/XCardWriter;->end(Lorg/w3c/dom/Element;)V

    goto :goto_1b

    .line 343
    .end local v2    # "propertyElement":Lorg/w3c/dom/Element;
    :cond_39
    invoke-virtual {v4}, Lezvcard/io/scribe/VCardPropertyScribe;->getQName()Ljavax/xml/namespace/QName;

    move-result-object v3

    .line 344
    .local v3, "qname":Ljavax/xml/namespace/QName;
    iget-object v7, p0, Lezvcard/io/xml/XCardWriter;->DOC:Lorg/w3c/dom/Document;

    invoke-virtual {v3}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 346
    .restart local v2    # "propertyElement":Lorg/w3c/dom/Element;
    :try_start_4b
    invoke-virtual {v4, p1, v2}, Lezvcard/io/scribe/VCardPropertyScribe;->writeXml(Lezvcard/property/VCardProperty;Lorg/w3c/dom/Element;)V
    :try_end_4e
    .catch Lezvcard/io/SkipMeException; {:try_start_4b .. :try_end_4e} :catch_4f
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_4b .. :try_end_4e} :catch_51

    goto :goto_20

    .line 347
    :catch_4f
    move-exception v0

    .line 348
    .local v0, "e":Lezvcard/io/SkipMeException;
    goto :goto_1b

    .line 349
    .end local v0    # "e":Lezvcard/io/SkipMeException;
    :catch_51
    move-exception v0

    .line 350
    .local v0, "e":Lezvcard/io/EmbeddedVCardException;
    goto :goto_1b
.end method

.method private write(Lorg/w3c/dom/Element;)V
    .registers 8
    .param p1, "propertyElement"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 365
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 366
    .local v1, "children":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v3, v5, :cond_47

    .line 367
    invoke-interface {v1, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 369
    .local v0, "child":Lorg/w3c/dom/Node;
    instance-of v5, v0, Lorg/w3c/dom/Element;

    if-eqz v5, :cond_38

    move-object v2, v0

    .line 370
    check-cast v2, Lorg/w3c/dom/Element;

    .line 372
    .local v2, "element":Lorg/w3c/dom/Element;
    invoke-interface {v2}, Lorg/w3c/dom/Element;->hasChildNodes()Z

    move-result v5

    if-eqz v5, :cond_34

    .line 373
    invoke-direct {p0, v2}, Lezvcard/io/xml/XCardWriter;->start(Lorg/w3c/dom/Element;)V

    .line 374
    iget v5, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 376
    invoke-direct {p0, v2}, Lezvcard/io/xml/XCardWriter;->write(Lorg/w3c/dom/Element;)V

    .line 378
    iget v5, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 379
    invoke-direct {p0, v2}, Lezvcard/io/xml/XCardWriter;->end(Lorg/w3c/dom/Element;)V

    .line 366
    .end local v2    # "element":Lorg/w3c/dom/Element;
    :cond_31
    :goto_31
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 382
    .restart local v2    # "element":Lorg/w3c/dom/Element;
    :cond_34
    invoke-direct {p0, v2}, Lezvcard/io/xml/XCardWriter;->childless(Lorg/w3c/dom/Element;)V

    goto :goto_31

    .line 388
    .end local v2    # "element":Lorg/w3c/dom/Element;
    :cond_38
    instance-of v5, v0, Lorg/w3c/dom/Text;

    if-eqz v5, :cond_31

    move-object v4, v0

    .line 389
    check-cast v4, Lorg/w3c/dom/Text;

    .line 390
    .local v4, "text":Lorg/w3c/dom/Text;
    invoke-interface {v4}, Lorg/w3c/dom/Text;->getTextContent()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lezvcard/io/xml/XCardWriter;->text(Ljava/lang/String;)V

    goto :goto_31

    .line 394
    .end local v0    # "child":Lorg/w3c/dom/Node;
    .end local v4    # "text":Lorg/w3c/dom/Text;
    :cond_47
    return-void
.end method


# virtual methods
.method protected _write(Lezvcard/VCard;Ljava/util/List;)V
    .registers 15
    .param p1, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCard;",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/VCardProperty;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    .local p2, "properties":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/VCardProperty;>;"
    :try_start_0
    iget-boolean v1, p0, Lezvcard/io/xml/XCardWriter;->started:Z

    if-nez v1, :cond_1b

    .line 233
    iget-object v1, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    invoke-interface {v1}, Ljavax/xml/transform/sax/TransformerHandler;->startDocument()V

    .line 235
    iget-boolean v1, p0, Lezvcard/io/xml/XCardWriter;->vcardsElementExists:Z

    if-nez v1, :cond_18

    .line 237
    sget-object v1, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->start(Ljavax/xml/namespace/QName;)V

    .line 238
    iget v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 241
    :cond_18
    const/4 v1, 0x1

    iput-boolean v1, p0, Lezvcard/io/xml/XCardWriter;->started:Z

    .line 244
    :cond_1b
    new-instance v10, Lezvcard/util/ListMultimap;

    invoke-direct {v10}, Lezvcard/util/ListMultimap;-><init>()V

    .line 245
    .local v10, "propertiesByGroup":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<Ljava/lang/String;Lezvcard/property/VCardProperty;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_24
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lezvcard/property/VCardProperty;

    .line 246
    .local v11, "property":Lezvcard/property/VCardProperty;
    invoke-virtual {v11}, Lezvcard/property/VCardProperty;->getGroup()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1, v11}, Lezvcard/util/ListMultimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_37
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_37} :catch_38

    goto :goto_24

    .line 274
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v10    # "propertiesByGroup":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<Ljava/lang/String;Lezvcard/property/VCardProperty;>;"
    .end local v11    # "property":Lezvcard/property/VCardProperty;
    :catch_38
    move-exception v6

    .line 275
    .local v6, "e":Lorg/xml/sax/SAXException;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v6}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 249
    .end local v6    # "e":Lorg/xml/sax/SAXException;
    .restart local v8    # "i$":Ljava/util/Iterator;
    .restart local v10    # "propertiesByGroup":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<Ljava/lang/String;Lezvcard/property/VCardProperty;>;"
    :cond_3f
    :try_start_3f
    sget-object v1, Lezvcard/io/xml/XCardQNames;->VCARD:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->start(Ljavax/xml/namespace/QName;)V

    .line 250
    iget v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 252
    invoke-virtual {v10}, Lezvcard/util/ListMultimap;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .end local v8    # "i$":Ljava/util/Iterator;
    :cond_4e
    :goto_4e
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 253
    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lezvcard/property/VCardProperty;>;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 254
    .local v5, "groupName":Ljava/lang/String;
    if-eqz v5, :cond_7d

    .line 255
    new-instance v0, Lorg/xml/sax/helpers/AttributesImpl;

    invoke-direct {v0}, Lorg/xml/sax/helpers/AttributesImpl;-><init>()V

    .line 256
    .local v0, "attr":Lorg/xml/sax/helpers/AttributesImpl;
    sget-object v1, Lezvcard/io/xml/XCardQNames;->NAMESPACE:Ljava/lang/String;

    const-string v2, ""

    const-string v3, "name"

    const-string v4, ""

    invoke-virtual/range {v0 .. v5}, Lorg/xml/sax/helpers/AttributesImpl;->addAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    sget-object v1, Lezvcard/io/xml/XCardQNames;->GROUP:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v1, v0}, Lezvcard/io/xml/XCardWriter;->start(Ljavax/xml/namespace/QName;Lorg/xml/sax/Attributes;)V

    .line 259
    iget v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 262
    .end local v0    # "attr":Lorg/xml/sax/helpers/AttributesImpl;
    :cond_7d
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_87
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_97

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lezvcard/property/VCardProperty;

    .line 263
    .restart local v11    # "property":Lezvcard/property/VCardProperty;
    invoke-direct {p0, v11, p1}, Lezvcard/io/xml/XCardWriter;->write(Lezvcard/property/VCardProperty;Lezvcard/VCard;)V

    goto :goto_87

    .line 266
    .end local v11    # "property":Lezvcard/property/VCardProperty;
    :cond_97
    if-eqz v5, :cond_4e

    .line 267
    iget v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 268
    sget-object v1, Lezvcard/io/xml/XCardQNames;->GROUP:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->end(Ljavax/xml/namespace/QName;)V

    goto :goto_4e

    .line 272
    .end local v5    # "groupName":Ljava/lang/String;
    .end local v7    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lezvcard/property/VCardProperty;>;>;"
    .end local v9    # "i$":Ljava/util/Iterator;
    :cond_a5
    iget v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 273
    sget-object v1, Lezvcard/io/xml/XCardQNames;->VCARD:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->end(Ljavax/xml/namespace/QName;)V
    :try_end_b0
    .catch Lorg/xml/sax/SAXException; {:try_start_3f .. :try_end_b0} :catch_38

    .line 277
    return-void
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 304
    :try_start_0
    iget-boolean v1, p0, Lezvcard/io/xml/XCardWriter;->started:Z

    if-nez v1, :cond_18

    .line 305
    iget-object v1, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    invoke-interface {v1}, Ljavax/xml/transform/sax/TransformerHandler;->startDocument()V

    .line 307
    iget-boolean v1, p0, Lezvcard/io/xml/XCardWriter;->vcardsElementExists:Z

    if-nez v1, :cond_18

    .line 309
    sget-object v1, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->start(Ljavax/xml/namespace/QName;)V

    .line 310
    iget v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 314
    :cond_18
    iget-boolean v1, p0, Lezvcard/io/xml/XCardWriter;->vcardsElementExists:Z

    if-nez v1, :cond_27

    .line 315
    iget v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lezvcard/io/xml/XCardWriter;->level:I

    .line 316
    sget-object v1, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v1}, Lezvcard/io/xml/XCardWriter;->end(Ljavax/xml/namespace/QName;)V

    .line 318
    :cond_27
    iget-object v1, p0, Lezvcard/io/xml/XCardWriter;->handler:Ljavax/xml/transform/sax/TransformerHandler;

    invoke-interface {v1}, Ljavax/xml/transform/sax/TransformerHandler;->endDocument()V
    :try_end_2c
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_2c} :catch_36

    .line 323
    iget-object v1, p0, Lezvcard/io/xml/XCardWriter;->writer:Ljava/io/Writer;

    if-eqz v1, :cond_35

    .line 324
    iget-object v1, p0, Lezvcard/io/xml/XCardWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->close()V

    .line 326
    :cond_35
    return-void

    .line 319
    :catch_36
    move-exception v0

    .line 320
    .local v0, "e":Lorg/xml/sax/SAXException;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected getTargetVersion()Lezvcard/VCardVersion;
    .registers 2

    .prologue
    .line 281
    iget-object v0, p0, Lezvcard/io/xml/XCardWriter;->targetVersion:Lezvcard/VCardVersion;

    return-object v0
.end method

.method public registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V
    .registers 4
    .param p1, "parameterName"    # Ljava/lang/String;
    .param p2, "dataType"    # Lezvcard/VCardDataType;

    .prologue
    .line 291
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 292
    if-nez p2, :cond_c

    .line 293
    iget-object v0, p0, Lezvcard/io/xml/XCardWriter;->parameterDataTypes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    :goto_b
    return-void

    .line 295
    :cond_c
    iget-object v0, p0, Lezvcard/io/xml/XCardWriter;->parameterDataTypes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b
.end method
