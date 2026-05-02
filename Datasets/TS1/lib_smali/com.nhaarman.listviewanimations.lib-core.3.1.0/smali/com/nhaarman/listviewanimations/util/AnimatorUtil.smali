.class public Lcom/nhaarman/listviewanimations/util/AnimatorUtil;
.super Ljava/lang/Object;
.source "AnimatorUtil.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method public static concatAnimators([Lcom/nineoldandroids/animation/Animator;[Lcom/nineoldandroids/animation/Animator;Lcom/nineoldandroids/animation/Animator;)[Lcom/nineoldandroids/animation/Animator;
    .registers 11
    .param p0, "childAnimators"    # [Lcom/nineoldandroids/animation/Animator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "animators"    # [Lcom/nineoldandroids/animation/Animator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "alphaAnimator"    # Lcom/nineoldandroids/animation/Animator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 33
    array-length v6, p0

    array-length v7, p1

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, 0x1

    new-array v0, v6, [Lcom/nineoldandroids/animation/Animator;

    .line 36
    .local v0, "allAnimators":[Lcom/nineoldandroids/animation/Animator;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8
    array-length v6, p0

    if-ge v3, v6, :cond_12

    .line 37
    aget-object v6, p0, v3

    aput-object v6, v0, v3

    .line 36
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 40
    :cond_12
    move-object v2, p1

    .local v2, "arr$":[Lcom/nineoldandroids/animation/Animator;
    array-length v5, v2

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_15
    if-ge v4, v5, :cond_20

    aget-object v1, v2, v4

    .line 41
    .local v1, "animator":Lcom/nineoldandroids/animation/Animator;
    aput-object v1, v0, v3

    .line 42
    add-int/lit8 v3, v3, 0x1

    .line 40
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    .line 45
    .end local v1    # "animator":Lcom/nineoldandroids/animation/Animator;
    :cond_20
    array-length v6, v0

    add-int/lit8 v6, v6, -0x1

    aput-object p2, v0, v6

    .line 46
    return-object v0
.end method
