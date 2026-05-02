.class public Lcom/einmalfel/earl/MediaLocation;
.super Ljava/lang/Object;
.source "MediaLocation.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "location"


# instance fields
.field public final description:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final end:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final start:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 4
    .param p1, "description"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "start"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "end"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/einmalfel/earl/MediaLocation;->description:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/einmalfel/earl/MediaLocation;->start:Ljava/lang/Integer;

    .line 38
    iput-object p3, p0, Lcom/einmalfel/earl/MediaLocation;->end:Ljava/lang/Integer;

    .line 39
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaLocation;
    .registers 7
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
    const/4 v3, 0x0

    .line 23
    const/4 v4, 0x2

    const-string v5, "location"

    invoke-interface {p0, v4, v3, v5}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 24
    const-string v4, ""

    const-string v5, "start"

    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 25
    .local v2, "start":Ljava/lang/String;
    const-string v4, ""

    const-string v5, "end"

    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "end":Ljava/lang/String;
    new-instance v1, Lcom/einmalfel/earl/MediaLocation;

    const-string v4, ""

    const-string v5, "description"

    .line 27
    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v2, :cond_2d

    move-object v4, v3

    .line 28
    :goto_24
    if-nez v0, :cond_32

    .line 29
    :goto_26
    invoke-direct {v1, v5, v4, v3}, Lcom/einmalfel/earl/MediaLocation;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 30
    .local v1, "result":Lcom/einmalfel/earl/MediaLocation;
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 31
    return-object v1

    .line 28
    .end local v1    # "result":Lcom/einmalfel/earl/MediaLocation;
    :cond_2d
    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->parseMediaRssTime(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_24

    .line 29
    :cond_32
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->parseMediaRssTime(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_26
.end method
