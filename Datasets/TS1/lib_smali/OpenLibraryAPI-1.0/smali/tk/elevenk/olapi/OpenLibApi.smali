.class public Ltk/elevenk/olapi/OpenLibApi;
.super Ljava/lang/Object;
.source "OpenLibApi.java"

# interfaces
.implements Ltk/elevenk/olapi/LibraryApi;


# static fields
.field public static final BASE_URL:Ljava/lang/String; = "https://openlibrary.org"

.field private static final BOOKS_API_KEYS:Ljava/util/Map;

.field private static final BOOKS_API_URL:Ljava/lang/String; = "https://openlibrary.org/api/books"

.field private static final COVERS_API_URL:Ljava/lang/String;

.field private static final LOGIN_API_URL:Ljava/lang/String; = "https://openlibrary.org/account/login"

.field private static final LOGIN_SET_COOKIE_HEADER:Ljava/lang/String; = "Set-Cookie"

.field private static final READ_API_URL:Ljava/lang/String; = "https://openlibrary.org/api/volumes/brief/json/"

.field private static final SEARCH_API_KEYS:Ljava/util/Map;

.field private static final SEARCH_API_URL:Ljava/lang/String; = "https://openlibrary.org/search.json"

.field private static final SUBJECTS_API_KEYS:Ljava/util/Map;

.field private static final SUBJECTS_API_URL:Ljava/lang/String; = "https://openlibrary.org/subjects/<subject>.json"

.field private static final SUBJECT_DATA_KEY:Ljava/lang/String; = "subject"


# instance fields
.field private currentRequest:Lorg/apache/http/client/methods/HttpUriRequest;

.field private httpClient:Lorg/apache/http/client/HttpClient;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://openlibrary.org"

    const-string v2, "//"

    const-string v3, "//covers."

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/b/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Ltk/elevenk/olapi/OpenLibApi;->COVERS_API_URL:Ljava/lang/String;

    .line 58
    new-instance v0, Ltk/elevenk/olapi/OpenLibApi$1;

    invoke-direct {v0}, Ltk/elevenk/olapi/OpenLibApi$1;-><init>()V

    sput-object v0, Ltk/elevenk/olapi/OpenLibApi;->BOOKS_API_KEYS:Ljava/util/Map;

    .line 66
    new-instance v0, Ltk/elevenk/olapi/OpenLibApi$2;

    invoke-direct {v0}, Ltk/elevenk/olapi/OpenLibApi$2;-><init>()V

    sput-object v0, Ltk/elevenk/olapi/OpenLibApi;->SEARCH_API_KEYS:Ljava/util/Map;

    .line 82
    new-instance v0, Ltk/elevenk/olapi/OpenLibApi$3;

    invoke-direct {v0}, Ltk/elevenk/olapi/OpenLibApi$3;-><init>()V

    sput-object v0, Ltk/elevenk/olapi/OpenLibApi;->SUBJECTS_API_KEYS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 101
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-direct {p0, v0}, Ltk/elevenk/olapi/OpenLibApi;-><init>(Lorg/apache/http/client/HttpClient;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;)V
    .registers 2
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput-object p1, p0, Ltk/elevenk/olapi/OpenLibApi;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 106
    return-void
.end method

.method private addQueryParams(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;
    .registers 10
    .param p1, "baseUrl"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/util/Map;
    .param p3, "keys"    # Ljava/util/Map;

    .prologue
    .line 110
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 111
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1b
    :goto_1b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_cc

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 112
    .local v0, "key":Ljava/lang/Object;
    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7b

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_7b

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7b

    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, " "

    const-string v5, "+"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "[^\\w\\+]"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1b

    .line 114
    :cond_7b
    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1b

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1b

    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, " "

    const-string v5, "+"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "[^\\w\\+]"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_1b

    .line 118
    .end local v0    # "key":Ljava/lang/Object;
    :cond_cc
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "URL with query params: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ltk/elevenk/olapi/logging/Log;->d(Ljava/lang/String;)V

    .line 119
    return-object p1
.end method

.method private makeApiCall(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 8
    .param p1, "data"    # Ljava/util/Map;
    .param p2, "paramKeys"    # Ljava/util/Map;
    .param p3, "pUrl"    # Ljava/lang/String;

    .prologue
    .line 142
    const-string v2, " "

    const-string v3, "%20"

    invoke-virtual {p3, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 143
    .local v1, "url":Ljava/lang/String;
    if-eqz p2, :cond_1a

    if-eqz p1, :cond_1a

    .line 144
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {p0, v1, p1, p2}, Ltk/elevenk/olapi/OpenLibApi;->addQueryParams(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 148
    .local v0, "apiRequest":Lorg/apache/http/client/methods/HttpGet;
    :goto_15
    invoke-direct {p0, v0}, Ltk/elevenk/olapi/OpenLibApi;->makeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/json/JSONObject;

    move-result-object v2

    return-object v2

    .line 146
    .end local v0    # "apiRequest":Lorg/apache/http/client/methods/HttpGet;
    :cond_1a
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .restart local v0    # "apiRequest":Lorg/apache/http/client/methods/HttpGet;
    goto :goto_15
.end method

.method private makeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/json/JSONObject;
    .registers 9
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;

    .prologue
    .line 123
    iput-object p1, p0, Ltk/elevenk/olapi/OpenLibApi;->currentRequest:Lorg/apache/http/client/methods/HttpUriRequest;

    .line 124
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 125
    .local v3, "responseData":Lorg/json/JSONObject;
    if-eqz p1, :cond_2d

    .line 127
    :try_start_9
    iget-object v5, p0, Ltk/elevenk/olapi/OpenLibApi;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v5, p1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 128
    .local v1, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    const/16 v6, 0xc8

    if-ne v5, v6, :cond_2d

    .line 129
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v5

    invoke-static {v5}, Ltk/elevenk/olapi/ApiHelpers;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 130
    .local v2, "responseBody":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_2c} :catch_2e

    .end local v3    # "responseData":Lorg/json/JSONObject;
    .local v4, "responseData":Lorg/json/JSONObject;
    move-object v3, v4

    .line 136
    .end local v1    # "response":Lorg/apache/http/HttpResponse;
    .end local v2    # "responseBody":Ljava/lang/String;
    .end local v4    # "responseData":Lorg/json/JSONObject;
    .restart local v3    # "responseData":Lorg/json/JSONObject;
    :cond_2d
    :goto_2d
    return-object v3

    .line 132
    :catch_2e
    move-exception v0

    .line 133
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, ""

    invoke-static {v5, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2d
.end method


# virtual methods
.method public books(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 4
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    .line 153
    sget-object v0, Ltk/elevenk/olapi/OpenLibApi;->BOOKS_API_KEYS:Ljava/util/Map;

    const-string v1, "https://openlibrary.org/api/books"

    invoke-direct {p0, p1, v0, v1}, Ltk/elevenk/olapi/OpenLibApi;->makeApiCall(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public cancelRequest()V
    .registers 3

    .prologue
    .line 240
    :try_start_0
    iget-object v1, p0, Ltk/elevenk/olapi/OpenLibApi;->currentRequest:Lorg/apache/http/client/methods/HttpUriRequest;

    invoke-interface {v1}, Lorg/apache/http/client/methods/HttpUriRequest;->abort()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 244
    :goto_5
    return-void

    .line 241
    :catch_6
    move-exception v0

    .line 242
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to abort request"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5
.end method

.method public covers(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 10
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    .line 158
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 160
    .local v2, "imageData":Lorg/json/JSONObject;
    :try_start_5
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_87

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 161
    .local v3, "key":Ljava/lang/Object;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Ltk/elevenk/olapi/OpenLibApi;->COVERS_API_URL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "coverUrl":Ljava/lang/String;
    const-string v5, "small"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-S.jpg"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 163
    const-string v5, "medium"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-M.jpg"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    const-string v5, "large"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-L.jpg"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_80
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_80} :catch_81

    goto :goto_d

    .line 166
    .end local v0    # "coverUrl":Ljava/lang/String;
    .end local v3    # "key":Ljava/lang/Object;
    :catch_81
    move-exception v1

    .line 167
    .local v1, "e":Lorg/json/JSONException;
    const-string v4, ""

    invoke-static {v4, v1}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 169
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_87
    return-object v2
.end method

.method public getBaseUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 248
    const-string v0, "https://openlibrary.org"

    return-object v0
.end method

.method public lists(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 3
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    .line 175
    new-instance v0, Lsun/reflect/generics/reflectiveObjects/NotImplementedException;

    invoke-direct {v0}, Lsun/reflect/generics/reflectiveObjects/NotImplementedException;-><init>()V

    throw v0
.end method

.method public login(Ljava/util/Map;)Lorg/apache/http/cookie/Cookie;
    .registers 16
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    .line 213
    new-instance v7, Lorg/apache/http/client/methods/HttpPost;

    const-string v12, "https://openlibrary.org/account/login"

    invoke-direct {v7, v12}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 214
    .local v7, "loginRequest":Lorg/apache/http/client/methods/HttpPost;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 215
    .local v6, "jsonData":Lorg/json/JSONObject;
    const/4 v1, 0x0

    .line 218
    .local v1, "cookie":Lorg/apache/http/cookie/Cookie;
    :try_start_d
    new-instance v4, Lorg/apache/http/entity/StringEntity;

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v4, v12}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 219
    .local v4, "entity":Lorg/apache/http/entity/StringEntity;
    const-string v12, "application/json"

    invoke-virtual {v4, v12}, Lorg/apache/http/entity/StringEntity;->setContentType(Ljava/lang/String;)V

    .line 220
    invoke-virtual {v7, v4}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 221
    iget-object v12, p0, Ltk/elevenk/olapi/OpenLibApi;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v12, v7}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    .line 222
    .local v9, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v9}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v12

    invoke-interface {v12}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v12

    const/16 v13, 0xc8

    if-ne v12, v13, :cond_68

    .line 223
    const-string v12, "Set-Cookie"

    invoke-interface {v9, v12}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v11

    .line 224
    .local v11, "setCookie":Lorg/apache/http/Header;
    invoke-interface {v11}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v12

    const-string v13, ";"

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 225
    .local v5, "headerVal":[Ljava/lang/String;
    const/4 v12, 0x0

    aget-object v12, v5, v12

    const-string v13, "="

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 226
    .local v10, "sessionData":[Ljava/lang/String;
    const/4 v12, 0x1

    aget-object v12, v5, v12

    const-string v13, "="

    invoke-virtual {v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 227
    .local v8, "pathData":[Ljava/lang/String;
    new-instance v2, Lorg/apache/http/impl/cookie/BasicClientCookie;

    const/4 v12, 0x0

    aget-object v12, v10, v12

    const/4 v13, 0x1

    aget-object v13, v10, v13

    invoke-direct {v2, v12, v13}, Lorg/apache/http/impl/cookie/BasicClientCookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_5d} :catch_69

    .line 228
    .end local v1    # "cookie":Lorg/apache/http/cookie/Cookie;
    .local v2, "cookie":Lorg/apache/http/cookie/Cookie;
    :try_start_5d
    move-object v0, v2

    check-cast v0, Lorg/apache/http/impl/cookie/BasicClientCookie;

    move-object v12, v0

    const/4 v13, 0x1

    aget-object v13, v8, v13

    invoke-virtual {v12, v13}, Lorg/apache/http/impl/cookie/BasicClientCookie;->setPath(Ljava/lang/String;)V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_67} :catch_70

    move-object v1, v2

    .line 234
    .end local v2    # "cookie":Lorg/apache/http/cookie/Cookie;
    .end local v4    # "entity":Lorg/apache/http/entity/StringEntity;
    .end local v5    # "headerVal":[Ljava/lang/String;
    .end local v8    # "pathData":[Ljava/lang/String;
    .end local v9    # "response":Lorg/apache/http/HttpResponse;
    .end local v10    # "sessionData":[Ljava/lang/String;
    .end local v11    # "setCookie":Lorg/apache/http/Header;
    .restart local v1    # "cookie":Lorg/apache/http/cookie/Cookie;
    :cond_68
    :goto_68
    return-object v1

    .line 230
    :catch_69
    move-exception v3

    .line 231
    .local v3, "e":Ljava/lang/Exception;
    :goto_6a
    const-string v12, ""

    invoke-static {v12, v3}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_68

    .line 230
    .end local v1    # "cookie":Lorg/apache/http/cookie/Cookie;
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v2    # "cookie":Lorg/apache/http/cookie/Cookie;
    .restart local v4    # "entity":Lorg/apache/http/entity/StringEntity;
    .restart local v5    # "headerVal":[Ljava/lang/String;
    .restart local v8    # "pathData":[Ljava/lang/String;
    .restart local v9    # "response":Lorg/apache/http/HttpResponse;
    .restart local v10    # "sessionData":[Ljava/lang/String;
    .restart local v11    # "setCookie":Lorg/apache/http/Header;
    :catch_70
    move-exception v3

    move-object v1, v2

    .end local v2    # "cookie":Lorg/apache/http/cookie/Cookie;
    .restart local v1    # "cookie":Lorg/apache/http/cookie/Cookie;
    goto :goto_6a
.end method

.method public read(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 8
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    const/4 v5, 0x0

    .line 180
    const-string v1, "https://openlibrary.org/api/volumes/brief/json/"

    .line 181
    .local v1, "requestUrl":Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_43

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 182
    .local v0, "key":Ljava/lang/Object;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "%7C"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 183
    goto :goto_b

    .line 184
    .end local v0    # "key":Ljava/lang/Object;
    :cond_43
    invoke-direct {p0, v5, v5, v1}, Ltk/elevenk/olapi/OpenLibApi;->makeApiCall(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    return-object v2
.end method

.method public recentChanges(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 3
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    .line 190
    new-instance v0, Lsun/reflect/generics/reflectiveObjects/NotImplementedException;

    invoke-direct {v0}, Lsun/reflect/generics/reflectiveObjects/NotImplementedException;-><init>()V

    throw v0
.end method

.method public search(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 4
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    .line 195
    sget-object v0, Ltk/elevenk/olapi/OpenLibApi;->SEARCH_API_KEYS:Ljava/util/Map;

    const-string v1, "https://openlibrary.org/search.json"

    invoke-direct {p0, p1, v0, v1}, Ltk/elevenk/olapi/OpenLibApi;->makeApiCall(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public searchInside(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 3
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    .line 201
    new-instance v0, Lsun/reflect/generics/reflectiveObjects/NotImplementedException;

    invoke-direct {v0}, Lsun/reflect/generics/reflectiveObjects/NotImplementedException;-><init>()V

    throw v0
.end method

.method public subjects(Ljava/util/Map;)Lorg/json/JSONObject;
    .registers 6
    .param p1, "data"    # Ljava/util/Map;

    .prologue
    .line 206
    const-string v2, "subject"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 207
    .local v1, "subject":Ljava/lang/String;
    const-string v2, "https://openlibrary.org/subjects/<subject>.json"

    const-string v3, "<subject>"

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "apiUrl":Ljava/lang/String;
    sget-object v2, Ltk/elevenk/olapi/OpenLibApi;->SUBJECTS_API_KEYS:Ljava/util/Map;

    invoke-direct {p0, p1, v2, v0}, Ltk/elevenk/olapi/OpenLibApi;->makeApiCall(Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    return-object v2
.end method
