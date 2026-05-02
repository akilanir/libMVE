.class abstract Lezvcard/Ezvcard$ParserChainText;
.super Lezvcard/Ezvcard$ParserChain;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ParserChainText"
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
.field caretDecoding:Z

.field final closeWhenDone:Z


# direct methods
.method private constructor <init>(Z)V
    .registers 3
    .param p1, "closeWhenDone"    # Z

    .prologue
    .line 649
    .local p0, "this":Lezvcard/Ezvcard$ParserChainText;, "Lezvcard/Ezvcard$ParserChainText<TT;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChain;-><init>()V

    .line 646
    const/4 v0, 0x1

    iput-boolean v0, p0, Lezvcard/Ezvcard$ParserChainText;->caretDecoding:Z

    .line 650
    iput-boolean p1, p0, Lezvcard/Ezvcard$ParserChainText;->closeWhenDone:Z

    .line 651
    return-void
.end method

.method synthetic constructor <init>(ZLezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Z
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 645
    .local p0, "this":Lezvcard/Ezvcard$ParserChainText;, "Lezvcard/Ezvcard$ParserChainText<TT;>;"
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$ParserChainText;-><init>(Z)V

    return-void
.end method

.method private constructReader()Lezvcard/io/text/VCardReader;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 706
    .local p0, "this":Lezvcard/Ezvcard$ParserChainText;, "Lezvcard/Ezvcard$ParserChainText<TT;>;"
    invoke-virtual {p0}, Lezvcard/Ezvcard$ParserChainText;->_constructReader()Lezvcard/io/text/VCardReader;

    move-result-object v0

    .line 707
    .local v0, "parser":Lezvcard/io/text/VCardReader;
    iget-object v1, p0, Lezvcard/Ezvcard$ParserChainText;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v0, v1}, Lezvcard/io/text/VCardReader;->setScribeIndex(Lezvcard/io/scribe/ScribeIndex;)V

    .line 708
    iget-boolean v1, p0, Lezvcard/Ezvcard$ParserChainText;->caretDecoding:Z

    invoke-virtual {v0, v1}, Lezvcard/io/text/VCardReader;->setCaretDecodingEnabled(Z)V

    .line 709
    return-object v0
.end method


# virtual methods
.method abstract _constructReader()Lezvcard/io/text/VCardReader;
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
    .line 686
    .local p0, "this":Lezvcard/Ezvcard$ParserChainText;, "Lezvcard/Ezvcard$ParserChainText<TT;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainText;->constructReader()Lezvcard/io/text/VCardReader;

    move-result-object v0

    .line 689
    .local v0, "parser":Lezvcard/io/text/VCardReader;
    :try_start_4
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 691
    .local v2, "vcards":Ljava/util/List;, "Ljava/util/List<Lezvcard/VCard;>;"
    :goto_9
    invoke-virtual {v0}, Lezvcard/io/text/VCardReader;->readNext()Lezvcard/VCard;

    move-result-object v1

    .local v1, "vcard":Lezvcard/VCard;
    if-eqz v1, :cond_29

    .line 692
    iget-object v3, p0, Lezvcard/Ezvcard$ParserChainText;->warnings:Ljava/util/List;

    if-eqz v3, :cond_1c

    .line 693
    iget-object v3, p0, Lezvcard/Ezvcard$ParserChainText;->warnings:Ljava/util/List;

    invoke-virtual {v0}, Lezvcard/io/text/VCardReader;->getWarnings()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 695
    :cond_1c
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1f
    .catchall {:try_start_4 .. :try_end_1f} :catchall_20

    goto :goto_9

    .line 699
    .end local v1    # "vcard":Lezvcard/VCard;
    .end local v2    # "vcards":Ljava/util/List;, "Ljava/util/List<Lezvcard/VCard;>;"
    :catchall_20
    move-exception v3

    iget-boolean v4, p0, Lezvcard/Ezvcard$ParserChainText;->closeWhenDone:Z

    if-eqz v4, :cond_28

    .line 700
    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_28
    throw v3

    .line 699
    .restart local v1    # "vcard":Lezvcard/VCard;
    .restart local v2    # "vcards":Ljava/util/List;, "Ljava/util/List<Lezvcard/VCard;>;"
    :cond_29
    iget-boolean v3, p0, Lezvcard/Ezvcard$ParserChainText;->closeWhenDone:Z

    if-eqz v3, :cond_30

    .line 700
    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_30
    return-object v2
.end method

.method public caretDecoding(Z)Ljava/lang/Object;
    .registers 3
    .param p1, "enable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 663
    .local p0, "this":Lezvcard/Ezvcard$ParserChainText;, "Lezvcard/Ezvcard$ParserChainText<TT;>;"
    iput-boolean p1, p0, Lezvcard/Ezvcard$ParserChainText;->caretDecoding:Z

    .line 664
    iget-object v0, p0, Lezvcard/Ezvcard$ParserChainText;->this_:Ljava/lang/Object;

    return-object v0
.end method

.method public first()Lezvcard/VCard;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 669
    .local p0, "this":Lezvcard/Ezvcard$ParserChainText;, "Lezvcard/Ezvcard$ParserChainText<TT;>;"
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainText;->constructReader()Lezvcard/io/text/VCardReader;

    move-result-object v0

    .line 672
    .local v0, "parser":Lezvcard/io/text/VCardReader;
    :try_start_4
    invoke-virtual {v0}, Lezvcard/io/text/VCardReader;->readNext()Lezvcard/VCard;

    move-result-object v1

    .line 673
    .local v1, "vcard":Lezvcard/VCard;
    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainText;->warnings:Ljava/util/List;

    if-eqz v2, :cond_15

    .line 674
    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainText;->warnings:Ljava/util/List;

    invoke-virtual {v0}, Lezvcard/io/text/VCardReader;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_15
    .catchall {:try_start_4 .. :try_end_15} :catchall_1d

    .line 678
    :cond_15
    iget-boolean v2, p0, Lezvcard/Ezvcard$ParserChainText;->closeWhenDone:Z

    if-eqz v2, :cond_1c

    .line 679
    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_1c
    return-object v1

    .line 678
    .end local v1    # "vcard":Lezvcard/VCard;
    :catchall_1d
    move-exception v2

    iget-boolean v3, p0, Lezvcard/Ezvcard$ParserChainText;->closeWhenDone:Z

    if-eqz v3, :cond_25

    .line 679
    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_25
    throw v2
.end method
