.class public final Ljavassist/compiler/KeywordTable;
.super Ljava/util/HashMap;
.source "KeywordTable.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method


# virtual methods
.method public append(Ljava/lang/String;I)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "t"    # I

    .prologue
    .line 31
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Ljavassist/compiler/KeywordTable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    return-void
.end method

.method public lookup(Ljava/lang/String;)I
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Ljavassist/compiler/KeywordTable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 24
    .local v0, "found":Ljava/lang/Object;
    if-nez v0, :cond_8

    .line 25
    const/4 v1, -0x1

    .line 27
    .end local v0    # "found":Ljava/lang/Object;
    :goto_7
    return v1

    .restart local v0    # "found":Ljava/lang/Object;
    :cond_8
    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "found":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_7
.end method
