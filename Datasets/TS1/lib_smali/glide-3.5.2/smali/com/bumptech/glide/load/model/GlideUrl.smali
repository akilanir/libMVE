.class public Lcom/bumptech/glide/load/model/GlideUrl;
.super Ljava/lang/Object;
.source "GlideUrl.java"


# static fields
.field private static final ALLOWED_URI_CHARS:Ljava/lang/String; = "@#&=*+-_.,:!?()/~\'%"


# instance fields
.field private safeUrl:Ljava/net/URL;

.field private stringUrl:Ljava/lang/String;

.field private final url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 40
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "String url must not be empty or null: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_22
    iput-object p1, p0, Lcom/bumptech/glide/load/model/GlideUrl;->stringUrl:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/model/GlideUrl;->url:Ljava/net/URL;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .registers 4
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    if-nez p1, :cond_d

    .line 32
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "URL must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_d
    iput-object p1, p0, Lcom/bumptech/glide/load/model/GlideUrl;->url:Ljava/net/URL;

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/model/GlideUrl;->stringUrl:Ljava/lang/String;

    .line 36
    return-void
.end method

.method private getSafeUrl()Ljava/net/URL;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v2, p0, Lcom/bumptech/glide/load/model/GlideUrl;->safeUrl:Ljava/net/URL;

    if-eqz v2, :cond_7

    .line 56
    iget-object v2, p0, Lcom/bumptech/glide/load/model/GlideUrl;->safeUrl:Ljava/net/URL;

    .line 62
    :goto_6
    return-object v2

    .line 58
    :cond_7
    invoke-virtual {p0}, Lcom/bumptech/glide/load/model/GlideUrl;->toString()Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "unsafe":Ljava/lang/String;
    const-string v2, "@#&=*+-_.,:!?()/~\'%"

    invoke-static {v1, v2}, Landroid/net/Uri;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, "safe":Ljava/lang/String;
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/bumptech/glide/load/model/GlideUrl;->safeUrl:Ljava/net/URL;

    .line 62
    iget-object v2, p0, Lcom/bumptech/glide/load/model/GlideUrl;->safeUrl:Ljava/net/URL;

    goto :goto_6
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 75
    if-ne p0, p1, :cond_4

    .line 76
    const/4 v0, 0x1

    .line 82
    :goto_3
    return v0

    .line 78
    :cond_4
    if-eqz p1, :cond_10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_12

    .line 79
    :cond_10
    const/4 v0, 0x0

    goto :goto_3

    .line 82
    :cond_12
    invoke-virtual {p0}, Lcom/bumptech/glide/load/model/GlideUrl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 87
    invoke-virtual {p0}, Lcom/bumptech/glide/load/model/GlideUrl;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/bumptech/glide/load/model/GlideUrl;->stringUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 68
    iget-object v0, p0, Lcom/bumptech/glide/load/model/GlideUrl;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/model/GlideUrl;->stringUrl:Ljava/lang/String;

    .line 70
    :cond_10
    iget-object v0, p0, Lcom/bumptech/glide/load/model/GlideUrl;->stringUrl:Ljava/lang/String;

    return-object v0
.end method

.method public toURL()Ljava/net/URL;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/bumptech/glide/load/model/GlideUrl;->getSafeUrl()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method
