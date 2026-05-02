.class abstract Lezvcard/Ezvcard$ParserChainXml;
.super Lezvcard/Ezvcard$ParserChain;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ParserChainXml"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lezvcard/Ezvcard$ParserChain",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 812
    .local p0, "this":Lezvcard/Ezvcard$ParserChainXml;, "Lezvcard/Ezvcard$ParserChainXml<TT;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChain;-><init>()V

    return-void
.end method

.method private constructStreamReader()Lezvcard/io/StreamReader;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 838
    .local p0, "this":Lezvcard/Ezvcard$ParserChainXml;, "Lezvcard/Ezvcard$ParserChainXml<TT;>;"
    invoke-virtual {p0}, Lezvcard/Ezvcard$ParserChainXml;->_constructDocument()Lezvcard/io/xml/XCardDocument;

    move-result-object v0

    .line 839
    .local v0, "parser":Lezvcard/io/xml/XCardDocument;
    invoke-virtual {v0}, Lezvcard/io/xml/XCardDocument;->reader()Lezvcard/io/StreamReader;

    move-result-object v1

    .line 840
    .local v1, "reader":Lezvcard/io/StreamReader;
    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainXml;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v1, v2}, Lezvcard/io/StreamReader;->setScribeIndex(Lezvcard/io/scribe/ScribeIndex;)V

    .line 841
    return-object v1
.end method


# virtual methods
.method abstract _constructDocument()Lezvcard/io/xml/XCardDocument;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation
.end method

.method public all()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/VCard;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 825
    .local p0, "this":Lezvcard/Ezvcard$ParserChainXml;, "Lezvcard/Ezvcard$ParserChainXml<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 826
    .local v2, "vcards":Ljava/util/List;, "Ljava/util/List<Lezvcard/VCard;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainXml;->constructStreamReader()Lezvcard/io/StreamReader;

    move-result-object v0

    .line 827
    .local v0, "reader":Lezvcard/io/StreamReader;
    const/4 v1, 0x0

    .line 828
    .local v1, "vcard":Lezvcard/VCard;
    :cond_a
    :goto_a
    invoke-virtual {v0}, Lezvcard/io/StreamReader;->readNext()Lezvcard/VCard;

    move-result-object v1

    if-eqz v1, :cond_21

    .line 829
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 830
    iget-object v3, p0, Lezvcard/Ezvcard$ParserChainXml;->warnings:Ljava/util/List;

    if-eqz v3, :cond_a

    .line 831
    iget-object v3, p0, Lezvcard/Ezvcard$ParserChainXml;->warnings:Ljava/util/List;

    invoke-virtual {v0}, Lezvcard/io/StreamReader;->getWarnings()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 834
    :cond_21
    return-object v2
.end method

.method public first()Lezvcard/VCard;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 815
    .local p0, "this":Lezvcard/Ezvcard$ParserChainXml;, "Lezvcard/Ezvcard$ParserChainXml<TT;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainXml;->constructStreamReader()Lezvcard/io/StreamReader;

    move-result-object v0

    .line 816
    .local v0, "reader":Lezvcard/io/StreamReader;
    invoke-virtual {v0}, Lezvcard/io/StreamReader;->readNext()Lezvcard/VCard;

    move-result-object v1

    .line 817
    .local v1, "vcard":Lezvcard/VCard;
    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainXml;->warnings:Ljava/util/List;

    if-eqz v2, :cond_15

    .line 818
    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainXml;->warnings:Ljava/util/List;

    invoke-virtual {v0}, Lezvcard/io/StreamReader;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 820
    :cond_15
    return-object v1
.end method
