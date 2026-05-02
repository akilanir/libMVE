.class public Lcom/github/kevinsawicki/http/HttpRequest;
.super Ljava/lang/Object;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;,
        Lcom/github/kevinsawicki/http/HttpRequest$FlushOperation;,
        Lcom/github/kevinsawicki/http/HttpRequest$CloseOperation;,
        Lcom/github/kevinsawicki/http/HttpRequest$Operation;,
        Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;,
        Lcom/github/kevinsawicki/http/HttpRequest$Base64;,
        Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;,
        Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;
    }
.end annotation


# static fields
.field private static final BOUNDARY:Ljava/lang/String; = "00content0boundary00"

.field public static final CHARSET_UTF8:Ljava/lang/String; = "UTF-8"

.field private static CONNECTION_FACTORY:Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory; = null

.field public static final CONTENT_TYPE_FORM:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field public static final CONTENT_TYPE_JSON:Ljava/lang/String; = "application/json"

.field private static final CONTENT_TYPE_MULTIPART:Ljava/lang/String; = "multipart/form-data; boundary=00content0boundary00"

.field private static final CRLF:Ljava/lang/String; = "\r\n"

.field private static final EMPTY_STRINGS:[Ljava/lang/String;

.field public static final ENCODING_GZIP:Ljava/lang/String; = "gzip"

.field public static final HEADER_ACCEPT:Ljava/lang/String; = "Accept"

.field public static final HEADER_ACCEPT_CHARSET:Ljava/lang/String; = "Accept-Charset"

.field public static final HEADER_ACCEPT_ENCODING:Ljava/lang/String; = "Accept-Encoding"

.field public static final HEADER_AUTHORIZATION:Ljava/lang/String; = "Authorization"

.field public static final HEADER_CACHE_CONTROL:Ljava/lang/String; = "Cache-Control"

.field public static final HEADER_CONTENT_ENCODING:Ljava/lang/String; = "Content-Encoding"

.field public static final HEADER_CONTENT_LENGTH:Ljava/lang/String; = "Content-Length"

.field public static final HEADER_CONTENT_TYPE:Ljava/lang/String; = "Content-Type"

.field public static final HEADER_DATE:Ljava/lang/String; = "Date"

.field public static final HEADER_ETAG:Ljava/lang/String; = "ETag"

.field public static final HEADER_EXPIRES:Ljava/lang/String; = "Expires"

.field public static final HEADER_IF_NONE_MATCH:Ljava/lang/String; = "If-None-Match"

.field public static final HEADER_LAST_MODIFIED:Ljava/lang/String; = "Last-Modified"

.field public static final HEADER_LOCATION:Ljava/lang/String; = "Location"

.field public static final HEADER_PROXY_AUTHORIZATION:Ljava/lang/String; = "Proxy-Authorization"

.field public static final HEADER_REFERER:Ljava/lang/String; = "Referer"

.field public static final HEADER_SERVER:Ljava/lang/String; = "Server"

.field public static final HEADER_USER_AGENT:Ljava/lang/String; = "User-Agent"

.field public static final METHOD_DELETE:Ljava/lang/String; = "DELETE"

.field public static final METHOD_GET:Ljava/lang/String; = "GET"

.field public static final METHOD_HEAD:Ljava/lang/String; = "HEAD"

.field public static final METHOD_OPTIONS:Ljava/lang/String; = "OPTIONS"

.field public static final METHOD_POST:Ljava/lang/String; = "POST"

.field public static final METHOD_PUT:Ljava/lang/String; = "PUT"

.field public static final METHOD_TRACE:Ljava/lang/String; = "TRACE"

.field public static final PARAM_CHARSET:Ljava/lang/String; = "charset"

.field private static TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

.field private static TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field private bufferSize:I

.field private connection:Ljava/net/HttpURLConnection;

.field private form:Z

.field private httpProxyHost:Ljava/lang/String;

.field private httpProxyPort:I

.field private ignoreCloseExceptions:Z

.field private multipart:Z

.field private output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

.field private progress:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

.field private final requestMethod:Ljava/lang/String;

.field private totalSize:J

.field private totalWritten:J

.field private uncompress:Z

.field private final url:Ljava/net/URL;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 255
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/github/kevinsawicki/http/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    .line 370
    sget-object v0, Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;->DEFAULT:Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;

    sput-object v0, Lcom/github/kevinsawicki/http/HttpRequest;->CONNECTION_FACTORY:Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/String;)V
    .registers 6
    .param p1, "url"    # Ljava/lang/CharSequence;
    .param p2, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1431
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1395
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 1407
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    .line 1409
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->uncompress:Z

    .line 1411
    const/16 v1, 0x2000

    iput v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    .line 1413
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalSize:J

    .line 1415
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalWritten:J

    .line 1421
    sget-object v1, Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;->DEFAULT:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    iput-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->progress:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    .line 1433
    :try_start_1c
    new-instance v1, Ljava/net/URL;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->url:Ljava/net/URL;
    :try_end_27
    .catch Ljava/net/MalformedURLException; {:try_start_1c .. :try_end_27} :catch_2a

    .line 1437
    iput-object p2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->requestMethod:Ljava/lang/String;

    .line 1438
    return-void

    .line 1434
    :catch_2a
    move-exception v0

    .line 1435
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public constructor <init>(Ljava/net/URL;Ljava/lang/String;)V
    .registers 5
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1448
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1395
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 1407
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    .line 1409
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->uncompress:Z

    .line 1411
    const/16 v0, 0x2000

    iput v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    .line 1413
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalSize:J

    .line 1415
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalWritten:J

    .line 1421
    sget-object v0, Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;->DEFAULT:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    iput-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->progress:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    .line 1449
    iput-object p1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->url:Ljava/net/URL;

    .line 1450
    iput-object p2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->requestMethod:Ljava/lang/String;

    .line 1451
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-static {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/github/kevinsawicki/http/HttpRequest;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/kevinsawicki/http/HttpRequest;

    .prologue
    .line 96
    iget v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    return v0
.end method

.method static synthetic access$200(Lcom/github/kevinsawicki/http/HttpRequest;)J
    .registers 3
    .param p0, "x0"    # Lcom/github/kevinsawicki/http/HttpRequest;

    .prologue
    .line 96
    iget-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalWritten:J

    return-wide v0
.end method

.method static synthetic access$214(Lcom/github/kevinsawicki/http/HttpRequest;J)J
    .registers 5
    .param p0, "x0"    # Lcom/github/kevinsawicki/http/HttpRequest;
    .param p1, "x1"    # J

    .prologue
    .line 96
    iget-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalWritten:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalWritten:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/github/kevinsawicki/http/HttpRequest;)J
    .registers 3
    .param p0, "x0"    # Lcom/github/kevinsawicki/http/HttpRequest;

    .prologue
    .line 96
    iget-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalSize:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/github/kevinsawicki/http/HttpRequest;)Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;
    .registers 2
    .param p0, "x0"    # Lcom/github/kevinsawicki/http/HttpRequest;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->progress:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    return-object v0
.end method

.method private static addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 7
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v4, 0x3f

    const/16 v3, 0x26

    .line 326
    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 327
    .local v1, "queryStart":I
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .line 328
    .local v0, "lastChar":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_15

    .line 329
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 332
    :cond_14
    :goto_14
    return-object p1

    .line 330
    :cond_15
    if-ge v1, v0, :cond_14

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v3, :cond_14

    .line 331
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_14
.end method

.method private static addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/String;
    .param p1, "result"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v2, 0x2f

    .line 318
    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-ne v0, v1, :cond_13

    .line 319
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 320
    :cond_13
    return-object p1
.end method

.method public static append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;
    .registers 9
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    const/16 v6, 0x3d

    .line 855
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 856
    .local v0, "baseUrl":Ljava/lang/String;
    if-eqz p1, :cond_e

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_f

    .line 884
    .end local v0    # "baseUrl":Ljava/lang/String;
    :cond_e
    :goto_e
    return-object v0

    .line 859
    .restart local v0    # "baseUrl":Ljava/lang/String;
    :cond_f
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 861
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-static {v0, v3}, Lcom/github/kevinsawicki/http/HttpRequest;->addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 862
    invoke-static {v0, v3}, Lcom/github/kevinsawicki/http/HttpRequest;->addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 866
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 867
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 868
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 869
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 870
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 871
    .local v4, "value":Ljava/lang/Object;
    if-eqz v4, :cond_3f

    .line 872
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 874
    :cond_3f
    :goto_3f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_68

    .line 875
    const/16 v5, 0x26

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 876
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    check-cast v1, Ljava/util/Map$Entry;

    .line 877
    .restart local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 878
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 879
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 880
    if-eqz v4, :cond_3f

    .line 881
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_3f

    .line 884
    :cond_68
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method public static varargs append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 8
    .param p0, "url"    # Ljava/lang/CharSequence;
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/16 v5, 0x3d

    .line 899
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 900
    .local v0, "baseUrl":Ljava/lang/String;
    if-eqz p1, :cond_b

    array-length v4, p1

    if-nez v4, :cond_c

    .line 928
    .end local v0    # "baseUrl":Ljava/lang/String;
    :cond_b
    :goto_b
    return-object v0

    .line 903
    .restart local v0    # "baseUrl":Ljava/lang/String;
    :cond_c
    array-length v4, p1

    rem-int/lit8 v4, v4, 0x2

    if-eqz v4, :cond_19

    .line 904
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Must specify an even number of parameter names/values"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 907
    :cond_19
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 909
    .local v2, "result":Ljava/lang/StringBuilder;
    invoke-static {v0, v2}, Lcom/github/kevinsawicki/http/HttpRequest;->addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 910
    invoke-static {v0, v2}, Lcom/github/kevinsawicki/http/HttpRequest;->addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 913
    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 914
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 915
    const/4 v4, 0x1

    aget-object v3, p1, v4

    .line 916
    .local v3, "value":Ljava/lang/Object;
    if-eqz v3, :cond_35

    .line 917
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 919
    :cond_35
    const/4 v1, 0x2

    .local v1, "i":I
    :goto_36
    array-length v4, p1

    if-ge v1, v4, :cond_52

    .line 920
    const/16 v4, 0x26

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 921
    aget-object v4, p1, v1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 922
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 923
    add-int/lit8 v4, v1, 0x1

    aget-object v3, p1, v4

    .line 924
    if-eqz v3, :cond_4f

    .line 925
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 919
    :cond_4f
    add-int/lit8 v1, v1, 0x2

    goto :goto_36

    .line 928
    :cond_52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method private createConnection()Ljava/net/HttpURLConnection;
    .registers 6

    .prologue
    .line 1460
    :try_start_0
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->httpProxyHost:Ljava/lang/String;

    if-eqz v2, :cond_16

    .line 1461
    sget-object v2, Lcom/github/kevinsawicki/http/HttpRequest;->CONNECTION_FACTORY:Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;

    iget-object v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->url:Ljava/net/URL;

    invoke-direct {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->createProxy()Ljava/net/Proxy;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;->create(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 1464
    .local v0, "connection":Ljava/net/HttpURLConnection;
    :goto_10
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->requestMethod:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1465
    return-object v0

    .line 1463
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    :cond_16
    sget-object v2, Lcom/github/kevinsawicki/http/HttpRequest;->CONNECTION_FACTORY:Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;

    iget-object v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->url:Ljava/net/URL;

    invoke-interface {v2, v3}, Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;->create(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1d} :catch_1f

    move-result-object v0

    .restart local v0    # "connection":Ljava/net/HttpURLConnection;
    goto :goto_10

    .line 1466
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    :catch_1f
    move-exception v1

    .line 1467
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v1}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method private createProxy()Ljava/net/Proxy;
    .registers 6

    .prologue
    .line 1454
    new-instance v0, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    new-instance v2, Ljava/net/InetSocketAddress;

    iget-object v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->httpProxyHost:Ljava/lang/String;

    iget v4, p0, Lcom/github/kevinsawicki/http/HttpRequest;->httpProxyPort:I

    invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    return-object v0
.end method

.method public static delete(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1132
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "DELETE"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static delete(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1162
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1163
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->delete(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs delete(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1183
    invoke-static {p0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1184
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->delete(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static delete(Ljava/net/URL;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1143
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "DELETE"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static encode(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 13
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 819
    :try_start_0
    new-instance v10, Ljava/net/URL;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v10, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_7c

    .line 824
    .local v10, "parsed":Ljava/net/URL;
    invoke-virtual {v10}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 825
    .local v2, "host":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/net/URL;->getPort()I

    move-result v11

    .line 826
    .local v11, "port":I
    const/4 v0, -0x1

    if-eq v11, v0, :cond_2f

    .line 827
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 830
    :cond_2f
    :try_start_2f
    new-instance v0, Ljava/net/URI;

    invoke-virtual {v10}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v7

    .line 832
    .local v7, "encoded":Ljava/lang/String;
    const/16 v0, 0x3f

    invoke-virtual {v7, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    .line 833
    .local v9, "paramsStart":I
    if-lez v9, :cond_7b

    add-int/lit8 v0, v9, 0x1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_7b

    .line 834
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    add-int/lit8 v3, v9, 0x1

    invoke-virtual {v7, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, v9, 0x1

    invoke-virtual {v7, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "+"

    const-string v4, "%2B"

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_7a
    .catch Ljava/net/URISyntaxException; {:try_start_2f .. :try_end_7a} :catch_83

    move-result-object v7

    .line 836
    :cond_7b
    return-object v7

    .line 820
    .end local v2    # "host":Ljava/lang/String;
    .end local v7    # "encoded":Ljava/lang/String;
    .end local v9    # "paramsStart":I
    .end local v10    # "parsed":Ljava/net/URL;
    .end local v11    # "port":I
    :catch_7c
    move-exception v6

    .line 821
    .local v6, "e":Ljava/io/IOException;
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v0, v6}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0

    .line 837
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v2    # "host":Ljava/lang/String;
    .restart local v10    # "parsed":Ljava/net/URL;
    .restart local v11    # "port":I
    :catch_83
    move-exception v6

    .line 838
    .local v6, "e":Ljava/net/URISyntaxException;
    new-instance v8, Ljava/io/IOException;

    const-string v0, "Parsing URI failed"

    invoke-direct {v8, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 839
    .local v8, "io":Ljava/io/IOException;
    invoke-virtual {v8, v6}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 840
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v0, v8}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public static get(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 940
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "GET"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static get(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 970
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 971
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->get(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs get(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 991
    invoke-static {p0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 992
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->get(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static get(Ljava/net/URL;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 951
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "GET"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getTrustedFactory()Ljavax/net/ssl/SSLSocketFactory;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 270
    sget-object v4, Lcom/github/kevinsawicki/http/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v4, :cond_24

    .line 271
    const/4 v4, 0x1

    new-array v3, v4, [Ljavax/net/ssl/TrustManager;

    const/4 v4, 0x0

    new-instance v5, Lcom/github/kevinsawicki/http/HttpRequest$1;

    invoke-direct {v5}, Lcom/github/kevinsawicki/http/HttpRequest$1;-><init>()V

    aput-object v5, v3, v4

    .line 286
    .local v3, "trustAllCerts":[Ljavax/net/ssl/TrustManager;
    :try_start_f
    const-string v4, "TLS"

    invoke-static {v4}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 287
    .local v0, "context":Ljavax/net/ssl/SSLContext;
    const/4 v4, 0x0

    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v0, v4, v3, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 288
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v4

    sput-object v4, Lcom/github/kevinsawicki/http/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_24
    .catch Ljava/security/GeneralSecurityException; {:try_start_f .. :try_end_24} :catch_27

    .line 297
    :cond_24
    sget-object v4, Lcom/github/kevinsawicki/http/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    return-object v4

    .line 289
    .end local v0    # "context":Ljavax/net/ssl/SSLContext;
    :catch_27
    move-exception v1

    .line 290
    .local v1, "e":Ljava/security/GeneralSecurityException;
    new-instance v2, Ljava/io/IOException;

    const-string v4, "Security exception configuring SSL context"

    invoke-direct {v2, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 292
    .local v2, "ioException":Ljava/io/IOException;
    invoke-virtual {v2, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 293
    new-instance v4, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v4, v2}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v4
.end method

.method private static getTrustedVerifier()Ljavax/net/ssl/HostnameVerifier;
    .registers 1

    .prologue
    .line 301
    sget-object v0, Lcom/github/kevinsawicki/http/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    if-nez v0, :cond_b

    .line 302
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$2;

    invoke-direct {v0}, Lcom/github/kevinsawicki/http/HttpRequest$2;-><init>()V

    sput-object v0, Lcom/github/kevinsawicki/http/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    .line 309
    :cond_b
    sget-object v0, Lcom/github/kevinsawicki/http/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method private static getValidCharset(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "charset"    # Ljava/lang/String;

    .prologue
    .line 262
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_9

    .line 265
    .end local p0    # "charset":Ljava/lang/String;
    :goto_8
    return-object p0

    .restart local p0    # "charset":Ljava/lang/String;
    :cond_9
    const-string p0, "UTF-8"

    goto :goto_8
.end method

.method public static head(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1196
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "HEAD"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static head(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1226
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1227
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->head(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs head(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1247
    invoke-static {p0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1248
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->head(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static head(Ljava/net/URL;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1207
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "HEAD"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method private incrementTotalSize(J)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 7
    .param p1, "size"    # J

    .prologue
    .line 2630
    iget-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalSize:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_c

    .line 2631
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalSize:J

    .line 2632
    :cond_c
    iget-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalSize:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->totalSize:J

    .line 2633
    return-object p0
.end method

.method public static keepAlive(Z)V
    .registers 3
    .param p0, "keepAlive"    # Z

    .prologue
    .line 1305
    const-string v0, "http.keepAlive"

    invoke-static {p0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1306
    return-void
.end method

.method public static maxConnections(I)V
    .registers 3
    .param p0, "maxConnections"    # I

    .prologue
    .line 1316
    const-string v0, "http.maxConnections"

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1317
    return-void
.end method

.method public static varargs nonProxyHosts([Ljava/lang/String;)V
    .registers 6
    .param p0, "hosts"    # [Ljava/lang/String;

    .prologue
    .line 1356
    if-eqz p0, :cond_2d

    array-length v3, p0

    if-lez v3, :cond_2d

    .line 1357
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1358
    .local v2, "separated":Ljava/lang/StringBuilder;
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1359
    .local v1, "last":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    if-ge v0, v1, :cond_1e

    .line 1360
    aget-object v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x7c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1359
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 1361
    :cond_1e
    aget-object v3, p0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1362
    const-string v3, "http.nonProxyHosts"

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/github/kevinsawicki/http/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1365
    .end local v0    # "i":I
    .end local v1    # "last":I
    .end local v2    # "separated":Ljava/lang/StringBuilder;
    :goto_2c
    return-void

    .line 1364
    :cond_2d
    const-string v3, "http.nonProxyHosts"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/github/kevinsawicki/http/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_2c
.end method

.method public static options(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1260
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "OPTIONS"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static options(Ljava/net/URL;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1271
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "OPTIONS"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static post(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1004
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "POST"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static post(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1034
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1035
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->post(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs post(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1055
    invoke-static {p0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1056
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->post(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static post(Ljava/net/URL;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1015
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "POST"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static proxyHost(Ljava/lang/String;)V
    .registers 2
    .param p0, "host"    # Ljava/lang/String;

    .prologue
    .line 1328
    const-string v0, "http.proxyHost"

    invoke-static {v0, p0}, Lcom/github/kevinsawicki/http/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1329
    const-string v0, "https.proxyHost"

    invoke-static {v0, p0}, Lcom/github/kevinsawicki/http/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1330
    return-void
.end method

.method public static proxyPort(I)V
    .registers 3
    .param p0, "port"    # I

    .prologue
    .line 1341
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 1342
    .local v0, "portValue":Ljava/lang/String;
    const-string v1, "http.proxyPort"

    invoke-static {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1343
    const-string v1, "https.proxyPort"

    invoke-static {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1344
    return-void
.end method

.method public static put(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1068
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "PUT"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static put(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p2, "encode"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map",
            "<**>;Z)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 1098
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1099
    .local v0, "url":Ljava/lang/String;
    if-eqz p2, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->put(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static varargs put(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p0, "baseUrl"    # Ljava/lang/CharSequence;
    .param p1, "encode"    # Z
    .param p2, "params"    # [Ljava/lang/Object;

    .prologue
    .line 1119
    invoke-static {p0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1120
    .local v0, "url":Ljava/lang/String;
    if-eqz p1, :cond_a

    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "url":Ljava/lang/String;
    :cond_a
    invoke-static {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->put(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public static put(Ljava/net/URL;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1079
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "PUT"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static setConnectionFactory(Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;)V
    .registers 2
    .param p0, "connectionFactory"    # Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;

    .prologue
    .line 376
    if-nez p0, :cond_7

    .line 377
    sget-object v0, Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;->DEFAULT:Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;

    sput-object v0, Lcom/github/kevinsawicki/http/HttpRequest;->CONNECTION_FACTORY:Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;

    .line 380
    :goto_6
    return-void

    .line 379
    :cond_7
    sput-object p0, Lcom/github/kevinsawicki/http/HttpRequest;->CONNECTION_FACTORY:Lcom/github/kevinsawicki/http/HttpRequest$ConnectionFactory;

    goto :goto_6
.end method

.method private static setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1378
    if-eqz p1, :cond_e

    .line 1379
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$3;

    invoke-direct {v0, p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest$3;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1392
    .local v0, "action":Ljava/security/PrivilegedAction;, "Ljava/security/PrivilegedAction<Ljava/lang/String;>;"
    :goto_7
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 1386
    .end local v0    # "action":Ljava/security/PrivilegedAction;, "Ljava/security/PrivilegedAction<Ljava/lang/String;>;"
    :cond_e
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$4;

    invoke-direct {v0, p0}, Lcom/github/kevinsawicki/http/HttpRequest$4;-><init>(Ljava/lang/String;)V

    .restart local v0    # "action":Ljava/security/PrivilegedAction;, "Ljava/security/PrivilegedAction<Ljava/lang/String;>;"
    goto :goto_7
.end method

.method public static trace(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1283
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "TRACE"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static trace(Ljava/net/URL;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1294
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest;

    const-string v1, "TRACE"

    invoke-direct {v0, p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "accept"    # Ljava/lang/String;

    .prologue
    .line 2551
    const-string v0, "Accept"

    invoke-virtual {p0, v0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptCharset(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "acceptCharset"    # Ljava/lang/String;

    .prologue
    .line 2340
    const-string v0, "Accept-Charset"

    invoke-virtual {p0, v0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptEncoding(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "acceptEncoding"    # Ljava/lang/String;

    .prologue
    .line 2320
    const-string v0, "Accept-Encoding"

    invoke-virtual {p0, v0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptGzipEncoding()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 2

    .prologue
    .line 2330
    const-string v0, "gzip"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->acceptEncoding(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptJson()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 2

    .prologue
    .line 2560
    const-string v0, "application/json"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->accept(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public authorization(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "authorization"    # Ljava/lang/String;

    .prologue
    .line 2422
    const-string v0, "Authorization"

    invoke-virtual {p0, v0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public badRequest()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1587
    const/16 v0, 0x190

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public basic(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 2444
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Basic "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/kevinsawicki/http/HttpRequest$Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->authorization(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public body(Ljava/util/concurrent/atomic/AtomicReference;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1751
    .local p1, "output":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->body()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1752
    return-object p0
.end method

.method public body(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1765
    .local p1, "output":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/String;>;"
    invoke-virtual {p0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1766
    return-object p0
.end method

.method public body()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1739
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public body(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1722
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->byteStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v1

    .line 1724
    .local v1, "output":Ljava/io/ByteArrayOutputStream;
    :try_start_4
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;

    .line 1725
    invoke-static {p1}, Lcom/github/kevinsawicki/http/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_12} :catch_14

    move-result-object v2

    return-object v2

    .line 1726
    :catch_14
    move-exception v0

    .line 1727
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public buffer()Ljava/io/BufferedInputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1804
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->stream()Ljava/io/InputStream;

    move-result-object v1

    iget v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    return-object v0
.end method

.method public bufferSize()I
    .registers 2

    .prologue
    .line 1672
    iget v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    return v0
.end method

.method public bufferSize(I)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 1658
    const/4 v0, 0x1

    if-ge p1, v0, :cond_b

    .line 1659
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Size must be greater than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1660
    :cond_b
    iput p1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    .line 1661
    return-object p0
.end method

.method public bufferedReader()Ljava/io/BufferedReader;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1898
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->bufferedReader(Ljava/lang/String;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public bufferedReader(Ljava/lang/String;)Ljava/io/BufferedReader;
    .registers 5
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1886
    new-instance v0, Ljava/io/BufferedReader;

    invoke-virtual {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->reader(Ljava/lang/String;)Ljava/io/InputStreamReader;

    move-result-object v1

    iget v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    return-object v0
.end method

.method protected byteStream()Ljava/io/ByteArrayOutputStream;
    .registers 3

    .prologue
    .line 1704
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->contentLength()I

    move-result v0

    .line 1705
    .local v0, "size":I
    if-lez v0, :cond_c

    .line 1706
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1708
    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    goto :goto_b
.end method

.method public bytes()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1787
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->byteStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v1

    .line 1789
    .local v1, "output":Ljava/io/ByteArrayOutputStream;
    :try_start_4
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_b} :catch_10

    .line 1793
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 1790
    :catch_10
    move-exception v0

    .line 1791
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public cacheControl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2376
    const-string v0, "Cache-Control"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public charset()Ljava/lang/String;
    .registers 3

    .prologue
    .line 2279
    const-string v0, "Content-Type"

    const-string v1, "charset"

    invoke-virtual {p0, v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->parameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public chunk(I)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 1642
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 1643
    return-object p0
.end method

.method protected closeOutput()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 2644
    invoke-virtual {p0, v2}, Lcom/github/kevinsawicki/http/HttpRequest;->progress(Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;)Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2645
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    if-nez v0, :cond_9

    .line 2658
    :goto_8
    return-object p0

    .line 2647
    :cond_9
    iget-boolean v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->multipart:Z

    if-eqz v0, :cond_14

    .line 2648
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    const-string v1, "\r\n--00content0boundary00--\r\n"

    invoke-virtual {v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    .line 2649
    :cond_14
    iget-boolean v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    if-eqz v0, :cond_20

    .line 2651
    :try_start_18
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-virtual {v0}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->close()V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1d} :catch_26

    .line 2657
    :goto_1d
    iput-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    goto :goto_8

    .line 2656
    :cond_20
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-virtual {v0}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->close()V

    goto :goto_1d

    .line 2652
    :catch_26
    move-exception v0

    goto :goto_1d
.end method

.method protected closeOutputQuietly()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2670
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->closeOutput()Lcom/github/kevinsawicki/http/HttpRequest;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 2671
    :catch_5
    move-exception v0

    .line 2672
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public code()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1519
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->closeOutput()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 1520
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_a} :catch_c

    move-result v1

    return v1

    .line 1521
    :catch_c
    move-exception v0

    .line 1522
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public code(Ljava/util/concurrent/atomic/AtomicInteger;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "output"    # Ljava/util/concurrent/atomic/AtomicInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1536
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 1537
    return-object p0
.end method

.method public connectTimeout(I)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "timeout"    # I

    .prologue
    .line 2014
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 2015
    return-object p0
.end method

.method public contentEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2349
    const-string v0, "Content-Encoding"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public contentLength()I
    .registers 2

    .prologue
    .line 2520
    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->intHeader(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public contentLength(I)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "contentLength"    # I

    .prologue
    .line 2540
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 2541
    return-object p0
.end method

.method public contentLength(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "contentLength"    # Ljava/lang/String;

    .prologue
    .line 2530
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->contentLength(I)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public contentType(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 2487
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 7
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;

    .prologue
    .line 2498
    if-eqz p2, :cond_28

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_28

    .line 2499
    const-string v0, "; charset="

    .line 2500
    .local v0, "separator":Ljava/lang/String;
    const-string v1, "Content-Type"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; charset="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    .line 2502
    .end local v0    # "separator":Ljava/lang/String;
    :goto_27
    return-object v1

    :cond_28
    const-string v1, "Content-Type"

    invoke-virtual {p0, v1, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    goto :goto_27
.end method

.method public contentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2511
    const-string v0, "Content-Type"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 9
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2573
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$8;

    iget-boolean v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    move-object v1, p0

    move-object v2, p1

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/github/kevinsawicki/http/HttpRequest$8;-><init>(Lcom/github/kevinsawicki/http/HttpRequest;Ljava/io/Closeable;ZLjava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v0}, Lcom/github/kevinsawicki/http/HttpRequest$8;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/kevinsawicki/http/HttpRequest;

    return-object v0
.end method

.method protected copy(Ljava/io/Reader;Ljava/io/Writer;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 9
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "output"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2599
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$9;

    iget-boolean v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    move-object v1, p0

    move-object v2, p1

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/github/kevinsawicki/http/HttpRequest$9;-><init>(Lcom/github/kevinsawicki/http/HttpRequest;Ljava/io/Closeable;ZLjava/io/Reader;Ljava/io/Writer;)V

    invoke-virtual {v0}, Lcom/github/kevinsawicki/http/HttpRequest$9;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/kevinsawicki/http/HttpRequest;

    return-object v0
.end method

.method public created()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1557
    const/16 v0, 0xc9

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public date()J
    .registers 3

    .prologue
    .line 2367
    const-string v0, "Date"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public dateHeader(Ljava/lang/String;)J
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2097
    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->dateHeader(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public dateHeader(Ljava/lang/String;J)J
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2111
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->closeOutputQuietly()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2112
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/net/HttpURLConnection;->getHeaderFieldDate(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public disconnect()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 2

    .prologue
    .line 1631
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 1632
    return-object p0
.end method

.method public eTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2385
    const-string v0, "ETag"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public expires()J
    .registers 3

    .prologue
    .line 2394
    const-string v0, "Expires"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public followRedirects(Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "followRedirects"    # Z

    .prologue
    .line 3216
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 3217
    return-object p0
.end method

.method public form(Ljava/lang/Object;Ljava/lang/Object;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3087
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, p2, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 8
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 3104
    iget-boolean v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->form:Z

    if-nez v3, :cond_43

    move v1, v2

    .line 3105
    .local v1, "first":Z
    :goto_6
    if-eqz v1, :cond_f

    .line 3106
    const-string v3, "application/x-www-form-urlencoded"

    invoke-virtual {p0, v3, p3}, Lcom/github/kevinsawicki/http/HttpRequest;->contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    .line 3107
    iput-boolean v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->form:Z

    .line 3109
    :cond_f
    invoke-static {p3}, Lcom/github/kevinsawicki/http/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 3111
    :try_start_13
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->openOutput()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 3112
    if-nez v1, :cond_1f

    .line 3113
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    const/16 v3, 0x26

    invoke-virtual {v2, v3}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(I)V

    .line 3114
    :cond_1f
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    .line 3115
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    const/16 v3, 0x3d

    invoke-virtual {v2, v3}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(I)V

    .line 3116
    if-eqz p2, :cond_42

    .line 3117
    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_42} :catch_45

    .line 3121
    :cond_42
    return-object p0

    .line 3104
    .end local v1    # "first":Z
    :cond_43
    const/4 v1, 0x0

    goto :goto_6

    .line 3118
    .restart local v1    # "first":Z
    :catch_45
    move-exception v0

    .line 3119
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public form(Ljava/util/Map$Entry;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<**>;)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3055
    .local p1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<**>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3071
    .local p1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public form(Ljava/util/Map;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<**>;)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3041
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<**>;"
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->form(Ljava/util/Map;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public form(Ljava/util/Map;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 6
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<**>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3134
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1e

    .line 3135
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 3136
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-virtual {p0, v0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    goto :goto_e

    .line 3137
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1e
    return-object p0
.end method

.method public getConnection()Ljava/net/HttpURLConnection;
    .registers 2

    .prologue
    .line 1482
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_a

    .line 1483
    invoke-direct {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->createConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 1484
    :cond_a
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    return-object v0
.end method

.method protected getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "paramName"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x22

    const/4 v6, 0x0

    const/16 v9, 0x3b

    const/4 v8, -0x1

    .line 2238
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_10

    :cond_e
    move-object v3, v6

    .line 2270
    :cond_f
    :goto_f
    return-object v3

    .line 2241
    :cond_10
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2242
    .local v1, "length":I
    invoke-virtual {p1, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    add-int/lit8 v4, v7, 0x1

    .line 2243
    .local v4, "start":I
    if-eqz v4, :cond_1e

    if-ne v4, v1, :cond_20

    :cond_1e
    move-object v3, v6

    .line 2244
    goto :goto_f

    .line 2246
    :cond_20
    invoke-virtual {p1, v9, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 2247
    .local v0, "end":I
    if-ne v0, v8, :cond_27

    .line 2248
    move v0, v1

    .line 2250
    :cond_27
    :goto_27
    if-ge v4, v0, :cond_75

    .line 2251
    const/16 v7, 0x3d

    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 2252
    .local v2, "nameEnd":I
    if-eq v2, v8, :cond_6b

    if-ge v2, v0, :cond_6b

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6b

    .line 2254
    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 2255
    .local v3, "paramValue":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    .line 2256
    .local v5, "valueLength":I
    if-eqz v5, :cond_6b

    .line 2257
    const/4 v6, 0x2

    if-le v5, v6, :cond_f

    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v10, v6, :cond_f

    add-int/lit8 v6, v5, -0x1

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v10, v6, :cond_f

    .line 2259
    const/4 v6, 0x1

    add-int/lit8 v7, v5, -0x1

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_f

    .line 2264
    .end local v3    # "paramValue":Ljava/lang/String;
    .end local v5    # "valueLength":I
    :cond_6b
    add-int/lit8 v4, v0, 0x1

    .line 2265
    invoke-virtual {p1, v9, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 2266
    if-ne v0, v8, :cond_27

    .line 2267
    move v0, v1

    goto :goto_27

    .end local v2    # "nameEnd":I
    :cond_75
    move-object v3, v6

    .line 2270
    goto :goto_f
.end method

.method protected getParams(Ljava/lang/String;)Ljava/util/Map;
    .registers 15
    .param p1, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v12, 0x22

    const/16 v11, 0x3b

    const/4 v10, -0x1

    .line 2192
    if-eqz p1, :cond_d

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_12

    .line 2193
    :cond_d
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v5

    .line 2227
    :cond_11
    :goto_11
    return-object v5

    .line 2195
    :cond_12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2196
    .local v1, "headerLength":I
    invoke-virtual {p1, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    add-int/lit8 v6, v8, 0x1

    .line 2197
    .local v6, "start":I
    if-eqz v6, :cond_20

    if-ne v6, v1, :cond_25

    .line 2198
    :cond_20
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v5

    goto :goto_11

    .line 2200
    :cond_25
    invoke-virtual {p1, v11, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 2201
    .local v0, "end":I
    if-ne v0, v10, :cond_2c

    .line 2202
    move v0, v1

    .line 2204
    :cond_2c
    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    .line 2205
    .local v5, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_31
    :goto_31
    if-ge v6, v0, :cond_11

    .line 2206
    const/16 v8, 0x3d

    invoke-virtual {p1, v8, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 2207
    .local v4, "nameEnd":I
    if-eq v4, v10, :cond_77

    if-ge v4, v0, :cond_77

    .line 2208
    invoke-virtual {p1, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 2209
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_77

    .line 2210
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 2211
    .local v7, "value":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v2

    .line 2212
    .local v2, "length":I
    if-eqz v2, :cond_77

    .line 2213
    const/4 v8, 0x2

    if-le v2, v8, :cond_81

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v12, v8, :cond_81

    add-int/lit8 v8, v2, -0x1

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v12, v8, :cond_81

    .line 2215
    const/4 v8, 0x1

    add-int/lit8 v9, v2, -0x1

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2221
    .end local v2    # "length":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :cond_77
    :goto_77
    add-int/lit8 v6, v0, 0x1

    .line 2222
    invoke-virtual {p1, v11, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 2223
    if-ne v0, v10, :cond_31

    .line 2224
    move v0, v1

    goto :goto_31

    .line 2217
    .restart local v2    # "length":I
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v7    # "value":Ljava/lang/String;
    :cond_81
    invoke-interface {v5, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_77
.end method

.method public header(Ljava/lang/String;Ljava/lang/Number;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Number;

    .prologue
    .line 2038
    if-eqz p2, :cond_b

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_6
    invoke-virtual {p0, p1, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 2026
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 2027
    return-object p0
.end method

.method public header(Ljava/util/Map$Entry;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 2062
    .local p1, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2073
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->closeOutputQuietly()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2074
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public headers(Ljava/util/Map;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/github/kevinsawicki/http/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 2049
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1e

    .line 2050
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 2051
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/util/Map$Entry;)Lcom/github/kevinsawicki/http/HttpRequest;

    goto :goto_e

    .line 2052
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1e
    return-object p0
.end method

.method public headers()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2084
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->closeOutputQuietly()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2085
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public headers(Ljava/lang/String;)[Ljava/lang/String;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2150
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->headers()Ljava/util/Map;

    move-result-object v0

    .line 2151
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-eqz v0, :cond_c

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 2152
    :cond_c
    sget-object v2, Lcom/github/kevinsawicki/http/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    .line 2158
    :goto_e
    return-object v2

    .line 2154
    :cond_f
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 2155
    .local v1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_2a

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2a

    .line 2156
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    goto :goto_e

    .line 2158
    :cond_2a
    sget-object v2, Lcom/github/kevinsawicki/http/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    goto :goto_e
.end method

.method public ifModifiedSince(J)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "ifModifiedSince"    # J

    .prologue
    .line 2466
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setIfModifiedSince(J)V

    .line 2467
    return-object p0
.end method

.method public ifNoneMatch(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "ifNoneMatch"    # Ljava/lang/String;

    .prologue
    .line 2477
    const-string v0, "If-None-Match"

    invoke-virtual {p0, v0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public ignoreCloseExceptions(Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 2
    .param p1, "ignore"    # Z

    .prologue
    .line 1497
    iput-boolean p1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    .line 1498
    return-object p0
.end method

.method public ignoreCloseExceptions()Z
    .registers 2

    .prologue
    .line 1508
    iget-boolean v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    return v0
.end method

.method public intHeader(Ljava/lang/String;)I
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2124
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->intHeader(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public intHeader(Ljava/lang/String;I)I
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2139
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->closeOutputQuietly()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2140
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->getHeaderFieldInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public isBodyEmpty()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1777
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->contentLength()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public lastModified()J
    .registers 3

    .prologue
    .line 2403
    const-string v0, "Last-Modified"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public location()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2412
    const-string v0, "Location"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public message()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1618
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->closeOutput()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 1619
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_a} :catch_c

    move-result-object v1

    return-object v1

    .line 1620
    :catch_c
    move-exception v0

    .line 1621
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public method()Ljava/lang/String;
    .registers 2

    .prologue
    .line 3188
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public noContent()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1567
    const/16 v0, 0xcc

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public notFound()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1597
    const/16 v0, 0x194

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public notModified()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1607
    const/16 v0, 0x130

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public ok()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1547
    const/16 v0, 0xc8

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected openOutput()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2683
    iget-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    if-eqz v1, :cond_5

    .line 2690
    :goto_4
    return-object p0

    .line 2685
    :cond_5
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 2686
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v1

    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "charset"

    invoke-virtual {p0, v1, v2}, Lcom/github/kevinsawicki/http/HttpRequest;->getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2688
    .local v0, "charset":Ljava/lang/String;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iget v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    invoke-direct {v1, v2, v0, v3}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    goto :goto_4
.end method

.method public parameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "paramName"    # Ljava/lang/String;

    .prologue
    .line 2169
    invoke-virtual {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public parameters(Ljava/lang/String;)Ljava/util/Map;
    .registers 3
    .param p1, "headerName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2182
    invoke-virtual {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->getParams(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/io/File;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2829
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/io/InputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 2879
    invoke-virtual {p0, p1, v0, v0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/Number;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2802
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Number;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part"    # Ljava/lang/String;

    .prologue
    .line 2752
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "part"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2843
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/github/kevinsawicki/http/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Number;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "part"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2816
    if-eqz p3, :cond_b

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_6
    invoke-virtual {p0, p1, p2, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "part"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2766
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/github/kevinsawicki/http/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "part"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2861
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2862
    .local v1, "stream":Ljava/io/InputStream;
    invoke-virtual {p4}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/github/kevinsawicki/http/HttpRequest;->incrementTotalSize(J)Lcom/github/kevinsawicki/http/HttpRequest;
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_11} :catch_16

    .line 2866
    invoke-virtual {p0, p1, p2, p3, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v2

    return-object v2

    .line 2863
    .end local v1    # "stream":Ljava/io/InputStream;
    :catch_16
    move-exception v0

    .line 2864
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "part"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2897
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->startPart()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2898
    invoke-virtual {p0, p1, p2, p3}, Lcom/github/kevinsawicki/http/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2899
    iget-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-virtual {p0, p4, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b} :catch_c

    .line 2903
    return-object p0

    .line 2900
    :catch_c
    move-exception v0

    .line 2901
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "part"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2783
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->startPart()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2784
    invoke-virtual {p0, p1, p2, p3}, Lcom/github/kevinsawicki/http/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2785
    iget-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-virtual {v1, p4}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b} :catch_c

    .line 2789
    return-object p0

    .line 2786
    :catch_c
    move-exception v0

    .line 2787
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2916
    invoke-virtual {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/github/kevinsawicki/http/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public progress(Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "callback"    # Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    .prologue
    .line 2622
    if-nez p1, :cond_7

    .line 2623
    sget-object v0, Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;->DEFAULT:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    iput-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->progress:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    .line 2626
    :goto_6
    return-object p0

    .line 2625
    :cond_7
    iput-object p1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->progress:Lcom/github/kevinsawicki/http/HttpRequest$UploadProgress;

    goto :goto_6
.end method

.method public proxyAuthorization(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "proxyAuthorization"    # Ljava/lang/String;

    .prologue
    .line 2432
    const-string v0, "Proxy-Authorization"

    invoke-virtual {p0, v0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public proxyBasic(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 2456
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Basic "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/kevinsawicki/http/HttpRequest$Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->proxyAuthorization(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public readTimeout(I)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "timeout"    # I

    .prologue
    .line 2003
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 2004
    return-object p0
.end method

.method public reader()Ljava/io/InputStreamReader;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1871
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->reader(Ljava/lang/String;)Ljava/io/InputStreamReader;

    move-result-object v0

    return-object v0
.end method

.method public reader(Ljava/lang/String;)Ljava/io/InputStreamReader;
    .registers 6
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1857
    :try_start_0
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->stream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {p1}, Lcom/github/kevinsawicki/http/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_d} :catch_e

    return-object v1

    .line 1858
    :catch_e
    move-exception v0

    .line 1859
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public receive(Ljava/io/File;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1911
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->bufferSize:I

    invoke-direct {v1, v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_c
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_c} :catch_1a

    .line 1915
    .local v1, "output":Ljava/io/OutputStream;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$5;

    iget-boolean v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    invoke-direct {v2, p0, v1, v3, v1}, Lcom/github/kevinsawicki/http/HttpRequest$5;-><init>(Lcom/github/kevinsawicki/http/HttpRequest;Ljava/io/Closeable;ZLjava/io/OutputStream;)V

    invoke-virtual {v2}, Lcom/github/kevinsawicki/http/HttpRequest$5;->call()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/kevinsawicki/http/HttpRequest;

    return-object v2

    .line 1912
    .end local v1    # "output":Ljava/io/OutputStream;
    :catch_1a
    move-exception v0

    .line 1913
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public receive(Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1934
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 1935
    :catch_9
    move-exception v0

    .line 1936
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public receive(Ljava/io/PrintStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "output"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1949
    invoke-virtual {p0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->receive(Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public receive(Ljava/io/Writer;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 8
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1986
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->bufferedReader()Ljava/io/BufferedReader;

    move-result-object v2

    .line 1987
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$7;

    iget-boolean v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    move-object v1, p0

    move-object v4, v2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/github/kevinsawicki/http/HttpRequest$7;-><init>(Lcom/github/kevinsawicki/http/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/io/Writer;)V

    invoke-virtual {v0}, Lcom/github/kevinsawicki/http/HttpRequest$7;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/kevinsawicki/http/HttpRequest;

    return-object v0
.end method

.method public receive(Ljava/lang/Appendable;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 8
    .param p1, "appendable"    # Ljava/lang/Appendable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1961
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->bufferedReader()Ljava/io/BufferedReader;

    move-result-object v2

    .line 1962
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Lcom/github/kevinsawicki/http/HttpRequest$6;

    iget-boolean v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->ignoreCloseExceptions:Z

    move-object v1, p0

    move-object v4, v2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/github/kevinsawicki/http/HttpRequest$6;-><init>(Lcom/github/kevinsawicki/http/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/lang/Appendable;)V

    invoke-virtual {v0}, Lcom/github/kevinsawicki/http/HttpRequest$6;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/kevinsawicki/http/HttpRequest;

    return-object v0
.end method

.method public referer(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "referer"    # Ljava/lang/String;

    .prologue
    .line 2299
    const-string v0, "Referer"

    invoke-virtual {p0, v0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public send(Ljava/io/File;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 6
    .param p1, "input"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2929
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2930
    .local v1, "stream":Ljava/io/InputStream;
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/github/kevinsawicki/http/HttpRequest;->incrementTotalSize(J)Lcom/github/kevinsawicki/http/HttpRequest;
    :try_end_11
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_11} :catch_16

    .line 2934
    invoke-virtual {p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->send(Ljava/io/InputStream;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v2

    return-object v2

    .line 2931
    .end local v1    # "stream":Ljava/io/InputStream;
    :catch_16
    move-exception v0

    .line 2932
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public send(Ljava/io/InputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2961
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->openOutput()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2962
    iget-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-virtual {p0, p1, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/github/kevinsawicki/http/HttpRequest;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_8} :catch_9

    .line 2966
    return-object p0

    .line 2963
    :catch_9
    move-exception v0

    .line 2964
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public send(Ljava/io/Reader;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 6
    .param p1, "input"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2980
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->openOutput()Lcom/github/kevinsawicki/http/HttpRequest;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_20

    .line 2984
    new-instance v1, Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    iget-object v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    # getter for: Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->encoder:Ljava/nio/charset/CharsetEncoder;
    invoke-static {v3}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->access$500(Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 2986
    .local v1, "writer":Ljava/io/Writer;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$10;

    invoke-direct {v2, p0, v1, p1, v1}, Lcom/github/kevinsawicki/http/HttpRequest$10;-><init>(Lcom/github/kevinsawicki/http/HttpRequest;Ljava/io/Flushable;Ljava/io/Reader;Ljava/io/Writer;)V

    invoke-virtual {v2}, Lcom/github/kevinsawicki/http/HttpRequest$10;->call()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/kevinsawicki/http/HttpRequest;

    return-object v2

    .line 2981
    .end local v1    # "writer":Ljava/io/Writer;
    :catch_20
    move-exception v0

    .line 2982
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public send(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p1, "value"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3007
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->openOutput()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 3008
    iget-object v1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_c} :catch_d

    .line 3012
    return-object p0

    .line 3009
    :catch_d
    move-exception v0

    .line 3010
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public send([B)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 2945
    if-eqz p1, :cond_7

    .line 2946
    array-length v0, p1

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->incrementTotalSize(J)Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2947
    :cond_7
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->send(Ljava/io/InputStream;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public server()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2358
    const-string v0, "Server"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public serverError()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1577
    const/16 v0, 0x1f4

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected startPart()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2700
    iget-boolean v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->multipart:Z

    if-nez v0, :cond_18

    .line 2701
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->multipart:Z

    .line 2702
    const-string v0, "multipart/form-data; boundary=00content0boundary00"

    invoke-virtual {p0, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->contentType(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/github/kevinsawicki/http/HttpRequest;->openOutput()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2703
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    const-string v1, "--00content0boundary00\r\n"

    invoke-virtual {v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    .line 2706
    :goto_17
    return-object p0

    .line 2705
    :cond_18
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    const-string v1, "\r\n--00content0boundary00\r\n"

    invoke-virtual {v0, v1}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    goto :goto_17
.end method

.method public stream()Ljava/io/InputStream;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 1815
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->code()I

    move-result v2

    const/16 v3, 0x190

    if-ge v2, v3, :cond_28

    .line 1817
    :try_start_8
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_f} :catch_21

    move-result-object v1

    .line 1834
    .local v1, "stream":Ljava/io/InputStream;
    :cond_10
    :goto_10
    iget-boolean v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->uncompress:Z

    if-eqz v2, :cond_20

    const-string v2, "gzip"

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->contentEncoding()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_51

    .line 1838
    .end local v1    # "stream":Ljava/io/InputStream;
    :cond_20
    :goto_20
    return-object v1

    .line 1818
    :catch_21
    move-exception v0

    .line 1819
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2

    .line 1822
    .end local v0    # "e":Ljava/io/IOException;
    :cond_28
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    .line 1823
    .restart local v1    # "stream":Ljava/io/InputStream;
    if-nez v1, :cond_10

    .line 1825
    :try_start_32
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_39} :catch_3b

    move-result-object v1

    goto :goto_10

    .line 1826
    :catch_3b
    move-exception v0

    .line 1827
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->contentLength()I

    move-result v2

    if-lez v2, :cond_48

    .line 1828
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2

    .line 1830
    :cond_48
    new-instance v1, Ljava/io/ByteArrayInputStream;

    .end local v1    # "stream":Ljava/io/InputStream;
    const/4 v2, 0x0

    new-array v2, v2, [B

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .restart local v1    # "stream":Ljava/io/InputStream;
    goto :goto_10

    .line 1838
    .end local v0    # "e":Ljava/io/IOException;
    :cond_51
    :try_start_51
    new-instance v2, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v2, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_56
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_56} :catch_58

    move-object v1, v2

    goto :goto_20

    .line 1839
    :catch_58
    move-exception v0

    .line 1840
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v2, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v2, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1473
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->method()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->url()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trustAllCerts()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3149
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 3150
    .local v0, "connection":Ljava/net/HttpURLConnection;
    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_11

    .line 3151
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    invoke-static {}, Lcom/github/kevinsawicki/http/HttpRequest;->getTrustedFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 3153
    :cond_11
    return-object p0
.end method

.method public trustAllHosts()Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3

    .prologue
    .line 3166
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 3167
    .local v0, "connection":Ljava/net/HttpURLConnection;
    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_11

    .line 3168
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    invoke-static {}, Lcom/github/kevinsawicki/http/HttpRequest;->getTrustedVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 3170
    :cond_11
    return-object p0
.end method

.method public uncompress(Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 2
    .param p1, "uncompress"    # Z

    .prologue
    .line 1694
    iput-boolean p1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->uncompress:Z

    .line 1695
    return-object p0
.end method

.method public url()Ljava/net/URL;
    .registers 2

    .prologue
    .line 3179
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public useCaches(Z)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "useCaches"    # Z

    .prologue
    .line 2309
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 2310
    return-object p0
.end method

.method public useProxy(Ljava/lang/String;I)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 5
    .param p1, "proxyHost"    # Ljava/lang/String;
    .param p2, "proxyPort"    # I

    .prologue
    .line 3200
    iget-object v0, p0, Lcom/github/kevinsawicki/http/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_c

    .line 3201
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The connection has already been created. This method must be called before reading or writing to the request."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3203
    :cond_c
    iput-object p1, p0, Lcom/github/kevinsawicki/http/HttpRequest;->httpProxyHost:Ljava/lang/String;

    .line 3204
    iput p2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->httpProxyPort:I

    .line 3205
    return-object p0
.end method

.method public userAgent(Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 3
    .param p1, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 2289
    const-string v0, "User-Agent"

    invoke-virtual {p0, v0, p1}, Lcom/github/kevinsawicki/http/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method protected writePartHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2719
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/github/kevinsawicki/http/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method protected writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2733
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2734
    .local v0, "partBuffer":Ljava/lang/StringBuilder;
    const-string v1, "form-data; name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2735
    if-eqz p2, :cond_19

    .line 2736
    const-string v1, "\"; filename=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2737
    :cond_19
    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2738
    const-string v1, "Content-Disposition"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/github/kevinsawicki/http/HttpRequest;->partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2739
    if-eqz p3, :cond_2e

    .line 2740
    const-string v1, "Content-Type"

    invoke-virtual {p0, v1, p3}, Lcom/github/kevinsawicki/http/HttpRequest;->partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/github/kevinsawicki/http/HttpRequest;

    .line 2741
    :cond_2e
    const-string v1, "\r\n"

    invoke-virtual {p0, v1}, Lcom/github/kevinsawicki/http/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/github/kevinsawicki/http/HttpRequest;

    move-result-object v1

    return-object v1
.end method

.method public writer()Ljava/io/OutputStreamWriter;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;
        }
    .end annotation

    .prologue
    .line 3023
    :try_start_0
    invoke-virtual {p0}, Lcom/github/kevinsawicki/http/HttpRequest;->openOutput()Lcom/github/kevinsawicki/http/HttpRequest;

    .line 3024
    new-instance v1, Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    iget-object v3, p0, Lcom/github/kevinsawicki/http/HttpRequest;->output:Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;

    # getter for: Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->encoder:Ljava/nio/charset/CharsetEncoder;
    invoke-static {v3}, Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;->access$500(Lcom/github/kevinsawicki/http/HttpRequest$RequestOutputStream;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_14} :catch_15

    return-object v1

    .line 3025
    :catch_15
    move-exception v0

    .line 3026
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/github/kevinsawicki/http/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method
