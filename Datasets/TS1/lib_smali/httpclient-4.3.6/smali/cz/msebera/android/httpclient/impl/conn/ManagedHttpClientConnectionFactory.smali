.class public Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;
.super Ljava/lang/Object;
.source "ManagedHttpClientConnectionFactory.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcz/msebera/android/httpclient/conn/HttpConnectionFactory",
        "<",
        "Lcz/msebera/android/httpclient/conn/routing/HttpRoute;",
        "Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;",
        ">;"
    }
.end annotation


# static fields
.field private static final COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

.field public static final INSTANCE:Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;


# instance fields
.field public headerlog:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final requestWriterFactory:Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory",
            "<",
            "Lcz/msebera/android/httpclient/HttpRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final responseParserFactory:Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponse;",
            ">;"
        }
    .end annotation
.end field

.field public wirelog:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 57
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    .line 59
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 84
    invoke-direct {p0, v0, v0}, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;-><init>(Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p1, "responseParserFactory":Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory<Lcz/msebera/android/httpclient/HttpResponse;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;-><init>(Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory",
            "<",
            "Lcz/msebera/android/httpclient/HttpRequest;",
            ">;",
            "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p1, "requestWriterFactory":Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory<Lcz/msebera/android/httpclient/HttpRequest;>;"
    .local p2, "responseParserFactory":Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory<Lcz/msebera/android/httpclient/HttpResponse;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-class v1, Lcz/msebera/android/httpclient/impl/conn/DefaultManagedHttpClientConnection;

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 62
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "cz.msebera.android.httpclient.headers"

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->headerlog:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 63
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v1, "cz.msebera.android.httpclient.wire"

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->wirelog:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 72
    if-eqz p1, :cond_27

    .end local p1    # "requestWriterFactory":Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory<Lcz/msebera/android/httpclient/HttpRequest;>;"
    :goto_20
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->requestWriterFactory:Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;

    .line 74
    if-eqz p2, :cond_2a

    .end local p2    # "responseParserFactory":Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory<Lcz/msebera/android/httpclient/HttpResponse;>;"
    :goto_24
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->responseParserFactory:Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;

    .line 76
    return-void

    .line 72
    .restart local p1    # "requestWriterFactory":Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory<Lcz/msebera/android/httpclient/HttpRequest;>;"
    .restart local p2    # "responseParserFactory":Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory<Lcz/msebera/android/httpclient/HttpResponse;>;"
    :cond_27
    sget-object p1, Lcz/msebera/android/httpclient/impl/io/DefaultHttpRequestWriterFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/io/DefaultHttpRequestWriterFactory;

    goto :goto_20

    .line 74
    .end local p1    # "requestWriterFactory":Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;, "Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory<Lcz/msebera/android/httpclient/HttpRequest;>;"
    :cond_2a
    sget-object p2, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;

    goto :goto_24
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;Lcz/msebera/android/httpclient/config/ConnectionConfig;)Lcz/msebera/android/httpclient/HttpConnection;
    .registers 4

    .prologue
    .line 53
    check-cast p1, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    invoke-virtual {p0, p1, p2}, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->create(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/config/ConnectionConfig;)Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    return-object v0
.end method

.method public create(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/config/ConnectionConfig;)Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    .registers 22
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "config"    # Lcz/msebera/android/httpclient/config/ConnectionConfig;

    .prologue
    .line 88
    if-eqz p2, :cond_81

    move-object/from16 v15, p2

    .line 89
    .local v15, "cconfig":Lcz/msebera/android/httpclient/config/ConnectionConfig;
    :goto_4
    const/4 v8, 0x0

    .line 90
    .local v8, "chardecoder":Ljava/nio/charset/CharsetDecoder;
    const/4 v9, 0x0

    .line 91
    .local v9, "charencoder":Ljava/nio/charset/CharsetEncoder;
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/config/ConnectionConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v16

    .line 92
    .local v16, "charset":Ljava/nio/charset/Charset;
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/config/ConnectionConfig;->getMalformedInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v1

    if-eqz v1, :cond_84

    .line 93
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/config/ConnectionConfig;->getMalformedInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v17

    .line 94
    .local v17, "malformedInputAction":Ljava/nio/charset/CodingErrorAction;
    :goto_14
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/config/ConnectionConfig;->getUnmappableInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v1

    if-eqz v1, :cond_87

    .line 95
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/config/ConnectionConfig;->getUnmappableInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v18

    .line 96
    .local v18, "unmappableInputAction":Ljava/nio/charset/CodingErrorAction;
    :goto_1e
    if-eqz v16, :cond_3c

    .line 97
    invoke-virtual/range {v16 .. v16}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v8

    .line 98
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 99
    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    .line 100
    invoke-virtual/range {v16 .. v16}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v9

    .line 101
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/nio/charset/CharsetEncoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 102
    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Ljava/nio/charset/CharsetEncoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 104
    :cond_3c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http-outgoing-"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->COUNTER:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 105
    .local v2, "id":Ljava/lang/String;
    new-instance v1, Lcz/msebera/android/httpclient/impl/conn/LoggingManagedHttpClientConnection;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->headerlog:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->wirelog:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 110
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/config/ConnectionConfig;->getBufferSize()I

    move-result v6

    .line 111
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/config/ConnectionConfig;->getFragmentSizeHint()I

    move-result v7

    .line 114
    invoke-virtual {v15}, Lcz/msebera/android/httpclient/config/ConnectionConfig;->getMessageConstraints()Lcz/msebera/android/httpclient/config/MessageConstraints;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->requestWriterFactory:Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->responseParserFactory:Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;

    invoke-direct/range {v1 .. v14}, Lcz/msebera/android/httpclient/impl/conn/LoggingManagedHttpClientConnection;-><init>(Ljava/lang/String;Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lcz/msebera/android/httpclient/config/MessageConstraints;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/io/HttpMessageWriterFactory;Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;)V

    return-object v1

    .line 88
    .end local v2    # "id":Ljava/lang/String;
    .end local v8    # "chardecoder":Ljava/nio/charset/CharsetDecoder;
    .end local v9    # "charencoder":Ljava/nio/charset/CharsetEncoder;
    .end local v15    # "cconfig":Lcz/msebera/android/httpclient/config/ConnectionConfig;
    .end local v16    # "charset":Ljava/nio/charset/Charset;
    .end local v17    # "malformedInputAction":Ljava/nio/charset/CodingErrorAction;
    .end local v18    # "unmappableInputAction":Ljava/nio/charset/CodingErrorAction;
    :cond_81
    sget-object v15, Lcz/msebera/android/httpclient/config/ConnectionConfig;->DEFAULT:Lcz/msebera/android/httpclient/config/ConnectionConfig;

    goto :goto_4

    .line 93
    .restart local v8    # "chardecoder":Ljava/nio/charset/CharsetDecoder;
    .restart local v9    # "charencoder":Ljava/nio/charset/CharsetEncoder;
    .restart local v15    # "cconfig":Lcz/msebera/android/httpclient/config/ConnectionConfig;
    .restart local v16    # "charset":Ljava/nio/charset/Charset;
    :cond_84
    sget-object v17, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    goto :goto_14

    .line 95
    .restart local v17    # "malformedInputAction":Ljava/nio/charset/CodingErrorAction;
    :cond_87
    sget-object v18, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    goto :goto_1e
.end method
