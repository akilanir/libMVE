.class public Lcom/einmalfel/earl/ItunesCategory;
.super Ljava/lang/Object;
.source "ItunesCategory.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "category"


# instance fields
.field public final subCategories:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/ItunesCategory;",
            ">;"
        }
    .end annotation
.end field

.field public final text:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/ItunesCategory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p2, "subCategories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/ItunesCategory;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/einmalfel/earl/ItunesCategory;->text:Ljava/lang/String;

    .line 34
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/ItunesCategory;->subCategories:Ljava/util/List;

    .line 35
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/ItunesCategory;
    .registers 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 23
    const/4 v2, 0x2

    const/4 v3, 0x0

    const-string v4, "category"

    invoke-interface {p0, v2, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 24
    const-string v2, ""

    const-string v3, "text"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 25
    .local v1, "value":Ljava/lang/String;
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 26
    .local v0, "subCategories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/ItunesCategory;>;"
    :goto_14
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_23

    .line 27
    invoke-static {p0}, Lcom/einmalfel/earl/ItunesCategory;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/ItunesCategory;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_14

    .line 29
    :cond_23
    new-instance v2, Lcom/einmalfel/earl/ItunesCategory;

    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/einmalfel/earl/ItunesCategory;-><init>(Ljava/lang/String;Ljava/util/List;)V

    return-object v2
.end method
