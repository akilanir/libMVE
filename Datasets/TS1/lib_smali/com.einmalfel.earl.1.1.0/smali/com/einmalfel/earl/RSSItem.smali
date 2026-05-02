.class public Lcom/einmalfel/earl/RSSItem;
.super Ljava/lang/Object;
.source "RSSItem.java"

# interfaces
.implements Lcom/einmalfel/earl/Item;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/RSSItem$ST;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.RSSItem"

.field static final XML_TAG:Ljava/lang/String; = "item"


# instance fields
.field public final author:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

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

.field public final comments:Ljava/net/URL;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final description:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final enclosures:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/RSSEnclosure;",
            ">;"
        }
    .end annotation
.end field

.field public final guid:Lcom/einmalfel/earl/RSSGuid;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final itunes:Lcom/einmalfel/earl/ItunesItem;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final link:Ljava/net/URL;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final media:Lcom/einmalfel/earl/MediaItem;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final pubDate:Ljava/util/Date;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final source:Lcom/einmalfel/earl/RSSSource;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final title:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/net/URL;Ljava/util/List;Lcom/einmalfel/earl/RSSGuid;Ljava/util/Date;Lcom/einmalfel/earl/RSSSource;Lcom/einmalfel/earl/ItunesItem;Lcom/einmalfel/earl/MediaItem;)V
    .registers 14
    .param p1, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "link"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "description"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "author"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6, "comments"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p8, "guid"    # Lcom/einmalfel/earl/RSSGuid;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9, "pubDate"    # Ljava/util/Date;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10, "source"    # Lcom/einmalfel/earl/RSSSource;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p11, "itunes"    # Lcom/einmalfel/earl/ItunesItem;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p12, "media"    # Lcom/einmalfel/earl/MediaItem;
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
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/RSSCategory;",
            ">;",
            "Ljava/net/URL;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/RSSEnclosure;",
            ">;",
            "Lcom/einmalfel/earl/RSSGuid;",
            "Ljava/util/Date;",
            "Lcom/einmalfel/earl/RSSSource;",
            "Lcom/einmalfel/earl/ItunesItem;",
            "Lcom/einmalfel/earl/MediaItem;",
            ")V"
        }
    .end annotation

    .prologue
    .line 124
    .local p5, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/RSSCategory;>;"
    .local p7, "enclosures":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/RSSEnclosure;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    iput-object p1, p0, Lcom/einmalfel/earl/RSSItem;->title:Ljava/lang/String;

    .line 126
    iput-object p2, p0, Lcom/einmalfel/earl/RSSItem;->link:Ljava/net/URL;

    .line 127
    iput-object p3, p0, Lcom/einmalfel/earl/RSSItem;->description:Ljava/lang/String;

    .line 128
    iput-object p4, p0, Lcom/einmalfel/earl/RSSItem;->author:Ljava/lang/String;

    .line 129
    invoke-static {p5}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/RSSItem;->categories:Ljava/util/List;

    .line 130
    iput-object p6, p0, Lcom/einmalfel/earl/RSSItem;->comments:Ljava/net/URL;

    .line 131
    invoke-static {p7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/RSSItem;->enclosures:Ljava/util/List;

    .line 132
    iput-object p8, p0, Lcom/einmalfel/earl/RSSItem;->guid:Lcom/einmalfel/earl/RSSGuid;

    .line 133
    iput-object p9, p0, Lcom/einmalfel/earl/RSSItem;->pubDate:Ljava/util/Date;

    .line 134
    iput-object p10, p0, Lcom/einmalfel/earl/RSSItem;->source:Lcom/einmalfel/earl/RSSSource;

    .line 135
    iput-object p11, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    .line 136
    iput-object p12, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    .line 137
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSItem;
    .registers 22
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
    .line 52
    const/4 v2, 0x2

    const-string v3, ""

    const-string v4, "item"

    move-object/from16 v0, p0

    invoke-interface {v0, v2, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 53
    new-instance v17, Ljava/util/HashMap;

    const/4 v2, 0x5

    move-object/from16 v0, v17

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 54
    .local v17, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/einmalfel/earl/RSSItem$ST;Ljava/lang/String;>;"
    new-instance v9, Ljava/util/LinkedList;

    invoke-direct {v9}, Ljava/util/LinkedList;-><init>()V

    .line 55
    .local v9, "enclosures":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/RSSEnclosure;>;"
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 56
    .local v7, "categories":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/RSSCategory;>;"
    const/4 v10, 0x0

    .line 57
    .local v10, "guid":Lcom/einmalfel/earl/RSSGuid;
    const/4 v12, 0x0

    .line 58
    .local v12, "source":Lcom/einmalfel/earl/RSSSource;
    const/16 v16, 0x0

    .line 59
    .local v16, "itunesBuilder":Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;
    const/16 v18, 0x0

    .line 60
    .local v18, "mediaBuilder":Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;
    :goto_22
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_122

    .line 61
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v19

    .line 62
    .local v19, "namespace":Ljava/lang/String;
    const-string v2, ""

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c0

    .line 63
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v20

    .line 64
    .local v20, "tagName":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_1a4

    :cond_43
    :goto_43
    packed-switch v2, :pswitch_data_1b6

    .line 79
    :try_start_46
    invoke-static/range {v20 .. v20}, Lcom/einmalfel/earl/RSSItem$ST;->valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/RSSItem$ST;

    move-result-object v2

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_53
    .catch Ljava/lang/IllegalArgumentException; {:try_start_46 .. :try_end_53} :catch_a1

    .line 102
    .end local v20    # "tagName":Ljava/lang/String;
    :cond_53
    :goto_53
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_22

    .line 64
    .restart local v20    # "tagName":Ljava/lang/String;
    :sswitch_57
    const-string v3, "enclosure"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    const/4 v2, 0x0

    goto :goto_43

    :sswitch_63
    const-string v3, "category"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    const/4 v2, 0x1

    goto :goto_43

    :sswitch_6f
    const-string v3, "source"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    const/4 v2, 0x2

    goto :goto_43

    :sswitch_7b
    const-string v3, "guid"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    const/4 v2, 0x3

    goto :goto_43

    .line 66
    :pswitch_87
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSEnclosure;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSEnclosure;

    move-result-object v2

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_53

    .line 69
    :pswitch_8f
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSCategory;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSCategory;

    move-result-object v2

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_53

    .line 72
    :pswitch_97
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSSource;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSSource;

    move-result-object v12

    .line 73
    goto :goto_53

    .line 75
    :pswitch_9c
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/RSSGuid;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSGuid;

    move-result-object v10

    .line 76
    goto :goto_53

    .line 80
    :catch_a1
    move-exception v15

    .line 81
    .local v15, "ignored":Ljava/lang/IllegalArgumentException;
    const-string v2, "Earl.RSSItem"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown RSS item tag "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_53

    .line 85
    .end local v15    # "ignored":Ljava/lang/IllegalArgumentException;
    .end local v20    # "tagName":Ljava/lang/String;
    :cond_c0
    const-string v2, "http://www.itunes.com/dtds/podcast-1.0.dtd"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_da

    .line 86
    if-nez v16, :cond_d1

    .line 87
    new-instance v16, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;

    .end local v16    # "itunesBuilder":Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;
    invoke-direct/range {v16 .. v16}, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;-><init>()V

    .line 89
    .restart local v16    # "itunesBuilder":Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;
    :cond_d1
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->parseTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_53

    .line 90
    :cond_da
    const-string v2, "http://search.yahoo.com/mrss/"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_101

    .line 91
    if-nez v18, :cond_eb

    .line 92
    new-instance v18, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;

    .end local v18    # "mediaBuilder":Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;
    invoke-direct/range {v18 .. v18}, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;-><init>()V

    .line 94
    .restart local v18    # "mediaBuilder":Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;
    :cond_eb
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->parseTag(Lorg/xmlpull/v1/XmlPullParser;)Z

    move-result v2

    if-nez v2, :cond_53

    .line 95
    const-string v2, "Earl.RSSItem"

    const-string v3, "Unknown mrss tag on item level"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_53

    .line 99
    :cond_101
    const-string v2, "Earl.RSSItem"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown namespace in RSS item "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_53

    .line 105
    .end local v19    # "namespace":Ljava/lang/String;
    :cond_122
    new-instance v2, Lcom/einmalfel/earl/RSSItem;

    sget-object v3, Lcom/einmalfel/earl/RSSItem$ST;->title:Lcom/einmalfel/earl/RSSItem$ST;

    .line 106
    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v4, Lcom/einmalfel/earl/RSSItem$ST;->link:Lcom/einmalfel/earl/RSSItem$ST;

    .line 107
    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_194

    sget-object v4, Lcom/einmalfel/earl/RSSItem$ST;->link:Lcom/einmalfel/earl/RSSItem$ST;

    move-object/from16 v0, v17

    invoke-interface {v0, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    :goto_146
    sget-object v5, Lcom/einmalfel/earl/RSSItem$ST;->description:Lcom/einmalfel/earl/RSSItem$ST;

    .line 108
    move-object/from16 v0, v17

    invoke-interface {v0, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    sget-object v6, Lcom/einmalfel/earl/RSSItem$ST;->author:Lcom/einmalfel/earl/RSSItem$ST;

    .line 109
    move-object/from16 v0, v17

    invoke-interface {v0, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    sget-object v8, Lcom/einmalfel/earl/RSSItem$ST;->comments:Lcom/einmalfel/earl/RSSItem$ST;

    .line 111
    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_196

    sget-object v8, Lcom/einmalfel/earl/RSSItem$ST;->comments:Lcom/einmalfel/earl/RSSItem$ST;

    move-object/from16 v0, v17

    invoke-interface {v0, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v8

    :goto_172
    sget-object v11, Lcom/einmalfel/earl/RSSItem$ST;->pubDate:Lcom/einmalfel/earl/RSSItem$ST;

    .line 114
    move-object/from16 v0, v17

    invoke-interface {v0, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_198

    sget-object v11, Lcom/einmalfel/earl/RSSItem$ST;->pubDate:Lcom/einmalfel/earl/RSSItem$ST;

    move-object/from16 v0, v17

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Lcom/einmalfel/earl/Utils;->parseRFC822Date(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v11

    :goto_18a
    if-nez v16, :cond_19a

    const/4 v13, 0x0

    .line 116
    :goto_18d
    if-nez v18, :cond_19f

    const/4 v14, 0x0

    .line 117
    :goto_190
    invoke-direct/range {v2 .. v14}, Lcom/einmalfel/earl/RSSItem;-><init>(Ljava/lang/String;Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/net/URL;Ljava/util/List;Lcom/einmalfel/earl/RSSGuid;Ljava/util/Date;Lcom/einmalfel/earl/RSSSource;Lcom/einmalfel/earl/ItunesItem;Lcom/einmalfel/earl/MediaItem;)V

    return-object v2

    .line 107
    :cond_194
    const/4 v4, 0x0

    goto :goto_146

    .line 111
    :cond_196
    const/4 v8, 0x0

    goto :goto_172

    .line 114
    :cond_198
    const/4 v11, 0x0

    goto :goto_18a

    .line 116
    :cond_19a
    invoke-virtual/range {v16 .. v16}, Lcom/einmalfel/earl/ItunesItem$ItunesItemBuilder;->build()Lcom/einmalfel/earl/ItunesItem;

    move-result-object v13

    goto :goto_18d

    .line 117
    :cond_19f
    invoke-virtual/range {v18 .. v18}, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->build()Lcom/einmalfel/earl/MediaItem;

    move-result-object v14

    goto :goto_190

    .line 64
    :sswitch_data_1a4
    .sparse-switch
        -0x356f97e5 -> :sswitch_6f
        0x309689 -> :sswitch_7b
        0x302bcfe -> :sswitch_63
        0x55679d72 -> :sswitch_57
    .end sparse-switch

    :pswitch_data_1b6
    .packed-switch 0x0
        :pswitch_87
        :pswitch_8f
        :pswitch_97
        :pswitch_9c
    .end packed-switch
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 5
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 199
    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->author:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 200
    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->author:Ljava/lang/String;

    .line 212
    :goto_6
    return-object v1

    .line 202
    :cond_7
    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v1, v1, Lcom/einmalfel/earl/ItunesItem;->author:Ljava/lang/String;

    if-eqz v1, :cond_16

    .line 203
    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v1, v1, Lcom/einmalfel/earl/ItunesItem;->author:Ljava/lang/String;

    goto :goto_6

    .line 205
    :cond_16
    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    if-eqz v1, :cond_53

    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v1, v1, Lcom/einmalfel/earl/MediaItem;->credits:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_53

    .line 206
    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v1, v1, Lcom/einmalfel/earl/MediaItem;->credits:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/MediaCredit;

    .line 207
    .local v0, "credit":Lcom/einmalfel/earl/MediaCredit;
    const-string v2, "author"

    iget-object v3, v0, Lcom/einmalfel/earl/MediaCredit;->role:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 208
    iget-object v1, v0, Lcom/einmalfel/earl/MediaCredit;->value:Ljava/lang/String;

    goto :goto_6

    .line 210
    .end local v0    # "credit":Lcom/einmalfel/earl/MediaCredit;
    :cond_45
    iget-object v1, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v1, v1, Lcom/einmalfel/earl/MediaItem;->credits:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/einmalfel/earl/MediaCredit;

    iget-object v1, v1, Lcom/einmalfel/earl/MediaCredit;->value:Ljava/lang/String;

    goto :goto_6

    .line 212
    :cond_53
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 169
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->description:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 170
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->description:Ljava/lang/String;

    .line 181
    :goto_6
    return-object v0

    .line 172
    :cond_7
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesItem;->subtitle:Ljava/lang/String;

    if-eqz v0, :cond_16

    .line 173
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesItem;->subtitle:Ljava/lang/String;

    goto :goto_6

    .line 175
    :cond_16
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    if-eqz v0, :cond_25

    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesItem;->summary:Ljava/lang/String;

    if-eqz v0, :cond_25

    .line 176
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesItem;->summary:Ljava/lang/String;

    goto :goto_6

    .line 178
    :cond_25
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    if-eqz v0, :cond_36

    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaItem;->description:Lcom/einmalfel/earl/MediaTitle;

    if-eqz v0, :cond_36

    .line 179
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaItem;->description:Lcom/einmalfel/earl/MediaTitle;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaTitle;->value:Ljava/lang/String;

    goto :goto_6

    .line 181
    :cond_36
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getEnclosures()Ljava/util/List;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/einmalfel/earl/Enclosure;",
            ">;"
        }
    .end annotation

    .prologue
    .line 218
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->enclosures:Ljava/util/List;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 224
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->guid:Lcom/einmalfel/earl/RSSGuid;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->guid:Lcom/einmalfel/earl/RSSGuid;

    iget-object v0, v0, Lcom/einmalfel/earl/RSSGuid;->value:Ljava/lang/String;

    goto :goto_5
.end method

.method public getImageLink()Ljava/lang/String;
    .registers 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesItem;->image:Ljava/net/URL;

    if-eqz v0, :cond_13

    .line 188
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesItem;->image:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    .line 193
    :goto_12
    return-object v0

    .line 190
    :cond_13
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    if-eqz v0, :cond_33

    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaItem;->thumbnails:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_33

    .line 191
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaItem;->thumbnails:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/MediaThumbnail;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaThumbnail;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_12

    .line 193
    :cond_33
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getLink()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 142
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->link:Ljava/net/URL;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->link:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public getPublicationDate()Ljava/util/Date;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 148
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->pubDate:Ljava/util/Date;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 154
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->title:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 155
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->title:Ljava/lang/String;

    .line 163
    :goto_6
    return-object v0

    .line 157
    :cond_7
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaItem;->title:Lcom/einmalfel/earl/MediaTitle;

    if-eqz v0, :cond_18

    .line 158
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->media:Lcom/einmalfel/earl/MediaItem;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaItem;->title:Lcom/einmalfel/earl/MediaTitle;

    iget-object v0, v0, Lcom/einmalfel/earl/MediaTitle;->value:Ljava/lang/String;

    goto :goto_6

    .line 160
    :cond_18
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesItem;->subtitle:Ljava/lang/String;

    if-eqz v0, :cond_27

    .line 161
    iget-object v0, p0, Lcom/einmalfel/earl/RSSItem;->itunes:Lcom/einmalfel/earl/ItunesItem;

    iget-object v0, v0, Lcom/einmalfel/earl/ItunesItem;->subtitle:Ljava/lang/String;

    goto :goto_6

    .line 163
    :cond_27
    const/4 v0, 0x0

    goto :goto_6
.end method
