.class public Lcom/einmalfel/earl/MediaRating;
.super Ljava/lang/Object;
.source "MediaRating.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "rating"


# instance fields
.field public final scheme:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final value:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/URI;Ljava/lang/String;)V
    .registers 3
    .param p1, "scheme"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/einmalfel/earl/MediaRating;->scheme:Ljava/net/URI;

    .line 29
    iput-object p2, p0, Lcom/einmalfel/earl/MediaRating;->value:Ljava/lang/String;

    .line 30
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaRating;
    .registers 5
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

    .line 22
    const/4 v2, 0x2

    const-string v3, "rating"

    invoke-interface {p0, v2, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 23
    const-string v2, ""

    const-string v3, "uri"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 24
    .local v0, "uri":Ljava/lang/String;
    new-instance v2, Lcom/einmalfel/earl/MediaRating;

    if-nez v0, :cond_1b

    :goto_13
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcom/einmalfel/earl/MediaRating;-><init>(Ljava/net/URI;Ljava/lang/String;)V

    return-object v2

    :cond_1b
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    goto :goto_13
.end method
