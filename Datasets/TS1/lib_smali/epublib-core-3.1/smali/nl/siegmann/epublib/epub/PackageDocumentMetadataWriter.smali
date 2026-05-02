.class public Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;
.super Lnl/siegmann/epublib/epub/PackageDocumentBase;
.source "PackageDocumentMetadataWriter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Lnl/siegmann/epublib/epub/PackageDocumentBase;-><init>()V

    return-void
.end method

.method private static writeIdentifiers(Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 8
    .param p1, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Identifier;",
            ">;",
            "Lorg/xmlpull/v1/XmlSerializer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "identifiers":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Identifier;>;"
    invoke-static {p0}, Lnl/siegmann/epublib/domain/Identifier;->getBookIdIdentifier(Ljava/util/List;)Lnl/siegmann/epublib/domain/Identifier;

    move-result-object v0

    .line 132
    .local v0, "bookIdIdentifier":Lnl/siegmann/epublib/domain/Identifier;
    if-nez v0, :cond_7

    .line 151
    :cond_6
    return-void

    .line 136
    :cond_7
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "identifier"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 137
    const-string v3, ""

    const-string v4, "id"

    const-string v5, "BookId"

    invoke-interface {p1, v3, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 138
    const-string v3, "http://www.idpf.org/2007/opf"

    const-string v4, "scheme"

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Identifier;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v3, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 139
    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Identifier;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 140
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "identifier"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 142
    const/4 v3, 0x1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {p0, v3, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_3d
    :goto_3d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/siegmann/epublib/domain/Identifier;

    .line 143
    .local v2, "identifier":Lnl/siegmann/epublib/domain/Identifier;
    if-eq v2, v0, :cond_3d

    .line 146
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "identifier"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 147
    const-string v3, "http://www.idpf.org/2007/opf"

    const-string v4, "scheme"

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Identifier;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v3, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 148
    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Identifier;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 149
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "identifier"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_3d
.end method

.method public static writeMetaData(Lnl/siegmann/epublib/domain/Book;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 10
    .param p0, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p1, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "metadata"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 33
    const-string v4, "dc"

    const-string v5, "http://purl.org/dc/elements/1.1/"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    const-string v4, "opf"

    const-string v5, "http://www.idpf.org/2007/opf"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v4

    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/Metadata;->getIdentifiers()Ljava/util/List;

    move-result-object v4

    invoke-static {v4, p1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;->writeIdentifiers(Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 37
    const-string v4, "title"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/Metadata;->getTitles()Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, p1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;->writeSimpleMetdataElements(Ljava/lang/String;Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 38
    const-string v4, "subject"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/Metadata;->getSubjects()Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, p1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;->writeSimpleMetdataElements(Ljava/lang/String;Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 39
    const-string v4, "description"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/Metadata;->getDescriptions()Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, p1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;->writeSimpleMetdataElements(Ljava/lang/String;Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 40
    const-string v4, "publisher"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/Metadata;->getPublishers()Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, p1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;->writeSimpleMetdataElements(Ljava/lang/String;Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 41
    const-string v4, "type"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/Metadata;->getTypes()Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, p1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;->writeSimpleMetdataElements(Ljava/lang/String;Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 42
    const-string v4, "rights"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v5

    invoke-virtual {v5}, Lnl/siegmann/epublib/domain/Metadata;->getRights()Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, p1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataWriter;->writeSimpleMetdataElements(Ljava/lang/String;Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 45
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v4

    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/Metadata;->getAuthors()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_7a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_ec

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/Author;

    .line 46
    .local v0, "author":Lnl/siegmann/epublib/domain/Author;
    const-string v4, "http://purl.org/dc/elements/1.1/"

    const-string v5, "creator"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 47
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "role"

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getRelator()Lnl/siegmann/epublib/domain/Relator;

    move-result-object v6

    invoke-virtual {v6}, Lnl/siegmann/epublib/domain/Relator;->getCode()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 48
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "file-as"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getLastname()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getFirstname()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 49
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getFirstname()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getLastname()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 50
    const-string v4, "http://purl.org/dc/elements/1.1/"

    const-string v5, "creator"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_7a

    .line 54
    .end local v0    # "author":Lnl/siegmann/epublib/domain/Author;
    :cond_ec
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v4

    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/Metadata;->getContributors()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_f8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_16a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/Author;

    .line 55
    .restart local v0    # "author":Lnl/siegmann/epublib/domain/Author;
    const-string v4, "http://purl.org/dc/elements/1.1/"

    const-string v5, "contributor"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 56
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "role"

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getRelator()Lnl/siegmann/epublib/domain/Relator;

    move-result-object v6

    invoke-virtual {v6}, Lnl/siegmann/epublib/domain/Relator;->getCode()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 57
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "file-as"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getLastname()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getFirstname()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 58
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getFirstname()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getLastname()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 59
    const-string v4, "http://purl.org/dc/elements/1.1/"

    const-string v5, "contributor"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_f8

    .line 63
    .end local v0    # "author":Lnl/siegmann/epublib/domain/Author;
    :cond_16a
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v4

    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/Metadata;->getDates()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_176
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1ad

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/Date;

    .line 64
    .local v1, "date":Lnl/siegmann/epublib/domain/Date;
    const-string v4, "http://purl.org/dc/elements/1.1/"

    const-string v5, "date"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 65
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Date;->getEvent()Lnl/siegmann/epublib/domain/Date$Event;

    move-result-object v4

    if-eqz v4, :cond_19e

    .line 66
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "event"

    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Date;->getEvent()Lnl/siegmann/epublib/domain/Date$Event;

    move-result-object v6

    invoke-virtual {v6}, Lnl/siegmann/epublib/domain/Date$Event;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 68
    :cond_19e
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Date;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 69
    const-string v4, "http://purl.org/dc/elements/1.1/"

    const-string v5, "date"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_176

    .line 73
    .end local v1    # "date":Lnl/siegmann/epublib/domain/Date;
    :cond_1ad
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v4

    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/Metadata;->getLanguage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1d4

    .line 74
    const-string v4, "http://purl.org/dc/elements/1.1/"

    const-string v5, "language"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 75
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v4

    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/Metadata;->getLanguage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 76
    const-string v4, "http://purl.org/dc/elements/1.1/"

    const-string v5, "language"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 80
    :cond_1d4
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v4

    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/Metadata;->getOtherProperties()Ljava/util/Map;

    move-result-object v4

    if-eqz v4, :cond_232

    .line 81
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v4

    invoke-virtual {v4}, Lnl/siegmann/epublib/domain/Metadata;->getOtherProperties()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1ee
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_232

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 82
    .local v3, "mapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/xml/namespace/QName;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavax/xml/namespace/QName;

    invoke-virtual {v4}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavax/xml/namespace/QName;

    invoke-virtual {v4}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v5, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 83
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 84
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavax/xml/namespace/QName;

    invoke-virtual {v4}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavax/xml/namespace/QName;

    invoke-virtual {v4}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v5, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_1ee

    .line 90
    .end local v3    # "mapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/xml/namespace/QName;Ljava/lang/String;>;"
    :cond_232
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getCoverImage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v4

    if-eqz v4, :cond_25e

    .line 91
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "meta"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 92
    const-string v4, ""

    const-string v5, "name"

    const-string v6, "cover"

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 93
    const-string v4, ""

    const-string v5, "content"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getCoverImage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v6

    invoke-virtual {v6}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 94
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "meta"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 98
    :cond_25e
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "meta"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 99
    const-string v4, ""

    const-string v5, "name"

    const-string v6, "generator"

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 100
    const-string v4, ""

    const-string v5, "content"

    const-string v6, "EPUBLib version 3.0"

    invoke-interface {p1, v4, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 101
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "meta"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 103
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "metadata"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 104
    return-void
.end method

.method private static writeSimpleMetdataElements(Ljava/lang/String;Ljava/util/List;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 6
    .param p0, "tagName"    # Ljava/lang/String;
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/xmlpull/v1/XmlSerializer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 108
    .local v1, "value":Ljava/lang/String;
    invoke-static {v1}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 111
    const-string v2, "http://purl.org/dc/elements/1.1/"

    invoke-interface {p2, v2, p0}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 112
    invoke-interface {p2, v1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 113
    const-string v2, "http://purl.org/dc/elements/1.1/"

    invoke-interface {p2, v2, p0}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_4

    .line 115
    .end local v1    # "value":Ljava/lang/String;
    :cond_24
    return-void
.end method
