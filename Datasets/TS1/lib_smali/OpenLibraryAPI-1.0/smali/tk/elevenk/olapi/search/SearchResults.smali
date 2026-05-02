.class public Ltk/elevenk/olapi/search/SearchResults;
.super Ljava/lang/Object;
.source "SearchResults.java"


# static fields
.field public static final BOOKS:Ljava/lang/String; = "docs"

.field public static final NUMBER_OF_RESULTS:Ljava/lang/String; = "num_found"

.field public static final STARTING_BOOK_NUM:Ljava/lang/String; = "start"


# instance fields
.field private results:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .registers 2
    .param p1, "json"    # Lorg/json/JSONObject;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Ltk/elevenk/olapi/search/SearchResults;->results:Lorg/json/JSONObject;

    .line 44
    return-void
.end method


# virtual methods
.method public getBooks()Ltk/elevenk/olapi/data/BookList;
    .registers 5

    .prologue
    .line 49
    :try_start_0
    new-instance v1, Ltk/elevenk/olapi/data/BookList;

    iget-object v2, p0, Ltk/elevenk/olapi/search/SearchResults;->results:Lorg/json/JSONObject;

    const-string v3, "docs"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-direct {v1, v2}, Ltk/elevenk/olapi/data/BookList;-><init>(Lorg/json/JSONArray;)V
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_d} :catch_e

    .line 53
    .local v1, "list":Ltk/elevenk/olapi/data/BookList;
    :goto_d
    return-object v1

    .line 50
    .end local v1    # "list":Ltk/elevenk/olapi/data/BookList;
    :catch_e
    move-exception v0

    .line 51
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Ltk/elevenk/olapi/data/BookList;

    invoke-direct {v1}, Ltk/elevenk/olapi/data/BookList;-><init>()V

    .restart local v1    # "list":Ltk/elevenk/olapi/data/BookList;
    goto :goto_d
.end method

.method public getNumberOfResults()I
    .registers 4

    .prologue
    .line 66
    :try_start_0
    iget-object v1, p0, Ltk/elevenk/olapi/search/SearchResults;->results:Lorg/json/JSONObject;

    const-string v2, "num_found"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_7} :catch_9

    move-result v1

    .line 68
    :goto_8
    return v1

    .line 67
    :catch_9
    move-exception v0

    .line 68
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, -0x1

    goto :goto_8
.end method

.method public getStartingBookNum()I
    .registers 4

    .prologue
    .line 58
    :try_start_0
    iget-object v1, p0, Ltk/elevenk/olapi/search/SearchResults;->results:Lorg/json/JSONObject;

    const-string v2, "start"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_7} :catch_9

    move-result v1

    .line 60
    :goto_8
    return v1

    .line 59
    :catch_9
    move-exception v0

    .line 60
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, -0x1

    goto :goto_8
.end method

.method public getUnderlyingJSON()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Ltk/elevenk/olapi/search/SearchResults;->results:Lorg/json/JSONObject;

    return-object v0
.end method
