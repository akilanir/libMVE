.class public Lcom/rey/material/app/Dialog;
.super Landroid/app/Dialog;
.source "Dialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/app/Dialog$Builder;,
        Lcom/rey/material/app/Dialog$DialogCardView;,
        Lcom/rey/material/app/Dialog$ContainerFrameLayout;
    }
.end annotation


# static fields
.field public static final ACTION_NEGATIVE:I

.field public static final ACTION_NEUTRAL:I

.field public static final ACTION_POSITIVE:I

.field public static final TITLE:I


# instance fields
.field protected mActionHeight:I

.field protected mActionMinWidth:I

.field protected mActionOuterHeight:I

.field protected mActionOuterPadding:I

.field protected mActionPadding:I

.field private mCancelable:Z

.field private mCanceledOnTouchOutside:Z

.field private mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

.field private mContainer:Lcom/rey/material/app/Dialog$ContainerFrameLayout;

.field private mContent:Landroid/view/View;

.field protected mContentPadding:I

.field protected mDialogHorizontalPadding:I

.field protected mDialogVerticalPadding:I

.field private final mDismissAction:Ljava/lang/Runnable;

.field private final mHandler:Landroid/os/Handler;

.field protected mInAnimationId:I

.field private mLayoutActionVertical:Z

.field private mLayoutHeight:I

.field private mLayoutWidth:I

.field private mMaxHeight:I

.field private mMaxWidth:I

.field protected mNegativeAction:Lcom/rey/material/widget/Button;

.field protected mNeutralAction:Lcom/rey/material/widget/Button;

.field protected mOutAnimationId:I

.field protected mPositiveAction:Lcom/rey/material/widget/Button;

.field protected mTitle:Lcom/rey/material/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 88
    invoke-static {}, Lcom/rey/material/util/ViewUtil;->generateViewId()I

    move-result v0

    sput v0, Lcom/rey/material/app/Dialog;->TITLE:I

    .line 92
    invoke-static {}, Lcom/rey/material/util/ViewUtil;->generateViewId()I

    move-result v0

    sput v0, Lcom/rey/material/app/Dialog;->ACTION_POSITIVE:I

    .line 96
    invoke-static {}, Lcom/rey/material/util/ViewUtil;->generateViewId()I

    move-result v0

    sput v0, Lcom/rey/material/app/Dialog;->ACTION_NEGATIVE:I

    .line 100
    invoke-static {}, Lcom/rey/material/util/ViewUtil;->generateViewId()I

    move-result v0

    sput v0, Lcom/rey/material/app/Dialog;->ACTION_NEUTRAL:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 103
    sget v0, Lcom/rey/material/R$style;->Material_App_Dialog_Light:I

    invoke-direct {p0, p1, v0}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "style"    # I

    .prologue
    const/4 v3, -0x1

    const/4 v1, -0x2

    const/4 v2, 0x1

    .line 108
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 44
    iput v1, p0, Lcom/rey/material/app/Dialog;->mLayoutWidth:I

    .line 45
    iput v1, p0, Lcom/rey/material/app/Dialog;->mLayoutHeight:I

    .line 68
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/rey/material/app/Dialog;->mHandler:Landroid/os/Handler;

    .line 69
    new-instance v1, Lcom/rey/material/app/Dialog$1;

    invoke-direct {v1, p0}, Lcom/rey/material/app/Dialog$1;-><init>(Lcom/rey/material/app/Dialog;)V

    iput-object v1, p0, Lcom/rey/material/app/Dialog;->mDismissAction:Ljava/lang/Runnable;

    .line 80
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rey/material/app/Dialog;->mLayoutActionVertical:Z

    .line 82
    iput-boolean v2, p0, Lcom/rey/material/app/Dialog;->mCancelable:Z

    .line 83
    iput-boolean v2, p0, Lcom/rey/material/app/Dialog;->mCanceledOnTouchOutside:Z

    .line 112
    invoke-virtual {p0, v2}, Lcom/rey/material/app/Dialog;->requestWindowFeature(I)Z

    .line 113
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {}, Lcom/rey/material/drawable/BlankDrawable;->getInstance()Lcom/rey/material/drawable/BlankDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 114
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 115
    .local v0, "layout":Landroid/view/WindowManager$LayoutParams;
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 116
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 117
    sget v1, Lcom/rey/material/R$style;->DialogNoAnimation:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 118
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 120
    invoke-direct {p0, p1, p2}, Lcom/rey/material/app/Dialog;->init(Landroid/content/Context;I)V

    .line 121
    return-void
.end method

.method static synthetic access$001(Lcom/rey/material/app/Dialog;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method static synthetic access$100(Lcom/rey/material/app/Dialog;)Lcom/rey/material/app/Dialog$DialogCardView;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/rey/material/app/Dialog;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/rey/material/app/Dialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/rey/material/app/Dialog;->mLayoutActionVertical:Z

    return v0
.end method

.method static synthetic access$1102(Lcom/rey/material/app/Dialog;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;
    .param p1, "x1"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/rey/material/app/Dialog;->mLayoutActionVertical:Z

    return p1
.end method

.method static synthetic access$200(Lcom/rey/material/app/Dialog;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mDismissAction:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$300(Lcom/rey/material/app/Dialog;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$400(Lcom/rey/material/app/Dialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/rey/material/app/Dialog;->mCancelable:Z

    return v0
.end method

.method static synthetic access$500(Lcom/rey/material/app/Dialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/rey/material/app/Dialog;->mCanceledOnTouchOutside:Z

    return v0
.end method

.method static synthetic access$600(Lcom/rey/material/app/Dialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget v0, p0, Lcom/rey/material/app/Dialog;->mMaxWidth:I

    return v0
.end method

.method static synthetic access$700(Lcom/rey/material/app/Dialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget v0, p0, Lcom/rey/material/app/Dialog;->mMaxHeight:I

    return v0
.end method

.method static synthetic access$800(Lcom/rey/material/app/Dialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget v0, p0, Lcom/rey/material/app/Dialog;->mLayoutWidth:I

    return v0
.end method

.method static synthetic access$900(Lcom/rey/material/app/Dialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/Dialog;

    .prologue
    .line 41
    iget v0, p0, Lcom/rey/material/app/Dialog;->mLayoutHeight:I

    return v0
.end method

.method private init(Landroid/content/Context;I)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "style"    # I

    .prologue
    const/16 v1, 0x18

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 124
    invoke-static {p1, v1}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog;->mContentPadding:I

    .line 125
    const/16 v0, 0x40

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog;->mActionMinWidth:I

    .line 126
    const/16 v0, 0x24

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog;->mActionHeight:I

    .line 127
    const/16 v0, 0x30

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog;->mActionOuterHeight:I

    .line 128
    const/16 v0, 0x8

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    .line 129
    const/16 v0, 0x10

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog;->mActionOuterPadding:I

    .line 130
    const/16 v0, 0x28

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog;->mDialogHorizontalPadding:I

    .line 131
    invoke-static {p1, v1}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/rey/material/app/Dialog;->mDialogVerticalPadding:I

    .line 133
    new-instance v0, Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-direct {v0, p0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;-><init>(Lcom/rey/material/app/Dialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    .line 134
    new-instance v0, Lcom/rey/material/app/Dialog$ContainerFrameLayout;

    invoke-direct {v0, p0, p1}, Lcom/rey/material/app/Dialog$ContainerFrameLayout;-><init>(Lcom/rey/material/app/Dialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/Dialog;->mContainer:Lcom/rey/material/app/Dialog$ContainerFrameLayout;

    .line 135
    new-instance v0, Lcom/rey/material/widget/TextView;

    invoke-direct {v0, p1}, Lcom/rey/material/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    .line 136
    new-instance v0, Lcom/rey/material/widget/Button;

    invoke-direct {v0, p1}, Lcom/rey/material/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    .line 137
    new-instance v0, Lcom/rey/material/widget/Button;

    invoke-direct {v0, p1}, Lcom/rey/material/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    .line 138
    new-instance v0, Lcom/rey/material/widget/Button;

    invoke-direct {v0, p1}, Lcom/rey/material/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    .line 140
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, v6}, Lcom/rey/material/app/Dialog$DialogCardView;->setPreventCornerOverlap(Z)V

    .line 141
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, v7}, Lcom/rey/material/app/Dialog$DialogCardView;->setUseCompatPadding(Z)V

    .line 143
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    sget v1, Lcom/rey/material/app/Dialog;->TITLE:I

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/TextView;->setId(I)V

    .line 144
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    const v1, 0x800003

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/TextView;->setGravity(I)V

    .line 145
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    iget v1, p0, Lcom/rey/material/app/Dialog;->mContentPadding:I

    iget v2, p0, Lcom/rey/material/app/Dialog;->mContentPadding:I

    iget v3, p0, Lcom/rey/material/app/Dialog;->mContentPadding:I

    iget v4, p0, Lcom/rey/material/app/Dialog;->mContentPadding:I

    iget v5, p0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/rey/material/widget/TextView;->setPadding(IIII)V

    .line 146
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    sget v1, Lcom/rey/material/app/Dialog;->ACTION_POSITIVE:I

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Button;->setId(I)V

    .line 147
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    iget v1, p0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    iget v2, p0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    invoke-virtual {v0, v1, v6, v2, v6}, Lcom/rey/material/widget/Button;->setPadding(IIII)V

    .line 148
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, v6}, Lcom/rey/material/widget/Button;->setBackgroundResource(I)V

    .line 149
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    sget v1, Lcom/rey/material/app/Dialog;->ACTION_NEGATIVE:I

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Button;->setId(I)V

    .line 150
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    iget v1, p0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    iget v2, p0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    invoke-virtual {v0, v1, v6, v2, v6}, Lcom/rey/material/widget/Button;->setPadding(IIII)V

    .line 151
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, v6}, Lcom/rey/material/widget/Button;->setBackgroundResource(I)V

    .line 152
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    sget v1, Lcom/rey/material/app/Dialog;->ACTION_NEUTRAL:I

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Button;->setId(I)V

    .line 153
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    iget v1, p0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    iget v2, p0, Lcom/rey/material/app/Dialog;->mActionPadding:I

    invoke-virtual {v0, v1, v6, v2, v6}, Lcom/rey/material/widget/Button;->setPadding(IIII)V

    .line 154
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, v6}, Lcom/rey/material/widget/Button;->setBackgroundResource(I)V

    .line 156
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mContainer:Lcom/rey/material/app/Dialog$ContainerFrameLayout;

    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->addView(Landroid/view/View;)V

    .line 157
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$DialogCardView;->addView(Landroid/view/View;)V

    .line 158
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$DialogCardView;->addView(Landroid/view/View;)V

    .line 159
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$DialogCardView;->addView(Landroid/view/View;)V

    .line 160
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$DialogCardView;->addView(Landroid/view/View;)V

    .line 162
    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->windowBackground(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->backgroundColor(I)Lcom/rey/material/app/Dialog;

    .line 163
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->elevation(F)Lcom/rey/material/app/Dialog;

    .line 164
    const/4 v0, 0x2

    invoke-static {p1, v0}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->cornerRadius(F)Lcom/rey/material/app/Dialog;

    .line 165
    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->dimAmount(F)Lcom/rey/material/app/Dialog;

    .line 166
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->layoutDirection(I)Lcom/rey/material/app/Dialog;

    .line 167
    sget v0, Lcom/rey/material/R$style;->TextAppearance_AppCompat_Title:I

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->titleTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 168
    sget v0, Lcom/rey/material/R$style;->TextAppearance_AppCompat_Button:I

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->actionTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 169
    const/high16 v0, 0x1e000000

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->dividerColor(I)Lcom/rey/material/app/Dialog;

    .line 170
    invoke-static {p1, v7}, Lcom/rey/material/util/ThemeUtil;->dpToPx(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->dividerHeight(I)Lcom/rey/material/app/Dialog;

    .line 172
    invoke-virtual {p0, v7}, Lcom/rey/material/app/Dialog;->cancelable(Z)Lcom/rey/material/app/Dialog;

    .line 173
    invoke-virtual {p0, v7}, Lcom/rey/material/app/Dialog;->canceledOnTouchOutside(Z)Lcom/rey/material/app/Dialog;

    .line 174
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->clearContent()Lcom/rey/material/app/Dialog;

    .line 175
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->onCreate()V

    .line 176
    invoke-virtual {p0, p2}, Lcom/rey/material/app/Dialog;->applyStyle(I)Lcom/rey/material/app/Dialog;

    .line 178
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mContainer:Lcom/rey/material/app/Dialog$ContainerFrameLayout;

    invoke-super {p0, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 179
    return-void
.end method


# virtual methods
.method public actionBackground(I)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 537
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->positiveActionBackground(I)Lcom/rey/material/app/Dialog;

    .line 538
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->negativeActionBackground(I)Lcom/rey/material/app/Dialog;

    .line 539
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->neutralActionBackground(I)Lcom/rey/material/app/Dialog;

    .line 540
    return-object p0
.end method

.method public actionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 549
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->positiveActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    .line 550
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->negativeActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    .line 551
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->neutralActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    .line 552
    return-object p0
.end method

.method public actionRipple(I)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 561
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->positiveActionRipple(I)Lcom/rey/material/app/Dialog;

    .line 562
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->negativeActionRipple(I)Lcom/rey/material/app/Dialog;

    .line 563
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->neutralActionRipple(I)Lcom/rey/material/app/Dialog;

    .line 564
    return-object p0
.end method

.method public actionTextAppearance(I)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 573
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->positiveActionTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 574
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->negativeActionTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 575
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->neutralActionTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 576
    return-object p0
.end method

.method public actionTextColor(I)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 597
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->positiveActionTextColor(I)Lcom/rey/material/app/Dialog;

    .line 598
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->negativeActionTextColor(I)Lcom/rey/material/app/Dialog;

    .line 599
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->neutralActionTextColor(I)Lcom/rey/material/app/Dialog;

    .line 600
    return-object p0
.end method

.method public actionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 585
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->positiveActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;

    .line 586
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->negativeActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;

    .line 587
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->neutralActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;

    .line 588
    return-object p0
.end method

.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1017
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 1018
    return-void
.end method

.method public applyStyle(I)Lcom/rey/material/app/Dialog;
    .registers 32
    .param p1, "resId"    # I

    .prologue
    .line 185
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v8

    .line 186
    .local v8, "context":Landroid/content/Context;
    sget-object v29, Lcom/rey/material/R$styleable;->Dialog:[I

    move/from16 v0, p1

    move-object/from16 v1, v29

    invoke-virtual {v8, v0, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 188
    .local v2, "a":Landroid/content/res/TypedArray;
    move-object/from16 v0, p0

    iget v13, v0, Lcom/rey/material/app/Dialog;->mLayoutWidth:I

    .line 189
    .local v13, "layout_width":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/rey/material/app/Dialog;->mLayoutHeight:I

    .line 190
    .local v12, "layout_height":I
    const/4 v11, 0x0

    .line 191
    .local v11, "layoutParamsDefined":Z
    const/16 v26, 0x0

    .line 192
    .local v26, "titleTextAppearance":I
    const/16 v27, 0x0

    .line 193
    .local v27, "titleTextColor":I
    const/16 v28, 0x0

    .line 194
    .local v28, "titleTextColorDefined":Z
    const/4 v3, 0x0

    .line 195
    .local v3, "actionBackground":I
    const/4 v4, 0x0

    .line 196
    .local v4, "actionRipple":I
    const/4 v5, 0x0

    .line 197
    .local v5, "actionTextAppearance":I
    const/4 v6, 0x0

    .line 198
    .local v6, "actionTextColors":Landroid/content/res/ColorStateList;
    const/16 v22, 0x0

    .line 199
    .local v22, "positiveActionBackground":I
    const/16 v23, 0x0

    .line 200
    .local v23, "positiveActionRipple":I
    const/16 v24, 0x0

    .line 201
    .local v24, "positiveActionTextAppearance":I
    const/16 v25, 0x0

    .line 202
    .local v25, "positiveActionTextColors":Landroid/content/res/ColorStateList;
    const/4 v14, 0x0

    .line 203
    .local v14, "negativeActionBackground":I
    const/4 v15, 0x0

    .line 204
    .local v15, "negativeActionRipple":I
    const/16 v16, 0x0

    .line 205
    .local v16, "negativeActionTextAppearance":I
    const/16 v17, 0x0

    .line 206
    .local v17, "negativeActionTextColors":Landroid/content/res/ColorStateList;
    const/16 v18, 0x0

    .line 207
    .local v18, "neutralActionBackground":I
    const/16 v19, 0x0

    .line 208
    .local v19, "neutralActionRipple":I
    const/16 v20, 0x0

    .line 209
    .local v20, "neutralActionTextAppearance":I
    const/16 v21, 0x0

    .line 211
    .local v21, "neutralActionTextColors":Landroid/content/res/ColorStateList;
    const/4 v10, 0x0

    .local v10, "i":I
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v9

    .local v9, "count":I
    :goto_3c
    if-ge v10, v9, :cond_2c3

    .line 212
    invoke-virtual {v2, v10}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v7

    .line 214
    .local v7, "attr":I
    sget v29, Lcom/rey/material/R$styleable;->Dialog_android_layout_width:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_54

    .line 215
    const/16 v29, -0x2

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v13

    .line 216
    const/4 v11, 0x1

    .line 211
    :cond_51
    :goto_51
    add-int/lit8 v10, v10, 0x1

    goto :goto_3c

    .line 218
    :cond_54
    sget v29, Lcom/rey/material/R$styleable;->Dialog_android_layout_height:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_64

    .line 219
    const/16 v29, -0x2

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v12

    .line 220
    const/4 v11, 0x1

    goto :goto_51

    .line 222
    :cond_64
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_maxWidth:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_7a

    .line 223
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->maxWidth(I)Lcom/rey/material/app/Dialog;

    goto :goto_51

    .line 224
    :cond_7a
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_maxHeight:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_90

    .line 225
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->maxHeight(I)Lcom/rey/material/app/Dialog;

    goto :goto_51

    .line 226
    :cond_90
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_dimAmount:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_a6

    .line 227
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->dimAmount(F)Lcom/rey/material/app/Dialog;

    goto :goto_51

    .line 228
    :cond_a6
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_backgroundColor:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_bc

    .line 229
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->backgroundColor(I)Lcom/rey/material/app/Dialog;

    goto :goto_51

    .line 230
    :cond_bc
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_maxElevation:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_d8

    .line 231
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->maxElevation(F)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 232
    :cond_d8
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_elevation:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_f4

    .line 233
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->elevation(F)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 234
    :cond_f4
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_cornerRadius:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_110

    .line 235
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v29

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->cornerRadius(F)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 236
    :cond_110
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_layoutDirection:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_127

    .line 237
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->layoutDirection(I)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 238
    :cond_127
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_titleTextAppearance:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_137

    .line 239
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v26

    goto/16 :goto_51

    .line 240
    :cond_137
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_titleTextColor:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_149

    .line 241
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v27

    .line 242
    const/16 v28, 0x1

    goto/16 :goto_51

    .line 244
    :cond_149
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_actionBackground:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_159

    .line 245
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    goto/16 :goto_51

    .line 246
    :cond_159
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_actionRipple:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_169

    .line 247
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    goto/16 :goto_51

    .line 248
    :cond_169
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_actionTextAppearance:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_179

    .line 249
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    goto/16 :goto_51

    .line 250
    :cond_179
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_actionTextColor:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_185

    .line 251
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    goto/16 :goto_51

    .line 252
    :cond_185
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_positiveActionBackground:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_195

    .line 253
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v22

    goto/16 :goto_51

    .line 254
    :cond_195
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_positiveActionRipple:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_1a5

    .line 255
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v23

    goto/16 :goto_51

    .line 256
    :cond_1a5
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_positiveActionTextAppearance:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_1b5

    .line 257
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v24

    goto/16 :goto_51

    .line 258
    :cond_1b5
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_positiveActionTextColor:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_1c1

    .line 259
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v25

    goto/16 :goto_51

    .line 260
    :cond_1c1
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_negativeActionBackground:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_1d1

    .line 261
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    goto/16 :goto_51

    .line 262
    :cond_1d1
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_negativeActionRipple:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_1e1

    .line 263
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v15

    goto/16 :goto_51

    .line 264
    :cond_1e1
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_negativeActionTextAppearance:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_1f1

    .line 265
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v16

    goto/16 :goto_51

    .line 266
    :cond_1f1
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_negativeActionTextColor:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_1fd

    .line 267
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v17

    goto/16 :goto_51

    .line 268
    :cond_1fd
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_neutralActionBackground:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_20d

    .line 269
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v18

    goto/16 :goto_51

    .line 270
    :cond_20d
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_neutralActionRipple:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_21d

    .line 271
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v19

    goto/16 :goto_51

    .line 272
    :cond_21d
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_neutralActionTextAppearance:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_22d

    .line 273
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v20

    goto/16 :goto_51

    .line 274
    :cond_22d
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_neutralActionTextColor:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_239

    .line 275
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v21

    goto/16 :goto_51

    .line 276
    :cond_239
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_inAnimation:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_250

    .line 277
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->inAnimation(I)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 278
    :cond_250
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_outAnimation:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_267

    .line 279
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->outAnimation(I)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 280
    :cond_267
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_dividerColor:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_27e

    .line 281
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->dividerColor(I)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 282
    :cond_27e
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_dividerHeight:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_295

    .line 283
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->dividerHeight(I)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 284
    :cond_295
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_cancelable:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_2ac

    .line 285
    const/16 v29, 0x1

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->cancelable(Z)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 286
    :cond_2ac
    sget v29, Lcom/rey/material/R$styleable;->Dialog_di_canceledOnTouchOutside:I

    move/from16 v0, v29

    if-ne v7, v0, :cond_51

    .line 287
    const/16 v29, 0x1

    move/from16 v0, v29

    invoke-virtual {v2, v7, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->canceledOnTouchOutside(Z)Lcom/rey/material/app/Dialog;

    goto/16 :goto_51

    .line 290
    .end local v7    # "attr":I
    :cond_2c3
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 292
    if-eqz v11, :cond_2cd

    .line 293
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v12}, Lcom/rey/material/app/Dialog;->layoutParams(II)Lcom/rey/material/app/Dialog;

    .line 295
    :cond_2cd
    if-eqz v26, :cond_2d6

    .line 296
    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->titleTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 298
    :cond_2d6
    if-eqz v28, :cond_2df

    .line 299
    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->titleColor(I)Lcom/rey/material/app/Dialog;

    .line 301
    :cond_2df
    if-eqz v3, :cond_2e6

    .line 302
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/rey/material/app/Dialog;->actionBackground(I)Lcom/rey/material/app/Dialog;

    .line 304
    :cond_2e6
    if-eqz v4, :cond_2ed

    .line 305
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/rey/material/app/Dialog;->actionRipple(I)Lcom/rey/material/app/Dialog;

    .line 307
    :cond_2ed
    if-eqz v5, :cond_2f4

    .line 308
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/rey/material/app/Dialog;->actionTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 310
    :cond_2f4
    if-eqz v6, :cond_2fb

    .line 311
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/rey/material/app/Dialog;->actionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;

    .line 313
    :cond_2fb
    if-eqz v22, :cond_304

    .line 314
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->positiveActionBackground(I)Lcom/rey/material/app/Dialog;

    .line 316
    :cond_304
    if-eqz v23, :cond_30d

    .line 317
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->positiveActionRipple(I)Lcom/rey/material/app/Dialog;

    .line 319
    :cond_30d
    if-eqz v24, :cond_316

    .line 320
    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->positiveActionTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 322
    :cond_316
    if-eqz v25, :cond_31f

    .line 323
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->positiveActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;

    .line 325
    :cond_31f
    if-eqz v14, :cond_326

    .line 326
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/rey/material/app/Dialog;->negativeActionBackground(I)Lcom/rey/material/app/Dialog;

    .line 328
    :cond_326
    if-eqz v15, :cond_32d

    .line 329
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/rey/material/app/Dialog;->negativeActionRipple(I)Lcom/rey/material/app/Dialog;

    .line 331
    :cond_32d
    if-eqz v16, :cond_336

    .line 332
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->negativeActionTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 334
    :cond_336
    if-eqz v17, :cond_33f

    .line 335
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->negativeActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;

    .line 337
    :cond_33f
    if-eqz v18, :cond_348

    .line 338
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->neutralActionBackground(I)Lcom/rey/material/app/Dialog;

    .line 340
    :cond_348
    if-eqz v19, :cond_351

    .line 341
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->neutralActionRipple(I)Lcom/rey/material/app/Dialog;

    .line 343
    :cond_351
    if-eqz v20, :cond_35a

    .line 344
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->neutralActionTextAppearance(I)Lcom/rey/material/app/Dialog;

    .line 346
    :cond_35a
    if-eqz v21, :cond_363

    .line 347
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog;->neutralActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;

    .line 349
    :cond_363
    return-object p0
.end method

.method public backgroundColor(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 424
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setCardBackgroundColor(I)V

    .line 425
    return-object p0
.end method

.method public cancelable(Z)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "cancelable"    # Z

    .prologue
    .line 948
    invoke-super {p0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 949
    iput-boolean p1, p0, Lcom/rey/material/app/Dialog;->mCancelable:Z

    .line 950
    return-object p0
.end method

.method public canceledOnTouchOutside(Z)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "cancel"    # Z

    .prologue
    .line 962
    invoke-super {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 963
    iput-boolean p1, p0, Lcom/rey/material/app/Dialog;->mCanceledOnTouchOutside:Z

    .line 964
    return-object p0
.end method

.method public clearContent()Lcom/rey/material/app/Dialog;
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 357
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->title(I)Lcom/rey/material/app/Dialog;

    .line 358
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->positiveAction(I)Lcom/rey/material/app/Dialog;

    .line 359
    invoke-virtual {p0, v1}, Lcom/rey/material/app/Dialog;->positiveActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;

    .line 360
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->negativeAction(I)Lcom/rey/material/app/Dialog;

    .line 361
    invoke-virtual {p0, v1}, Lcom/rey/material/app/Dialog;->negativeActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;

    .line 362
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->neutralAction(I)Lcom/rey/material/app/Dialog;

    .line 363
    invoke-virtual {p0, v1}, Lcom/rey/material/app/Dialog;->neutralActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;

    .line 364
    invoke-virtual {p0, v1}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 365
    return-object p0
.end method

.method public contentMargin(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "margin"    # I

    .prologue
    .line 973
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setContentMargin(I)V

    .line 974
    return-object p0
.end method

.method public contentMargin(IIII)Lcom/rey/material/app/Dialog;
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 986
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/rey/material/app/Dialog$DialogCardView;->setContentMargin(IIII)V

    .line 987
    return-object p0
.end method

.method public contentView(I)Lcom/rey/material/app/Dialog;
    .registers 5
    .param p1, "layoutId"    # I

    .prologue
    .line 935
    if-nez p1, :cond_3

    .line 939
    .end local p0    # "this":Lcom/rey/material/app/Dialog;
    :goto_2
    return-object p0

    .line 938
    .restart local p0    # "this":Lcom/rey/material/app/Dialog;
    :cond_3
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 939
    .local v0, "v":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    move-result-object p0

    goto :goto_2
.end method

.method public contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 916
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;

    if-eq v0, p1, :cond_11

    .line 917
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;

    if-eqz v0, :cond_f

    .line 918
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$DialogCardView;->removeView(Landroid/view/View;)V

    .line 920
    :cond_f
    iput-object p1, p0, Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;

    .line 923
    :cond_11
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;

    if-eqz v0, :cond_1c

    .line 924
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mContent:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$DialogCardView;->addView(Landroid/view/View;)V

    .line 926
    :cond_1c
    return-object p0
.end method

.method public cornerRadius(F)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "radius"    # F

    .prologue
    .line 457
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setRadius(F)V

    .line 458
    return-object p0
.end method

.method public dimAmount(F)Lcom/rey/material/app/Dialog;
    .registers 6
    .param p1, "amount"    # F

    .prologue
    const/4 v3, 0x2

    .line 406
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 407
    .local v1, "window":Landroid/view/Window;
    const/4 v2, 0x0

    cmpl-float v2, p1, v2

    if-lez v2, :cond_17

    .line 408
    invoke-virtual {v1, v3}, Landroid/view/Window;->addFlags(I)V

    .line 409
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 410
    .local v0, "lp":Landroid/view/WindowManager$LayoutParams;
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 411
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 415
    .end local v0    # "lp":Landroid/view/WindowManager$LayoutParams;
    :goto_16
    return-object p0

    .line 414
    :cond_17
    invoke-virtual {v1, v3}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_16
.end method

.method public dismiss()V
    .registers 4

    .prologue
    .line 1048
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_7

    .line 1070
    :goto_6
    return-void

    .line 1051
    :cond_7
    iget v1, p0, Lcom/rey/material/app/Dialog;->mOutAnimationId:I

    if-eqz v1, :cond_25

    .line 1052
    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mContainer:Lcom/rey/material/app/Dialog$ContainerFrameLayout;

    invoke-virtual {v1}, Lcom/rey/material/app/Dialog$ContainerFrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/app/Dialog;->mOutAnimationId:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 1053
    .local v0, "anim":Landroid/view/animation/Animation;
    new-instance v1, Lcom/rey/material/app/Dialog$3;

    invoke-direct {v1, p0}, Lcom/rey/material/app/Dialog$3;-><init>(Lcom/rey/material/app/Dialog;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1066
    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v1, v0}, Lcom/rey/material/app/Dialog$DialogCardView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_6

    .line 1069
    .end local v0    # "anim":Landroid/view/animation/Animation;
    :cond_25
    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/rey/material/app/Dialog;->mDismissAction:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_6
.end method

.method public dismissImmediately()V
    .registers 3

    .prologue
    .line 1040
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 1042
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_e

    .line 1043
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mDismissAction:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1044
    :cond_e
    return-void
.end method

.method public dividerColor(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 467
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setDividerColor(I)V

    .line 468
    return-object p0
.end method

.method public dividerHeight(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 477
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setDividerHeight(I)V

    .line 478
    return-object p0
.end method

.method public elevation(F)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "elevation"    # F

    .prologue
    .line 434
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0}, Lcom/rey/material/app/Dialog$DialogCardView;->getMaxCardElevation()F

    move-result v0

    cmpg-float v0, v0, p1

    if-gez v0, :cond_f

    .line 435
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setMaxCardElevation(F)V

    .line 437
    :cond_f
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setCardElevation(F)V

    .line 438
    return-object p0
.end method

.method public inAnimation(I)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 886
    iput p1, p0, Lcom/rey/material/app/Dialog;->mInAnimationId:I

    .line 887
    return-object p0
.end method

.method public layoutDirection(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "direction"    # I

    .prologue
    .line 876
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->setLayoutDirection(Landroid/view/View;I)V

    .line 877
    return-object p0
.end method

.method public layoutParams(II)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 375
    iput p1, p0, Lcom/rey/material/app/Dialog;->mLayoutWidth:I

    .line 376
    iput p2, p0, Lcom/rey/material/app/Dialog;->mLayoutHeight:I

    .line 377
    return-object p0
.end method

.method public maxElevation(F)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "elevation"    # F

    .prologue
    .line 447
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setMaxCardElevation(F)V

    .line 448
    return-object p0
.end method

.method public maxHeight(I)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 396
    iput p1, p0, Lcom/rey/material/app/Dialog;->mMaxHeight:I

    .line 397
    return-object p0
.end method

.method public maxWidth(I)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 386
    iput p1, p0, Lcom/rey/material/app/Dialog;->mMaxWidth:I

    .line 387
    return-object p0
.end method

.method public negativeAction(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 709
    if-nez p1, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->negativeAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public negativeAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "action"    # Ljava/lang/CharSequence;

    .prologue
    .line 698
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 699
    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/16 v0, 0x8

    :goto_f
    invoke-virtual {v1, v0}, Lcom/rey/material/widget/Button;->setVisibility(I)V

    .line 700
    return-object p0

    .line 699
    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public negativeActionBackground(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 728
    if-nez p1, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->negativeActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_3
.end method

.method public negativeActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 718
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-static {v0, p1}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 719
    return-object p0
.end method

.method public negativeActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 777
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 778
    return-object p0
.end method

.method public negativeActionRipple(I)Lcom/rey/material/app/Dialog;
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 737
    new-instance v1, Lcom/rey/material/drawable/RippleDrawable$Builder;

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v0

    .line 738
    .local v0, "drawable":Lcom/rey/material/drawable/RippleDrawable;
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->negativeActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    move-result-object v1

    return-object v1
.end method

.method public negativeActionTextAppearance(I)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 747
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/rey/material/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 748
    return-object p0
.end method

.method public negativeActionTextColor(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 767
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setTextColor(I)V

    .line 768
    return-object p0
.end method

.method public negativeActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 757
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNegativeAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 758
    return-object p0
.end method

.method public neutralAction(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 798
    if-nez p1, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->neutralAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public neutralAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "action"    # Ljava/lang/CharSequence;

    .prologue
    .line 787
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 788
    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/16 v0, 0x8

    :goto_f
    invoke-virtual {v1, v0}, Lcom/rey/material/widget/Button;->setVisibility(I)V

    .line 789
    return-object p0

    .line 788
    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public neutralActionBackground(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 817
    if-nez p1, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->neutralActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_3
.end method

.method public neutralActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 807
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-static {v0, p1}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 808
    return-object p0
.end method

.method public neutralActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 866
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 867
    return-object p0
.end method

.method public neutralActionRipple(I)Lcom/rey/material/app/Dialog;
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 826
    new-instance v1, Lcom/rey/material/drawable/RippleDrawable$Builder;

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v0

    .line 827
    .local v0, "drawable":Lcom/rey/material/drawable/RippleDrawable;
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->neutralActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    move-result-object v1

    return-object v1
.end method

.method public neutralActionTextAppearance(I)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 836
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/rey/material/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 837
    return-object p0
.end method

.method public neutralActionTextColor(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 856
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setTextColor(I)V

    .line 857
    return-object p0
.end method

.method public neutralActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 846
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mNeutralAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 847
    return-object p0
.end method

.method protected onCreate()V
    .registers 1

    .prologue
    .line 182
    return-void
.end method

.method protected onStart()V
    .registers 3

    .prologue
    .line 1022
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 1023
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/app/Dialog$DialogCardView;->setVisibility(I)V

    .line 1024
    iget v0, p0, Lcom/rey/material/app/Dialog;->mInAnimationId:I

    if-eqz v0, :cond_1b

    .line 1025
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0}, Lcom/rey/material/app/Dialog$DialogCardView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/rey/material/app/Dialog$2;

    invoke-direct {v1, p0}, Lcom/rey/material/app/Dialog$2;-><init>(Lcom/rey/material/app/Dialog;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1034
    :cond_1b
    return-void
.end method

.method public outAnimation(I)Lcom/rey/material/app/Dialog;
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 896
    iput p1, p0, Lcom/rey/material/app/Dialog;->mOutAnimationId:I

    .line 897
    return-object p0
.end method

.method public positiveAction(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 620
    if-nez p1, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->positiveAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public positiveAction(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "action"    # Ljava/lang/CharSequence;

    .prologue
    .line 609
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 610
    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/16 v0, 0x8

    :goto_f
    invoke-virtual {v1, v0}, Lcom/rey/material/widget/Button;->setVisibility(I)V

    .line 611
    return-object p0

    .line 610
    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public positiveActionBackground(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 639
    if-nez p1, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->positiveActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_3
.end method

.method public positiveActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 629
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-static {v0, p1}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 630
    return-object p0
.end method

.method public positiveActionClickListener(Landroid/view/View$OnClickListener;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 688
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 689
    return-object p0
.end method

.method public positiveActionRipple(I)Lcom/rey/material/app/Dialog;
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 648
    new-instance v1, Lcom/rey/material/drawable/RippleDrawable$Builder;

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v0

    .line 649
    .local v0, "drawable":Lcom/rey/material/drawable/RippleDrawable;
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->positiveActionBackground(Landroid/graphics/drawable/Drawable;)Lcom/rey/material/app/Dialog;

    move-result-object v1

    return-object v1
.end method

.method public positiveActionTextAppearance(I)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 658
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/rey/material/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 659
    return-object p0
.end method

.method public positiveActionTextColor(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 678
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setTextColor(I)V

    .line 679
    return-object p0
.end method

.method public positiveActionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 668
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mPositiveAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 669
    return-object p0
.end method

.method public setCancelable(Z)V
    .registers 2
    .param p1, "flag"    # Z

    .prologue
    .line 992
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->cancelable(Z)Lcom/rey/material/app/Dialog;

    .line 993
    return-void
.end method

.method public setCanceledOnTouchOutside(Z)V
    .registers 2
    .param p1, "cancel"    # Z

    .prologue
    .line 997
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->canceledOnTouchOutside(Z)Lcom/rey/material/app/Dialog;

    .line 998
    return-void
.end method

.method public setContentView(I)V
    .registers 2
    .param p1, "layoutId"    # I

    .prologue
    .line 1007
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->contentView(I)Lcom/rey/material/app/Dialog;

    .line 1008
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1002
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 1003
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 1012
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 1013
    return-void
.end method

.method public setTitle(I)V
    .registers 2
    .param p1, "titleId"    # I

    .prologue
    .line 508
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->title(I)Lcom/rey/material/app/Dialog;

    .line 509
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 503
    invoke-virtual {p0, p1}, Lcom/rey/material/app/Dialog;->title(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    .line 504
    return-void
.end method

.method public showDivider(Z)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "show"    # Z

    .prologue
    .line 906
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mCardView:Lcom/rey/material/app/Dialog$DialogCardView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/Dialog$DialogCardView;->setShowDivider(Z)V

    .line 907
    return-object p0
.end method

.method public title(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 498
    if-nez p1, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lcom/rey/material/app/Dialog;->title(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    move-result-object v0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public title(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 487
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 488
    iget-object v1, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/16 v0, 0x8

    :goto_f
    invoke-virtual {v1, v0}, Lcom/rey/material/widget/TextView;->setVisibility(I)V

    .line 489
    return-object p0

    .line 488
    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public titleColor(I)Lcom/rey/material/app/Dialog;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 517
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setTextColor(I)V

    .line 518
    return-object p0
.end method

.method public titleTextAppearance(I)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 527
    iget-object v0, p0, Lcom/rey/material/app/Dialog;->mTitle:Lcom/rey/material/widget/TextView;

    invoke-virtual {p0}, Lcom/rey/material/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/rey/material/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 528
    return-object p0
.end method
