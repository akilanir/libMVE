.class public Lcom/cocosw/bottomsheet/BottomSheet$Builder;
.super Ljava/lang/Object;
.source "BottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cocosw/bottomsheet/BottomSheet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private dismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private grid:Z

.field private icon:Landroid/graphics/drawable/Drawable;

.field private limit:I

.field private listener:Landroid/content/DialogInterface$OnClickListener;

.field private final menu:Lcom/cocosw/bottomsheet/ActionMenu;

.field private menulistener:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private theme:I

.field private title:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 7
    .param p1, "context"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 503
    sget v1, Lcom/cocosw/bottomsheet/R$style;->BottomSheet_Dialog:I

    invoke-direct {p0, p1, v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;-><init>(Landroid/content/Context;I)V

    .line 504
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [I

    sget v3, Lcom/cocosw/bottomsheet/R$attr;->bs_bottomSheetStyle:I

    aput v3, v2, v4

    invoke-virtual {v1, v2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 506
    .local v0, "ta":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    :try_start_16
    sget v2, Lcom/cocosw/bottomsheet/R$style;->BottomSheet_Dialog:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->theme:I
    :try_end_1e
    .catchall {:try_start_16 .. :try_end_1e} :catchall_22

    .line 508
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 510
    return-void

    .line 508
    :catchall_22
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param

    .prologue
    .line 518
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 493
    const/4 v0, -0x1

    iput v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->limit:I

    .line 519
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    .line 520
    iput p2, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->theme:I

    .line 521
    new-instance v0, Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-direct {v0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;

    .line 522
    return-void
.end method

.method static synthetic access$1000(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Lcom/cocosw/bottomsheet/ActionMenu;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/view/MenuItem$OnMenuItemClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menulistener:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/content/DialogInterface$OnClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->listener:Landroid/content/DialogInterface$OnClickListener;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/content/DialogInterface$OnDismissListener;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$700(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->title:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$800(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 483
    iget-boolean v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->grid:Z

    return v0
.end method

.method static synthetic access$900(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 483
    iget v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->limit:I

    return v0
.end method


# virtual methods
.method public build()Lcom/cocosw/bottomsheet/BottomSheet;
    .registers 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Override"
        }
    .end annotation

    .prologue
    .line 710
    new-instance v0, Lcom/cocosw/bottomsheet/BottomSheet;

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    iget v2, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->theme:I

    invoke-direct {v0, v1, v2}, Lcom/cocosw/bottomsheet/BottomSheet;-><init>(Landroid/content/Context;I)V

    .line 711
    .local v0, "dialog":Lcom/cocosw/bottomsheet/BottomSheet;
    # setter for: Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-static {v0, p0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$402(Lcom/cocosw/bottomsheet/BottomSheet;Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .line 712
    return-object v0
.end method

.method public darkTheme()Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2

    .prologue
    .line 664
    sget v0, Lcom/cocosw/bottomsheet/R$style;->BottomSheet_Dialog_Dark:I

    iput v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->theme:I

    .line 665
    return-object p0
.end method

.method public grid()Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2

    .prologue
    .line 686
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->grid:Z

    .line 687
    return-object p0
.end method

.method public icon(I)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 3
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 631
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 632
    return-object p0
.end method

.method public icon(Landroid/graphics/drawable/Drawable;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 620
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 621
    return-object p0
.end method

.method public limit(I)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 3
    .param p1, "limitRes"    # I
        .annotation build Landroid/support/annotation/IntegerRes;
        .end annotation
    .end param

    .prologue
    .line 698
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->limit:I

    .line 699
    return-object p0
.end method

.method public listener(Landroid/content/DialogInterface$OnClickListener;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnClickListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 642
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->listener:Landroid/content/DialogInterface$OnClickListener;

    .line 643
    return-object p0
.end method

.method public listener(Landroid/view/MenuItem$OnMenuItemClickListener;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/view/MenuItem$OnMenuItemClickListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 653
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menulistener:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 654
    return-object p0
.end method

.method public remove(I)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 3
    .param p1, "id"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 609
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;->removeItem(I)V

    .line 610
    return-object p0
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnDismissListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 733
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 734
    return-object p0
.end method

.method public sheet(I)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 4
    .param p1, "xmlRes"    # I
        .annotation build Landroid/support/annotation/MenuRes;
        .end annotation
    .end param

    .prologue
    .line 531
    new-instance v0, Landroid/view/MenuInflater;

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/view/MenuInflater;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v0, p1, v1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 532
    return-object p0
.end method

.method public sheet(II)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 5
    .param p1, "id"    # I
    .param p2, "textRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 574
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v0, v1, p1, v1, p2}, Lcom/cocosw/bottomsheet/ActionMenu;->add(IIII)Landroid/view/MenuItem;

    .line 575
    return-object p0
.end method

.method public sheet(III)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 11
    .param p1, "id"    # I
    .param p2, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "textRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 545
    new-instance v0, Lcom/cocosw/bottomsheet/ActionMenuItem;

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    invoke-virtual {v3, p3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    move v3, p1

    move v4, v2

    move v5, v2

    invoke-direct/range {v0 .. v6}, Lcom/cocosw/bottomsheet/ActionMenuItem;-><init>(Landroid/content/Context;IIIILjava/lang/CharSequence;)V

    .line 546
    .local v0, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    invoke-virtual {v0, p2}, Lcom/cocosw/bottomsheet/ActionMenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 547
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v1, v0}, Lcom/cocosw/bottomsheet/ActionMenu;->add(Lcom/cocosw/bottomsheet/ActionMenuItem;)Landroid/view/MenuItem;

    .line 548
    return-object p0
.end method

.method public sheet(ILandroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 11
    .param p1, "id"    # I
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "text"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 560
    new-instance v0, Lcom/cocosw/bottomsheet/ActionMenuItem;

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    move v3, p1

    move v4, v2

    move v5, v2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/cocosw/bottomsheet/ActionMenuItem;-><init>(Landroid/content/Context;IIIILjava/lang/CharSequence;)V

    .line 561
    .local v0, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    invoke-virtual {v0, p2}, Lcom/cocosw/bottomsheet/ActionMenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 562
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v1, v0}, Lcom/cocosw/bottomsheet/ActionMenu;->add(Lcom/cocosw/bottomsheet/ActionMenuItem;)Landroid/view/MenuItem;

    .line 563
    return-object p0
.end method

.method public sheet(ILjava/lang/CharSequence;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 5
    .param p1, "id"    # I
    .param p2, "text"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 586
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v0, v1, p1, v1, p2}, Lcom/cocosw/bottomsheet/ActionMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 587
    return-object p0
.end method

.method public show()Lcom/cocosw/bottomsheet/BottomSheet;
    .registers 2

    .prologue
    .line 675
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->build()Lcom/cocosw/bottomsheet/BottomSheet;

    move-result-object v0

    .line 676
    .local v0, "dialog":Lcom/cocosw/bottomsheet/BottomSheet;
    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->show()V

    .line 677
    return-object v0
.end method

.method public title(I)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 3
    .param p1, "titleRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 597
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->title:Ljava/lang/CharSequence;

    .line 598
    return-object p0
.end method

.method public title(Ljava/lang/CharSequence;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 722
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->title:Ljava/lang/CharSequence;

    .line 723
    return-object p0
.end method
