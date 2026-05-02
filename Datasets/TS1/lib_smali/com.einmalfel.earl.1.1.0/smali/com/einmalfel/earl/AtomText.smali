.class public Lcom/einmalfel/earl/AtomText;
.super Lcom/einmalfel/earl/AtomCommonAttributes;
.source "AtomText.java"


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
.method public constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "atomCommonAttributes"    # Lcom/einmalfel/earl/AtomCommonAttributes;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 29
    iput-object p2, p0, Lcom/einmalfel/earl/AtomText;->type:Ljava/lang/String;

    .line 30
    iput-object p3, p0, Lcom/einmalfel/earl/AtomText;->value:Ljava/lang/String;

    .line 31
    return-void
.end method

.method constructor <init>(Lcom/einmalfel/earl/AtomText;)V
    .registers 3
    .param p1, "source"    # Lcom/einmalfel/earl/AtomText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 35
    iget-object v0, p1, Lcom/einmalfel/earl/AtomText;->type:Ljava/lang/String;

    iput-object v0, p0, Lcom/einmalfel/earl/AtomText;->type:Ljava/lang/String;

    .line 36
    iget-object v0, p1, Lcom/einmalfel/earl/AtomText;->value:Ljava/lang/String;

    iput-object v0, p0, Lcom/einmalfel/earl/AtomText;->value:Ljava/lang/String;

    .line 37
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomText;
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
    .line 20
    new-instance v0, Lcom/einmalfel/earl/AtomText;

    new-instance v1, Lcom/einmalfel/earl/AtomCommonAttributes;

    invoke-direct {v1, p0}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    const-string v2, ""

    const-string v3, "type"

    .line 22
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 23
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/einmalfel/earl/AtomText;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
