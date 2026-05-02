.class public enum Lezvcard/util/VCardDateFormat;
.super Ljava/lang/Enum;
.source "VCardDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lezvcard/util/VCardDateFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lezvcard/util/VCardDateFormat;

.field public static final enum DATE_BASIC:Lezvcard/util/VCardDateFormat;

.field public static final enum DATE_EXTENDED:Lezvcard/util/VCardDateFormat;

.field public static final enum DATE_TIME_BASIC:Lezvcard/util/VCardDateFormat;

.field public static final enum DATE_TIME_EXTENDED:Lezvcard/util/VCardDateFormat;

.field public static final enum HCARD_DATE_TIME:Lezvcard/util/VCardDateFormat;

.field public static final enum UTC_DATE_TIME_BASIC:Lezvcard/util/VCardDateFormat;

.field public static final enum UTC_DATE_TIME_EXTENDED:Lezvcard/util/VCardDateFormat;


# instance fields
.field protected final formatStr:Ljava/lang/String;

.field private final pattern:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 51
    new-instance v0, Lezvcard/util/VCardDateFormat;

    const-string v1, "DATE_BASIC"

    const-string v2, "\\d{8}"

    const-string v3, "yyyyMMdd"

    invoke-direct {v0, v1, v5, v2, v3}, Lezvcard/util/VCardDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lezvcard/util/VCardDateFormat;->DATE_BASIC:Lezvcard/util/VCardDateFormat;

    .line 58
    new-instance v0, Lezvcard/util/VCardDateFormat;

    const-string v1, "DATE_EXTENDED"

    const-string v2, "\\d{4}-\\d{2}-\\d{2}"

    const-string v3, "yyyy-MM-dd"

    invoke-direct {v0, v1, v6, v2, v3}, Lezvcard/util/VCardDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lezvcard/util/VCardDateFormat;->DATE_EXTENDED:Lezvcard/util/VCardDateFormat;

    .line 65
    new-instance v0, Lezvcard/util/VCardDateFormat;

    const-string v1, "DATE_TIME_BASIC"

    const-string v2, "\\d{8}T\\d{6}[-\\+]\\d{4}"

    const-string v3, "yyyyMMdd\'T\'HHmmssZ"

    invoke-direct {v0, v1, v7, v2, v3}, Lezvcard/util/VCardDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lezvcard/util/VCardDateFormat;->DATE_TIME_BASIC:Lezvcard/util/VCardDateFormat;

    .line 72
    new-instance v0, Lezvcard/util/VCardDateFormat$1;

    const-string v1, "DATE_TIME_EXTENDED"

    const-string v2, "\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}[-\\+]\\d{2}:\\d{2}"

    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v0, v1, v8, v2, v3}, Lezvcard/util/VCardDateFormat$1;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lezvcard/util/VCardDateFormat;->DATE_TIME_EXTENDED:Lezvcard/util/VCardDateFormat;

    .line 111
    new-instance v0, Lezvcard/util/VCardDateFormat$2;

    const-string v1, "UTC_DATE_TIME_BASIC"

    const-string v2, "\\d{8}T\\d{6}Z"

    const-string v3, "yyyyMMdd\'T\'HHmmss\'Z\'"

    invoke-direct {v0, v1, v9, v2, v3}, Lezvcard/util/VCardDateFormat$2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lezvcard/util/VCardDateFormat;->UTC_DATE_TIME_BASIC:Lezvcard/util/VCardDateFormat;

    .line 125
    new-instance v0, Lezvcard/util/VCardDateFormat$3;

    const-string v1, "UTC_DATE_TIME_EXTENDED"

    const/4 v2, 0x5

    const-string v3, "\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z"

    const-string v4, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    invoke-direct {v0, v1, v2, v3, v4}, Lezvcard/util/VCardDateFormat$3;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lezvcard/util/VCardDateFormat;->UTC_DATE_TIME_EXTENDED:Lezvcard/util/VCardDateFormat;

    .line 139
    new-instance v0, Lezvcard/util/VCardDateFormat$4;

    const-string v1, "HCARD_DATE_TIME"

    const/4 v2, 0x6

    const-string v3, "\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}[-\\+]\\d{2}:?\\d{2}"

    const-string v4, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v0, v1, v2, v3, v4}, Lezvcard/util/VCardDateFormat$4;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lezvcard/util/VCardDateFormat;->HCARD_DATE_TIME:Lezvcard/util/VCardDateFormat;

    .line 46
    const/4 v0, 0x7

    new-array v0, v0, [Lezvcard/util/VCardDateFormat;

    sget-object v1, Lezvcard/util/VCardDateFormat;->DATE_BASIC:Lezvcard/util/VCardDateFormat;

    aput-object v1, v0, v5

    sget-object v1, Lezvcard/util/VCardDateFormat;->DATE_EXTENDED:Lezvcard/util/VCardDateFormat;

    aput-object v1, v0, v6

    sget-object v1, Lezvcard/util/VCardDateFormat;->DATE_TIME_BASIC:Lezvcard/util/VCardDateFormat;

    aput-object v1, v0, v7

    sget-object v1, Lezvcard/util/VCardDateFormat;->DATE_TIME_EXTENDED:Lezvcard/util/VCardDateFormat;

    aput-object v1, v0, v8

    sget-object v1, Lezvcard/util/VCardDateFormat;->UTC_DATE_TIME_BASIC:Lezvcard/util/VCardDateFormat;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lezvcard/util/VCardDateFormat;->UTC_DATE_TIME_EXTENDED:Lezvcard/util/VCardDateFormat;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lezvcard/util/VCardDateFormat;->HCARD_DATE_TIME:Lezvcard/util/VCardDateFormat;

    aput-object v2, v0, v1

    sput-object v0, Lezvcard/util/VCardDateFormat;->$VALUES:[Lezvcard/util/VCardDateFormat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p3, "regex"    # Ljava/lang/String;
    .param p4, "formatStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 180
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 181
    invoke-static {p3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lezvcard/util/VCardDateFormat;->pattern:Ljava/util/regex/Pattern;

    .line 182
    iput-object p4, p0, Lezvcard/util/VCardDateFormat;->formatStr:Ljava/lang/String;

    .line 183
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lezvcard/util/VCardDateFormat$1;)V
    .registers 6
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # Lezvcard/util/VCardDateFormat$1;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3, p4}, Lezvcard/util/VCardDateFormat;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static dateHasTime(Ljava/lang/String;)Z
    .registers 2
    .param p0, "dateStr"    # Ljava/lang/String;

    .prologue
    .line 283
    const-string v0, "T"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static dateHasTimezone(Ljava/lang/String;)Z
    .registers 2
    .param p0, "dateStr"    # Ljava/lang/String;

    .prologue
    .line 293
    const-string v0, "Z"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, ".*?[-+]\\d\\d:?\\d\\d"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static find(Ljava/lang/String;)Lezvcard/util/VCardDateFormat;
    .registers 6
    .param p0, "dateStr"    # Ljava/lang/String;

    .prologue
    .line 245
    invoke-static {}, Lezvcard/util/VCardDateFormat;->values()[Lezvcard/util/VCardDateFormat;

    move-result-object v0

    .local v0, "arr$":[Lezvcard/util/VCardDateFormat;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_14

    aget-object v1, v0, v2

    .line 246
    .local v1, "format":Lezvcard/util/VCardDateFormat;
    invoke-virtual {v1, p0}, Lezvcard/util/VCardDateFormat;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 250
    .end local v1    # "format":Lezvcard/util/VCardDateFormat;
    :goto_10
    return-object v1

    .line 245
    .restart local v1    # "format":Lezvcard/util/VCardDateFormat;
    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 250
    .end local v1    # "format":Lezvcard/util/VCardDateFormat;
    :cond_14
    const/4 v1, 0x0

    goto :goto_10
.end method

.method public static parse(Ljava/lang/String;)Ljava/util/Date;
    .registers 5
    .param p0, "dateStr"    # Ljava/lang/String;

    .prologue
    .line 262
    invoke-static {p0}, Lezvcard/util/VCardDateFormat;->find(Ljava/lang/String;)Lezvcard/util/VCardDateFormat;

    move-result-object v2

    .line 263
    .local v2, "format":Lezvcard/util/VCardDateFormat;
    if-nez v2, :cond_b

    .line 264
    invoke-static {p0}, Lezvcard/util/VCardDateFormat;->parseException(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v3

    throw v3

    .line 268
    :cond_b
    invoke-virtual {v2}, Lezvcard/util/VCardDateFormat;->getDateFormat()Ljava/text/DateFormat;

    move-result-object v0

    .line 270
    .local v0, "df":Ljava/text/DateFormat;
    :try_start_f
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_12
    .catch Ljava/text/ParseException; {:try_start_f .. :try_end_12} :catch_14

    move-result-object v3

    return-object v3

    .line 271
    :catch_14
    move-exception v1

    .line 273
    .local v1, "e":Ljava/text/ParseException;
    invoke-static {p0}, Lezvcard/util/VCardDateFormat;->parseException(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v3

    throw v3
.end method

.method private static parseException(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;
    .registers 4
    .param p0, "dateStr"    # Ljava/lang/String;

    .prologue
    .line 307
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Date string \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" is not in a valid ISO-8601 format."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static parseTimeZoneId(Ljava/lang/String;)Ljava/util/TimeZone;
    .registers 4
    .param p0, "timezoneId"    # Ljava/lang/String;

    .prologue
    .line 302
    invoke-static {p0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .line 303
    .local v0, "timezone":Ljava/util/TimeZone;
    const-string v1, "GMT"

    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    const/4 v0, 0x0

    .end local v0    # "timezone":Ljava/util/TimeZone;
    :cond_11
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lezvcard/util/VCardDateFormat;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    const-class v0, Lezvcard/util/VCardDateFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lezvcard/util/VCardDateFormat;

    return-object v0
.end method

.method public static values()[Lezvcard/util/VCardDateFormat;
    .registers 1

    .prologue
    .line 46
    sget-object v0, Lezvcard/util/VCardDateFormat;->$VALUES:[Lezvcard/util/VCardDateFormat;

    invoke-virtual {v0}, [Lezvcard/util/VCardDateFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lezvcard/util/VCardDateFormat;

    return-object v0
.end method


# virtual methods
.method public format(Ljava/util/Date;)Ljava/lang/String;
    .registers 3
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 224
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lezvcard/util/VCardDateFormat;->format(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/lang/String;
    .registers 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "timezone"    # Ljava/util/TimeZone;

    .prologue
    .line 235
    invoke-virtual {p0, p2}, Lezvcard/util/VCardDateFormat;->getDateFormat(Ljava/util/TimeZone;)Ljava/text/DateFormat;

    move-result-object v0

    .line 236
    .local v0, "df":Ljava/text/DateFormat;
    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getDateFormat()Ljava/text/DateFormat;
    .registers 2

    .prologue
    .line 200
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lezvcard/util/VCardDateFormat;->getDateFormat(Ljava/util/TimeZone;)Ljava/text/DateFormat;

    move-result-object v0

    return-object v0
.end method

.method public getDateFormat(Ljava/util/TimeZone;)Ljava/text/DateFormat;
    .registers 4
    .param p1, "timezone"    # Ljava/util/TimeZone;

    .prologue
    .line 211
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v1, p0, Lezvcard/util/VCardDateFormat;->formatStr:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 212
    .local v0, "df":Ljava/text/DateFormat;
    if-eqz p1, :cond_c

    .line 213
    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 215
    :cond_c
    return-object v0
.end method

.method public matches(Ljava/lang/String;)Z
    .registers 3
    .param p1, "dateStr"    # Ljava/lang/String;

    .prologue
    .line 191
    iget-object v0, p0, Lezvcard/util/VCardDateFormat;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    return v0
.end method
