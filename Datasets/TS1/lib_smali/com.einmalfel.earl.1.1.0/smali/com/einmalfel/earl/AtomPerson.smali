.class public Lcom/einmalfel/earl/AtomPerson;
.super Lcom/einmalfel/earl/AtomCommonAttributes;
.source "AtomPerson.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.AtomPerson"


# instance fields
.field public final email:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final name:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field public final uri:Ljava/net/URI;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/lang/String;Ljava/net/URI;Ljava/lang/String;)V
    .registers 5
    .param p1, "atomCommonAttributes"    # Lcom/einmalfel/earl/AtomCommonAttributes;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "uri"    # Ljava/net/URI;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "email"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;)V

    .line 57
    iput-object p2, p0, Lcom/einmalfel/earl/AtomPerson;->name:Ljava/lang/String;

    .line 58
    iput-object p3, p0, Lcom/einmalfel/earl/AtomPerson;->uri:Ljava/net/URI;

    .line 59
    iput-object p4, p0, Lcom/einmalfel/earl/AtomPerson;->email:Ljava/lang/String;

    .line 60
    return-void
.end method

.method static read(Lorg/xmlpull/v1/XmlPullParser;)Lcom/einmalfel/earl/AtomPerson;
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
    const/4 v5, 0x2

    .line 26
    new-instance v0, Lcom/einmalfel/earl/AtomCommonAttributes;

    invoke-direct {v0, p0}, Lcom/einmalfel/earl/AtomCommonAttributes;-><init>(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 27
    .local v0, "atomCommonAttributes":Lcom/einmalfel/earl/AtomCommonAttributes;
    const/4 v2, 0x0

    .line 28
    .local v2, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 29
    .local v3, "uri":Ljava/net/URI;
    const/4 v1, 0x0

    .line 30
    .local v1, "email":Ljava/lang/String;
    :goto_9
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    move-result v4

    if-ne v4, v5, :cond_a6

    .line 31
    const-string v4, "http://www.w3.org/2005/Atom"

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_85

    .line 32
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const/4 v4, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_b0

    :cond_27
    :goto_27
    packed-switch v4, :pswitch_data_be

    .line 43
    const-string v4, "Earl.AtomPerson"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected tag "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " in atom person item"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_9

    .line 32
    :sswitch_50
    const-string v7, "name"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_27

    const/4 v4, 0x0

    goto :goto_27

    :sswitch_5a
    const-string v7, "uri"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_27

    const/4 v4, 0x1

    goto :goto_27

    :sswitch_64
    const-string v7, "email"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_27

    move v4, v5

    goto :goto_27

    .line 34
    :pswitch_6e
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    .line 35
    goto :goto_9

    .line 37
    :pswitch_73
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    .line 38
    goto :goto_9

    .line 40
    :pswitch_7c
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 41
    goto :goto_9

    .line 47
    :cond_85
    const-string v4, "Earl.AtomPerson"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unknown namespace in Atom person item "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_9

    .line 51
    :cond_a6
    new-instance v4, Lcom/einmalfel/earl/AtomPerson;

    invoke-static {v2}, Lcom/einmalfel/earl/Utils;->nonNullString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v0, v5, v3, v1}, Lcom/einmalfel/earl/AtomPerson;-><init>(Lcom/einmalfel/earl/AtomCommonAttributes;Ljava/lang/String;Ljava/net/URI;Ljava/lang/String;)V

    return-object v4

    .line 32
    :sswitch_data_b0
    .sparse-switch
        0x1c56c -> :sswitch_5a
        0x337a8b -> :sswitch_50
        0x5c24b9c -> :sswitch_64
    .end sparse-switch

    :pswitch_data_be
    .packed-switch 0x0
        :pswitch_6e
        :pswitch_73
        :pswitch_7c
    .end packed-switch
.end method
