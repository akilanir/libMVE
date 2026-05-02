.class public Lit/gmariotti/changelibs/library/parser/XmlParser;
.super Lit/gmariotti/changelibs/library/parser/BaseParser;
.source "XmlParser.java"


# static fields
.field private static final ATTRIBUTE_BULLETEDLIST:Ljava/lang/String; = "bulletedList"

.field private static final ATTRIBUTE_CHANGEDATE:Ljava/lang/String; = "changeDate"

.field private static final ATTRIBUTE_CHANGETEXTTITLE:Ljava/lang/String; = "changeTextTitle"

.field private static final ATTRIBUTE_VERSIONCODE:Ljava/lang/String; = "versionCode"

.field private static final ATTRIBUTE_VERSIONNAME:Ljava/lang/String; = "versionName"

.field private static TAG:Ljava/lang/String; = null

.field private static final TAG_CHANGELOG:Ljava/lang/String; = "changelog"

.field private static final TAG_CHANGELOGBUG:Ljava/lang/String; = "changelogbug"

.field private static final TAG_CHANGELOGIMPROVEMENT:Ljava/lang/String; = "changelogimprovement"

.field private static final TAG_CHANGELOGTEXT:Ljava/lang/String; = "changelogtext"

.field private static final TAG_CHANGELOGVERSION:Ljava/lang/String; = "changelogversion"

.field private static mChangeLogTags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mChangeLogAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

.field private mChangeLogFileResourceId:I

.field private mChangeLogFileResourceUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 74
    const-string v0, "XmlParser"

    sput-object v0, Lit/gmariotti/changelibs/library/parser/XmlParser;->TAG:Ljava/lang/String;

    .line 97
    new-instance v0, Lit/gmariotti/changelibs/library/parser/XmlParser$1;

    invoke-direct {v0}, Lit/gmariotti/changelibs/library/parser/XmlParser$1;-><init>()V

    sput-object v0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogTags:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lit/gmariotti/changelibs/library/parser/BaseParser;-><init>(Landroid/content/Context;)V

    .line 75
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mChangeLogFileResourceId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceId:I

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceUrl:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "changeLogFileResourceId"    # I

    .prologue
    .line 125
    invoke-direct {p0, p1}, Lit/gmariotti/changelibs/library/parser/BaseParser;-><init>(Landroid/content/Context;)V

    .line 75
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mChangeLogFileResourceId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceId:I

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceUrl:Ljava/lang/String;

    .line 126
    iput p2, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceId:I

    .line 127
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "changeLogFileResourceUrl"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-direct {p0, p1}, Lit/gmariotti/changelibs/library/parser/BaseParser;-><init>(Landroid/content/Context;)V

    .line 75
    sget v0, Lit/gmariotti/changelibs/library/Constants;->mChangeLogFileResourceId:I

    iput v0, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceId:I

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceUrl:Ljava/lang/String;

    .line 137
    iput-object p2, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceUrl:Ljava/lang/String;

    .line 138
    return-void
.end method

.method private readChangeLogRowNode(Lorg/xmlpull/v1/XmlPullParser;Lit/gmariotti/changelibs/library/internal/ChangeLog;Ljava/lang/String;I)V
    .registers 14
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "changeLog"    # Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .param p3, "versionName"    # Ljava/lang/String;
    .param p4, "versionCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 295
    if-nez p1, :cond_6

    .line 334
    :goto_5
    return-void

    .line 298
    :cond_6
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 300
    .local v4, "tag":Ljava/lang/String;
    new-instance v3, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    invoke-direct {v3}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;-><init>()V

    .line 301
    .local v3, "row":Lit/gmariotti/changelibs/library/internal/ChangeLogRow;
    invoke-virtual {v3, p3}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->setVersionName(Ljava/lang/String;)V

    .line 302
    invoke-virtual {v3, p4}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->setVersionCode(I)V

    .line 305
    const-string v7, "changeTextTitle"

    invoke-interface {p1, v8, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 306
    .local v2, "changeLogTextTitle":Ljava/lang/String;
    if-eqz v2, :cond_20

    .line 307
    invoke-virtual {v3, v2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->setChangeTextTitle(Ljava/lang/String;)V

    .line 310
    :cond_20
    const-string v7, "bulletedList"

    invoke-interface {p1, v8, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, "bulletedList":Ljava/lang/String;
    if-eqz v0, :cond_4c

    .line 312
    const-string v7, "true"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_48

    .line 313
    invoke-virtual {v3, v5}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->setBulletedList(Z)V

    .line 322
    :goto_33
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    const/4 v8, 0x4

    if-ne v7, v8, :cond_63

    .line 323
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 324
    .local v1, "changeLogText":Ljava/lang/String;
    if-nez v1, :cond_52

    .line 325
    new-instance v5, Lit/gmariotti/changelibs/library/internal/ChangeLogException;

    const-string v6, "ChangeLogText required in changeLogText node"

    invoke-direct {v5, v6}, Lit/gmariotti/changelibs/library/internal/ChangeLogException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 315
    .end local v1    # "changeLogText":Ljava/lang/String;
    :cond_48
    invoke-virtual {v3, v6}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->setBulletedList(Z)V

    goto :goto_33

    .line 318
    :cond_4c
    iget-boolean v7, p0, Lit/gmariotti/changelibs/library/parser/BaseParser;->bulletedList:Z

    invoke-virtual {v3, v7}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->setBulletedList(Z)V

    goto :goto_33

    .line 326
    .restart local v1    # "changeLogText":Ljava/lang/String;
    :cond_52
    invoke-virtual {v3, v1}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->parseChangeText(Ljava/lang/String;)V

    .line 327
    const-string v7, "changelogbug"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_67

    :goto_5d
    invoke-virtual {v3, v5}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->setType(I)V

    .line 328
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 330
    .end local v1    # "changeLogText":Ljava/lang/String;
    :cond_63
    invoke-virtual {p2, v3}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->addRow(Lit/gmariotti/changelibs/library/internal/ChangeLogRow;)V

    goto :goto_5

    .line 327
    .restart local v1    # "changeLogText":Ljava/lang/String;
    :cond_67
    const-string v5, "changelogimprovement"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_71

    const/4 v5, 0x2

    goto :goto_5d

    :cond_71
    move v5, v6

    goto :goto_5d
.end method


# virtual methods
.method public readChangeLogFile()Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 153
    const/4 v0, 0x0

    .line 156
    .local v0, "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    const/4 v3, 0x0

    .line 158
    .local v3, "is":Ljava/io/InputStream;
    :try_start_2
    iget-object v7, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceUrl:Ljava/lang/String;

    if-eqz v7, :cond_38

    .line 159
    iget-object v7, p0, Lit/gmariotti/changelibs/library/parser/BaseParser;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lit/gmariotti/changelibs/library/Util;->isConnected(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_19

    .line 160
    new-instance v5, Ljava/net/URL;

    iget-object v7, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceUrl:Ljava/lang/String;

    invoke-direct {v5, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 161
    .local v5, "url":Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v3

    .line 166
    .end local v5    # "url":Ljava/net/URL;
    :cond_19
    :goto_19
    if-eqz v3, :cond_45

    .line 169
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v4

    .line 170
    .local v4, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const-string v7, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v8, 0x0

    invoke-interface {v4, v7, v8}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 171
    const/4 v7, 0x0

    invoke-interface {v4, v3, v7}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 172
    invoke-interface {v4}, Lorg/xmlpull/v1/XmlPullParser;->nextTag()I

    .line 175
    new-instance v1, Lit/gmariotti/changelibs/library/internal/ChangeLog;

    invoke-direct {v1}, Lit/gmariotti/changelibs/library/internal/ChangeLog;-><init>()V
    :try_end_31
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_31} :catch_54
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_31} :catch_5d

    .line 177
    .end local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .local v1, "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    :try_start_31
    invoke-virtual {p0, v4, v1}, Lit/gmariotti/changelibs/library/parser/XmlParser;->readChangeLogNode(Lorg/xmlpull/v1/XmlPullParser;Lit/gmariotti/changelibs/library/internal/ChangeLog;)V

    .line 180
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_37
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_31 .. :try_end_37} :catch_69
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_37} :catch_66

    .line 193
    return-object v1

    .line 164
    .end local v1    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .end local v4    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    :cond_38
    :try_start_38
    iget-object v7, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    iget v8, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogFileResourceId:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v3

    goto :goto_19

    .line 182
    :cond_45
    sget-object v7, Lit/gmariotti/changelibs/library/parser/XmlParser;->TAG:Ljava/lang/String;

    const-string v8, "Changelog.xml not found"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    new-instance v7, Lit/gmariotti/changelibs/library/internal/ChangeLogException;

    const-string v8, "Changelog.xml not found"

    invoke-direct {v7, v8}, Lit/gmariotti/changelibs/library/internal/ChangeLogException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_54
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_38 .. :try_end_54} :catch_54
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_54} :catch_5d

    .line 185
    :catch_54
    move-exception v6

    .line 186
    .local v6, "xpe":Lorg/xmlpull/v1/XmlPullParserException;
    :goto_55
    sget-object v7, Lit/gmariotti/changelibs/library/parser/XmlParser;->TAG:Ljava/lang/String;

    const-string v8, "XmlPullParseException while parsing changelog file"

    invoke-static {v7, v8, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 187
    throw v6

    .line 188
    .end local v6    # "xpe":Lorg/xmlpull/v1/XmlPullParserException;
    :catch_5d
    move-exception v2

    .line 189
    .local v2, "ioe":Ljava/io/IOException;
    :goto_5e
    sget-object v7, Lit/gmariotti/changelibs/library/parser/XmlParser;->TAG:Ljava/lang/String;

    const-string v8, "Error i/o with changelog.xml"

    invoke-static {v7, v8, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 190
    throw v2

    .line 188
    .end local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v1    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .restart local v4    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_66
    move-exception v2

    move-object v0, v1

    .end local v1    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .restart local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    goto :goto_5e

    .line 185
    .end local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .restart local v1    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    :catch_69
    move-exception v6

    move-object v0, v1

    .end local v1    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .restart local v0    # "chg":Lit/gmariotti/changelibs/library/internal/ChangeLog;
    goto :goto_55
.end method

.method protected readChangeLogNode(Lorg/xmlpull/v1/XmlPullParser;Lit/gmariotti/changelibs/library/internal/ChangeLog;)V
    .registers 10
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "changeLog"    # Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 205
    if-eqz p1, :cond_8

    if-nez p2, :cond_9

    .line 234
    :cond_8
    return-void

    .line 208
    :cond_9
    const-string v2, "changelog"

    invoke-interface {p1, v5, v6, v2}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 212
    const-string v2, "bulletedList"

    invoke-interface {p1, v6, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 213
    .local v0, "bulletedList":Ljava/lang/String;
    if-eqz v0, :cond_1e

    const-string v2, "true"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 214
    :cond_1e
    invoke-virtual {p2, v4}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->setBulletedList(Z)V

    .line 215
    iput-boolean v4, p0, Lit/gmariotti/changelibs/library/parser/BaseParser;->bulletedList:Z

    .line 222
    :cond_23
    :goto_23
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_8

    .line 223
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    if-ne v2, v5, :cond_23

    .line 227
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 230
    .local v1, "tag":Ljava/lang/String;
    const-string v2, "changelogversion"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    .line 231
    invoke-virtual {p0, p1, p2}, Lit/gmariotti/changelibs/library/parser/XmlParser;->readChangeLogVersionNode(Lorg/xmlpull/v1/XmlPullParser;Lit/gmariotti/changelibs/library/internal/ChangeLog;)V

    goto :goto_23

    .line 217
    .end local v1    # "tag":Ljava/lang/String;
    :cond_40
    invoke-virtual {p2, v3}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->setBulletedList(Z)V

    .line 218
    iput-boolean v3, p0, Lit/gmariotti/changelibs/library/parser/BaseParser;->bulletedList:Z

    goto :goto_23
.end method

.method protected readChangeLogVersionNode(Lorg/xmlpull/v1/XmlPullParser;Lit/gmariotti/changelibs/library/internal/ChangeLog;)V
    .registers 14
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "changeLog"    # Lit/gmariotti/changelibs/library/internal/ChangeLog;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x0

    .line 245
    if-nez p1, :cond_5

    .line 284
    :cond_4
    return-void

    .line 247
    :cond_5
    const-string v7, "changelogversion"

    invoke-interface {p1, v10, v9, v7}, Lorg/xmlpull/v1/XmlPullParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 250
    const-string v7, "versionName"

    invoke-interface {p1, v9, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 251
    .local v6, "versionName":Ljava/lang/String;
    const-string v7, "versionCode"

    invoke-interface {p1, v9, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 252
    .local v5, "versionCodeStr":Ljava/lang/String;
    const/4 v4, 0x0

    .line 253
    .local v4, "versionCode":I
    if-eqz v5, :cond_1d

    .line 255
    :try_start_19
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_19 .. :try_end_1c} :catch_2d

    move-result v4

    .line 260
    :cond_1d
    :goto_1d
    const-string v7, "changeDate"

    invoke-interface {p1, v9, v7}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 261
    .local v0, "changeDate":Ljava/lang/String;
    if-nez v6, :cond_36

    .line 262
    new-instance v7, Lit/gmariotti/changelibs/library/internal/ChangeLogException;

    const-string v8, "VersionName required in changeLogVersion node"

    invoke-direct {v7, v8}, Lit/gmariotti/changelibs/library/internal/ChangeLogException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 256
    .end local v0    # "changeDate":Ljava/lang/String;
    :catch_2d
    move-exception v1

    .line 257
    .local v1, "ne":Ljava/lang/NumberFormatException;
    sget-object v7, Lit/gmariotti/changelibs/library/parser/XmlParser;->TAG:Ljava/lang/String;

    const-string v8, "Error while parsing versionCode.It must be a numeric value. Check you file."

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1d

    .line 264
    .end local v1    # "ne":Ljava/lang/NumberFormatException;
    .restart local v0    # "changeDate":Ljava/lang/String;
    :cond_36
    new-instance v2, Lit/gmariotti/changelibs/library/internal/ChangeLogRowHeader;

    invoke-direct {v2}, Lit/gmariotti/changelibs/library/internal/ChangeLogRowHeader;-><init>()V

    .line 265
    .local v2, "row":Lit/gmariotti/changelibs/library/internal/ChangeLogRowHeader;
    invoke-virtual {v2, v6}, Lit/gmariotti/changelibs/library/internal/ChangeLogRowHeader;->setVersionName(Ljava/lang/String;)V

    .line 267
    invoke-virtual {v2, v0}, Lit/gmariotti/changelibs/library/internal/ChangeLogRowHeader;->setChangeDate(Ljava/lang/String;)V

    .line 268
    invoke-virtual {p2, v2}, Lit/gmariotti/changelibs/library/internal/ChangeLog;->addRow(Lit/gmariotti/changelibs/library/internal/ChangeLogRow;)V

    .line 273
    :cond_44
    :goto_44
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    const/4 v8, 0x3

    if-eq v7, v8, :cond_4

    .line 274
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v7

    if-ne v7, v10, :cond_44

    .line 277
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 280
    .local v3, "tag":Ljava/lang/String;
    sget-object v7, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogTags:Ljava/util/List;

    invoke-interface {v7, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 281
    invoke-direct {p0, p1, p2, v6, v4}, Lit/gmariotti/changelibs/library/parser/XmlParser;->readChangeLogRowNode(Lorg/xmlpull/v1/XmlPullParser;Lit/gmariotti/changelibs/library/internal/ChangeLog;Ljava/lang/String;I)V

    goto :goto_44
.end method

.method public setChangeLogAdapter(Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;)V
    .registers 2
    .param p1, "changeLogAdapter"    # Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    .prologue
    .line 338
    iput-object p1, p0, Lit/gmariotti/changelibs/library/parser/XmlParser;->mChangeLogAdapter:Lit/gmariotti/changelibs/library/internal/ChangeLogAdapter;

    .line 339
    return-void
.end method
