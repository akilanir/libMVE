.class public Lcom/einmalfel/earl/AtomDate;
.super Lcom/einmalfel/earl/AtomCommonAttributes;
.source "AtomDate.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.AtomDate"


# instance fields
.field public final date:Ljava/util/Date;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/util/Date;)V
    .registers 3
    .param p1, "source"    # Lcom/einmalfel/earl/AtomCommonAttributes;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "date"    # Ljava/util/Date;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 32
    iput-object p2, p0, Lcom/einmalfel/earl/AtomDate;->date:Ljava/util/Date;

    .line 33
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomDate;
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
    .line 21
    new-instance v0, Lcom/einmalfel/earl/AtomCommonAttributes;

    invoke-direct {v0, p0}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 22
    .local v0, "atomCommonAttributes":Lcom/einmalfel/earl/AtomCommonAttributes;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->parseRFC3339Date(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 23
    .local v1, "date":Ljava/util/Date;
    if-nez v1, :cond_1d

    .line 24
    const-string v2, "Earl.AtomDate"

    const-string v3, "Replacing date with 0"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    new-instance v1, Ljava/util/Date;

    .end local v1    # "date":Ljava/util/Date;
    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 27
    .restart local v1    # "date":Ljava/util/Date;
    :cond_1d
    new-instance v2, Lcom/einmalfel/earl/AtomDate;

    invoke-direct {v2, v0, v1}, Lcom/einmalfel/earl/AtomDate;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/util/Date;)V

    return-object v2
.end method
