.class public Lcom/einmalfel/earl/MediaEmbed;
.super Ljava/lang/Object;
.source "MediaEmbed.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "embed"


# instance fields
.field public final height:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final url:Ljava/net/URL;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final values:Ljava/util/Map;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final width:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;)V
    .registers 6
    .param p1, "url"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
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
    .param p4    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p4, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/einmalfel/earl/MediaEmbed;->url:Ljava/net/URL;

    .line 50
    iput-object p2, p0, Lcom/einmalfel/earl/MediaEmbed;->width:Ljava/lang/Integer;

    .line 51
    iput-object p3, p0, Lcom/einmalfel/earl/MediaEmbed;->height:Ljava/lang/Integer;

    .line 52
    invoke-static {p4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaEmbed;->values:Ljava/util/Map;

    .line 53
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaEmbed;
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
    const/4 v7, 0x2

    const/4 v4, 0x0

    .line 29
    const-string v5, "embed"

    invoke-interface {p0, v7, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 30
    const-string v5, ""

    const-string v6, "url"

    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 31
    .local v1, "url":Ljava/lang/String;
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
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 35
    .local v2, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_24
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v5

    if-ne v5, v7, :cond_43

    .line 36
    const-string v5, "param"

    invoke-interface {p0, v7, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 37
    const-string v5, ""

    const-string v6, "name"

    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 38
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    .line 37
    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_24

    .line 41
    :cond_43
    new-instance v7, Lcom/einmalfel/earl/MediaEmbed;

    if-nez v1, :cond_51

    move-object v6, v4

    :goto_48
    if-nez v3, :cond_57

    move-object v5, v4

    .line 42
    :goto_4b
    if-nez v0, :cond_5c

    .line 43
    :goto_4d
    invoke-direct {v7, v6, v5, v4, v2}, Lcom/einmalfel/earl/MediaEmbed;-><init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;)V

    return-object v7

    .line 41
    :cond_51
    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v5

    move-object v6, v5

    goto :goto_48

    .line 42
    :cond_57
    invoke-static {v3}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_4b

    .line 43
    :cond_5c
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_4d
.end method
