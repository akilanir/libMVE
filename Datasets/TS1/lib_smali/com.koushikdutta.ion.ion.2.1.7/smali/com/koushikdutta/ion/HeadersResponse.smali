.class public Lcom/koushikdutta/ion/HeadersResponse;
.super Ljava/lang/Object;
.source "HeadersResponse.java"


# instance fields
.field code:I

.field headers:Lcom/koushikdutta/async/http/Headers;

.field message:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/koushikdutta/async/http/Headers;)V
    .registers 4
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "headers"    # Lcom/koushikdutta/async/http/Headers;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p3, p0, Lcom/koushikdutta/ion/HeadersResponse;->headers:Lcom/koushikdutta/async/http/Headers;

    .line 11
    iput p1, p0, Lcom/koushikdutta/ion/HeadersResponse;->code:I

    .line 12
    iput-object p2, p0, Lcom/koushikdutta/ion/HeadersResponse;->message:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public code()I
    .registers 2

    .prologue
    .line 22
    iget v0, p0, Lcom/koushikdutta/ion/HeadersResponse;->code:I

    return v0
.end method

.method public code(I)Lcom/koushikdutta/ion/HeadersResponse;
    .registers 2
    .param p1, "code"    # I

    .prologue
    .line 26
    iput p1, p0, Lcom/koushikdutta/ion/HeadersResponse;->code:I

    .line 27
    return-object p0
.end method

.method public getHeaders()Lcom/koushikdutta/async/http/Headers;
    .registers 2

    .prologue
    .line 17
    iget-object v0, p0, Lcom/koushikdutta/ion/HeadersResponse;->headers:Lcom/koushikdutta/async/http/Headers;

    return-object v0
.end method

.method public message(Ljava/lang/String;)Lcom/koushikdutta/ion/HeadersResponse;
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/koushikdutta/ion/HeadersResponse;->message:Ljava/lang/String;

    .line 36
    return-object p0
.end method

.method public message()Ljava/lang/String;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/koushikdutta/ion/HeadersResponse;->message:Ljava/lang/String;

    return-object v0
.end method
