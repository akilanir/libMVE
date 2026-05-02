.class public Lfreemarker/template/SimpleList;
.super Lfreemarker/template/SimpleSequence;
.source "SimpleList.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 67
    invoke-direct {p0}, Lfreemarker/template/SimpleSequence;-><init>()V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .param p1, "list"    # Ljava/util/List;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;)V

    .line 72
    return-void
.end method
