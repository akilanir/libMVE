.class public Lcom/gc/materialdesign/views/ScrollView;
.super Landroid/widget/ScrollView;
.source "ScrollView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x0

    .line 24
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p0, v3}, Lcom/gc/materialdesign/views/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_28

    .line 26
    const/4 v2, 0x0

    :try_start_f
    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/gc/materialdesign/views/CustomView;

    .line 27
    .local v0, "child":Lcom/gc/materialdesign/views/CustomView;
    iget-boolean v2, v0, Lcom/gc/materialdesign/views/CustomView;->isLastTouch:Z

    if-eqz v2, :cond_25

    .line 28
    invoke-virtual {v0, p1}, Lcom/gc/materialdesign/views/CustomView;->onTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_22
    .catch Ljava/lang/ClassCastException; {:try_start_f .. :try_end_22} :catch_24

    .line 29
    const/4 v2, 0x1

    .line 35
    .end local v0    # "child":Lcom/gc/materialdesign/views/CustomView;
    :goto_23
    return v2

    .line 31
    :catch_24
    move-exception v2

    .line 24
    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 35
    :cond_28
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_23
.end method
