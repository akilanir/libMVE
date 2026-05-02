.class public Lcom/einmalfel/earl/AtomGenerator;
.super Lcom/einmalfel/earl/AtomCommonAttributes;
.source "AtomGenerator.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "generator"


# instance fields
.field public final uri:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final value:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final version:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "atomCommonAttributes"    # Lcom/einmalfel/earl/AtomCommonAttributes;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "uri"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "version"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 36
    iput-object p2, p0, Lcom/einmalfel/earl/AtomGenerator;->uri:Ljava/net/URI;

    .line 37
    iput-object p3, p0, Lcom/einmalfel/earl/AtomGenerator;->version:Ljava/lang/String;

    .line 38
    iput-object p4, p0, Lcom/einmalfel/earl/AtomGenerator;->value:Ljava/lang/String;

    .line 39
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomGenerator;
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
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x2

    const-string v3, "generator"

    invoke-interface {p0, v2, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    const-string v2, ""

    const-string v3, "uri"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "uri":Ljava/lang/String;
    new-instance v2, Lcom/einmalfel/earl/AtomGenerator;

    new-instance v3, Lcom/einmalfel/earl/AtomCommonAttributes;

    invoke-direct {v3, p0}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    if-nez v0, :cond_28

    .line 28
    :goto_18
    const-string v4, ""

    const-string v5, "uri"

    .line 29
    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 30
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v1, v4, v5}, Lcom/einmalfel/earl/AtomGenerator;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    .line 28
    :cond_28
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    goto :goto_18
.end method
