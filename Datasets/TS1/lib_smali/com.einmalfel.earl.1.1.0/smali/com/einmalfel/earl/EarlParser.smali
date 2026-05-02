.class public Lcom/einmalfel/earl/EarlParser;
.super Ljava/lang/Object;
.source "EarlParser.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Earl.EarlParser"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse(Ljava/io/InputStream;I)Lcom/einmalfel/earl/Feed;
    .registers 4
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "maxItems"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 30
    :try_start_0
    invoke-static {p0, p1}, Lcom/einmalfel/earl/EarlParser;->parseOrThrow(Ljava/io/InputStream;I)Lcom/einmalfel/earl/Feed;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 32
    :goto_4
    return-object v1

    .line 31
    :catch_5
    move-exception v0

    .line 32
    .local v0, "ignore":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public static parseOrThrow(Ljava/io/InputStream;I)Lcom/einmalfel/earl/Feed;
    .registers 7
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "maxItems"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 48
    :try_start_1
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    .line 49
    .local v0, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v3, 0x1

    invoke-interface {v0, v1, v3}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 50
    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 51
    :cond_f
    :goto_f
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    if-eq v1, v2, :cond_50

    .line 52
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    const/4 v3, 0x2

    if-ne v1, v3, :cond_f

    .line 53
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v1, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_60

    :cond_28
    :goto_28
    packed-switch v1, :pswitch_data_6a

    goto :goto_f

    .line 55
    :pswitch_2c
    invoke-static {v0, p1}, Lcom/einmalfel/earl/RSSFeed;->read(Lorg/xmlpull/v1/XmlPullParser;I)Lcom/einmalfel/earl/RSSFeed;
    :try_end_2f
    .catchall {:try_start_1 .. :try_end_2f} :catchall_5b

    move-result-object v1

    .line 61
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :goto_33
    return-object v1

    .line 53
    :sswitch_34
    :try_start_34
    const-string v4, "channel"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    const/4 v1, 0x0

    goto :goto_28

    :sswitch_3e
    const-string v4, "feed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    move v1, v2

    goto :goto_28

    .line 57
    :pswitch_48
    invoke-static {v0, p1}, Lcom/einmalfel/earl/AtomFeed;->read(Lorg/xmlpull/v1/XmlPullParser;I)Lcom/einmalfel/earl/AtomFeed;
    :try_end_4b
    .catchall {:try_start_34 .. :try_end_4b} :catchall_5b

    move-result-object v1

    .line 61
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    goto :goto_33

    :cond_50
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 63
    new-instance v1, Ljava/util/zip/DataFormatException;

    const-string v2, "No syndication feeds found in given stream"

    invoke-direct {v1, v2}, Ljava/util/zip/DataFormatException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 61
    .end local v0    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catchall_5b
    move-exception v1

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v1

    .line 53
    :sswitch_data_60
    .sparse-switch
        0x2fe59e -> :sswitch_3e
        0x2c0b7d03 -> :sswitch_34
    .end sparse-switch

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_48
    .end packed-switch
.end method
