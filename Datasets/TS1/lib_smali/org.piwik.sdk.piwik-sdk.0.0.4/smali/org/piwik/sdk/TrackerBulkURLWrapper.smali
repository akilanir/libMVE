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
            "Ljava/util/List<",
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
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "authToken"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 34
    .local p2, "events":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I

    .line 35
    iput-object p1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mApiUrl:Ljava/net/URL;

    .line 36
    iput-object p3, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mAuthtoken:Ljava/lang/String;

    .line 37
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    int-to-double v0, v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4034000000000000L    # 20.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mPages:I

    .line 38
    iput-object p2, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;

    .line 39
    return-void
.end method

.method static synthetic access$000(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .line 25
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I

    return v0
.end method

.method static synthetic access$008(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I
    .registers 3
    .param p0, "x0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .line 25
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mCurrentPage:I

    return v0
.end method

.method static synthetic access$100(Lorg/piwik/sdk/TrackerBulkURLWrapper;)I
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .line 25
    iget v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mPages:I

    return v0
.end method

.method static synthetic access$200(Lorg/piwik/sdk/TrackerBulkURLWrapper;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lorg/piwik/sdk/TrackerBulkURLWrapper;

    .line 25
    iget-object v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;

    return-object v0
.end method

.method protected static getEventsPerPage()I
    .registers 1

    .line 42
    const/16 v0, 0x14

    return v0
.end method


# virtual methods
.method public getApiUrl()Ljava/net/URL;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 73
    iget-object v0, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mApiUrl:Ljava/net/URL;

    return-object v0
.end method

.method public getEventUrl(Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;)Ljava/net/URL;
    .registers 7
    .param p1, "page"    # Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 120
    const/4 v0, 0x0

    if-eqz p1, :cond_36

    invoke-virtual {p1}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_36

    .line 124
    :cond_a
    :try_start_a
    new-instance v1, Ljava/net/URL;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/piwik/sdk/TrackerBulkURLWrapper;->getApiUrl()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;

    iget v4, p1, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_30
    .catch Ljava/net/MalformedURLException; {:try_start_a .. :try_end_30} :catch_31

    return-object v1

    .line 125
    :catch_31
    move-exception v1

    .line 126
    .local v1, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 128
    .end local v1    # "e":Ljava/net/MalformedURLException;
    return-object v0

    .line 121
    :cond_36
    :goto_36
    return-object v0
.end method

.method public getEvents(Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;)Lorg/json/JSONObject;
    .registers 8
    .param p1, "page"    # Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 87
    const/4 v0, 0x0

    if-eqz p1, :cond_56

    invoke-virtual {p1}, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_56

    .line 91
    :cond_a
    iget-object v1, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mEvents:Ljava/util/List;

    iget v2, p1, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->fromIndex:I

    iget v3, p1, Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;->toIndex:I

    invoke-interface {v1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v1

    .line 93
    .local v1, "pageElements":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_22

    .line 94
    const-string v2, "PIWIK:TrackerBulkURLWrapper"

    const-string v3, "Empty page"

    invoke-static {v2, v3}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    return-object v0

    .line 98
    :cond_22
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 100
    .local v2, "params":Lorg/json/JSONObject;
    :try_start_27
    const-string v3, "requests"

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, v1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 102
    iget-object v3, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mAuthtoken:Ljava/lang/String;

    if-eqz v3, :cond_40

    .line 103
    sget-object v3, Lorg/piwik/sdk/QueryParams;->AUTHENTICATION_TOKEN:Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v3}, Lorg/piwik/sdk/QueryParams;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/piwik/sdk/TrackerBulkURLWrapper;->mAuthtoken:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_40
    .catch Lorg/json/JSONException; {:try_start_27 .. :try_end_40} :catch_42

    .line 109
    :cond_40
    nop

    .line 110
    return-object v2

    .line 105
    :catch_42
    move-exception v3

    .line 106
    .local v3, "e":Lorg/json/JSONException;
    const-string v4, "PIWIK:TrackerBulkURLWrapper"

    const-string v5, "Cannot create json object"

    invoke-static {v4, v5, v3}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 107
    const-string v4, "PIWIK:TrackerBulkURLWrapper"

    const-string v5, ", "

    invoke-static {v5, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/piwik/sdk/tools/Logy;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    return-object v0

    .line 88
    .end local v1    # "pageElements":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "params":Lorg/json/JSONObject;
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_56
    :goto_56
    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lorg/piwik/sdk/TrackerBulkURLWrapper$Page;",
            ">;"
        }
    .end annotation

    .line 51
    new-instance v0, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;

    invoke-direct {v0, p0}, Lorg/piwik/sdk/TrackerBulkURLWrapper$1;-><init>(Lorg/piwik/sdk/TrackerBulkURLWrapper;)V

    return-object v0
.end method
