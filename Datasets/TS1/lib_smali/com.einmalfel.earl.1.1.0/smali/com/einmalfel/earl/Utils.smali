.class Lcom/einmalfel/earl/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field static final ATOM_NAMESPACE:Ljava/lang/String; = "http://www.w3.org/2005/Atom"

.field static final ITUNES_NAMESPACE:Ljava/lang/String; = "http://www.itunes.com/dtds/podcast-1.0.dtd"

.field static final MEDIA_NAMESPACE:Ljava/lang/String; = "http://search.yahoo.com/mrss/"

.field private static RFC3339:Ljava/text/DateFormat; = null

.field private static RFC3339Ms:Ljava/text/DateFormat; = null

.field private static RFC3339Tz:Ljava/text/DateFormat; = null

.field private static RFC3339TzMs:Ljava/text/DateFormat; = null

.field private static final TAG:Ljava/lang/String; = "Earl.Utils"

.field private static itunesDurationFormats:[Ljava/text/DateFormat;

.field private static final rfc822DateTimeFormat:Ljava/text/DateFormat;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 30
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "EEE, dd MMM yyyy HH:mm:ss Z"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/einmalfel/earl/Utils;->rfc822DateTimeFormat:Ljava/text/DateFormat;

    .line 108
    const/4 v0, 0x0

    sput-object v0, Lcom/einmalfel/earl/Utils;->itunesDurationFormats:[Ljava/text/DateFormat;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static finishTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 3
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_15

    .line 165
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_11

    .line 166
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->skipTag(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 168
    :cond_11
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_0

    .line 170
    :cond_15
    return-void
.end method

.method static nonNullInt(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 4
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 210
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 211
    .local v0, "result":Ljava/lang/Integer;
    if-nez v0, :cond_12

    .line 212
    const-string v1, "Earl.Utils"

    const-string v2, "Malformed integer string replaced with \'-1\'"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 215
    .end local v0    # "result":Ljava/lang/Integer;
    :cond_12
    return-object v0
.end method

.method static nonNullString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 221
    if-nez p0, :cond_10

    .line 222
    const-string v0, "Earl.Utils"

    const-string v1, "Unexpectedly got null string. Replaced with empty"

    new-instance v2, Ljava/lang/NullPointerException;

    invoke-direct {v2}, Ljava/lang/NullPointerException;-><init>()V

    invoke-static {v0, v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 223
    const-string p0, ""

    .line 225
    .end local p0    # "string":Ljava/lang/String;
    :cond_10
    return-object p0
.end method

.method static nonNullUri(Ljava/lang/String;)Ljava/net/URI;
    .registers 5
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 273
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->tryParseUri(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    .line 274
    .local v1, "result":Ljava/net/URI;
    if-nez v1, :cond_14

    .line 275
    const-string v2, "Earl.Utils"

    const-string v3, "Malformed URI replaced with \'http://\'"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    :try_start_d
    new-instance v1, Ljava/net/URI;

    .end local v1    # "result":Ljava/net/URI;
    const-string v2, "http:///"

    invoke-direct {v1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/net/URISyntaxException; {:try_start_d .. :try_end_14} :catch_15

    .line 280
    .restart local v1    # "result":Ljava/net/URI;
    :cond_14
    return-object v1

    .line 278
    .end local v1    # "result":Ljava/net/URI;
    :catch_15
    move-exception v0

    .local v0, "ignored":Ljava/net/URISyntaxException;
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "Should never get here"

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method static nonNullUrl(Ljava/lang/String;)Ljava/net/URL;
    .registers 5
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 246
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->tryParseUrl(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    .line 247
    .local v1, "result":Ljava/net/URL;
    if-nez v1, :cond_14

    .line 248
    const-string v2, "Earl.Utils"

    const-string v3, "Malformed URL replaced with \'http://\'"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :try_start_d
    new-instance v1, Ljava/net/URL;

    .end local v1    # "result":Ljava/net/URL;
    const-string v2, "http://"

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/net/MalformedURLException; {:try_start_d .. :try_end_14} :catch_15

    .line 253
    .restart local v1    # "result":Ljava/net/URL;
    :cond_14
    return-object v1

    .line 251
    .end local v1    # "result":Ljava/net/URL;
    :catch_15
    move-exception v0

    .local v0, "ignored":Ljava/net/MalformedURLException;
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "Should never get here"

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method static parseItunesDuration(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 10
    .param p0, "dateString"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 129
    sget-object v2, Lcom/einmalfel/earl/Utils;->itunesDurationFormats:[Ljava/text/DateFormat;

    if-nez v2, :cond_7

    .line 130
    invoke-static {}, Lcom/einmalfel/earl/Utils;->setupItunesDateFormats()V

    .line 132
    :cond_7
    sget-object v3, Lcom/einmalfel/earl/Utils;->itunesDurationFormats:[Ljava/text/DateFormat;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v4, :cond_24

    aget-object v1, v3, v2

    .line 134
    .local v1, "format":Ljava/text/DateFormat;
    :try_start_f
    invoke-virtual {v1, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 135
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    const-wide/16 v7, 0x3e8

    div-long/2addr v5, v7

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_1e
    .catch Ljava/text/ParseException; {:try_start_f .. :try_end_1e} :catch_20

    move-result-object v2

    .line 139
    .end local v0    # "date":Ljava/util/Date;
    .end local v1    # "format":Ljava/text/DateFormat;
    :goto_1f
    return-object v2

    .line 136
    .restart local v1    # "format":Ljava/text/DateFormat;
    :catch_20
    move-exception v5

    .line 132
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 139
    .end local v1    # "format":Ljava/text/DateFormat;
    :cond_24
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_1f
.end method

.method static parseMediaRssTime(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 3
    .param p0, "time"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 146
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->parseItunesDuration(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 147
    .local v0, "result":Ljava/lang/Integer;
    if-nez v0, :cond_b

    .line 148
    invoke-static {p0}, Lcom/einmalfel/earl/Utils;->parseRFC2326NPT(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 153
    :goto_a
    return-object v0

    .line 151
    :cond_b
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/lit16 v1, v1, 0x3e8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_a
.end method

.method static parseRFC2326NPT(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 4
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 101
    :try_start_0
    new-instance v1, Lcom/einmalfel/earl/tools/NPTParser;

    invoke-direct {v1, p0}, Lcom/einmalfel/earl/tools/NPTParser;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/einmalfel/earl/tools/NPTParser;->parse()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_d
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_d} :catch_f

    move-result-object v1

    .line 104
    :goto_e
    return-object v1

    .line 102
    :catch_f
    move-exception v0

    .line 103
    .local v0, "exception":Ljava/text/ParseException;
    const-string v1, "Earl.Utils"

    const-string v2, "Failed to parse media:rating time"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 104
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public static parseRFC3339Date(Ljava/lang/String;)Ljava/util/Date;
    .registers 9
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 62
    sget-object v5, Lcom/einmalfel/earl/Utils;->RFC3339:Ljava/text/DateFormat;

    if-nez v5, :cond_7

    .line 63
    invoke-static {}, Lcom/einmalfel/earl/Utils;->setupRFC3339()V

    .line 69
    :cond_7
    :try_start_7
    const-string v5, "Z"

    invoke-virtual {p0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    :try_end_c
    .catch Ljava/text/ParseException; {:try_start_7 .. :try_end_c} :catch_7b

    move-result v5

    if-eqz v5, :cond_1e

    .line 71
    :try_start_f
    sget-object v5, Lcom/einmalfel/earl/Utils;->RFC3339:Ljava/text/DateFormat;

    invoke-virtual {v5, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_14
    .catch Ljava/text/ParseException; {:try_start_f .. :try_end_14} :catch_16

    move-result-object v0

    .line 94
    :goto_15
    return-object v0

    .line 72
    :catch_16
    move-exception v3

    .line 73
    .local v3, "pe":Ljava/text/ParseException;
    :try_start_17
    sget-object v5, Lcom/einmalfel/earl/Utils;->RFC3339Ms:Ljava/text/DateFormat;

    invoke-virtual {v5, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .local v0, "date":Ljava/util/Date;
    goto :goto_15

    .line 79
    .end local v0    # "date":Ljava/util/Date;
    .end local v3    # "pe":Ljava/text/ParseException;
    :cond_1e
    const/4 v5, 0x0

    const/16 v6, 0x2d

    invoke-virtual {p0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 80
    .local v2, "firstPart":Ljava/lang/String;
    const/16 v5, 0x2d

    invoke-virtual {p0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 83
    .local v4, "secondPart":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    const/16 v7, 0x3a

    invoke-virtual {v4, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x3a

    .line 84
    invoke-virtual {v4, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 85
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_6b
    .catch Ljava/text/ParseException; {:try_start_17 .. :try_end_6b} :catch_7b

    move-result-object p0

    .line 87
    :try_start_6c
    sget-object v5, Lcom/einmalfel/earl/Utils;->RFC3339Tz:Ljava/text/DateFormat;

    invoke-virtual {v5, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_71
    .catch Ljava/text/ParseException; {:try_start_6c .. :try_end_71} :catch_73

    move-result-object v0

    .restart local v0    # "date":Ljava/util/Date;
    goto :goto_15

    .line 88
    .end local v0    # "date":Ljava/util/Date;
    :catch_73
    move-exception v3

    .line 89
    .restart local v3    # "pe":Ljava/text/ParseException;
    :try_start_74
    sget-object v5, Lcom/einmalfel/earl/Utils;->RFC3339TzMs:Ljava/text/DateFormat;

    invoke-virtual {v5, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_79
    .catch Ljava/text/ParseException; {:try_start_74 .. :try_end_79} :catch_7b

    move-result-object v0

    .restart local v0    # "date":Ljava/util/Date;
    goto :goto_15

    .line 92
    .end local v0    # "date":Ljava/util/Date;
    .end local v2    # "firstPart":Ljava/lang/String;
    .end local v3    # "pe":Ljava/text/ParseException;
    .end local v4    # "secondPart":Ljava/lang/String;
    :catch_7b
    move-exception v1

    .line 93
    .local v1, "exception":Ljava/text/ParseException;
    const-string v5, "Earl.Utils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to parse RFC3339 string "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 94
    const/4 v0, 0x0

    goto :goto_15
.end method

.method static parseRFC822Date(Ljava/lang/String;)Ljava/util/Date;
    .registers 5
    .param p0, "dateString"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 36
    :try_start_0
    sget-object v1, Lcom/einmalfel/earl/Utils;->rfc822DateTimeFormat:Ljava/text/DateFormat;

    invoke-virtual {v1, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_5
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 39
    :goto_6
    return-object v1

    .line 37
    :catch_7
    move-exception v0

    .line 38
    .local v0, "exception":Ljava/text/ParseException;
    const-string v1, "Earl.Utils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Malformed date "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    const/4 v1, 0x0

    goto :goto_6
.end method

.method static setupItunesDateFormats()V
    .registers 8

    .prologue
    const/4 v2, 0x0

    .line 111
    const/4 v3, 0x4

    new-array v3, v3, [Ljava/text/DateFormat;

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "HH:mm:ss"

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v4, v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v4, v3, v2

    const/4 v4, 0x1

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "H:mm:ss"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v5, v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v5, v3, v4

    const/4 v4, 0x2

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "mm:ss"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v5, v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v5, v3, v4

    const/4 v4, 0x3

    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v6, "m:ss"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v5, v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    aput-object v5, v3, v4

    sput-object v3, Lcom/einmalfel/earl/Utils;->itunesDurationFormats:[Ljava/text/DateFormat;

    .line 117
    const-string v3, "UTC"

    invoke-static {v3}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    .line 118
    .local v1, "utc":Ljava/util/TimeZone;
    sget-object v3, Lcom/einmalfel/earl/Utils;->itunesDurationFormats:[Ljava/text/DateFormat;

    array-length v4, v3

    :goto_3e
    if-ge v2, v4, :cond_48

    aget-object v0, v3, v2

    .line 119
    .local v0, "format":Ljava/text/DateFormat;
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 118
    add-int/lit8 v2, v2, 0x1

    goto :goto_3e

    .line 121
    .end local v0    # "format":Ljava/text/DateFormat;
    :cond_48
    return-void
.end method

.method static setupRFC3339()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    .line 49
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/einmalfel/earl/Utils;->RFC3339:Ljava/text/DateFormat;

    .line 50
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS\'Z\'"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/einmalfel/earl/Utils;->RFC3339Ms:Ljava/text/DateFormat;

    .line 51
    sget-object v0, Lcom/einmalfel/earl/Utils;->RFC3339Ms:Ljava/text/DateFormat;

    invoke-virtual {v0, v3}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 52
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/einmalfel/earl/Utils;->RFC3339Tz:Ljava/text/DateFormat;

    .line 53
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSSZ"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/einmalfel/earl/Utils;->RFC3339TzMs:Ljava/text/DateFormat;

    .line 54
    sget-object v0, Lcom/einmalfel/earl/Utils;->RFC3339TzMs:Ljava/text/DateFormat;

    invoke-virtual {v0, v3}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 55
    return-void
.end method

.method static skipTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 4
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_d

    .line 178
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 180
    :cond_d
    const/4 v0, 0x1

    .line 181
    .local v0, "depth":I
    :goto_e
    if-eqz v0, :cond_1e

    .line 182
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    packed-switch v1, :pswitch_data_20

    goto :goto_e

    .line 187
    :pswitch_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 184
    :pswitch_1b
    add-int/lit8 v0, v0, -0x1

    .line 185
    goto :goto_e

    .line 191
    :cond_1e
    return-void

    .line 182
    nop

    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_18
        :pswitch_1b
    .end packed-switch
.end method

.method static tryParseInt(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 6
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 195
    if-nez p0, :cond_10

    .line 196
    const-string v2, "Earl.Utils"

    const-string v3, "Null value while parsing integer"

    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4}, Ljava/lang/NullPointerException;-><init>()V

    invoke-static {v2, v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 203
    :goto_f
    return-object v1

    .line 200
    :cond_10
    :try_start_10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_13
    .catch Ljava/lang/NumberFormatException; {:try_start_10 .. :try_end_13} :catch_15

    move-result-object v1

    goto :goto_f

    .line 201
    :catch_15
    move-exception v0

    .line 202
    .local v0, "exception":Ljava/lang/NumberFormatException;
    const-string v2, "Earl.Utils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error parsing integer value \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f
.end method

.method static tryParseUri(Ljava/lang/String;)Ljava/net/URI;
    .registers 6
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 258
    if-nez p0, :cond_10

    .line 259
    const-string v2, "Earl.Utils"

    const-string v3, "Null value while parsing uri"

    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4}, Ljava/lang/NullPointerException;-><init>()V

    invoke-static {v2, v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 266
    :goto_f
    return-object v1

    .line 263
    :cond_10
    :try_start_10
    new-instance v2, Ljava/net/URI;

    invoke-direct {v2, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/net/URISyntaxException; {:try_start_10 .. :try_end_15} :catch_17

    move-object v1, v2

    goto :goto_f

    .line 264
    :catch_17
    move-exception v0

    .line 265
    .local v0, "exception":Ljava/net/URISyntaxException;
    const-string v2, "Earl.Utils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error parsing uri value \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f
.end method

.method static tryParseUrl(Ljava/lang/String;)Ljava/net/URL;
    .registers 6
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 231
    if-nez p0, :cond_10

    .line 232
    const-string v2, "Earl.Utils"

    const-string v3, "Null value while parsing url"

    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4}, Ljava/lang/NullPointerException;-><init>()V

    invoke-static {v2, v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 239
    :goto_f
    return-object v1

    .line 236
    :cond_10
    :try_start_10
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/net/MalformedURLException; {:try_start_10 .. :try_end_15} :catch_17

    move-object v1, v2

    goto :goto_f

    .line 237
    :catch_17
    move-exception v0

    .line 238
    .local v0, "exception":Ljava/net/MalformedURLException;
    const-string v2, "Earl.Utils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error parsing url value \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f
.end method
