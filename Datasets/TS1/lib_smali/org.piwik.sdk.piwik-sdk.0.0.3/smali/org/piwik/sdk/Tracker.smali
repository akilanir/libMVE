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

.field private final mDispatcher:Lorg/piwik/sdk/Dispatcher;

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

    .prologue
    .line 248
    const-string v0, "^[0-9a-f]{16}$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/piwik/sdk/Tracker;->PATTERN_VISITOR_ID:Ljava/util/regex/Pattern;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;ILjava/lang/String;Lorg/piwik/sdk/Piwik;)V
    .registers 14
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

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const-wide/32 v4, 0x1b7740

    iput-wide v4, p0, Lorg/piwik/sdk/Tracker;->mSessionTimeout:J

    .line 70
    new-instance v4, Ljava/lang/Object;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v4, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    .line 72
    new-instance v4, Lorg/piwik/sdk/CustomVariables;

    invoke-direct {v4}, Lorg/piwik/sdk/CustomVariables;-><init>()V

    iput-object v4, p0, Lorg/piwik/sdk/Tracker;->mVisitCustomVariable:Lorg/piwik/sdk/CustomVariables;

    .line 74
    new-instance v4, Ljava/util/Random;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-direct {v4, v5, v6}, Ljava/util/Random;-><init>(J)V

    iput-object v4, p0, Lorg/piwik/sdk/Tracker;->mRandomAntiCachingValue:Ljava/util/Random;

    .line 76
    new-instance v4, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v4}, Lorg/piwik/sdk/TrackMe;-><init>()V

    iput-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    .line 698
    new-instance v4, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v4, v7}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v4, p0, Lorg/piwik/sdk/Tracker;->mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

    .line 88
    move-object v0, p1

    .line 89
    .local v0, "checkUrl":Ljava/lang/String;
    const-string v4, "piwik.php"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_47

    const-string v4, "piwik-proxy.php"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_ee

    .line 90
    :cond_47
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    .line 97
    :goto_4e
    iput-object p4, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    .line 98
    iput p2, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    .line 100
    new-instance v4, Lorg/piwik/sdk/Dispatcher;

    iget-object v5, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    invoke-direct {v4, v5, v6, p3}, Lorg/piwik/sdk/Dispatcher;-><init>(Lorg/piwik/sdk/Piwik;Ljava/net/URL;Ljava/lang/String;)V

    iput-object v4, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/Dispatcher;

    .line 102
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "tracker.userid"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 103
    .local v3, "userId":Ljava/lang/String;
    if-nez v3, :cond_83

    .line 104
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    .line 105
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "tracker.userid"

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 107
    :cond_83
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5, v3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 109
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->SESSION_START:Lorg/piwik/sdk/QueryParams;

    const-string v6, "1"

    invoke-virtual {v4, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 111
    const-string v2, "unknown"

    .line 112
    .local v2, "resolution":Ljava/lang/String;
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v4}, Lorg/piwik/sdk/Piwik;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lorg/piwik/sdk/tools/DeviceHelper;->getResolution(Landroid/content/Context;)[I

    move-result-object v1

    .line 113
    .local v1, "res":[I
    if-eqz v1, :cond_ba

    .line 114
    const-string v4, "%sx%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aget v6, v1, v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    aget v6, v1, v8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 115
    :cond_ba
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v5, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 117
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->USER_AGENT:Lorg/piwik/sdk/QueryParams;

    invoke-static {}, Lorg/piwik/sdk/tools/DeviceHelper;->getUserAgent()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 118
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->LANGUAGE:Lorg/piwik/sdk/QueryParams;

    invoke-static {}, Lorg/piwik/sdk/tools/DeviceHelper;->getUserLanguage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 119
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->COUNTRY:Lorg/piwik/sdk/QueryParams;

    invoke-static {}, Lorg/piwik/sdk/tools/DeviceHelper;->getUserCountry()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 120
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v5, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    invoke-static {}, Lorg/piwik/sdk/Tracker;->makeRandomVisitorId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 121
    return-void

    .line 92
    .end local v1    # "res":[I
    .end local v2    # "resolution":Ljava/lang/String;
    .end local v3    # "userId":Ljava/lang/String;
    :cond_ee
    const-string v4, "/"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_109

    .line 93
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    :cond_109
    new-instance v4, Ljava/net/URL;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "piwik.php"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    goto/16 :goto_4e
.end method

.method private confirmVisitorIdFormat(Ljava/lang/String;)Z
    .registers 6
    .param p1, "visitorId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 251
    sget-object v1, Lorg/piwik/sdk/Tracker;->PATTERN_VISITOR_ID:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 252
    .local v0, "visitorIdMatcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 253
    const/4 v1, 0x1

    return v1

    .line 255
    :cond_e
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "VisitorId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not of valid format, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " the format must match the regular expression: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lorg/piwik/sdk/Tracker;->PATTERN_VISITOR_ID:Ljava/util/regex/Pattern;

    invoke-virtual {v3}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private injectBaseParams(Lorg/piwik/sdk/TrackMe;)V
    .registers 6
    .param p1, "trackMe"    # Lorg/piwik/sdk/TrackMe;

    .prologue
    .line 673
    sget-object v1, Lorg/piwik/sdk/QueryParams;->SITE_ID:Lorg/piwik/sdk/QueryParams;

    iget v2, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    .line 674
    sget-object v1, Lorg/piwik/sdk/QueryParams;->RECORD:Lorg/piwik/sdk/QueryParams;

    const-string v2, "1"

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 675
    sget-object v1, Lorg/piwik/sdk/QueryParams;->API_VERSION:Lorg/piwik/sdk/QueryParams;

    const-string v2, "1"

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 676
    sget-object v1, Lorg/piwik/sdk/QueryParams;->RANDOM_NUMBER:Lorg/piwik/sdk/QueryParams;

    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mRandomAntiCachingValue:Ljava/util/Random;

    const v3, 0x186a0

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    .line 677
    sget-object v1, Lorg/piwik/sdk/QueryParams;->DATETIME_OF_REQUEST:Lorg/piwik/sdk/QueryParams;

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd HH:mm:ssZ"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 678
    sget-object v1, Lorg/piwik/sdk/QueryParams;->SEND_IMAGE:Lorg/piwik/sdk/QueryParams;

    const-string v2, "0"

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 680
    sget-object v1, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v3, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v2, v3}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 681
    sget-object v1, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v3, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v2, v3}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 683
    sget-object v1, Lorg/piwik/sdk/QueryParams;->VISIT_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mVisitCustomVariable:Lorg/piwik/sdk/CustomVariables;

    invoke-virtual {v2}, Lorg/piwik/sdk/CustomVariables;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 685
    sget-object v1, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1, v1}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v0

    .line 686
    .local v0, "urlPath":Ljava/lang/String;
    if-nez v0, :cond_89

    .line 687
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getApplicationBaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 695
    :cond_83
    :goto_83
    sget-object v1, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1, v1, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 696
    return-void

    .line 688
    :cond_89
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a7

    .line 689
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getApplicationBaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_83

    .line 690
    :cond_a7
    const-string v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_83

    const-string v1, "https://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_83

    const-string v1, "ftp://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_83

    .line 692
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_83

    .line 693
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getApplicationBaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_83
.end method

.method private injectInitialParams(Lorg/piwik/sdk/TrackMe;)V
    .registers 16
    .param p1, "trackMe"    # Lorg/piwik/sdk/TrackMe;

    .prologue
    const-wide/16 v12, -0x1

    .line 635
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v6

    monitor-enter v6

    .line 636
    :try_start_7
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v7, "tracker.visitcount"

    const/4 v8, 0x0

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    add-int/lit8 v4, v5, 0x1

    .line 637
    .local v4, "visitCount":I
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v7, "tracker.visitcount"

    invoke-interface {v5, v7, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 638
    monitor-exit v6
    :try_end_26
    .catchall {:try_start_7 .. :try_end_26} :catchall_101

    .line 640
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v6

    monitor-enter v6

    .line 641
    :try_start_2b
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v7, "tracker.firstvisit"

    const-wide/16 v8, -0x1

    invoke-interface {v5, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 642
    .local v0, "firstVisitTime":J
    cmp-long v5, v0, v12

    if-nez v5, :cond_54

    .line 643
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-wide/16 v9, 0x3e8

    div-long v0, v7, v9

    .line 644
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v7, "tracker.firstvisit"

    invoke-interface {v5, v7, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 646
    :cond_54
    monitor-exit v6
    :try_end_55
    .catchall {:try_start_2b .. :try_end_55} :catchall_104

    .line 648
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v6

    monitor-enter v6

    .line 649
    :try_start_5a
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v7, "tracker.previousvisit"

    const-wide/16 v8, -0x1

    invoke-interface {v5, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 650
    .local v2, "previousVisit":J
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v7, "tracker.previousvisit"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    invoke-interface {v5, v7, v8, v9}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 651
    monitor-exit v6
    :try_end_7f
    .catchall {:try_start_5a .. :try_end_7f} :catchall_107

    .line 654
    iget-object v5, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v6, Lorg/piwik/sdk/QueryParams;->FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v5, v6, v0, v1}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;J)Lorg/piwik/sdk/TrackMe;

    .line 655
    iget-object v5, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v6, Lorg/piwik/sdk/QueryParams;->TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v5, v6, v4}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    .line 656
    cmp-long v5, v2, v12

    if-eqz v5, :cond_98

    .line 657
    iget-object v5, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v6, Lorg/piwik/sdk/QueryParams;->PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v5, v6, v2, v3}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;J)Lorg/piwik/sdk/TrackMe;

    .line 659
    :cond_98
    sget-object v5, Lorg/piwik/sdk/QueryParams;->SESSION_START:Lorg/piwik/sdk/QueryParams;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v7, Lorg/piwik/sdk/QueryParams;->SESSION_START:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 660
    sget-object v5, Lorg/piwik/sdk/QueryParams;->SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v7, Lorg/piwik/sdk/QueryParams;->SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 661
    sget-object v5, Lorg/piwik/sdk/QueryParams;->USER_AGENT:Lorg/piwik/sdk/QueryParams;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v7, Lorg/piwik/sdk/QueryParams;->USER_AGENT:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 662
    sget-object v5, Lorg/piwik/sdk/QueryParams;->LANGUAGE:Lorg/piwik/sdk/QueryParams;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v7, Lorg/piwik/sdk/QueryParams;->LANGUAGE:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 663
    sget-object v5, Lorg/piwik/sdk/QueryParams;->COUNTRY:Lorg/piwik/sdk/QueryParams;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v7, Lorg/piwik/sdk/QueryParams;->COUNTRY:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 664
    sget-object v5, Lorg/piwik/sdk/QueryParams;->FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v7, Lorg/piwik/sdk/QueryParams;->FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 665
    sget-object v5, Lorg/piwik/sdk/QueryParams;->TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v7, Lorg/piwik/sdk/QueryParams;->TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 666
    sget-object v5, Lorg/piwik/sdk/QueryParams;->PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    iget-object v6, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v7, Lorg/piwik/sdk/QueryParams;->PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v6, v7}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v5, v6}, Lorg/piwik/sdk/TrackMe;->trySet(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 667
    return-void

    .line 638
    .end local v0    # "firstVisitTime":J
    .end local v2    # "previousVisit":J
    .end local v4    # "visitCount":I
    :catchall_101
    move-exception v5

    :try_start_102
    monitor-exit v6
    :try_end_103
    .catchall {:try_start_102 .. :try_end_103} :catchall_101

    throw v5

    .line 646
    .restart local v4    # "visitCount":I
    :catchall_104
    move-exception v5

    :try_start_105
    monitor-exit v6
    :try_end_106
    .catchall {:try_start_105 .. :try_end_106} :catchall_104

    throw v5

    .line 651
    .restart local v0    # "firstVisitTime":J
    :catchall_107
    move-exception v5

    :try_start_108
    monitor-exit v6
    :try_end_109
    .catchall {:try_start_108 .. :try_end_109} :catchall_107

    throw v5
.end method

.method public static makeRandomVisitorId()Ljava/lang/String;
    .registers 3

    .prologue
    .line 736
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

    .prologue
    .line 792
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/piwik/sdk/Tracker;->mLastEvent:Ljava/lang/String;

    .line 793
    return-void
.end method

.method public dispatch()Z
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->isOptOut()Z

    move-result v0

    if-nez v0, :cond_f

    .line 183
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/Dispatcher;

    invoke-virtual {v0}, Lorg/piwik/sdk/Dispatcher;->forceDispatch()V

    .line 184
    const/4 v0, 0x1

    .line 186
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 765
    if-ne p0, p1, :cond_5

    .line 768
    :cond_4
    :goto_4
    return v1

    .line 766
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 767
    check-cast v0, Lorg/piwik/sdk/Tracker;

    .line 768
    .local v0, "tracker":Lorg/piwik/sdk/Tracker;
    iget v3, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    iget v4, v0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    if-ne v3, v4, :cond_26

    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    iget-object v4, v0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    invoke-virtual {v3, v4}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_26
    move v1, v2

    goto :goto_4
.end method

.method protected getAPIUrl()Ljava/net/URL;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    return-object v0
.end method

.method protected getApplicationBaseURL()Ljava/lang/String;
    .registers 5

    .prologue
    .line 779
    const-string v0, "http://%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getApplicationDomain()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getApplicationDomain()Ljava/lang/String;
    .registers 2

    .prologue
    .line 271
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mApplicationDomain:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mApplicationDomain:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->getApplicationDomain()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getDefaultTrackMe()Lorg/piwik/sdk/TrackMe;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    return-object v0
.end method

.method public getDispatchInterval()J
    .registers 3

    .prologue
    .line 204
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/Dispatcher;

    invoke-virtual {v0}, Lorg/piwik/sdk/Dispatcher;->getDispatchInterval()J

    move-result-wide v0

    return-wide v0
.end method

.method protected getDispatcher()Lorg/piwik/sdk/Dispatcher;
    .registers 2

    .prologue
    .line 796
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/Dispatcher;

    return-object v0
.end method

.method protected getLastEvent()Ljava/lang/String;
    .registers 2

    .prologue
    .line 788
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mLastEvent:Ljava/lang/String;

    return-object v0
.end method

.method public getPiwik()Lorg/piwik/sdk/Piwik;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    return-object v0
.end method

.method public getSessionTimeout()J
    .registers 3

    .prologue
    .line 172
    iget-wide v0, p0, Lorg/piwik/sdk/Tracker;->mSessionTimeout:J

    return-wide v0
.end method

.method public getSharedPreferences()Landroid/content/SharedPreferences;
    .registers 2

    .prologue
    .line 760
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method protected getSiteId()I
    .registers 2

    .prologue
    .line 132
    iget v0, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .registers 3

    .prologue
    .line 230
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVisitorId()Ljava/lang/String;
    .registers 3

    .prologue
    .line 245
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1}, Lorg/piwik/sdk/TrackMe;->get(Lorg/piwik/sdk/QueryParams;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 773
    iget v0, p0, Lorg/piwik/sdk/Tracker;->mSiteId:I

    .line 774
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mApiUrl:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 775
    return v0
.end method

.method public setApplicationDomain(Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 2
    .param p1, "domain"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lorg/piwik/sdk/Tracker;->mApplicationDomain:Ljava/lang/String;

    .line 267
    return-object p0
.end method

.method public setDispatchInterval(J)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "dispatchInterval"    # J

    .prologue
    .line 196
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/Dispatcher;

    invoke-virtual {v0, p1, p2}, Lorg/piwik/sdk/Dispatcher;->setDispatchInterval(J)V

    .line 197
    return-object p0
.end method

.method public setSessionTimeout(I)V
    .registers 6
    .param p1, "milliseconds"    # I

    .prologue
    .line 152
    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    monitor-enter v1

    .line 153
    int-to-long v2, p1

    :try_start_4
    iput-wide v2, p0, Lorg/piwik/sdk/Tracker;->mSessionTimeout:J

    .line 154
    monitor-exit v1

    .line 155
    return-void

    .line 154
    :catchall_8
    move-exception v0

    monitor-exit v1
    :try_end_a
    .catchall {:try_start_4 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public setUserId(Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 221
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 222
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "tracker.userid"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 223
    return-object p0
.end method

.method public setVisitCustomVariable(ILjava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 755
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mVisitCustomVariable:Lorg/piwik/sdk/CustomVariables;

    invoke-virtual {v0, p1, p2, p3}, Lorg/piwik/sdk/CustomVariables;->put(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    .line 756
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

    .prologue
    .line 239
    invoke-direct {p0, p1}, Lorg/piwik/sdk/Tracker;->confirmVisitorIdFormat(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 240
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mDefaultTrackMe:Lorg/piwik/sdk/TrackMe;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 241
    :cond_d
    return-object p0
.end method

.method public startNewSession()V
    .registers 5

    .prologue
    .line 146
    iget-object v1, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    monitor-enter v1

    .line 147
    const-wide/16 v2, 0x0

    :try_start_5
    iput-wide v2, p0, Lorg/piwik/sdk/Tracker;->mSessionStartTime:J

    .line 148
    monitor-exit v1

    .line 149
    return-void

    .line 148
    :catchall_9
    move-exception v0

    monitor-exit v1
    :try_end_b
    .catchall {:try_start_5 .. :try_end_b} :catchall_9

    throw v0
.end method

.method public track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;
    .registers 11
    .param p1, "trackMe"    # Lorg/piwik/sdk/TrackMe;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 702
    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    monitor-enter v4

    .line 703
    :try_start_5
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->tryNewSession()Z

    move-result v2

    .line 704
    .local v2, "newSession":Z
    if-eqz v2, :cond_13

    .line 705
    new-instance v3, Ljava/util/concurrent/CountDownLatch;

    const/4 v5, 0x1

    invoke-direct {v3, v5}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v3, p0, Lorg/piwik/sdk/Tracker;->mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

    .line 706
    :cond_13
    monitor-exit v4
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_41

    .line 707
    if-eqz v2, :cond_44

    .line 708
    invoke-direct {p0, p1}, Lorg/piwik/sdk/Tracker;->injectInitialParams(Lorg/piwik/sdk/TrackMe;)V

    .line 718
    :goto_19
    invoke-direct {p0, p1}, Lorg/piwik/sdk/Tracker;->injectBaseParams(Lorg/piwik/sdk/TrackMe;)V

    .line 719
    invoke-virtual {p1}, Lorg/piwik/sdk/TrackMe;->build()Ljava/lang/String;

    move-result-object v1

    .line 720
    .local v1, "event":Ljava/lang/String;
    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v3}, Lorg/piwik/sdk/Piwik;->isOptOut()Z

    move-result v3

    if-eqz v3, :cond_58

    .line 721
    iput-object v1, p0, Lorg/piwik/sdk/Tracker;->mLastEvent:Ljava/lang/String;

    .line 722
    const-string v3, "PIWIK:Tracker"

    const-string v4, "URL omitted due to opt out: %s"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object v1, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 729
    :goto_39
    if-eqz v2, :cond_40

    .line 730
    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 732
    :cond_40
    return-object p0

    .line 706
    .end local v1    # "event":Ljava/lang/String;
    .end local v2    # "newSession":Z
    :catchall_41
    move-exception v3

    :try_start_42
    monitor-exit v4
    :try_end_43
    .catchall {:try_start_42 .. :try_end_43} :catchall_41

    throw v3

    .line 712
    .restart local v2    # "newSession":Z
    :cond_44
    :try_start_44
    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mSessionStartLatch:Ljava/util/concurrent/CountDownLatch;

    iget-object v4, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/Dispatcher;

    invoke-virtual {v4}, Lorg/piwik/sdk/Dispatcher;->getTimeOut()I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_52
    .catch Ljava/lang/InterruptedException; {:try_start_44 .. :try_end_52} :catch_53

    goto :goto_19

    .line 713
    :catch_53
    move-exception v0

    .line 714
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_19

    .line 724
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .restart local v1    # "event":Ljava/lang/String;
    :cond_58
    const-string v3, "PIWIK:Tracker"

    const-string v4, "URL added to the queue: %s"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object v1, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 725
    iget-object v3, p0, Lorg/piwik/sdk/Tracker;->mDispatcher:Lorg/piwik/sdk/Dispatcher;

    invoke-virtual {v3, v1}, Lorg/piwik/sdk/Dispatcher;->submit(Ljava/lang/String;)V

    goto :goto_39
.end method

.method public trackAppDownload()Lorg/piwik/sdk/Tracker;
    .registers 3

    .prologue
    .line 413
    iget-object v0, p0, Lorg/piwik/sdk/Tracker;->mPiwik:Lorg/piwik/sdk/Piwik;

    invoke-virtual {v0}, Lorg/piwik/sdk/Piwik;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->INSTALLER_PACKAGENAME:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    invoke-virtual {p0, v0, v1}, Lorg/piwik/sdk/Tracker;->trackAppDownload(Landroid/content/Context;Lorg/piwik/sdk/Tracker$ExtraIdentifier;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackAppDownload(Landroid/content/Context;Lorg/piwik/sdk/Tracker$ExtraIdentifier;)Lorg/piwik/sdk/Tracker;
    .registers 9
    .param p1, "app"    # Landroid/content/Context;
    .param p2, "extra"    # Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    .prologue
    .line 425
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 426
    .local v2, "pkgInfo":Landroid/content/pm/PackageInfo;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "downloaded:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 427
    .local v1, "firedKey":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_4c

    .line 428
    invoke-virtual {p0, p1, p2}, Lorg/piwik/sdk/Tracker;->trackNewAppDownload(Landroid/content/Context;Lorg/piwik/sdk/Tracker$ExtraIdentifier;)Lorg/piwik/sdk/Tracker;

    .line 429
    invoke-virtual {p0}, Lorg/piwik/sdk/Tracker;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v3, v1, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_4c
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_4c} :catch_4d

    .line 434
    .end local v1    # "firedKey":Ljava/lang/String;
    .end local v2    # "pkgInfo":Landroid/content/pm/PackageInfo;
    :cond_4c
    :goto_4c
    return-object p0

    .line 431
    :catch_4d
    move-exception v0

    .line 432
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_4c
.end method

.method public trackContentImpression(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 6
    .param p1, "contentName"    # Ljava/lang/String;
    .param p2, "contentPiece"    # Ljava/lang/String;
    .param p3, "contentTarget"    # Ljava/lang/String;

    .prologue
    .line 506
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_a

    .line 508
    .end local p0    # "this":Lorg/piwik/sdk/Tracker;
    :cond_9
    :goto_9
    return-object p0

    .restart local p0    # "this":Lorg/piwik/sdk/Tracker;
    :cond_a
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_NAME:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_PIECE:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_TARGET:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object p0

    goto :goto_9
.end method

.method public trackContentInteraction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 7
    .param p1, "interaction"    # Ljava/lang/String;
    .param p2, "contentName"    # Ljava/lang/String;
    .param p3, "contentPiece"    # Ljava/lang/String;
    .param p4, "contentTarget"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 523
    if-eqz p2, :cond_11

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_11

    if-eqz p1, :cond_11

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v1, :cond_12

    .line 525
    .end local p0    # "this":Lorg/piwik/sdk/Tracker;
    :cond_11
    :goto_11
    return-object p0

    .restart local p0    # "this":Lorg/piwik/sdk/Tracker;
    :cond_12
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_NAME:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_PIECE:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_TARGET:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p4}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->CONTENT_INTERACTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object p0

    goto :goto_11
.end method

.method public trackEcommerceCartUpdate(ILorg/piwik/sdk/ecommerce/EcommerceItems;)V
    .registers 6
    .param p1, "grandTotal"    # I
    .param p2, "items"    # Lorg/piwik/sdk/ecommerce/EcommerceItems;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 540
    if-nez p2, :cond_7

    .line 541
    new-instance p2, Lorg/piwik/sdk/ecommerce/EcommerceItems;

    .end local p2    # "items":Lorg/piwik/sdk/ecommerce/EcommerceItems;
    invoke-direct {p2}, Lorg/piwik/sdk/ecommerce/EcommerceItems;-><init>()V

    .line 544
    .restart local p2    # "items":Lorg/piwik/sdk/ecommerce/EcommerceItems;
    :cond_7
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->REVENUE:Lorg/piwik/sdk/QueryParams;

    invoke-static {p1}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->ECOMMERCE_ITEMS:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p2}, Lorg/piwik/sdk/ecommerce/EcommerceItems;->toJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    .line 548
    return-void
.end method

.method public trackEcommerceOrder(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Lorg/piwik/sdk/ecommerce/EcommerceItems;)V
    .registers 12
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

    .prologue
    .line 564
    if-nez p7, :cond_7

    .line 565
    new-instance p7, Lorg/piwik/sdk/ecommerce/EcommerceItems;

    .end local p7    # "items":Lorg/piwik/sdk/ecommerce/EcommerceItems;
    invoke-direct {p7}, Lorg/piwik/sdk/ecommerce/EcommerceItems;-><init>()V

    .line 568
    .restart local p7    # "items":Lorg/piwik/sdk/ecommerce/EcommerceItems;
    :cond_7
    new-instance v1, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v1}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v2, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v1

    sget-object v2, Lorg/piwik/sdk/QueryParams;->ORDER_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v1, v2, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v1

    sget-object v2, Lorg/piwik/sdk/QueryParams;->REVENUE:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v1

    sget-object v2, Lorg/piwik/sdk/QueryParams;->ECOMMERCE_ITEMS:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p7}, Lorg/piwik/sdk/ecommerce/EcommerceItems;->toJson()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    .line 574
    .local v0, "trackMe":Lorg/piwik/sdk/TrackMe;
    if-eqz p3, :cond_40

    .line 575
    sget-object v1, Lorg/piwik/sdk/QueryParams;->SUBTOTAL:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 578
    :cond_40
    if-eqz p4, :cond_4f

    .line 579
    sget-object v1, Lorg/piwik/sdk/QueryParams;->TAX:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 582
    :cond_4f
    if-eqz p5, :cond_5e

    .line 583
    sget-object v1, Lorg/piwik/sdk/QueryParams;->SHIPPING:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 586
    :cond_5e
    if-eqz p6, :cond_6d

    .line 587
    sget-object v1, Lorg/piwik/sdk/QueryParams;->DISCOUNT:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p6}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 589
    :cond_6d
    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    .line 590
    return-void
.end method

.method public trackEvent(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;

    .prologue
    .line 321
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 6
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/String;
    .param p3, "label"    # Ljava/lang/String;

    .prologue
    .line 327
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_NAME:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

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

    .prologue
    .line 350
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_NAME:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->EVENT_VALUE:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p4}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;F)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackException(Ljava/lang/Throwable;Ljava/lang/String;Z)V
    .registers 12
    .param p1, "ex"    # Ljava/lang/Throwable;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "isFatal"    # Z

    .prologue
    const/4 v5, 0x0

    .line 610
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    const/4 v6, 0x0

    aget-object v3, v4, v6

    .line 611
    .local v3, "trace":Ljava/lang/StackTraceElement;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "/"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ":"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_34} :catch_86

    move-result-object v1

    .line 616
    .end local v3    # "trace":Ljava/lang/StackTraceElement;
    .local v1, "className":Ljava/lang/String;
    :goto_35
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "exception/"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz p3, :cond_97

    const-string v4, "fatal/"

    :goto_44
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "/"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 617
    .local v0, "actionName":Ljava/lang/String;
    new-instance v4, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v4}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v6, Lorg/piwik/sdk/QueryParams;->ACTION_NAME:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v6, v0}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v4

    sget-object v6, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    const-string v7, "Exception"

    invoke-virtual {v4, v6, v7}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v4

    sget-object v6, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v6, v1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v4

    sget-object v6, Lorg/piwik/sdk/QueryParams;->EVENT_NAME:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4, v6, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v6

    sget-object v7, Lorg/piwik/sdk/QueryParams;->EVENT_VALUE:Lorg/piwik/sdk/QueryParams;

    if-eqz p3, :cond_9a

    const/4 v4, 0x1

    :goto_7e
    invoke-virtual {v6, v7, v4}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    .line 623
    return-void

    .line 612
    .end local v0    # "actionName":Ljava/lang/String;
    .end local v1    # "className":Ljava/lang/String;
    :catch_86
    move-exception v2

    .line 613
    .local v2, "e":Ljava/lang/Exception;
    const-string v4, "PIWIK:Tracker"

    const-string v6, "Couldn\'t get stack info"

    invoke-static {v4, v6, v2}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 614
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "className":Ljava/lang/String;
    goto :goto_35

    .line 616
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_97
    const-string v4, ""

    goto :goto_44

    .restart local v0    # "actionName":Ljava/lang/String;
    :cond_9a
    move v4, v5

    .line 617
    goto :goto_7e
.end method

.method public trackGoal(I)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "idGoal"    # I

    .prologue
    .line 369
    if-gez p1, :cond_3

    .line 371
    .end local p0    # "this":Lorg/piwik/sdk/Tracker;
    :goto_2
    return-object p0

    .restart local p0    # "this":Lorg/piwik/sdk/Tracker;
    :cond_3
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object p0

    goto :goto_2
.end method

.method public trackGoal(IF)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "idGoal"    # I
    .param p2, "revenue"    # F

    .prologue
    .line 381
    if-gez p1, :cond_3

    .line 383
    .end local p0    # "this":Lorg/piwik/sdk/Tracker;
    :goto_2
    return-object p0

    .restart local p0    # "this":Lorg/piwik/sdk/Tracker;
    :cond_3
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p1}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;I)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->REVENUE:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0, v1, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;F)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object p0

    goto :goto_2
.end method

.method public trackNewAppDownload(Landroid/content/Context;Lorg/piwik/sdk/Tracker$ExtraIdentifier;)Lorg/piwik/sdk/Tracker;
    .registers 14
    .param p1, "app"    # Landroid/content/Context;
    .param p2, "extra"    # Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    .prologue
    .line 455
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 457
    .local v3, "installationIdentifier":Ljava/lang/StringBuilder;
    :try_start_5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 458
    .local v6, "pkg":Ljava/lang/String;
    const-string v8, "http://"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 461
    .local v5, "packMan":Landroid/content/pm/PackageManager;
    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v7

    .line 462
    .local v7, "pkgInfo":Landroid/content/pm/PackageInfo;
    const-string v8, ":"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v7, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 466
    invoke-virtual {v5, v6}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 467
    .local v4, "installerPackageName":Ljava/lang/String;
    if-eqz v4, :cond_34

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0xc8

    if-le v8, v9, :cond_36

    .line 468
    :cond_34
    const-string v4, "unknown"

    .line 470
    :cond_36
    const-string v2, "unknown"

    .line 471
    .local v2, "extraIdentifier":Ljava/lang/String;
    sget-object v8, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->APK_CHECKSUM:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    if-ne p2, v8, :cond_9d

    .line 472
    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 473
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v8, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;
    :try_end_43
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_43} :catch_98

    if-eqz v8, :cond_50

    .line 475
    :try_start_45
    new-instance v8, Ljava/io/File;

    iget-object v9, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v8, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Lorg/piwik/sdk/tools/Checksum;->getMD5Checksum(Ljava/io/File;)Ljava/lang/String;
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_4f} :catch_93
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_45 .. :try_end_4f} :catch_98

    move-result-object v2

    .line 483
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_50
    :goto_50
    :try_start_50
    const-string v8, "/"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 485
    new-instance v8, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v8}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v9, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    const-string v10, "Application"

    invoke-virtual {v8, v9, v10}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v8

    sget-object v9, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    const-string v10, "downloaded"

    invoke-virtual {v8, v9, v10}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v8

    sget-object v9, Lorg/piwik/sdk/QueryParams;->ACTION_NAME:Lorg/piwik/sdk/QueryParams;

    const-string v10, "application/downloaded"

    invoke-virtual {v8, v9, v10}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v8

    sget-object v9, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    const-string v10, "/application/downloaded"

    invoke-virtual {v8, v9, v10}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v8

    sget-object v9, Lorg/piwik/sdk/QueryParams;->DOWNLOAD:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v8

    sget-object v9, Lorg/piwik/sdk/QueryParams;->REFERRER:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v8, v9, v4}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object p0

    .line 494
    .end local v2    # "extraIdentifier":Ljava/lang/String;
    .end local v4    # "installerPackageName":Ljava/lang/String;
    .end local v5    # "packMan":Landroid/content/pm/PackageManager;
    .end local v6    # "pkg":Ljava/lang/String;
    .end local v7    # "pkgInfo":Landroid/content/pm/PackageInfo;
    .end local p0    # "this":Lorg/piwik/sdk/Tracker;
    :goto_92
    return-object p0

    .line 476
    .restart local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v2    # "extraIdentifier":Ljava/lang/String;
    .restart local v4    # "installerPackageName":Ljava/lang/String;
    .restart local v5    # "packMan":Landroid/content/pm/PackageManager;
    .restart local v6    # "pkg":Ljava/lang/String;
    .restart local v7    # "pkgInfo":Landroid/content/pm/PackageInfo;
    .restart local p0    # "this":Lorg/piwik/sdk/Tracker;
    :catch_93
    move-exception v1

    .line 477
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_97
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_50 .. :try_end_97} :catch_98

    goto :goto_50

    .line 492
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "extraIdentifier":Ljava/lang/String;
    .end local v4    # "installerPackageName":Ljava/lang/String;
    .end local v5    # "packMan":Landroid/content/pm/PackageManager;
    .end local v6    # "pkg":Ljava/lang/String;
    .end local v7    # "pkgInfo":Landroid/content/pm/PackageInfo;
    :catch_98
    move-exception v1

    .line 493
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto :goto_92

    .line 480
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v2    # "extraIdentifier":Ljava/lang/String;
    .restart local v4    # "installerPackageName":Ljava/lang/String;
    .restart local v5    # "packMan":Landroid/content/pm/PackageManager;
    .restart local v6    # "pkg":Ljava/lang/String;
    .restart local v7    # "pkgInfo":Landroid/content/pm/PackageInfo;
    :cond_9d
    :try_start_9d
    sget-object v8, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->INSTALLER_PACKAGENAME:Lorg/piwik/sdk/Tracker$ExtraIdentifier;
    :try_end_9f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_9d .. :try_end_9f} :catch_98

    if-ne p2, v8, :cond_50

    .line 481
    move-object v2, v4

    goto :goto_50
.end method

.method public trackOutlink(Ljava/net/URL;)Lorg/piwik/sdk/Tracker;
    .registers 5
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 395
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ftp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 396
    :cond_24
    new-instance v0, Lorg/piwik/sdk/TrackMe;

    invoke-direct {v0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    sget-object v1, Lorg/piwik/sdk/QueryParams;->LINK:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    sget-object v1, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object p0

    .line 400
    .end local p0    # "this":Lorg/piwik/sdk/Tracker;
    :cond_41
    return-object p0
.end method

.method public trackScreenView(Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 280
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/piwik/sdk/Tracker;->trackScreenView(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;

    move-result-object v0

    return-object v0
.end method

.method public trackScreenView(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/Tracker;
    .registers 4
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 300
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

    .prologue
    .line 289
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

    .prologue
    .line 312
    if-nez p2, :cond_3

    .line 316
    .end local p0    # "this":Lorg/piwik/sdk/Tracker;
    :goto_2
    return-object p0

    .line 314
    .restart local p0    # "this":Lorg/piwik/sdk/Tracker;
    :cond_3
    sget-object v0, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1, v0, p2}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 315
    sget-object v0, Lorg/piwik/sdk/QueryParams;->ACTION_NAME:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {p1, v0, p3}, Lorg/piwik/sdk/TrackMe;->set(Lorg/piwik/sdk/QueryParams;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;

    .line 316
    invoke-virtual {p0, p1}, Lorg/piwik/sdk/Tracker;->track(Lorg/piwik/sdk/TrackMe;)Lorg/piwik/sdk/Tracker;

    move-result-object p0

    goto :goto_2
.end method

.method protected tryNewSession()Z
    .registers 8

    .prologue
    .line 158
    iget-object v2, p0, Lorg/piwik/sdk/Tracker;->mSessionLock:Ljava/lang/Object;

    monitor-enter v2

    .line 159
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lorg/piwik/sdk/Tracker;->mSessionStartTime:J

    sub-long/2addr v3, v5

    iget-wide v5, p0, Lorg/piwik/sdk/Tracker;->mSessionTimeout:J

    cmp-long v1, v3, v5

    if-lez v1, :cond_19

    const/4 v0, 0x1

    .line 161
    .local v0, "expired":Z
    :goto_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/piwik/sdk/Tracker;->mSessionStartTime:J

    .line 162
    monitor-exit v2

    return v0

    .line 159
    .end local v0    # "expired":Z
    :cond_19
    const/4 v0, 0x0

    goto :goto_11

    .line 163
    :catchall_1b
    move-exception v1

    monitor-exit v2
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw v1
.end method
