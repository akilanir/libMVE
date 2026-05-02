.class final Ltk/elevenk/olapi/OpenLibApi$1;
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

    .line 58
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 60
    const-string v0, "bibkeys"

    invoke-virtual {p0, v0, v2}, Ltk/elevenk/olapi/OpenLibApi$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v0, "format"

    const-string v1, "json"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    const-string v0, "callback"

    invoke-virtual {p0, v0, v2}, Ltk/elevenk/olapi/OpenLibApi$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const-string v0, "jscmd"

    const-string v1, "data"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method
