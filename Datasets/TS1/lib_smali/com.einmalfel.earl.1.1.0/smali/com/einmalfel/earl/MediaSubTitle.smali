.class public Lcom/einmalfel/earl/MediaSubTitle;
.super Ljava/lang/Object;
.source "MediaSubTitle.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "subTitle"


# instance fields
.field public final href:Ljava/net/URL;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final lang:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "lang"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "href"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/einmalfel/earl/MediaSubTitle;->type:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/einmalfel/earl/MediaSubTitle;->lang:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lcom/einmalfel/earl/MediaSubTitle;->href:Ljava/net/URL;

    .line 36
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaSubTitle;
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
    new-instance v0, Lcom/einmalfel/earl/MediaSubTitle;

    const-string v1, ""

    const-string v2, "type"

    .line 25
    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    const-string v3, "lang"

    .line 26
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    const-string v4, "href"

    .line 27
    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/einmalfel/earl/MediaSubTitle;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)V

    .line 28
    .local v0, "result":Lcom/einmalfel/earl/MediaSubTitle;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 29
    return-object v0
.end method
