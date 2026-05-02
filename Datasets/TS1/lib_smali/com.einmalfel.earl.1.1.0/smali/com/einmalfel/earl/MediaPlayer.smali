.class public Lcom/einmalfel/earl/MediaPlayer;
.super Ljava/lang/Object;
.source "MediaPlayer.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "player"


# instance fields
.field public final height:Ljava/lang/Integer;
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
.method public constructor <init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 4
    .param p1, "url"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "height"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "width"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/einmalfel/earl/MediaPlayer;->url:Ljava/net/URL;

    .line 37
    iput-object p2, p0, Lcom/einmalfel/earl/MediaPlayer;->height:Ljava/lang/Integer;

    .line 38
    iput-object p3, p0, Lcom/einmalfel/earl/MediaPlayer;->width:Ljava/lang/Integer;

    .line 39
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaPlayer;
    .registers 7
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
    const/4 v3, 0x0

    .line 24
    const/4 v4, 0x2

    const-string v5, "player"

    invoke-interface {p0, v4, v3, v5}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    const-string v4, ""

    const-string v5, "width"

    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 26
    .local v2, "width":Ljava/lang/String;
    const-string v4, ""

    const-string v5, "height"

    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 27
    .local v0, "height":Ljava/lang/String;
    new-instance v1, Lcom/einmalfel/earl/MediaPlayer;

    const-string v4, ""

    const-string v5, "url"

    .line 28
    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v5

    if-nez v2, :cond_31

    move-object v4, v3

    .line 29
    :goto_28
    if-nez v0, :cond_36

    .line 30
    :goto_2a
    invoke-direct {v1, v5, v4, v3}, Lcom/einmalfel/earl/MediaPlayer;-><init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 31
    .local v1, "result":Lcom/einmalfel/earl/MediaPlayer;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 32
    return-object v1

    .line 29
    .end local v1    # "result":Lcom/einmalfel/earl/MediaPlayer;
    :cond_31
    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_28

    .line 30
    :cond_36
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_2a
.end method
