.class public abstract Lcom/shamanland/fab/ScrollDetector;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ScrollDetector.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private final mDetector:Landroid/view/GestureDetector;

.field private mDirection:Z

.field private mDownY:F

.field private mIgnore:Z

.field private final mSlop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 41
    new-instance v0, Landroid/view/GestureDetector;

    invoke-direct {v0, p1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/shamanland/fab/ScrollDetector;->mDetector:Landroid/view/GestureDetector;

    .line 43
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-ge v0, v1, :cond_19

    .line 45
    invoke-static {}, Landroid/view/ViewConfiguration;->getTouchSlop()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/shamanland/fab/ScrollDetector;->mSlop:I

    .line 49
    :goto_18
    return-void

    .line 47
    :cond_19
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v0

    iput v0, p0, Lcom/shamanland/fab/ScrollDetector;->mSlop:I

    goto :goto_18
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 59
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/shamanland/fab/ScrollDetector;->mDownY:F

    .line 60
    const/4 v0, 0x0

    return v0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 10
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 65
    iget-boolean v3, p0, Lcom/shamanland/fab/ScrollDetector;->mIgnore:Z

    if-eqz v3, :cond_7

    .line 82
    :cond_6
    :goto_6
    return v2

    .line 69
    :cond_7
    iget-boolean v4, p0, Lcom/shamanland/fab/ScrollDetector;->mDirection:Z

    const/4 v3, 0x0

    cmpl-float v3, p4, v3

    if-lez v3, :cond_31

    move v3, v1

    :goto_f
    if-eq v4, v3, :cond_1d

    .line 70
    iget-boolean v3, p0, Lcom/shamanland/fab/ScrollDetector;->mDirection:Z

    if-nez v3, :cond_33

    :goto_15
    iput-boolean v1, p0, Lcom/shamanland/fab/ScrollDetector;->mDirection:Z

    .line 71
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, p0, Lcom/shamanland/fab/ScrollDetector;->mDownY:F

    .line 74
    :cond_1d
    iget v1, p0, Lcom/shamanland/fab/ScrollDetector;->mDownY:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    sub-float v0, v1, v3

    .line 76
    .local v0, "distance":F
    iget v1, p0, Lcom/shamanland/fab/ScrollDetector;->mSlop:I

    neg-int v1, v1

    int-to-float v1, v1

    cmpg-float v1, v0, v1

    if-gez v1, :cond_35

    .line 77
    invoke-virtual {p0}, Lcom/shamanland/fab/ScrollDetector;->onScrollDown()V

    goto :goto_6

    .end local v0    # "distance":F
    :cond_31
    move v3, v2

    .line 69
    goto :goto_f

    :cond_33
    move v1, v2

    .line 70
    goto :goto_15

    .line 78
    .restart local v0    # "distance":F
    :cond_35
    iget v1, p0, Lcom/shamanland/fab/ScrollDetector;->mSlop:I

    int-to-float v1, v1

    cmpl-float v1, v0, v1

    if-lez v1, :cond_6

    .line 79
    invoke-virtual {p0}, Lcom/shamanland/fab/ScrollDetector;->onScrollUp()V

    goto :goto_6
.end method

.method public abstract onScrollDown()V
.end method

.method public abstract onScrollUp()V
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/shamanland/fab/ScrollDetector;->mDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 54
    const/4 v0, 0x0

    return v0
.end method

.method public setIgnore(Z)V
    .registers 2
    .param p1, "ignore"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/shamanland/fab/ScrollDetector;->mIgnore:Z

    .line 38
    return-void
.end method
