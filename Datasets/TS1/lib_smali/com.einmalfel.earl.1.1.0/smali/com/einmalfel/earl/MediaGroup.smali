.class public Lcom/einmalfel/earl/MediaGroup;
.super Lcom/einmalfel/earl/MediaCommon;
.source "MediaGroup.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.MediaGroup"

.field static final XML_TAG:Ljava/lang/String; = "group"


# instance fields
.field public final contents:Ljava/util/List;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaContent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/MediaCommon;Ljava/util/List;)V
    .registers 4
    .param p1, "common"    # Lcom/einmalfel/earl/MediaCommon;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/einmalfel/earl/MediaCommon;",
            "Ljava/util/List",
            "<",
            "Lcom/einmalfel/earl/MediaContent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p2, "contents":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaContent;>;"
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/MediaCommon;-><init>(Lcom/einmalfel/earl/MediaCommon;)V

    .line 42
    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/einmalfel/earl/MediaGroup;->contents:Ljava/util/List;

    .line 43
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaGroup;
    .registers 8
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
    const/4 v6, 0x2

    .line 23
    const/4 v3, 0x0

    const-string v4, "group"

    invoke-interface {p0, v6, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 24
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 25
    .local v1, "contents":Ljava/util/List;, "Ljava/util/List<Lcom/einmalfel/earl/MediaContent;>;"
    new-instance v0, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;

    invoke-direct {v0}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;-><init>()V

    .line 26
    .local v0, "builder":Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;
    :goto_11
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v3

    if-ne v3, v6, :cond_50

    .line 27
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    .line 28
    .local v2, "tagName":Ljava/lang/String;
    const-string v3, "content"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 29
    invoke-static {p0}, Lcom/einmalfel/earl/MediaContent;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaContent;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    :cond_2a
    :goto_2a
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_11

    .line 30
    :cond_2e
    invoke-virtual {v0, p0}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->parseTag(Lorg/xmlpull/v1/XmlPullParser;)Z

    move-result v3

    if-nez v3, :cond_2a

    .line 31
    const-string v3, "Earl.MediaGroup"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected tag found in media:group: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_2a

    .line 36
    .end local v2    # "tagName":Ljava/lang/String;
    :cond_50
    new-instance v3, Lcom/einmalfel/earl/MediaGroup;

    invoke-virtual {v0}, Lcom/einmalfel/earl/MediaCommon$MediaCommonBuilder;->build()Lcom/einmalfel/earl/MediaCommon;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lcom/einmalfel/earl/MediaGroup;-><init>(Lcom/einmalfel/earl/MediaCommon;Ljava/util/List;)V

    return-object v3
.end method
