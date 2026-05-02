.class public Lezvcard/io/xml/XCardDocument;
.super Ljava/lang/Object;
.source "XCardDocument.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/io/xml/XCardDocument$1;,
        Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;,
        Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;
    }
.end annotation


# instance fields
.field private final document:Lorg/w3c/dom/Document;

.field private root:Lorg/w3c/dom/Element;

.field private final version4:Lezvcard/VCardVersion;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 143
    invoke-static {}, Lezvcard/io/xml/XCardDocument;->createXCardsRoot()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardDocument;-><init>(Lorg/w3c/dom/Document;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    invoke-static {p1}, Lezvcard/io/xml/XCardDocument;->readFile(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardDocument;-><init>(Lorg/w3c/dom/Document;)V

    .line 180
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    invoke-static {p1}, Lezvcard/util/XmlUtils;->toDocument(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardDocument;-><init>(Lorg/w3c/dom/Document;)V

    .line 170
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    invoke-static {p1}, Lezvcard/util/XmlUtils;->toDocument(Ljava/io/Reader;)Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardDocument;-><init>(Lorg/w3c/dom/Document;)V

    .line 210
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "xml"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 159
    invoke-static {p1}, Lezvcard/util/XmlUtils;->toDocument(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardDocument;-><init>(Lorg/w3c/dom/Document;)V

    .line 160
    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Document;)V
    .registers 7
    .param p1, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    sget-object v3, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    iput-object v3, p0, Lezvcard/io/xml/XCardDocument;->version4:Lezvcard/VCardVersion;

    .line 217
    iput-object p1, p0, Lezvcard/io/xml/XCardDocument;->document:Lorg/w3c/dom/Document;

    .line 219
    new-instance v1, Lezvcard/io/xml/XCardNamespaceContext;

    iget-object v3, p0, Lezvcard/io/xml/XCardDocument;->version4:Lezvcard/VCardVersion;

    const-string v4, "v"

    invoke-direct {v1, v3, v4}, Lezvcard/io/xml/XCardNamespaceContext;-><init>(Lezvcard/VCardVersion;Ljava/lang/String;)V

    .line 220
    .local v1, "nsContext":Lezvcard/io/xml/XCardNamespaceContext;
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v2

    .line 221
    .local v2, "xpath":Ljavax/xml/xpath/XPath;
    invoke-interface {v2, v1}, Ljavax/xml/xpath/XPath;->setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V

    .line 225
    :try_start_1d
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "//"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lezvcard/io/xml/XCardNamespaceContext;->getPrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    invoke-virtual {v4}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljavax/xml/xpath/XPathConstants;->NODE:Ljavax/xml/namespace/QName;

    invoke-interface {v2, v3, p1, v4}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    iput-object v3, p0, Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;
    :try_end_4e
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_1d .. :try_end_4e} :catch_4f

    .line 230
    return-void

    .line 226
    :catch_4f
    move-exception v0

    .line 228
    .local v0, "e":Ljavax/xml/xpath/XPathExpressionException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method static synthetic access$100(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Element;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardDocument;

    .prologue
    .line 133
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;

    return-object v0
.end method

.method static synthetic access$102(Lezvcard/io/xml/XCardDocument;Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardDocument;
    .param p1, "x1"    # Lorg/w3c/dom/Element;

    .prologue
    .line 133
    iput-object p1, p0, Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;

    return-object p1
.end method

.method static synthetic access$200(Lezvcard/io/xml/XCardDocument;)Lezvcard/VCardVersion;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardDocument;

    .prologue
    .line 133
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument;->version4:Lezvcard/VCardVersion;

    return-object v0
.end method

.method static synthetic access$300(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Document;
    .registers 2
    .param p0, "x0"    # Lezvcard/io/xml/XCardDocument;

    .prologue
    .line 133
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument;->document:Lorg/w3c/dom/Document;

    return-object v0
.end method

.method private static createXCardsRoot()Lorg/w3c/dom/Document;
    .registers 4

    .prologue
    .line 147
    invoke-static {}, Lezvcard/util/XmlUtils;->createDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 148
    .local v0, "document":Lorg/w3c/dom/Document;
    sget-object v2, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    invoke-virtual {v3}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 149
    .local v1, "root":Lorg/w3c/dom/Element;
    invoke-interface {v0, v1}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 150
    return-object v0
.end method

.method private static readFile(Ljava/io/File;)Lorg/w3c/dom/Document;
    .registers 3
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 185
    .local v0, "in":Ljava/io/InputStream;
    :try_start_5
    invoke-static {v0}, Lezvcard/util/XmlUtils;->toDocument(Ljava/io/InputStream;)Lorg/w3c/dom/Document;
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_d

    move-result-object v1

    .line 187
    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-object v1

    :catchall_d
    move-exception v1

    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v1
.end method


# virtual methods
.method public add(Lezvcard/VCard;)V
    .registers 3
    .param p1, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 279
    invoke-virtual {p0}, Lezvcard/io/xml/XCardDocument;->writer()Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->write(Lezvcard/VCard;)V

    .line 280
    return-void
.end method

.method public getDocument()Lorg/w3c/dom/Document;
    .registers 2

    .prologue
    .line 255
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument;->document:Lorg/w3c/dom/Document;

    return-object v0
.end method

.method public getVCards()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/VCard;",
            ">;"
        }
    .end annotation

    .prologue
    .line 265
    :try_start_0
    invoke-virtual {p0}, Lezvcard/io/xml/XCardDocument;->reader()Lezvcard/io/StreamReader;

    move-result-object v1

    invoke-virtual {v1}, Lezvcard/io/StreamReader;->readAll()Ljava/util/List;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 266
    :catch_9
    move-exception v0

    .line 268
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public reader()Lezvcard/io/StreamReader;
    .registers 3

    .prologue
    .line 238
    new-instance v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;-><init>(Lezvcard/io/xml/XCardDocument;Lezvcard/io/xml/XCardDocument$1;)V

    return-object v0
.end method

.method public write()Ljava/lang/String;
    .registers 2

    .prologue
    .line 287
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lezvcard/io/xml/XCardDocument;->write(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(I)Ljava/lang/String;
    .registers 4
    .param p1, "indent"    # I

    .prologue
    .line 296
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 298
    .local v0, "sw":Ljava/io/StringWriter;
    :try_start_5
    invoke-virtual {p0, v0, p1}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/Writer;I)V
    :try_end_8
    .catch Ljavax/xml/transform/TransformerException; {:try_start_5 .. :try_end_8} :catch_d

    .line 302
    :goto_8
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 299
    :catch_d
    move-exception v1

    goto :goto_8
.end method

.method public write(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 333
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/File;I)V

    .line 334
    return-void
.end method

.method public write(Ljava/io/File;I)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 344
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/File;)Ljava/io/Writer;

    move-result-object v0

    .line 346
    .local v0, "writer":Ljava/io/Writer;
    :try_start_4
    invoke-virtual {p0, v0, p2}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/Writer;I)V
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_b

    .line 348
    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 350
    return-void

    .line 348
    :catchall_b
    move-exception v1

    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v1
.end method

.method public write(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 312
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/OutputStream;I)V

    .line 313
    return-void
.end method

.method public write(Ljava/io/OutputStream;I)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 323
    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/Writer;I)V

    .line 324
    return-void
.end method

.method public write(Ljava/io/Writer;)V
    .registers 3
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 358
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/Writer;I)V

    .line 359
    return-void
.end method

.method public write(Ljava/io/Writer;I)V
    .registers 7
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 368
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 369
    .local v0, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-ltz p2, :cond_26

    .line 370
    const-string v1, "indent"

    const-string v2, "yes"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    const-string v1, "{http://xml.apache.org/xslt}indent-amount"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    :cond_26
    iget-object v1, p0, Lezvcard/io/xml/XCardDocument;->document:Lorg/w3c/dom/Document;

    invoke-static {v1, p1, v0}, Lezvcard/util/XmlUtils;->toWriter(Lorg/w3c/dom/Node;Ljava/io/Writer;Ljava/util/Map;)V

    .line 374
    return-void
.end method

.method public writer()Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;
    .registers 2

    .prologue
    .line 247
    new-instance v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;

    invoke-direct {v0, p0}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;-><init>(Lezvcard/io/xml/XCardDocument;)V

    return-object v0
.end method
