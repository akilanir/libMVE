.class public Lezvcard/Ezvcard$WriterChainJson;
.super Lezvcard/Ezvcard$WriterChain;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WriterChainJson"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/Ezvcard$WriterChain",
        "<",
        "Lezvcard/Ezvcard$WriterChainJson;",
        ">;"
    }
.end annotation


# instance fields
.field indent:Z

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

    .line 1703
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$WriterChain;-><init>(Ljava/util/Collection;)V

    .line 1697
    iput-boolean v0, p0, Lezvcard/Ezvcard$WriterChainJson;->prodId:Z

    .line 1698
    iput-boolean v0, p0, Lezvcard/Ezvcard$WriterChainJson;->versionStrict:Z

    .line 1699
    const/4 v0, 0x0

    iput-boolean v0, p0, Lezvcard/Ezvcard$WriterChainJson;->indent:Z

    .line 1700
    new-instance v0, Lezvcard/io/scribe/ScribeIndex;

    invoke-direct {v0}, Lezvcard/io/scribe/ScribeIndex;-><init>()V

    iput-object v0, p0, Lezvcard/Ezvcard$WriterChainJson;->index:Lezvcard/io/scribe/ScribeIndex;

    .line 1704
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/Collection;Lezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/util/Collection;
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 1696
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$WriterChainJson;-><init>(Ljava/util/Collection;)V

    return-void
.end method

.method private go(Lezvcard/io/json/JCardWriter;)V
    .registers 5
    .param p1, "writer"    # Lezvcard/io/json/JCardWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1797
    iget-boolean v2, p0, Lezvcard/Ezvcard$WriterChainJson;->prodId:Z

    invoke-virtual {p1, v2}, Lezvcard/io/json/JCardWriter;->setAddProdId(Z)V

    .line 1798
    iget-boolean v2, p0, Lezvcard/Ezvcard$WriterChainJson;->indent:Z

    invoke-virtual {p1, v2}, Lezvcard/io/json/JCardWriter;->setIndent(Z)V

    .line 1799
    iget-boolean v2, p0, Lezvcard/Ezvcard$WriterChainJson;->versionStrict:Z

    invoke-virtual {p1, v2}, Lezvcard/io/json/JCardWriter;->setVersionStrict(Z)V

    .line 1800
    iget-object v2, p0, Lezvcard/Ezvcard$WriterChainJson;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {p1, v2}, Lezvcard/io/json/JCardWriter;->setScribeIndex(Lezvcard/io/scribe/ScribeIndex;)V

    .line 1802
    :try_start_14
    iget-object v2, p0, Lezvcard/Ezvcard$WriterChainJson;->vcards:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/VCard;

    .line 1803
    .local v1, "vcard":Lezvcard/VCard;
    invoke-virtual {p1, v1}, Lezvcard/io/json/JCardWriter;->write(Lezvcard/VCard;)V

    .line 1804
    invoke-virtual {p1}, Lezvcard/io/json/JCardWriter;->flush()V
    :try_end_2c
    .catchall {:try_start_14 .. :try_end_2c} :catchall_2d

    goto :goto_1a

    .line 1807
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "vcard":Lezvcard/VCard;
    :catchall_2d
    move-exception v2

    invoke-virtual {p1}, Lezvcard/io/json/JCardWriter;->closeJsonStream()V

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_32
    invoke-virtual {p1}, Lezvcard/io/json/JCardWriter;->closeJsonStream()V

    .line 1809
    return-void
.end method


# virtual methods
.method public go()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1755
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 1757
    .local v0, "sw":Ljava/io/StringWriter;
    :try_start_5
    invoke-virtual {p0, v0}, Lezvcard/Ezvcard$WriterChainJson;->go(Ljava/io/Writer;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_8} :catch_d

    .line 1761
    :goto_8
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 1758
    :catch_d
    move-exception v1

    goto :goto_8
.end method

.method public go(Ljava/io/File;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 1779
    new-instance v0, Lezvcard/io/json/JCardWriter;

    iget-object v2, p0, Lezvcard/Ezvcard$WriterChainJson;->vcards:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    if-le v2, v1, :cond_15

    :goto_b
    invoke-direct {v0, p1, v1}, Lezvcard/io/json/JCardWriter;-><init>(Ljava/io/File;Z)V

    .line 1781
    .local v0, "writer":Lezvcard/io/json/JCardWriter;
    :try_start_e
    invoke-direct {p0, v0}, Lezvcard/Ezvcard$WriterChainJson;->go(Lezvcard/io/json/JCardWriter;)V
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_17

    .line 1783
    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 1785
    return-void

    .line 1779
    .end local v0    # "writer":Lezvcard/io/json/JCardWriter;
    :cond_15
    const/4 v1, 0x0

    goto :goto_b

    .line 1783
    .restart local v0    # "writer":Lezvcard/io/json/JCardWriter;
    :catchall_17
    move-exception v1

    invoke-static {v0}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v1
.end method

.method public go(Ljava/io/OutputStream;)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 1770
    new-instance v1, Lezvcard/io/json/JCardWriter;

    iget-object v2, p0, Lezvcard/Ezvcard$WriterChainJson;->vcards:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    if-le v2, v0, :cond_12

    :goto_b
    invoke-direct {v1, p1, v0}, Lezvcard/io/json/JCardWriter;-><init>(Ljava/io/OutputStream;Z)V

    invoke-direct {p0, v1}, Lezvcard/Ezvcard$WriterChainJson;->go(Lezvcard/io/json/JCardWriter;)V

    .line 1771
    return-void

    .line 1770
    :cond_12
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public go(Ljava/io/Writer;)V
    .registers 5
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 1793
    new-instance v1, Lezvcard/io/json/JCardWriter;

    iget-object v2, p0, Lezvcard/Ezvcard$WriterChainJson;->vcards:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v2

    if-le v2, v0, :cond_12

    :goto_b
    invoke-direct {v1, p1, v0}, Lezvcard/io/json/JCardWriter;-><init>(Ljava/io/Writer;Z)V

    invoke-direct {p0, v1}, Lezvcard/Ezvcard$WriterChainJson;->go(Lezvcard/io/json/JCardWriter;)V

    .line 1794
    return-void

    .line 1793
    :cond_12
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public indent(Z)Lezvcard/Ezvcard$WriterChainJson;
    .registers 3
    .param p1, "indent"    # Z

    .prologue
    .line 1724
    iput-boolean p1, p0, Lezvcard/Ezvcard$WriterChainJson;->indent:Z

    .line 1725
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainJson;->this_:Ljava/lang/Object;

    check-cast v0, Lezvcard/Ezvcard$WriterChainJson;

    return-object v0
.end method

.method public prodId(Z)Lezvcard/Ezvcard$WriterChainJson;
    .registers 3
    .param p1, "include"    # Z

    .prologue
    .line 1713
    iput-boolean p1, p0, Lezvcard/Ezvcard$WriterChainJson;->prodId:Z

    .line 1714
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainJson;->this_:Ljava/lang/Object;

    check-cast v0, Lezvcard/Ezvcard$WriterChainJson;

    return-object v0
.end method

.method public register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$WriterChainJson;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/scribe/VCardPropertyScribe",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)",
            "Lezvcard/Ezvcard$WriterChainJson;"
        }
    .end annotation

    .prologue
    .line 1746
    .local p1, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainJson;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v0, p1}, Lezvcard/io/scribe/ScribeIndex;->register(Lezvcard/io/scribe/VCardPropertyScribe;)V

    .line 1747
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainJson;->this_:Ljava/lang/Object;

    check-cast v0, Lezvcard/Ezvcard$WriterChainJson;

    return-object v0
.end method

.method public versionStrict(Z)Lezvcard/Ezvcard$WriterChainJson;
    .registers 3
    .param p1, "versionStrict"    # Z

    .prologue
    .line 1736
    iput-boolean p1, p0, Lezvcard/Ezvcard$WriterChainJson;->versionStrict:Z

    .line 1737
    iget-object v0, p0, Lezvcard/Ezvcard$WriterChainJson;->this_:Ljava/lang/Object;

    check-cast v0, Lezvcard/Ezvcard$WriterChainJson;

    return-object v0
.end method
