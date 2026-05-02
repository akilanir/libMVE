.class public final Lcom/squareup/okhttp/internal/http/CacheStrategy;
.super Ljava/lang/Object;
.source "CacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/http/CacheStrategy$Factory;
    }
.end annotation


# instance fields
.field public final cacheResponse:Lcom/squareup/okhttp/Response;

.field public final networkRequest:Lcom/squareup/okhttp/Request;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)V
    .registers 3
    .param p1, "networkRequest"    # Lcom/squareup/okhttp/Request;
    .param p2, "cacheResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy;->networkRequest:Lcom/squareup/okhttp/Request;

    .line 41
    iput-object p2, p0, Lcom/squareup/okhttp/internal/http/CacheStrategy;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 42
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/internal/http/CacheStrategy$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/squareup/okhttp/Request;
    .param p2, "x1"    # Lcom/squareup/okhttp/Response;
    .param p3, "x2"    # Lcom/squareup/okhttp/internal/http/CacheStrategy$1;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/http/CacheStrategy;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Response;)V

    return-void
.end method

.method public static isCacheable(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Request;)Z
    .registers 5
    .param p0, "response"    # Lcom/squareup/okhttp/Response;
    .param p1, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->code()I

    move-result v1

    sparse-switch v1, :sswitch_data_46

    .line 85
    :cond_8
    :goto_8
    return v0

    .line 71
    :sswitch_9
    const-string v1, "Expires"

    invoke-virtual {p0, v1}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_30

    .line 72
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/CacheControl;->maxAgeSeconds()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_30

    .line 73
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/CacheControl;->isPublic()Z

    move-result v1

    if-nez v1, :cond_30

    .line 74
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/CacheControl;->isPrivate()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 85
    :cond_30
    :sswitch_30
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/CacheControl;->noStore()Z

    move-result v1

    if-nez v1, :cond_8

    invoke-virtual {p1}, Lcom/squareup/okhttp/Request;->cacheControl()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lcom/squareup/okhttp/CacheControl;->noStore()Z

    move-result v1

    if-nez v1, :cond_8

    const/4 v0, 0x1

    goto :goto_8

    .line 51
    :sswitch_data_46
    .sparse-switch
        0xc8 -> :sswitch_30
        0xcb -> :sswitch_30
        0xcc -> :sswitch_30
        0x12c -> :sswitch_30
        0x12d -> :sswitch_30
        0x12e -> :sswitch_9
        0x133 -> :sswitch_9
        0x134 -> :sswitch_30
        0x194 -> :sswitch_30
        0x195 -> :sswitch_30
        0x19a -> :sswitch_30
        0x19e -> :sswitch_30
        0x1f5 -> :sswitch_30
    .end sparse-switch
.end method
