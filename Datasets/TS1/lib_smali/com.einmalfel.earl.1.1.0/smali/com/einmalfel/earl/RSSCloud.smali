.class public Lcom/einmalfel/earl/RSSCloud;
.super Ljava/lang/Object;
.source "RSSCloud.java"


# static fields
.field static final XML_TAG:Ljava/lang/String; = "cloud"


# instance fields
.field public final domain:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final path:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final port:Ljava/lang/Integer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final protocol:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final registerProcedure:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "domain"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "port"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "path"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "registerProcedure"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "protocol"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/einmalfel/earl/RSSCloud;->domain:Ljava/lang/String;

    .line 42
    iput-object p2, p0, Lcom/einmalfel/earl/RSSCloud;->port:Ljava/lang/Integer;

    .line 43
    iput-object p3, p0, Lcom/einmalfel/earl/RSSCloud;->path:Ljava/lang/String;

    .line 44
    iput-object p4, p0, Lcom/einmalfel/earl/RSSCloud;->registerProcedure:Ljava/lang/String;

    .line 45
    iput-object p5, p0, Lcom/einmalfel/earl/RSSCloud;->protocol:Ljava/lang/String;

    .line 46
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSCloud;
    .registers 9
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
    .line 28
    const/4 v0, 0x2

    const-string v2, ""

    const-string v7, "cloud"

    invoke-interface {p0, v0, v2, v7}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 29
    const-string v0, ""

    const-string v2, "port"

    invoke-interface {p0, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 30
    .local v6, "port":Ljava/lang/String;
    const-string v0, ""

    const-string v2, "domain"

    invoke-interface {p0, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 31
    .local v1, "domain":Ljava/lang/String;
    const-string v0, ""

    const-string v2, "path"

    invoke-interface {p0, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 32
    .local v3, "path":Ljava/lang/String;
    const-string v0, ""

    const-string v2, "registerProcedure"

    invoke-interface {p0, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 33
    .local v4, "procedure":Ljava/lang/String;
    const-string v0, ""

    const-string v2, "protocol"

    invoke-interface {p0, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 34
    .local v5, "protocol":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 35
    new-instance v0, Lcom/einmalfel/earl/RSSCloud;

    if-nez v6, :cond_3c

    const/4 v2, 0x0

    .line 36
    :goto_38
    invoke-direct/range {v0 .. v5}, Lcom/einmalfel/earl/RSSCloud;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_3c
    invoke-static {v6}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_38
.end method
