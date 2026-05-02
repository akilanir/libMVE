.class public Lfreemarker/core/_RegexBuiltins;
.super Ljava/lang/Object;
.source "_RegexBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/_RegexBuiltins$RegexMatchModel;,
        Lfreemarker/core/_RegexBuiltins$split_reBI;,
        Lfreemarker/core/_RegexBuiltins$replace_reBI;,
        Lfreemarker/core/_RegexBuiltins$groupsBI;,
        Lfreemarker/core/_RegexBuiltins$matchesBI;,
        Lfreemarker/core/_RegexBuiltins$PatternCacheKey;
    }
.end annotation


# static fields
.field private static final MAX_FLAG_WARNINGS_LOGGED:I = 0x19

.field private static final RE_FLAG_CASE_INSENSITIVE:J

.field private static final RE_FLAG_COMMENTS:J

.field private static final RE_FLAG_DOTALL:J

.field private static final RE_FLAG_FIRST_ONLY:J = 0x200000000L

.field private static final RE_FLAG_MULTILINE:J

.field private static final RE_FLAG_REGEXP:J = 0x100000000L

.field private static flagWarningsCnt:I

.field private static final flagWarningsCntSync:Ljava/lang/Object;

.field private static volatile flagWarningsEnabled:Z

.field private static final logger:Lfreemarker/log/Logger;

.field static final patternCache:Lfreemarker/cache/MruCacheStorage;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 93
    const-string v0, "freemarker.runtime"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/core/_RegexBuiltins;->logger:Lfreemarker/log/Logger;

    .line 95
    sget-object v0, Lfreemarker/core/_RegexBuiltins;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v0}, Lfreemarker/log/Logger;->isWarnEnabled()Z

    move-result v0

    sput-boolean v0, Lfreemarker/core/_RegexBuiltins;->flagWarningsEnabled:Z

    .line 97
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfreemarker/core/_RegexBuiltins;->flagWarningsCntSync:Ljava/lang/Object;

    .line 100
    new-instance v0, Lfreemarker/cache/MruCacheStorage;

    const/16 v1, 0x32

    const/16 v2, 0x96

    invoke-direct {v0, v1, v2}, Lfreemarker/cache/MruCacheStorage;-><init>(II)V

    sput-object v0, Lfreemarker/core/_RegexBuiltins;->patternCache:Lfreemarker/cache/MruCacheStorage;

    .line 103
    const/4 v0, 0x2

    invoke-static {v0}, Lfreemarker/core/_RegexBuiltins;->intFlagToLong(I)J

    move-result-wide v0

    sput-wide v0, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_CASE_INSENSITIVE:J

    .line 104
    const/16 v0, 0x8

    invoke-static {v0}, Lfreemarker/core/_RegexBuiltins;->intFlagToLong(I)J

    move-result-wide v0

    sput-wide v0, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_MULTILINE:J

    .line 105
    const/4 v0, 0x4

    invoke-static {v0}, Lfreemarker/core/_RegexBuiltins;->intFlagToLong(I)J

    move-result-wide v0

    sput-wide v0, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_COMMENTS:J

    .line 106
    const/16 v0, 0x20

    invoke-static {v0}, Lfreemarker/core/_RegexBuiltins;->intFlagToLong(I)J

    move-result-wide v0

    sput-wide v0, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_DOTALL:J

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static access$000(Ljava/lang/String;)J
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-static {p0}, Lfreemarker/core/_RegexBuiltins;->parseFlagString(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method static access$100(Ljava/lang/String;)V
    .registers 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-static {p0}, Lfreemarker/core/_RegexBuiltins;->logFlagWarning(Ljava/lang/String;)V

    return-void
.end method

.method static access$200(Ljava/lang/String;J)V
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # J

    .prologue
    .line 88
    invoke-static {p0, p1, p2}, Lfreemarker/core/_RegexBuiltins;->checkNonRegexpFlags(Ljava/lang/String;J)V

    return-void
.end method

.method static access$300()J
    .registers 2

    .prologue
    .line 88
    sget-wide v0, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_CASE_INSENSITIVE:J

    return-wide v0
.end method

.method private static checkNonRegexpFlags(Ljava/lang/String;J)V
    .registers 7
    .param p0, "biName"    # Ljava/lang/String;
    .param p1, "flags"    # J

    .prologue
    const-wide/16 v2, 0x0

    .line 437
    sget-boolean v0, Lfreemarker/core/_RegexBuiltins;->flagWarningsEnabled:Z

    if-nez v0, :cond_7

    .line 451
    :cond_6
    :goto_6
    return-void

    .line 439
    :cond_7
    sget-wide v0, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_MULTILINE:J

    and-long/2addr v0, p1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_30

    .line 440
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " doesn\'t support the \"m\" flag "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "without the \"r\" flag."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/core/_RegexBuiltins;->logFlagWarning(Ljava/lang/String;)V

    .line 443
    :cond_30
    sget-wide v0, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_DOTALL:J

    and-long/2addr v0, p1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_59

    .line 444
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " doesn\'t support the \"s\" flag "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "without the \"r\" flag."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/core/_RegexBuiltins;->logFlagWarning(Ljava/lang/String;)V

    .line 447
    :cond_59
    sget-wide v0, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_COMMENTS:J

    and-long/2addr v0, p1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_6

    .line 448
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, " doesn\'t support the \"c\" flag "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "without the \"r\" flag."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/core/_RegexBuiltins;->logFlagWarning(Ljava/lang/String;)V

    goto :goto_6
.end method

.method static getPattern(Ljava/lang/String;I)Ljava/util/regex/Pattern;
    .registers 10
    .param p0, "patternString"    # Ljava/lang/String;
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 118
    new-instance v1, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;

    invoke-direct {v1, p0, p1}, Lfreemarker/core/_RegexBuiltins$PatternCacheKey;-><init>(Ljava/lang/String;I)V

    .line 122
    .local v1, "patternKey":Lfreemarker/core/_RegexBuiltins$PatternCacheKey;
    sget-object v5, Lfreemarker/core/_RegexBuiltins;->patternCache:Lfreemarker/cache/MruCacheStorage;

    monitor-enter v5

    .line 123
    :try_start_8
    sget-object v4, Lfreemarker/core/_RegexBuiltins;->patternCache:Lfreemarker/cache/MruCacheStorage;

    invoke-virtual {v4, v1}, Lfreemarker/cache/MruCacheStorage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/regex/Pattern;

    .line 124
    .local v2, "result":Ljava/util/regex/Pattern;
    monitor-exit v5

    .line 125
    if-eqz v2, :cond_18

    move-object v3, v2

    .line 138
    .end local v2    # "result":Ljava/util/regex/Pattern;
    .local v3, "result":Ljava/util/regex/Pattern;
    :goto_14
    return-object v3

    .line 124
    .end local v3    # "result":Ljava/util/regex/Pattern;
    :catchall_15
    move-exception v4

    monitor-exit v5
    :try_end_17
    .catchall {:try_start_8 .. :try_end_17} :catchall_15

    throw v4

    .line 130
    .restart local v2    # "result":Ljava/util/regex/Pattern;
    :cond_18
    :try_start_18
    invoke-static {p0, p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;
    :try_end_1b
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_18 .. :try_end_1b} :catch_27

    move-result-object v2

    .line 135
    sget-object v5, Lfreemarker/core/_RegexBuiltins;->patternCache:Lfreemarker/cache/MruCacheStorage;

    monitor-enter v5

    .line 136
    :try_start_1f
    sget-object v4, Lfreemarker/core/_RegexBuiltins;->patternCache:Lfreemarker/cache/MruCacheStorage;

    invoke-virtual {v4, v1, v2}, Lfreemarker/cache/MruCacheStorage;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    monitor-exit v5
    :try_end_25
    .catchall {:try_start_1f .. :try_end_25} :catchall_3e

    move-object v3, v2

    .line 138
    .end local v2    # "result":Ljava/util/regex/Pattern;
    .restart local v3    # "result":Ljava/util/regex/Pattern;
    goto :goto_14

    .line 131
    .end local v3    # "result":Ljava/util/regex/Pattern;
    .restart local v2    # "result":Ljava/util/regex/Pattern;
    :catch_27
    move-exception v0

    .line 132
    .local v0, "e":Ljava/util/regex/PatternSyntaxException;
    new-instance v4, Lfreemarker/core/_TemplateModelException;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "Malformed regular expression: "

    aput-object v7, v5, v6

    const/4 v6, 0x1

    new-instance v7, Lfreemarker/core/_DelayedGetMessage;

    invoke-direct {v7, v0}, Lfreemarker/core/_DelayedGetMessage;-><init>(Ljava/lang/Throwable;)V

    aput-object v7, v5, v6

    invoke-direct {v4, v0, v5}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v4

    .line 137
    .end local v0    # "e":Ljava/util/regex/PatternSyntaxException;
    :catchall_3e
    move-exception v4

    :try_start_3f
    monitor-exit v5
    :try_end_40
    .catchall {:try_start_3f .. :try_end_40} :catchall_3e

    throw v4
.end method

.method private static intFlagToLong(I)J
    .registers 5
    .param p0, "flag"    # I

    .prologue
    .line 113
    int-to-long v0, p0

    const-wide/32 v2, 0xffff

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private static logFlagWarning(Ljava/lang/String;)V
    .registers 5
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x19

    .line 207
    sget-boolean v1, Lfreemarker/core/_RegexBuiltins;->flagWarningsEnabled:Z

    if-nez v1, :cond_7

    .line 224
    :goto_6
    return-void

    .line 210
    :cond_7
    sget-object v2, Lfreemarker/core/_RegexBuiltins;->flagWarningsCntSync:Ljava/lang/Object;

    monitor-enter v2

    .line 211
    :try_start_a
    sget v0, Lfreemarker/core/_RegexBuiltins;->flagWarningsCnt:I

    .line 212
    .local v0, "cnt":I
    if-ge v0, v3, :cond_45

    .line 213
    sget v1, Lfreemarker/core/_RegexBuiltins;->flagWarningsCnt:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lfreemarker/core/_RegexBuiltins;->flagWarningsCnt:I

    .line 218
    monitor-exit v2
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_4a

    .line 219
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " This will be an error in FreeMarker 2.4!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 220
    add-int/lit8 v1, v0, 0x1

    if-ne v1, v3, :cond_3f

    .line 221
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " [Will not log more regular expression flag problems until restart!]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 223
    :cond_3f
    sget-object v1, Lfreemarker/core/_RegexBuiltins;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v1, p0}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;)V

    goto :goto_6

    .line 215
    :cond_45
    const/4 v1, 0x0

    :try_start_46
    sput-boolean v1, Lfreemarker/core/_RegexBuiltins;->flagWarningsEnabled:Z

    .line 216
    monitor-exit v2

    goto :goto_6

    .line 218
    .end local v0    # "cnt":I
    :catchall_4a
    move-exception v1

    monitor-exit v2
    :try_end_4c
    .catchall {:try_start_46 .. :try_end_4c} :catchall_4a

    throw v1
.end method

.method private static parseFlagString(Ljava/lang/String;)J
    .registers 7
    .param p0, "flagString"    # Ljava/lang/String;

    .prologue
    .line 169
    const-wide/16 v1, 0x0

    .line 170
    .local v1, "flags":J
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_59

    .line 171
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 172
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_5a

    .line 192
    sget-boolean v4, Lfreemarker/core/_RegexBuiltins;->flagWarningsEnabled:Z

    if-eqz v4, :cond_38

    .line 193
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unrecognized regular expression flag: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/core/_RegexBuiltins;->logFlagWarning(Ljava/lang/String;)V

    .line 170
    :cond_38
    :goto_38
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 174
    :sswitch_3b
    sget-wide v4, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_CASE_INSENSITIVE:J

    or-long/2addr v1, v4

    .line 175
    goto :goto_38

    .line 177
    :sswitch_3f
    sget-wide v4, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_MULTILINE:J

    or-long/2addr v1, v4

    .line 178
    goto :goto_38

    .line 180
    :sswitch_43
    sget-wide v4, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_COMMENTS:J

    or-long/2addr v1, v4

    .line 181
    goto :goto_38

    .line 183
    :sswitch_47
    sget-wide v4, Lfreemarker/core/_RegexBuiltins;->RE_FLAG_DOTALL:J

    or-long/2addr v1, v4

    .line 184
    goto :goto_38

    .line 186
    :sswitch_4b
    const-wide v4, 0x100000000L

    or-long/2addr v1, v4

    .line 187
    goto :goto_38

    .line 189
    :sswitch_52
    const-wide v4, 0x200000000L

    or-long/2addr v1, v4

    .line 190
    goto :goto_38

    .line 199
    .end local v0    # "c":C
    :cond_59
    return-wide v1

    .line 172
    :sswitch_data_5a
    .sparse-switch
        0x63 -> :sswitch_43
        0x66 -> :sswitch_52
        0x69 -> :sswitch_3b
        0x6d -> :sswitch_3f
        0x72 -> :sswitch_4b
        0x73 -> :sswitch_47
    .end sparse-switch
.end method
