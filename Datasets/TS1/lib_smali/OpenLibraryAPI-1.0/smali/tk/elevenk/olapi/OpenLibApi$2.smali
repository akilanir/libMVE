.class final Ltk/elevenk/olapi/OpenLibApi$2;
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
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 68
    const-string v0, "q"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    const-string v0, "author"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    const-string v0, "title"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v0, "has_fulltext"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    const-string v0, "isbn"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    const-string v0, "subject"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const-string v0, "place"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    const-string v0, "person"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const-string v0, "publisher"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const-string v0, "page"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    const-string v0, "sort"

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/OpenLibApi$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    return-void
.end method
