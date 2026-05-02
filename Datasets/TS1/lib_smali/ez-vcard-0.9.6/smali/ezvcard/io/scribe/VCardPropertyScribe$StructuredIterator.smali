.class public Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;
.super Ljava/lang/Object;
.source "VCardPropertyScribe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/scribe/VCardPropertyScribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "StructuredIterator"
.end annotation


# instance fields
.field private final it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Iterator;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 917
    .local p1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 918
    iput-object p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;->it:Ljava/util/Iterator;

    .line 919
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 959
    iget-object v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public nextComponent()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 946
    invoke-virtual {p0}, Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_d

    .line 947
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 955
    :cond_c
    :goto_c
    return-object v0

    .line 950
    :cond_d
    iget-object v1, p0, Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;->it:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 951
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_c

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_c

    .line 952
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    goto :goto_c
.end method

.method public nextString()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 927
    invoke-virtual {p0}, Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_8

    .line 937
    :cond_7
    :goto_7
    return-object v2

    .line 931
    :cond_8
    iget-object v3, p0, Lezvcard/io/scribe/VCardPropertyScribe$StructuredIterator;->it:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 932
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    .line 936
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 937
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_24

    move-object v1, v2

    .end local v1    # "value":Ljava/lang/String;
    :cond_24
    move-object v2, v1

    goto :goto_7
.end method
