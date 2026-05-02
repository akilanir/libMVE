.class Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;
.super Ljava/lang/Object;
.source "ItunesItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/ItunesItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ItunesItemBuilder"
.end annotation


# instance fields
.field image:Ljava/net/URL;

.field keywords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/einmalfel/earl/ItunesItem$ST;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method build()Lcom/einmalfel/earl/ItunesItem;
    .registers 12
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 53
    new-instance v0, Lcom/einmalfel/earl/ItunesItem;

    iget-object v1, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v2, Lcom/einmalfel/earl/ItunesItem$ST;->author:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 54
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v3, Lcom/einmalfel/earl/ItunesItem$ST;->block:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 55
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a2

    const-string v2, "yes"

    iget-object v3, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v4, Lcom/einmalfel/earl/ItunesItem$ST;->block:Lcom/einmalfel/earl/ItunesItem$ST;

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    :goto_29
    iget-object v3, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->image:Ljava/net/URL;

    iget-object v4, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v5, Lcom/einmalfel/earl/ItunesItem$ST;->duration:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 57
    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a4

    iget-object v4, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v5, Lcom/einmalfel/earl/ItunesItem$ST;->duration:Lcom/einmalfel/earl/ItunesItem$ST;

    invoke-interface {v4, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->parseItunesDuration(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    :goto_43
    iget-object v5, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v6, Lcom/einmalfel/earl/ItunesItem$ST;->explicit:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 58
    invoke-interface {v5, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v8, Lcom/einmalfel/earl/ItunesItem$ST;->isClosedCaptioned:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 59
    invoke-interface {v6, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a6

    const-string v6, " yes"

    iget-object v8, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v9, Lcom/einmalfel/earl/ItunesItem$ST;->isClosedCaptioned:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 60
    invoke-interface {v8, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 59
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_69
    iget-object v8, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v9, Lcom/einmalfel/earl/ItunesItem$ST;->order:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 61
    invoke-interface {v8, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_81

    iget-object v7, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v8, Lcom/einmalfel/earl/ItunesItem$ST;->order:Lcom/einmalfel/earl/ItunesItem$ST;

    invoke-interface {v7, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    :cond_81
    iget-object v8, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v9, Lcom/einmalfel/earl/ItunesItem$ST;->subtitle:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 62
    invoke-interface {v8, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    iget-object v9, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    sget-object v10, Lcom/einmalfel/earl/ItunesItem$ST;->summary:Lcom/einmalfel/earl/ItunesItem$ST;

    .line 63
    invoke-interface {v9, v10}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iget-object v10, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->keywords:Ljava/util/List;

    if-nez v10, :cond_a8

    new-instance v10, Ljava/util/LinkedList;

    invoke-direct {v10}, Ljava/util/LinkedList;-><init>()V

    :goto_9e
    invoke-direct/range {v0 .. v10}, Lcom/einmalfel/earl/ItunesItem;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0

    :cond_a2
    move-object v2, v7

    .line 55
    goto :goto_29

    :cond_a4
    move-object v4, v7

    .line 57
    goto :goto_43

    :cond_a6
    move-object v6, v7

    .line 59
    goto :goto_69

    .line 63
    :cond_a8
    iget-object v10, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->keywords:Ljava/util/List;

    goto :goto_9e
.end method

.method parseTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 8
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

    move-result-object v2

    .line 32
    .local v2, "tagName":Ljava/lang/String;
    const/4 v3, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_76

    :cond_c
    :goto_c
    packed-switch v3, :pswitch_data_80

    .line 43
    :try_start_f
    iget-object v3, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->map:Ljava/util/Map;

    invoke-static {v2}, Lcom/einmalfel/earl/ItunesItem$ST;->valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/ItunesItem$ST;

    move-result-object v4

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f .. :try_end_1c} :catch_58

    .line 49
    :goto_1c
    return-void

    .line 32
    :sswitch_1d
    const-string v4, "image"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    const/4 v3, 0x0

    goto :goto_c

    :sswitch_27
    const-string v4, "keywords"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    const/4 v3, 0x1

    goto :goto_c

    .line 34
    :pswitch_31
    const-string v3, ""

    const-string v4, "href"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "imageStr":Ljava/lang/String;
    if-nez v1, :cond_42

    const/4 v3, 0x0

    :goto_3c
    iput-object v3, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->image:Ljava/net/URL;

    .line 36
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    goto :goto_1c

    .line 35
    :cond_42
    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    goto :goto_3c

    .line 39
    .end local v1    # "imageStr":Ljava/lang/String;
    :pswitch_47
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->keywords:Ljava/util/List;

    goto :goto_1c

    .line 44
    :catch_58
    move-exception v0

    .line 45
    .local v0, "ignored":Ljava/lang/IllegalArgumentException;
    const-string v3, "Earl.ItunesItem"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown itunes item tag "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    invoke-static {p1}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1c

    .line 32
    nop

    :sswitch_data_76
    .sparse-switch
        0x5faa95b -> :sswitch_1d
        0x1f2e9faa -> :sswitch_27
    .end sparse-switch

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_31
        :pswitch_47
    .end packed-switch
.end method
