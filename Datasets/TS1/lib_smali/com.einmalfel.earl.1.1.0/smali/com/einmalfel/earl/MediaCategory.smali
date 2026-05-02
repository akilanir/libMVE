.class public Lcom/einmalfel/earl/MediaCategory;
.super Ljava/lang/Object;
.source "MediaCategory.java"


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

.field public final value:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "scheme"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "label"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/einmalfel/earl/MediaCategory;->scheme:Ljava/net/URI;

    .line 33
    iput-object p2, p0, Lcom/einmalfel/earl/MediaCategory;->label:Ljava/lang/String;

    .line 34
    iput-object p3, p0, Lcom/einmalfel/earl/MediaCategory;->value:Ljava/lang/String;

    .line 35
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCategory;
    .registers 6
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
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x2

    const-string v3, "category"

    invoke-interface {p0, v2, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    const-string v2, ""

    const-string v3, "scheme"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "scheme":Ljava/lang/String;
    new-instance v2, Lcom/einmalfel/earl/MediaCategory;

    if-nez v0, :cond_23

    :goto_13
    const-string v3, ""

    const-string v4, "label"

    .line 27
    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 28
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v1, v3, v4}, Lcom/einmalfel/earl/MediaCategory;-><init>(Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    .line 26
    :cond_23
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    goto :goto_13
.end method
