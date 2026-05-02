.class public Ltk/elevenk/olapi/OpenLibrary;
.super Ljava/lang/Object;
.source "OpenLibrary.java"

# interfaces
.implements Ltk/elevenk/olapi/Library;


# static fields
.field private static final AND_USER_AGENT:Ljava/lang/String; = "Mozilla/5.0 (Android;) DailybRead/0.1"

.field private static final LOGIN_COOKIE_PARAMETER:Ljava/lang/String; = "Cookie"

.field private static api:Ltk/elevenk/olapi/LibraryApi;

.field private static client:Lorg/apache/http/client/HttpClient;


# instance fields
.field private cancelled:Z

.field private preferences:Ltk/elevenk/olapi/data/LibraryPreferences;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 259
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 261
    return-void
.end method

.method private constructor <init>(Ltk/elevenk/olapi/LibraryApi;Ltk/elevenk/olapi/data/LibraryPreferences;)V
    .registers 3
    .param p1, "lapi"    # Ltk/elevenk/olapi/LibraryApi;
    .param p2, "preferences"    # Ltk/elevenk/olapi/data/LibraryPreferences;

    .prologue
    .line 264
    invoke-direct {p0}, Ltk/elevenk/olapi/OpenLibrary;-><init>()V

    .line 265
    sput-object p1, Ltk/elevenk/olapi/OpenLibrary;->api:Ltk/elevenk/olapi/LibraryApi;

    .line 266
    iput-object p2, p0, Ltk/elevenk/olapi/OpenLibrary;->preferences:Ltk/elevenk/olapi/data/LibraryPreferences;

    .line 267
    return-void
.end method

.method public static androidLibrary(Ltk/elevenk/olapi/data/LibraryPreferences;)Ltk/elevenk/olapi/OpenLibrary;
    .registers 4
    .param p0, "preferences"    # Ltk/elevenk/olapi/data/LibraryPreferences;

    .prologue
    .line 71
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    sput-object v0, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    .line 72
    sget-object v0, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    check-cast v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-static {}, Ltk/elevenk/olapi/OpenLibrary;->getRedirectHandler()Lorg/apache/http/client/RedirectHandler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->setRedirectHandler(Lorg/apache/http/client/RedirectHandler;)V

    .line 73
    new-instance v0, Ltk/elevenk/olapi/OpenLibrary;

    new-instance v1, Ltk/elevenk/olapi/OpenLibApi;

    sget-object v2, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    invoke-direct {v1, v2}, Ltk/elevenk/olapi/OpenLibApi;-><init>(Lorg/apache/http/client/HttpClient;)V

    invoke-direct {v0, v1, p0}, Ltk/elevenk/olapi/OpenLibrary;-><init>(Ltk/elevenk/olapi/LibraryApi;Ltk/elevenk/olapi/data/LibraryPreferences;)V

    return-object v0
.end method

.method private downloadTempEbook(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .registers 9
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "extension"    # Ljava/lang/String;

    .prologue
    .line 125
    const/4 v2, 0x0

    .line 126
    .local v2, "response":Lorg/apache/http/HttpResponse;
    const/4 v3, 0x0

    .line 128
    .local v3, "temp":Ljava/io/File;
    :try_start_2
    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 129
    .local v1, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    sget-object v4, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    invoke-interface {v4, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_c} :catch_48

    move-result-object v2

    .line 135
    .end local v1    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    :goto_d
    if-eqz v2, :cond_47

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_47

    .line 137
    :try_start_1b
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "openlib"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    new-instance v5, Ljava/util/Random;

    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    invoke-virtual {v5}, Ljava/util/Random;->nextInt()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 138
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-interface {v4, v5}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_47} :catch_4d

    .line 143
    :cond_47
    :goto_47
    return-object v3

    .line 130
    :catch_48
    move-exception v0

    .line 132
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_d

    .line 139
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_4d
    move-exception v0

    .line 140
    .local v0, "e":Ljava/io/IOException;
    const-string v4, ""

    invoke-static {v4, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_47
.end method

.method public static genericLibrary(Ltk/elevenk/olapi/data/LibraryPreferences;)Ltk/elevenk/olapi/OpenLibrary;
    .registers 4
    .param p0, "preferences"    # Ltk/elevenk/olapi/data/LibraryPreferences;

    .prologue
    .line 63
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    sput-object v0, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    .line 64
    sget-object v0, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    check-cast v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-static {}, Ltk/elevenk/olapi/OpenLibrary;->getRedirectHandler()Lorg/apache/http/client/RedirectHandler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->setRedirectHandler(Lorg/apache/http/client/RedirectHandler;)V

    .line 65
    new-instance v0, Ltk/elevenk/olapi/OpenLibrary;

    new-instance v1, Ltk/elevenk/olapi/OpenLibApi;

    sget-object v2, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    invoke-direct {v1, v2}, Ltk/elevenk/olapi/OpenLibApi;-><init>(Lorg/apache/http/client/HttpClient;)V

    invoke-direct {v0, v1, p0}, Ltk/elevenk/olapi/OpenLibrary;-><init>(Ltk/elevenk/olapi/LibraryApi;Ltk/elevenk/olapi/data/LibraryPreferences;)V

    return-object v0
.end method

.method private getEpub(Ltk/elevenk/olapi/data/BookData;)Ljava/lang/Object;
    .registers 6
    .param p1, "bookData"    # Ltk/elevenk/olapi/data/BookData;

    .prologue
    .line 112
    const/4 v1, 0x0

    .line 114
    .local v1, "ebook":Ljava/lang/Object;
    :try_start_1
    invoke-virtual {p1, p0}, Ltk/elevenk/olapi/data/BookData;->addBookDetails(Ltk/elevenk/olapi/Library;)V

    .line 115
    invoke-virtual {p1}, Ltk/elevenk/olapi/data/BookData;->getEpubUrl()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 116
    .local v2, "fileUrl":Ljava/lang/String;
    const-string v3, "epub"

    invoke-direct {p0, v2, v3}, Ltk/elevenk/olapi/OpenLibrary;->downloadTempEbook(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_11} :catch_13

    move-result-object v1

    .line 121
    .end local v1    # "ebook":Ljava/lang/Object;
    .end local v2    # "fileUrl":Ljava/lang/String;
    :goto_12
    return-object v1

    .line 117
    .restart local v1    # "ebook":Ljava/lang/Object;
    :catch_13
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, ""

    invoke-static {v3, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method private static getRedirectHandler()Lorg/apache/http/client/RedirectHandler;
    .registers 1

    .prologue
    .line 244
    new-instance v0, Ltk/elevenk/olapi/OpenLibrary$1;

    invoke-direct {v0}, Ltk/elevenk/olapi/OpenLibrary$1;-><init>()V

    return-object v0
.end method


# virtual methods
.method public cancelRequest()V
    .registers 2

    .prologue
    .line 271
    const/4 v0, 0x1

    iput-boolean v0, p0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    .line 272
    sget-object v0, Ltk/elevenk/olapi/OpenLibrary;->api:Ltk/elevenk/olapi/LibraryApi;

    invoke-interface {v0}, Ltk/elevenk/olapi/LibraryApi;->cancelRequest()V

    .line 273
    return-void
.end method

.method public bridge synthetic findRandomBook(Ltk/elevenk/olapi/Library$LibraryCallbacks;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 51
    invoke-virtual {p0, p1}, Ltk/elevenk/olapi/OpenLibrary;->findRandomBook(Ltk/elevenk/olapi/Library$LibraryCallbacks;)Ltk/elevenk/olapi/data/BookData;

    move-result-object v0

    return-object v0
.end method

.method public findRandomBook(Ltk/elevenk/olapi/Library$LibraryCallbacks;)Ltk/elevenk/olapi/data/BookData;
    .registers 19
    .param p1, "callback"    # Ltk/elevenk/olapi/Library$LibraryCallbacks;

    .prologue
    .line 148
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    .line 151
    const/4 v1, 0x0

    .line 152
    .local v1, "book":Ltk/elevenk/olapi/data/BookData;
    const/4 v2, 0x0

    .line 154
    .local v2, "bookFound":Z
    :cond_7
    new-instance v6, Lorg/apache/http/client/methods/HttpGet;

    const-string v14, "http://randomword.setgetgo.com/get.php"

    invoke-direct {v6, v14}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 155
    .local v6, "get":Lorg/apache/http/client/methods/HttpGet;
    const-string v13, "science"

    .line 156
    .local v13, "word":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    if-eqz v14, :cond_22

    .line 203
    :cond_16
    :goto_16
    move-object/from16 v0, p0

    iget-boolean v14, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    if-nez v14, :cond_148

    .line 204
    const-string v14, "Found good book, loading"

    invoke-static {v14}, Ltk/elevenk/olapi/logging/Log;->d(Ljava/lang/String;)V

    .line 206
    .end local v1    # "book":Ltk/elevenk/olapi/data/BookData;
    :goto_21
    return-object v1

    .line 158
    .restart local v1    # "book":Ltk/elevenk/olapi/data/BookData;
    :cond_22
    :try_start_22
    sget-object v14, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    invoke-interface {v14, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v11

    .line 159
    .local v11, "resp":Lorg/apache/http/HttpResponse;
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v14

    const/16 v15, 0xc8

    if-ne v14, v15, :cond_44

    .line 160
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v14

    invoke-static {v14}, Ltk/elevenk/olapi/ApiHelpers;->convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_43} :catch_12a

    move-result-object v13

    .line 165
    .end local v11    # "resp":Lorg/apache/http/HttpResponse;
    :cond_44
    :goto_44
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Ltk/elevenk/olapi/Library$LibraryCallbacks;->onSearchUpdate(Ljava/lang/Object;)V

    .line 166
    new-instance v10, Ltk/elevenk/olapi/search/SearchQuery;

    invoke-direct {v10}, Ltk/elevenk/olapi/search/SearchQuery;-><init>()V

    .line 167
    .local v10, "query":Ltk/elevenk/olapi/search/SearchQuery;
    invoke-virtual {v10}, Ltk/elevenk/olapi/search/SearchQuery;->hasFullText()Ljava/lang/String;

    .line 168
    invoke-virtual {v10, v13}, Ltk/elevenk/olapi/search/SearchQuery;->query(Ljava/lang/String;)Ljava/lang/String;

    .line 169
    const-string v14, "Accessible+book"

    invoke-virtual {v10, v14}, Ltk/elevenk/olapi/search/SearchQuery;->subject(Ljava/lang/String;)Ljava/lang/String;

    .line 170
    const-string v14, "editions"

    invoke-virtual {v10, v14}, Ltk/elevenk/olapi/search/SearchQuery;->sort(Ljava/lang/String;)Ljava/lang/String;

    .line 171
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Searching for "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ltk/elevenk/olapi/logging/Log;->d(Ljava/lang/String;)V

    .line 172
    move-object/from16 v0, p0

    iget-boolean v14, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    if-nez v14, :cond_16

    .line 173
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Ltk/elevenk/olapi/OpenLibrary;->search(Ltk/elevenk/olapi/search/SearchQuery;)Ltk/elevenk/olapi/search/SearchResults;

    move-result-object v12

    .line 174
    .local v12, "results":Ltk/elevenk/olapi/search/SearchResults;
    invoke-virtual {v12}, Ltk/elevenk/olapi/search/SearchResults;->getNumberOfResults()I

    move-result v8

    .line 175
    .local v8, "numBooks":I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Found this many: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ltk/elevenk/olapi/logging/Log;->d(Ljava/lang/String;)V

    .line 176
    if-lez v8, :cond_120

    .line 177
    invoke-virtual {v12}, Ltk/elevenk/olapi/search/SearchResults;->getBooks()Ltk/elevenk/olapi/data/BookList;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Ltk/elevenk/olapi/data/BookList;->get(I)Ltk/elevenk/olapi/data/BookData;

    move-result-object v1

    .line 178
    move-object/from16 v0, p0

    iget-boolean v14, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    if-nez v14, :cond_16

    .line 179
    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ltk/elevenk/olapi/data/BookData;->addBookDetails(Ltk/elevenk/olapi/Library;)V

    .line 180
    move-object/from16 v0, p0

    iget-boolean v14, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    if-nez v14, :cond_16

    .line 181
    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Ltk/elevenk/olapi/data/BookData;->addReadingDetails(Ltk/elevenk/olapi/Library;)V

    .line 182
    invoke-virtual {v1}, Ltk/elevenk/olapi/data/BookData;->getEpubUrl()Ljava/lang/Object;

    move-result-object v5

    .line 183
    .local v5, "epubUrlData":Ljava/lang/Object;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Got book "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ltk/elevenk/olapi/logging/Log;->d(Ljava/lang/String;)V

    .line 184
    move-object/from16 v0, p0

    iget-boolean v14, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    if-nez v14, :cond_16

    .line 185
    instance-of v14, v5, Ljava/util/List;

    if-eqz v14, :cond_140

    move-object v9, v5

    .line 186
    check-cast v9, Ljava/util/List;

    .line 187
    .local v9, "olidList":Ljava/util/List;
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_ea
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_120

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .line 188
    .local v7, "item":Ljava/lang/Object;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Trying a new book"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ltk/elevenk/olapi/logging/Log;->d(Ljava/lang/String;)V

    .line 189
    new-instance v3, Ltk/elevenk/olapi/books/BookQuery;

    invoke-direct {v3}, Ltk/elevenk/olapi/books/BookQuery;-><init>()V

    .line 190
    .local v3, "bq":Ltk/elevenk/olapi/books/BookQuery;
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ltk/elevenk/olapi/books/BookQuery;->olid(Ljava/lang/String;)V

    .line 191
    move-object/from16 v0, p0

    iget-boolean v15, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    if-eqz v15, :cond_132

    .line 202
    .end local v3    # "bq":Ltk/elevenk/olapi/books/BookQuery;
    .end local v5    # "epubUrlData":Ljava/lang/Object;
    .end local v7    # "item":Ljava/lang/Object;
    .end local v9    # "olidList":Ljava/util/List;
    :cond_120
    :goto_120
    if-nez v2, :cond_16

    move-object/from16 v0, p0

    iget-boolean v14, v0, Ltk/elevenk/olapi/OpenLibrary;->cancelled:Z

    if-eqz v14, :cond_7

    goto/16 :goto_16

    .line 162
    .end local v8    # "numBooks":I
    .end local v10    # "query":Ltk/elevenk/olapi/search/SearchQuery;
    .end local v12    # "results":Ltk/elevenk/olapi/search/SearchResults;
    :catch_12a
    move-exception v4

    .line 163
    .local v4, "e":Ljava/lang/Exception;
    const-string v14, ""

    invoke-static {v14, v4}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_44

    .line 192
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v3    # "bq":Ltk/elevenk/olapi/books/BookQuery;
    .restart local v5    # "epubUrlData":Ljava/lang/Object;
    .restart local v7    # "item":Ljava/lang/Object;
    .restart local v8    # "numBooks":I
    .restart local v9    # "olidList":Ljava/util/List;
    .restart local v10    # "query":Ltk/elevenk/olapi/search/SearchQuery;
    .restart local v12    # "results":Ltk/elevenk/olapi/search/SearchResults;
    :cond_132
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Ltk/elevenk/olapi/OpenLibrary;->getBookDetails(Ltk/elevenk/olapi/books/BookQuery;)Ltk/elevenk/olapi/data/BookData;

    move-result-object v1

    .line 193
    invoke-virtual {v1}, Ltk/elevenk/olapi/data/BookData;->hasEpubUrl()Z

    move-result v15

    if-eqz v15, :cond_ea

    .line 194
    const/4 v2, 0x1

    .line 195
    goto :goto_120

    .line 198
    .end local v3    # "bq":Ltk/elevenk/olapi/books/BookQuery;
    .end local v7    # "item":Ljava/lang/Object;
    .end local v9    # "olidList":Ljava/util/List;
    :cond_140
    invoke-virtual {v1}, Ltk/elevenk/olapi/data/BookData;->hasEpubUrl()Z

    move-result v14

    if-eqz v14, :cond_120

    .line 199
    const/4 v2, 0x1

    goto :goto_120

    .line 206
    .end local v5    # "epubUrlData":Ljava/lang/Object;
    .end local v8    # "numBooks":I
    .end local v10    # "query":Ltk/elevenk/olapi/search/SearchQuery;
    .end local v12    # "results":Ltk/elevenk/olapi/search/SearchResults;
    :cond_148
    const/4 v1, 0x0

    goto/16 :goto_21
.end method

.method public getBaseUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 277
    sget-object v0, Ltk/elevenk/olapi/OpenLibrary;->api:Ltk/elevenk/olapi/LibraryApi;

    invoke-interface {v0}, Ltk/elevenk/olapi/LibraryApi;->getBaseUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBookDetails(Ltk/elevenk/olapi/books/BookQuery;)Ltk/elevenk/olapi/data/BookData;
    .registers 3
    .param p1, "bookQuery"    # Ltk/elevenk/olapi/books/BookQuery;

    .prologue
    .line 83
    sget-object v0, Ltk/elevenk/olapi/OpenLibrary;->api:Ltk/elevenk/olapi/LibraryApi;

    invoke-interface {v0, p1}, Ltk/elevenk/olapi/LibraryApi;->books(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Ltk/elevenk/olapi/data/BookData;->bookFromBookApi(Lorg/json/JSONObject;)Ltk/elevenk/olapi/data/BookData;

    move-result-object v0

    return-object v0
.end method

.method public getCoverUrls(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;
    .registers 9
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 228
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 229
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_3b

    if-eqz p2, :cond_3b

    .line 230
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget-object v4, Ltk/elevenk/olapi/OpenLibrary;->api:Ltk/elevenk/olapi/LibraryApi;

    invoke-interface {v4, v0}, Ltk/elevenk/olapi/LibraryApi;->covers(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v3

    .line 232
    .local v3, "object":Lorg/json/JSONObject;
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 233
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 234
    .local v1, "iterator":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 235
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 236
    .local v2, "objKey":Ljava/lang/String;
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_21

    .line 239
    .end local v1    # "iterator":Ljava/util/Iterator;
    .end local v2    # "objKey":Ljava/lang/String;
    .end local v3    # "object":Lorg/json/JSONObject;
    :cond_3b
    return-object v0
.end method

.method public getEbook(Ltk/elevenk/olapi/data/BookData;)Ljava/lang/Object;
    .registers 5
    .param p1, "bookData"    # Ltk/elevenk/olapi/data/BookData;

    .prologue
    .line 93
    const/4 v0, 0x0

    .line 94
    .local v0, "ebook":Ljava/lang/Object;
    sget-object v1, Ltk/elevenk/olapi/OpenLibrary$2;->$SwitchMap$tk$elevenk$olapi$data$EbookType:[I

    iget-object v2, p0, Ltk/elevenk/olapi/OpenLibrary;->preferences:Ltk/elevenk/olapi/data/LibraryPreferences;

    invoke-interface {v2}, Ltk/elevenk/olapi/data/LibraryPreferences;->getPreferredEbookType()Ltk/elevenk/olapi/data/EbookType;

    move-result-object v2

    invoke-virtual {v2}, Ltk/elevenk/olapi/data/EbookType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1a

    .line 108
    .end local v0    # "ebook":Ljava/lang/Object;
    :cond_12
    :goto_12
    :pswitch_12
    return-object v0

    .line 96
    .restart local v0    # "ebook":Ljava/lang/Object;
    :pswitch_13
    invoke-direct {p0, p1}, Ltk/elevenk/olapi/OpenLibrary;->getEpub(Ltk/elevenk/olapi/data/BookData;)Ljava/lang/Object;

    move-result-object v0

    .line 97
    if-eqz v0, :cond_12

    goto :goto_12

    .line 94
    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_13
        :pswitch_12
        :pswitch_12
        :pswitch_12
    .end packed-switch
.end method

.method public getReadingDetails(Ltk/elevenk/olapi/read/ReadQuery;)Ltk/elevenk/olapi/data/BookData;
    .registers 3
    .param p1, "readQuery"    # Ltk/elevenk/olapi/read/ReadQuery;

    .prologue
    .line 88
    sget-object v0, Ltk/elevenk/olapi/OpenLibrary;->api:Ltk/elevenk/olapi/LibraryApi;

    invoke-interface {v0, p1}, Ltk/elevenk/olapi/LibraryApi;->read(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Ltk/elevenk/olapi/data/BookData;->bookFromReadingApi(Lorg/json/JSONObject;)Ltk/elevenk/olapi/data/BookData;

    move-result-object v0

    return-object v0
.end method

.method public login(Ltk/elevenk/olapi/data/Credential;)Z
    .registers 9
    .param p1, "creds"    # Ltk/elevenk/olapi/data/Credential;

    .prologue
    .line 211
    const/4 v1, 0x0

    .line 212
    .local v1, "loggedIn":Z
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 213
    .local v0, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "username"

    invoke-virtual {p1}, Ltk/elevenk/olapi/data/Credential;->getUsername()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    const-string v4, "password"

    invoke-virtual {p1}, Ltk/elevenk/olapi/data/Credential;->getPassword()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    sget-object v4, Ltk/elevenk/olapi/OpenLibrary;->api:Ltk/elevenk/olapi/LibraryApi;

    invoke-interface {v4, v0}, Ltk/elevenk/olapi/LibraryApi;->login(Ljava/util/Map;)Lorg/apache/http/cookie/Cookie;

    move-result-object v3

    .line 217
    .local v3, "sessionCookie":Lorg/apache/http/cookie/Cookie;
    if-eqz v3, :cond_4b

    .line 219
    sget-object v4, Ltk/elevenk/olapi/OpenLibrary;->client:Lorg/apache/http/client/HttpClient;

    invoke-interface {v4}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    .line 220
    .local v2, "params":Lorg/apache/http/params/HttpParams;
    const-string v4, "Cookie"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v3}, Lorg/apache/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v3}, Lorg/apache/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 221
    const/4 v1, 0x1

    .line 223
    .end local v2    # "params":Lorg/apache/http/params/HttpParams;
    :cond_4b
    return v1
.end method

.method public search(Ltk/elevenk/olapi/search/SearchQuery;)Ltk/elevenk/olapi/search/SearchResults;
    .registers 4
    .param p1, "search"    # Ltk/elevenk/olapi/search/SearchQuery;

    .prologue
    .line 78
    new-instance v0, Ltk/elevenk/olapi/search/SearchResults;

    sget-object v1, Ltk/elevenk/olapi/OpenLibrary;->api:Ltk/elevenk/olapi/LibraryApi;

    invoke-interface {v1, p1}, Ltk/elevenk/olapi/LibraryApi;->search(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Ltk/elevenk/olapi/search/SearchResults;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method
