.class abstract Lezvcard/Ezvcard$ParserChainHtml;
.super Lezvcard/Ezvcard$ParserChain;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ParserChainHtml"
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


# instance fields
.field pageUrl:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 998
    .local p0, "this":Lezvcard/Ezvcard$ParserChainHtml;, "Lezvcard/Ezvcard$ParserChainHtml<TT;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChain;-><init>()V

    return-void
.end method

.method private constructReader()Lezvcard/io/html/HCardParser;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1039
    .local p0, "this":Lezvcard/Ezvcard$ParserChainHtml;, "Lezvcard/Ezvcard$ParserChainHtml<TT;>;"
    invoke-virtual {p0}, Lezvcard/Ezvcard$ParserChainHtml;->_constructReader()Lezvcard/io/html/HCardParser;

    move-result-object v0

    .line 1040
    .local v0, "parser":Lezvcard/io/html/HCardParser;
    iget-object v1, p0, Lezvcard/Ezvcard$ParserChainHtml;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v0, v1}, Lezvcard/io/html/HCardParser;->setScribeIndex(Lezvcard/io/scribe/ScribeIndex;)V

    .line 1041
    return-object v0
.end method


# virtual methods
.method abstract _constructReader()Lezvcard/io/html/HCardParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
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
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1026
    .local p0, "this":Lezvcard/Ezvcard$ParserChainHtml;, "Lezvcard/Ezvcard$ParserChainHtml<TT;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainHtml;->constructReader()Lezvcard/io/html/HCardParser;

    move-result-object v0

    .line 1027
    .local v0, "parser":Lezvcard/io/html/HCardParser;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1028
    .local v2, "vcards":Ljava/util/List;, "Ljava/util/List<Lezvcard/VCard;>;"
    const/4 v1, 0x0

    .line 1029
    .local v1, "vcard":Lezvcard/VCard;
    :cond_a
    :goto_a
    invoke-virtual {v0}, Lezvcard/io/html/HCardParser;->readNext()Lezvcard/VCard;

    move-result-object v1

    if-eqz v1, :cond_21

    .line 1030
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1031
    iget-object v3, p0, Lezvcard/Ezvcard$ParserChainHtml;->warnings:Ljava/util/List;

    if-eqz v3, :cond_a

    .line 1032
    iget-object v3, p0, Lezvcard/Ezvcard$ParserChainHtml;->warnings:Ljava/util/List;

    invoke-virtual {v0}, Lezvcard/io/html/HCardParser;->getWarnings()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 1035
    :cond_21
    return-object v2
.end method

.method public first()Lezvcard/VCard;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1015
    .local p0, "this":Lezvcard/Ezvcard$ParserChainHtml;, "Lezvcard/Ezvcard$ParserChainHtml<TT;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainHtml;->constructReader()Lezvcard/io/html/HCardParser;

    move-result-object v0

    .line 1017
    .local v0, "parser":Lezvcard/io/html/HCardParser;
    invoke-virtual {v0}, Lezvcard/io/html/HCardParser;->readNext()Lezvcard/VCard;

    move-result-object v1

    .line 1018
    .local v1, "vcard":Lezvcard/VCard;
    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainHtml;->warnings:Ljava/util/List;

    if-eqz v2, :cond_15

    .line 1019
    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainHtml;->warnings:Ljava/util/List;

    invoke-virtual {v0}, Lezvcard/io/html/HCardParser;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1021
    :cond_15
    return-object v1
.end method

.method public pageUrl(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "pageUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 1009
    .local p0, "this":Lezvcard/Ezvcard$ParserChainHtml;, "Lezvcard/Ezvcard$ParserChainHtml<TT;>;"
    iput-object p1, p0, Lezvcard/Ezvcard$ParserChainHtml;->pageUrl:Ljava/lang/String;

    .line 1010
    iget-object v0, p0, Lezvcard/Ezvcard$ParserChainHtml;->this_:Ljava/lang/Object;

    return-object v0
.end method
