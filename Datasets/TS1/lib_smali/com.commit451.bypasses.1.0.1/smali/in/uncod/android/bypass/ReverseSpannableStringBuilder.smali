.class public Lin/uncod/android/bypass/ReverseSpannableStringBuilder;
.super Landroid/text/SpannableStringBuilder;
.source "ReverseSpannableStringBuilder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/text/SpannableStringBuilder;-><init>()V

    return-void
.end method

.method private static reverse([Ljava/lang/Object;)V
    .registers 5
    .param p0, "arr"    # [Ljava/lang/Object;

    .prologue
    .line 28
    if-nez p0, :cond_3

    .line 42
    :cond_2
    return-void

    .line 32
    :cond_3
    const/4 v0, 0x0

    .line 33
    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 35
    .local v1, "j":I
    :goto_7
    if-le v1, v0, :cond_2

    .line 36
    aget-object v2, p0, v1

    .line 37
    .local v2, "tmp":Ljava/lang/Object;
    aget-object v3, p0, v0

    aput-object v3, p0, v1

    .line 38
    aput-object v2, p0, v0

    .line 39
    add-int/lit8 v1, v1, -0x1

    .line 40
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method


# virtual methods
.method public getSpans(IILjava/lang/Class;)[Ljava/lang/Object;
    .registers 5
    .param p1, "queryStart"    # I
    .param p2, "queryEnd"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(II",
            "Ljava/lang/Class",
            "<TT;>;)[TT;"
        }
    .end annotation

    .prologue
    .line 22
    .local p3, "kind":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-super {p0, p1, p2, p3}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    .line 23
    .local v0, "ret":[Ljava/lang/Object;, "[TT;"
    invoke-static {v0}, Lin/uncod/android/bypass/ReverseSpannableStringBuilder;->reverse([Ljava/lang/Object;)V

    .line 24
    return-object v0
.end method
