.class Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;
.super Ljava/lang/Object;
.source "ResponseHeaders.java"

# interfaces
.implements Lcom/koushikdutta/async/http/cache/HeaderParser$CacheControlHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/http/cache/ResponseHeaders;-><init>(Landroid/net/Uri;Lcom/koushikdutta/async/http/cache/RawHeaders;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/http/cache/ResponseHeaders;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/http/cache/ResponseHeaders;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;->this$0:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "directive"    # Ljava/lang/String;
    .param p2, "parameter"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 122
    const-string v0, "no-cache"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 123
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;->this$0:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    # setter for: Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noCache:Z
    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->access$002(Lcom/koushikdutta/async/http/cache/ResponseHeaders;Z)Z

    .line 135
    :cond_e
    :goto_e
    return-void

    .line 124
    :cond_f
    const-string v0, "no-store"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 125
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;->this$0:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    # setter for: Lcom/koushikdutta/async/http/cache/ResponseHeaders;->noStore:Z
    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->access$102(Lcom/koushikdutta/async/http/cache/ResponseHeaders;Z)Z

    goto :goto_e

    .line 126
    :cond_1d
    const-string v0, "max-age"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 127
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;->this$0:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    invoke-static {p2}, Lcom/koushikdutta/async/http/cache/HeaderParser;->parseSeconds(Ljava/lang/String;)I

    move-result v1

    # setter for: Lcom/koushikdutta/async/http/cache/ResponseHeaders;->maxAgeSeconds:I
    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->access$202(Lcom/koushikdutta/async/http/cache/ResponseHeaders;I)I

    goto :goto_e

    .line 128
    :cond_2f
    const-string v0, "s-maxage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 129
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;->this$0:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    invoke-static {p2}, Lcom/koushikdutta/async/http/cache/HeaderParser;->parseSeconds(Ljava/lang/String;)I

    move-result v1

    # setter for: Lcom/koushikdutta/async/http/cache/ResponseHeaders;->sMaxAgeSeconds:I
    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->access$302(Lcom/koushikdutta/async/http/cache/ResponseHeaders;I)I

    goto :goto_e

    .line 130
    :cond_41
    const-string v0, "public"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 131
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;->this$0:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    # setter for: Lcom/koushikdutta/async/http/cache/ResponseHeaders;->isPublic:Z
    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->access$402(Lcom/koushikdutta/async/http/cache/ResponseHeaders;Z)Z

    goto :goto_e

    .line 132
    :cond_4f
    const-string v0, "must-revalidate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 133
    iget-object v0, p0, Lcom/koushikdutta/async/http/cache/ResponseHeaders$1;->this$0:Lcom/koushikdutta/async/http/cache/ResponseHeaders;

    # setter for: Lcom/koushikdutta/async/http/cache/ResponseHeaders;->mustRevalidate:Z
    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/cache/ResponseHeaders;->access$502(Lcom/koushikdutta/async/http/cache/ResponseHeaders;Z)Z

    goto :goto_e
.end method
