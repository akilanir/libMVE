.class public Ltk/elevenk/olapi/data/BookList;
.super Ljava/util/ArrayList;
.source "BookList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Ltk/elevenk/olapi/data/BookData;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONArray;)V
    .registers 2
    .param p1, "jsonArray"    # Lorg/json/JSONArray;

    .prologue
    .line 41
    invoke-direct {p0}, Ltk/elevenk/olapi/data/BookList;-><init>()V

    .line 42
    invoke-direct {p0, p1}, Ltk/elevenk/olapi/data/BookList;->processBooks(Lorg/json/JSONArray;)Ljava/util/List;

    .line 43
    return-void
.end method

.method private processBooks(Lorg/json/JSONArray;)Ljava/util/List;
    .registers 5
    .param p1, "jsonArray"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List",
            "<",
            "Ltk/elevenk/olapi/data/BookData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 46
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_1e

    .line 48
    :try_start_7
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    invoke-static {v2}, Ltk/elevenk/olapi/data/BookData;->bookFromSearch(Lorg/json/JSONObject;)Ltk/elevenk/olapi/data/BookData;

    move-result-object v2

    invoke-virtual {p0, v2}, Ltk/elevenk/olapi/data/BookList;->add(Ljava/lang/Object;)Z
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_14} :catch_17

    .line 46
    :goto_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 49
    :catch_17
    move-exception v0

    .line 51
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, ""

    invoke-static {v2, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_14

    .line 54
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1e
    return-object p0
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Ltk/elevenk/olapi/data/BookList;->get(I)Ltk/elevenk/olapi/data/BookData;

    move-result-object v0

    return-object v0
.end method

.method public get(I)Ltk/elevenk/olapi/data/BookData;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 60
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookList;->size()I

    move-result v1

    if-ge p1, v1, :cond_d

    .line 61
    invoke-super {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltk/elevenk/olapi/data/BookData;

    .line 66
    .local v0, "book":Ltk/elevenk/olapi/data/BookData;
    :goto_c
    return-object v0

    .line 63
    .end local v0    # "book":Ltk/elevenk/olapi/data/BookData;
    :cond_d
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v1}, Ltk/elevenk/olapi/data/BookData;->bookFromSearch(Lorg/json/JSONObject;)Ltk/elevenk/olapi/data/BookData;

    move-result-object v0

    .restart local v0    # "book":Ltk/elevenk/olapi/data/BookData;
    goto :goto_c
.end method
