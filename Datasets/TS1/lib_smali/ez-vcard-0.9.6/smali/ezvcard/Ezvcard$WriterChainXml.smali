.class public Lezvcard/Ezvcard$WriterChainXml;
.super Lezvcard/Ezvcard$WriterChain;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WriterChainXml"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/Ezvcard$WriterChain",
        "<",
        "Lezvcard/Ezvcard$WriterChainXml;",
        ">;"
    }
.end annotation


# instance fields
.field indent:I

.field final index:Lezvcard/io/scribe/ScribeIndex;

.field prodId:Z

.field versionStrict:Z


# direct methods
.method private constructor <init>(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/VCard;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "vcards":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/VCard;>;"
    const/4 v0, 0x1

    .line 1511
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$WriterChain;-><init>(Ljava/util/Collection;)V

    .line 1505
    iput-boolean v0, p0, Lezvcard/Ezvcard$WriterChainXml;->prodId:Z

    .line 1506
    iput-boolean v0, p0, Lezvcard/Ezvcard$WriterChainXml;->versionStrict:Z

    .line 1507
    const/4 v0, -0x1

    iput v0, p0, Lezvcard/Ezvcard$WriterChainXml;->indent:I

    .line 1508
    new-instance v0, Lezvcard/io/scribe/ScribeIndex;

    invoke-direct {v0}, Lezvcard/io/scribe/ScribeIndex;-><init>()V

    iput-object v0, p0, Lezvcard/Ezvcard$WriterChainXml;->index:Lezvcard/io/scribe/ScribeIndex;

    .line 1512
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/Collection;Lezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/util/Collection;
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 1504
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$WriterChainXml;-><init>(Ljava/util/Collection;)V

    return-void
.end method

.method private createXCardDocument()Lezvcard/io/xml/XCardDocument;
    .registers 6

    .prologue
    .line 1615
    new-instance v0, Lezvcard/io/xml/XCardDocument;

    invoke-direct {v0}, Lezvcard/io/xml/XCardDocument;-><init>()V

    .line 1616
    .local v0, "doc":Lezvcard/io/xml/XCardDocument;
    invoke-virtual {v0}, Lezvcard/io/xml/XCardDocument;->writer()Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;

    move-result-object v3

    .line 1617
    .local v3, "writer":Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;
    iget-boolean v4, p0, Lezvcard/Ezvcard$WriterChainXml;->prodId:Z

    invoke-virtual {v3, v4}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->setAddProdId(Z)V

    .line 1618
    iget-boolean v4, p0, Lezvcard/Ezvcard$WriterChainXml;->versionStrict:Z

    invoke-virtual {v3, v4}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->setVersionStrict(Z)V

    .line 1619
    iget-object v4, p0, Lezvcard/Ezvcard$WriterChainXml;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v3, v4}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->setScribeIndex(Lezvcard/io/scribe/ScribeIndex;)V

    .line 1621
    iget-object v4, p0, Lezvcard/Ezvcard$WriterChainXml;->vcards:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lezvcard/VCard;

    .line 1622
    .local v2, "vcard":Lezvcard/VCard;
    invoke-virtual {v3, v2}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->write(Lezvcard/VCard;)V

    goto :goto_1e

    .line 1625
    .end local v2    # "vcard":Lezvcard/VCard;
    :cond_2e
    return-object v0
.end method


# virtual methods
.method public dom()Lorg/w3c/dom/Document;
    .registers 3

    .prologue
    .line 1610
    invoke-direct {p0}, Lezvcard/Ezvcard$WriterChainXml;->createXCardDocument()Lezvcard/io/xml/XCardDocument;

    move-result-object v0

    .line 1611
    .local v0, "doc":Lezvcard/io/xml/XCardDocument;
    invoke-virtual {v0}, Lezvcard/io/xml/XCardDocument;->getDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    return-object v1
.end method

.method public go()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1563
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 1565
    .local v0, "sw":Ljava/io/StringWriter;
    :try_start_5
    invoke-virtual {p0, v0}, Lezvcard/Ezvcard$WriterChainXml;->go(Ljava/io/Writer;)V
    :try_end_8
    .catch Ljavax/xml/transform/TransformerException; {:try_start_5 .. :try_end_8} :catch_d

    .line 1569
    :goto_8
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1566
    :catch_d
    move-exception v1

    goto :goto_8
.end method

.method public go(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 1590
    invoke-direct {p0}, Lezvcard/Ezvcard$WriterChainXml;->createXCardDocument()Lezvcard/io/xml/XCardDocument;

    move-result-object v0

    .line 1591
    .local v0, "doc":Lezvcard/io/xml/XCardDocument;
    iget v1, p0, Lezvcard/Ezvcard$WriterChainXml;->indent:I

    invoke-virtual {v0, p1, v1}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/File;I)V

    .line 1592
    return-void
.end method

.method public go(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 1579
    invoke-direct {p0}, Lezvcard/Ezvcard$WriterChainXml;->createXCardDocument()Lezvcard/io/xml/XCardDocument;

    move-result-object v0

    .line 1580
    .local v0, "doc":Lezvcard/io/xml/XCardDocument;
    iget v1, p0, Lezvcard/Ezvcard$WriterChainXml;->indent:I

    invoke-virtual {v0, p1, v1}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/OutputStream;I)V

    .line 1581
    return-void
.end method

.method public go(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 1601
    invoke-direct {p0}, Lezvcard/Ezvcard$WriterChainXml;->createXCardDocument()Lezvcard/io/xml/XCardDocument;

    move-result-object v0

    .line 1602
    .local v0, "doc":Lezvcard/io/xml/XCardDocument;
    iget v1, p0, Lezvcard/Ezvcard$WriterChainXml;->indent:I

    invoke-virtual {v0, p1, v1}, Lezvcard/io/xml/XCardDocument;->write(Ljava/io/Writer;I)V

    .line 1603
    return-void
.end method

.method public indent(I)Lezvcard/Ezvcard$WriterChainXml;
    .registers 3
    .param p1, "indent"    # I

    .prologue
    .line 1532
    iput p1, p0, Lezvcard/Ezvcard$WriterChainXml;->indent:I

    .line 1533
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainXml;->this_:Ljava/lang/Object;

    check-cast v0, Lezvcard/Ezvcard$WriterChainXml;

    return-object v0
.end method

.method public prodId(Z)Lezvcard/Ezvcard$WriterChainXml;
    .registers 3
    .param p1, "include"    # Z

    .prologue
    .line 1521
    iput-boolean p1, p0, Lezvcard/Ezvcard$WriterChainXml;->prodId:Z

    .line 1522
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainXml;->this_:Ljava/lang/Object;

    check-cast v0, Lezvcard/Ezvcard$WriterChainXml;

    return-object v0
.end method

.method public register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$WriterChainXml;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/scribe/VCardPropertyScribe",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)",
            "Lezvcard/Ezvcard$WriterChainXml;"
        }
    .end annotation

    .prologue
    .line 1554
    .local p1, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainXml;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v0, p1}, Lezvcard/io/scribe/ScribeIndex;->register(Lezvcard/io/scribe/VCardPropertyScribe;)V

    .line 1555
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainXml;->this_:Ljava/lang/Object;

    check-cast v0, Lezvcard/Ezvcard$WriterChainXml;

    return-object v0
.end method

.method public versionStrict(Z)Lezvcard/Ezvcard$WriterChainXml;
    .registers 3
    .param p1, "versionStrict"    # Z

    .prologue
    .line 1544
    iput-boolean p1, p0, Lezvcard/Ezvcard$WriterChainXml;->versionStrict:Z

    .line 1545
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainXml;->this_:Ljava/lang/Object;

    check-cast v0, Lezvcard/Ezvcard$WriterChainXml;

    return-object v0
.end method
