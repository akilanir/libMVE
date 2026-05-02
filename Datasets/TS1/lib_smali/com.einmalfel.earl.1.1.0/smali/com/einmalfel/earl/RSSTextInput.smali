.class public Lcom/einmalfel/earl/RSSTextInput;
.super Ljava/lang/Object;
.source "RSSTextInput.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/einmalfel/earl/RSSTextInput$ST;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.RSSTextInput"

.field static final XML_TAG:Ljava/lang/String; = "textInput"


# instance fields
.field public final description:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final link:Ljava/net/URL;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final name:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final title:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)V
    .registers 5
    .param p1, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "description"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "link"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/einmalfel/earl/RSSTextInput;->title:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lcom/einmalfel/earl/RSSTextInput;->description:Ljava/lang/String;

    .line 53
    iput-object p3, p0, Lcom/einmalfel/earl/RSSTextInput;->name:Ljava/lang/String;

    .line 54
    iput-object p4, p0, Lcom/einmalfel/earl/RSSTextInput;->link:Ljava/net/URL;

    .line 55
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/RSSTextInput;
    .registers 8
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
    .line 32
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 33
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/einmalfel/earl/RSSTextInput$ST;Ljava/lang/String;>;"
    :goto_5
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_40

    .line 35
    :try_start_c
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/einmalfel/earl/RSSTextInput$ST;->valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/RSSTextInput$ST;

    move-result-object v2

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_1b} :catch_1f

    .line 40
    :goto_1b
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_5

    .line 36
    :catch_1f
    move-exception v0

    .line 37
    .local v0, "ignored":Ljava/lang/IllegalArgumentException;
    const-string v2, "Earl.RSSTextInput"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown RSS TextInput tag "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1b

    .line 42
    .end local v0    # "ignored":Ljava/lang/IllegalArgumentException;
    :cond_40
    new-instance v3, Lcom/einmalfel/earl/RSSTextInput;

    sget-object v2, Lcom/einmalfel/earl/RSSTextInput$ST;->title:Lcom/einmalfel/earl/RSSTextInput$ST;

    .line 43
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v2, Lcom/einmalfel/earl/RSSTextInput$ST;->description:Lcom/einmalfel/earl/RSSTextInput$ST;

    .line 44
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    sget-object v2, Lcom/einmalfel/earl/RSSTextInput$ST;->name:Lcom/einmalfel/earl/RSSTextInput$ST;

    .line 45
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    sget-object v2, Lcom/einmalfel/earl/RSSTextInput$ST;->link:Lcom/einmalfel/earl/RSSTextInput$ST;

    .line 46
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    invoke-direct {v3, v4, v5, v6, v2}, Lcom/einmalfel/earl/RSSTextInput;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)V

    return-object v3
.end method
