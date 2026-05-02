.class Lretrofit/RestAdapter$RestHandler;
.super Ljava/lang/Object;
.source "RestAdapter.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lretrofit/RestAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RestHandler"
.end annotation


# instance fields
.field private final methodDetailsCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Method;",
            "Lretrofit/RestMethodInfo;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lretrofit/RestAdapter;


# direct methods
.method constructor <init>(Lretrofit/RestAdapter;Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Method;",
            "Lretrofit/RestMethodInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 223
    .local p2, "methodDetailsCache":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Method;Lretrofit/RestMethodInfo;>;"
    iput-object p1, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    iput-object p2, p0, Lretrofit/RestAdapter$RestHandler;->methodDetailsCache:Ljava/util/Map;

    .line 225
    return-void
.end method

.method static synthetic access$100(Lretrofit/RestAdapter$RestHandler;Lretrofit/RequestInterceptor;Lretrofit/RestMethodInfo;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "x0"    # Lretrofit/RestAdapter$RestHandler;
    .param p1, "x1"    # Lretrofit/RequestInterceptor;
    .param p2, "x2"    # Lretrofit/RestMethodInfo;
    .param p3, "x3"    # [Ljava/lang/Object;

    .prologue
    .line 220
    invoke-direct {p0, p1, p2, p3}, Lretrofit/RestAdapter$RestHandler;->invokeRequest(Lretrofit/RequestInterceptor;Lretrofit/RestMethodInfo;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private invokeRequest(Lretrofit/RequestInterceptor;Lretrofit/RestMethodInfo;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 29
    .param p1, "requestInterceptor"    # Lretrofit/RequestInterceptor;
    .param p2, "methodInfo"    # Lretrofit/RestMethodInfo;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 292
    const/16 v21, 0x0

    .line 294
    .local v21, "url":Ljava/lang/String;
    :try_start_2
    invoke-virtual/range {p2 .. p2}, Lretrofit/RestMethodInfo;->init()V

    .line 296
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->server:Lretrofit/Endpoint;

    invoke-interface {v3}, Lretrofit/Endpoint;->getUrl()Ljava/lang/String;

    move-result-object v15

    .line 297
    .local v15, "serverUrl":Ljava/lang/String;
    new-instance v13, Lretrofit/RequestBuilder;

    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->converter:Lretrofit/converter/Converter;

    move-object/from16 v0, p2

    invoke-direct {v13, v15, v0, v3}, Lretrofit/RequestBuilder;-><init>(Ljava/lang/String;Lretrofit/RestMethodInfo;Lretrofit/converter/Converter;)V

    .line 298
    .local v13, "requestBuilder":Lretrofit/RequestBuilder;
    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Lretrofit/RequestBuilder;->setArguments([Ljava/lang/Object;)V

    .line 300
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Lretrofit/RequestInterceptor;->intercept(Lretrofit/RequestInterceptor$RequestFacade;)V

    .line 302
    invoke-virtual {v13}, Lretrofit/RequestBuilder;->build()Lretrofit/client/Request;

    move-result-object v12

    .line 303
    .local v12, "request":Lretrofit/client/Request;
    invoke-virtual {v12}, Lretrofit/client/Request;->getUrl()Ljava/lang/String;

    move-result-object v21

    .line 305
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z

    if-nez v3, :cond_75

    .line 307
    const-string v3, "?"

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v23

    move-object/from16 v0, v21

    move/from16 v1, v23

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v18

    .line 308
    .local v18, "substrEnd":I
    const/4 v3, -0x1

    move/from16 v0, v18

    if-ne v0, v3, :cond_4b

    .line 309
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v18

    .line 311
    :cond_4b
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "Retrofit-"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    .line 312
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v24

    move-object/from16 v0, v21

    move/from16 v1, v24

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 311
    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 315
    .end local v18    # "substrEnd":I
    :cond_75
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->logLevel:Lretrofit/RestAdapter$LogLevel;

    invoke-virtual {v3}, Lretrofit/RestAdapter$LogLevel;->log()Z

    move-result v3

    if-eqz v3, :cond_8f

    .line 317
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    const-string v23, "HTTP"

    move-object/from16 v0, v23

    move-object/from16 v1, p3

    invoke-virtual {v3, v0, v12, v1}, Lretrofit/RestAdapter;->logAndReplaceRequest(Ljava/lang/String;Lretrofit/client/Request;[Ljava/lang/Object;)Lretrofit/client/Request;

    move-result-object v12

    .line 320
    :cond_8f
    const/4 v8, 0x0

    .line 321
    .local v8, "profilerObject":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    # getter for: Lretrofit/RestAdapter;->profiler:Lretrofit/Profiler;
    invoke-static {v3}, Lretrofit/RestAdapter;->access$200(Lretrofit/RestAdapter;)Lretrofit/Profiler;

    move-result-object v3

    if-eqz v3, :cond_a6

    .line 322
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    # getter for: Lretrofit/RestAdapter;->profiler:Lretrofit/Profiler;
    invoke-static {v3}, Lretrofit/RestAdapter;->access$200(Lretrofit/RestAdapter;)Lretrofit/Profiler;

    move-result-object v3

    invoke-interface {v3}, Lretrofit/Profiler;->beforeCall()Ljava/lang/Object;

    move-result-object v8

    .line 325
    .end local v8    # "profilerObject":Ljava/lang/Object;
    :cond_a6
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    .line 326
    .local v16, "start":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    # getter for: Lretrofit/RestAdapter;->clientProvider:Lretrofit/client/Client$Provider;
    invoke-static {v3}, Lretrofit/RestAdapter;->access$300(Lretrofit/RestAdapter;)Lretrofit/client/Client$Provider;

    move-result-object v3

    invoke-interface {v3}, Lretrofit/client/Client$Provider;->get()Lretrofit/client/Client;

    move-result-object v3

    invoke-interface {v3, v12}, Lretrofit/client/Client;->execute(Lretrofit/client/Request;)Lretrofit/client/Response;

    move-result-object v14

    .line 327
    .local v14, "response":Lretrofit/client/Response;
    sget-object v3, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v23

    sub-long v23, v23, v16

    move-wide/from16 v0, v23

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    .line 329
    .local v5, "elapsedTime":J
    invoke-virtual {v14}, Lretrofit/client/Response;->getStatus()I

    move-result v7

    .line 330
    .local v7, "statusCode":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    # getter for: Lretrofit/RestAdapter;->profiler:Lretrofit/Profiler;
    invoke-static {v3}, Lretrofit/RestAdapter;->access$200(Lretrofit/RestAdapter;)Lretrofit/Profiler;

    move-result-object v3

    if-eqz v3, :cond_e7

    .line 331
    move-object/from16 v0, p2

    # invokes: Lretrofit/RestAdapter;->getRequestInfo(Ljava/lang/String;Lretrofit/RestMethodInfo;Lretrofit/client/Request;)Lretrofit/Profiler$RequestInformation;
    invoke-static {v15, v0, v12}, Lretrofit/RestAdapter;->access$400(Ljava/lang/String;Lretrofit/RestMethodInfo;Lretrofit/client/Request;)Lretrofit/Profiler$RequestInformation;

    move-result-object v4

    .line 333
    .local v4, "requestInfo":Lretrofit/Profiler$RequestInformation;
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    # getter for: Lretrofit/RestAdapter;->profiler:Lretrofit/Profiler;
    invoke-static {v3}, Lretrofit/RestAdapter;->access$200(Lretrofit/RestAdapter;)Lretrofit/Profiler;

    move-result-object v3

    invoke-interface/range {v3 .. v8}, Lretrofit/Profiler;->afterCall(Lretrofit/Profiler$RequestInformation;JILjava/lang/Object;)V

    .line 336
    .end local v4    # "requestInfo":Lretrofit/Profiler$RequestInformation;
    :cond_e7
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->logLevel:Lretrofit/RestAdapter$LogLevel;

    invoke-virtual {v3}, Lretrofit/RestAdapter$LogLevel;->log()Z

    move-result v3

    if-eqz v3, :cond_fd

    .line 338
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    move-object/from16 v0, v21

    # invokes: Lretrofit/RestAdapter;->logAndReplaceResponse(Ljava/lang/String;Lretrofit/client/Response;J)Lretrofit/client/Response;
    invoke-static {v3, v0, v14, v5, v6}, Lretrofit/RestAdapter;->access$500(Lretrofit/RestAdapter;Ljava/lang/String;Lretrofit/client/Response;J)Lretrofit/client/Response;

    move-result-object v14

    .line 341
    :cond_fd
    move-object/from16 v0, p2

    iget-object v0, v0, Lretrofit/RestMethodInfo;->responseObjectType:Ljava/lang/reflect/Type;

    move-object/from16 v20, v0

    .line 343
    .local v20, "type":Ljava/lang/reflect/Type;
    const/16 v3, 0xc8

    if-lt v7, v3, :cond_226

    const/16 v3, 0x12c

    if-ge v7, v3, :cond_226

    .line 345
    const-class v3, Lretrofit/client/Response;

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14f

    .line 346
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isStreaming:Z

    if-nez v3, :cond_11f

    .line 348
    invoke-static {v14}, Lretrofit/Utils;->readBodyToBytesIfNecessary(Lretrofit/client/Response;)Lretrofit/client/Response;

    move-result-object v14

    .line 351
    :cond_11f
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z
    :try_end_123
    .catch Lretrofit/RetrofitError; {:try_start_2 .. :try_end_123} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_123} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_123} :catch_239
    .catchall {:try_start_2 .. :try_end_123} :catchall_1e2

    if-eqz v3, :cond_138

    .line 402
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z

    if-nez v3, :cond_136

    .line 403
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    const-string v23, "Retrofit-Idle"

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    :cond_136
    move-object v10, v14

    :cond_137
    :goto_137
    return-object v10

    .line 354
    :cond_138
    :try_start_138
    new-instance v10, Lretrofit/ResponseWrapper;

    invoke-direct {v10, v14, v14}, Lretrofit/ResponseWrapper;-><init>(Lretrofit/client/Response;Ljava/lang/Object;)V
    :try_end_13d
    .catch Lretrofit/RetrofitError; {:try_start_138 .. :try_end_13d} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_138 .. :try_end_13d} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_138 .. :try_end_13d} :catch_239
    .catchall {:try_start_138 .. :try_end_13d} :catchall_1e2

    .line 402
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z

    if-nez v3, :cond_137

    .line 403
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    const-string v23, "Retrofit-Idle"

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_137

    .line 357
    :cond_14f
    :try_start_14f
    invoke-virtual {v14}, Lretrofit/client/Response;->getBody()Lretrofit/mime/TypedInput;

    move-result-object v9

    .line 358
    .local v9, "body":Lretrofit/mime/TypedInput;
    if-nez v9, :cond_186

    .line 359
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z
    :try_end_159
    .catch Lretrofit/RetrofitError; {:try_start_14f .. :try_end_159} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_14f .. :try_end_159} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_14f .. :try_end_159} :catch_239
    .catchall {:try_start_14f .. :try_end_159} :catchall_1e2

    if-eqz v3, :cond_16e

    .line 360
    const/4 v10, 0x0

    .line 402
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z

    if-nez v3, :cond_137

    .line 403
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    const-string v23, "Retrofit-Idle"

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_137

    .line 362
    :cond_16e
    :try_start_16e
    new-instance v10, Lretrofit/ResponseWrapper;

    const/4 v3, 0x0

    invoke-direct {v10, v14, v3}, Lretrofit/ResponseWrapper;-><init>(Lretrofit/client/Response;Ljava/lang/Object;)V
    :try_end_174
    .catch Lretrofit/RetrofitError; {:try_start_16e .. :try_end_174} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_16e .. :try_end_174} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_16e .. :try_end_174} :catch_239
    .catchall {:try_start_16e .. :try_end_174} :catchall_1e2

    .line 402
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z

    if-nez v3, :cond_137

    .line 403
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    const-string v23, "Retrofit-Idle"

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_137

    .line 365
    :cond_186
    :try_start_186
    new-instance v22, Lretrofit/ExceptionCatchingTypedInput;

    move-object/from16 v0, v22

    invoke-direct {v0, v9}, Lretrofit/ExceptionCatchingTypedInput;-><init>(Lretrofit/mime/TypedInput;)V
    :try_end_18d
    .catch Lretrofit/RetrofitError; {:try_start_186 .. :try_end_18d} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_186 .. :try_end_18d} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_186 .. :try_end_18d} :catch_239
    .catchall {:try_start_186 .. :try_end_18d} :catchall_1e2

    .line 367
    .local v22, "wrapped":Lretrofit/ExceptionCatchingTypedInput;
    :try_start_18d
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->converter:Lretrofit/converter/Converter;

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-interface {v3, v0, v1}, Lretrofit/converter/Converter;->fromBody(Lretrofit/mime/TypedInput;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v10

    .line 368
    .local v10, "convert":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    # invokes: Lretrofit/RestAdapter;->logResponseBody(Lretrofit/mime/TypedInput;Ljava/lang/Object;)V
    invoke-static {v3, v9, v10}, Lretrofit/RestAdapter;->access$600(Lretrofit/RestAdapter;Lretrofit/mime/TypedInput;Ljava/lang/Object;)V

    .line 369
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z
    :try_end_1a6
    .catch Lretrofit/converter/ConversionException; {:try_start_18d .. :try_end_1a6} :catch_1d4
    .catch Lretrofit/RetrofitError; {:try_start_18d .. :try_end_1a6} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_18d .. :try_end_1a6} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_18d .. :try_end_1a6} :catch_239
    .catchall {:try_start_18d .. :try_end_1a6} :catchall_1e2

    if-eqz v3, :cond_1bb

    .line 402
    move-object/from16 v0, p2

    iget-boolean v3, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z

    if-nez v3, :cond_137

    .line 403
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    const-string v23, "Retrofit-Idle"

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto/16 :goto_137

    .line 372
    :cond_1bb
    :try_start_1bb
    new-instance v3, Lretrofit/ResponseWrapper;

    invoke-direct {v3, v14, v10}, Lretrofit/ResponseWrapper;-><init>(Lretrofit/client/Response;Ljava/lang/Object;)V
    :try_end_1c0
    .catch Lretrofit/converter/ConversionException; {:try_start_1bb .. :try_end_1c0} :catch_1d4
    .catch Lretrofit/RetrofitError; {:try_start_1bb .. :try_end_1c0} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_1bb .. :try_end_1c0} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_1bb .. :try_end_1c0} :catch_239
    .catchall {:try_start_1bb .. :try_end_1c0} :catchall_1e2

    .line 402
    move-object/from16 v0, p2

    iget-boolean v0, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z

    move/from16 v23, v0

    if-nez v23, :cond_1d1

    .line 403
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v23

    const-string v24, "Retrofit-Idle"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    :cond_1d1
    move-object v10, v3

    goto/16 :goto_137

    .line 373
    .end local v10    # "convert":Ljava/lang/Object;
    :catch_1d4
    move-exception v11

    .line 376
    .local v11, "e":Lretrofit/converter/ConversionException;
    :try_start_1d5
    invoke-virtual/range {v22 .. v22}, Lretrofit/ExceptionCatchingTypedInput;->threwException()Z

    move-result v3

    if-eqz v3, :cond_1f5

    .line 377
    invoke-virtual/range {v22 .. v22}, Lretrofit/ExceptionCatchingTypedInput;->getThrownException()Ljava/io/IOException;

    move-result-object v3

    throw v3
    :try_end_1e0
    .catch Lretrofit/RetrofitError; {:try_start_1d5 .. :try_end_1e0} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_1d5 .. :try_end_1e0} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_1d5 .. :try_end_1e0} :catch_239
    .catchall {:try_start_1d5 .. :try_end_1e0} :catchall_1e2

    .line 389
    .end local v5    # "elapsedTime":J
    .end local v7    # "statusCode":I
    .end local v9    # "body":Lretrofit/mime/TypedInput;
    .end local v11    # "e":Lretrofit/converter/ConversionException;
    .end local v12    # "request":Lretrofit/client/Request;
    .end local v13    # "requestBuilder":Lretrofit/RequestBuilder;
    .end local v14    # "response":Lretrofit/client/Response;
    .end local v15    # "serverUrl":Ljava/lang/String;
    .end local v16    # "start":J
    .end local v20    # "type":Ljava/lang/reflect/Type;
    .end local v22    # "wrapped":Lretrofit/ExceptionCatchingTypedInput;
    :catch_1e0
    move-exception v11

    .line 390
    .local v11, "e":Lretrofit/RetrofitError;
    :try_start_1e1
    throw v11
    :try_end_1e2
    .catchall {:try_start_1e1 .. :try_end_1e2} :catchall_1e2

    .line 402
    .end local v11    # "e":Lretrofit/RetrofitError;
    :catchall_1e2
    move-exception v3

    move-object/from16 v0, p2

    iget-boolean v0, v0, Lretrofit/RestMethodInfo;->isSynchronous:Z

    move/from16 v23, v0

    if-nez v23, :cond_1f4

    .line 403
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v23

    const-string v24, "Retrofit-Idle"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    :cond_1f4
    throw v3

    .line 381
    .restart local v5    # "elapsedTime":J
    .restart local v7    # "statusCode":I
    .restart local v9    # "body":Lretrofit/mime/TypedInput;
    .local v11, "e":Lretrofit/converter/ConversionException;
    .restart local v12    # "request":Lretrofit/client/Request;
    .restart local v13    # "requestBuilder":Lretrofit/RequestBuilder;
    .restart local v14    # "response":Lretrofit/client/Response;
    .restart local v15    # "serverUrl":Ljava/lang/String;
    .restart local v16    # "start":J
    .restart local v20    # "type":Ljava/lang/reflect/Type;
    .restart local v22    # "wrapped":Lretrofit/ExceptionCatchingTypedInput;
    :cond_1f5
    const/4 v3, 0x0

    :try_start_1f6
    invoke-static {v14, v3}, Lretrofit/Utils;->replaceResponseBody(Lretrofit/client/Response;Lretrofit/mime/TypedInput;)Lretrofit/client/Response;

    move-result-object v14

    .line 383
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->converter:Lretrofit/converter/Converter;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-static {v0, v14, v3, v1, v11}, Lretrofit/RetrofitError;->conversionError(Ljava/lang/String;Lretrofit/client/Response;Lretrofit/converter/Converter;Ljava/lang/reflect/Type;Lretrofit/converter/ConversionException;)Lretrofit/RetrofitError;

    move-result-object v3

    throw v3
    :try_end_209
    .catch Lretrofit/RetrofitError; {:try_start_1f6 .. :try_end_209} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_1f6 .. :try_end_209} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_1f6 .. :try_end_209} :catch_239
    .catchall {:try_start_1f6 .. :try_end_209} :catchall_1e2

    .line 391
    .end local v5    # "elapsedTime":J
    .end local v7    # "statusCode":I
    .end local v9    # "body":Lretrofit/mime/TypedInput;
    .end local v11    # "e":Lretrofit/converter/ConversionException;
    .end local v12    # "request":Lretrofit/client/Request;
    .end local v13    # "requestBuilder":Lretrofit/RequestBuilder;
    .end local v14    # "response":Lretrofit/client/Response;
    .end local v15    # "serverUrl":Ljava/lang/String;
    .end local v16    # "start":J
    .end local v20    # "type":Ljava/lang/reflect/Type;
    .end local v22    # "wrapped":Lretrofit/ExceptionCatchingTypedInput;
    :catch_209
    move-exception v11

    .line 392
    .local v11, "e":Ljava/io/IOException;
    :try_start_20a
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->logLevel:Lretrofit/RestAdapter$LogLevel;

    invoke-virtual {v3}, Lretrofit/RestAdapter$LogLevel;->log()Z

    move-result v3

    if-eqz v3, :cond_21f

    .line 393
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    move-object/from16 v0, v21

    invoke-virtual {v3, v11, v0}, Lretrofit/RestAdapter;->logException(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 395
    :cond_21f
    move-object/from16 v0, v21

    invoke-static {v0, v11}, Lretrofit/RetrofitError;->networkError(Ljava/lang/String;Ljava/io/IOException;)Lretrofit/RetrofitError;

    move-result-object v3

    throw v3
    :try_end_226
    .catchall {:try_start_20a .. :try_end_226} :catchall_1e2

    .line 387
    .end local v11    # "e":Ljava/io/IOException;
    .restart local v5    # "elapsedTime":J
    .restart local v7    # "statusCode":I
    .restart local v12    # "request":Lretrofit/client/Request;
    .restart local v13    # "requestBuilder":Lretrofit/RequestBuilder;
    .restart local v14    # "response":Lretrofit/client/Response;
    .restart local v15    # "serverUrl":Ljava/lang/String;
    .restart local v16    # "start":J
    .restart local v20    # "type":Ljava/lang/reflect/Type;
    :cond_226
    :try_start_226
    invoke-static {v14}, Lretrofit/Utils;->readBodyToBytesIfNecessary(Lretrofit/client/Response;)Lretrofit/client/Response;

    move-result-object v14

    .line 388
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->converter:Lretrofit/converter/Converter;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-static {v0, v14, v3, v1}, Lretrofit/RetrofitError;->httpError(Ljava/lang/String;Lretrofit/client/Response;Lretrofit/converter/Converter;Ljava/lang/reflect/Type;)Lretrofit/RetrofitError;

    move-result-object v3

    throw v3
    :try_end_239
    .catch Lretrofit/RetrofitError; {:try_start_226 .. :try_end_239} :catch_1e0
    .catch Ljava/io/IOException; {:try_start_226 .. :try_end_239} :catch_209
    .catch Ljava/lang/Throwable; {:try_start_226 .. :try_end_239} :catch_239
    .catchall {:try_start_226 .. :try_end_239} :catchall_1e2

    .line 396
    .end local v5    # "elapsedTime":J
    .end local v7    # "statusCode":I
    .end local v12    # "request":Lretrofit/client/Request;
    .end local v13    # "requestBuilder":Lretrofit/RequestBuilder;
    .end local v14    # "response":Lretrofit/client/Response;
    .end local v15    # "serverUrl":Ljava/lang/String;
    .end local v16    # "start":J
    .end local v20    # "type":Ljava/lang/reflect/Type;
    :catch_239
    move-exception v19

    .line 397
    .local v19, "t":Ljava/lang/Throwable;
    :try_start_23a
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->logLevel:Lretrofit/RestAdapter$LogLevel;

    invoke-virtual {v3}, Lretrofit/RestAdapter$LogLevel;->log()Z

    move-result v3

    if-eqz v3, :cond_251

    .line 398
    move-object/from16 v0, p0

    iget-object v3, v0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Lretrofit/RestAdapter;->logException(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 400
    :cond_251
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lretrofit/RetrofitError;->unexpectedError(Ljava/lang/String;Ljava/lang/Throwable;)Lretrofit/RetrofitError;

    move-result-object v3

    throw v3
    :try_end_25a
    .catchall {:try_start_23a .. :try_end_25a} :catchall_1e2
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 231
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    if-ne v0, v1, :cond_d

    .line 232
    invoke-virtual {p2, p0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 281
    :goto_c
    return-object v0

    .line 236
    :cond_d
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->methodDetailsCache:Ljava/util/Map;

    invoke-static {v0, p2}, Lretrofit/RestAdapter;->getMethodInfo(Ljava/util/Map;Ljava/lang/reflect/Method;)Lretrofit/RestMethodInfo;

    move-result-object v6

    .line 238
    .local v6, "methodInfo":Lretrofit/RestMethodInfo;
    iget-boolean v0, v6, Lretrofit/RestMethodInfo;->isSynchronous:Z

    if-eqz v0, :cond_34

    .line 240
    :try_start_17
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v0, v0, Lretrofit/RestAdapter;->requestInterceptor:Lretrofit/RequestInterceptor;

    invoke-direct {p0, v0, v6, p3}, Lretrofit/RestAdapter$RestHandler;->invokeRequest(Lretrofit/RequestInterceptor;Lretrofit/RestMethodInfo;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catch Lretrofit/RetrofitError; {:try_start_17 .. :try_end_1e} :catch_20

    move-result-object v0

    goto :goto_c

    .line 241
    :catch_20
    move-exception v8

    .line 242
    .local v8, "error":Lretrofit/RetrofitError;
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v0, v0, Lretrofit/RestAdapter;->errorHandler:Lretrofit/ErrorHandler;

    invoke-interface {v0, v8}, Lretrofit/ErrorHandler;->handleError(Lretrofit/RetrofitError;)Ljava/lang/Throwable;

    move-result-object v9

    .line 243
    .local v9, "newError":Ljava/lang/Throwable;
    if-nez v9, :cond_33

    .line 244
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Error handler returned null for wrapped exception."

    invoke-direct {v0, v1, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 247
    :cond_33
    throw v9

    .line 251
    .end local v8    # "error":Lretrofit/RetrofitError;
    .end local v9    # "newError":Ljava/lang/Throwable;
    :cond_34
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v0, v0, Lretrofit/RestAdapter;->httpExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_40

    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v0, v0, Lretrofit/RestAdapter;->callbackExecutor:Ljava/util/concurrent/Executor;

    if-nez v0, :cond_48

    .line 252
    :cond_40
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Asynchronous invocation requires calling setExecutors."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_48
    iget-boolean v0, v6, Lretrofit/RestMethodInfo;->isObservable:Z

    if-eqz v0, :cond_86

    .line 256
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    # getter for: Lretrofit/RestAdapter;->rxSupport:Lretrofit/RxSupport;
    invoke-static {v0}, Lretrofit/RestAdapter;->access$000(Lretrofit/RestAdapter;)Lretrofit/RxSupport;

    move-result-object v0

    if-nez v0, :cond_6e

    .line 257
    sget-boolean v0, Lretrofit/Platform;->HAS_RX_JAVA:Z

    if-eqz v0, :cond_7e

    .line 258
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    new-instance v1, Lretrofit/RxSupport;

    iget-object v3, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v3, Lretrofit/RestAdapter;->httpExecutor:Ljava/util/concurrent/Executor;

    iget-object v4, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v4, v4, Lretrofit/RestAdapter;->errorHandler:Lretrofit/ErrorHandler;

    iget-object v7, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v7, v7, Lretrofit/RestAdapter;->requestInterceptor:Lretrofit/RequestInterceptor;

    invoke-direct {v1, v3, v4, v7}, Lretrofit/RxSupport;-><init>(Ljava/util/concurrent/Executor;Lretrofit/ErrorHandler;Lretrofit/RequestInterceptor;)V

    # setter for: Lretrofit/RestAdapter;->rxSupport:Lretrofit/RxSupport;
    invoke-static {v0, v1}, Lretrofit/RestAdapter;->access$002(Lretrofit/RestAdapter;Lretrofit/RxSupport;)Lretrofit/RxSupport;

    .line 263
    :cond_6e
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    # getter for: Lretrofit/RestAdapter;->rxSupport:Lretrofit/RxSupport;
    invoke-static {v0}, Lretrofit/RestAdapter;->access$000(Lretrofit/RestAdapter;)Lretrofit/RxSupport;

    move-result-object v0

    new-instance v1, Lretrofit/RestAdapter$RestHandler$1;

    invoke-direct {v1, p0, v6, p3}, Lretrofit/RestAdapter$RestHandler$1;-><init>(Lretrofit/RestAdapter$RestHandler;Lretrofit/RestMethodInfo;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lretrofit/RxSupport;->createRequestObservable(Lretrofit/RxSupport$Invoker;)Lrx/Observable;

    move-result-object v0

    goto :goto_c

    .line 260
    :cond_7e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Observable method found but no RxJava on classpath."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 272
    :cond_86
    new-instance v5, Lretrofit/RequestInterceptorTape;

    invoke-direct {v5}, Lretrofit/RequestInterceptorTape;-><init>()V

    .line 273
    .local v5, "interceptorTape":Lretrofit/RequestInterceptorTape;
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v0, v0, Lretrofit/RestAdapter;->requestInterceptor:Lretrofit/RequestInterceptor;

    invoke-interface {v0, v5}, Lretrofit/RequestInterceptor;->intercept(Lretrofit/RequestInterceptor$RequestFacade;)V

    .line 275
    array-length v0, p3

    add-int/lit8 v0, v0, -0x1

    aget-object v2, p3, v0

    check-cast v2, Lretrofit/Callback;

    .line 276
    .local v2, "callback":Lretrofit/Callback;, "Lretrofit/Callback<*>;"
    iget-object v0, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v10, v0, Lretrofit/RestAdapter;->httpExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Lretrofit/RestAdapter$RestHandler$2;

    iget-object v1, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v3, v1, Lretrofit/RestAdapter;->callbackExecutor:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Lretrofit/RestAdapter$RestHandler;->this$0:Lretrofit/RestAdapter;

    iget-object v4, v1, Lretrofit/RestAdapter;->errorHandler:Lretrofit/ErrorHandler;

    move-object v1, p0

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lretrofit/RestAdapter$RestHandler$2;-><init>(Lretrofit/RestAdapter$RestHandler;Lretrofit/Callback;Ljava/util/concurrent/Executor;Lretrofit/ErrorHandler;Lretrofit/RequestInterceptorTape;Lretrofit/RestMethodInfo;[Ljava/lang/Object;)V

    invoke-interface {v10, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 281
    const/4 v0, 0x0

    goto/16 :goto_c
.end method
