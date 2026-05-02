.class public Lcom/einmalfel/earl/RSSFeed;
.super Ljava/lang/Object;
.source "RSSFeed.java"

# interfaces
.implements Lcom/einmalfel/earl/Feed;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/RSSFeed$ST;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.RSSFeed"

.field static final XML_TAG:Ljava/lang/String; = "channel"


# instance fields
.field public final categories:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/RSSCategory;",
            ">;"
        }
    .end annotation
.end field

.field public final cloud:Lcom/einmalfel/earl/RSSCloud;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final copyright:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final description:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final docs:Ljava/net/URL;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final generator:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final image:Lcom/einmalfel/earl/RSSImage;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final items:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/RSSItem;",
            ">;"
        }
    .end annotation
.end field

.field public final itunes:Lcom/einmalfel/earl/ItunesFeed;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final language:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final lastBuildDate:Ljava/util/Date;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final link:Ljava/net/URL;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final managingEditor:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final media:Lcom/einmalfel/earl/MediaCommon;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final pubDate:Ljava/util/Date;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final rating:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final skipDays:Ljava/util/List;
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

.field public final skipHours:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final textInput:Lcom/einmalfel/earl/RSSTextInput;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final title:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final ttl:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final webMaster:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/util/List;Ljava/lang/String;Ljava/net/URL;Lcom/einmalfel/earl/RSSCloud;Ljava/lang/Integer;Ljava/lang/String;Lcom/einmalfel/earl/RSSImage;Lcom/einmalfel/earl/RSSTextInput;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/ItunesFeed;Lcom/einmalfel/earl/MediaCommon;)V
    .registers 25
    .param p1, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "link"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "description"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "language"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "copyright"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "managingEditor"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7, "webMaster"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p8, "pubDate"    # Ljava/util/Date;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9, "lastBuildDate"    # Ljava/util/Date;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p11, "generator"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p12, "docs"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p13, "cloud"    # Lcom/einmalfel/earl/RSSCloud;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p14, "ttl"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p15, "rating"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p16, "image"    # Lcom/einmalfel/earl/RSSImage;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p17, "textInput"    # Lcom/einmalfel/earl/RSSTextInput;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p18    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p19    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p20    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p21, "itunes"    # Lcom/einmalfel/earl/ItunesFeed;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p22, "media"    # Lcom/einmalfel/earl/MediaCommon;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/net/URL;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            "Ljava/util/Date;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/RSSCategory;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/net/URL;",
            "Lcom/einmalfel/earl/RSSCloud;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Lcom/einmalfel/earl/RSSImage;",
            "Lcom/einmalfel/earl/RSSTextInput;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/RSSItem;",
            ">;",
            "Lcom/einmalfel/earl/ItunesFeed;",
            "Lcom/einmalfel/earl/MediaCommon;",
            ")V"
        }
    .end annotation

    .prologue
    .line 188
    .local p10, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/RSSCategory;>;"
    .local p18, "skipHours":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p19, "skipDays":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p20, "items":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/RSSItem;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    iput-object p1, p0, Lcom/einmalfel/earl/RSSFeed;->title:Ljava/lang/String;

    .line 190
    iput-object p2, p0, Lcom/einmalfel/earl/RSSFeed;->link:Ljava/net/URL;

    .line 191
    iput-object p3, p0, Lcom/einmalfel/earl/RSSFeed;->description:Ljava/lang/String;

    .line 192
    iput-object p4, p0, Lcom/einmalfel/earl/RSSFeed;->language:Ljava/lang/String;

    .line 193
    iput-object p5, p0, Lcom/einmalfel/earl/RSSFeed;->copyright:Ljava/lang/String;

    .line 194
    iput-object p6, p0, Lcom/einmalfel/earl/RSSFeed;->managingEditor:Ljava/lang/String;

    .line 195
    iput-object p7, p0, Lcom/einmalfel/earl/RSSFeed;->webMaster:Ljava/lang/String;

    .line 196
    iput-object p8, p0, Lcom/einmalfel/earl/RSSFeed;->pubDate:Ljava/util/Date;

    .line 197
    iput-object p9, p0, Lcom/einmalfel/earl/RSSFeed;->lastBuildDate:Ljava/util/Date;

    .line 198
    invoke-static {p10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->categories:Ljava/util/List;

    .line 199
    iput-object p11, p0, Lcom/einmalfel/earl/RSSFeed;->generator:Ljava/lang/String;

    .line 200
    iput-object p12, p0, Lcom/einmalfel/earl/RSSFeed;->docs:Ljava/net/URL;

    .line 201
    iput-object p13, p0, Lcom/einmalfel/earl/RSSFeed;->cloud:Lcom/einmalfel/earl/RSSCloud;

    .line 202
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->ttl:Ljava/lang/Integer;

    .line 203
    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->rating:Ljava/lang/String;

    .line 204
    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->image:Lcom/einmalfel/earl/RSSImage;

    .line 205
    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->textInput:Lcom/einmalfel/earl/RSSTextInput;

    .line 206
    invoke-static/range {p18 .. p18}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->skipHours:Ljava/util/List;

    .line 207
    invoke-static/range {p19 .. p19}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->skipDays:Ljava/util/List;

    .line 208
    invoke-static/range {p20 .. p20}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->items:Ljava/util/List;

    .line 209
    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    .line 210
    move-object/from16 v0, p22

    iput-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    .line 211
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;I)Lcom/einmalfel/earl/RSSFeed;
    .registers 33
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "maxItems"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 77
    const/4 v2, 0x2

    const-string v3, ""

    const-string v4, "channel"

    move-object/from16 v0, p0

    invoke-interface {v0, v2, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 79
    new-instance v27, Ljava/util/HashMap;

    const/4 v2, 0x5

    move-object/from16 v0, v27

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 80
    .local v27, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/einmalfel/earl/RSSFeed$ST;Ljava/lang/String;>;"
    new-instance v22, Ljava/util/LinkedList;

    invoke-direct/range {v22 .. v22}, Ljava/util/LinkedList;-><init>()V

    .line 81
    .local v22, "items":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/RSSItem;>;"
    new-instance v12, Ljava/util/LinkedList;

    invoke-direct {v12}, Ljava/util/LinkedList;-><init>()V

    .line 82
    .local v12, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/RSSCategory;>;"
    const/4 v15, 0x0

    .line 83
    .local v15, "cloud":Lcom/einmalfel/earl/RSSCloud;
    const/16 v18, 0x0

    .line 84
    .local v18, "image":Lcom/einmalfel/earl/RSSImage;
    const/16 v19, 0x0

    .line 85
    .local v19, "textInput":Lcom/einmalfel/earl/RSSTextInput;
    new-instance v20, Ljava/util/LinkedList;

    invoke-direct/range {v20 .. v20}, Ljava/util/LinkedList;-><init>()V

    .line 86
    .local v20, "skipHours":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v21, Ljava/util/LinkedList;

    invoke-direct/range {v21 .. v21}, Ljava/util/LinkedList;-><init>()V

    .line 87
    .local v21, "skipDays":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v26, 0x0

    .line 88
    .local v26, "itunesBuilder":Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;
    const/16 v28, 0x0

    .line 90
    .local v28, "mediaBuilder":Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;
    :goto_2f
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1ac

    const/4 v2, 0x1

    move/from16 v0, p1

    if-lt v0, v2, :cond_43

    .line 91
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v2

    move/from16 v0, p1

    if-ge v2, v0, :cond_1ac

    .line 92
    :cond_43
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v29

    .line 93
    .local v29, "namespace":Ljava/lang/String;
    const-string v2, ""

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14a

    .line 94
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v30

    .line 95
    .local v30, "tagName":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_29a

    :cond_5d
    :goto_5d
    packed-switch v2, :pswitch_data_2b8

    .line 127
    :try_start_60
    invoke-static/range {v30 .. v30}, Lcom/einmalfel/earl/RSSFeed$ST;->valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/RSSFeed$ST;

    move-result-object v2

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v27

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_60 .. :try_end_6d} :catch_12a

    .line 150
    .end local v30    # "tagName":Ljava/lang/String;
    :cond_6d
    :goto_6d
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_2f

    .line 95
    .restart local v30    # "tagName":Ljava/lang/String;
    :sswitch_71
    const-string v3, "item"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v2, 0x0

    goto :goto_5d

    :sswitch_7d
    const-string v3, "category"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v2, 0x1

    goto :goto_5d

    :sswitch_89
    const-string v3, "cloud"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v2, 0x2

    goto :goto_5d

    :sswitch_95
    const-string v3, "image"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v2, 0x3

    goto :goto_5d

    :sswitch_a1
    const-string v3, "textInput"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v2, 0x4

    goto :goto_5d

    :sswitch_ad
    const-string v3, "skipHours"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v2, 0x5

    goto :goto_5d

    :sswitch_b9
    const-string v3, "skipDays"

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v2, 0x6

    goto :goto_5d

    .line 97
    :pswitch_c5
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSItem;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSItem;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6d

    .line 100
    :pswitch_cf
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSCategory;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSCategory;

    move-result-object v2

    invoke-interface {v12, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6d

    .line 103
    :pswitch_d7
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSCloud;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSCloud;

    move-result-object v15

    .line 104
    goto :goto_6d

    .line 106
    :pswitch_dc
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSImage;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSImage;

    move-result-object v18

    .line 107
    goto :goto_6d

    .line 109
    :pswitch_e1
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSTextInput;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSTextInput;

    move-result-object v19

    .line 110
    goto :goto_6d

    .line 112
    :goto_e6
    :pswitch_e6
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_6d

    const-string v2, "hour"

    .line 113
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 112
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6d

    .line 114
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_e6

    .line 119
    :goto_10a
    :pswitch_10a
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_6d

    const-string v2, "day"

    .line 120
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 119
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6d

    .line 121
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_10a

    .line 128
    :catch_12a
    move-exception v25

    .line 129
    .local v25, "ignored":Ljava/lang/IllegalArgumentException;
    const-string v2, "Earl.RSSFeed"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown RSS feed tag "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v30

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_6d

    .line 133
    .end local v25    # "ignored":Ljava/lang/IllegalArgumentException;
    .end local v30    # "tagName":Ljava/lang/String;
    :cond_14a
    const-string v2, "http://www.itunes.com/dtds/podcast-1.0.dtd"

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_164

    .line 134
    if-nez v26, :cond_15b

    .line 135
    new-instance v26, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;

    .end local v26    # "itunesBuilder":Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;
    invoke-direct/range {v26 .. v26}, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;-><init>()V

    .line 137
    .restart local v26    # "itunesBuilder":Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;
    :cond_15b
    move-object/from16 v0, v26

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->parseTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_6d

    .line 138
    :cond_164
    const-string v2, "http://search.yahoo.com/mrss/"

    move-object/from16 v0, v29

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18b

    .line 139
    if-nez v28, :cond_175

    .line 140
    new-instance v28, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;

    .end local v28    # "mediaBuilder":Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;
    invoke-direct/range {v28 .. v28}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;-><init>()V

    .line 142
    .restart local v28    # "mediaBuilder":Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;
    :cond_175
    move-object/from16 v0, v28

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->parseTag(Lorg/xmlpull/v1/XmlPullParser;)Z

    move-result v2

    if-nez v2, :cond_6d

    .line 143
    const-string v2, "Earl.RSSFeed"

    const-string v3, "Unknown mrss tag on feed level"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_6d

    .line 147
    :cond_18b
    const-string v2, "Earl.RSSFeed"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown RSS feed extension "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_6d

    .line 153
    .end local v29    # "namespace":Ljava/lang/String;
    :cond_1ac
    new-instance v2, Lcom/einmalfel/earl/RSSFeed;

    sget-object v3, Lcom/einmalfel/earl/RSSFeed$ST;->title:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 154
    move-object/from16 v0, v27

    invoke-interface {v0, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/einmalfel/earl/RSSFeed$ST;->link:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 155
    move-object/from16 v0, v27

    invoke-interface {v0, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    sget-object v5, Lcom/einmalfel/earl/RSSFeed$ST;->description:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 156
    move-object/from16 v0, v27

    invoke-interface {v0, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/einmalfel/earl/RSSFeed$ST;->language:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 157
    move-object/from16 v0, v27

    invoke-interface {v0, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    sget-object v7, Lcom/einmalfel/earl/RSSFeed$ST;->copyright:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 158
    move-object/from16 v0, v27

    invoke-interface {v0, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    sget-object v8, Lcom/einmalfel/earl/RSSFeed$ST;->managingEditor:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 159
    move-object/from16 v0, v27

    invoke-interface {v0, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    sget-object v9, Lcom/einmalfel/earl/RSSFeed$ST;->webMaster:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 160
    move-object/from16 v0, v27

    invoke-interface {v0, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    sget-object v10, Lcom/einmalfel/earl/RSSFeed$ST;->pubDate:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 161
    move-object/from16 v0, v27

    invoke-interface {v0, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_286

    sget-object v10, Lcom/einmalfel/earl/RSSFeed$ST;->pubDate:Lcom/einmalfel/earl/RSSFeed$ST;

    move-object/from16 v0, v27

    invoke-interface {v0, v10}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Lcom/einmalfel/earl/Utils;->parseRFC822Date(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v10

    :goto_218
    sget-object v11, Lcom/einmalfel/earl/RSSFeed$ST;->lastBuildDate:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 162
    move-object/from16 v0, v27

    invoke-interface {v0, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_288

    sget-object v11, Lcom/einmalfel/earl/RSSFeed$ST;->lastBuildDate:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 163
    move-object/from16 v0, v27

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/einmalfel/earl/Utils;->parseRFC822Date(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v11

    :goto_230
    sget-object v13, Lcom/einmalfel/earl/RSSFeed$ST;->generator:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 165
    move-object/from16 v0, v27

    invoke-interface {v0, v13}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    sget-object v14, Lcom/einmalfel/earl/RSSFeed$ST;->docs:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 166
    move-object/from16 v0, v27

    invoke-interface {v0, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_28a

    sget-object v14, Lcom/einmalfel/earl/RSSFeed$ST;->docs:Lcom/einmalfel/earl/RSSFeed$ST;

    move-object/from16 v0, v27

    invoke-interface {v0, v14}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-static {v14}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v14

    :goto_252
    sget-object v16, Lcom/einmalfel/earl/RSSFeed$ST;->ttl:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 168
    move-object/from16 v0, v27

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_28c

    sget-object v16, Lcom/einmalfel/earl/RSSFeed$ST;->ttl:Lcom/einmalfel/earl/RSSFeed$ST;

    move-object/from16 v0, v27

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    invoke-static/range {v16 .. v16}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v16

    :goto_26e
    sget-object v17, Lcom/einmalfel/earl/RSSFeed$ST;->rating:Lcom/einmalfel/earl/RSSFeed$ST;

    .line 169
    move-object/from16 v0, v27

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    if-nez v26, :cond_28f

    const/16 v23, 0x0

    .line 175
    :goto_27e
    if-nez v28, :cond_294

    const/16 v24, 0x0

    .line 176
    :goto_282
    invoke-direct/range {v2 .. v24}, Lcom/einmalfel/earl/RSSFeed;-><init>(Ljava/lang/String;Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/util/List;Ljava/lang/String;Ljava/net/URL;Lcom/einmalfel/earl/RSSCloud;Ljava/lang/Integer;Ljava/lang/String;Lcom/einmalfel/earl/RSSImage;Lcom/einmalfel/earl/RSSTextInput;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/ItunesFeed;Lcom/einmalfel/earl/MediaCommon;)V

    return-object v2

    .line 161
    :cond_286
    const/4 v10, 0x0

    goto :goto_218

    .line 163
    :cond_288
    const/4 v11, 0x0

    goto :goto_230

    .line 166
    :cond_28a
    const/4 v14, 0x0

    goto :goto_252

    .line 168
    :cond_28c
    const/16 v16, 0x0

    goto :goto_26e

    .line 175
    :cond_28f
    invoke-virtual/range {v26 .. v26}, Lcom/einmalfel/earl/ItunesFeed$ItunesFeedBuilder;->build()Lcom/einmalfel/earl/ItunesFeed;

    move-result-object v23

    goto :goto_27e

    .line 176
    :cond_294
    invoke-virtual/range {v28 .. v28}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->build()Lcom/einmalfel/earl/MediaCommon;

    move-result-object v24

    goto :goto_282

    .line 95
    nop

    :sswitch_data_29a
    .sparse-switch
        -0x3f10a963 -> :sswitch_a1
        0x317b13 -> :sswitch_71
        0x302bcfe -> :sswitch_7d
        0x5a5de35 -> :sswitch_89
        0x5faa95b -> :sswitch_95
        0x7b9388d0 -> :sswitch_ad
        0x7fd97276 -> :sswitch_b9
    .end sparse-switch

    :pswitch_data_2b8
    .packed-switch 0x0
        :pswitch_c5
        :pswitch_cf
        :pswitch_d7
        :pswitch_dc
        :pswitch_e1
        :pswitch_e6
        :pswitch_10a
    .end packed-switch
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 5
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 267
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->managingEditor:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 268
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->managingEditor:Ljava/lang/String;

    .line 283
    :goto_6
    return-object v1

    .line 270
    :cond_7
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    iget-object v1, v1, Lcom/einmalfel/earl/ItunesFeed;->author:Ljava/lang/String;

    if-eqz v1, :cond_16

    .line 271
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    iget-object v1, v1, Lcom/einmalfel/earl/ItunesFeed;->author:Ljava/lang/String;

    goto :goto_6

    .line 273
    :cond_16
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    if-eqz v1, :cond_27

    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    iget-object v1, v1, Lcom/einmalfel/earl/ItunesFeed;->owner:Lcom/einmalfel/earl/ItunesOwner;

    if-eqz v1, :cond_27

    .line 274
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    iget-object v1, v1, Lcom/einmalfel/earl/ItunesFeed;->owner:Lcom/einmalfel/earl/ItunesOwner;

    iget-object v1, v1, Lcom/einmalfel/earl/ItunesOwner;->name:Ljava/lang/String;

    goto :goto_6

    .line 276
    :cond_27
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    if-eqz v1, :cond_64

    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    iget-object v1, v1, Lcom/einmalfel/earl/MediaCommon;->credits:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_64

    .line 277
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    iget-object v1, v1, Lcom/einmalfel/earl/MediaCommon;->credits:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_56

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/MediaCredit;

    .line 278
    .local v0, "credit":Lcom/einmalfel/earl/MediaCredit;
    const-string v2, "author"

    iget-object v3, v0, Lcom/einmalfel/earl/MediaCredit;->role:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 279
    iget-object v1, v0, Lcom/einmalfel/earl/MediaCredit;->value:Ljava/lang/String;

    goto :goto_6

    .line 281
    .end local v0    # "credit":Lcom/einmalfel/earl/MediaCredit;
    :cond_56
    iget-object v1, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    iget-object v1, v1, Lcom/einmalfel/earl/MediaCommon;->credits:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/einmalfel/earl/MediaCredit;

    iget-object v1, v1, Lcom/einmalfel/earl/MediaCredit;->value:Ljava/lang/String;

    goto :goto_6

    .line 283
    :cond_64
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCopyright()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 240
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->copyright:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 241
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->copyright:Ljava/lang/String;

    .line 246
    :goto_6
    return-object v0

    .line 243
    :cond_7
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon;->license:Lcom/einmalfel/earl/MediaLicense;

    if-eqz v0, :cond_18

    .line 244
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon;->license:Lcom/einmalfel/earl/MediaLicense;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaLicense;->value:Ljava/lang/String;

    goto :goto_6

    .line 246
    :cond_18
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 234
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getImageLink()Ljava/lang/String;
    .registers 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 252
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->image:Lcom/einmalfel/earl/RSSImage;

    if-eqz v0, :cond_d

    .line 253
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->image:Lcom/einmalfel/earl/RSSImage;

    iget-object v0, v0, Lcom/einmalfel/earl/RSSImage;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    .line 261
    :goto_c
    return-object v0

    .line 255
    :cond_d
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesFeed;->image:Ljava/net/URL;

    if-eqz v0, :cond_20

    .line 256
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->itunes:Lcom/einmalfel/earl/ItunesFeed;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesFeed;->image:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 258
    :cond_20
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    if-eqz v0, :cond_40

    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon;->thumbnails:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_40

    .line 259
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->media:Lcom/einmalfel/earl/MediaCommon;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon;->thumbnails:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/MediaThumbnail;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaThumbnail;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 261
    :cond_40
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getItems()Ljava/util/List;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/einmalfel/earl/Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 289
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->items:Ljava/util/List;

    return-object v0
.end method

.method public getLink()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 216
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->link:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPublicationDate()Ljava/util/Date;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->pubDate:Ljava/util/Date;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 228
    iget-object v0, p0, Lcom/einmalfel/earl/RSSFeed;->title:Ljava/lang/String;

    return-object v0
.end method
