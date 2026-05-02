.class public abstract Lezvcard/io/StreamReader;
.super Ljava/lang/Object;
.source "StreamReader.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field protected index:Lezvcard/io/scribe/ScribeIndex;

.field protected final warnings:Lezvcard/io/ParseWarnings;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lezvcard/io/ParseWarnings;

    invoke-direct {v0}, Lezvcard/io/ParseWarnings;-><init>()V

    iput-object v0, p0, Lezvcard/io/StreamReader;->warnings:Lezvcard/io/ParseWarnings;

    .line 52
    new-instance v0, Lezvcard/io/scribe/ScribeIndex;

    invoke-direct {v0}, Lezvcard/io/scribe/ScribeIndex;-><init>()V

    iput-object v0, p0, Lezvcard/io/StreamReader;->index:Lezvcard/io/scribe/ScribeIndex;

    return-void
.end method


# virtual methods
.method protected abstract _readNext()Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected assignLabels(Lezvcard/VCard;Ljava/util/List;)V
    .registers 11
    .param p1, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCard;",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Label;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p2, "labels":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/Label;>;"
    invoke-virtual {p1}, Lezvcard/VCard;->getAddresses()Ljava/util/List;

    move-result-object v1

    .line 94
    .local v1, "adrs":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/Address;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_8
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_49

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lezvcard/property/Label;

    .line 95
    .local v4, "label":Lezvcard/property/Label;
    const/4 v6, 0x1

    .line 96
    .local v6, "orphaned":Z
    invoke-virtual {v4}, Lezvcard/property/Label;->getTypes()Ljava/util/Set;

    move-result-object v5

    .line 97
    .local v5, "labelTypes":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/parameter/AddressType;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_43

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/property/Address;

    .line 98
    .local v0, "adr":Lezvcard/property/Address;
    invoke-virtual {v0}, Lezvcard/property/Address;->getLabel()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_1d

    .line 103
    invoke-virtual {v0}, Lezvcard/property/Address;->getTypes()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7, v5}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 104
    invoke-virtual {v4}, Lezvcard/property/Label;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v0, v7}, Lezvcard/property/Address;->setLabel(Ljava/lang/String;)V

    .line 105
    const/4 v6, 0x0

    .line 109
    .end local v0    # "adr":Lezvcard/property/Address;
    :cond_43
    if-eqz v6, :cond_8

    .line 110
    invoke-virtual {p1, v4}, Lezvcard/VCard;->addOrphanedLabel(Lezvcard/property/Label;)V

    goto :goto_8

    .line 113
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "label":Lezvcard/property/Label;
    .end local v5    # "labelTypes":Ljava/util/Set;, "Ljava/util/Set<Lezvcard/parameter/AddressType;>;"
    .end local v6    # "orphaned":Z
    :cond_49
    return-void
.end method

.method public getScribeIndex()Lezvcard/io/scribe/ScribeIndex;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lezvcard/io/StreamReader;->index:Lezvcard/io/scribe/ScribeIndex;

    return-object v0
.end method

.method public getWarnings()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 150
    iget-object v0, p0, Lezvcard/io/StreamReader;->warnings:Lezvcard/io/ParseWarnings;

    invoke-virtual {v0}, Lezvcard/io/ParseWarnings;->copy()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readAll()Ljava/util/List;
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
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .local v1, "vcards":Ljava/util/List;, "Ljava/util/List<Lezvcard/VCard;>;"
    const/4 v0, 0x0

    .line 62
    .local v0, "vcard":Lezvcard/VCard;
    :goto_6
    invoke-virtual {p0}, Lezvcard/io/StreamReader;->readNext()Lezvcard/VCard;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 63
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 65
    :cond_10
    return-object v1
.end method

.method public readNext()Lezvcard/VCard;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lezvcard/io/StreamReader;->warnings:Lezvcard/io/ParseWarnings;

    invoke-virtual {v0}, Lezvcard/io/ParseWarnings;->clear()V

    .line 75
    invoke-virtual {p0}, Lezvcard/io/StreamReader;->_readNext()Lezvcard/VCard;

    move-result-object v0

    return-object v0
.end method

.method public registerScribe(Lezvcard/io/scribe/VCardPropertyScribe;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/scribe/VCardPropertyScribe",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 125
    .local p1, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    iget-object v0, p0, Lezvcard/io/StreamReader;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v0, p1}, Lezvcard/io/scribe/ScribeIndex;->register(Lezvcard/io/scribe/VCardPropertyScribe;)V

    .line 126
    return-void
.end method

.method public setScribeIndex(Lezvcard/io/scribe/ScribeIndex;)V
    .registers 2
    .param p1, "index"    # Lezvcard/io/scribe/ScribeIndex;

    .prologue
    .line 141
    iput-object p1, p0, Lezvcard/io/StreamReader;->index:Lezvcard/io/scribe/ScribeIndex;

    .line 142
    return-void
.end method
