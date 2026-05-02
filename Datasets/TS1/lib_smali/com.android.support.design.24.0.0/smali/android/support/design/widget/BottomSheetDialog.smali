.class public Landroid/support/design/widget/BottomSheetDialog;
.super Landroid/support/v7/app/AppCompatDialog;
.source "BottomSheetDialog.java"


# instance fields
.field private mBottomSheetCallback:Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "theme"    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param

    .prologue
    .line 43
    invoke-static {p1, p2}, Landroid/support/design/widget/BottomSheetDialog;->getThemeResId(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/app/AppCompatDialog;-><init>(Landroid/content/Context;I)V

    .line 133
    new-instance v0, Landroid/support/design/widget/BottomSheetDialog$2;

    invoke-direct {v0, p0}, Landroid/support/design/widget/BottomSheetDialog$2;-><init>(Landroid/support/design/widget/BottomSheetDialog;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetDialog;->mBottomSheetCallback:Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;

    .line 46
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomSheetDialog;->supportRequestWindowFeature(I)Z

    .line 47
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ZLandroid/content/DialogInterface$OnCancelListener;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "cancelable"    # Z
    .param p3, "cancelListener"    # Landroid/content/DialogInterface$OnCancelListener;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/app/AppCompatDialog;-><init>(Landroid/content/Context;ZLandroid/content/DialogInterface$OnCancelListener;)V

    .line 133
    new-instance v0, Landroid/support/design/widget/BottomSheetDialog$2;

    invoke-direct {v0, p0}, Landroid/support/design/widget/BottomSheetDialog$2;-><init>(Landroid/support/design/widget/BottomSheetDialog;)V

    iput-object v0, p0, Landroid/support/design/widget/BottomSheetDialog;->mBottomSheetCallback:Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;

    .line 52
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/design/widget/BottomSheetDialog;->supportRequestWindowFeature(I)Z

    .line 53
    return-void
.end method

.method private static getThemeResId(Landroid/content/Context;I)I
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "themeId"    # I

    .prologue
    .line 119
    if-nez p1, :cond_16

    .line 121
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 122
    .local v0, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget v2, Landroid/support/design/R$attr;->bottomSheetDialogTheme:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 124
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    .line 130
    .end local v0    # "outValue":Landroid/util/TypedValue;
    :cond_16
    :goto_16
    return p1

    .line 127
    .restart local v0    # "outValue":Landroid/util/TypedValue;
    :cond_17
    sget p1, Landroid/support/design/R$style;->Theme_Design_Light_BottomSheetDialog:I

    goto :goto_16
.end method

.method private shouldWindowCloseOnTouchOutside()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 106
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-ge v3, v4, :cond_9

    .line 115
    :cond_8
    :goto_8
    return v1

    .line 109
    :cond_9
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 111
    .local v0, "value":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/support/design/widget/BottomSheetDialog;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x101035b

    .line 112
    invoke-virtual {v3, v4, v0, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 113
    iget v3, v0, Landroid/util/TypedValue;->data:I

    if-nez v3, :cond_8

    move v1, v2

    goto :goto_8

    :cond_25
    move v1, v2

    .line 115
    goto :goto_8
.end method

.method private wrapInBottomSheet(ILandroid/view/View;Landroid/view/ViewGroup$LayoutParams;)Landroid/view/View;
    .registers 9
    .param p1, "layoutResId"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 78
    invoke-virtual {p0}, Landroid/support/design/widget/BottomSheetDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Landroid/support/design/R$layout;->design_bottom_sheet_dialog:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/CoordinatorLayout;

    .line 80
    .local v1, "coordinator":Landroid/support/design/widget/CoordinatorLayout;
    if-eqz p1, :cond_1a

    if-nez p2, :cond_1a

    .line 81
    invoke-virtual {p0}, Landroid/support/design/widget/BottomSheetDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 83
    :cond_1a
    sget v2, Landroid/support/design/R$id;->design_bottom_sheet:I

    invoke-virtual {v1, v2}, Landroid/support/design/widget/CoordinatorLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 84
    .local v0, "bottomSheet":Landroid/widget/FrameLayout;
    invoke-static {v0}, Landroid/support/design/widget/BottomSheetBehavior;->from(Landroid/view/View;)Landroid/support/design/widget/BottomSheetBehavior;

    move-result-object v2

    iget-object v3, p0, Landroid/support/design/widget/BottomSheetDialog;->mBottomSheetCallback:Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;

    invoke-virtual {v2, v3}, Landroid/support/design/widget/BottomSheetBehavior;->setBottomSheetCallback(Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;)V

    .line 85
    if-nez p3, :cond_45

    .line 86
    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 91
    :goto_30
    invoke-direct {p0}, Landroid/support/design/widget/BottomSheetDialog;->shouldWindowCloseOnTouchOutside()Z

    move-result v2

    if-eqz v2, :cond_44

    .line 92
    sget v2, Landroid/support/design/R$id;->touch_outside:I

    invoke-virtual {v1, v2}, Landroid/support/design/widget/CoordinatorLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    new-instance v3, Landroid/support/design/widget/BottomSheetDialog$1;

    invoke-direct {v3, p0}, Landroid/support/design/widget/BottomSheetDialog$1;-><init>(Landroid/support/design/widget/BottomSheetDialog;)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    :cond_44
    return-object v1

    .line 88
    :cond_45
    invoke-virtual {v0, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_30
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, -0x1

    .line 62
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatDialog;->onCreate(Landroid/os/Bundle;)V

    .line 63
    invoke-virtual {p0}, Landroid/support/design/widget/BottomSheetDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 65
    return-void
.end method

.method public setContentView(I)V
    .registers 3
    .param p1, "layoutResId"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, v0, v0}, Landroid/support/design/widget/BottomSheetDialog;->wrapInBottomSheet(ILandroid/view/View;Landroid/view/ViewGroup$LayoutParams;)Landroid/view/View;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/support/v7/app/AppCompatDialog;->setContentView(Landroid/view/View;)V

    .line 58
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 69
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Landroid/support/design/widget/BottomSheetDialog;->wrapInBottomSheet(ILandroid/view/View;Landroid/view/ViewGroup$LayoutParams;)Landroid/view/View;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/support/v7/app/AppCompatDialog;->setContentView(Landroid/view/View;)V

    .line 70
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Landroid/support/design/widget/BottomSheetDialog;->wrapInBottomSheet(ILandroid/view/View;Landroid/view/ViewGroup$LayoutParams;)Landroid/view/View;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/support/v7/app/AppCompatDialog;->setContentView(Landroid/view/View;)V

    .line 75
    return-void
.end method
