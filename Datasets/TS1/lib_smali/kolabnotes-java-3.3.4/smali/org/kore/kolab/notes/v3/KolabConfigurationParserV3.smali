.class public Lorg/kore/kolab/notes/v3/KolabConfigurationParserV3;
.super Ljava/lang/Object;
.source "KolabConfigurationParserV3.java"

# interfaces
.implements Lorg/kore/kolab/notes/KolabParser;
.implements Ljava/io/Serializable;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/v3/KolabConfigurationParserV3;->parse(Ljava/io/InputStream;)Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;)Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .registers 6
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 36
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .line 38
    .local v2, "saxParser":Ljavax/xml/parsers/SAXParser;
    new-instance v1, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;

    invoke-direct {v1}, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;-><init>()V

    .line 39
    .local v1, "handler":Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;
    invoke-virtual {v2, p1, v1}, Ljavax/xml/parsers/SAXParser;->parse(Ljava/io/InputStream;Lorg/xml/sax/helpers/DefaultHandler;)V

    .line 41
    invoke-virtual {v1}, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->getTag()Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_15

    move-result-object v3

    return-object v3

    .line 42
    .end local v1    # "handler":Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;
    .end local v2    # "saxParser":Ljavax/xml/parsers/SAXParser;
    :catch_15
    move-exception v0

    .line 43
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/kore/kolab/notes/v3/KolabParseException;

    invoke-direct {v3, v0}, Lorg/kore/kolab/notes/v3/KolabParseException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public write(Ljava/lang/Object;Ljava/io/OutputStream;)V
    .registers 15
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 53
    :try_start_0
    move-object v0, p1

    check-cast v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    move-object v1, v0

    .line 55
    .local v1, "details":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v3

    .line 56
    .local v3, "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v2

    .line 59
    .local v2, "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-static {v2}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->createInstance(Ljavax/xml/parsers/DocumentBuilder;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 60
    invoke-virtual {v1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->withIdentification(Lorg/kore/kolab/notes/Identification;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 61
    invoke-virtual {v1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->withAuditInformation(Lorg/kore/kolab/notes/AuditInformation;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 62
    invoke-virtual {v10}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->withType()Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 63
    invoke-virtual {v1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v11

    invoke-virtual {v11}, Lorg/kore/kolab/notes/Tag;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->withName(Ljava/lang/String;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 64
    invoke-virtual {v10}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->withRelationType()Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 65
    invoke-virtual {v1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v11

    invoke-virtual {v11}, Lorg/kore/kolab/notes/Tag;->getColor()Lorg/kore/kolab/notes/Color;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->withColor(Lorg/kore/kolab/notes/Color;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 66
    invoke-virtual {v1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v11

    invoke-virtual {v11}, Lorg/kore/kolab/notes/Tag;->getPriority()I

    move-result v11

    invoke-virtual {v10, v11}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->withPriority(I)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 67
    invoke-virtual {v1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getMembers()Ljava/util/Set;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->withMembers(Ljava/util/Set;)Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;

    move-result-object v10

    .line 68
    invoke-virtual {v10}, Lorg/kore/kolab/notes/v3/KolabConfigurationXMLBuilder;->build()Lorg/w3c/dom/Document;

    move-result-object v4

    .line 70
    .local v4, "document":Lorg/w3c/dom/Document;
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v9

    .line 71
    .local v9, "transformerFactory":Ljavax/xml/transform/TransformerFactory;
    invoke-virtual {v9}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v8

    .line 72
    .local v8, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v7, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v7, v4}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 73
    .local v7, "source":Ljavax/xml/transform/dom/DOMSource;
    new-instance v6, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v6, p2}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/OutputStream;)V

    .line 75
    .local v6, "result":Ljavax/xml/transform/stream/StreamResult;
    invoke-virtual {v8, v7, v6}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6d} :catch_6e

    .line 79
    return-void

    .line 76
    .end local v1    # "details":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .end local v2    # "docBuilder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v3    # "docFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v4    # "document":Lorg/w3c/dom/Document;
    .end local v6    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v7    # "source":Ljavax/xml/transform/dom/DOMSource;
    .end local v8    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v9    # "transformerFactory":Ljavax/xml/transform/TransformerFactory;
    :catch_6e
    move-exception v5

    .line 77
    .local v5, "e":Ljava/lang/Exception;
    new-instance v10, Lorg/kore/kolab/notes/v3/KolabParseException;

    invoke-direct {v10, v5}, Lorg/kore/kolab/notes/v3/KolabParseException;-><init>(Ljava/lang/Throwable;)V

    throw v10
.end method
