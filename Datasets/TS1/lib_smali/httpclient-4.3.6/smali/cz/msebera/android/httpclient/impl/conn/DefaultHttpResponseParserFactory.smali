.class public Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;
.super Ljava/lang/Object;
.source "DefaultHttpResponseParserFactory.java"

# interfaces
.implements Lcz/msebera/android/httpclient/io/HttpMessageParserFactory;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcz/msebera/android/httpclient/io/HttpMessageParserFactory",
        "<",
        "Lcz/msebera/android/httpclient/HttpResponse;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;


# instance fields
.field private final lineParser:Lcz/msebera/android/httpclient/message/LineParser;

.field private final responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;

    invoke-direct {v0}, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;-><init>()V

    sput-object v0, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 69
    invoke-direct {p0, v0, v0}, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;-><init>(Lcz/msebera/android/httpclient/message/LineParser;Lcz/msebera/android/httpclient/HttpResponseFactory;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/HttpResponseFactory;)V
    .registers 3
    .param p1, "responseFactory"    # Lcz/msebera/android/httpclient/HttpResponseFactory;

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;-><init>(Lcz/msebera/android/httpclient/message/LineParser;Lcz/msebera/android/httpclient/HttpResponseFactory;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/message/LineParser;Lcz/msebera/android/httpclient/HttpResponseFactory;)V
    .registers 3
    .param p1, "lineParser"    # Lcz/msebera/android/httpclient/message/LineParser;
    .param p2, "responseFactory"    # Lcz/msebera/android/httpclient/HttpResponseFactory;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    if-eqz p1, :cond_c

    .end local p1    # "lineParser":Lcz/msebera/android/httpclient/message/LineParser;
    :goto_5
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;->lineParser:Lcz/msebera/android/httpclient/message/LineParser;

    .line 59
    if-eqz p2, :cond_f

    .end local p2    # "responseFactory":Lcz/msebera/android/httpclient/HttpResponseFactory;
    :goto_9
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    .line 61
    return-void

    .line 58
    .restart local p1    # "lineParser":Lcz/msebera/android/httpclient/message/LineParser;
    .restart local p2    # "responseFactory":Lcz/msebera/android/httpclient/HttpResponseFactory;
    :cond_c
    sget-object p1, Lcz/msebera/android/httpclient/message/BasicLineParser;->INSTANCE:Lcz/msebera/android/httpclient/message/BasicLineParser;

    goto :goto_5

    .line 59
    .end local p1    # "lineParser":Lcz/msebera/android/httpclient/message/LineParser;
    :cond_f
    sget-object p2, Lcz/msebera/android/httpclient/impl/DefaultHttpResponseFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/DefaultHttpResponseFactory;

    goto :goto_9
.end method


# virtual methods
.method public create(Lcz/msebera/android/httpclient/io/SessionInputBuffer;Lcz/msebera/android/httpclient/config/MessageConstraints;)Lcz/msebera/android/httpclient/io/HttpMessageParser;
    .registers 6
    .param p1, "buffer"    # Lcz/msebera/android/httpclient/io/SessionInputBuffer;
    .param p2, "constraints"    # Lcz/msebera/android/httpclient/config/MessageConstraints;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/io/SessionInputBuffer;",
            "Lcz/msebera/android/httpclient/config/MessageConstraints;",
            ")",
            "Lcz/msebera/android/httpclient/io/HttpMessageParser",
            "<",
            "Lcz/msebera/android/httpclient/HttpResponse;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParser;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;->lineParser:Lcz/msebera/android/httpclient/message/LineParser;

    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParserFactory;->responseFactory:Lcz/msebera/android/httpclient/HttpResponseFactory;

    invoke-direct {v0, p1, v1, v2, p2}, Lcz/msebera/android/httpclient/impl/conn/DefaultHttpResponseParser;-><init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;Lcz/msebera/android/httpclient/message/LineParser;Lcz/msebera/android/httpclient/HttpResponseFactory;Lcz/msebera/android/httpclient/config/MessageConstraints;)V

    return-object v0
.end method
