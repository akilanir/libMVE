.class Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;
.super Ljava/lang/Object;
.source "MediaCommon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/MediaCommon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MediaCommonBuilder"
.end annotation


# instance fields
.field private adult:Ljava/lang/Boolean;

.field private backLinks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation
.end field

.field private categories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaCategory;",
            ">;"
        }
    .end annotation
.end field

.field private comments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private community:Lcom/einmalfel/earl/MediaCommunity;

.field private copyright:Lcom/einmalfel/earl/MediaCopyright;

.field private credits:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaCredit;",
            ">;"
        }
    .end annotation
.end field

.field private description:Lcom/einmalfel/earl/MediaTitle;

.field private embed:Lcom/einmalfel/earl/MediaEmbed;

.field private hash:Lcom/einmalfel/earl/MediaHash;

.field private keywords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private license:Lcom/einmalfel/earl/MediaLicense;

.field private location:Lcom/einmalfel/earl/MediaLocation;

.field private peerLink:Lcom/einmalfel/earl/MediaPeerLink;

.field private player:Lcom/einmalfel/earl/MediaPlayer;

.field private prices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaPrice;",
            ">;"
        }
    .end annotation
.end field

.field private rating:Lcom/einmalfel/earl/MediaRating;

.field private responses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private restrictions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaRestriction;",
            ">;"
        }
    .end annotation
.end field

.field private rights:Lcom/einmalfel/earl/MediaRights;

.field private scenes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaScene;",
            ">;"
        }
    .end annotation
.end field

.field private status:Lcom/einmalfel/earl/MediaStatus;

.field private subTitles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaSubTitle;",
            ">;"
        }
    .end annotation
.end field

.field private texts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaText;",
            ">;"
        }
    .end annotation
.end field

.field private thumbnails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaThumbnail;",
            ">;"
        }
    .end annotation
.end field

.field private title:Lcom/einmalfel/earl/MediaTitle;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->thumbnails:Ljava/util/List;

    .line 24
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->categories:Ljava/util/List;

    .line 27
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->credits:Ljava/util/List;

    .line 29
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->texts:Ljava/util/List;

    .line 30
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->restrictions:Ljava/util/List;

    .line 32
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->comments:Ljava/util/List;

    .line 34
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->responses:Ljava/util/List;

    .line 35
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->backLinks:Ljava/util/List;

    .line 37
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->prices:Ljava/util/List;

    .line 39
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->subTitles:Ljava/util/List;

    .line 43
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->scenes:Ljava/util/List;

    return-void
.end method


# virtual methods
.method build()Lcom/einmalfel/earl/MediaCommon;
    .registers 29

    .prologue
    .line 149
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->keywords:Ljava/util/List;

    if-nez v1, :cond_f

    .line 150
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->keywords:Ljava/util/List;

    .line 152
    :cond_f
    new-instance v1, Lcom/einmalfel/earl/MediaCommon;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->adult:Ljava/lang/Boolean;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->rating:Lcom/einmalfel/earl/MediaRating;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->title:Lcom/einmalfel/earl/MediaTitle;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->description:Lcom/einmalfel/earl/MediaTitle;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->keywords:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->thumbnails:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->categories:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->hash:Lcom/einmalfel/earl/MediaHash;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->player:Lcom/einmalfel/earl/MediaPlayer;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->credits:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->copyright:Lcom/einmalfel/earl/MediaCopyright;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->texts:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->restrictions:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->community:Lcom/einmalfel/earl/MediaCommunity;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->comments:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->embed:Lcom/einmalfel/earl/MediaEmbed;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->responses:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->backLinks:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->status:Lcom/einmalfel/earl/MediaStatus;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->prices:Ljava/util/List;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->license:Lcom/einmalfel/earl/MediaLicense;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->subTitles:Ljava/util/List;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->peerLink:Lcom/einmalfel/earl/MediaPeerLink;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->location:Lcom/einmalfel/earl/MediaLocation;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->rights:Lcom/einmalfel/earl/MediaRights;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->scenes:Ljava/util/List;

    move-object/from16 v27, v0

    invoke-direct/range {v1 .. v27}, Lcom/einmalfel/earl/MediaCommon;-><init>(Ljava/lang/Boolean;Lcom/einmalfel/earl/MediaRating;Lcom/einmalfel/earl/MediaTitle;Lcom/einmalfel/earl/MediaTitle;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/MediaHash;Lcom/einmalfel/earl/MediaPlayer;Ljava/util/List;Lcom/einmalfel/earl/MediaCopyright;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/MediaCommunity;Ljava/util/List;Lcom/einmalfel/earl/MediaEmbed;Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/MediaStatus;Ljava/util/List;Lcom/einmalfel/earl/MediaLicense;Ljava/util/List;Lcom/einmalfel/earl/MediaPeerLink;Lcom/einmalfel/earl/MediaLocation;Lcom/einmalfel/earl/MediaRights;Ljava/util/List;)V

    return-object v1
.end method

.method parseTag(Lorg/xmlpull/v1/XmlPullParser;)Z
    .registers 9
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x2

    .line 51
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v2, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_25c

    :cond_10
    :goto_10
    packed-switch v2, :pswitch_data_2c6

    .line 145
    :goto_13
    return v0

    .line 51
    :sswitch_14
    const-string v5, "adult"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    move v2, v0

    goto :goto_10

    :sswitch_1e
    const-string v5, "rating"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    move v2, v1

    goto :goto_10

    :sswitch_28
    const-string v5, "title"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    move v2, v3

    goto :goto_10

    :sswitch_32
    const-string v5, "description"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/4 v2, 0x3

    goto :goto_10

    :sswitch_3c
    const-string v5, "keywords"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/4 v2, 0x4

    goto :goto_10

    :sswitch_46
    const-string v5, "thumbnail"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/4 v2, 0x5

    goto :goto_10

    :sswitch_50
    const-string v5, "category"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/4 v2, 0x6

    goto :goto_10

    :sswitch_5a
    const-string v5, "hash"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/4 v2, 0x7

    goto :goto_10

    :sswitch_64
    const-string v5, "player"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x8

    goto :goto_10

    :sswitch_6f
    const-string v5, "credit"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x9

    goto :goto_10

    :sswitch_7a
    const-string v5, "copyright"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0xa

    goto :goto_10

    :sswitch_85
    const-string v5, "text"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0xb

    goto :goto_10

    :sswitch_90
    const-string v5, "restriction"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0xc

    goto/16 :goto_10

    :sswitch_9c
    const-string v5, "community"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0xd

    goto/16 :goto_10

    :sswitch_a8
    const-string v5, "comments"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0xe

    goto/16 :goto_10

    :sswitch_b4
    const-string v5, "embed"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0xf

    goto/16 :goto_10

    :sswitch_c0
    const-string v5, "responses"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x10

    goto/16 :goto_10

    :sswitch_cc
    const-string v5, "backLinks"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x11

    goto/16 :goto_10

    :sswitch_d8
    const-string v5, "status"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x12

    goto/16 :goto_10

    :sswitch_e4
    const-string v5, "price"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x13

    goto/16 :goto_10

    :sswitch_f0
    const-string v5, "license"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x14

    goto/16 :goto_10

    :sswitch_fc
    const-string v5, "subTitle"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x15

    goto/16 :goto_10

    :sswitch_108
    const-string v5, "peerLink"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x16

    goto/16 :goto_10

    :sswitch_114
    const-string v5, "location"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x17

    goto/16 :goto_10

    :sswitch_120
    const-string v5, "rights"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x18

    goto/16 :goto_10

    :sswitch_12c
    const-string v5, "scenes"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    const/16 v2, 0x19

    goto/16 :goto_10

    .line 53
    :pswitch_138
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->adult:Ljava/lang/Boolean;

    :cond_146
    :goto_146
    move v0, v1

    .line 145
    goto/16 :goto_13

    .line 56
    :pswitch_149
    invoke-static {p1}, Lcom/einmalfel/earl/MediaRating;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaRating;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->rating:Lcom/einmalfel/earl/MediaRating;

    goto :goto_146

    .line 59
    :pswitch_150
    invoke-static {p1}, Lcom/einmalfel/earl/MediaTitle;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaTitle;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->title:Lcom/einmalfel/earl/MediaTitle;

    goto :goto_146

    .line 62
    :pswitch_157
    invoke-static {p1}, Lcom/einmalfel/earl/MediaTitle;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaTitle;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->description:Lcom/einmalfel/earl/MediaTitle;

    goto :goto_146

    .line 65
    :pswitch_15e
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->keywords:Ljava/util/List;

    goto :goto_146

    .line 68
    :pswitch_16f
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->thumbnails:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaThumbnail;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaThumbnail;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_146

    .line 71
    :pswitch_179
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->categories:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaCategory;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCategory;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_146

    .line 74
    :pswitch_183
    invoke-static {p1}, Lcom/einmalfel/earl/MediaHash;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaHash;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->hash:Lcom/einmalfel/earl/MediaHash;

    goto :goto_146

    .line 77
    :pswitch_18a
    invoke-static {p1}, Lcom/einmalfel/earl/MediaPlayer;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->player:Lcom/einmalfel/earl/MediaPlayer;

    goto :goto_146

    .line 80
    :pswitch_191
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->credits:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaCredit;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCredit;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_146

    .line 83
    :pswitch_19b
    invoke-static {p1}, Lcom/einmalfel/earl/MediaCopyright;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCopyright;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->copyright:Lcom/einmalfel/earl/MediaCopyright;

    goto :goto_146

    .line 86
    :pswitch_1a2
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->texts:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaText;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaText;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_146

    .line 89
    :pswitch_1ac
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->restrictions:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaRestriction;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaRestriction;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_146

    .line 92
    :pswitch_1b6
    invoke-static {p1}, Lcom/einmalfel/earl/MediaCommunity;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCommunity;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->community:Lcom/einmalfel/earl/MediaCommunity;

    goto :goto_146

    .line 95
    :goto_1bd
    :pswitch_1bd
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0

    if-ne v0, v3, :cond_146

    .line 96
    const-string v0, "comment"

    invoke-interface {p1, v3, v6, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->comments:Ljava/util/List;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1bd

    .line 101
    :pswitch_1d2
    invoke-static {p1}, Lcom/einmalfel/earl/MediaEmbed;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaEmbed;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->embed:Lcom/einmalfel/earl/MediaEmbed;

    goto/16 :goto_146

    .line 104
    :goto_1da
    :pswitch_1da
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0

    if-ne v0, v3, :cond_146

    .line 105
    const-string v0, "response"

    invoke-interface {p1, v3, v6, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 106
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->responses:Ljava/util/List;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1da

    .line 110
    :goto_1ef
    :pswitch_1ef
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0

    if-ne v0, v3, :cond_146

    .line 111
    const-string v0, "backLink"

    invoke-interface {p1, v3, v6, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 112
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->backLinks:Ljava/util/List;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1ef

    .line 116
    :pswitch_208
    invoke-static {p1}, Lcom/einmalfel/earl/MediaStatus;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaStatus;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->status:Lcom/einmalfel/earl/MediaStatus;

    goto/16 :goto_146

    .line 119
    :pswitch_210
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->prices:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaPrice;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaPrice;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_146

    .line 122
    :pswitch_21b
    invoke-static {p1}, Lcom/einmalfel/earl/MediaLicense;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaLicense;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->license:Lcom/einmalfel/earl/MediaLicense;

    goto/16 :goto_146

    .line 125
    :pswitch_223
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->subTitles:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaSubTitle;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaSubTitle;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_146

    .line 128
    :pswitch_22e
    invoke-static {p1}, Lcom/einmalfel/earl/MediaPeerLink;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaPeerLink;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->peerLink:Lcom/einmalfel/earl/MediaPeerLink;

    goto/16 :goto_146

    .line 131
    :pswitch_236
    invoke-static {p1}, Lcom/einmalfel/earl/MediaLocation;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaLocation;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->location:Lcom/einmalfel/earl/MediaLocation;

    goto/16 :goto_146

    .line 134
    :pswitch_23e
    invoke-static {p1}, Lcom/einmalfel/earl/MediaRights;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaRights;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->rights:Lcom/einmalfel/earl/MediaRights;

    goto/16 :goto_146

    .line 137
    :goto_246
    :pswitch_246
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v0

    if-ne v0, v3, :cond_146

    .line 138
    const-string v0, "scene"

    invoke-interface {p1, v3, v6, v0}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->scenes:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaScene;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaScene;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_246

    .line 51
    nop

    :sswitch_data_25c
    .sparse-switch
        -0x7c93a408 -> :sswitch_fc
        -0x74d48bae -> :sswitch_c0
        -0x66ca7c04 -> :sswitch_32
        -0x5d0bec34 -> :sswitch_90
        -0x583ad017 -> :sswitch_9c
        -0x509a5507 -> :sswitch_6f
        -0x3ac1651f -> :sswitch_64
        -0x37ea4e63 -> :sswitch_1e
        -0x377f7e29 -> :sswitch_120
        -0x36200699 -> :sswitch_12c
        -0x3532300e -> :sswitch_d8
        -0x23e8220c -> :sswitch_a8
        0x30c10e -> :sswitch_5a
        0x36452d -> :sswitch_85
        0x302bcfe -> :sswitch_50
        0x41d147c -> :sswitch_108
        0x58621ba -> :sswitch_14
        0x5c24ed9 -> :sswitch_b4
        0x65fb149 -> :sswitch_e4
        0x6942258 -> :sswitch_28
        0x9f08441 -> :sswitch_f0
        0x1f2e9faa -> :sswitch_3c
        0x4e845312 -> :sswitch_cc
        0x4f4e50ec -> :sswitch_46
        0x5ac573c7 -> :sswitch_7a
        0x714f9fb5 -> :sswitch_114
    .end sparse-switch

    :pswitch_data_2c6
    .packed-switch 0x0
        :pswitch_138
        :pswitch_149
        :pswitch_150
        :pswitch_157
        :pswitch_15e
        :pswitch_16f
        :pswitch_179
        :pswitch_183
        :pswitch_18a
        :pswitch_191
        :pswitch_19b
        :pswitch_1a2
        :pswitch_1ac
        :pswitch_1b6
        :pswitch_1bd
        :pswitch_1d2
        :pswitch_1da
        :pswitch_1ef
        :pswitch_208
        :pswitch_210
        :pswitch_21b
        :pswitch_223
        :pswitch_22e
        :pswitch_236
        :pswitch_23e
        :pswitch_246
    .end packed-switch
.end method
