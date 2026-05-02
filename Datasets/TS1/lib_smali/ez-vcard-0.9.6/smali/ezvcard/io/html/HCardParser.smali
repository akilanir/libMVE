.class public Lezvcard/io/html/HCardParser;
.super Lezvcard/io/StreamReader;
.source "HCardParser.java"


# instance fields
.field private categories:Lezvcard/property/Categories;

.field private final categoriesName:Ljava/lang/String;

.field private final emailName:Ljava/lang/String;

.field private embeddedVCards:Lorg/jsoup/select/Elements;

.field private final labels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lezvcard/property/Label;",
            ">;"
        }
    .end annotation
.end field

.field private nickname:Lezvcard/property/Nickname;

.field private final pageUrl:Ljava/lang/String;

.field private final telName:Ljava/lang/String;

.field private final urlPropertyName:Ljava/lang/String;

.field private vcard:Lezvcard/VCard;

.field private final vcardElements:Lorg/jsoup/select/Elements;

.field private final vcardElementsIt:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/html/HCardParser;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "pageUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 150
    if-nez p2, :cond_d

    const-string v0, ""

    invoke-static {p1, v1, v0}, Lorg/jsoup/Jsoup;->parse(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    :goto_9
    invoke-direct {p0, v0, p2}, Lezvcard/io/html/HCardParser;-><init>(Lorg/jsoup/nodes/Document;Ljava/lang/String;)V

    .line 151
    return-void

    .line 150
    :cond_d
    invoke-static {p1, v1, p2}, Lorg/jsoup/Jsoup;->parse(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/html/HCardParser;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 120
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "pageUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 130
    if-nez p2, :cond_d

    const-string v0, ""

    invoke-static {p1, v1, v0}, Lorg/jsoup/Jsoup;->parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    :goto_9
    invoke-direct {p0, v0, p2}, Lezvcard/io/html/HCardParser;-><init>(Lorg/jsoup/nodes/Document;Ljava/lang/String;)V

    .line 131
    return-void

    .line 130
    :cond_d
    invoke-static {p1, v1, p2}, Lorg/jsoup/Jsoup;->parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 159
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/html/HCardParser;-><init>(Ljava/io/Reader;Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Ljava/lang/String;)V
    .registers 4
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "pageUrl"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-static {p1}, Lezvcard/util/IOUtils;->toString(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lezvcard/io/html/HCardParser;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 178
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/html/HCardParser;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "html"    # Ljava/lang/String;
    .param p2, "pageUrl"    # Ljava/lang/String;

    .prologue
    .line 188
    if-nez p2, :cond_a

    invoke-static {p1}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    :goto_6
    invoke-direct {p0, v0, p2}, Lezvcard/io/html/HCardParser;-><init>(Lorg/jsoup/nodes/Document;Ljava/lang/String;)V

    .line 189
    return-void

    .line 188
    :cond_a
    invoke-static {p1, p2}, Lorg/jsoup/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    goto :goto_6
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .registers 4
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    const/16 v0, 0x7530

    invoke-static {p1, v0}, Lorg/jsoup/Jsoup;->parse(Ljava/net/URL;I)Lorg/jsoup/nodes/Document;

    move-result-object v0

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lezvcard/io/html/HCardParser;-><init>(Lorg/jsoup/nodes/Document;Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Lorg/jsoup/nodes/Document;)V
    .registers 3
    .param p1, "document"    # Lorg/jsoup/nodes/Document;

    .prologue
    .line 196
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/io/html/HCardParser;-><init>(Lorg/jsoup/nodes/Document;Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public constructor <init>(Lorg/jsoup/nodes/Document;Ljava/lang/String;)V
    .registers 9
    .param p1, "document"    # Lorg/jsoup/nodes/Document;
    .param p2, "pageUrl"    # Ljava/lang/String;

    .prologue
    .line 205
    invoke-direct {p0}, Lezvcard/io/StreamReader;-><init>()V

    .line 92
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lezvcard/io/html/HCardParser;->labels:Ljava/util/List;

    .line 95
    new-instance v4, Lorg/jsoup/select/Elements;

    invoke-direct {v4}, Lorg/jsoup/select/Elements;-><init>()V

    iput-object v4, p0, Lezvcard/io/html/HCardParser;->embeddedVCards:Lorg/jsoup/select/Elements;

    .line 99
    iget-object v4, p0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v5, Lezvcard/property/Url;

    invoke-virtual {v4, v5}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v4

    invoke-virtual {v4}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lezvcard/io/html/HCardParser;->urlPropertyName:Ljava/lang/String;

    .line 100
    iget-object v4, p0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v5, Lezvcard/property/Categories;

    invoke-virtual {v4, v5}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v4

    invoke-virtual {v4}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lezvcard/io/html/HCardParser;->categoriesName:Ljava/lang/String;

    .line 101
    iget-object v4, p0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v5, Lezvcard/property/Email;

    invoke-virtual {v4, v5}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v4

    invoke-virtual {v4}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lezvcard/io/html/HCardParser;->emailName:Ljava/lang/String;

    .line 102
    iget-object v4, p0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v5, Lezvcard/property/Telephone;

    invoke-virtual {v4, v5}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v4

    invoke-virtual {v4}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lezvcard/io/html/HCardParser;->telName:Ljava/lang/String;

    .line 206
    iput-object p2, p0, Lezvcard/io/html/HCardParser;->pageUrl:Ljava/lang/String;

    .line 208
    const/4 v0, 0x0

    .line 209
    .local v0, "anchor":Ljava/lang/String;
    if-eqz p2, :cond_67

    .line 211
    :try_start_5e
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 212
    .local v3, "url":Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->getRef()Ljava/lang/String;
    :try_end_66
    .catch Ljava/net/MalformedURLException; {:try_start_5e .. :try_end_66} :catch_82

    move-result-object v0

    .line 218
    .end local v3    # "url":Ljava/net/URL;
    :cond_67
    :goto_67
    const/4 v2, 0x0

    .line 219
    .local v2, "searchUnder":Lorg/jsoup/nodes/Element;
    if-eqz v0, :cond_6e

    .line 220
    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Document;->getElementById(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v2

    .line 222
    :cond_6e
    if-nez v2, :cond_71

    .line 223
    move-object v2, p1

    .line 225
    :cond_71
    const-string v4, "vcard"

    invoke-virtual {v2, v4}, Lorg/jsoup/nodes/Element;->getElementsByClass(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    iput-object v4, p0, Lezvcard/io/html/HCardParser;->vcardElements:Lorg/jsoup/select/Elements;

    .line 226
    iget-object v4, p0, Lezvcard/io/html/HCardParser;->vcardElements:Lorg/jsoup/select/Elements;

    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v4

    iput-object v4, p0, Lezvcard/io/html/HCardParser;->vcardElementsIt:Ljava/util/Iterator;

    .line 227
    return-void

    .line 213
    .end local v2    # "searchUnder":Lorg/jsoup/nodes/Element;
    :catch_82
    move-exception v1

    .line 214
    .local v1, "e":Ljava/net/MalformedURLException;
    const/4 v0, 0x0

    goto :goto_67
.end method

.method private constructor <init>(Lorg/jsoup/nodes/Element;Ljava/lang/String;)V
    .registers 6
    .param p1, "embeddedVCard"    # Lorg/jsoup/nodes/Element;
    .param p2, "pageUrl"    # Ljava/lang/String;

    .prologue
    .line 234
    invoke-direct {p0}, Lezvcard/io/StreamReader;-><init>()V

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lezvcard/io/html/HCardParser;->labels:Ljava/util/List;

    .line 95
    new-instance v0, Lorg/jsoup/select/Elements;

    invoke-direct {v0}, Lorg/jsoup/select/Elements;-><init>()V

    iput-object v0, p0, Lezvcard/io/html/HCardParser;->embeddedVCards:Lorg/jsoup/select/Elements;

    .line 99
    iget-object v0, p0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v1, Lezvcard/property/Url;

    invoke-virtual {v0, v1}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/html/HCardParser;->urlPropertyName:Ljava/lang/String;

    .line 100
    iget-object v0, p0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v1, Lezvcard/property/Categories;

    invoke-virtual {v0, v1}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/html/HCardParser;->categoriesName:Ljava/lang/String;

    .line 101
    iget-object v0, p0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v1, Lezvcard/property/Email;

    invoke-virtual {v0, v1}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/html/HCardParser;->emailName:Ljava/lang/String;

    .line 102
    iget-object v0, p0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v1, Lezvcard/property/Telephone;

    invoke-virtual {v0, v1}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/html/HCardParser;->telName:Ljava/lang/String;

    .line 235
    iput-object p2, p0, Lezvcard/io/html/HCardParser;->pageUrl:Ljava/lang/String;

    .line 236
    new-instance v0, Lorg/jsoup/select/Elements;

    const/4 v1, 0x1

    new-array v1, v1, [Lorg/jsoup/nodes/Element;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {v0, v1}, Lorg/jsoup/select/Elements;-><init>([Lorg/jsoup/nodes/Element;)V

    iput-object v0, p0, Lezvcard/io/html/HCardParser;->vcardElements:Lorg/jsoup/select/Elements;

    .line 237
    iget-object v0, p0, Lezvcard/io/html/HCardParser;->vcardElements:Lorg/jsoup/select/Elements;

    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/html/HCardParser;->vcardElementsIt:Ljava/util/Iterator;

    .line 238
    return-void
.end method

.method private parseVCardElement(Lorg/jsoup/nodes/Element;)V
    .registers 6
    .param p1, "vcardElement"    # Lorg/jsoup/nodes/Element;

    .prologue
    const/4 v3, 0x0

    .line 270
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->labels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 271
    iput-object v3, p0, Lezvcard/io/html/HCardParser;->nickname:Lezvcard/property/Nickname;

    .line 272
    iput-object v3, p0, Lezvcard/io/html/HCardParser;->categories:Lezvcard/property/Categories;

    .line 274
    new-instance v2, Lezvcard/VCard;

    invoke-direct {v2}, Lezvcard/VCard;-><init>()V

    iput-object v2, p0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    .line 275
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    sget-object v3, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    invoke-virtual {v2, v3}, Lezvcard/VCard;->setVersion(Lezvcard/VCardVersion;)V

    .line 276
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->pageUrl:Ljava/lang/String;

    if-eqz v2, :cond_23

    .line 277
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    iget-object v3, p0, Lezvcard/io/html/HCardParser;->pageUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lezvcard/VCard;->addSource(Ljava/lang/String;)Lezvcard/property/Source;

    .line 281
    :cond_23
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 282
    .local v0, "child":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v0}, Lezvcard/io/html/HCardParser;->visit(Lorg/jsoup/nodes/Element;)V

    goto :goto_2b

    .line 286
    .end local v0    # "child":Lorg/jsoup/nodes/Element;
    :cond_3b
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    iget-object v3, p0, Lezvcard/io/html/HCardParser;->labels:Ljava/util/List;

    invoke-virtual {p0, v2, v3}, Lezvcard/io/html/HCardParser;->assignLabels(Lezvcard/VCard;Ljava/util/List;)V

    .line 287
    return-void
.end method

.method private visit(Lorg/jsoup/nodes/Element;)V
    .registers 29
    .param p1, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 290
    const/16 v19, 0x1

    .line 291
    .local v19, "visitChildren":Z
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v7

    .line 292
    .local v7, "classNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_a
    :goto_a
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_2e2

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 293
    .local v6, "className":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 296
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->urlPropertyName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_54

    .line 297
    const-string v21, "href"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 298
    .local v11, "href":Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v21

    if-lez v21, :cond_54

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->emailName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v7, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_e0

    const-string v21, "(?i)mailto:.*"

    move-object/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_e0

    .line 300
    move-object/from16 v0, p0

    iget-object v6, v0, Lezvcard/io/html/HCardParser;->emailName:Ljava/lang/String;

    .line 323
    .end local v11    # "href":Ljava/lang/String;
    :cond_54
    :goto_54
    const-string v21, "category"

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_62

    .line 324
    move-object/from16 v0, p0

    iget-object v6, v0, Lezvcard/io/html/HCardParser;->categoriesName:Ljava/lang/String;

    .line 327
    :cond_62
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/String;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v18

    .line 328
    .local v18, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    if-nez v18, :cond_81

    .line 330
    const-string v21, "x-"

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_a

    .line 333
    new-instance v18, Lezvcard/io/scribe/RawPropertyScribe;

    .end local v18    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    move-object/from16 v0, v18

    invoke-direct {v0, v6}, Lezvcard/io/scribe/RawPropertyScribe;-><init>(Ljava/lang/String;)V

    .line 338
    .restart local v18    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :cond_81
    :try_start_81
    new-instance v21, Lezvcard/io/html/HCardElement;

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lezvcard/io/html/HCardElement;-><init>(Lorg/jsoup/nodes/Element;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lezvcard/io/scribe/VCardPropertyScribe;->parseHtml(Lezvcard/io/html/HCardElement;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v17

    .line 340
    .local v17, "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    invoke-virtual/range {v17 .. v17}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getWarnings()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_9a
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_157

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 341
    .local v20, "warning":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v6, v2}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b7
    .catch Lezvcard/io/SkipMeException; {:try_start_81 .. :try_end_b7} :catch_b8
    .catch Lezvcard/io/CannotParseException; {:try_start_81 .. :try_end_b7} :catch_174
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_81 .. :try_end_b7} :catch_1e2

    goto :goto_9a

    .line 375
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    .end local v20    # "warning":Ljava/lang/String;
    :catch_b8
    move-exception v8

    .line 376
    .local v8, "e":Lezvcard/io/SkipMeException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x16

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual {v8}, Lezvcard/io/SkipMeException;->getMessage()Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move/from16 v2, v23

    move-object/from16 v3, v24

    invoke-virtual {v0, v1, v6, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto/16 :goto_a

    .line 301
    .end local v8    # "e":Lezvcard/io/SkipMeException;
    .end local v18    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    .restart local v11    # "href":Ljava/lang/String;
    :cond_e0
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->telName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v7, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_fe

    const-string v21, "(?i)tel:.*"

    move-object/from16 v0, v21

    invoke-virtual {v11, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_fe

    .line 302
    move-object/from16 v0, p0

    iget-object v6, v0, Lezvcard/io/html/HCardParser;->telName:Ljava/lang/String;

    goto/16 :goto_54

    .line 305
    :cond_fe
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->index:Lezvcard/io/scribe/ScribeIndex;

    move-object/from16 v21, v0

    const-class v22, Lezvcard/property/Impp;

    invoke-virtual/range {v21 .. v22}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v18

    .line 307
    .restart local v18    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :try_start_10a
    new-instance v21, Lezvcard/io/html/HCardElement;

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lezvcard/io/html/HCardElement;-><init>(Lorg/jsoup/nodes/Element;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lezvcard/io/scribe/VCardPropertyScribe;->parseHtml(Lezvcard/io/html/HCardElement;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v17

    .line 308
    .restart local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    move-object/from16 v21, v0

    invoke-virtual/range {v17 .. v17}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 309
    invoke-virtual/range {v17 .. v17}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getWarnings()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14    # "i$":Ljava/util/Iterator;
    :goto_130
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_a

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 310
    .restart local v20    # "warning":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v18 .. v18}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_153
    .catch Lezvcard/io/SkipMeException; {:try_start_10a .. :try_end_153} :catch_154
    .catch Lezvcard/io/CannotParseException; {:try_start_10a .. :try_end_153} :catch_2ff

    goto :goto_130

    .line 313
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    .end local v20    # "warning":Ljava/lang/String;
    :catch_154
    move-exception v21

    goto/16 :goto_54

    .line 344
    .end local v11    # "href":Ljava/lang/String;
    .restart local v14    # "i$":Ljava/util/Iterator;
    .restart local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :cond_157
    :try_start_157
    invoke-virtual/range {v17 .. v17}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v16

    .line 347
    .local v16, "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, v16

    instance-of v0, v0, Lezvcard/property/Label;

    move/from16 v21, v0

    if-eqz v21, :cond_1b8

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->labels:Ljava/util/List;

    move-object/from16 v21, v0

    check-cast v16, Lezvcard/property/Label;

    .end local v16    # "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_172
    .catch Lezvcard/io/SkipMeException; {:try_start_157 .. :try_end_172} :catch_b8
    .catch Lezvcard/io/CannotParseException; {:try_start_157 .. :try_end_172} :catch_174
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_157 .. :try_end_172} :catch_1e2

    goto/16 :goto_a

    .line 378
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :catch_174
    move-exception v8

    .line 379
    .local v8, "e":Lezvcard/io/CannotParseException;
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object v12

    .line 380
    .local v12, "html":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x20

    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput-object v12, v24, v25

    const/16 v25, 0x1

    invoke-virtual {v8}, Lezvcard/io/CannotParseException;->getMessage()Ljava/lang/String;

    move-result-object v26

    aput-object v26, v24, v25

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move/from16 v2, v23

    move-object/from16 v3, v24

    invoke-virtual {v0, v1, v6, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 381
    new-instance v16, Lezvcard/property/RawProperty;

    move-object/from16 v0, v16

    invoke-direct {v0, v6, v12}, Lezvcard/property/RawProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    .end local v8    # "e":Lezvcard/io/CannotParseException;
    .end local v12    # "html":Ljava/lang/String;
    .restart local v16    # "property":Lezvcard/property/VCardProperty;
    :cond_1a9
    :goto_1a9
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    goto/16 :goto_a

    .line 353
    .restart local v14    # "i$":Ljava/util/Iterator;
    .restart local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :cond_1b8
    :try_start_1b8
    move-object/from16 v0, v16

    instance-of v0, v0, Lezvcard/property/Nickname;

    move/from16 v21, v0

    if-eqz v21, :cond_263

    .line 354
    move-object/from16 v0, v16

    check-cast v0, Lezvcard/property/Nickname;

    move-object v15, v0

    .line 355
    .local v15, "nn":Lezvcard/property/Nickname;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->nickname:Lezvcard/property/Nickname;

    move-object/from16 v21, v0

    if-nez v21, :cond_250

    .line 356
    move-object/from16 v0, p0

    iput-object v15, v0, Lezvcard/io/html/HCardParser;->nickname:Lezvcard/property/Nickname;

    .line 357
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->nickname:Lezvcard/property/Nickname;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V
    :try_end_1e0
    .catch Lezvcard/io/SkipMeException; {:try_start_1b8 .. :try_end_1e0} :catch_b8
    .catch Lezvcard/io/CannotParseException; {:try_start_1b8 .. :try_end_1e0} :catch_174
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_1b8 .. :try_end_1e0} :catch_1e2

    goto/16 :goto_a

    .line 382
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v15    # "nn":Lezvcard/property/Nickname;
    .end local v16    # "property":Lezvcard/property/VCardProperty;
    .end local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :catch_1e2
    move-exception v8

    .line 383
    .local v8, "e":Lezvcard/io/EmbeddedVCardException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->embeddedVCards:Lorg/jsoup/select/Elements;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lezvcard/util/HtmlUtils;->isChildOf(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)Z

    move-result v21

    if-nez v21, :cond_a

    .line 388
    invoke-virtual {v8}, Lezvcard/io/EmbeddedVCardException;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v16

    .line 390
    .restart local v16    # "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->embeddedVCards:Lorg/jsoup/select/Elements;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->add(Lorg/jsoup/nodes/Element;)Z

    .line 391
    new-instance v9, Lezvcard/io/html/HCardParser;

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->pageUrl:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-direct {v9, v0, v1}, Lezvcard/io/html/HCardParser;-><init>(Lorg/jsoup/nodes/Element;Ljava/lang/String;)V

    .line 393
    .local v9, "embeddedReader":Lezvcard/io/html/HCardParser;
    :try_start_213
    invoke-virtual {v9}, Lezvcard/io/html/HCardParser;->readNext()Lezvcard/VCard;

    move-result-object v10

    .line 394
    .local v10, "embeddedVCard":Lezvcard/VCard;
    invoke-virtual {v8, v10}, Lezvcard/io/EmbeddedVCardException;->injectVCard(Lezvcard/VCard;)V
    :try_end_21a
    .catchall {:try_start_213 .. :try_end_21a} :catchall_2a7

    .line 396
    invoke-virtual {v9}, Lezvcard/io/html/HCardParser;->getWarnings()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14    # "i$":Ljava/util/Iterator;
    :goto_222
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_2a0

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 397
    .restart local v20    # "warning":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x1a

    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    aput-object v20, v24, v25

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move/from16 v2, v23

    move-object/from16 v3, v24

    invoke-virtual {v0, v1, v6, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_222

    .line 359
    .end local v8    # "e":Lezvcard/io/EmbeddedVCardException;
    .end local v9    # "embeddedReader":Lezvcard/io/html/HCardParser;
    .end local v10    # "embeddedVCard":Lezvcard/VCard;
    .end local v20    # "warning":Ljava/lang/String;
    .restart local v15    # "nn":Lezvcard/property/Nickname;
    .restart local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :cond_250
    :try_start_250
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->nickname:Lezvcard/property/Nickname;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lezvcard/property/Nickname;->getValues()Ljava/util/List;

    move-result-object v21

    invoke-virtual {v15}, Lezvcard/property/Nickname;->getValues()Ljava/util/List;

    move-result-object v22

    invoke-interface/range {v21 .. v22}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_a

    .line 365
    .end local v15    # "nn":Lezvcard/property/Nickname;
    :cond_263
    move-object/from16 v0, v16

    instance-of v0, v0, Lezvcard/property/Categories;

    move/from16 v21, v0

    if-eqz v21, :cond_1a9

    .line 366
    move-object/from16 v0, v16

    check-cast v0, Lezvcard/property/Categories;

    move-object v4, v0

    .line 367
    .local v4, "c":Lezvcard/property/Categories;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->categories:Lezvcard/property/Categories;

    move-object/from16 v21, v0

    if-nez v21, :cond_28d

    .line 368
    move-object/from16 v0, p0

    iput-object v4, v0, Lezvcard/io/html/HCardParser;->categories:Lezvcard/property/Categories;

    .line 369
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->categories:Lezvcard/property/Categories;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    goto/16 :goto_a

    .line 371
    :cond_28d
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->categories:Lezvcard/property/Categories;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lezvcard/property/Categories;->getValues()Ljava/util/List;

    move-result-object v21

    invoke-virtual {v4}, Lezvcard/property/Categories;->getValues()Ljava/util/List;

    move-result-object v22

    invoke-interface/range {v21 .. v22}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_29e
    .catch Lezvcard/io/SkipMeException; {:try_start_250 .. :try_end_29e} :catch_b8
    .catch Lezvcard/io/CannotParseException; {:try_start_250 .. :try_end_29e} :catch_174
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_250 .. :try_end_29e} :catch_1e2

    goto/16 :goto_a

    .line 399
    .end local v4    # "c":Lezvcard/property/Categories;
    .end local v17    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    .restart local v8    # "e":Lezvcard/io/EmbeddedVCardException;
    .restart local v9    # "embeddedReader":Lezvcard/io/html/HCardParser;
    .restart local v10    # "embeddedVCard":Lezvcard/VCard;
    :cond_2a0
    invoke-static {v9}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 401
    const/16 v19, 0x0

    goto/16 :goto_1a9

    .line 396
    .end local v10    # "embeddedVCard":Lezvcard/VCard;
    .end local v14    # "i$":Ljava/util/Iterator;
    :catchall_2a7
    move-exception v21

    invoke-virtual {v9}, Lezvcard/io/html/HCardParser;->getWarnings()Ljava/util/List;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :goto_2b0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_2de

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 397
    .restart local v20    # "warning":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/html/HCardParser;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    const/16 v24, 0x1a

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v20, v25, v26

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v24

    move-object/from16 v3, v25

    invoke-virtual {v0, v1, v6, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_2b0

    .line 399
    .end local v20    # "warning":Ljava/lang/String;
    :cond_2de
    invoke-static {v9}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v21

    .line 407
    .end local v6    # "className":Ljava/lang/String;
    .end local v8    # "e":Lezvcard/io/EmbeddedVCardException;
    .end local v9    # "embeddedReader":Lezvcard/io/html/HCardParser;
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v16    # "property":Lezvcard/property/VCardProperty;
    .end local v18    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :cond_2e2
    if-eqz v19, :cond_2fe

    .line 408
    invoke-virtual/range {p1 .. p1}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13    # "i$":Ljava/util/Iterator;
    :goto_2ec
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_2fe

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Element;

    .line 409
    .local v5, "child":Lorg/jsoup/nodes/Element;
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lezvcard/io/html/HCardParser;->visit(Lorg/jsoup/nodes/Element;)V

    goto :goto_2ec

    .line 412
    .end local v5    # "child":Lorg/jsoup/nodes/Element;
    .end local v13    # "i$":Ljava/util/Iterator;
    :cond_2fe
    return-void

    .line 315
    .restart local v6    # "className":Ljava/lang/String;
    .restart local v11    # "href":Ljava/lang/String;
    .restart local v18    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :catch_2ff
    move-exception v21

    goto/16 :goto_54
.end method


# virtual methods
.method protected _readNext()Lezvcard/VCard;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 252
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->vcardElementsIt:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_a

    .line 266
    :cond_9
    :goto_9
    return-object v1

    .line 257
    :cond_a
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->vcardElementsIt:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 258
    .local v0, "vcardElement":Lorg/jsoup/nodes/Element;
    :goto_12
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->vcardElements:Lorg/jsoup/select/Elements;

    invoke-static {v0, v2}, Lezvcard/util/HtmlUtils;->isChildOf(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 259
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->vcardElementsIt:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 262
    iget-object v2, p0, Lezvcard/io/html/HCardParser;->vcardElementsIt:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "vcardElement":Lorg/jsoup/nodes/Element;
    check-cast v0, Lorg/jsoup/nodes/Element;

    .restart local v0    # "vcardElement":Lorg/jsoup/nodes/Element;
    goto :goto_12

    .line 265
    :cond_2b
    invoke-direct {p0, v0}, Lezvcard/io/html/HCardParser;->parseVCardElement(Lorg/jsoup/nodes/Element;)V

    .line 266
    iget-object v1, p0, Lezvcard/io/html/HCardParser;->vcard:Lezvcard/VCard;

    goto :goto_9
.end method

.method public close()V
    .registers 1

    .prologue
    .line 416
    return-void
.end method

.method public readNext()Lezvcard/VCard;
    .registers 3

    .prologue
    .line 243
    :try_start_0
    invoke-super {p0}, Lezvcard/io/StreamReader;->readNext()Lezvcard/VCard;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 244
    :catch_5
    move-exception v0

    .line 246
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
