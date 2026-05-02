.class public Lcom/einmalfel/earl/AtomContent;
.super Lcom/einmalfel/earl/AtomText;
.source "AtomContent.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "content"


# instance fields
.field public final src:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/URI;Lcom/einmalfel/earl/AtomText;)V
    .registers 3
    .param p1, "src"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "atomText"    # Lcom/einmalfel/earl/AtomText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 28
    invoke-direct {p0, p2}, Lcom/einmalfel/earl/AtomText;-><init>(Lcom/einmalfel/earl/AtomText;)V

    .line 29
    iput-object p1, p0, Lcom/einmalfel/earl/AtomContent;->src:Ljava/net/URI;

    .line 30
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomContent;
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
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x2

    const-string v3, "content"

    invoke-interface {p0, v2, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    const-string v2, ""

    const-string v3, "src"

    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 22
    .local v0, "srcString":Ljava/lang/String;
    new-instance v2, Lcom/einmalfel/earl/AtomContent;

    if-nez v0, :cond_1b

    .line 24
    :goto_13
    invoke-static {p0}, Lcom/einmalfel/earl/AtomText;->read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomText;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcom/einmalfel/earl/AtomContent;-><init>(Ljava/net/URI;Lcom/einmalfel/earl/AtomText;)V

    return-object v2

    .line 23
    :cond_1b
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    goto :goto_13
.end method
