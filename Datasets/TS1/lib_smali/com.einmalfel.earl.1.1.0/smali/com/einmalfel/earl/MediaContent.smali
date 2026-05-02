.class public Lcom/einmalfel/earl/MediaContent;
.super Lcom/einmalfel/earl/MediaCommon;
.source "MediaContent.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "content"


# instance fields
.field public final bitrate:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final channels:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final duration:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final expression:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final fileSize:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final framerate:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final height:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final isDefault:Ljava/lang/Boolean;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final lang:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final medium:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final samplingrate:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final url:Ljava/net/URL;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final width:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Lcom/einmalfel/earl/MediaCommon;)V
    .registers 16
    .param p1, "url"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "fileSize"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "medium"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "isDefault"    # Ljava/lang/Boolean;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "expression"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7, "bitrate"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p8, "framerate"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p9, "samplingrate"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10, "channels"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p11, "duration"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p12, "height"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p13, "width"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p14, "lang"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p15, "source"    # Lcom/einmalfel/earl/MediaCommon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 81
    invoke-direct {p0, p15}, Lcom/einmalfel/earl/MediaCommon;-><init>(Lcom/einmalfel/earl/MediaCommon;)V

    .line 82
    iput-object p1, p0, Lcom/einmalfel/earl/MediaContent;->url:Ljava/net/URL;

    .line 83
    iput-object p2, p0, Lcom/einmalfel/earl/MediaContent;->fileSize:Ljava/lang/Integer;

    .line 84
    iput-object p3, p0, Lcom/einmalfel/earl/MediaContent;->type:Ljava/lang/String;

    .line 85
    iput-object p4, p0, Lcom/einmalfel/earl/MediaContent;->medium:Ljava/lang/String;

    .line 86
    iput-object p5, p0, Lcom/einmalfel/earl/MediaContent;->isDefault:Ljava/lang/Boolean;

    .line 87
    iput-object p6, p0, Lcom/einmalfel/earl/MediaContent;->expression:Ljava/lang/String;

    .line 88
    iput-object p7, p0, Lcom/einmalfel/earl/MediaContent;->bitrate:Ljava/lang/Integer;

    .line 89
    iput-object p8, p0, Lcom/einmalfel/earl/MediaContent;->framerate:Ljava/lang/Integer;

    .line 90
    iput-object p9, p0, Lcom/einmalfel/earl/MediaContent;->samplingrate:Ljava/lang/Integer;

    .line 91
    iput-object p10, p0, Lcom/einmalfel/earl/MediaContent;->channels:Ljava/lang/Integer;

    .line 92
    iput-object p11, p0, Lcom/einmalfel/earl/MediaContent;->duration:Ljava/lang/Integer;

    .line 93
    iput-object p12, p0, Lcom/einmalfel/earl/MediaContent;->height:Ljava/lang/Integer;

    .line 94
    iput-object p13, p0, Lcom/einmalfel/earl/MediaContent;->width:Ljava/lang/Integer;

    .line 95
    iput-object p14, p0, Lcom/einmalfel/earl/MediaContent;->lang:Ljava/lang/String;

    .line 96
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaContent;
    .registers 30
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
    .line 46
    const/4 v3, 0x2

    const/4 v4, 0x0

    const-string v5, "content"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 47
    const-string v3, ""

    const-string v4, "url"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 48
    .local v27, "url":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "fileSize"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 49
    .local v22, "fileSize":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "isDefault"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 50
    .local v25, "isDefault":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "bitrate"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 51
    .local v19, "bitrate":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "framerate"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 52
    .local v23, "framerate":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "samplingrate"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 53
    .local v26, "samplingrate":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "channels"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 54
    .local v20, "channels":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "duration"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 55
    .local v21, "duration":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "height"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 56
    .local v24, "height":Ljava/lang/String;
    const-string v3, ""

    const-string v4, "width"

    move-object/from16 v0, p0

    invoke-interface {v0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 57
    .local v28, "width":Ljava/lang/String;
    new-instance v3, Lcom/einmalfel/earl/MediaContent;

    if-nez v27, :cond_c2

    const/4 v4, 0x0

    :goto_72
    if-nez v22, :cond_c7

    const/4 v5, 0x0

    .line 58
    :goto_75
    const-string v6, ""

    const-string v7, "type"

    .line 59
    move-object/from16 v0, p0

    invoke-interface {v0, v6, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    const-string v8, "medium"

    .line 60
    move-object/from16 v0, p0

    invoke-interface {v0, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v25, :cond_cc

    const/4 v8, 0x0

    .line 61
    :goto_8c
    const-string v9, ""

    const-string v10, "expression"

    .line 62
    move-object/from16 v0, p0

    invoke-interface {v0, v9, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-nez v19, :cond_d1

    const/4 v10, 0x0

    .line 63
    :goto_99
    if-nez v23, :cond_d6

    const/4 v11, 0x0

    .line 64
    :goto_9c
    if-nez v26, :cond_db

    const/4 v12, 0x0

    .line 65
    :goto_9f
    if-nez v20, :cond_e0

    const/4 v13, 0x0

    .line 66
    :goto_a2
    if-nez v21, :cond_e5

    const/4 v14, 0x0

    .line 67
    :goto_a5
    if-nez v24, :cond_ea

    const/4 v15, 0x0

    .line 68
    :goto_a8
    if-nez v28, :cond_ef

    const/16 v16, 0x0

    .line 69
    :goto_ac
    const-string v17, ""

    const-string v18, "lang"

    .line 70
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 71
    invoke-static/range {p0 .. p0}, Lcom/einmalfel/earl/MediaCommon;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCommon;

    move-result-object v18

    invoke-direct/range {v3 .. v18}, Lcom/einmalfel/earl/MediaContent;-><init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Lcom/einmalfel/earl/MediaCommon;)V

    return-object v3

    .line 57
    :cond_c2
    invoke-static/range {v27 .. v27}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    goto :goto_72

    .line 58
    :cond_c7
    invoke-static/range {v22 .. v22}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_75

    .line 61
    :cond_cc
    invoke-static/range {v25 .. v25}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v8

    goto :goto_8c

    .line 63
    :cond_d1
    invoke-static/range {v19 .. v19}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v10

    goto :goto_99

    .line 64
    :cond_d6
    invoke-static/range {v23 .. v23}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    goto :goto_9c

    .line 65
    :cond_db
    invoke-static/range {v26 .. v26}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    goto :goto_9f

    .line 66
    :cond_e0
    invoke-static/range {v20 .. v20}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    goto :goto_a2

    .line 67
    :cond_e5
    invoke-static/range {v21 .. v21}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    goto :goto_a5

    .line 68
    :cond_ea
    invoke-static/range {v24 .. v24}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v15

    goto :goto_a8

    .line 69
    :cond_ef
    invoke-static/range {v28 .. v28}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v16

    goto :goto_ac
.end method
