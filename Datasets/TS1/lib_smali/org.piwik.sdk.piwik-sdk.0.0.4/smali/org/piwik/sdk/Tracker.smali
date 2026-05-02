.class public Lorg/piwik/sdk/Tracker;
.super Ljava/lang/Object;
.source "Tracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/piwik/sdk/Tracker$ExtraIdentifier;
    }
.end annotation


# static fields
.field private static final DEFAULT_API_VERSION_VALUE:Ljava/lang/String; = "1"

.field private static final DEFAULT_RECORD_VALUE:Ljava/lang/String; = "1"

.field private static final DEFAULT_TRUE_VALUE:Ljava/lang/String; = "1"

.field private static final DEFAULT_UNKNOWN_VALUE:Ljava/lang/String; = "unknown"

.field protected static final LOGGER_TAG:Ljava/lang/String; = "PIWIK:Tracker"

.field private static final PATTERN_VISITOR_ID:Ljava/util/regex/Pattern;

.field protected static final PREF_KEY_TRACKER_FIRSTVISIT:Ljava/lang/String; = "tracker.firstvisit"

.field protected static final PREF_KEY_TRACKER_PREVIOUSVISIT:Ljava/lang/String; = "tracker.previousvisit"

.field protected static final PREF_KEY_TRACKER_USERID:Ljava/lang/String; = "tracker.userid"

.field protected static final PREF_KEY_TRACKER_VISITCOUNT:Ljava/lang/String; = "tracker.visitcount"


# instance fields
.field private final mApiUrl:Ljava/net/URL;

.field private mApplicationDomain:Ljava/lang/String;

.field private final mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

.field private final mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

.field private mLastEvent:Ljava/lang/String;

.field private final mPiwik:Lorg/piwik/sdk/Piwik;

.field private final mRandomAntiCachingValue:Ljava/util/Random;

.field private final mSessionLock:Ljava/lang/Object;

.field private mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

.field private mSessionStartTime:J

.field private mSessionTimeout:J

.field private final mSiteId:I

.field private final mVisitCustomVariable:Lorg/piwik/sdk/CustomVariables;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 262
    const-string v0, "^[0-9a-f]{16}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/piwik/sdk/Tracker;->PATTERN_VISITOR_ID:Ljava/util/regex/Pattern;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;ILjava/lang/String;Lorg/piwik/sdk/Piwik;)V
    .registers 13
    .param p1, "url"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "siteId"    # I
    .param p3, "authToken"    # Ljava/lang/String;
    .param p4, "piwik"    # Lorg/piwik/sdk/Piwik;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const-wide/32 v0, 0x1b7740

    iput-wide v0, p0, Lorg/piwik/sdk/Tracker;->mSessionTimeout:J

    .line 71
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    .line 73
    new-instance v0, Lorg/piwik/sdk/CustomVariables;

    invoke-direct {v0}, Lorg/piwik/sdk/CustomVariables;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/Tracker;->mVisitCustomVariable:Lorg/piwik/sdk/CustomVariables;

    .line 75
    new-instance v0, Ljava/util/Random;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Random;-><init>(J)V

    iput-object v0, p0, Lorg/piwik/sdk/Tracker;->mRandomAntiCachingValue:Ljava/util/Random;

    .line 77
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    .line 712
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lorg/piwik/sdk/Tracker;->mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

    .line 89
    move-object v0, p1

    .line 90
    .local v0, "checkUrl":Ljava/lang/String;
    const-string v2, "piwik.php"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_79

    const-string v2, "piwik-proxy.php"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_47

    goto :goto_79

    .line 93
    :cond_47
    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_60

    .line 94
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 96
    :cond_60
    new-instance v2, Ljava/net/URL;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "piwik.php"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    goto :goto_80

    .line 91
    :cond_79
    :goto_79
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    .line 98
    :goto_80
    iput-object p4, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    .line 99
    iput p2, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    .line 101
    new-instance v2, Lorg/piwik/sdk/dispatcher/Dispatcher;

    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    invoke-direct {v2, v3, v4, p3}, Lorg/piwik/sdk/dispatcher/Dispatcher;-><init>(Lorg/piwik/sdk/Piwik;Ljava/net/URL;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    .line 103
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "tracker.userid"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 104
    .local v2, "userId":Ljava/lang/String;
    if-nez v2, :cond_b5

    .line 105
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    .line 106
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "tracker.userid"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 108
    :cond_b5
    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v4, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v3, v4, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 110
    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v4, Lorg/piwik/sdk/QueryParams;->SESSION_START:Lorg/piwik/sdk/QueryParams;

    const-string v5, "1"

    invoke-virtual {v3, v4, v5}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 112
    const-string v3, "unknown"

    .line 113
    .local v3, "resolution":Ljava/lang/String;
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v4}, Lorg/piwik/sdk/Piwik;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lorg/piwik/sdk/tools/DeviceHelper;->getResolution(Landroid/content/Context;)[I

    move-result-object v4

    .line 114
    .local v4, "res":[I
    if-eqz v4, :cond_ed

    .line 115
    const-string v5, "%sx%s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aget v7, v4, v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    const/4 v1, 0x1

    aget v7, v4, v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 116
    :cond_ed
    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v1, v5, v3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 118
    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->USER_AGENT:Lorg/piwik/sdk/QueryParams;

    invoke-static {}, Lorg/piwik/sdk/tools/DeviceHelper;->getUserAgent()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 119
    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->LANGUAGE:Lorg/piwik/sdk/QueryParams;

    invoke-static {}, Lorg/piwik/sdk/tools/DeviceHelper;->getUserLanguage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 120
    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->COUNTRY:Lorg/piwik/sdk/QueryParams;

    invoke-static {}, Lorg/piwik/sdk/tools/DeviceHelper;->getUserCountry()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 121
    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    invoke-static {}, Lorg/piwik/sdk/Tracker;->makeRandomVisitorId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 122
    return-void
.end method

.method private confirmVisitorIdFormat(Ljava/lang/String;)Z
    .registers 6
    .param p1, "visitorId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 265
    sget-object v0, Lorg/piwik/sdk/Tracker;->PATTERN_VISITOR_ID:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 266
    .local v0, "visitorIdMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 267
    const/4 v1, 0x1

    return v1

    .line 269
    :cond_e
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "VisitorId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " is not of valid format, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " the format must match the regular expression: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lorg/piwik/sdk/Tracker;->PATTERN_VISITOR_ID:Ljava/util/regex/Pattern;

    .line 270
    invoke-virtual {v3}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private injectBaseParams(Lorg/piwik/sdk/TrackMe;)V
    .registers 5
    .param p1, "trackMe"    # Lorg/piwik/sdk/TrackMe;

    .line 687
    sget-object v0, Lorg/piwik/sdk/QueryParams;->SITE_ID:Lorg/piwik/sdk/QueryParams;

    iget v1, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    .line 688
    sget-object v0, Lorg/piwik/sdk/QueryParams;->RECORD:Lorg/piwik/sdk/QueryParams;

    const-string v1, "1"

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 689
    sget-object v0, Lorg/piwik/sdk/QueryParams;->API_VERSION:Lorg/piwik/sdk/QueryParams;

    const-string v1, "1"

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 690
    sget-object v0, Lorg/piwik/sdk/QueryParams;->RANDOM_NUMBER:Lorg/piwik/sdk/QueryParams;

    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mRandomAntiCachingValue:Ljava/util/Random;

    const v2, 0x186a0

    invoke-virtual {v1, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    .line 691
    sget-object v0, Lorg/piwik/sdk/QueryParams;->DATETIME_OF_REQUEST:Lorg/piwik/sdk/QueryParams;

    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd HH:mm:ssZ"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 692
    sget-object v0, Lorg/piwik/sdk/QueryParams;->SEND_IMAGE:Lorg/piwik/sdk/QueryParams;

    const-string v1, "0"

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 694
    sget-object v0, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v2, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v1, v2}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 695
    sget-object v0, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v2, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v1, v2}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 697
    sget-object v0, Lorg/piwik/sdk/QueryParams;->VISIT_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mVisitCustomVariable:Lorg/piwik/sdk/CustomVariables;

    invoke-virtual {v1}, Lorg/piwik/sdk/CustomVariables;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 699
    sget-object v0, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1, v0}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v0

    .line 700
    .local v0, "urlPath":Ljava/lang/String;
    if-nez v0, :cond_82

    .line 701
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getApplicationBaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_d7

    .line 702
    :cond_82
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9e

    .line 703
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getApplicationBaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_d7

    .line 704
    :cond_9e
    const-string v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d7

    const-string v1, "https://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d7

    const-string v1, "ftp://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b7

    goto :goto_d7

    .line 706
    :cond_b7
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d7

    .line 707
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getApplicationBaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 709
    :cond_d7
    :goto_d7
    sget-object v1, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1, v1, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 710
    return-void
.end method

.method private injectInitialParams(Lorg/piwik/sdk/TrackMe;)V
    .registers 16
    .param p1, "trackMe"    # Lorg/piwik/sdk/TrackMe;

    .line 649
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    monitor-enter v0

    .line 650
    :try_start_5
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "tracker.visitcount"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    .line 651
    .local v1, "visitCount":I
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v3, "tracker.visitcount"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 652
    monitor-exit v0
    :try_end_24
    .catchall {:try_start_5 .. :try_end_24} :catchall_101

    .line 654
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    monitor-enter v2

    .line 655
    :try_start_29
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v3, "tracker.firstvisit"

    const-wide/16 v4, -0x1

    invoke-interface {v0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 656
    .local v6, "firstVisitTime":J
    cmp-long v0, v6, v4

    const-wide/16 v8, 0x3e8

    if-nez v0, :cond_52

    .line 657
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    div-long/2addr v10, v8

    move-wide v6, v10

    .line 658
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v3, "tracker.firstvisit"

    invoke-interface {v0, v3, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 660
    :cond_52
    monitor-exit v2
    :try_end_53
    .catchall {:try_start_29 .. :try_end_53} :catchall_fe

    .line 662
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    monitor-enter v0

    .line 663
    :try_start_58
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "tracker.previousvisit"

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 664
    .local v2, "previousVisit":J
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v10

    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    const-string v11, "tracker.previousvisit"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    div-long/2addr v12, v8

    invoke-interface {v10, v11, v12, v13}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 665
    monitor-exit v0
    :try_end_79
    .catchall {:try_start_58 .. :try_end_79} :catchall_fb

    .line 668
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v8, Lorg/piwik/sdk/QueryParams;->FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v8, v6, v7}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;J)Lorg/piwik/sdk/TrackMe;

    .line 669
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v8, Lorg/piwik/sdk/QueryParams;->TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v8, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    .line 670
    cmp-long v0, v2, v4

    if-eqz v0, :cond_92

    .line 671
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v4, Lorg/piwik/sdk/QueryParams;->PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v4, v2, v3}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;J)Lorg/piwik/sdk/TrackMe;

    .line 673
    :cond_92
    sget-object v0, Lorg/piwik/sdk/QueryParams;->SESSION_START:Lorg/piwik/sdk/QueryParams;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->SESSION_START:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 674
    sget-object v0, Lorg/piwik/sdk/QueryParams;->SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 675
    sget-object v0, Lorg/piwik/sdk/QueryParams;->USER_AGENT:Lorg/piwik/sdk/QueryParams;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->USER_AGENT:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 676
    sget-object v0, Lorg/piwik/sdk/QueryParams;->LANGUAGE:Lorg/piwik/sdk/QueryParams;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->LANGUAGE:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 677
    sget-object v0, Lorg/piwik/sdk/QueryParams;->COUNTRY:Lorg/piwik/sdk/QueryParams;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->COUNTRY:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 678
    sget-object v0, Lorg/piwik/sdk/QueryParams;->FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 679
    sget-object v0, Lorg/piwik/sdk/QueryParams;->TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 680
    sget-object v0, Lorg/piwik/sdk/QueryParams;->PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v0, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 681
    return-void

    .line 665
    .end local v2    # "previousVisit":J
    :catchall_fb
    move-exception v2

    :try_start_fc
    monitor-exit v0
    :try_end_fd
    .catchall {:try_start_fc .. :try_end_fd} :catchall_fb

    throw v2

    .line 660
    .end local v6    # "firstVisitTime":J
    :catchall_fe
    move-exception v0

    :try_start_ff
    monitor-exit v2
    :try_end_100
    .catchall {:try_start_ff .. :try_end_100} :catchall_fe

    throw v0

    .line 652
    .end local v1    # "visitCount":I
    :catchall_101
    move-exception v1

    :try_start_102
    monitor-exit v0
    :try_end_103
    .catchall {:try_start_102 .. :try_end_103} :catchall_101

    throw v1
.end method

.method public static makeRandomVisitorId()Ljava/lang/String;
    .registers 3

    .line 750
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "-"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected clearLastEvent()V
    .registers 2

    .line 806
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/piwik/sdk/Tracker;->mLastEvent:Ljava/lang/String;

    .line 807
    return-void
.end method

.method public dispatch()Z
    .registers 2

    .line 196
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->isOptOut()Z

    move-result v0

    if-nez v0, :cond_f

    .line 197
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    invoke-virtual {v0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->forceDispatch()Z

    .line 198
    const/4 v0, 0x1

    return v0

    .line 200
    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 779
    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 780
    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_28

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_12

    goto :goto_28

    .line 781
    :cond_12
    move-object v2, p1

    check-cast v2, Lorg/piwik/sdk/Tracker;

    .line 782
    .local v2, "tracker":Lorg/piwik/sdk/Tracker;
    iget v3, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    iget v4, v2, Lorg/piwik/sdk/Tracker;->mSiteId:I

    if-ne v3, v4, :cond_26

    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    iget-object v4, v2, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    invoke-virtual {v3, v4}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    goto :goto_27

    :cond_26
    const/4 v0, 0x0

    :goto_27
    return v0

    .line 780
    .end local v2    # "tracker":Lorg/piwik/sdk/Tracker;
    :cond_28
    :goto_28
    return v1
.end method

.method protected getAPIUrl()Ljava/net/URL;
    .registers 2

    .line 129
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    return-object v0
.end method

.method protected getApplicationBaseURL()Ljava/lang/String;
    .registers 5

    .line 793
    const-string v0, "http://%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getApplicationDomain()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getApplicationDomain()Ljava/lang/String;
    .registers 2

    .line 285
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mApplicationDomain:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mApplicationDomain:Ljava/lang/String;

    goto :goto_d

    :cond_7
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->getApplicationDomain()Ljava/lang/String;

    move-result-object v0

    :goto_d
    return-object v0
.end method

.method public getDefaultTrackMe()Lorg/piwik/sdk/TrackMe;
    .registers 2

    .line 143
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    return-object v0
.end method

.method public getDispatchInterval()J
    .registers 3

    .line 218
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    invoke-virtual {v0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->getDispatchInterval()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDispatchTimeout()I
    .registers 2

    .line 180
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    invoke-virtual {v0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->getConnectionTimeOut()I

    move-result v0

    return v0
.end method

.method protected getDispatcher()Lorg/piwik/sdk/dispatcher/Dispatcher;
    .registers 2

    .line 810
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    return-object v0
.end method

.method protected getLastEvent()Ljava/lang/String;
    .registers 2

    .line 802
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mLastEvent:Ljava/lang/String;

    return-object v0
.end method

.method public getPiwik()Lorg/piwik/sdk/Piwik;
    .registers 2

    .line 125
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    return-object v0
.end method

.method public getSessionTimeout()J
    .registers 3

    .line 173
    iget-wide v0, p0, Lorg/piwik/sdk/Tracker;->mSessionTimeout:J

    return-wide v0
.end method

.method public getSharedPreferences()Landroid/content/SharedPreferences;
    .registers 2

    .line 774
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method protected getSiteId()I
    .registers 2

    .line 133
    iget v0, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .registers 3

    .line 244
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVisitorId()Ljava/lang/String;
    .registers 3

    .line 259
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .line 787
    iget v0, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    .line 788
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 789
    .end local v0    # "result":I
    .local v1, "result":I
    return v1
.end method

.method public setApplicationDomain(Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 2
    .param p1, "domain"    # Ljava/lang/String;

    .line 280
    iput-object p1, p0, Lorg/piwik/sdk/Tracker;->mApplicationDomain:Ljava/lang/String;

    .line 281
    return-object p0
.end method

.method public setDispatchInterval(J)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "dispatchInterval"    # J

    .line 210
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    invoke-virtual {v0, p1, p2}, Lorg/piwik/sdk/dispatcher/Dispatcher;->setDispatchInterval(J)V

    .line 211
    return-object p0
.end method

.method public setDispatchTimeout(I)V
    .registers 3
    .param p1, "timeout"    # I

    .line 187
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    invoke-virtual {v0, p1}, Lorg/piwik/sdk/dispatcher/Dispatcher;->setConnectionTimeOut(I)V

    .line 188
    return-void
.end method

.method public setSessionTimeout(I)V
    .registers 5
    .param p1, "milliseconds"    # I

    .line 153
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 154
    int-to-long v1, p1

    :try_start_4
    iput-wide v1, p0, Lorg/piwik/sdk/Tracker;->mSessionTimeout:J

    .line 155
    monitor-exit v0

    .line 156
    return-void

    .line 155
    :catchall_8
    move-exception v1

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_4 .. :try_end_a} :catchall_8

    throw v1
.end method

.method public setUserId(Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "userId"    # Ljava/lang/String;

    .line 235
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 236
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "tracker.userid"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 237
    return-object p0
.end method

.method public setVisitCustomVariable(ILjava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 769
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mVisitCustomVariable:Lorg/piwik/sdk/CustomVariables;

    invoke-virtual {v0, p1, p2, p3}, Lorg/piwik/sdk/CustomVariables;->put(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    .line 770
    return-object p0
.end method

.method public setVisitorId(Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "visitorId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 253
    invoke-direct {p0, p1}, Lorg/piwik/sdk/Tracker;->confirmVisitorIdFormat(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 254
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 255
    :cond_d
    return-object p0
.end method

.method public startNewSession()V
    .registers 4

    .line 147
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 148
    const-wide/16 v1, 0x0

    :try_start_5
    iput-wide v1, p0, Lorg/piwik/sdk/Tracker;->mSessionStartTime:J

    .line 149
    monitor-exit v0

    .line 150
    return-void

    .line 149
    :catchall_9
    move-exception v1

    monitor-exit v0
    :try_end_b
    .catchall {:try_start_5 .. :try_end_b} :catchall_9

    throw v1
.end method

.method public track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;
    .registers 8
    .param p1, "trackMe"    # Lorg/piwik/sdk/TrackMe;

    .line 716
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 717
    :try_start_3
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->tryNewSession()Z

    move-result v1

    .line 718
    .local v1, "newSession":Z
    const/4 v2, 0x1

    if-eqz v1, :cond_11

    .line 719
    new-instance v3, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v3, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v3, p0, Lorg/piwik/sdk/Tracker;->mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

    .line 720
    :cond_11
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_69

    .line 721
    if-eqz v1, :cond_18

    .line 722
    invoke-direct {p0, p1}, Lorg/piwik/sdk/Tracker;->injectInitialParams(Lorg/piwik/sdk/TrackMe;)V

    goto :goto_2b

    .line 726
    :cond_18
    :try_start_18
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    invoke-virtual {v3}, Lorg/piwik/sdk/dispatcher/Dispatcher;->getConnectionTimeOut()I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v3, v4, v5}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_26
    .catch Ljava/lang/InterruptedException; {:try_start_18 .. :try_end_26} :catch_27

    .line 729
    goto :goto_2b

    .line 727
    :catch_27
    move-exception v0

    .line 728
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 732
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_2b
    invoke-direct {p0, p1}, Lorg/piwik/sdk/Tracker;->injectBaseParams(Lorg/piwik/sdk/TrackMe;)V

    .line 733
    invoke-virtual {p1}, Lorg/piwik/sdk/TrackMe;->build()Ljava/lang/String;

    move-result-object v0

    .line 734
    .local v0, "event":Ljava/lang/String;
    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v3}, Lorg/piwik/sdk/Piwik;->isOptOut()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_4d

    .line 735
    iput-object v0, p0, Lorg/piwik/sdk/Tracker;->mLastEvent:Ljava/lang/String;

    .line 736
    const-string v3, "PIWIK:Tracker"

    const-string v5, "URL omitted due to opt out: %s"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v4

    invoke-static {v5, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_61

    .line 738
    :cond_4d
    const-string v3, "PIWIK:Tracker"

    const-string v5, "URL added to the queue: %s"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v4

    invoke-static {v5, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/dispatcher/Dispatcher;

    invoke-virtual {v2, v0}, Lorg/piwik/sdk/dispatcher/Dispatcher;->submit(Ljava/lang/String;)V

    .line 743
    :goto_61
    if-eqz v1, :cond_68

    .line 744
    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 746
    :cond_68
    return-object p0

    .line 720
    .end local v0    # "event":Ljava/lang/String;
    .end local v1    # "newSession":Z
    :catchall_69
    move-exception v1

    :try_start_6a
    monitor-exit v0
    :try_end_6b
    .catchall {:try_start_6a .. :try_end_6b} :catchall_69

    throw v1
.end method

.method public trackAppDownload()Lorg/piwik/sdk/Tracker;
    .registers 3

    .line 427
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->INSTALLER_PACKAGENAME:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    invoke-virtual {p0, v0, v1}, Lorg/piwik/sdk/Tracker;->trackAppDownload(Landroid/content/Context;Lorg/piwik/sdk/Tracker$ExtraIdentifier;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackAppDownload(Landroid/content/Context;Lorg/piwik/sdk/Tracker$ExtraIdentifier;)Lorg/piwik/sdk/Tracker;
    .registers 7
    .param p1, "app"    # Landroid/content/Context;
    .param p2, "extra"    # Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    .line 439
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 440
    .local v0, "pkgInfo":Landroid/content/pm/PackageInfo;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "downloaded:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 441
    .local v1, "firedKey":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_47

    .line 442
    invoke-virtual {p0, p1, p2}, Lorg/piwik/sdk/Tracker;->trackNewAppDownload(Landroid/content/Context;Lorg/piwik/sdk/Tracker$ExtraIdentifier;)Lorg/piwik/sdk/Tracker;

    .line 443
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v1, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_47
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_47} :catch_48

    .line 447
    .end local v0    # "pkgInfo":Landroid/content/pm/PackageInfo;
    .end local v1    # "firedKey":Ljava/lang/String;
    :cond_47
    goto :goto_4c

    .line 445
    :catch_48
    move-exception v0

    .line 446
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 448
    .end local v0    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :goto_4c
    return-object p0
.end method

.method public trackContentImpression(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 6
    .param p1, "contentName"    # Ljava/lang/String;
    .param p2, "contentPiece"    # Ljava/lang/String;
    .param p3, "contentTarget"    # Ljava/lang/String;

    .line 520
    if-eqz p1, :cond_26

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_a

    goto :goto_26

    .line 522
    :cond_a
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_NAME:Lorg/piwik/sdk/QueryParams;

    .line 523
    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_PIECE:Lorg/piwik/sdk/QueryParams;

    .line 524
    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_TARGET:Lorg/piwik/sdk/QueryParams;

    .line 525
    invoke-virtual {v0, v1, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 522
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0

    .line 521
    :cond_26
    :goto_26
    return-object p0
.end method

.method public trackContentInteraction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 7
    .param p1, "interaction"    # Ljava/lang/String;
    .param p2, "contentName"    # Ljava/lang/String;
    .param p3, "contentPiece"    # Ljava/lang/String;
    .param p4, "contentTarget"    # Ljava/lang/String;

    .line 537
    if-eqz p2, :cond_34

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_34

    if-eqz p1, :cond_34

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v1, :cond_12

    goto :goto_34

    .line 539
    :cond_12
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_NAME:Lorg/piwik/sdk/QueryParams;

    .line 540
    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_PIECE:Lorg/piwik/sdk/QueryParams;

    .line 541
    invoke-virtual {v0, v1, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_TARGET:Lorg/piwik/sdk/QueryParams;

    .line 542
    invoke-virtual {v0, v1, p4}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_INTERACTION:Lorg/piwik/sdk/QueryParams;

    .line 543
    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 539
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0

    .line 538
    :cond_34
    :goto_34
    return-object p0
.end method

.method public trackEcommerceCartUpdate(ILorg/piwik/sdk/ecommerce/EcommerceItems;)V
    .registers 6
    .param p1, "grandTotal"    # I
    .param p2, "items"    # Lorg/piwik/sdk/ecommerce/EcommerceItems;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 554
    if-nez p2, :cond_8

    .line 555
    new-instance v0, Lorg/piwik/sdk/ecommerce/EcommerceItems;

    invoke-direct {v0}, Lorg/piwik/sdk/ecommerce/EcommerceItems;-><init>()V

    move-object p2, v0

    .line 558
    :cond_8
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    const/4 v2, 0x0

    .line 559
    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->REVENUE:Lorg/piwik/sdk/QueryParams;

    .line 560
    invoke-static {p1}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->ECOMMERCE_ITEMS:Lorg/piwik/sdk/QueryParams;

    .line 561
    invoke-virtual {p2}, Lorg/piwik/sdk/ecommerce/EcommerceItems;->toJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 558
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    .line 562
    return-void
.end method

.method public trackEcommerceOrder(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Lorg/piwik/sdk/ecommerce/EcommerceItems;)V
    .registers 11
    .param p1, "orderId"    # Ljava/lang/String;
    .param p2, "grandTotal"    # Ljava/lang/Integer;
    .param p3, "subTotal"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "tax"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "shipping"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "discount"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p7, "items"    # Lorg/piwik/sdk/ecommerce/EcommerceItems;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 578
    if-nez p7, :cond_8

    .line 579
    new-instance v0, Lorg/piwik/sdk/ecommerce/EcommerceItems;

    invoke-direct {v0}, Lorg/piwik/sdk/ecommerce/EcommerceItems;-><init>()V

    move-object p7, v0

    .line 582
    :cond_8
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    const/4 v2, 0x0

    .line 583
    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->ORDER_ID:Lorg/piwik/sdk/QueryParams;

    .line 584
    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->REVENUE:Lorg/piwik/sdk/QueryParams;

    .line 585
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->ECOMMERCE_ITEMS:Lorg/piwik/sdk/QueryParams;

    .line 586
    invoke-virtual {p7}, Lorg/piwik/sdk/ecommerce/EcommerceItems;->toJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 588
    .local v0, "trackMe":Lorg/piwik/sdk/TrackMe;
    if-eqz p3, :cond_41

    .line 589
    sget-object v1, Lorg/piwik/sdk/QueryParams;->SUBTOTAL:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 592
    :cond_41
    if-eqz p4, :cond_50

    .line 593
    sget-object v1, Lorg/piwik/sdk/QueryParams;->TAX:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 596
    :cond_50
    if-eqz p5, :cond_5f

    .line 597
    sget-object v1, Lorg/piwik/sdk/QueryParams;->SHIPPING:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 600
    :cond_5f
    if-eqz p6, :cond_6e

    .line 601
    sget-object v1, Lorg/piwik/sdk/QueryParams;->DISCOUNT:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p6}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 603
    :cond_6e
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    .line 604
    return-void
.end method

.method public trackEvent(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;

    .line 335
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    .line 336
    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    .line 337
    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 335
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 6
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "label"    # Ljava/lang/String;

    .line 341
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    .line 342
    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    .line 343
    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_NAME:Lorg/piwik/sdk/QueryParams;

    .line 344
    invoke-virtual {v0, v1, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 341
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;F)Lorg/piwik/sdk/Tracker;
    .registers 7
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "label"    # Ljava/lang/String;
    .param p4, "value"    # F

    .line 364
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    .line 365
    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    .line 366
    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_NAME:Lorg/piwik/sdk/QueryParams;

    .line 367
    invoke-virtual {v0, v1, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_VALUE:Lorg/piwik/sdk/QueryParams;

    .line 368
    invoke-virtual {v0, v1, p4}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;F)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 364
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackException(Ljava/lang/Throwable;Ljava/lang/String;Z)V
    .registers 9
    .param p1, "ex"    # Ljava/lang/Throwable;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "isFatal"    # Z

    .line 624
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 625
    .local v0, "trace":Ljava/lang/StackTraceElement;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_31

    .line 625
    .end local v0    # "trace":Ljava/lang/StackTraceElement;
    move-object v0, v1

    .line 629
    .local v0, "className":Ljava/lang/String;
    goto :goto_41

    .line 626
    .end local v0    # "className":Ljava/lang/String;
    :catch_31
    move-exception v0

    .line 627
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "PIWIK:Tracker"

    const-string v2, "Couldn\'t get stack info"

    invoke-static {v1, v2, v0}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 628
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 630
    .local v0, "className":Ljava/lang/String;
    :goto_41
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exception/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_50

    const-string v2, "fatal/"

    goto :goto_52

    :cond_50
    const-string v2, ""

    :goto_52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 631
    .local v1, "actionName":Ljava/lang/String;
    new-instance v2, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v2}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v3, Lorg/piwik/sdk/QueryParams;->ACTION_NAME:Lorg/piwik/sdk/QueryParams;

    .line 632
    invoke-virtual {v2, v3, v1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v2

    sget-object v3, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    const-string v4, "Exception"

    .line 633
    invoke-virtual {v2, v3, v4}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v2

    sget-object v3, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    .line 634
    invoke-virtual {v2, v3, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v2

    sget-object v3, Lorg/piwik/sdk/QueryParams;->EVENT_NAME:Lorg/piwik/sdk/QueryParams;

    .line 635
    invoke-virtual {v2, v3, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v2

    sget-object v3, Lorg/piwik/sdk/QueryParams;->EVENT_VALUE:Lorg/piwik/sdk/QueryParams;

    .line 636
    invoke-virtual {v2, v3, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v2

    .line 631
    invoke-virtual {p0, v2}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    .line 637
    return-void
.end method

.method public trackGoal(I)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "idGoal"    # I

    .line 383
    if-gez p1, :cond_3

    .line 384
    return-object p0

    .line 385
    :cond_3
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackGoal(IF)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "idGoal"    # I
    .param p2, "revenue"    # F

    .line 395
    if-gez p1, :cond_3

    .line 396
    return-object p0

    .line 397
    :cond_3
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    .line 398
    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->REVENUE:Lorg/piwik/sdk/QueryParams;

    .line 399
    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;F)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 397
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackNewAppDownload(Landroid/content/Context;Lorg/piwik/sdk/Tracker$ExtraIdentifier;)Lorg/piwik/sdk/Tracker;
    .registers 12
    .param p1, "app"    # Landroid/content/Context;
    .param p2, "extra"    # Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    .line 469
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 471
    .local v0, "installationIdentifier":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 472
    .local v1, "pkg":Ljava/lang/String;
    const-string v2, "http://"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 475
    .local v2, "packMan":Landroid/content/pm/PackageManager;
    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    .line 476
    .local v4, "pkgInfo":Landroid/content/pm/PackageInfo;
    const-string v5, ":"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 480
    invoke-virtual {v2, v1}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 481
    .local v5, "installerPackageName":Ljava/lang/String;
    if-eqz v5, :cond_32

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0xc8

    if-le v6, v7, :cond_35

    .line 482
    :cond_32
    const-string v6, "unknown"

    move-object v5, v6

    .line 484
    :cond_35
    const-string v6, "unknown"

    .line 485
    .local v6, "extraIdentifier":Ljava/lang/String;
    sget-object v7, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->APK_CHECKSUM:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    if-ne p2, v7, :cond_55

    .line 486
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    .line 487
    .local v3, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v7, v3, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;
    :try_end_41
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_41} :catch_9c

    if-eqz v7, :cond_54

    .line 489
    :try_start_43
    new-instance v7, Ljava/io/File;

    iget-object v8, v3, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v7}, Lorg/piwik/sdk/tools/Checksum;->getMD5Checksum(Ljava/io/File;)Ljava/lang/String;

    move-result-object v7
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_4e} :catch_50
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_43 .. :try_end_4e} :catch_9c

    move-object v6, v7

    .line 492
    goto :goto_54

    .line 490
    :catch_50
    move-exception v7

    .line 491
    .local v7, "e":Ljava/lang/Exception;
    :try_start_51
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 494
    .end local v3    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_54
    :goto_54
    goto :goto_5a

    :cond_55
    sget-object v3, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->INSTALLER_PACKAGENAME:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    if-ne p2, v3, :cond_5a

    .line 495
    move-object v6, v5

    .line 497
    :cond_5a
    :goto_5a
    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    new-instance v3, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v3}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v7, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    const-string v8, "Application"

    .line 500
    invoke-virtual {v3, v7, v8}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v3

    sget-object v7, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    const-string v8, "downloaded"

    .line 501
    invoke-virtual {v3, v7, v8}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v3

    sget-object v7, Lorg/piwik/sdk/QueryParams;->ACTION_NAME:Lorg/piwik/sdk/QueryParams;

    const-string v8, "application/downloaded"

    .line 502
    invoke-virtual {v3, v7, v8}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v3

    sget-object v7, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    const-string v8, "/application/downloaded"

    .line 503
    invoke-virtual {v3, v7, v8}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v3

    sget-object v7, Lorg/piwik/sdk/QueryParams;->DOWNLOAD:Lorg/piwik/sdk/QueryParams;

    .line 504
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v3

    sget-object v7, Lorg/piwik/sdk/QueryParams;->REFERRER:Lorg/piwik/sdk/QueryParams;

    .line 505
    invoke-virtual {v3, v7, v5}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v3

    .line 499
    invoke-virtual {p0, v3}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v3
    :try_end_9b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_51 .. :try_end_9b} :catch_9c

    return-object v3

    .line 506
    .end local v1    # "pkg":Ljava/lang/String;
    .end local v2    # "packMan":Landroid/content/pm/PackageManager;
    .end local v4    # "pkgInfo":Landroid/content/pm/PackageInfo;
    .end local v5    # "installerPackageName":Ljava/lang/String;
    .end local v6    # "extraIdentifier":Ljava/lang/String;
    :catch_9c
    move-exception v1

    .line 507
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 508
    return-object p0
.end method

.method public trackOutlink(Ljava/net/URL;)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "url"    # Ljava/net/URL;

    .line 409
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ftp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    goto :goto_26

    .line 414
    :cond_25
    return-object p0

    .line 410
    :cond_26
    :goto_26
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->LINK:Lorg/piwik/sdk/QueryParams;

    .line 411
    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    .line 412
    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 410
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackScreenView(Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    .line 294
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/Tracker;->trackScreenView(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackScreenView(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    .line 314
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    invoke-virtual {p0, v0, p1, p2}, Lorg/piwik/sdk/Tracker;->trackScreenView(Lorg/piwik/sdk/TrackMe;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackScreenView(Lorg/piwik/sdk/TrackMe;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "trackMe"    # Lorg/piwik/sdk/TrackMe;
    .param p2, "path"    # Ljava/lang/String;

    .line 303
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/piwik/sdk/Tracker;->trackScreenView(Lorg/piwik/sdk/TrackMe;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackScreenView(Lorg/piwik/sdk/TrackMe;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "trackMe"    # Lorg/piwik/sdk/TrackMe;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;

    .line 326
    if-nez p2, :cond_3

    .line 327
    return-object p0

    .line 328
    :cond_3
    sget-object v0, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1, v0, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 329
    sget-object v0, Lorg/piwik/sdk/QueryParams;->ACTION_NAME:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1, v0, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 330
    invoke-virtual {p0, p1}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method protected tryNewSession()Z
    .registers 8

    .line 159
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 160
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lorg/piwik/sdk/Tracker;->mSessionStartTime:J

    const/4 v5, 0x0

    sub-long v5, v1, v3

    iget-wide v1, p0, Lorg/piwik/sdk/Tracker;->mSessionTimeout:J

    cmp-long v3, v5, v1

    if-lez v3, :cond_14

    const/4 v1, 0x1

    goto :goto_15

    :cond_14
    const/4 v1, 0x0

    .line 162
    .local v1, "expired":Z
    :goto_15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/piwik/sdk/Tracker;->mSessionStartTime:J

    .line 163
    monitor-exit v0

    return v1

    .line 164
    .end local v1    # "expired":Z
    :catchall_1d
    move-exception v1

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v1
.end method
