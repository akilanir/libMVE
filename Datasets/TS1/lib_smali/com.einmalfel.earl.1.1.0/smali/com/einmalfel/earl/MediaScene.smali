.class public Lcom/einmalfel/earl/MediaScene;
.super Ljava/lang/Object;
.source "MediaScene.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.MediaScene"

.field static final XML_TAG:Ljava/lang/String; = "scene"


# instance fields
.field public final sceneDescription:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final sceneEndTime:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final sceneStartTime:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final sceneTitle:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 5
    .param p1, "sceneTitle"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "sceneDescription"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "sceneStartTime"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "sceneEndTime"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/einmalfel/earl/MediaScene;->sceneTitle:Ljava/lang/String;

    .line 60
    iput-object p2, p0, Lcom/einmalfel/earl/MediaScene;->sceneDescription:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lcom/einmalfel/earl/MediaScene;->sceneStartTime:Ljava/lang/Integer;

    .line 62
    iput-object p4, p0, Lcom/einmalfel/earl/MediaScene;->sceneEndTime:Ljava/lang/Integer;

    .line 63
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaScene;
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
    const/4 v5, 0x2

    .line 27
    const/4 v4, 0x0

    const-string v6, "scene"

    invoke-interface {p0, v5, v4, v6}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 28
    const/4 v3, 0x0

    .line 29
    .local v3, "sceneTitle":Ljava/lang/String;
    const/4 v0, 0x0

    .line 30
    .local v0, "sceneDescription":Ljava/lang/String;
    const/4 v2, 0x0

    .line 31
    .local v2, "sceneStartTime":Ljava/lang/Integer;
    const/4 v1, 0x0

    .line 33
    .local v1, "sceneEndTime":Ljava/lang/Integer;
    :goto_b
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v4

    if-ne v4, v5, :cond_87

    .line 34
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const/4 v4, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_8e

    :cond_1d
    :goto_1d
    packed-switch v4, :pswitch_data_a0

    .line 48
    const-string v4, "Earl.MediaScene"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected tag inside media:scene: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 51
    :goto_3f
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_b

    .line 34
    :sswitch_43
    const-string v7, "sceneTitle"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1d

    const/4 v4, 0x0

    goto :goto_1d

    :sswitch_4d
    const-string v7, "sceneDescription"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1d

    const/4 v4, 0x1

    goto :goto_1d

    :sswitch_57
    const-string v7, "sceneStartTime"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1d

    move v4, v5

    goto :goto_1d

    :sswitch_61
    const-string v7, "sceneEndTime"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1d

    const/4 v4, 0x3

    goto :goto_1d

    .line 36
    :pswitch_6b
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    .line 37
    goto :goto_3f

    .line 39
    :pswitch_70
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    .line 40
    goto :goto_3f

    .line 42
    :pswitch_75
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->parseMediaRssTime(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    .line 43
    goto :goto_3f

    .line 45
    :pswitch_7e
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->parseMediaRssTime(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    .line 46
    goto :goto_3f

    .line 54
    :cond_87
    new-instance v4, Lcom/einmalfel/earl/MediaScene;

    invoke-direct {v4, v3, v0, v2, v1}, Lcom/einmalfel/earl/MediaScene;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-object v4

    .line 34
    nop

    :sswitch_data_8e
    .sparse-switch
        -0x4d1c7c30 -> :sswitch_4d
        0x10296f23 -> :sswitch_57
        0x1ee2741c -> :sswitch_61
        0x7b63912c -> :sswitch_43
    .end sparse-switch

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_6b
        :pswitch_70
        :pswitch_75
        :pswitch_7e
    .end packed-switch
.end method
