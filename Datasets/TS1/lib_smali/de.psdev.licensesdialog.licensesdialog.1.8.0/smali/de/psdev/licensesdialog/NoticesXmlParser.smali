.class public final Lde/psdev/licensesdialog/NoticesXmlParser;
.super Ljava/lang/Object;
.source "NoticesXmlParser.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public static parse(Ljava/io/InputStream;)Lde/psdev/licensesdialog/model/Notices;
    .registers 4
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    :try_start_0
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    .line 38
    .local v0, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 39
    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 40
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 41
    invoke-static {v0}, Lde/psdev/licensesdialog/NoticesXmlParser;->parse(Lorg/xmlpull/v1/XmlPullParser;)Lde/psdev/licensesdialog/model/Notices;
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_19

    move-result-object v1

    .line 43
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-object v1

    .end local v0    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catchall_19
    move-exception v1

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v1
.end method

.method private static parse(Lorg/xmlpull/v1/XmlPullParser;)Lde/psdev/licensesdialog/model/Notices;
    .registers 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x2

    .line 48
    new-instance v1, Lde/psdev/licensesdialog/model/Notices;

    invoke-direct {v1}, Lde/psdev/licensesdialog/model/Notices;-><init>()V

    .line 49
    .local v1, "notices":Lde/psdev/licensesdialog/model/Notices;
    const/4 v2, 0x0

    const-string v3, "notices"

    invoke-interface {p0, v4, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 50
    :cond_c
    :goto_c
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_31

    .line 51
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    if-ne v2, v4, :cond_c

    .line 54
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "name":Ljava/lang/String;
    const-string v2, "notice"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 57
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readNotice(Lorg/xmlpull/v1/XmlPullParser;)Lde/psdev/licensesdialog/model/Notice;

    move-result-object v2

    invoke-virtual {v1, v2}, Lde/psdev/licensesdialog/model/Notices;->addNotice(Lde/psdev/licensesdialog/model/Notice;)V

    goto :goto_c

    .line 59
    :cond_2d
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesXmlParser;->skip(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_c

    .line 62
    .end local v0    # "name":Ljava/lang/String;
    :cond_31
    return-object v1
.end method

.method private static readCopyright(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .registers 2
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 101
    const-string v0, "copyright"

    invoke-static {p0, v0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readLicense(Lorg/xmlpull/v1/XmlPullParser;)Lde/psdev/licensesdialog/licenses/License;
    .registers 3
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 105
    const-string v1, "license"

    invoke-static {p0, v1}, Lde/psdev/licensesdialog/NoticesXmlParser;->readTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "license":Ljava/lang/String;
    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->read(Ljava/lang/String;)Lde/psdev/licensesdialog/licenses/License;

    move-result-object v1

    return-object v1
.end method

.method private static readName(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .registers 2
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 93
    const-string v0, "name"

    invoke-static {p0, v0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readNotice(Lorg/xmlpull/v1/XmlPullParser;)Lde/psdev/licensesdialog/model/Notice;
    .registers 9
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 67
    const/4 v5, 0x0

    const-string v6, "notice"

    invoke-interface {p0, v7, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 68
    const/4 v3, 0x0

    .line 69
    .local v3, "name":Ljava/lang/String;
    const/4 v4, 0x0

    .line 70
    .local v4, "url":Ljava/lang/String;
    const/4 v0, 0x0

    .line 71
    .local v0, "copyright":Ljava/lang/String;
    const/4 v2, 0x0

    .line 72
    .local v2, "license":Lde/psdev/licensesdialog/licenses/License;
    :cond_b
    :goto_b
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v5

    const/4 v6, 0x3

    if-eq v5, v6, :cond_54

    .line 73
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v5

    if-ne v5, v7, :cond_b

    .line 76
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "element":Ljava/lang/String;
    const-string v5, "name"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_29

    .line 78
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readName(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v3

    goto :goto_b

    .line 79
    :cond_29
    const-string v5, "url"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_36

    .line 80
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readUrl(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v4

    goto :goto_b

    .line 81
    :cond_36
    const-string v5, "copyright"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 82
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readCopyright(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    .line 83
    :cond_43
    const-string v5, "license"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_50

    .line 84
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readLicense(Lorg/xmlpull/v1/XmlPullParser;)Lde/psdev/licensesdialog/licenses/License;

    move-result-object v2

    goto :goto_b

    .line 86
    :cond_50
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesXmlParser;->skip(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_b

    .line 89
    .end local v1    # "element":Ljava/lang/String;
    :cond_54
    new-instance v5, Lde/psdev/licensesdialog/model/Notice;

    invoke-direct {v5, v3, v4, v0, v2}, Lde/psdev/licensesdialog/model/Notice;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lde/psdev/licensesdialog/licenses/License;)V

    return-object v5
.end method

.method private static readTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 110
    const/4 v1, 0x2

    invoke-interface {p0, v1, v2, p1}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 111
    invoke-static {p0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readText(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "title":Ljava/lang/String;
    const/4 v1, 0x3

    invoke-interface {p0, v1, v2, p1}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 113
    return-object v0
.end method

.method private static readText(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .registers 4
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 117
    const-string v0, ""

    .line 118
    .local v0, "result":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_10

    .line 119
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v0

    .line 120
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 122
    :cond_10
    return-object v0
.end method

.method private static readUrl(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .registers 2
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 97
    const-string v0, "url"

    invoke-static {p0, v0}, Lde/psdev/licensesdialog/NoticesXmlParser;->readTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static skip(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 1
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 126
    return-void
.end method
