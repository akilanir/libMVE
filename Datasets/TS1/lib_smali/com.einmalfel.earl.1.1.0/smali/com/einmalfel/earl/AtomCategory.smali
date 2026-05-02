.class public Lcom/einmalfel/earl/AtomCategory;
.super Lcom/einmalfel/earl/AtomCommonAttributes;
.source "AtomCategory.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "category"


# instance fields
.field public final label:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final scheme:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final term:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/lang/String;Ljava/net/URI;Ljava/lang/String;)V
    .registers 5
    .param p1, "atomCommonAttributes"    # Lcom/einmalfel/earl/AtomCommonAttributes;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "term"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "scheme"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "label"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 39
    iput-object p2, p0, Lcom/einmalfel/earl/AtomCategory;->term:Ljava/lang/String;

    .line 40
    iput-object p3, p0, Lcom/einmalfel/earl/AtomCategory;->scheme:Ljava/net/URI;

    .line 41
    iput-object p4, p0, Lcom/einmalfel/earl/AtomCategory;->label:Ljava/lang/String;

    .line 42
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomCategory;
    .registers 8
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 25
    const/4 v3, 0x2

    const-string v4, "category"

    invoke-interface {p0, v3, v2, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 26
    const-string v3, ""

    const-string v4, "scheme"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 27
    .local v1, "schemeString":Ljava/lang/String;
    new-instance v0, Lcom/einmalfel/earl/AtomCategory;

    new-instance v3, Lcom/einmalfel/earl/AtomCommonAttributes;

    invoke-direct {v3, p0}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    const-string v4, ""

    const-string v5, "term"

    .line 29
    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v1, :cond_33

    .line 30
    :goto_24
    const-string v5, ""

    const-string v6, "label"

    .line 31
    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v3, v4, v2, v5}, Lcom/einmalfel/earl/AtomCategory;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/lang/String;Ljava/net/URI;Ljava/lang/String;)V

    .line 32
    .local v0, "result":Lcom/einmalfel/earl/AtomCategory;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 33
    return-object v0

    .line 30
    .end local v0    # "result":Lcom/einmalfel/earl/AtomCategory;
    :cond_33
    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    goto :goto_24
.end method
