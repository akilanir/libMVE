.class public Lcom/einmalfel/earl/MediaText;
.super Ljava/lang/Object;
.source "MediaText.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "text"


# instance fields
.field public final end:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final lang:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final start:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final value:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;)V
    .registers 6
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "lang"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "start"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "end"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/einmalfel/earl/MediaText;->type:Ljava/lang/String;

    .line 41
    iput-object p2, p0, Lcom/einmalfel/earl/MediaText;->lang:Ljava/lang/String;

    .line 42
    iput-object p3, p0, Lcom/einmalfel/earl/MediaText;->start:Ljava/lang/Integer;

    .line 43
    iput-object p4, p0, Lcom/einmalfel/earl/MediaText;->end:Ljava/lang/Integer;

    .line 44
    iput-object p5, p0, Lcom/einmalfel/earl/MediaText;->value:Ljava/lang/String;

    .line 45
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaText;
    .registers 9
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
    const/4 v4, 0x0

    .line 27
    const/4 v0, 0x2

    const-string v1, "text"

    invoke-interface {p0, v0, v4, v1}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 28
    const-string v0, ""

    const-string v1, "start"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 29
    .local v7, "start":Ljava/lang/String;
    const-string v0, ""

    const-string v1, "end"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 30
    .local v6, "end":Ljava/lang/String;
    new-instance v0, Lcom/einmalfel/earl/MediaText;

    const-string v1, ""

    const-string v2, "type"

    .line 31
    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    const-string v3, "lang"

    .line 32
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v7, :cond_36

    move-object v3, v4

    .line 33
    :goto_2c
    if-nez v6, :cond_3b

    .line 35
    :goto_2e
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/einmalfel/earl/MediaText;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;)V

    return-object v0

    .line 33
    :cond_36
    invoke-static {v7}, Lcom/einmalfel/earl/Utils;->parseRFC2326NPT(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_2c

    .line 34
    :cond_3b
    invoke-static {v6}, Lcom/einmalfel/earl/Utils;->parseRFC2326NPT(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_2e
.end method
