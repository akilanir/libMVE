.class public Lorg/piwik/sdk/TrackerBulkURLWrapper;
.super Ljava/lang/Object;
.source "TrackerBulkURLWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    }
.end annotation


# static fields
.field private static final EVENTS_PER_PAGE:I = 0x14

.field private static final LOGGER_TAG:Ljava/lang/String; = "PIWIK:TrackerBulkURLWrapper"


# instance fields
.field private final mApiUrl:Ljava/net/URL;

.field private final mAuthtoken:Ljava/lang/String;

.field private mCurrentPage:I

.field private final mEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mPages:I


# direct methods
.method public constructor <init>(Ljava/net/URL;Ljava/util/List;Ljava/lang/String;)V
    .registers 8
    .param p1, "apiUrl"    # Ljava/net/URL;
    .param p3, "authToken"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 31
    .local p2, "events":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I

    .line 32
    iput-object p1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mApiUrl:Ljava/net/URL;

    .line 33
    iput-object p3, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mAuthtoken:Ljava/lang/String;

    .line 34
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    int-to-double v0, v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mPages:I

    .line 35
    iput-object p2, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;

    .line 36
    return-void
.end method

.method static synthetic access$000(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .prologue
    .line 22
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I

    return v0
.end method

.method static synthetic access$008(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I
    .registers 3
    .param p0, "x0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .prologue
    .line 22
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I

    return v0
.end method

.method static synthetic access$100(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .prologue
    .line 22
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mPages:I

    return v0
.end method

.method static synthetic access$200(Lorg/piwik/sdk/TrackerBulkURLWrapper;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .prologue
    .line 22
    iget-object v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;

    return-object v0
.end method

.method protected static getEventsPerPage()I
    .registers 1

    .prologue
    .line 39
    const/16 v0, 0x14

    return v0
.end method


# virtual methods
.method public getApiUrl()Ljava/net/URL;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mApiUrl:Ljava/net/URL;

    return-object v0
.end method

.method public getEventUrl(Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;)Ljava/lang/String;
    .registers 5
    .param p1, "page"    # Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;

    .prologue
    .line 114
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 115
    :cond_8
    const/4 v0, 0x0

    .line 118
    :goto_9
    return-object v0

    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->getApiUrl()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;

    iget v2, p1, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method

.method public getEvents(Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;)Lorg/json/JSONObject;
    .registers 9
    .param p1, "page"    # Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;

    .prologue
    const/4 v3, 0x0

    .line 82
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_b

    :cond_9
    move-object v2, v3

    .line 105
    :cond_a
    :goto_a
    return-object v2

    .line 86
    :cond_b
    iget-object v4, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;

    iget v5, p1, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    iget v6, p1, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->toIndex:I

    invoke-interface {v4, v5, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v1

    .line 88
    .local v1, "pageElements":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_24

    .line 89
    const-string v4, "PIWIK:TrackerBulkURLWrapper"

    const-string v5, "Empty page"

    invoke-static {v4, v5}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v3

    .line 90
    goto :goto_a

    .line 93
    :cond_24
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 95
    .local v2, "params":Lorg/json/JSONObject;
    :try_start_29
    const-string v4, "requests"

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5, v1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    iget-object v4, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mAuthtoken:Ljava/lang/String;

    if-eqz v4, :cond_a

    .line 98
    sget-object v4, Lorg/piwik/sdk/QueryParams;->AUTHENTICATION_TOKEN:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v4}, Lorg/piwik/sdk/QueryParams;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mAuthtoken:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_42
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_42} :catch_43

    goto :goto_a

    .line 100
    :catch_43
    move-exception v0

    .line 101
    .local v0, "e":Lorg/json/JSONException;
    const-string v4, "PIWIK:TrackerBulkURLWrapper"

    const-string v5, "Cannot create json object"

    invoke-static {v4, v5, v0}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    const-string v4, "PIWIK:TrackerBulkURLWrapper"

    const-string v5, ", "

    invoke-static {v5, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/piwik/sdk/tools/Logy;->i(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v3

    .line 103
    goto :goto_a
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    new-instance v0, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;

    invoke-direct {v0, p0}, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;-><init>(Lorg/piwik/sdk/TrackerBulkURLWrapper;)V

    return-object v0
.end method
