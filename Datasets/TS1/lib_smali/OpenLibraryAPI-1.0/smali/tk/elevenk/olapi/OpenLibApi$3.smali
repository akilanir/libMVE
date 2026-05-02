.class final Ltk/elevenk/olapi/OpenLibApi$3;
.super Ljava/util/HashMap;
.source "OpenLibApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltk/elevenk/olapi/OpenLibApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 82
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 84
    const-string v0, "details"

    const-string v1, "true"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string v0, "ebooks"

    const-string v1, "true"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    const-string v0, "published_in"

    invoke-virtual {p0, v0, v2}, Ltk/elevenk/olapi/OpenLibApi$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    const-string v0, "limit"

    invoke-virtual {p0, v0, v2}, Ltk/elevenk/olapi/OpenLibApi$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string v0, "offset"

    invoke-virtual {p0, v0, v2}, Ltk/elevenk/olapi/OpenLibApi$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    return-void
.end method
