.class public Lcom/einmalfel/earl/RSSCategory;
.super Ljava/lang/Object;
.source "RSSCategory.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "category"


# instance fields
.field public final domain:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final value:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "domain"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/einmalfel/earl/RSSCategory;->value:Ljava/lang/String;

    .line 29
    iput-object p2, p0, Lcom/einmalfel/earl/RSSCategory;->domain:Ljava/lang/String;

    .line 30
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSCategory;
    .registers 5
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
    .line 22
    const/4 v0, 0x2

    const-string v1, ""

    const-string v2, "category"

    invoke-interface {p0, v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 23
    new-instance v0, Lcom/einmalfel/earl/RSSCategory;

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    const-string v3, "domain"

    .line 24
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSCategory;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
