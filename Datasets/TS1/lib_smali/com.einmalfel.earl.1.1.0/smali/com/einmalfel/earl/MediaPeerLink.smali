.class public Lcom/einmalfel/earl/MediaPeerLink;
.super Ljava/lang/Object;
.source "MediaPeerLink.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "peerLink"


# instance fields
.field public final href:Ljava/net/URL;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/net/URL;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "href"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/einmalfel/earl/MediaPeerLink;->type:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Lcom/einmalfel/earl/MediaPeerLink;->href:Ljava/net/URL;

    .line 33
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaPeerLink;
    .registers 5
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
    .line 22
    const/4 v1, 0x2

    const/4 v2, 0x0

    const-string v3, "peerLink"

    invoke-interface {p0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 23
    new-instance v0, Lcom/einmalfel/earl/MediaPeerLink;

    const-string v1, ""

    const-string v2, "type"

    .line 24
    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    const-string v3, "href"

    .line 25
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/MediaPeerLink;-><init>(Ljava/lang/String;Ljava/net/URL;)V

    .line 26
    .local v0, "result":Lcom/einmalfel/earl/MediaPeerLink;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 27
    return-object v0
.end method
