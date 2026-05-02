.class public Lcom/einmalfel/earl/MediaLicense;
.super Ljava/lang/Object;
.source "MediaLicense.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "license"


# instance fields
.field public final href:Ljava/net/URL;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final value:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/net/URL;Ljava/lang/String;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "href"    # Ljava/net/URL;
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
    iput-object p1, p0, Lcom/einmalfel/earl/MediaLicense;->type:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lcom/einmalfel/earl/MediaLicense;->href:Ljava/net/URL;

    .line 34
    iput-object p3, p0, Lcom/einmalfel/earl/MediaLicense;->value:Ljava/lang/String;

    .line 35
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaLicense;
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
    .line 24
    const-string v1, ""

    const-string v2, "href"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 25
    .local v0, "href":Ljava/lang/String;
    new-instance v2, Lcom/einmalfel/earl/MediaLicense;

    const-string v1, ""

    const-string v3, "type"

    .line 26
    invoke-interface {p0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v0, :cond_1d

    const/4 v1, 0x0

    .line 28
    :goto_15
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4}, Lcom/einmalfel/earl/MediaLicense;-><init>(Ljava/lang/String;Ljava/net/URL;Ljava/lang/String;)V

    return-object v2

    .line 27
    :cond_1d
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    goto :goto_15
.end method
