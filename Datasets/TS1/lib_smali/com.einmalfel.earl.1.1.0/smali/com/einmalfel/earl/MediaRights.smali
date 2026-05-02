.class public Lcom/einmalfel/earl/MediaRights;
.super Ljava/lang/Object;
.source "MediaRights.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "rights"


# instance fields
.field public final status:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "status"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/einmalfel/earl/MediaRights;->status:Ljava/lang/String;

    .line 27
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/MediaRights;
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
    .line 18
    const/4 v1, 0x2

    const/4 v2, 0x0

    const-string v3, "rights"

    invoke-interface {p0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 19
    new-instance v0, Lcom/einmalfel/earl/MediaRights;

    const-string v1, ""

    const-string v2, "status"

    .line 20
    invoke-interface {p0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/einmalfel/earl/MediaRights;-><init>(Ljava/lang/String;)V

    .line 21
    .local v0, "result":Lcom/einmalfel/earl/MediaRights;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 22
    return-object v0
.end method
