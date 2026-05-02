.class public final Lcom/google/android/exoplayer/text/ttml/TtmlParser;
.super Ljava/lang/Object;
.source "TtmlParser.java"

# interfaces
.implements Lcom/google/android/exoplayer/text/SubtitleParser;


# static fields
.field private static final ATTR_BEGIN:Ljava/lang/String; = "begin"

.field private static final ATTR_DURATION:Ljava/lang/String; = "dur"

.field private static final ATTR_END:Ljava/lang/String; = "end"

.field private static final ATTR_STYLE:Ljava/lang/String; = "style"

.field private static final CLOCK_TIME:Ljava/util/regex/Pattern;

.field private static final DEFAULT_FRAMERATE:I = 0x1e

.field private static final DEFAULT_SUBFRAMERATE:I = 0x1

.field private static final DEFAULT_TICKRATE:I = 0x1

.field private static final FONT_SIZE:Ljava/util/regex/Pattern;

.field private static final OFFSET_TIME:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String; = "TtmlParser"


# instance fields
.field private final xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 70
    const-string v0, "^([0-9][0-9]+):([0-9][0-9]):([0-9][0-9])(?:(\\.[0-9]+)|:([0-9][0-9])(?:\\.([0-9]+))?)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->CLOCK_TIME:Ljava/util/regex/Pattern;

    .line 73
    const-string v0, "^([0-9]+(?:\\.[0-9]+)?)(h|m|s|ms|f|t)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->OFFSET_TIME:Ljava/util/regex/Pattern;

    .line 75
    const-string v0, "^(([0-9]*.)?[0-9]+)(px|em|%)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->FONT_SIZE:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    :try_start_3
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;
    :try_end_9
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_9} :catch_a

    .line 91
    return-void

    .line 88
    :catch_a
    move-exception v0

    .line 89
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Couldn\'t create XmlPullParserFactory instance"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    .registers 2
    .param p1, "style"    # Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    .prologue
    .line 275
    if-nez p1, :cond_7

    new-instance p1, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    .end local p1    # "style":Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    invoke-direct {p1}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;-><init>()V

    :cond_7
    return-object p1
.end method

.method private static isSupportedTag(Ljava/lang/String;)Z
    .registers 2
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    .line 328
    const-string v0, "tt"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "head"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "body"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "div"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "p"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "span"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "br"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "style"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "styling"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "layout"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "region"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "metadata"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "smpte:image"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "smpte:data"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    const-string v0, "smpte:information"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7a

    .line 343
    :cond_78
    const/4 v0, 0x1

    .line 345
    :goto_79
    return v0

    :cond_7a
    const/4 v0, 0x0

    goto :goto_79
.end method

.method private static parseFontSize(Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)V
    .registers 10
    .param p0, "expression"    # Ljava/lang/String;
    .param p1, "out"    # Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 349
    const-string v3, "\\s+"

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 351
    .local v0, "expressions":[Ljava/lang/String;
    array-length v3, v0

    if-ne v3, v4, :cond_2d

    .line 352
    sget-object v3, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->FONT_SIZE:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 361
    .local v1, "matcher":Ljava/util/regex/Matcher;
    :goto_12
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_7f

    .line 362
    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 363
    .local v2, "unit":Ljava/lang/String;
    const/4 v3, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_86

    :cond_24
    :goto_24
    packed-switch v3, :pswitch_data_94

    .line 374
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    invoke-direct {v3}, Lcom/google/android/exoplayer/ParserException;-><init>()V

    throw v3

    .line 353
    .end local v1    # "matcher":Ljava/util/regex/Matcher;
    .end local v2    # "unit":Ljava/lang/String;
    :cond_2d
    array-length v3, v0

    if-ne v3, v5, :cond_40

    .line 354
    sget-object v3, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->FONT_SIZE:Ljava/util/regex/Pattern;

    aget-object v6, v0, v4

    invoke-virtual {v3, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 355
    .restart local v1    # "matcher":Ljava/util/regex/Matcher;
    const-string v3, "TtmlParser"

    const-string v6, "multiple values in fontSize attribute. Picking the second value for vertical font size and ignoring the first."

    invoke-static {v3, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12

    .line 358
    .end local v1    # "matcher":Ljava/util/regex/Matcher;
    :cond_40
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    invoke-direct {v3}, Lcom/google/android/exoplayer/ParserException;-><init>()V

    throw v3

    .line 363
    .restart local v1    # "matcher":Ljava/util/regex/Matcher;
    .restart local v2    # "unit":Ljava/lang/String;
    :sswitch_46
    const-string v6, "px"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_24

    const/4 v3, 0x0

    goto :goto_24

    :sswitch_50
    const-string v6, "em"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_24

    move v3, v4

    goto :goto_24

    :sswitch_5a
    const-string v6, "%"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_24

    move v3, v5

    goto :goto_24

    .line 365
    :pswitch_64
    invoke-virtual {p1, v4}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setFontSizeUnit(S)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    .line 376
    :goto_67
    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {p1, v3}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setFontSize(F)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    .line 380
    return-void

    .line 368
    :pswitch_77
    invoke-virtual {p1, v5}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setFontSizeUnit(S)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    goto :goto_67

    .line 371
    :pswitch_7b
    invoke-virtual {p1, v7}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setFontSizeUnit(S)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    goto :goto_67

    .line 378
    .end local v2    # "unit":Ljava/lang/String;
    :cond_7f
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    invoke-direct {v3}, Lcom/google/android/exoplayer/ParserException;-><init>()V

    throw v3

    .line 363
    nop

    :sswitch_data_86
    .sparse-switch
        0x25 -> :sswitch_5a
        0xca8 -> :sswitch_50
        0xe08 -> :sswitch_46
    .end sparse-switch

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_64
        :pswitch_77
        :pswitch_7b
    .end packed-switch
.end method

.method private parseHeader(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/Map;)Ljava/util/Map;
    .registers 9
    .param p1, "xmlParser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/text/ttml/TtmlStyle;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/exoplayer/text/ttml/TtmlStyle;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 163
    .local p2, "globalStyles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;>;"
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 164
    const-string v4, "style"

    invoke-static {p1, v4}, Lcom/google/android/exoplayer/util/ParserUtil;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 165
    const/4 v4, 0x0

    const-string v5, "style"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 166
    .local v2, "parentStyleId":Ljava/lang/String;
    new-instance v4, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    invoke-direct {v4}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;-><init>()V

    invoke-direct {p0, p1, v4}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseStyleAttributes(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v3

    .line 167
    .local v3, "style":Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    if-eqz v2, :cond_33

    .line 168
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseStyleIds(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "ids":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_22
    array-length v4, v1

    if-ge v0, v4, :cond_33

    .line 170
    aget-object v4, v1, v0

    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    invoke-virtual {v3, v4}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->chain(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    .line 169
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 173
    .end local v0    # "i":I
    .end local v1    # "ids":[Ljava/lang/String;
    :cond_33
    invoke-virtual {v3}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->getId()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_40

    .line 174
    invoke-virtual {v3}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .end local v2    # "parentStyleId":Ljava/lang/String;
    .end local v3    # "style":Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    :cond_40
    const-string v4, "head"

    invoke-static {p1, v4}, Lcom/google/android/exoplayer/util/ParserUtil;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 178
    return-object p2
.end method

.method private parseNode(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer/text/ttml/TtmlNode;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .registers 23
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "parent"    # Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 279
    const-wide/16 v11, 0x0

    .line 280
    .local v11, "duration":J
    const-wide/16 v3, -0x1

    .line 281
    .local v3, "startTime":J
    const-wide/16 v5, -0x1

    .line 282
    .local v5, "endTime":J
    const/4 v8, 0x0

    .line 283
    .local v8, "styleIds":[Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v10

    .line 284
    .local v10, "attributeCount":I
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseStyleAttributes(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v7

    .line 285
    .local v7, "style":Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_15
    if-ge v13, v10, :cond_81

    .line 286
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/exoplayer/util/ParserUtil;->removeNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 287
    .local v9, "attr":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v15

    .line 288
    .local v15, "value":Ljava/lang/String;
    const-string v2, "begin"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 289
    const/16 v2, 0x1e

    const/16 v16, 0x1

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-static {v15, v2, v0, v1}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseTimeExpression(Ljava/lang/String;III)J

    move-result-wide v3

    .line 285
    :cond_3d
    :goto_3d
    add-int/lit8 v13, v13, 0x1

    goto :goto_15

    .line 291
    :cond_40
    const-string v2, "end"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 292
    const/16 v2, 0x1e

    const/16 v16, 0x1

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-static {v15, v2, v0, v1}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseTimeExpression(Ljava/lang/String;III)J

    move-result-wide v5

    goto :goto_3d

    .line 294
    :cond_57
    const-string v2, "dur"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6e

    .line 295
    const/16 v2, 0x1e

    const/16 v16, 0x1

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-static {v15, v2, v0, v1}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseTimeExpression(Ljava/lang/String;III)J

    move-result-wide v11

    goto :goto_3d

    .line 297
    :cond_6e
    const-string v2, "style"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 299
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseStyleIds(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 300
    .local v14, "ids":[Ljava/lang/String;
    array-length v2, v14

    if-lez v2, :cond_3d

    .line 301
    move-object v8, v14

    goto :goto_3d

    .line 307
    .end local v9    # "attr":Ljava/lang/String;
    .end local v14    # "ids":[Ljava/lang/String;
    .end local v15    # "value":Ljava/lang/String;
    :cond_81
    if-eqz p2, :cond_ab

    move-object/from16 v0, p2

    iget-wide v0, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    move-wide/from16 v16, v0

    const-wide/16 v18, -0x1

    cmp-long v2, v16, v18

    if-eqz v2, :cond_ab

    .line 308
    const-wide/16 v16, -0x1

    cmp-long v2, v3, v16

    if-eqz v2, :cond_9d

    .line 309
    move-object/from16 v0, p2

    iget-wide v0, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    move-wide/from16 v16, v0

    add-long v3, v3, v16

    .line 311
    :cond_9d
    const-wide/16 v16, -0x1

    cmp-long v2, v5, v16

    if-eqz v2, :cond_ab

    .line 312
    move-object/from16 v0, p2

    iget-wide v0, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    move-wide/from16 v16, v0

    add-long v5, v5, v16

    .line 315
    :cond_ab
    const-wide/16 v16, -0x1

    cmp-long v2, v5, v16

    if-nez v2, :cond_b9

    .line 316
    const-wide/16 v16, 0x0

    cmp-long v2, v11, v16

    if-lez v2, :cond_c2

    .line 318
    add-long v5, v3, v11

    .line 324
    :cond_b9
    :goto_b9
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v8}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->buildNode(Ljava/lang/String;JJLcom/google/android/exoplayer/text/ttml/TtmlStyle;[Ljava/lang/String;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v2

    return-object v2

    .line 319
    :cond_c2
    if-eqz p2, :cond_b9

    move-object/from16 v0, p2

    iget-wide v0, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    move-wide/from16 v16, v0

    const-wide/16 v18, -0x1

    cmp-long v2, v16, v18

    if-eqz v2, :cond_b9

    .line 321
    move-object/from16 v0, p2

    iget-wide v5, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    goto :goto_b9
.end method

.method private parseStyleAttributes(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    .registers 16
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "style"    # Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v7, -0x1

    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 186
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    .line 187
    .local v0, "attributeCount":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_a
    if-ge v4, v0, :cond_225

    .line 188
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "attributeName":Ljava/lang/String;
    invoke-interface {p1, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    .line 190
    .local v2, "attributeValue":Ljava/lang/String;
    invoke-static {v1}, Lcom/google/android/exoplayer/util/ParserUtil;->removeNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_226

    :cond_1f
    move v5, v7

    :goto_20
    packed-switch v5, :pswitch_data_24c

    .line 187
    :cond_23
    :goto_23
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 190
    :sswitch_26
    const-string v11, "id"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    move v5, v6

    goto :goto_20

    :sswitch_30
    const-string v11, "backgroundColor"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    move v5, v8

    goto :goto_20

    :sswitch_3a
    const-string v11, "color"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    move v5, v9

    goto :goto_20

    :sswitch_44
    const-string v11, "fontFamily"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    move v5, v10

    goto :goto_20

    :sswitch_4e
    const-string v11, "fontSize"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    const/4 v5, 0x4

    goto :goto_20

    :sswitch_58
    const-string v11, "fontWeight"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    const/4 v5, 0x5

    goto :goto_20

    :sswitch_62
    const-string v11, "fontStyle"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    const/4 v5, 0x6

    goto :goto_20

    :sswitch_6c
    const-string v11, "textAlign"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    const/4 v5, 0x7

    goto :goto_20

    :sswitch_76
    const-string v11, "textDecoration"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    const/16 v5, 0x8

    goto :goto_20

    .line 192
    :pswitch_81
    const-string v5, "style"

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 193
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    invoke-virtual {v5, v2}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setId(Ljava/lang/String;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    goto :goto_23

    .line 197
    :pswitch_96
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 199
    :try_start_9a
    invoke-static {v2}, Lcom/google/android/exoplayer/text/ttml/TtmlColorParser;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setBackgroundColor(I)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    :try_end_a1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_9a .. :try_end_a1} :catch_a2

    goto :goto_23

    .line 200
    :catch_a2
    move-exception v3

    .line 201
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    const-string v5, "TtmlParser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "failed parsing background value: \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_23

    .line 205
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :pswitch_c3
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 207
    :try_start_c7
    invoke-static {v2}, Lcom/google/android/exoplayer/text/ttml/TtmlColorParser;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p2, v5}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setColor(I)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;
    :try_end_ce
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c7 .. :try_end_ce} :catch_d0

    goto/16 :goto_23

    .line 208
    :catch_d0
    move-exception v3

    .line 209
    .restart local v3    # "e":Ljava/lang/IllegalArgumentException;
    const-string v5, "TtmlParser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "failed parsing color value: \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_23

    .line 213
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :pswitch_f1
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    invoke-virtual {v5, v2}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setFontFamily(Ljava/lang/String;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 214
    goto/16 :goto_23

    .line 217
    :pswitch_fb
    :try_start_fb
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 218
    invoke-static {v2, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseFontSize(Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)V
    :try_end_102
    .catch Lcom/google/android/exoplayer/ParserException; {:try_start_fb .. :try_end_102} :catch_104

    goto/16 :goto_23

    .line 219
    :catch_104
    move-exception v3

    .line 220
    .local v3, "e":Lcom/google/android/exoplayer/ParserException;
    const-string v5, "TtmlParser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "failed parsing fontSize value: \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v5, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_23

    .line 224
    .end local v3    # "e":Lcom/google/android/exoplayer/ParserException;
    :pswitch_125
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    const-string v11, "bold"

    invoke-virtual {v11, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    invoke-virtual {v5, v11}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setBold(Z)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 226
    goto/16 :goto_23

    .line 228
    :pswitch_135
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    const-string v11, "italic"

    invoke-virtual {v11, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    invoke-virtual {v5, v11}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setItalic(Z)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 230
    goto/16 :goto_23

    .line 232
    :pswitch_145
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->toLowerInvariant(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_262

    :cond_150
    move v5, v7

    :goto_151
    packed-switch v5, :pswitch_data_278

    goto/16 :goto_23

    .line 234
    :pswitch_156
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    sget-object v11, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    invoke-virtual {v5, v11}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setTextAlign(Landroid/text/Layout$Alignment;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 235
    goto/16 :goto_23

    .line 232
    :sswitch_162
    const-string v11, "left"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_150

    move v5, v6

    goto :goto_151

    :sswitch_16c
    const-string v11, "start"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_150

    move v5, v8

    goto :goto_151

    :sswitch_176
    const-string v11, "right"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_150

    move v5, v9

    goto :goto_151

    :sswitch_180
    const-string v11, "end"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_150

    move v5, v10

    goto :goto_151

    :sswitch_18a
    const-string v11, "center"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_150

    const/4 v5, 0x4

    goto :goto_151

    .line 237
    :pswitch_194
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    sget-object v11, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    invoke-virtual {v5, v11}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setTextAlign(Landroid/text/Layout$Alignment;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 238
    goto/16 :goto_23

    .line 240
    :pswitch_1a0
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    sget-object v11, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    invoke-virtual {v5, v11}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setTextAlign(Landroid/text/Layout$Alignment;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 241
    goto/16 :goto_23

    .line 243
    :pswitch_1ac
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    sget-object v11, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    invoke-virtual {v5, v11}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setTextAlign(Landroid/text/Layout$Alignment;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 244
    goto/16 :goto_23

    .line 246
    :pswitch_1b8
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    sget-object v11, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    invoke-virtual {v5, v11}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setTextAlign(Landroid/text/Layout$Alignment;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    goto/16 :goto_23

    .line 251
    :pswitch_1c4
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->toLowerInvariant(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_286

    :cond_1cf
    move v5, v7

    :goto_1d0
    packed-switch v5, :pswitch_data_298

    goto/16 :goto_23

    .line 253
    :pswitch_1d5
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setLinethrough(Z)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 254
    goto/16 :goto_23

    .line 251
    :sswitch_1df
    const-string v11, "linethrough"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1cf

    move v5, v6

    goto :goto_1d0

    :sswitch_1e9
    const-string v11, "nolinethrough"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1cf

    move v5, v8

    goto :goto_1d0

    :sswitch_1f3
    const-string v11, "underline"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1cf

    move v5, v9

    goto :goto_1d0

    :sswitch_1fd
    const-string v11, "nounderline"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1cf

    move v5, v10

    goto :goto_1d0

    .line 256
    :pswitch_207
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setLinethrough(Z)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 257
    goto/16 :goto_23

    .line 259
    :pswitch_211
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setUnderline(Z)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    .line 260
    goto/16 :goto_23

    .line 262
    :pswitch_21b
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->createIfNull(Lcom/google/android/exoplayer/text/ttml/TtmlStyle;)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object v5

    invoke-virtual {v5, v6}, Lcom/google/android/exoplayer/text/ttml/TtmlStyle;->setUnderline(Z)Lcom/google/android/exoplayer/text/ttml/TtmlStyle;

    move-result-object p2

    goto/16 :goto_23

    .line 271
    .end local v1    # "attributeName":Ljava/lang/String;
    .end local v2    # "attributeValue":Ljava/lang/String;
    :cond_225
    return-object p2

    .line 190
    :sswitch_data_226
    .sparse-switch
        -0x5c71855e -> :sswitch_62
        -0x48ff636d -> :sswitch_44
        -0x3f826a28 -> :sswitch_6c
        -0x3468fa43 -> :sswitch_76
        -0x2bc67c59 -> :sswitch_58
        0xd1b -> :sswitch_26
        0x5a72f63 -> :sswitch_3a
        0x15caa0f0 -> :sswitch_4e
        0x4cb7f6d5 -> :sswitch_30
    .end sparse-switch

    :pswitch_data_24c
    .packed-switch 0x0
        :pswitch_81
        :pswitch_96
        :pswitch_c3
        :pswitch_f1
        :pswitch_fb
        :pswitch_125
        :pswitch_135
        :pswitch_145
        :pswitch_1c4
    .end packed-switch

    .line 232
    :sswitch_data_262
    .sparse-switch
        -0x514d33ab -> :sswitch_18a
        0x188db -> :sswitch_180
        0x32a007 -> :sswitch_162
        0x677c21c -> :sswitch_176
        0x68ac462 -> :sswitch_16c
    .end sparse-switch

    :pswitch_data_278
    .packed-switch 0x0
        :pswitch_156
        :pswitch_194
        :pswitch_1a0
        :pswitch_1ac
        :pswitch_1b8
    .end packed-switch

    .line 251
    :sswitch_data_286
    .sparse-switch
        -0x57195dd5 -> :sswitch_1fd
        -0x3d363934 -> :sswitch_1f3
        0x36723ff0 -> :sswitch_1e9
        0x641ec051 -> :sswitch_1df
    .end sparse-switch

    :pswitch_data_298
    .packed-switch 0x0
        :pswitch_1d5
        :pswitch_207
        :pswitch_211
        :pswitch_21b
    .end packed-switch
.end method

.method private parseStyleIds(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3
    .param p1, "parentStyleIds"    # Ljava/lang/String;

    .prologue
    .line 182
    const-string v0, "\\s+"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static parseTimeExpression(Ljava/lang/String;III)J
    .registers 23
    .param p0, "time"    # Ljava/lang/String;
    .param p1, "frameRate"    # I
    .param p2, "subframeRate"    # I
    .param p3, "tickRate"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 397
    sget-object v15, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->CLOCK_TIME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 398
    .local v7, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v15

    if-eqz v15, :cond_82

    .line 399
    const/4 v15, 0x1

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 400
    .local v6, "hours":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v15

    const-wide/16 v17, 0xe10

    mul-long v15, v15, v17

    long-to-double v2, v15

    .line 401
    .local v2, "durationSeconds":D
    const/4 v15, 0x2

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 402
    .local v8, "minutes":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v15

    const-wide/16 v17, 0x3c

    mul-long v15, v15, v17

    long-to-double v15, v15

    add-double/2addr v2, v15

    .line 403
    const/4 v15, 0x3

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    .line 404
    .local v11, "seconds":Ljava/lang/String;
    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v15

    long-to-double v15, v15

    add-double/2addr v2, v15

    .line 405
    const/4 v15, 0x4

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 406
    .local v4, "fraction":Ljava/lang/String;
    if-eqz v4, :cond_79

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v15

    :goto_41
    add-double/2addr v2, v15

    .line 407
    const/4 v15, 0x5

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 408
    .local v5, "frames":Ljava/lang/String;
    if-eqz v5, :cond_7c

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v15

    long-to-double v15, v15

    move/from16 v0, p1

    int-to-double v0, v0

    move-wide/from16 v17, v0

    div-double v15, v15, v17

    :goto_55
    add-double/2addr v2, v15

    .line 409
    const/4 v15, 0x6

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    .line 410
    .local v12, "subframes":Ljava/lang/String;
    if-eqz v12, :cond_7f

    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v15

    long-to-double v15, v15

    move/from16 v0, p2

    int-to-double v0, v0

    move-wide/from16 v17, v0

    div-double v15, v15, v17

    move/from16 v0, p1

    int-to-double v0, v0

    move-wide/from16 v17, v0

    div-double v15, v15, v17

    :goto_70
    add-double/2addr v2, v15

    .line 412
    const-wide v15, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v15, v2

    double-to-long v15, v15

    .line 432
    .end local v2    # "durationSeconds":D
    .end local v4    # "fraction":Ljava/lang/String;
    .end local v5    # "frames":Ljava/lang/String;
    .end local v6    # "hours":Ljava/lang/String;
    .end local v8    # "minutes":Ljava/lang/String;
    .end local v11    # "seconds":Ljava/lang/String;
    .end local v12    # "subframes":Ljava/lang/String;
    :goto_78
    return-wide v15

    .line 406
    .restart local v2    # "durationSeconds":D
    .restart local v4    # "fraction":Ljava/lang/String;
    .restart local v6    # "hours":Ljava/lang/String;
    .restart local v8    # "minutes":Ljava/lang/String;
    .restart local v11    # "seconds":Ljava/lang/String;
    :cond_79
    const-wide/16 v15, 0x0

    goto :goto_41

    .line 408
    .restart local v5    # "frames":Ljava/lang/String;
    :cond_7c
    const-wide/16 v15, 0x0

    goto :goto_55

    .line 410
    .restart local v12    # "subframes":Ljava/lang/String;
    :cond_7f
    const-wide/16 v15, 0x0

    goto :goto_70

    .line 414
    .end local v2    # "durationSeconds":D
    .end local v4    # "fraction":Ljava/lang/String;
    .end local v5    # "frames":Ljava/lang/String;
    .end local v6    # "hours":Ljava/lang/String;
    .end local v8    # "minutes":Ljava/lang/String;
    .end local v11    # "seconds":Ljava/lang/String;
    .end local v12    # "subframes":Ljava/lang/String;
    :cond_82
    sget-object v15, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->OFFSET_TIME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 415
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v15

    if-eqz v15, :cond_f1

    .line 416
    const/4 v15, 0x1

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    .line 417
    .local v13, "timeValue":Ljava/lang/String;
    invoke-static {v13}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v9

    .line 418
    .local v9, "offsetSeconds":D
    const/4 v15, 0x2

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    .line 419
    .local v14, "unit":Ljava/lang/String;
    const-string v15, "h"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_b4

    .line 420
    const-wide v15, 0x40ac200000000000L    # 3600.0

    mul-double/2addr v9, v15

    .line 432
    :cond_ac
    :goto_ac
    const-wide v15, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v15, v9

    double-to-long v15, v15

    goto :goto_78

    .line 421
    :cond_b4
    const-string v15, "m"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_c0

    .line 422
    const-wide/high16 v15, 0x404e000000000000L    # 60.0

    mul-double/2addr v9, v15

    goto :goto_ac

    .line 423
    :cond_c0
    const-string v15, "s"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_ac

    .line 425
    const-string v15, "ms"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_d7

    .line 426
    const-wide v15, 0x408f400000000000L    # 1000.0

    div-double/2addr v9, v15

    goto :goto_ac

    .line 427
    :cond_d7
    const-string v15, "f"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_e4

    .line 428
    move/from16 v0, p1

    int-to-double v15, v0

    div-double/2addr v9, v15

    goto :goto_ac

    .line 429
    :cond_e4
    const-string v15, "t"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_ac

    .line 430
    move/from16 v0, p3

    int-to-double v15, v0

    div-double/2addr v9, v15

    goto :goto_ac

    .line 434
    .end local v9    # "offsetSeconds":D
    .end local v13    # "timeValue":Ljava/lang/String;
    .end local v14    # "unit":Ljava/lang/String;
    :cond_f1
    new-instance v15, Lcom/google/android/exoplayer/ParserException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Malformed time expression: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v15
.end method


# virtual methods
.method public canParse(Ljava/lang/String;)Z
    .registers 3
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 95
    const-string v0, "application/ttml+xml"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic parse([BII)Lcom/google/android/exoplayer/text/Subtitle;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parse([BII)Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;

    move-result-object v0

    return-object v0
.end method

.method public parse([BII)Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    .registers 22
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 101
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;

    invoke-virtual {v15}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v13

    .line 102
    .local v13, "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 103
    .local v5, "globalStyles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;>;"
    new-instance v6, Ljava/io/ByteArrayInputStream;

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-direct {v6, v0, v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 104
    .local v6, "inputStream":Ljava/io/ByteArrayInputStream;
    const/4 v15, 0x0

    invoke-interface {v13, v6, v15}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 105
    const/4 v11, 0x0

    .line 106
    .local v11, "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    new-instance v9, Ljava/util/LinkedList;

    invoke-direct {v9}, Ljava/util/LinkedList;-><init>()V

    .line 107
    .local v9, "nodeStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/google/android/exoplayer/text/ttml/TtmlNode;>;"
    const/4 v12, 0x0

    .line 108
    .local v12, "unsupportedNodeDepth":I
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    .line 109
    .local v4, "eventType":I
    :goto_27
    const/4 v15, 0x1

    if-eq v4, v15, :cond_de

    .line 110
    invoke-virtual {v9}, Ljava/util/LinkedList;->peekLast()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    .line 111
    .local v10, "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    if-nez v12, :cond_d2

    .line 112
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 113
    .local v7, "name":Ljava/lang/String;
    const/4 v15, 0x2

    if-ne v4, v15, :cond_9a

    .line 114
    invoke-static {v7}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->isSupportedTag(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_65

    .line 115
    const-string v15, "TtmlParser"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Ignoring unsupported tag: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    add-int/lit8 v12, v12, 0x1

    .line 147
    .end local v7    # "name":Ljava/lang/String;
    :cond_5d
    :goto_5d
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 148
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    .line 149
    goto :goto_27

    .line 117
    .restart local v7    # "name":Ljava/lang/String;
    :cond_65
    const-string v15, "head"

    invoke-virtual {v15, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7e

    .line 118
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v5}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseHeader(Lorg/xmlpull/v1/XmlPullParser;Ljava/util/Map;)Ljava/util/Map;
    :try_end_72
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_72} :catch_73
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_72} :catch_a9

    goto :goto_5d

    .line 151
    .end local v4    # "eventType":I
    .end local v5    # "globalStyles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;>;"
    .end local v6    # "inputStream":Ljava/io/ByteArrayInputStream;
    .end local v7    # "name":Ljava/lang/String;
    .end local v9    # "nodeStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/google/android/exoplayer/text/ttml/TtmlNode;>;"
    .end local v10    # "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .end local v11    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    .end local v12    # "unsupportedNodeDepth":I
    .end local v13    # "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_73
    move-exception v14

    .line 152
    .local v14, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v15, Lcom/google/android/exoplayer/ParserException;

    const-string v16, "Unable to parse source"

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v14}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15

    .line 121
    .end local v14    # "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v4    # "eventType":I
    .restart local v5    # "globalStyles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;>;"
    .restart local v6    # "inputStream":Ljava/io/ByteArrayInputStream;
    .restart local v7    # "name":Ljava/lang/String;
    .restart local v9    # "nodeStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/google/android/exoplayer/text/ttml/TtmlNode;>;"
    .restart local v10    # "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .restart local v11    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    .restart local v12    # "unsupportedNodeDepth":I
    .restart local v13    # "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_7e
    :try_start_7e
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v10}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseNode(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer/text/ttml/TtmlNode;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v8

    .line 122
    .local v8, "node":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    invoke-virtual {v9, v8}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 123
    if-eqz v10, :cond_5d

    .line 124
    invoke-virtual {v10, v8}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->addChild(Lcom/google/android/exoplayer/text/ttml/TtmlNode;)V
    :try_end_8c
    .catch Lcom/google/android/exoplayer/ParserException; {:try_start_7e .. :try_end_8c} :catch_8d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7e .. :try_end_8c} :catch_73
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_8c} :catch_a9

    goto :goto_5d

    .line 126
    .end local v8    # "node":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    :catch_8d
    move-exception v3

    .line 127
    .local v3, "e":Lcom/google/android/exoplayer/ParserException;
    :try_start_8e
    const-string v15, "TtmlParser"

    const-string v16, "Suppressing parser error"

    move-object/from16 v0, v16

    invoke-static {v15, v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 129
    add-int/lit8 v12, v12, 0x1

    .line 130
    goto :goto_5d

    .line 132
    .end local v3    # "e":Lcom/google/android/exoplayer/ParserException;
    :cond_9a
    const/4 v15, 0x4

    if-ne v4, v15, :cond_b4

    .line 133
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->buildTextNode(Ljava/lang/String;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v15

    invoke-virtual {v10, v15}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->addChild(Lcom/google/android/exoplayer/text/ttml/TtmlNode;)V
    :try_end_a8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_8e .. :try_end_a8} :catch_73
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_a8} :catch_a9

    goto :goto_5d

    .line 153
    .end local v4    # "eventType":I
    .end local v5    # "globalStyles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;>;"
    .end local v6    # "inputStream":Ljava/io/ByteArrayInputStream;
    .end local v7    # "name":Ljava/lang/String;
    .end local v9    # "nodeStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/google/android/exoplayer/text/ttml/TtmlNode;>;"
    .end local v10    # "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .end local v11    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    .end local v12    # "unsupportedNodeDepth":I
    .end local v13    # "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_a9
    move-exception v3

    .line 154
    .local v3, "e":Ljava/io/IOException;
    new-instance v15, Ljava/lang/IllegalStateException;

    const-string v16, "Unexpected error when reading input."

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15

    .line 134
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v4    # "eventType":I
    .restart local v5    # "globalStyles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/google/android/exoplayer/text/ttml/TtmlStyle;>;"
    .restart local v6    # "inputStream":Ljava/io/ByteArrayInputStream;
    .restart local v7    # "name":Ljava/lang/String;
    .restart local v9    # "nodeStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/google/android/exoplayer/text/ttml/TtmlNode;>;"
    .restart local v10    # "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .restart local v11    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    .restart local v12    # "unsupportedNodeDepth":I
    .restart local v13    # "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_b4
    const/4 v15, 0x3

    if-ne v4, v15, :cond_5d

    .line 135
    :try_start_b7
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v15

    const-string v16, "tt"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_ce

    .line 136
    new-instance v11, Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;

    .end local v11    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    invoke-virtual {v9}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    invoke-direct {v11, v15, v5}, Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;-><init>(Lcom/google/android/exoplayer/text/ttml/TtmlNode;Ljava/util/Map;)V

    .line 138
    .restart local v11    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    :cond_ce
    invoke-virtual {v9}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;
    :try_end_d1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_b7 .. :try_end_d1} :catch_73
    .catch Ljava/io/IOException; {:try_start_b7 .. :try_end_d1} :catch_a9

    goto :goto_5d

    .line 141
    .end local v7    # "name":Ljava/lang/String;
    :cond_d2
    const/4 v15, 0x2

    if-ne v4, v15, :cond_d8

    .line 142
    add-int/lit8 v12, v12, 0x1

    goto :goto_5d

    .line 143
    :cond_d8
    const/4 v15, 0x3

    if-ne v4, v15, :cond_5d

    .line 144
    add-int/lit8 v12, v12, -0x1

    goto :goto_5d

    .line 150
    .end local v10    # "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    :cond_de
    return-object v11
.end method
