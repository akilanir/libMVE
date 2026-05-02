.class final Lcom/danikula/videocache/Preconditions;
.super Ljava/lang/Object;
.source "Preconditions.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static varargs checkAllNotNull([Ljava/lang/Object;)V
    .registers 6
    .param p0, "references"    # [Ljava/lang/Object;

    .prologue
    .line 13
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_12

    aget-object v3, v0, v1

    .line 14
    .local v3, "reference":Ljava/lang/Object;
    if-nez v3, :cond_f

    .line 15
    new-instance v4, Ljava/lang/NullPointerException;

    invoke-direct {v4}, Ljava/lang/NullPointerException;-><init>()V

    throw v4

    .line 13
    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 18
    .end local v3    # "reference":Ljava/lang/Object;
    :cond_12
    return-void
.end method

.method static checkArgument(Z)V
    .registers 2
    .param p0, "expression"    # Z

    .prologue
    .line 28
    if-nez p0, :cond_8

    .line 29
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 31
    :cond_8
    return-void
.end method

.method static checkArgument(ZLjava/lang/String;)V
    .registers 3
    .param p0, "expression"    # Z
    .param p1, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 34
    if-nez p0, :cond_8

    .line 35
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_8
    return-void
.end method

.method static checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 6
    .local p0, "reference":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_8

    .line 7
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 9
    :cond_8
    return-object p0
.end method

.method static checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "errorMessage"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 21
    .local p0, "reference":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_8

    .line 22
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 24
    :cond_8
    return-object p0
.end method
