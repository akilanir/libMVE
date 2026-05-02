.class public Lorg/kore/kolab/notes/v3/KolabNotesParserV3;
.super Ljava/lang/Object;
.source "KolabNotesParserV3.java"

# interfaces
.implements Lorg/kore/kolab/notes/KolabParser;
.implements Ljava/io/Serializable;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/v3/KolabNotesParserV3;->parse(Ljava/io/InputStream;)Lorg/kore/kolab/notes/Note;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;)Lorg/kore/kolab/notes/Note;
    .registers 6
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 31
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .line 33
    .local v2, "saxParser":Ljavax/xml/parsers/SAXParser;
    new-instance v1, Lorg/kore/kolab/notes/v3/KolabNotesHandler;

    invoke-direct {v1}, Lorg/kore/kolab/notes/v3/KolabNotesHandler;-><init>()V

    .line 34
    .local v1, "handler":Lorg/kore/kolab/notes/v3/KolabNotesHandler;
    invoke-virtual {v2, p1, v1}, Ljavax/xml/parsers/SAXParser;->parse(Ljava/io/InputStream;Lorg/xml/sax/helpers/DefaultHandler;)V

    .line 36
    invoke-virtual {v1}, Lorg/kore/kolab/notes/v3/KolabNotesHandler;->getNote()Lorg/kore/kolab/notes/Note;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_15

    move-result-object v3

    return-object v3

    .line 37
    .end local v1    # "handler":Lorg/kore/kolab/notes/v3/KolabNotesHandler;
    .end local v2    # "saxParser":Ljavax/xml/parsers/SAXParser;
    :catch_15
    move-exception v0

    .line 38
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/kore/kolab/notes/v3/KolabParseException;

    invoke-direct {v3, v0}, Lorg/kore/kolab/notes/v3/KolabParseException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public write(Ljava/lang/Object;Ljava/io/OutputStream;)V
    .registers 10
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 48
    :try_start_0
    move-object v0, p1

    check-cast v0, Lorg/kore/kolab/notes/Note;

    move-object v2, v0

    .line 50
    .local v2, "note":Lorg/kore/kolab/notes/Note;
    new-instance v5, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;

    invoke-direct {v5}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;-><init>()V

    .line 51
    invoke-virtual {v2}, Lorg/kore/kolab/notes/Note;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->withIdentification(Lorg/kore/kolab/notes/Identification;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;

    move-result-object v5

    .line 52
    invoke-virtual {v2}, Lorg/kore/kolab/notes/Note;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->withAuditInformation(Lorg/kore/kolab/notes/AuditInformation;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;

    move-result-object v5

    .line 53
    invoke-virtual {v2}, Lorg/kore/kolab/notes/Note;->getClassification()Lorg/kore/kolab/notes/Note$Classification;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->withClassification(Lorg/kore/kolab/notes/Note$Classification;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;

    move-result-object v5

    .line 54
    invoke-virtual {v2}, Lorg/kore/kolab/notes/Note;->getAttachments()Ljava/util/Collection;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->withAttachments(Ljava/util/Collection;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;

    move-result-object v5

    .line 55
    invoke-virtual {v2}, Lorg/kore/kolab/notes/Note;->getSummary()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->withSummary(Ljava/lang/String;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;

    move-result-object v5

    .line 56
    invoke-virtual {v2}, Lorg/kore/kolab/notes/Note;->getDescription()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->withDescription(Ljava/lang/String;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;

    move-result-object v5

    .line 57
    invoke-virtual {v2}, Lorg/kore/kolab/notes/Note;->getColor()Lorg/kore/kolab/notes/Color;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->withColor(Lorg/kore/kolab/notes/Color;)Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;

    move-result-object v5

    .line 58
    invoke-virtual {v5}, Lorg/kore/kolab/notes/v3/KolabNotesXMLBuilder;->build()Ljava/lang/String;

    move-result-object v4

    .line 60
    .local v4, "xml":Ljava/lang/String;
    instance-of v5, p2, Lkorex/mail/internet/AsciiOutputStream;

    if-eqz v5, :cond_50

    .line 61
    move-object v0, p2

    check-cast v0, Lkorex/mail/internet/AsciiOutputStream;

    move-object v5, v0

    invoke-virtual {v5}, Lkorex/mail/internet/AsciiOutputStream;->disableBreakOnNonAscii()V

    .line 64
    :cond_50
    new-instance v3, Ljava/io/OutputStreamWriter;

    invoke-direct {v3, p2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 66
    .local v3, "outputStreamWriter":Ljava/io/OutputStreamWriter;
    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 67
    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5b} :catch_5c

    .line 71
    return-void

    .line 68
    .end local v2    # "note":Lorg/kore/kolab/notes/Note;
    .end local v3    # "outputStreamWriter":Ljava/io/OutputStreamWriter;
    .end local v4    # "xml":Ljava/lang/String;
    :catch_5c
    move-exception v1

    .line 69
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Lorg/kore/kolab/notes/v3/KolabParseException;

    invoke-direct {v5, v1}, Lorg/kore/kolab/notes/v3/KolabParseException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method
