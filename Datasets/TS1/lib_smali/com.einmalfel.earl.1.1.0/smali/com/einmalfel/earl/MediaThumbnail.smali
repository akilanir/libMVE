.class public Lcom/einmalfel/earl/MediaThumbnail;
.super Ljava/lang/Object;
.source "MediaThumbnail.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.MediaThumbnail"

.field static final XML_TAG:Ljava/lang/String; = "thumbnail"


# instance fields
.field public final height:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final time:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final url:Ljava/net/URL;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final width:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 5
    .param p1, "url"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "width"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "height"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "time"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/einmalfel/earl/MediaThumbnail;->url:Ljava/net/URL;

    .line 46
    iput-object p2, p0, Lcom/einmalfel/earl/MediaThumbnail;->width:Ljava/lang/Integer;

    .line 47
    iput-object p3, p0, Lcom/einmalfel/earl/MediaThumbnail;->height:Ljava/lang/Integer;

    .line 48
    iput-object p4, p0, Lcom/einmalfel/earl/MediaThumbnail;->time:Ljava/lang/Integer;

    .line 49
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaThumbnail;
    .registers 9
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
    const/4 v4, 0x0

    .line 30
    const/4 v5, 0x2

    const-string v6, "thumbnail"

    invoke-interface {p0, v5, v4, v6}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 31
    const-string v5, ""

    const-string v6, "width"

    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 32
    .local v3, "width":Ljava/lang/String;
    const-string v5, ""

    const-string v6, "height"

    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "height":Ljava/lang/String;
    const-string v5, ""

    const-string v6, "time"

    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 34
    .local v2, "time":Ljava/lang/String;
    new-instance v1, Lcom/einmalfel/earl/MediaThumbnail;

    const-string v5, ""

    const-string v6, "url"

    .line 35
    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v7

    if-nez v3, :cond_3c

    move-object v6, v4

    .line 36
    :goto_30
    if-nez v0, :cond_42

    move-object v5, v4

    .line 37
    :goto_33
    if-nez v2, :cond_47

    .line 38
    :goto_35
    invoke-direct {v1, v7, v6, v5, v4}, Lcom/einmalfel/earl/MediaThumbnail;-><init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 39
    .local v1, "result":Lcom/einmalfel/earl/MediaThumbnail;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 40
    return-object v1

    .line 36
    .end local v1    # "result":Lcom/einmalfel/earl/MediaThumbnail;
    :cond_3c
    invoke-static {v3}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    move-object v6, v5

    goto :goto_30

    .line 37
    :cond_42
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_33

    .line 38
    :cond_47
    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->parseRFC2326NPT(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_35
.end method
