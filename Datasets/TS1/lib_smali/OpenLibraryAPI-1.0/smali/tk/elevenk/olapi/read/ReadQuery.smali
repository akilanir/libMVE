.class public Ltk/elevenk/olapi/read/ReadQuery;
.super Ljava/util/HashMap;
.source "ReadQuery.java"


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
.field public static final ISBN:Ljava/lang/String; = "isbn"

.field public static final LCCN:Ljava/lang/String; = "lccn"

.field public static final OCLC:Ljava/lang/String; = "oclc"

.field public static final OLID:Ljava/lang/String; = "olid"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method


# virtual methods
.method public isbn(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 41
    const-string v0, "isbn"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/read/ReadQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    return-void
.end method

.method public lccn(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 45
    const-string v0, "lccn"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/read/ReadQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    return-void
.end method

.method public oclc(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 49
    const-string v0, "oclc"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/read/ReadQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    return-void
.end method

.method public olid(Ljava/lang/String;)V
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 37
    const-string v0, "olid"

    invoke-virtual {p0, v0, p1}, Ltk/elevenk/olapi/read/ReadQuery;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    return-void
.end method
