.class Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;
.super Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;
.source "AsyncHttpServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->onAccepted(Lcom/koushikdutta/async/AsyncSocket;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field fullPath:Ljava/lang/String;

.field hasContinued:Z

.field match:Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;

.field path:Ljava/lang/String;

.field requestComplete:Z

.field res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

.field responseComplete:Z

.field final synthetic this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

.field final synthetic val$socket:Lcom/koushikdutta/async/AsyncSocket;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;Lcom/koushikdutta/async/AsyncSocket;)V
    .registers 3
    .param p1, "this$1"    # Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iput-object p2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->val$socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-direct {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;Ljava/lang/Exception;)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;
    .param p1, "x1"    # Ljava/lang/Exception;

    .prologue
    .line 72
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->report(Ljava/lang/Exception;)V

    return-void
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;)V
    .registers 1
    .param p0, "x0"    # Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->handleOnCompleted()V

    return-void
.end method

.method private handleOnCompleted()V
    .registers 3

    .prologue
    .line 190
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->requestComplete:Z

    if-eqz v0, :cond_1b

    iget-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->responseComplete:Z

    if-eqz v0, :cond_1b

    .line 191
    sget-object v0, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_1:Lcom/koushikdutta/async/http/Protocol;

    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/HttpUtil;->isKeepAlive(Lcom/koushikdutta/async/http/Protocol;Lcom/koushikdutta/async/http/Headers;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 192
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iget-object v1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->val$socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->onAccepted(Lcom/koushikdutta/async/AsyncSocket;)V

    .line 198
    :cond_1b
    :goto_1b
    return-void

    .line 195
    :cond_1c
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->val$socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->close()V

    goto :goto_1b
.end method


# virtual methods
.method public getPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getQuery()Lcom/koushikdutta/async/http/Multimap;
    .registers 5

    .prologue
    const/4 v3, 0x2

    .line 207
    iget-object v1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->fullPath:Ljava/lang/String;

    const-string v2, "\\?"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "parts":[Ljava/lang/String;
    array-length v1, v0

    if-ge v1, v3, :cond_12

    .line 209
    new-instance v1, Lcom/koushikdutta/async/http/Multimap;

    invoke-direct {v1}, Lcom/koushikdutta/async/http/Multimap;-><init>()V

    .line 210
    :goto_11
    return-object v1

    :cond_12
    const/4 v1, 0x1

    aget-object v1, v0, v1

    invoke-static {v1}, Lcom/koushikdutta/async/http/Multimap;->parseQuery(Ljava/lang/String;)Lcom/koushikdutta/async/http/Multimap;

    move-result-object v1

    goto :goto_11
.end method

.method public onCompleted(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code()I

    move-result v0

    const/16 v1, 0x65

    if-ne v0, v1, :cond_b

    .line 187
    :cond_a
    :goto_a
    return-void

    .line 171
    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->requestComplete:Z

    .line 172
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;->onCompleted(Ljava/lang/Exception;)V

    .line 175
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    new-instance v1, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1$3;

    invoke-direct {v1, p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1$3;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;)V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/AsyncSocket;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 182
    invoke-direct {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->handleOnCompleted()V

    .line 184
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v0

    invoke-interface {v0}, Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;->readFullyOnRequest()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 185
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iget-object v0, v0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    iget-object v1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->match:Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;

    iget-object v2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    invoke-virtual {v0, v1, p0, v2}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->onRequest(Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;)V

    goto :goto_a
.end method

.method protected onHeadersReceived()V
    .registers 12

    .prologue
    const/4 v10, 0x0

    .line 88
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    .line 92
    .local v1, "headers":Lcom/koushikdutta/async/http/Headers;
    iget-boolean v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->hasContinued:Z

    if-nez v8, :cond_2b

    const-string v8, "100-continue"

    const-string v9, "Expect"

    invoke-virtual {v1, v9}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2b

    .line 93
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->pause()V

    .line 95
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    const-string v9, "HTTP/1.1 100 Continue\r\n\r\n"

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    new-instance v10, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1$1;

    invoke-direct {v10, p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1$1;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;)V

    invoke-static {v8, v9, v10}, Lcom/koushikdutta/async/Util;->writeAll(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 164
    :cond_2a
    :goto_2a
    return-void

    .line 111
    :cond_2b
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->getStatusLine()Ljava/lang/String;

    move-result-object v7

    .line 112
    .local v7, "statusLine":Ljava/lang/String;
    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 113
    .local v6, "parts":[Ljava/lang/String;
    const/4 v8, 0x1

    aget-object v8, v6, v8

    iput-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->fullPath:Ljava/lang/String;

    .line 114
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->fullPath:Ljava/lang/String;

    const-string v9, "\\?"

    invoke-virtual {v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v10

    iput-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->path:Ljava/lang/String;

    .line 115
    aget-object v8, v6, v10

    iput-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->method:Ljava/lang/String;

    .line 116
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iget-object v8, v8, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    iget-object v9, v8, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->mActions:Ljava/util/Hashtable;

    monitor-enter v9

    .line 117
    :try_start_51
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iget-object v8, v8, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    iget-object v8, v8, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->mActions:Ljava/util/Hashtable;

    iget-object v10, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->method:Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 118
    .local v5, "pairs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/http/server/AsyncHttpServer$Pair;>;"
    if-eqz v5, :cond_85

    .line 119
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_65
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_85

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/koushikdutta/async/http/server/AsyncHttpServer$Pair;

    .line 120
    .local v4, "p":Lcom/koushikdutta/async/http/server/AsyncHttpServer$Pair;
    iget-object v8, v4, Lcom/koushikdutta/async/http/server/AsyncHttpServer$Pair;->regex:Ljava/util/regex/Pattern;

    iget-object v10, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->path:Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 121
    .local v3, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_65

    .line 122
    iput-object v3, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->mMatcher:Ljava/util/regex/Matcher;

    .line 123
    iget-object v8, v4, Lcom/koushikdutta/async/http/server/AsyncHttpServer$Pair;->callback:Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;

    iput-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->match:Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;

    .line 128
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "m":Ljava/util/regex/Matcher;
    .end local v4    # "p":Lcom/koushikdutta/async/http/server/AsyncHttpServer$Pair;
    :cond_85
    monitor-exit v9
    :try_end_86
    .catchall {:try_start_51 .. :try_end_86} :catchall_ad

    .line 129
    new-instance v8, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1$2;

    iget-object v9, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->val$socket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-direct {v8, p0, v9, p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1$2;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;)V

    iput-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    .line 150
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iget-object v8, v8, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    iget-object v9, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    invoke-virtual {v8, p0, v9}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->onRequest(Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;)Z

    move-result v0

    .line 152
    .local v0, "handled":Z
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->match:Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;

    if-nez v8, :cond_b0

    if-nez v0, :cond_b0

    .line 153
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    const/16 v9, 0x194

    invoke-virtual {v8, v9}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 154
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    invoke-virtual {v8}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->end()V

    goto/16 :goto_2a

    .line 128
    .end local v0    # "handled":Z
    .end local v5    # "pairs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/http/server/AsyncHttpServer$Pair;>;"
    :catchall_ad
    move-exception v8

    :try_start_ae
    monitor-exit v9
    :try_end_af
    .catchall {:try_start_ae .. :try_end_af} :catchall_ad

    throw v8

    .line 158
    .restart local v0    # "handled":Z
    .restart local v5    # "pairs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/http/server/AsyncHttpServer$Pair;>;"
    :cond_b0
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->getBody()Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v8

    invoke-interface {v8}, Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;->readFullyOnRequest()Z

    move-result v8

    if-nez v8, :cond_c7

    .line 159
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iget-object v8, v8, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    iget-object v9, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->match:Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;

    iget-object v10, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    invoke-virtual {v8, v9, p0, v10}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->onRequest(Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;)V

    goto/16 :goto_2a

    .line 161
    :cond_c7
    iget-boolean v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->requestComplete:Z

    if-eqz v8, :cond_2a

    .line 162
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iget-object v8, v8, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    iget-object v9, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->match:Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;

    iget-object v10, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->res:Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    invoke-virtual {v8, v9, p0, v10}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->onRequest(Lcom/koushikdutta/async/http/server/HttpServerRequestCallback;Lcom/koushikdutta/async/http/server/AsyncHttpServerRequest;Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;)V

    goto/16 :goto_2a
.end method

.method protected onUnknownBody(Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;
    .registers 3
    .param p1, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1$1;->this$1:Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;

    iget-object v0, v0, Lcom/koushikdutta/async/http/server/AsyncHttpServer$1;->this$0:Lcom/koushikdutta/async/http/server/AsyncHttpServer;

    invoke-virtual {v0, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->onUnknownBody(Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;

    move-result-object v0

    return-object v0
.end method
