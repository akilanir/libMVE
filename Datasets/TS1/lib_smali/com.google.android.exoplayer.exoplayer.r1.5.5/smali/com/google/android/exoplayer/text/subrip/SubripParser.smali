.class public final Lcom/google/android/exoplayer/text/subrip/SubripParser;
.super Ljava/lang/Object;
.source "SubripParser.java"

# interfaces
.implements Lcom/google/android/exoplayer/text/SubtitleParser;


# static fields
.field private static final SUBRIP_TIMESTAMP:Ljava/util/regex/Pattern;

.field private static final SUBRIP_TIMING_LINE:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String; = "SubripParser"


# instance fields
.field private final textBuilder:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    const-string v0, "(\\S*)\\s*-->\\s*(\\S*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/subrip/SubripParser;->SUBRIP_TIMING_LINE:Ljava/util/regex/Pattern;

    .line 41
    const-string v0, "(?:(\\d+):)?(\\d+):(\\d+),(\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/subrip/SubripParser;->SUBRIP_TIMESTAMP:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/text/subrip/SubripParser;->textBuilder:Ljava/lang/StringBuilder;

    .line 48
    return-void
.end method

.method private static parseTimecode(Ljava/lang/String;)J
    .registers 10
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x3c

    const-wide/16 v5, 0x3e8

    .line 117
    sget-object v3, Lcom/google/android/exoplayer/text/subrip/SubripParser;->SUBRIP_TIMESTAMP:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 118
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-nez v3, :cond_18

    .line 119
    new-instance v3, Ljava/lang/NumberFormatException;

    const-string v4, "has invalid format"

    invoke-direct {v3, v4}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 121
    :cond_18
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    mul-long/2addr v3, v7

    mul-long/2addr v3, v7

    mul-long v1, v3, v5

    .line 122
    .local v1, "timestampMs":J
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    mul-long/2addr v3, v7

    mul-long/2addr v3, v5

    add-long/2addr v1, v3

    .line 123
    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    mul-long/2addr v3, v5

    add-long/2addr v1, v3

    .line 124
    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 125
    mul-long v3, v1, v5

    return-wide v3
.end method


# virtual methods
.method public canParse(Ljava/lang/String;)Z
    .registers 3
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 52
    const-string v0, "application/x-subrip"

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
    .line 36
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/exoplayer/text/subrip/SubripParser;->parse([BII)Lcom/google/android/exoplayer/text/subrip/SubripSubtitle;

    move-result-object v0

    return-object v0
.end method

.method public parse([BII)Lcom/google/android/exoplayer/text/subrip/SubripSubtitle;
    .registers 19
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 57
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v3, "cues":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/text/Cue;>;"
    new-instance v1, Lcom/google/android/exoplayer/util/LongArray;

    invoke-direct {v1}, Lcom/google/android/exoplayer/util/LongArray;-><init>()V

    .line 59
    .local v1, "cueTimesUs":Lcom/google/android/exoplayer/util/LongArray;
    new-instance v10, Lcom/google/android/exoplayer/util/ParsableByteArray;

    add-int v12, p2, p3

    move-object/from16 v0, p1

    invoke-direct {v10, v0, v12}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([BI)V

    .line 60
    .local v10, "subripData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    move/from16 v0, p2

    invoke-virtual {v10, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 64
    :cond_18
    :goto_18
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLine()Ljava/lang/String;

    move-result-object v5

    .local v5, "currentLine":Ljava/lang/String;
    if-eqz v5, :cond_d4

    .line 65
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v12

    if-eqz v12, :cond_18

    .line 72
    :try_start_24
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_27
    .catch Ljava/lang/NumberFormatException; {:try_start_24 .. :try_end_27} :catch_85

    .line 79
    const/4 v8, 0x0

    .line 80
    .local v8, "haveEndTimecode":Z
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLine()Ljava/lang/String;

    move-result-object v5

    .line 81
    sget-object v12, Lcom/google/android/exoplayer/text/subrip/SubripParser;->SUBRIP_TIMING_LINE:Ljava/util/regex/Pattern;

    invoke-virtual {v12, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v9

    .line 82
    .local v9, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v9}, Ljava/util/regex/Matcher;->find()Z

    move-result v12

    if-eqz v12, :cond_a0

    .line 83
    const/4 v12, 0x1

    invoke-virtual {v9, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/google/android/exoplayer/text/subrip/SubripParser;->parseTimecode(Ljava/lang/String;)J

    move-result-wide v12

    invoke-virtual {v1, v12, v13}, Lcom/google/android/exoplayer/util/LongArray;->add(J)V

    .line 84
    const/4 v12, 0x2

    invoke-virtual {v9, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    .line 85
    .local v7, "endTimecode":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_5c

    .line 86
    const/4 v8, 0x1

    .line 87
    const/4 v12, 0x2

    invoke-virtual {v9, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/google/android/exoplayer/text/subrip/SubripParser;->parseTimecode(Ljava/lang/String;)J

    move-result-wide v12

    invoke-virtual {v1, v12, v13}, Lcom/google/android/exoplayer/util/LongArray;->add(J)V

    .line 95
    :cond_5c
    iget-object v12, p0, Lcom/google/android/exoplayer/text/subrip/SubripParser;->textBuilder:Ljava/lang/StringBuilder;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 96
    :goto_62
    invoke-virtual {v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLine()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_ba

    .line 97
    iget-object v12, p0, Lcom/google/android/exoplayer/text/subrip/SubripParser;->textBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    if-lez v12, :cond_7b

    .line 98
    iget-object v12, p0, Lcom/google/android/exoplayer/text/subrip/SubripParser;->textBuilder:Ljava/lang/StringBuilder;

    const-string v13, "<br>"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    :cond_7b
    iget-object v12, p0, Lcom/google/android/exoplayer/text/subrip/SubripParser;->textBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_62

    .line 73
    .end local v7    # "endTimecode":Ljava/lang/String;
    .end local v8    # "haveEndTimecode":Z
    .end local v9    # "matcher":Ljava/util/regex/Matcher;
    :catch_85
    move-exception v6

    .line 74
    .local v6, "e":Ljava/lang/NumberFormatException;
    const-string v12, "SubripParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Skipping invalid index: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_18

    .line 90
    .end local v6    # "e":Ljava/lang/NumberFormatException;
    .restart local v8    # "haveEndTimecode":Z
    .restart local v9    # "matcher":Ljava/util/regex/Matcher;
    :cond_a0
    const-string v12, "SubripParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Skipping invalid timing: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_18

    .line 103
    .restart local v7    # "endTimecode":Ljava/lang/String;
    :cond_ba
    iget-object v12, p0, Lcom/google/android/exoplayer/text/subrip/SubripParser;->textBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v11

    .line 104
    .local v11, "text":Landroid/text/Spanned;
    new-instance v12, Lcom/google/android/exoplayer/text/Cue;

    invoke-direct {v12, v11}, Lcom/google/android/exoplayer/text/Cue;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    if-eqz v8, :cond_18

    .line 106
    const/4 v12, 0x0

    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_18

    .line 110
    .end local v7    # "endTimecode":Ljava/lang/String;
    .end local v8    # "haveEndTimecode":Z
    .end local v9    # "matcher":Ljava/util/regex/Matcher;
    .end local v11    # "text":Landroid/text/Spanned;
    :cond_d4
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v12

    new-array v4, v12, [Lcom/google/android/exoplayer/text/Cue;

    .line 111
    .local v4, "cuesArray":[Lcom/google/android/exoplayer/text/Cue;
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 112
    invoke-virtual {v1}, Lcom/google/android/exoplayer/util/LongArray;->toArray()[J

    move-result-object v2

    .line 113
    .local v2, "cueTimesUsArray":[J
    new-instance v12, Lcom/google/android/exoplayer/text/subrip/SubripSubtitle;

    invoke-direct {v12, v4, v2}, Lcom/google/android/exoplayer/text/subrip/SubripSubtitle;-><init>([Lcom/google/android/exoplayer/text/Cue;[J)V

    return-object v12
.end method
