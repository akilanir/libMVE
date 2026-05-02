.class public Lcom/einmalfel/earl/AtomCommonAttributes;
.super Ljava/lang/Object;
.source "AtomCommonAttributes.java"


# instance fields
.field public final base:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final lang:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V
    .registers 3
    .param p1, "source"    # Lcom/einmalfel/earl/AtomCommonAttributes;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    if-nez p1, :cond_b

    .line 29
    iput-object v0, p0, Lcom/einmalfel/earl/AtomCommonAttributes;->base:Ljava/net/URI;

    .line 30
    iput-object v0, p0, Lcom/einmalfel/earl/AtomCommonAttributes;->lang:Ljava/lang/String;

    .line 35
    :goto_a
    return-void

    .line 32
    :cond_b
    iget-object v0, p1, Lcom/einmalfel/earl/AtomCommonAttributes;->base:Ljava/net/URI;

    iput-object v0, p0, Lcom/einmalfel/earl/AtomCommonAttributes;->base:Ljava/net/URI;

    .line 33
    iget-object v0, p1, Lcom/einmalfel/earl/AtomCommonAttributes;->lang:Ljava/lang/String;

    iput-object v0, p0, Lcom/einmalfel/earl/AtomCommonAttributes;->lang:Ljava/lang/String;

    goto :goto_a
.end method

.method public constructor <init>(Ljava/net/URI;Ljava/lang/String;)V
    .registers 3
    .param p1, "base"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "lang"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/einmalfel/earl/AtomCommonAttributes;->base:Ljava/net/URI;

    .line 18
    iput-object p2, p0, Lcom/einmalfel/earl/AtomCommonAttributes;->lang:Ljava/lang/String;

    .line 19
    return-void
.end method

.method constructor <init>(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string v1, ""

    const-string v2, "base"

    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "baseString":Ljava/lang/String;
    if-nez v0, :cond_1b

    const/4 v1, 0x0

    :goto_e
    iput-object v1, p0, Lcom/einmalfel/earl/AtomCommonAttributes;->base:Ljava/net/URI;

    .line 24
    const-string v1, ""

    const-string v2, "lang"

    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/einmalfel/earl/AtomCommonAttributes;->lang:Ljava/lang/String;

    .line 25
    return-void

    .line 23
    :cond_1b
    invoke-static {v0}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    goto :goto_e
.end method
