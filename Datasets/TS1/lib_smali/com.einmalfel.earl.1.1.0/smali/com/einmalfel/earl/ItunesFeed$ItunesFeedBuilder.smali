.class Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;
.super Ljava/lang/Object;
.source "ItunesFeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/ItunesFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ItunesFeedBuilder"
.end annotation


# instance fields
.field final categories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/ItunesCategory;",
            ">;"
        }
    .end annotation
.end field

.field image:Ljava/net/URL;

.field final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/einmalfel/earl/ItunesFeed$ST;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field newFeedURL:Ljava/net/URL;

.field owner:Lcom/einmalfel/earl/ItunesOwner;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    .line 25
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->categories:Ljava/util/List;

    return-void
.end method


# virtual methods
.method build()Lcom/einmalfel/earl/ItunesFeed;
    .registers 13
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 58
    new-instance v0, Lcom/einmalfel/earl/ItunesFeed;

    iget-object v1, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    sget-object v2, Lcom/einmalfel/earl/ItunesFeed$ST;->author:Lcom/einmalfel/earl/ItunesFeed$ST;

    .line 59
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    sget-object v3, Lcom/einmalfel/earl/ItunesFeed$ST;->block:Lcom/einmalfel/earl/ItunesFeed$ST;

    .line 60
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6f

    const-string v2, "yes"

    iget-object v3, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    sget-object v4, Lcom/einmalfel/earl/ItunesFeed$ST;->block:Lcom/einmalfel/earl/ItunesFeed$ST;

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    :goto_29
    iget-object v3, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->categories:Ljava/util/List;

    iget-object v4, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->image:Ljava/net/URL;

    iget-object v5, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    sget-object v7, Lcom/einmalfel/earl/ItunesFeed$ST;->explicit:Lcom/einmalfel/earl/ItunesFeed$ST;

    .line 63
    invoke-interface {v5, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v7, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    sget-object v8, Lcom/einmalfel/earl/ItunesFeed$ST;->complete:Lcom/einmalfel/earl/ItunesFeed$ST;

    .line 64
    invoke-interface {v7, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_53

    const-string v6, "yes"

    iget-object v7, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    sget-object v8, Lcom/einmalfel/earl/ItunesFeed$ST;->complete:Lcom/einmalfel/earl/ItunesFeed$ST;

    invoke-interface {v7, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :cond_53
    iget-object v7, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->newFeedURL:Ljava/net/URL;

    iget-object v8, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->owner:Lcom/einmalfel/earl/ItunesOwner;

    iget-object v9, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    sget-object v10, Lcom/einmalfel/earl/ItunesFeed$ST;->subtitle:Lcom/einmalfel/earl/ItunesFeed$ST;

    .line 67
    invoke-interface {v9, v10}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iget-object v10, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    sget-object v11, Lcom/einmalfel/earl/ItunesFeed$ST;->summary:Lcom/einmalfel/earl/ItunesFeed$ST;

    .line 68
    invoke-interface {v10, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-direct/range {v0 .. v10}, Lcom/einmalfel/earl/ItunesFeed;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/List;Ljava/net/URL;Ljava/lang/String;Ljava/lang/Boolean;Ljava/net/URL;Lcom/einmalfel/earl/ItunesOwner;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_6f
    move-object v2, v6

    .line 60
    goto :goto_29
.end method

.method parseTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 7
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 32
    .local v1, "tagName":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_96

    :cond_c
    :goto_c
    packed-switch v2, :pswitch_data_a8

    .line 48
    :try_start_f
    iget-object v2, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->map:Ljava/util/Map;

    invoke-static {v1}, Lcom/einmalfel/earl/ItunesFeed$ST;->valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/ItunesFeed$ST;

    move-result-object v3

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f .. :try_end_1c} :catch_73

    .line 54
    :goto_1c
    return-void

    .line 32
    :sswitch_1d
    const-string v3, "category"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    const/4 v2, 0x0

    goto :goto_c

    :sswitch_27
    const-string v3, "owner"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    const/4 v2, 0x1

    goto :goto_c

    :sswitch_31
    const-string v3, "image"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    const/4 v2, 0x2

    goto :goto_c

    :sswitch_3b
    const-string v3, "new-feed-url"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    const/4 v2, 0x3

    goto :goto_c

    .line 34
    :pswitch_45
    iget-object v2, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->categories:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/ItunesCategory;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/ItunesCategory;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 37
    :pswitch_4f
    invoke-static {p1}, Lcom/einmalfel/earl/ItunesOwner;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/ItunesOwner;

    move-result-object v2

    iput-object v2, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->owner:Lcom/einmalfel/earl/ItunesOwner;

    goto :goto_1c

    .line 40
    :pswitch_56
    const-string v2, ""

    const-string v3, "href"

    invoke-interface {p1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    iput-object v2, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->image:Ljava/net/URL;

    .line 41
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextToken()I

    goto :goto_1c

    .line 44
    :pswitch_68
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    iput-object v2, p0, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->newFeedURL:Ljava/net/URL;

    goto :goto_1c

    .line 49
    :catch_73
    move-exception v0

    .line 50
    .local v0, "ignored":Ljava/lang/IllegalArgumentException;
    const-string v2, "Earl.ItunesFeed"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown Itunes feed tag "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " skipping.."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    invoke-static {p1}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1c

    .line 32
    :sswitch_data_96
    .sparse-switch
        -0x60c731b3 -> :sswitch_3b
        0x302bcfe -> :sswitch_1d
        0x5faa95b -> :sswitch_31
        0x653f2b3 -> :sswitch_27
    .end sparse-switch

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_45
        :pswitch_4f
        :pswitch_56
        :pswitch_68
    .end packed-switch
.end method
