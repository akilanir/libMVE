.class public Ltk/elevenk/olapi/books/BookQuery;
.super Ljava/util/HashMap;
.source "BookQuery.java"


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
.field private static final BIBKEYS:Ljava/lang/String; = "bibkeys"

.field private static final CALLBACK:Ljava/lang/String; = "callback"

.field private static final FORMAT:Ljava/lang/String; = "format"

.field private static final JSCMD:Ljava/lang/String; = "jscmd"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method


# virtual methods
.method public callback(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 56
    const-string v0, "callback"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/books/BookQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    return-void
.end method

.method public format(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 52
    const-string v0, "format"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/books/BookQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    return-void
.end method

.method public isbn(Ljava/lang/String;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 36
    const-string v0, "bibkeys"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ISBN:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/books/BookQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    return-void
.end method

.method public jscmd(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 60
    const-string v0, "jscmd"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/books/BookQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    return-void
.end method

.method public lccn(Ljava/lang/String;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 44
    const-string v0, "bibkeys"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LCCN:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/books/BookQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method

.method public oclc(Ljava/lang/String;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 40
    const-string v0, "bibkeys"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OCLC:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/books/BookQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    return-void
.end method

.method public olid(Ljava/lang/String;)V
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 48
    const-string v0, "bibkeys"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OLID:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltk/elevenk/olapi/books/BookQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    return-void
.end method
