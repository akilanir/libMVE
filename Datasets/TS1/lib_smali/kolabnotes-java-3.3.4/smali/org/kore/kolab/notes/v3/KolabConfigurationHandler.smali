.class public Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "KolabConfigurationHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;
    }
.end annotation


# instance fields
.field private final builder:Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;

.field private completeValue:Ljava/lang/StringBuilder;

.field private currentValue:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 23
    const-string v0, ""

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->currentValue:Ljava/lang/String;

    .line 27
    new-instance v0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;

    invoke-direct {v0, p0}, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;-><init>(Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;)V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->builder:Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->completeValue:Ljava/lang/StringBuilder;

    .line 29
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .registers 6
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->completeValue:Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 42
    :try_start_0
    iget-object v1, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->builder:Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;

    iget-object v2, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->completeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p3, v2}, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->setValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_b} :catch_c

    .line 46
    return-void

    .line 43
    :catch_c
    move-exception v0

    .line 44
    .local v0, "e":Ljava/text/ParseException;
    new-instance v1, Lorg/kore/kolab/notes/v3/KolabParseException;

    invoke-direct {v1, v0}, Lorg/kore/kolab/notes/v3/KolabParseException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getTag()Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->builder:Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;

    invoke-virtual {v0}, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler$TagDetailBuilder;->build()Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    move-result-object v0

    return-object v0
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 6
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/v3/KolabConfigurationHandler;->completeValue:Ljava/lang/StringBuilder;

    .line 34
    return-void
.end method
