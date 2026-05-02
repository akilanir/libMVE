.class public Lcom/einmalfel/earl/MediaPrice;
.super Ljava/lang/Object;
.source "MediaPrice.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "price"


# instance fields
.field public final currency:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final info:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final price:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "info"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "price"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "currency"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/einmalfel/earl/MediaPrice;->type:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lcom/einmalfel/earl/MediaPrice;->info:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Lcom/einmalfel/earl/MediaPrice;->price:Ljava/lang/String;

    .line 39
    iput-object p4, p0, Lcom/einmalfel/earl/MediaPrice;->currency:Ljava/lang/String;

    .line 40
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaPrice;
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
    .line 25
    new-instance v0, Lcom/einmalfel/earl/MediaPrice;

    const-string v1, ""

    const-string v2, "type"

    .line 26
    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    const-string v3, "info"

    .line 27
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    const-string v4, "price"

    .line 28
    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    const-string v5, "currency"

    .line 29
    invoke-interface {p0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/einmalfel/earl/MediaPrice;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .local v0, "result":Lcom/einmalfel/earl/MediaPrice;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 31
    return-object v0
.end method
