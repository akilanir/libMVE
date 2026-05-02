.class public Lnl/siegmann/epublib/epub/EpubWriter;
.super Ljava/lang/Object;
.source "EpubWriter.java"


# static fields
.field static final EMPTY_NAMESPACE_PREFIX:Ljava/lang/String; = ""

.field private static final log:Lorg/slf4j/Logger;


# instance fields
.field private bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const-class v0, Lnl/siegmann/epublib/epub/EpubWriter;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/epub/EpubWriter;->log:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 37
    sget-object v0, Lnl/siegmann/epublib/epub/BookProcessor;->IDENTITY_BOOKPROCESSOR:Lnl/siegmann/epublib/epub/BookProcessor;

    invoke-direct {p0, v0}, Lnl/siegmann/epublib/epub/EpubWriter;-><init>(Lnl/siegmann/epublib/epub/BookProcessor;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/epub/BookProcessor;)V
    .registers 3
    .param p1, "bookProcessor"    # Lnl/siegmann/epublib/epub/BookProcessor;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    sget-object v0, Lnl/siegmann/epublib/epub/BookProcessor;->IDENTITY_BOOKPROCESSOR:Lnl/siegmann/epublib/epub/BookProcessor;

    iput-object v0, p0, Lnl/siegmann/epublib/epub/EpubWriter;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    .line 42
    iput-object p1, p0, Lnl/siegmann/epublib/epub/EpubWriter;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    .line 43
    return-void
.end method

.method private calculateCrc([B)J
    .registers 5
    .param p1, "data"    # [B

    .prologue
    .line 153
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 154
    .local v0, "crc":Ljava/util/zip/CRC32;
    invoke-virtual {v0, p1}, Ljava/util/zip/CRC32;->update([B)V

    .line 155
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    return-wide v1
.end method

.method private initTOCResource(Lnl/siegmann/epublib/domain/Book;)V
    .registers 8
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 67
    :try_start_0
    invoke-static {p1}, Lnl/siegmann/epublib/epub/NCXDocument;->createNCXResource(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v2

    .line 68
    .local v2, "tocResource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v3

    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/Spine;->getTocResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 69
    .local v0, "currentTocResource":Lnl/siegmann/epublib/domain/Resource;
    if-eqz v0, :cond_19

    .line 70
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v3

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnl/siegmann/epublib/domain/Resources;->remove(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    .line 72
    :cond_19
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v3

    invoke-virtual {v3, v2}, Lnl/siegmann/epublib/domain/Spine;->setTocResource(Lnl/siegmann/epublib/domain/Resource;)V

    .line 73
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_27} :catch_28

    .line 77
    .end local v0    # "currentTocResource":Lnl/siegmann/epublib/domain/Resource;
    .end local v2    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    :goto_27
    return-void

    .line 74
    :catch_28
    move-exception v1

    .line 75
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lnl/siegmann/epublib/epub/EpubWriter;->log:Lorg/slf4j/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error writing table of contents: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_27
.end method

.method private processBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;
    .registers 3
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 58
    iget-object v0, p0, Lnl/siegmann/epublib/epub/EpubWriter;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    if-eqz v0, :cond_a

    .line 59
    iget-object v0, p0, Lnl/siegmann/epublib/epub/EpubWriter;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    invoke-interface {v0, p1}, Lnl/siegmann/epublib/epub/BookProcessor;->processBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;

    move-result-object p1

    .line 61
    :cond_a
    return-object p1
.end method

.method private writeContainer(Ljava/util/zip/ZipOutputStream;)V
    .registers 5
    .param p1, "resultStream"    # Ljava/util/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    new-instance v1, Ljava/util/zip/ZipEntry;

    const-string v2, "META-INF/container.xml"

    invoke-direct {v1, v2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 126
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-direct {v0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 127
    .local v0, "out":Ljava/io/Writer;
    const-string v1, "<?xml version=\"1.0\"?>\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 128
    const-string v1, "<container version=\"1.0\" xmlns=\"urn:oasis:names:tc:opendocument:xmlns:container\">\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 129
    const-string v1, "\t<rootfiles>\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 130
    const-string v1, "\t\t<rootfile full-path=\"OEBPS/content.opf\" media-type=\"application/oebps-package+xml\"/>\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 131
    const-string v1, "\t</rootfiles>\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 132
    const-string v1, "</container>"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 133
    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 134
    return-void
.end method

.method private writeMimeType(Ljava/util/zip/ZipOutputStream;)V
    .registers 6
    .param p1, "resultStream"    # Ljava/util/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v1, Ljava/util/zip/ZipEntry;

    const-string v2, "mimetype"

    invoke-direct {v1, v2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 144
    .local v1, "mimetypeZipEntry":Ljava/util/zip/ZipEntry;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/zip/ZipEntry;->setMethod(I)V

    .line 145
    sget-object v2, Lnl/siegmann/epublib/service/MediatypeService;->EPUB:Lnl/siegmann/epublib/domain/MediaType;

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/MediaType;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 146
    .local v0, "mimetypeBytes":[B
    array-length v2, v0

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/util/zip/ZipEntry;->setSize(J)V

    .line 147
    invoke-direct {p0, v0}, Lnl/siegmann/epublib/epub/EpubWriter;->calculateCrc([B)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 148
    invoke-virtual {p1, v1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 149
    invoke-virtual {p1, v0}, Ljava/util/zip/ZipOutputStream;->write([B)V

    .line 150
    return-void
.end method

.method private writePackageDocument(Lnl/siegmann/epublib/domain/Book;Ljava/util/zip/ZipOutputStream;)V
    .registers 6
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p2, "resultStream"    # Ljava/util/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    new-instance v1, Ljava/util/zip/ZipEntry;

    const-string v2, "OEBPS/content.opf"

    invoke-direct {v1, v2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 111
    invoke-static {p2}, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->createXmlSerializer(Ljava/io/OutputStream;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    .line 112
    .local v0, "xmlSerializer":Lorg/xmlpull/v1/XmlSerializer;
    invoke-static {p0, v0, p1}, Lnl/siegmann/epublib/epub/PackageDocumentWriter;->write(Lnl/siegmann/epublib/epub/EpubWriter;Lorg/xmlpull/v1/XmlSerializer;Lnl/siegmann/epublib/domain/Book;)V

    .line 113
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 116
    return-void
.end method

.method private writeResource(Lnl/siegmann/epublib/domain/Resource;Ljava/util/zip/ZipOutputStream;)V
    .registers 8
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "resultStream"    # Ljava/util/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    if-nez p1, :cond_3

    .line 106
    :goto_2
    return-void

    .line 99
    :cond_3
    :try_start_3
    new-instance v2, Ljava/util/zip/ZipEntry;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OEBPS/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v2}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 100
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 101
    .local v1, "inputStream":Ljava/io/InputStream;
    invoke-static {v1, p2}, Lnl/siegmann/epublib/util/IOUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 102
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_2c} :catch_2d

    goto :goto_2

    .line 103
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :catch_2d
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lnl/siegmann/epublib/epub/EpubWriter;->log:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method private writeResources(Lnl/siegmann/epublib/domain/Book;Ljava/util/zip/ZipOutputStream;)V
    .registers 6
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p2, "resultStream"    # Ljava/util/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Resources;->getAll()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Resource;

    .line 82
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-direct {p0, v1, p2}, Lnl/siegmann/epublib/epub/EpubWriter;->writeResource(Lnl/siegmann/epublib/domain/Resource;Ljava/util/zip/ZipOutputStream;)V

    goto :goto_c

    .line 84
    .end local v1    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_1c
    return-void
.end method


# virtual methods
.method public getBookProcessor()Lnl/siegmann/epublib/epub/BookProcessor;
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lnl/siegmann/epublib/epub/EpubWriter;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    return-object v0
.end method

.method getNcxHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 163
    const-string v0, "toc.ncx"

    return-object v0
.end method

.method getNcxId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 159
    const-string v0, "ncx"

    return-object v0
.end method

.method getNcxMediaType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 167
    const-string v0, "application/x-dtbncx+xml"

    return-object v0
.end method

.method public setBookProcessor(Lnl/siegmann/epublib/epub/BookProcessor;)V
    .registers 2
    .param p1, "bookProcessor"    # Lnl/siegmann/epublib/epub/BookProcessor;

    .prologue
    .line 176
    iput-object p1, p0, Lnl/siegmann/epublib/epub/EpubWriter;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    .line 177
    return-void
.end method

.method public write(Lnl/siegmann/epublib/domain/Book;Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lnl/siegmann/epublib/epub/EpubWriter;->processBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;

    move-result-object p1

    .line 48
    new-instance v0, Ljava/util/zip/ZipOutputStream;

    invoke-direct {v0, p2}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 49
    .local v0, "resultStream":Ljava/util/zip/ZipOutputStream;
    invoke-direct {p0, v0}, Lnl/siegmann/epublib/epub/EpubWriter;->writeMimeType(Ljava/util/zip/ZipOutputStream;)V

    .line 50
    invoke-direct {p0, v0}, Lnl/siegmann/epublib/epub/EpubWriter;->writeContainer(Ljava/util/zip/ZipOutputStream;)V

    .line 51
    invoke-direct {p0, p1}, Lnl/siegmann/epublib/epub/EpubWriter;->initTOCResource(Lnl/siegmann/epublib/domain/Book;)V

    .line 52
    invoke-direct {p0, p1, v0}, Lnl/siegmann/epublib/epub/EpubWriter;->writeResources(Lnl/siegmann/epublib/domain/Book;Ljava/util/zip/ZipOutputStream;)V

    .line 53
    invoke-direct {p0, p1, v0}, Lnl/siegmann/epublib/epub/EpubWriter;->writePackageDocument(Lnl/siegmann/epublib/domain/Book;Ljava/util/zip/ZipOutputStream;)V

    .line 54
    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 55
    return-void
.end method
