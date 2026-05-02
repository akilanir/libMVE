.class public Lcom/rey/material/app/ToolbarManager;
.super Ljava/lang/Object;
.source "ToolbarManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/app/ToolbarManager$ThemableNavigationManager;,
        Lcom/rey/material/app/ToolbarManager$BaseNavigationManager;,
        Lcom/rey/material/app/ToolbarManager$NavigationManager;,
        Lcom/rey/material/app/ToolbarManager$SimpleAnimator;,
        Lcom/rey/material/app/ToolbarManager$Animator;,
        Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;
    }
.end annotation


# instance fields
.field private mAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/animation/Animation;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimator:Lcom/rey/material/app/ToolbarManager$Animator;

.field private mAppCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;

.field private mBuilder:Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

.field private mCurrentGroup:I

.field private mGroupChanged:Z

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private mMenuDataChanged:Z

.field private mMenuView:Landroid/support/v7/widget/ActionMenuView;

.field private mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

.field private mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private mOutAnimationEndListener:Landroid/view/animation/Animation$AnimationListener;

.field private mRippleStyle:I

.field private mToolbar:Landroid/support/v7/widget/Toolbar;


# direct methods
.method public constructor <init>(Landroid/support/v7/app/AppCompatDelegate;Landroid/support/v7/widget/Toolbar;IIII)V
    .registers 13
    .param p1, "delegate"    # Landroid/support/v7/app/AppCompatDelegate;
    .param p2, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p3, "defaultGroupId"    # I
    .param p4, "rippleStyle"    # I
    .param p5, "animIn"    # I
    .param p6, "animOut"    # I

    .prologue
    .line 91
    new-instance v5, Lcom/rey/material/app/ToolbarManager$SimpleAnimator;

    invoke-direct {v5, p5, p6}, Lcom/rey/material/app/ToolbarManager$SimpleAnimator;-><init>(II)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/rey/material/app/ToolbarManager;-><init>(Landroid/support/v7/app/AppCompatDelegate;Landroid/support/v7/widget/Toolbar;IILcom/rey/material/app/ToolbarManager$Animator;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Landroid/support/v7/app/AppCompatDelegate;Landroid/support/v7/widget/Toolbar;IILcom/rey/material/app/ToolbarManager$Animator;)V
    .registers 7
    .param p1, "delegate"    # Landroid/support/v7/app/AppCompatDelegate;
    .param p2, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p3, "defaultGroupId"    # I
    .param p4, "rippleStyle"    # I
    .param p5, "animator"    # Lcom/rey/material/app/ToolbarManager$Animator;

    .prologue
    const/4 v0, 0x0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput v0, p0, Lcom/rey/material/app/ToolbarManager;->mCurrentGroup:I

    .line 42
    iput-boolean v0, p0, Lcom/rey/material/app/ToolbarManager;->mGroupChanged:Z

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/app/ToolbarManager;->mMenuDataChanged:Z

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    .line 61
    new-instance v0, Lcom/rey/material/app/ToolbarManager$1;

    invoke-direct {v0, p0}, Lcom/rey/material/app/ToolbarManager$1;-><init>(Lcom/rey/material/app/ToolbarManager;)V

    iput-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mAnimations:Ljava/util/ArrayList;

    .line 70
    new-instance v0, Lcom/rey/material/app/ToolbarManager$2;

    invoke-direct {v0, p0}, Lcom/rey/material/app/ToolbarManager$2;-><init>(Lcom/rey/material/app/ToolbarManager;)V

    iput-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mOutAnimationEndListener:Landroid/view/animation/Animation$AnimationListener;

    .line 95
    iput-object p1, p0, Lcom/rey/material/app/ToolbarManager;->mAppCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;

    .line 96
    iput-object p2, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 97
    iput p3, p0, Lcom/rey/material/app/ToolbarManager;->mCurrentGroup:I

    .line 98
    iput p4, p0, Lcom/rey/material/app/ToolbarManager;->mRippleStyle:I

    .line 99
    iput-object p5, p0, Lcom/rey/material/app/ToolbarManager;->mAnimator:Lcom/rey/material/app/ToolbarManager$Animator;

    .line 100
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mAppCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;

    invoke-virtual {v0, p2}, Landroid/support/v7/app/AppCompatDelegate;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 101
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/app/ToolbarManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/app/ToolbarManager;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/rey/material/app/ToolbarManager;->onGlobalLayout()V

    return-void
.end method

.method static synthetic access$100(Lcom/rey/material/app/ToolbarManager;)Landroid/support/v7/app/AppCompatDelegate;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/ToolbarManager;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mAppCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;

    return-object v0
.end method

.method private animateIn()V
    .registers 7

    .prologue
    .line 305
    invoke-direct {p0}, Lcom/rey/material/app/ToolbarManager;->getMenuView()Landroid/support/v7/widget/ActionMenuView;

    move-result-object v4

    .line 307
    .local v4, "menuView":Landroid/support/v7/widget/ActionMenuView;
    const/4 v3, 0x0

    .local v3, "i":I
    if-nez v4, :cond_1c

    const/4 v2, 0x0

    .local v2, "count":I
    :goto_8
    if-ge v3, v2, :cond_21

    .line 308
    invoke-virtual {v4, v3}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 309
    .local v1, "child":Landroid/view/View;
    iget-object v5, p0, Lcom/rey/material/app/ToolbarManager;->mAnimator:Lcom/rey/material/app/ToolbarManager$Animator;

    invoke-interface {v5, v1, v3}, Lcom/rey/material/app/ToolbarManager$Animator;->getInAnimation(Landroid/view/View;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 310
    .local v0, "anim":Landroid/view/animation/Animation;
    if-eqz v0, :cond_19

    .line 311
    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 307
    :cond_19
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .end local v0    # "anim":Landroid/view/animation/Animation;
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "count":I
    :cond_1c
    invoke-virtual {v4}, Landroid/support/v7/widget/ActionMenuView;->getChildCount()I

    move-result v2

    goto :goto_8

    .line 313
    .restart local v2    # "count":I
    :cond_21
    return-void
.end method

.method private animateOut()V
    .registers 13

    .prologue
    .line 274
    invoke-direct {p0}, Lcom/rey/material/app/ToolbarManager;->getMenuView()Landroid/support/v7/widget/ActionMenuView;

    move-result-object v4

    .line 275
    .local v4, "menuView":Landroid/support/v7/widget/ActionMenuView;
    if-nez v4, :cond_42

    const/4 v2, 0x0

    .line 276
    .local v2, "count":I
    :goto_7
    const/4 v5, 0x0

    .line 277
    .local v5, "slowestAnimation":Landroid/view/animation/Animation;
    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 278
    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 280
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_13
    if-ge v3, v2, :cond_47

    .line 281
    invoke-virtual {v4, v3}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 282
    .local v1, "child":Landroid/view/View;
    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mAnimator:Lcom/rey/material/app/ToolbarManager$Animator;

    invoke-interface {v6, v1, v3}, Lcom/rey/material/app/ToolbarManager$Animator;->getOutAnimation(Landroid/view/View;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 283
    .local v0, "anim":Landroid/view/animation/Animation;
    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 284
    if-eqz v0, :cond_3f

    .line 285
    if-eqz v5, :cond_3e

    invoke-virtual {v5}, Landroid/view/animation/Animation;->getStartOffset()J

    move-result-wide v6

    invoke-virtual {v5}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v8

    add-long/2addr v6, v8

    invoke-virtual {v0}, Landroid/view/animation/Animation;->getStartOffset()J

    move-result-wide v8

    invoke-virtual {v0}, Landroid/view/animation/Animation;->getDuration()J

    move-result-wide v10

    add-long/2addr v8, v10

    cmp-long v6, v6, v8

    if-gez v6, :cond_3f

    .line 286
    :cond_3e
    move-object v5, v0

    .line 280
    :cond_3f
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 275
    .end local v0    # "anim":Landroid/view/animation/Animation;
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "count":I
    .end local v3    # "i":I
    .end local v5    # "slowestAnimation":Landroid/view/animation/Animation;
    :cond_42
    invoke-virtual {v4}, Landroid/support/v7/widget/ActionMenuView;->getChildCount()I

    move-result v2

    goto :goto_7

    .line 289
    .restart local v2    # "count":I
    .restart local v3    # "i":I
    .restart local v5    # "slowestAnimation":Landroid/view/animation/Animation;
    :cond_47
    if-nez v5, :cond_55

    .line 290
    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mOutAnimationEndListener:Landroid/view/animation/Animation$AnimationListener;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Landroid/view/animation/Animation$AnimationListener;->onAnimationEnd(Landroid/view/animation/Animation;)V

    .line 301
    :cond_4f
    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 302
    return-void

    .line 292
    :cond_55
    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mOutAnimationEndListener:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {v5, v6}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 294
    const/4 v3, 0x0

    :goto_5b
    if-ge v3, v2, :cond_4f

    .line 295
    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mAnimations:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/animation/Animation;

    .line 296
    .restart local v0    # "anim":Landroid/view/animation/Animation;
    if-eqz v0, :cond_6e

    .line 297
    invoke-virtual {v4, v3}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 294
    :cond_6e
    add-int/lit8 v3, v3, 0x1

    goto :goto_5b
.end method

.method private dispatchOnToolbarGroupChanged(II)V
    .registers 6
    .param p1, "oldGroupId"    # I
    .param p2, "groupId"    # I

    .prologue
    .line 131
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_8
    if-ltz v0, :cond_2a

    .line 132
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 133
    .local v1, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_20

    .line 134
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 131
    :goto_1d
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 136
    :cond_20
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;

    invoke-interface {v2, p1, p2}, Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;->onToolbarGroupChanged(II)V

    goto :goto_1d

    .line 138
    .end local v1    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;>;"
    :cond_2a
    return-void
.end method

.method private getBackground()Lcom/rey/material/drawable/ToolbarRippleDrawable;
    .registers 4

    .prologue
    .line 232
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mBuilder:Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    if-nez v0, :cond_13

    .line 233
    new-instance v0, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    iget-object v1, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/app/ToolbarManager;->mRippleStyle:I

    invoke-direct {v0, v1, v2}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mBuilder:Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    .line 235
    :cond_13
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mBuilder:Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    invoke-virtual {v0}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->build()Lcom/rey/material/drawable/ToolbarRippleDrawable;

    move-result-object v0

    return-object v0
.end method

.method private getMenuView()Landroid/support/v7/widget/ActionMenuView;
    .registers 4

    .prologue
    .line 239
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-nez v2, :cond_1b

    .line 240
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v2}, Landroid/support/v7/widget/Toolbar;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1b

    .line 241
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/Toolbar;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 242
    .local v0, "child":Landroid/view/View;
    instance-of v2, v0, Landroid/support/v7/widget/ActionMenuView;

    if-eqz v2, :cond_1e

    .line 243
    check-cast v0, Landroid/support/v7/widget/ActionMenuView;

    .end local v0    # "child":Landroid/view/View;
    iput-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    .line 249
    .end local v1    # "i":I
    :cond_1b
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    return-object v2

    .line 240
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "i":I
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method private onGlobalLayout()V
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 253
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-lt v5, v6, :cond_3c

    .line 254
    iget-object v5, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v5}, Landroid/support/v7/widget/Toolbar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v5, v6}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 258
    :goto_12
    invoke-direct {p0}, Lcom/rey/material/app/ToolbarManager;->getMenuView()Landroid/support/v7/widget/ActionMenuView;

    move-result-object v3

    .line 259
    .local v3, "menuView":Landroid/support/v7/widget/ActionMenuView;
    const/4 v2, 0x0

    .local v2, "i":I
    if-nez v3, :cond_48

    move v1, v4

    .local v1, "count":I
    :goto_1a
    if-ge v2, v1, :cond_4d

    .line 260
    invoke-virtual {v3, v2}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 261
    .local v0, "child":Landroid/view/View;
    iget v5, p0, Lcom/rey/material/app/ToolbarManager;->mRippleStyle:I

    if-eqz v5, :cond_39

    .line 262
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-eqz v5, :cond_32

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    instance-of v5, v5, Lcom/rey/material/drawable/ToolbarRippleDrawable;

    if-nez v5, :cond_39

    .line 263
    :cond_32
    invoke-direct {p0}, Lcom/rey/material/app/ToolbarManager;->getBackground()Lcom/rey/material/drawable/ToolbarRippleDrawable;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 259
    :cond_39
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 256
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "count":I
    .end local v2    # "i":I
    .end local v3    # "menuView":Landroid/support/v7/widget/ActionMenuView;
    :cond_3c
    iget-object v5, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v5}, Landroid/support/v7/widget/Toolbar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v5, v6}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_12

    .line 259
    .restart local v2    # "i":I
    .restart local v3    # "menuView":Landroid/support/v7/widget/ActionMenuView;
    :cond_48
    invoke-virtual {v3}, Landroid/support/v7/widget/ActionMenuView;->getChildCount()I

    move-result v1

    goto :goto_1a

    .line 267
    .restart local v1    # "count":I
    :cond_4d
    iget-boolean v5, p0, Lcom/rey/material/app/ToolbarManager;->mGroupChanged:Z

    if-eqz v5, :cond_56

    .line 268
    invoke-direct {p0}, Lcom/rey/material/app/ToolbarManager;->animateIn()V

    .line 269
    iput-boolean v4, p0, Lcom/rey/material/app/ToolbarManager;->mGroupChanged:Z

    .line 271
    :cond_56
    return-void
.end method


# virtual methods
.method public createMenu(I)V
    .registers 3
    .param p1, "menuId"    # I

    .prologue
    .line 166
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/Toolbar;->inflateMenu(I)V

    .line 167
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/app/ToolbarManager;->mMenuDataChanged:Z

    .line 168
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mAppCompatDelegate:Landroid/support/v7/app/AppCompatDelegate;

    if-nez v0, :cond_f

    .line 169
    invoke-virtual {p0}, Lcom/rey/material/app/ToolbarManager;->onPrepareMenu()V

    .line 170
    :cond_f
    return-void
.end method

.method public getCurrentGroup()I
    .registers 2

    .prologue
    .line 144
    iget v0, p0, Lcom/rey/material/app/ToolbarManager;->mCurrentGroup:I

    return v0
.end method

.method public isNavigationBackState()Z
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    invoke-virtual {v0}, Lcom/rey/material/app/ToolbarManager$NavigationManager;->isBackState()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public notifyNavigationStateChanged()V
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    if-eqz v0, :cond_9

    .line 211
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    invoke-virtual {v0}, Lcom/rey/material/app/ToolbarManager$NavigationManager;->notifyStateChanged()V

    .line 212
    :cond_9
    return-void
.end method

.method public notifyNavigationStateInvalidated()V
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    if-eqz v0, :cond_9

    .line 203
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    invoke-virtual {v0}, Lcom/rey/material/app/ToolbarManager$NavigationManager;->notifyStateInvalidated()V

    .line 204
    :cond_9
    return-void
.end method

.method public notifyNavigationStateProgressChanged(ZF)V
    .registers 4
    .param p1, "isBackState"    # Z
    .param p2, "progress"    # F

    .prologue
    .line 220
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    if-eqz v0, :cond_9

    .line 221
    iget-object v0, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/app/ToolbarManager$NavigationManager;->notifyStateProgressChanged(ZF)V

    .line 222
    :cond_9
    return-void
.end method

.method public onPrepareMenu()V
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 177
    iget-boolean v4, p0, Lcom/rey/material/app/ToolbarManager;->mGroupChanged:Z

    if-nez v4, :cond_9

    iget-boolean v4, p0, Lcom/rey/material/app/ToolbarManager;->mMenuDataChanged:Z

    if-eqz v4, :cond_3e

    .line 178
    :cond_9
    iget-object v4, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v4}, Landroid/support/v7/widget/Toolbar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    iget-object v6, p0, Lcom/rey/material/app/ToolbarManager;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v4, v6}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 180
    iget-object v4, p0, Lcom/rey/material/app/ToolbarManager;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v4}, Landroid/support/v7/widget/Toolbar;->getMenu()Landroid/view/Menu;

    move-result-object v3

    .line 181
    .local v3, "menu":Landroid/view/Menu;
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {v3}, Landroid/view/Menu;->size()I

    move-result v0

    .local v0, "count":I
    :goto_1f
    if-ge v1, v0, :cond_3c

    .line 182
    invoke-interface {v3, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 183
    .local v2, "item":Landroid/view/MenuItem;
    invoke-interface {v2}, Landroid/view/MenuItem;->getGroupId()I

    move-result v4

    iget v6, p0, Lcom/rey/material/app/ToolbarManager;->mCurrentGroup:I

    if-eq v4, v6, :cond_33

    invoke-interface {v2}, Landroid/view/MenuItem;->getGroupId()I

    move-result v4

    if-nez v4, :cond_3a

    :cond_33
    const/4 v4, 0x1

    :goto_34
    invoke-interface {v2, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 181
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    :cond_3a
    move v4, v5

    .line 183
    goto :goto_34

    .line 186
    .end local v2    # "item":Landroid/view/MenuItem;
    :cond_3c
    iput-boolean v5, p0, Lcom/rey/material/app/ToolbarManager;->mMenuDataChanged:Z

    .line 188
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v3    # "menu":Landroid/view/Menu;
    :cond_3e
    return-void
.end method

.method public registerOnToolbarGroupChangedListener(Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;)V
    .registers 6
    .param p1, "listener"    # Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;

    .prologue
    .line 107
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_8
    if-ltz v0, :cond_27

    .line 108
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 109
    .local v1, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_20

    .line 110
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 107
    :cond_1d
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 111
    :cond_20
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_1d

    .line 116
    .end local v1    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;>;"
    :goto_26
    return-void

    .line 115
    :cond_27
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26
.end method

.method public setCurrentGroup(I)V
    .registers 4
    .param p1, "groupId"    # I

    .prologue
    .line 152
    iget v1, p0, Lcom/rey/material/app/ToolbarManager;->mCurrentGroup:I

    if-eq v1, p1, :cond_13

    .line 153
    iget v0, p0, Lcom/rey/material/app/ToolbarManager;->mCurrentGroup:I

    .line 154
    .local v0, "oldGroupId":I
    iput p1, p0, Lcom/rey/material/app/ToolbarManager;->mCurrentGroup:I

    .line 155
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/rey/material/app/ToolbarManager;->mGroupChanged:Z

    .line 156
    iget v1, p0, Lcom/rey/material/app/ToolbarManager;->mCurrentGroup:I

    invoke-direct {p0, v0, v1}, Lcom/rey/material/app/ToolbarManager;->dispatchOnToolbarGroupChanged(II)V

    .line 157
    invoke-direct {p0}, Lcom/rey/material/app/ToolbarManager;->animateOut()V

    .line 159
    .end local v0    # "oldGroupId":I
    :cond_13
    return-void
.end method

.method public setNavigationManager(Lcom/rey/material/app/ToolbarManager$NavigationManager;)V
    .registers 2
    .param p1, "navigationManager"    # Lcom/rey/material/app/ToolbarManager$NavigationManager;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/rey/material/app/ToolbarManager;->mNavigationManager:Lcom/rey/material/app/ToolbarManager$NavigationManager;

    .line 195
    invoke-virtual {p0}, Lcom/rey/material/app/ToolbarManager;->notifyNavigationStateInvalidated()V

    .line 196
    return-void
.end method

.method public unregisterOnToolbarGroupChangedListener(Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;)V
    .registers 5
    .param p1, "listener"    # Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;

    .prologue
    .line 123
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_8
    if-ltz v0, :cond_26

    .line 124
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 125
    .local v1, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1e

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_23

    .line 126
    :cond_1e
    iget-object v2, p0, Lcom/rey/material/app/ToolbarManager;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 123
    :cond_23
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 128
    .end local v1    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener;>;"
    :cond_26
    return-void
.end method
