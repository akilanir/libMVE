.class public Lcom/einmalfel/earl/RSSEnclosure;
.super Ljava/lang/Object;
.source "RSSEnclosure.java"

# interfaces
.implements Lcom/einmalfel/earl/Enclosure;


# static fields
.field static final XML_TAG:Ljava/lang/String; = "enclosure"


# instance fields
.field public final length:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final url:Ljava/net/URL;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/String;)V
    .registers 4
    .param p1, "url"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "length"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/einmalfel/earl/RSSEnclosure;->url:Ljava/net/URL;

    .line 35
    iput-object p2, p0, Lcom/einmalfel/earl/RSSEnclosure;->length:Ljava/lang/Integer;

    .line 36
    iput-object p3, p0, Lcom/einmalfel/earl/RSSEnclosure;->type:Ljava/lang/String;

    .line 37
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSEnclosure;
    .registers 6
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
    .line 24
    const/4 v1, 0x2

    const-string v2, ""

    const-string v3, "enclosure"

    invoke-interface {p0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    new-instance v0, Lcom/einmalfel/earl/RSSEnclosure;

    const-string v1, ""

    const-string v2, "url"

    .line 26
    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    const-string v2, ""

    const-string v3, "length"

    .line 27
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, ""

    const-string v4, "type"

    .line 28
    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/einmalfel/earl/RSSEnclosure;-><init>(Ljava/net/URL;Ljava/lang/Integer;Ljava/lang/String;)V

    .line 29
    .local v0, "result":Lcom/einmalfel/earl/RSSEnclosure;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    .line 30
    return-object v0
.end method


# virtual methods
.method public getLength()Ljava/lang/Integer;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/einmalfel/earl/RSSEnclosure;->length:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLink()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lcom/einmalfel/earl/RSSEnclosure;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/einmalfel/earl/RSSEnclosure;->type:Ljava/lang/String;

    return-object v0
.end method
