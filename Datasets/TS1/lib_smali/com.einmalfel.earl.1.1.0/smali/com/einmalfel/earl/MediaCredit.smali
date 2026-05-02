.class public Lcom/einmalfel/earl/MediaCredit;
.super Ljava/lang/Object;
.source "MediaCredit.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "credit"


# instance fields
.field public final role:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final scheme:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final value:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/net/URI;Ljava/lang/String;)V
    .registers 4
    .param p1, "role"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "scheme"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/einmalfel/earl/MediaCredit;->role:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lcom/einmalfel/earl/MediaCredit;->scheme:Ljava/net/URI;

    .line 34
    iput-object p3, p0, Lcom/einmalfel/earl/MediaCredit;->value:Ljava/lang/String;

    .line 35
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaCredit;
    .registers 6
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
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x2

    const-string v3, "credit"

    invoke-interface {p0, v2, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    const-string v2, ""

    const-string v3, "scheme"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "scheme":Ljava/lang/String;
    new-instance v2, Lcom/einmalfel/earl/MediaCredit;

    const-string v3, ""

    const-string v4, "scheme"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v0, :cond_23

    .line 28
    :goto_1b
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4}, Lcom/einmalfel/earl/MediaCredit;-><init>(Ljava/lang/String;Ljava/net/URI;Ljava/lang/String;)V

    return-object v2

    .line 27
    :cond_23
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    goto :goto_1b
.end method
