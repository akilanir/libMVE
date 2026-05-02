.class public Lcom/einmalfel/earl/RSSImage;
.super Ljava/lang/Object;
.source "RSSImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/RSSImage$ST;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.RSSImage"

.field static final XML_TAG:Ljava/lang/String; = "image"


# instance fields
.field public final description:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final height:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final link:Ljava/net/URL;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final title:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
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
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 7
    .param p1, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "description"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "link"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "url"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "width"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "height"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/einmalfel/earl/RSSImage;->title:Ljava/lang/String;

    .line 59
    iput-object p2, p0, Lcom/einmalfel/earl/RSSImage;->description:Ljava/lang/String;

    .line 60
    iput-object p3, p0, Lcom/einmalfel/earl/RSSImage;->link:Ljava/net/URL;

    .line 61
    iput-object p4, p0, Lcom/einmalfel/earl/RSSImage;->url:Ljava/net/URL;

    .line 62
    iput-object p5, p0, Lcom/einmalfel/earl/RSSImage;->width:Ljava/lang/Integer;

    .line 63
    iput-object p6, p0, Lcom/einmalfel/earl/RSSImage;->height:Ljava/lang/Integer;

    .line 64
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSImage;
    .registers 11
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
    const/4 v6, 0x0

    const/4 v3, 0x2

    .line 36
    const-string v0, ""

    const-string v1, "image"

    invoke-interface {p0, v3, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 37
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 38
    .local v8, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/einmalfel/earl/RSSImage$ST;Ljava/lang/String;>;"
    :goto_e
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0

    if-ne v0, v3, :cond_48

    .line 40
    :try_start_14
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/einmalfel/earl/RSSImage$ST;->valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/RSSImage$ST;

    move-result-object v0

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v8, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/IllegalArgumentException; {:try_start_14 .. :try_end_23} :catch_27

    .line 45
    :goto_23
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_e

    .line 41
    :catch_27
    move-exception v7

    .line 42
    .local v7, "ignored":Ljava/lang/IllegalArgumentException;
    const-string v0, "Earl.RSSImage"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown RSS image tag "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_23

    .line 47
    .end local v7    # "ignored":Ljava/lang/IllegalArgumentException;
    :cond_48
    new-instance v0, Lcom/einmalfel/earl/RSSImage;

    sget-object v1, Lcom/einmalfel/earl/RSSImage$ST;->title:Lcom/einmalfel/earl/RSSImage$ST;

    .line 48
    invoke-interface {v8, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/einmalfel/earl/RSSImage$ST;->description:Lcom/einmalfel/earl/RSSImage$ST;

    .line 49
    invoke-interface {v8, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Lcom/einmalfel/earl/RSSImage$ST;->link:Lcom/einmalfel/earl/RSSImage$ST;

    .line 50
    invoke-interface {v8, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    sget-object v4, Lcom/einmalfel/earl/RSSImage$ST;->url:Lcom/einmalfel/earl/RSSImage$ST;

    .line 51
    invoke-interface {v8, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    sget-object v5, Lcom/einmalfel/earl/RSSImage$ST;->width:Lcom/einmalfel/earl/RSSImage$ST;

    .line 52
    invoke-interface {v8, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a2

    sget-object v5, Lcom/einmalfel/earl/RSSImage$ST;->width:Lcom/einmalfel/earl/RSSImage$ST;

    invoke-interface {v8, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    :goto_8a
    sget-object v9, Lcom/einmalfel/earl/RSSImage$ST;->height:Lcom/einmalfel/earl/RSSImage$ST;

    .line 53
    invoke-interface {v8, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9e

    sget-object v6, Lcom/einmalfel/earl/RSSImage$ST;->height:Lcom/einmalfel/earl/RSSImage$ST;

    invoke-interface {v8, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    :cond_9e
    invoke-direct/range {v0 .. v6}, Lcom/einmalfel/earl/RSSImage;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-object v0

    :cond_a2
    move-object v5, v6

    .line 52
    goto :goto_8a
.end method
