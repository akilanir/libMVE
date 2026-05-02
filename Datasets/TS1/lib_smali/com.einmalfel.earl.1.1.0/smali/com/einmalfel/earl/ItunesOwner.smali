.class public Lcom/einmalfel/earl/ItunesOwner;
.super Ljava/lang/Object;
.source "ItunesOwner.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.ItunesOwner"

.field static final XML_TAG:Ljava/lang/String; = "owner"


# instance fields
.field public final eMail:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final name:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "eMail"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/einmalfel/earl/ItunesOwner;->name:Ljava/lang/String;

    .line 45
    iput-object p2, p0, Lcom/einmalfel/earl/ItunesOwner;->eMail:Ljava/lang/String;

    .line 46
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/ItunesOwner;
    .registers 7
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
    const/4 v5, 0x2

    .line 24
    const/4 v2, 0x0

    const-string v3, "owner"

    invoke-interface {p0, v5, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    const/4 v1, 0x0

    .line 26
    .local v1, "name":Ljava/lang/String;
    const/4 v0, 0x0

    .line 27
    .local v0, "eMail":Ljava/lang/String;
    :goto_9
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v2

    if-ne v2, v5, :cond_5c

    .line 28
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v2, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_62

    :cond_1b
    :goto_1b
    packed-switch v2, :pswitch_data_6c

    .line 36
    const-string v2, "Earl.ItunesOwner"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected owner tag "

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
    :goto_3a
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->finishTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_9

    .line 28
    :sswitch_3e
    const-string v4, "name"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    const/4 v2, 0x0

    goto :goto_1b

    :sswitch_48
    const-string v4, "email"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    const/4 v2, 0x1

    goto :goto_1b

    .line 30
    :pswitch_52
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    .line 31
    goto :goto_3a

    .line 33
    :pswitch_57
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v0

    .line 34
    goto :goto_3a

    .line 40
    :cond_5c
    new-instance v2, Lcom/einmalfel/earl/ItunesOwner;

    invoke-direct {v2, v1, v0}, Lcom/einmalfel/earl/ItunesOwner;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    .line 28
    :sswitch_data_62
    .sparse-switch
        0x337a8b -> :sswitch_3e
        0x5c24b9c -> :sswitch_48
    .end sparse-switch

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_52
        :pswitch_57
    .end packed-switch
.end method
