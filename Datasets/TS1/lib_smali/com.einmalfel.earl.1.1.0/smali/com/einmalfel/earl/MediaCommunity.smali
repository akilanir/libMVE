.class public Lcom/einmalfel/earl/MediaCommunity;
.super Ljava/lang/Object;
.source "MediaCommunity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/MediaCommunity$Statistics;,
        Lcom/einmalfel/earl/MediaCommunity$StarRating;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.MediaCommunity"

.field static final XML_TAG:Ljava/lang/String; = "community"


# instance fields
.field public final starRating:Lcom/einmalfel/earl/MediaCommunity$StarRating;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final statistics:Lcom/einmalfel/earl/MediaCommunity$Statistics;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final tags:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/MediaCommunity$StarRating;Lcom/einmalfel/earl/MediaCommunity$Statistics;Ljava/util/List;)V
    .registers 5
    .param p1, "starRating"    # Lcom/einmalfel/earl/MediaCommunity$StarRating;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "statistics"    # Lcom/einmalfel/earl/MediaCommunity$Statistics;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/einmalfel/earl/MediaCommunity$StarRating;",
            "Lcom/einmalfel/earl/MediaCommunity$Statistics;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p3, "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput-object p1, p0, Lcom/einmalfel/earl/MediaCommunity;->starRating:Lcom/einmalfel/earl/MediaCommunity$StarRating;

    .line 104
    iput-object p2, p0, Lcom/einmalfel/earl/MediaCommunity;->statistics:Lcom/einmalfel/earl/MediaCommunity$Statistics;

    .line 105
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommunity;->tags:Ljava/util/List;

    .line 106
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCommunity;
    .registers 15
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
    const/4 v12, 0x2

    const/4 v9, 0x0

    .line 63
    const-string v8, "community"

    invoke-interface {p0, v12, v9, v8}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 64
    const/4 v4, 0x0

    .line 65
    .local v4, "starRating":Lcom/einmalfel/earl/MediaCommunity$StarRating;
    const/4 v5, 0x0

    .line 66
    .local v5, "statistics":Lcom/einmalfel/earl/MediaCommunity$Statistics;
    const/4 v6, 0x0

    .line 67
    .local v6, "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_a
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v8

    if-ne v8, v12, :cond_de

    .line 68
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v10

    const/4 v8, -0x1

    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_ec

    :cond_1c
    :goto_1c
    packed-switch v8, :pswitch_data_fa

    .line 91
    const-string v8, "Earl.MediaCommunity"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unexpected tag inside media:community: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 94
    :goto_3e
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_a

    .line 68
    :sswitch_42
    const-string v11, "starRating"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1c

    const/4 v8, 0x0

    goto :goto_1c

    :sswitch_4c
    const-string v11, "statistics"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1c

    const/4 v8, 0x1

    goto :goto_1c

    :sswitch_56
    const-string v11, "tags"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1c

    move v8, v12

    goto :goto_1c

    .line 70
    :pswitch_60
    const-string v8, ""

    const-string v10, "count"

    invoke-interface {p0, v8, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "count":Ljava/lang/String;
    const-string v8, ""

    const-string v10, "min"

    invoke-interface {p0, v8, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "min":Ljava/lang/String;
    const-string v8, ""

    const-string v10, "max"

    invoke-interface {p0, v8, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 73
    .local v2, "max":Ljava/lang/String;
    new-instance v4, Lcom/einmalfel/earl/MediaCommunity$StarRating;

    .end local v4    # "starRating":Lcom/einmalfel/earl/MediaCommunity$StarRating;
    const-string v8, ""

    const-string v10, "average"

    .line 74
    invoke-interface {p0, v8, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-nez v0, :cond_92

    move-object v11, v9

    .line 75
    :goto_85
    if-nez v3, :cond_98

    move-object v10, v9

    .line 76
    :goto_88
    if-nez v2, :cond_9e

    move-object v8, v9

    .line 77
    :goto_8b
    invoke-direct {v4, v13, v11, v10, v8}, Lcom/einmalfel/earl/MediaCommunity$StarRating;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 78
    .restart local v4    # "starRating":Lcom/einmalfel/earl/MediaCommunity$StarRating;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto :goto_3e

    .line 75
    .end local v4    # "starRating":Lcom/einmalfel/earl/MediaCommunity$StarRating;
    :cond_92
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    move-object v11, v8

    goto :goto_85

    .line 76
    :cond_98
    invoke-static {v3}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    move-object v10, v8

    goto :goto_88

    .line 77
    :cond_9e
    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_8b

    .line 81
    .end local v0    # "count":Ljava/lang/String;
    .end local v2    # "max":Ljava/lang/String;
    .end local v3    # "min":Ljava/lang/String;
    .restart local v4    # "starRating":Lcom/einmalfel/earl/MediaCommunity$StarRating;
    :pswitch_a3
    const-string v8, ""

    const-string v10, "views"

    invoke-interface {p0, v8, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 82
    .local v7, "views":Ljava/lang/String;
    const-string v8, ""

    const-string v10, "favorites"

    invoke-interface {p0, v8, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, "favorites":Ljava/lang/String;
    new-instance v5, Lcom/einmalfel/earl/MediaCommunity$Statistics;

    .end local v5    # "statistics":Lcom/einmalfel/earl/MediaCommunity$Statistics;
    if-nez v7, :cond_c3

    move-object v10, v9

    :goto_b8
    if-nez v1, :cond_c9

    move-object v8, v9

    .line 84
    :goto_bb
    invoke-direct {v5, v10, v8}, Lcom/einmalfel/earl/MediaCommunity$Statistics;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 85
    .restart local v5    # "statistics":Lcom/einmalfel/earl/MediaCommunity$Statistics;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    goto/16 :goto_3e

    .line 83
    .end local v5    # "statistics":Lcom/einmalfel/earl/MediaCommunity$Statistics;
    :cond_c3
    invoke-static {v7}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    move-object v10, v8

    goto :goto_b8

    .line 84
    :cond_c9
    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    goto :goto_bb

    .line 88
    .end local v1    # "favorites":Ljava/lang/String;
    .end local v7    # "views":Ljava/lang/String;
    .restart local v5    # "statistics":Lcom/einmalfel/earl/MediaCommunity$Statistics;
    :pswitch_ce
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v8

    const-string v10, ","

    invoke-virtual {v8, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 89
    goto/16 :goto_3e

    .line 97
    :cond_de
    new-instance v8, Lcom/einmalfel/earl/MediaCommunity;

    if-nez v6, :cond_e7

    new-instance v6, Ljava/util/LinkedList;

    .end local v6    # "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    :cond_e7
    invoke-direct {v8, v4, v5, v6}, Lcom/einmalfel/earl/MediaCommunity;-><init>(Lcom/einmalfel/earl/MediaCommunity$StarRating;Lcom/einmalfel/earl/MediaCommunity$Statistics;Ljava/util/List;)V

    return-object v8

    .line 68
    nop

    :sswitch_data_ec
    .sparse-switch
        -0x5a34edd -> :sswitch_4c
        0x363419 -> :sswitch_56
        0x68531e8f -> :sswitch_42
    .end sparse-switch

    :pswitch_data_fa
    .packed-switch 0x0
        :pswitch_60
        :pswitch_a3
        :pswitch_ce
    .end packed-switch
.end method
