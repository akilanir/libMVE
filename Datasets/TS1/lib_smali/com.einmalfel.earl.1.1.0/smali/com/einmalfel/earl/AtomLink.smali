.class public Lcom/einmalfel/earl/AtomLink;
.super Lcom/einmalfel/earl/AtomCommonAttributes;
.source "AtomLink.java"

# interfaces
.implements Lcom/einmalfel/earl/Enclosure;


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.AtomLink"

.field static final XML_TAG:Ljava/lang/String; = "link"


# instance fields
.field public final href:Ljava/net/URI;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final hreflang:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final length:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final rel:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final title:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .registers 8
    .param p1, "atomCommonAttributes"    # Lcom/einmalfel/earl/AtomCommonAttributes;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "href"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "rel"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "hreflang"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7, "length"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 50
    iput-object p2, p0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    .line 51
    iput-object p3, p0, Lcom/einmalfel/earl/AtomLink;->rel:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    .line 53
    iput-object p5, p0, Lcom/einmalfel/earl/AtomLink;->hreflang:Ljava/lang/String;

    .line 54
    iput-object p6, p0, Lcom/einmalfel/earl/AtomLink;->title:Ljava/lang/String;

    .line 55
    iput-object p7, p0, Lcom/einmalfel/earl/AtomLink;->length:Ljava/lang/Integer;

    .line 56
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomLink;
    .registers 11
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
    const/4 v7, 0x0

    .line 32
    const/4 v1, 0x2

    const-string v2, "link"

    invoke-interface {p0, v1, v7, v2}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 33
    const-string v1, ""

    const-string v2, "length"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 34
    .local v8, "length":Ljava/lang/String;
    new-instance v0, Lcom/einmalfel/earl/AtomLink;

    new-instance v1, Lcom/einmalfel/earl/AtomCommonAttributes;

    invoke-direct {v1, p0}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    const-string v2, ""

    const-string v3, "href"

    .line 36
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    const-string v3, ""

    const-string v4, "rel"

    .line 37
    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    const-string v5, "type"

    .line 38
    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    const-string v6, "hreflang"

    .line 39
    invoke-interface {p0, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    const-string v9, "title"

    .line 40
    invoke-interface {p0, v6, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v8, :cond_4b

    .line 41
    :goto_44
    invoke-direct/range {v0 .. v7}, Lcom/einmalfel/earl/AtomLink;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 42
    .local v0, "result":Lcom/einmalfel/earl/AtomLink;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 43
    return-object v0

    .line 41
    .end local v0    # "result":Lcom/einmalfel/earl/AtomLink;
    :cond_4b
    invoke-static {v8}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_44
.end method


# virtual methods
.method public getLength()Ljava/lang/Integer;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/einmalfel/earl/AtomLink;->length:Ljava/lang/Integer;

    return-object v0
.end method

.method public getLink()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lcom/einmalfel/earl/AtomLink;->href:Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/einmalfel/earl/AtomLink;->type:Ljava/lang/String;

    return-object v0
.end method
