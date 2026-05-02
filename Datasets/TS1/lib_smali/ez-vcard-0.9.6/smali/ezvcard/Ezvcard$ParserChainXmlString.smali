.class public Lezvcard/Ezvcard$ParserChainXmlString;
.super Lezvcard/Ezvcard$ParserChainXml;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParserChainXmlString"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/Ezvcard$ParserChainXml",
        "<",
        "Lezvcard/Ezvcard$ParserChainXmlString;",
        ">;"
    }
.end annotation


# instance fields
.field private final xml:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "xml"    # Ljava/lang/String;

    .prologue
    .line 905
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainXml;-><init>()V

    .line 906
    iput-object p1, p0, Lezvcard/Ezvcard$ParserChainXmlString;->xml:Ljava/lang/String;

    .line 907
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 902
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$ParserChainXmlString;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method _constructDocument()Lezvcard/io/xml/XCardDocument;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 921
    new-instance v0, Lezvcard/io/xml/XCardDocument;

    iget-object v1, p0, Lezvcard/Ezvcard$ParserChainXmlString;->xml:Ljava/lang/String;

    invoke-direct {v0, v1}, Lezvcard/io/xml/XCardDocument;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public all()Ljava/util/List;
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 937
    :try_start_0
    invoke-super {p0}, Lezvcard/Ezvcard$ParserChainXml;->all()Ljava/util/List;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 938
    :catch_5
    move-exception v0

    .line 940
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public first()Lezvcard/VCard;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 927
    :try_start_0
    invoke-super {p0}, Lezvcard/Ezvcard$ParserChainXml;->first()Lezvcard/VCard;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 928
    :catch_5
    move-exception v0

    .line 930
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$ParserChainXmlString;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/scribe/VCardPropertyScribe",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)",
            "Lezvcard/Ezvcard$ParserChainXmlString;"
        }
    .end annotation

    .prologue
    .line 911
    .local p1, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainXml;->register(Lezvcard/io/scribe/VCardPropertyScribe;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainXmlString;

    return-object v0
.end method

.method public bridge synthetic register(Lezvcard/io/scribe/VCardPropertyScribe;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lezvcard/io/scribe/VCardPropertyScribe;

    .prologue
    .line 902
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainXmlString;->register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$ParserChainXmlString;

    move-result-object v0

    return-object v0
.end method

.method public warnings(Ljava/util/List;)Lezvcard/Ezvcard$ParserChainXmlString;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lezvcard/Ezvcard$ParserChainXmlString;"
        }
    .end annotation

    .prologue
    .line 916
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainXml;->warnings(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainXmlString;

    return-object v0
.end method

.method public bridge synthetic warnings(Ljava/util/List;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 902
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainXmlString;->warnings(Ljava/util/List;)Lezvcard/Ezvcard$ParserChainXmlString;

    move-result-object v0

    return-object v0
.end method
