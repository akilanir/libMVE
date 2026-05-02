.class public Lcom/einmalfel/earl/MediaHash;
.super Ljava/lang/Object;
.source "MediaHash.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "hash"


# instance fields
.field public final algo:Ljava/lang/String;
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
    .param p1, "algo"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/einmalfel/earl/MediaHash;->algo:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/einmalfel/earl/MediaHash;->value:Ljava/lang/String;

    .line 29
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaHash;
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
    .line 21
    const/4 v0, 0x2

    const/4 v1, 0x0

    const-string v2, "hash"

    invoke-interface {p0, v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 22
    new-instance v0, Lcom/einmalfel/earl/MediaHash;

    const-string v1, ""

    const-string v2, "algo"

    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 23
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/MediaHash;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
