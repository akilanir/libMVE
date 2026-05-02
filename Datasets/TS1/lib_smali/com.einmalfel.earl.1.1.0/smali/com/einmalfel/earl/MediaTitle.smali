.class public Lcom/einmalfel/earl/MediaTitle;
.super Ljava/lang/Object;
.source "MediaTitle.java"


# instance fields
.field public final type:Ljava/lang/String;
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
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/einmalfel/earl/MediaTitle;->type:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lcom/einmalfel/earl/MediaTitle;->value:Ljava/lang/String;

    .line 26
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaTitle;
    .registers 4
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
    .line 19
    new-instance v0, Lcom/einmalfel/earl/MediaTitle;

    const-string v1, ""

    const-string v2, "type"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 20
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/MediaTitle;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
