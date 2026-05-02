.class public final Lcom/rey/material/widget/RippleManager;
.super Ljava/lang/Object;
.source "RippleManager.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/RippleManager$ClickRunnable;
    }
.end annotation


# instance fields
.field private mClickListener:Landroid/view/View$OnClickListener;

.field private mClickScheduled:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rey/material/widget/RippleManager;->mClickScheduled:Z

    .line 21
    return-void
.end method

.method static synthetic access$002(Lcom/rey/material/widget/RippleManager;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/RippleManager;
    .param p1, "x1"    # Z

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/rey/material/widget/RippleManager;->mClickScheduled:Z

    return p1
.end method

.method static synthetic access$100(Lcom/rey/material/widget/RippleManager;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/RippleManager;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/rey/material/widget/RippleManager;->dispatchClickEvent(Landroid/view/View;)V

    return-void
.end method

.method public static cancelRipple(Landroid/view/View;)V
    .registers 6
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 104
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    instance-of v4, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v4, :cond_25

    .line 105
    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Lcom/rey/material/drawable/RippleDrawable;->cancel()V

    .line 109
    :cond_d
    :goto_d
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_2f

    move-object v3, p0

    .line 110
    check-cast v3, Landroid/view/ViewGroup;

    .line 111
    .local v3, "vg":Landroid/view/ViewGroup;
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .local v1, "count":I
    :goto_19
    if-ge v2, v1, :cond_2f

    .line 112
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-static {v4}, Lcom/rey/material/widget/RippleManager;->cancelRipple(Landroid/view/View;)V

    .line 111
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .line 106
    .end local v1    # "count":I
    .end local v2    # "i":I
    .end local v3    # "vg":Landroid/view/ViewGroup;
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_25
    instance-of v4, v0, Lcom/rey/material/drawable/ToolbarRippleDrawable;

    if-eqz v4, :cond_d

    .line 107
    check-cast v0, Lcom/rey/material/drawable/ToolbarRippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->cancel()V

    goto :goto_d

    .line 114
    :cond_2f
    return-void
.end method

.method private dispatchClickEvent(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/rey/material/widget/RippleManager;->mClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_9

    .line 95
    iget-object v0, p0, Lcom/rey/material/widget/RippleManager;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 96
    :cond_9
    return-void
.end method

.method private getBackground(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 54
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 55
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_8

    .line 56
    const/4 v0, 0x0

    .line 61
    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_7
    :goto_7
    return-object v0

    .line 58
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_8
    instance-of v1, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v1, :cond_7

    .line 59
    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Lcom/rey/material/drawable/RippleDrawable;->getBackgroundDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_7
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 76
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    const-wide/16 v1, 0x0

    .line 78
    .local v1, "delay":J
    if-eqz v0, :cond_12

    .line 79
    instance-of v3, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v3, :cond_32

    .line 80
    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Lcom/rey/material/drawable/RippleDrawable;->getClickDelayTime()J

    move-result-wide v1

    .line 85
    :cond_12
    :goto_12
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_3d

    invoke-virtual {p1}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v3

    if-eqz v3, :cond_3d

    iget-boolean v3, p0, Lcom/rey/material/widget/RippleManager;->mClickScheduled:Z

    if-nez v3, :cond_3d

    .line 86
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/rey/material/widget/RippleManager;->mClickScheduled:Z

    .line 87
    invoke-virtual {p1}, Landroid/view/View;->getHandler()Landroid/os/Handler;

    move-result-object v3

    new-instance v4, Lcom/rey/material/widget/RippleManager$ClickRunnable;

    invoke-direct {v4, p0, p1}, Lcom/rey/material/widget/RippleManager$ClickRunnable;-><init>(Lcom/rey/material/widget/RippleManager;Landroid/view/View;)V

    invoke-virtual {v3, v4, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 91
    :goto_31
    return-void

    .line 81
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_32
    instance-of v3, v0, Lcom/rey/material/drawable/ToolbarRippleDrawable;

    if-eqz v3, :cond_12

    .line 82
    check-cast v0, Lcom/rey/material/drawable/ToolbarRippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->getClickDelayTime()J

    move-result-wide v1

    goto :goto_12

    .line 90
    :cond_3d
    invoke-direct {p0, p1}, Lcom/rey/material/widget/RippleManager;->dispatchClickEvent(Landroid/view/View;)V

    goto :goto_31
.end method

.method public onCreate(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 12
    .param p1, "v"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I
    .param p5, "defStyleRes"    # I

    .prologue
    const/4 v5, 0x0

    .line 32
    invoke-virtual {p1}, Landroid/view/View;->isInEditMode()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 51
    :cond_7
    :goto_7
    return-void

    .line 35
    :cond_8
    sget-object v4, Lcom/rey/material/R$styleable;->RippleView:[I

    invoke-virtual {p2, p3, v4, p4, p5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 36
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v4, Lcom/rey/material/R$styleable;->RippleView_rd_style:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .line 37
    .local v3, "rippleStyle":I
    const/4 v1, 0x0

    .line 39
    .local v1, "drawable":Lcom/rey/material/drawable/RippleDrawable;
    if-eqz v3, :cond_31

    .line 40
    new-instance v4, Lcom/rey/material/drawable/RippleDrawable$Builder;

    invoke-direct {v4, p2, v3}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-direct {p0, p1}, Lcom/rey/material/widget/RippleManager;->getBackground(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/rey/material/drawable/RippleDrawable$Builder;->backgroundDrawable(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/drawable/RippleDrawable$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v1

    .line 47
    :cond_28
    :goto_28
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 49
    if-eqz v1, :cond_7

    .line 50
    invoke-static {p1, v1}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto :goto_7

    .line 42
    :cond_31
    sget v4, Lcom/rey/material/R$styleable;->RippleView_rd_enable:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 43
    .local v2, "rippleEnable":Z
    if-eqz v2, :cond_28

    .line 44
    new-instance v4, Lcom/rey/material/drawable/RippleDrawable$Builder;

    invoke-direct {v4, p2, p3, p4, p5}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-direct {p0, p1}, Lcom/rey/material/widget/RippleManager;->getBackground(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/rey/material/drawable/RippleDrawable$Builder;->backgroundDrawable(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/drawable/RippleDrawable$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v1

    goto :goto_28
.end method

.method public onTouchEvent(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 69
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 70
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_14

    instance-of v1, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v1, :cond_14

    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p1, p2}, Lcom/rey/material/drawable/RippleDrawable;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/rey/material/widget/RippleManager;->mClickListener:Landroid/view/View$OnClickListener;

    .line 66
    return-void
.end method
