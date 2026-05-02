.class public Ltk/elevenk/olapi/search/SearchQuery;
.super Ljava/util/HashMap;
.source "SearchQuery.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field public static final AUTHOR:Ljava/lang/String; = "author"

.field public static final HAS_FULL_TEXT:Ljava/lang/String; = "has_fulltext"

.field public static final ISBN:Ljava/lang/String; = "isbn"

.field public static final LANGUAGE:Ljava/lang/String; = "language"

.field public static final PAGE:Ljava/lang/String; = "page"

.field public static final PERSON:Ljava/lang/String; = "person"

.field public static final PLACE:Ljava/lang/String; = "place"

.field public static final PUBLISHER:Ljava/lang/String; = "publisher"

.field public static final QUERY:Ljava/lang/String; = "q"

.field public static final SORT:Ljava/lang/String; = "sort"

.field public static final SUBJECT:Ljava/lang/String; = "subject"

.field public static final TITLE:Ljava/lang/String; = "title"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method

.method private hasFullText(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "bool"    # Ljava/lang/String;

    .prologue
    .line 62
    const-string v0, "has_fulltext"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private page(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "page"    # Ljava/lang/String;

    .prologue
    .line 114
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 115
    const-string v0, "page"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 116
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method


# virtual methods
.method public author(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "author"    # Ljava/lang/String;

    .prologue
    .line 72
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 73
    const-string v0, "author"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 74
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public hasFullText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 54
    const-string v0, "true"

    invoke-direct {p0, v0}, Ltk/elevenk/olapi/search/SearchQuery;->hasFullText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasFullText(Z)Ljava/lang/String;
    .registers 3
    .param p1, "flag"    # Z

    .prologue
    .line 58
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ltk/elevenk/olapi/search/SearchQuery;->hasFullText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isbn(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "isbn"    # Ljava/lang/String;

    .prologue
    .line 78
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 79
    const-string v0, "isbn"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 80
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public language(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "lang"    # Ljava/lang/String;

    .prologue
    .line 120
    if-eqz p1, :cond_11

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_11

    .line 121
    const-string v0, "language"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 122
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public page(I)Ljava/lang/String;
    .registers 3
    .param p1, "page"    # I

    .prologue
    .line 108
    if-lez p1, :cond_f

    .line 109
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ltk/elevenk/olapi/search/SearchQuery;->page(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 110
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public person(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "person"    # Ljava/lang/String;

    .prologue
    .line 96
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 97
    const-string v0, "person"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 98
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public place(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "place"    # Ljava/lang/String;

    .prologue
    .line 90
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 91
    const-string v0, "place"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 92
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public publisher(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "publisher"    # Ljava/lang/String;

    .prologue
    .line 102
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 103
    const-string v0, "publisher"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 104
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public query(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 48
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 49
    const-string v0, "q"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 50
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public sort(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 126
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 127
    const-string v0, "sort"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 128
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public subject(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 84
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 85
    const-string v0, "subject"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 86
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public title(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 66
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    .line 67
    const-string v0, "title"

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/search/SearchQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 68
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method
