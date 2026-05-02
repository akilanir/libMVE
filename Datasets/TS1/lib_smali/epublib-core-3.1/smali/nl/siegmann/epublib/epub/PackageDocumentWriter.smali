.class public Lnl/siegmann/epublib/epub/PackageDocumentWriter;
.super Lnl/siegmann/epublib/epub/PackageDocumentBase;
.source "PackageDocumentWriter.java"


# static fields
.field private static final log:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 34
    const-class v0, Lnl/siegmann/epublib/epub/PackageDocumentWriter;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->log:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Lnl/siegmann/epublib/epub/PackageDocumentBase;-><init>()V

    return-void
.end method

.method private static ensureCoverPageGuideReferenceWritten(Lnl/siegmann/epublib/domain/Guide;Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 8
    .param p0, "guide"    # Lnl/siegmann/epublib/domain/Guide;
    .param p1, "epubWriter"    # Lnl/siegmann/epublib/epub/EpubWriter;
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    sget-object v1, Lnl/siegmann/epublib/domain/GuideReference;->COVER:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lnl/siegmann/epublib/domain/Guide;->getGuideReferencesByType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_d

    .line 188
    :cond_c
    :goto_c
    return-void

    .line 184
    :cond_d
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Guide;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 185
    .local v0, "coverPage":Lnl/siegmann/epublib/domain/Resource;
    if-eqz v0, :cond_c

    .line 186
    new-instance v1, Lnl/siegmann/epublib/domain/GuideReference;

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Guide;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v2

    sget-object v3, Lnl/siegmann/epublib/domain/GuideReference;->COVER:Ljava/lang/String;

    sget-object v4, Lnl/siegmann/epublib/domain/GuideReference;->COVER:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lnl/siegmann/epublib/domain/GuideReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1, p2}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->writeGuideReference(Lnl/siegmann/epublib/domain/GuideReference;Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_c
.end method

.method private static getAllResourcesSortById(Lnl/siegmann/epublib/domain/Book;)Ljava/util/List;
    .registers 3
    .param p0, "book"    # Lnl/siegmann/epublib/domain/Book;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/siegmann/epublib/domain/Book;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Resource;",
            ">;"
        }
    .end annotation

    .prologue
    .line 108
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v1

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resources;->getAll()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 109
    .local v0, "allResources":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Resource;>;"
    new-instance v1, Lnl/siegmann/epublib/epub/PackageDocumentWriter$1;

    invoke-direct {v1}, Lnl/siegmann/epublib/epub/PackageDocumentWriter$1;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 116
    return-object v0
.end method

.method public static write(Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;Lnl/siegmann/epublib/domain/Book;)V
    .registers 7
    .param p0, "epubWriter"    # Lnl/siegmann/epublib/epub/EpubWriter;
    .param p1, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .param p2, "book"    # Lnl/siegmann/epublib/domain/Book;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    :try_start_0
    const-string v1, "UTF-8"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 39
    const-string v1, "opf"

    const-string v2, "http://www.idpf.org/2007/opf"

    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    const-string v1, "dc"

    const-string v2, "http://purl.org/dc/elements/1.1/"

    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    const-string v1, "http://www.idpf.org/2007/opf"

    const-string v2, "package"

    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 42
    const-string v1, ""

    const-string v2, "version"

    const-string v3, "2.0"

    invoke-interface {p1, v1, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 43
    const-string v1, ""

    const-string v2, "unique-identifier"

    const-string v3, "BookId"

    invoke-interface {p1, v1, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 45
    invoke-static {p2, p1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;->writeMetaData(Lnl/siegmann/epublib/domain/Book;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 47
    invoke-static {p2, p0, p1}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->writeManifest(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 48
    invoke-static {p2, p0, p1}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->writeSpine(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 49
    invoke-static {p2, p0, p1}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->writeGuide(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 51
    const-string v1, "http://www.idpf.org/2007/opf"

    const-string v2, "package"

    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 52
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 53
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlSerializer;->flush()V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_4a} :catch_4b

    .line 58
    :goto_4a
    return-void

    .line 54
    :catch_4b
    move-exception v0

    .line 56
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4a
.end method

.method private static writeGuide(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 7
    .param p0, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p1, "epubWriter"    # Lnl/siegmann/epublib/epub/EpubWriter;
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "guide"

    invoke-interface {p2, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 172
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getGuide()Lnl/siegmann/epublib/domain/Guide;

    move-result-object v2

    invoke-static {v2, p1, p2}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->ensureCoverPageGuideReferenceWritten(Lnl/siegmann/epublib/domain/Guide;Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 173
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getGuide()Lnl/siegmann/epublib/domain/Guide;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Guide;->getReferences()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/GuideReference;

    .line 174
    .local v1, "reference":Lnl/siegmann/epublib/domain/GuideReference;
    invoke-static {v1, p2}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->writeGuideReference(Lnl/siegmann/epublib/domain/GuideReference;Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_1a

    .line 176
    .end local v1    # "reference":Lnl/siegmann/epublib/domain/GuideReference;
    :cond_2a
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "guide"

    invoke-interface {p2, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 177
    return-void
.end method

.method private static writeGuideReference(Lnl/siegmann/epublib/domain/GuideReference;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 5
    .param p0, "reference"    # Lnl/siegmann/epublib/domain/GuideReference;
    .param p1, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    if-nez p0, :cond_3

    .line 202
    :goto_2
    return-void

    .line 195
    :cond_3
    const-string v0, "http://www.idpf.org/2007/opf"

    const-string v1, "reference"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 196
    const-string v0, ""

    const-string v1, "type"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/GuideReference;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 197
    const-string v0, ""

    const-string v1, "href"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/GuideReference;->getCompleteHref()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 198
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/GuideReference;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 199
    const-string v0, ""

    const-string v1, "title"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/GuideReference;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 201
    :cond_35
    const-string v0, "http://www.idpf.org/2007/opf"

    const-string v1, "reference"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_2
.end method

.method private static writeItem(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resource;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 6
    .param p0, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    if-eqz p1, :cond_14

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v0

    sget-object v1, Lnl/siegmann/epublib/service/MediatypeService;->NCX:Lnl/siegmann/epublib/domain/MediaType;

    if-ne v0, v1, :cond_15

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v0

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Spine;->getTocResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 151
    :cond_14
    :goto_14
    return-void

    .line 134
    :cond_15
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_50

    .line 135
    sget-object v0, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->log:Lorg/slf4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resource id must not be empty (href: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mediatype:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_14

    .line 138
    :cond_50
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8b

    .line 139
    sget-object v0, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->log:Lorg/slf4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resource href must not be empty (id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mediatype:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_14

    .line 142
    :cond_8b
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v0

    if-nez v0, :cond_c3

    .line 143
    sget-object v0, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->log:Lorg/slf4j/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resource mediatype must not be empty (id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", href:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto/16 :goto_14

    .line 146
    :cond_c3
    const-string v0, "http://www.idpf.org/2007/opf"

    const-string v1, "item"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 147
    const-string v0, ""

    const-string v1, "id"

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 148
    const-string v0, ""

    const-string v1, "href"

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 149
    const-string v0, ""

    const-string v1, "media-type"

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/MediaType;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 150
    const-string v0, "http://www.idpf.org/2007/opf"

    const-string v1, "item"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto/16 :goto_14
.end method

.method private static writeManifest(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 8
    .param p0, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p1, "epubWriter"    # Lnl/siegmann/epublib/epub/EpubWriter;
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "manifest"

    invoke-interface {p2, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 92
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "item"

    invoke-interface {p2, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 93
    const-string v2, ""

    const-string v3, "id"

    invoke-virtual {p1}, Lnl/siegmann/epublib/epub/EpubWriter;->getNcxId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v2, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 94
    const-string v2, ""

    const-string v3, "href"

    invoke-virtual {p1}, Lnl/siegmann/epublib/epub/EpubWriter;->getNcxHref()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v2, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 95
    const-string v2, ""

    const-string v3, "media-type"

    invoke-virtual {p1}, Lnl/siegmann/epublib/epub/EpubWriter;->getNcxMediaType()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v2, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 96
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "item"

    invoke-interface {p2, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 100
    invoke-static {p0}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->getAllResourcesSortById(Lnl/siegmann/epublib/domain/Book;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_3e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Resource;

    .line 101
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-static {p0, v1, p2}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->writeItem(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resource;Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_3e

    .line 104
    .end local v1    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_4e
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "manifest"

    invoke-interface {p2, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 105
    return-void
.end method

.method private static writeSpine(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 6
    .param p0, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p1, "epubWriter"    # Lnl/siegmann/epublib/epub/EpubWriter;
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    const-string v0, "http://www.idpf.org/2007/opf"

    const-string v1, "spine"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 74
    const-string v0, ""

    const-string v1, "toc"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Spine;->getTocResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 76
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    if-eqz v0, :cond_58

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v0

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnl/siegmann/epublib/domain/Spine;->findFirstResourceById(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_58

    .line 79
    const-string v0, "http://www.idpf.org/2007/opf"

    const-string v1, "itemref"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 80
    const-string v0, ""

    const-string v1, "idref"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 81
    const-string v0, ""

    const-string v1, "linear"

    const-string v2, "no"

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 82
    const-string v0, "http://www.idpf.org/2007/opf"

    const-string v1, "itemref"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 84
    :cond_58
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v0

    invoke-static {v0, p2}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->writeSpineItems(Lnl/siegmann/epublib/domain/Spine;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 85
    const-string v0, "http://www.idpf.org/2007/opf"

    const-string v1, "spine"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 86
    return-void
.end method

.method private static writeSpineItems(Lnl/siegmann/epublib/domain/Spine;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 7
    .param p0, "spine"    # Lnl/siegmann/epublib/domain/Spine;
    .param p1, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Spine;->getSpineReferences()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/SpineReference;

    .line 161
    .local v1, "spineReference":Lnl/siegmann/epublib/domain/SpineReference;
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "itemref"

    invoke-interface {p1, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 162
    const-string v2, ""

    const-string v3, "idref"

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/SpineReference;->getResourceId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v2, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 163
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/SpineReference;->isLinear()Z

    move-result v2

    if-nez v2, :cond_35

    .line 164
    const-string v2, ""

    const-string v3, "linear"

    const-string v4, "no"

    invoke-interface {p1, v2, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 166
    :cond_35
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "itemref"

    invoke-interface {p1, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_8

    .line 168
    .end local v1    # "spineReference":Lnl/siegmann/epublib/domain/SpineReference;
    :cond_3d
    return-void
.end method
