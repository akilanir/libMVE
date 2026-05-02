.class Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;
.super Ljava/lang/Object;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/MediaItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MediaItemBuilder"
.end annotation


# instance fields
.field private builder:Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;

.field private contents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaContent;",
            ">;"
        }
    .end annotation
.end field

.field private groups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaGroup;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->groups:Ljava/util/List;

    .line 17
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->contents:Ljava/util/List;

    .line 18
    new-instance v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;

    invoke-direct {v0}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;-><init>()V

    iput-object v0, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->builder:Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;

    return-void
.end method


# virtual methods
.method build()Lcom/einmalfel/earl/MediaItem;
    .registers 5

    .prologue
    .line 36
    new-instance v0, Lcom/einmalfel/earl/MediaItem;

    iget-object v1, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->groups:Ljava/util/List;

    iget-object v2, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->contents:Ljava/util/List;

    iget-object v3, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->builder:Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;

    invoke-virtual {v3}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->build()Lcom/einmalfel/earl/MediaCommon;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/einmalfel/earl/MediaItem;-><init>(Ljava/util/List;Ljava/util/List;Lcom/einmalfel/earl/MediaCommon;)V

    return-object v0
.end method

.method parseTag(Lorg/xmlpull/v1/XmlPullParser;)Z
    .registers 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 21
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 22
    .local v0, "tagName":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_40

    :cond_d
    :goto_d
    packed-switch v2, :pswitch_data_4a

    .line 30
    iget-object v1, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->builder:Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;

    invoke-virtual {v1, p1}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->parseTag(Lorg/xmlpull/v1/XmlPullParser;)Z

    move-result v1

    .line 32
    :goto_16
    return v1

    .line 22
    :sswitch_17
    const-string v3, "group"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    const/4 v2, 0x0

    goto :goto_d

    :sswitch_21
    const-string v3, "content"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    move v2, v1

    goto :goto_d

    .line 24
    :pswitch_2b
    iget-object v2, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->groups:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaGroup;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaGroup;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 27
    :pswitch_35
    iget-object v2, p0, Lcom/einmalfel/earl/MediaItem$MediaItemBuilder;->contents:Ljava/util/List;

    invoke-static {p1}, Lcom/einmalfel/earl/MediaContent;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaContent;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_16

    .line 22
    nop

    :sswitch_data_40
    .sparse-switch
        0x5e0f67f -> :sswitch_17
        0x38b73479 -> :sswitch_21
    .end sparse-switch

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_35
    .end packed-switch
.end method
