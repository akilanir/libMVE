.class public final Lcom/google/android/exoplayer/text/webvtt/WebvttParserUtil;
.super Ljava/lang/Object;
.source "WebvttParserUtil.java"


# static fields
.field private static final HEADER:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-string v0, "^\ufeff?WEBVTT(( |\t).*)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/webvtt/WebvttParserUtil;->HEADER:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parsePercentage(Ljava/lang/String;)F
    .registers 3
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 69
    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 70
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "Percentages must end with %"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_10
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public static parseTimestampUs(Ljava/lang/String;)J
    .registers 12
    .param p0, "timestamp"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    const-wide/16 v9, 0x3e8

    .line 53
    const-wide/16 v3, 0x0

    .line 54
    .local v3, "value":J
    const-string v5, "\\."

    const/4 v6, 0x2

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "parts":[Ljava/lang/String;
    const/4 v5, 0x0

    aget-object v5, v1, v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "subparts":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    array-length v5, v2

    if-ge v0, v5, :cond_26

    .line 57
    const-wide/16 v5, 0x3c

    mul-long/2addr v5, v3

    aget-object v7, v2, v0

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    add-long v3, v5, v7

    .line 56
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 59
    :cond_26
    mul-long v5, v3, v9

    const/4 v7, 0x1

    aget-object v7, v1, v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    add-long/2addr v5, v7

    mul-long/2addr v5, v9

    return-wide v5
.end method

.method public static validateWebvttHeaderLine(Lcom/google/android/exoplayer/util/ParsableByteArray;)V
    .registers 5
    .param p0, "input"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_12

    sget-object v1, Lcom/google/android/exoplayer/text/webvtt/WebvttParserUtil;->HEADER:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 41
    :cond_12
    new-instance v1, Lcom/google/android/exoplayer/ParserException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected WEBVTT. Got "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 43
    :cond_2b
    return-void
.end method
