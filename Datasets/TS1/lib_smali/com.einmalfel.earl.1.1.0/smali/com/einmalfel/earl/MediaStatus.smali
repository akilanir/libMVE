.class public Lcom/einmalfel/earl/MediaStatus;
.super Ljava/lang/Object;
.source "MediaStatus.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "status"


# instance fields
.field public final reason:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final state:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "state"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/einmalfel/earl/MediaStatus;->state:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lcom/einmalfel/earl/MediaStatus;->reason:Ljava/lang/String;

    .line 31
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaStatus;
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
    new-instance v0, Lcom/einmalfel/earl/MediaStatus;

    const-string v1, ""

    const-string v2, "state"

    .line 22
    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    const-string v3, "reason"

    .line 23
    invoke-interface {p0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/MediaStatus;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .local v0, "result":Lcom/einmalfel/earl/MediaStatus;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 25
    return-object v0
.end method
