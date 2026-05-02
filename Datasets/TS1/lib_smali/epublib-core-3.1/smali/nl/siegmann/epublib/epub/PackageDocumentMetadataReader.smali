.class Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;
.super Lnl/siegmann/epublib/epub/PackageDocumentBase;
.source "PackageDocumentMetadataReader.java"


# static fields
.field private static final log:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-class v0, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->log:Lorg/slf4j/Logger;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Lnl/siegmann/epublib/epub/PackageDocumentBase;-><init>()V

    return-void
.end method

.method private static createAuthor(Lorg/w3c/dom/Element;)Lnl/siegmann/epublib/domain/Author;
    .registers 6
    .param p0, "authorElement"    # Lorg/w3c/dom/Element;

    .prologue
    .line 138
    invoke-static {p0}, Lnl/siegmann/epublib/epub/DOMUtil;->getTextChildrenContent(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "authorString":Ljava/lang/String;
    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 140
    const/4 v1, 0x0

    .line 150
    :goto_b
    return-object v1

    .line 142
    :cond_c
    const/16 v3, 0x20

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 144
    .local v2, "spacePos":I
    if-gez v2, :cond_25

    .line 145
    new-instance v1, Lnl/siegmann/epublib/domain/Author;

    invoke-direct {v1, v0}, Lnl/siegmann/epublib/domain/Author;-><init>(Ljava/lang/String;)V

    .line 149
    .local v1, "result":Lnl/siegmann/epublib/domain/Author;
    :goto_19
    const-string v3, "http://www.idpf.org/2007/opf"

    const-string v4, "role"

    invoke-interface {p0, v3, v4}, Lorg/w3c/dom/Element;->getAttributeNS(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lnl/siegmann/epublib/domain/Author;->setRole(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Relator;

    goto :goto_b

    .line 147
    .end local v1    # "result":Lnl/siegmann/epublib/domain/Author;
    :cond_25
    new-instance v1, Lnl/siegmann/epublib/domain/Author;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lnl/siegmann/epublib/domain/Author;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v1    # "result":Lnl/siegmann/epublib/domain/Author;
    goto :goto_19
.end method

.method private static getBookIdId(Lorg/w3c/dom/Document;)Ljava/lang/String;
    .registers 6
    .param p0, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 90
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v2

    const-string v3, "http://www.idpf.org/2007/opf"

    const-string v4, "package"

    invoke-static {v2, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 91
    .local v0, "packageElement":Lorg/w3c/dom/Element;
    if-nez v0, :cond_10

    .line 92
    const/4 v1, 0x0

    .line 95
    :goto_f
    return-object v1

    .line 94
    :cond_10
    const-string v2, "http://www.idpf.org/2007/opf"

    const-string v3, "unique-identifier"

    invoke-interface {v0, v2, v3}, Lorg/w3c/dom/Element;->getAttributeNS(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "result":Ljava/lang/String;
    goto :goto_f
.end method

.method private static readAuthors(Ljava/lang/String;Lorg/w3c/dom/Element;)Ljava/util/List;
    .registers 8
    .param p0, "authorTag"    # Ljava/lang/String;
    .param p1, "metadataElement"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Author;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    const-string v5, "http://purl.org/dc/elements/1.1/"

    invoke-interface {p1, v5, p0}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 108
    .local v2, "elements":Lorg/w3c/dom/NodeList;
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 109
    .local v4, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Author;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_10
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v3, v5, :cond_28

    .line 110
    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 111
    .local v1, "authorElement":Lorg/w3c/dom/Element;
    invoke-static {v1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->createAuthor(Lorg/w3c/dom/Element;)Lnl/siegmann/epublib/domain/Author;

    move-result-object v0

    .line 112
    .local v0, "author":Lnl/siegmann/epublib/domain/Author;
    if-eqz v0, :cond_25

    .line 113
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    :cond_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 116
    .end local v0    # "author":Lnl/siegmann/epublib/domain/Author;
    .end local v1    # "authorElement":Lorg/w3c/dom/Element;
    :cond_28
    return-object v4
.end method

.method private static readContributors(Lorg/w3c/dom/Element;)Ljava/util/List;
    .registers 2
    .param p0, "metadataElement"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Author;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    const-string v0, "contributor"

    invoke-static {v0, p0}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->readAuthors(Ljava/lang/String;Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private static readCreators(Lorg/w3c/dom/Element;)Ljava/util/List;
    .registers 2
    .param p0, "metadataElement"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Author;",
            ">;"
        }
    .end annotation

    .prologue
    .line 99
    const-string v0, "creator"

    invoke-static {v0, p0}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->readAuthors(Ljava/lang/String;Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private static readDates(Lorg/w3c/dom/Element;)Ljava/util/List;
    .registers 10
    .param p0, "metadataElement"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Date;",
            ">;"
        }
    .end annotation

    .prologue
    .line 121
    const-string v6, "http://purl.org/dc/elements/1.1/"

    const-string v7, "date"

    invoke-interface {p0, v6, v7}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 122
    .local v3, "elements":Lorg/w3c/dom/NodeList;
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 123
    .local v5, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Date;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_12
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v4, v6, :cond_40

    .line 124
    invoke-interface {v3, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 127
    .local v1, "dateElement":Lorg/w3c/dom/Element;
    :try_start_1e
    new-instance v0, Lnl/siegmann/epublib/domain/Date;

    invoke-static {v1}, Lnl/siegmann/epublib/epub/DOMUtil;->getTextChildrenContent(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "http://www.idpf.org/2007/opf"

    const-string v8, "event"

    invoke-interface {v1, v7, v8}, Lorg/w3c/dom/Element;->getAttributeNS(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v6, v7}, Lnl/siegmann/epublib/domain/Date;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .local v0, "date":Lnl/siegmann/epublib/domain/Date;
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_32
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1e .. :try_end_32} :catch_35

    .line 123
    .end local v0    # "date":Lnl/siegmann/epublib/domain/Date;
    :goto_32
    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    .line 129
    :catch_35
    move-exception v2

    .line 130
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    sget-object v6, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->log:Lorg/slf4j/Logger;

    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_32

    .line 133
    .end local v1    # "dateElement":Lorg/w3c/dom/Element;
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :cond_40
    return-object v5
.end method

.method private static readIdentifiers(Lorg/w3c/dom/Element;)Ljava/util/List;
    .registers 11
    .param p0, "metadataElement"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Identifier;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    const-string v8, "http://purl.org/dc/elements/1.1/"

    const-string v9, "identifier"

    invoke-interface {p0, v8, v9}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v4

    .line 156
    .local v4, "identifierElements":Lorg/w3c/dom/NodeList;
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-nez v8, :cond_1b

    .line 157
    sget-object v8, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->log:Lorg/slf4j/Logger;

    const-string v9, "Package does not contain element identifier"

    invoke-interface {v8, v9}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 158
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 175
    :cond_1a
    return-object v6

    .line 160
    :cond_1b
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v8

    invoke-static {v8}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->getBookIdId(Lorg/w3c/dom/Document;)Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, "bookIdId":Ljava/lang/String;
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    invoke-direct {v6, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 162
    .local v6, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Identifier;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2d
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v8

    if-ge v1, v8, :cond_1a

    .line 163
    invoke-interface {v4, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 164
    .local v3, "identifierElement":Lorg/w3c/dom/Element;
    const-string v8, "http://www.idpf.org/2007/opf"

    const-string v9, "scheme"

    invoke-interface {v3, v8, v9}, Lorg/w3c/dom/Element;->getAttributeNS(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 165
    .local v7, "schemeName":Ljava/lang/String;
    invoke-static {v3}, Lnl/siegmann/epublib/epub/DOMUtil;->getTextChildrenContent(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v5

    .line 166
    .local v5, "identifierValue":Ljava/lang/String;
    invoke-static {v5}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4e

    .line 162
    :goto_4b
    add-int/lit8 v1, v1, 0x1

    goto :goto_2d

    .line 169
    :cond_4e
    new-instance v2, Lnl/siegmann/epublib/domain/Identifier;

    invoke-direct {v2, v7, v5}, Lnl/siegmann/epublib/domain/Identifier;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .local v2, "identifier":Lnl/siegmann/epublib/domain/Identifier;
    const-string v8, "id"

    invoke-interface {v3, v8}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_63

    .line 171
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Lnl/siegmann/epublib/domain/Identifier;->setBookId(Z)V

    .line 173
    :cond_63
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4b
.end method

.method public static readMetadata(Lorg/w3c/dom/Document;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Metadata;
    .registers 8
    .param p0, "packageDocument"    # Lorg/w3c/dom/Document;
    .param p1, "resources"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 38
    new-instance v2, Lnl/siegmann/epublib/domain/Metadata;

    invoke-direct {v2}, Lnl/siegmann/epublib/domain/Metadata;-><init>()V

    .line 39
    .local v2, "result":Lnl/siegmann/epublib/domain/Metadata;
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v3

    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "metadata"

    invoke-static {v3, v4, v5}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 40
    .local v1, "metadataElement":Lorg/w3c/dom/Element;
    if-nez v1, :cond_1b

    .line 41
    sget-object v3, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->log:Lorg/slf4j/Logger;

    const-string v4, "Package does not contain element metadata"

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 62
    :cond_1a
    :goto_1a
    return-object v2

    .line 44
    :cond_1b
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "title"

    invoke-static {v1, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getElementsTextChild(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setTitles(Ljava/util/List;)V

    .line 45
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "publisher"

    invoke-static {v1, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getElementsTextChild(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setPublishers(Ljava/util/List;)V

    .line 46
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "description"

    invoke-static {v1, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getElementsTextChild(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setDescriptions(Ljava/util/List;)V

    .line 47
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "rights"

    invoke-static {v1, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getElementsTextChild(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setRights(Ljava/util/List;)V

    .line 48
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "type"

    invoke-static {v1, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getElementsTextChild(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setTypes(Ljava/util/List;)V

    .line 49
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "subject"

    invoke-static {v1, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getElementsTextChild(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setSubjects(Ljava/util/List;)V

    .line 50
    invoke-static {v1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->readIdentifiers(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setIdentifiers(Ljava/util/List;)V

    .line 51
    invoke-static {v1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->readCreators(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setAuthors(Ljava/util/List;)V

    .line 52
    invoke-static {v1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->readContributors(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setContributors(Ljava/util/List;)V

    .line 53
    invoke-static {v1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->readDates(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setDates(Ljava/util/List;)V

    .line 54
    invoke-static {v1}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->readOtherProperties(Lorg/w3c/dom/Element;)Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setOtherProperties(Ljava/util/Map;)V

    .line 56
    const-string v3, "http://purl.org/dc/elements/1.1/"

    const-string v4, "language"

    invoke-static {v1, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 57
    .local v0, "languageTag":Lorg/w3c/dom/Element;
    if-eqz v0, :cond_1a

    .line 58
    invoke-static {v0}, Lnl/siegmann/epublib/epub/DOMUtil;->getTextChildrenContent(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lnl/siegmann/epublib/domain/Metadata;->setLanguage(Ljava/lang/String;)V

    goto :goto_1a
.end method

.method private static readOtherProperties(Lorg/w3c/dom/Element;)Ljava/util/Map;
    .registers 10
    .param p0, "metadataElement"    # Lorg/w3c/dom/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljavax/xml/namespace/QName;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 74
    .local v5, "result":Ljava/util/Map;, "Ljava/util/Map<Ljavax/xml/namespace/QName;Ljava/lang/String;>;"
    const-string v7, "http://www.idpf.org/2007/opf"

    const-string v8, "meta"

    invoke-interface {p0, v7, v8}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 75
    .local v2, "metaTags":Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v7

    if-ge v0, v7, :cond_37

    .line 76
    invoke-interface {v2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 77
    .local v1, "metaNode":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v7

    const-string v8, "property"

    invoke-interface {v7, v8}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 78
    .local v4, "property":Lorg/w3c/dom/Node;
    if-eqz v4, :cond_34

    .line 79
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    .line 80
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v6

    .line 81
    .local v6, "value":Ljava/lang/String;
    new-instance v7, Ljavax/xml/namespace/QName;

    invoke-direct {v7, v3}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;)V

    invoke-interface {v5, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .end local v3    # "name":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_34
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 85
    .end local v1    # "metaNode":Lorg/w3c/dom/Node;
    .end local v4    # "property":Lorg/w3c/dom/Node;
    :cond_37
    return-object v5
.end method
