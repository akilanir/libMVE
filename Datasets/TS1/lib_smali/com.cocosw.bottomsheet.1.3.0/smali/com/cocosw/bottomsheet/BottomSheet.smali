.class public Lcom/cocosw/bottomsheet/BottomSheet;
.super Landroid/app/Dialog;
.source "BottomSheet.java"

# interfaces
.implements Landroid/content/DialogInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    }
.end annotation


# instance fields
.field private actions:Lcom/cocosw/bottomsheet/ActionMenu;

.field private adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

.field private builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

.field private cancelOnSwipeDown:Z

.field private cancelOnTouchOutside:Z

.field private close:Landroid/graphics/drawable/Drawable;

.field private collapseListIcons:Z

.field private dismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private fullMenuItem:Lcom/cocosw/bottomsheet/ActionMenu;

.field private helper:Lcom/cocosw/bottomsheet/TranslucentHelper;

.field private final hidden:Landroid/util/SparseIntArray;

.field private icon:Landroid/widget/ImageView;

.field private limit:I

.field private list:Landroid/widget/GridView;

.field private mGridItemLayoutId:I

.field private mHeaderLayoutId:I

.field private mListItemLayoutId:I

.field private menuItem:Lcom/cocosw/bottomsheet/ActionMenu;

.field private more:Landroid/graphics/drawable/Drawable;

.field private moreText:Ljava/lang/String;

.field private showListener:Landroid/content/DialogInterface$OnShowListener;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 95
    sget v0, Lcom/cocosw/bottomsheet/R$style;->BottomSheet_Dialog:I

    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 69
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->hidden:Landroid/util/SparseIntArray;

    .line 85
    const/4 v0, -0x1

    iput v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->limit:I

    .line 86
    iput-boolean v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnTouchOutside:Z

    .line 87
    iput-boolean v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnSwipeDown:Z

    .line 96
    return-void
.end method

.method constructor <init>(Landroid/content/Context;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    const/4 v2, 0x1

    .line 100
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 69
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->hidden:Landroid/util/SparseIntArray;

    .line 85
    const/4 v1, -0x1

    iput v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->limit:I

    .line 86
    iput-boolean v2, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnTouchOutside:Z

    .line 87
    iput-boolean v2, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnSwipeDown:Z

    .line 102
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    sget-object v3, Lcom/cocosw/bottomsheet/R$styleable;->BottomSheet:[I

    sget v4, Lcom/cocosw/bottomsheet/R$attr;->bs_bottomSheetStyle:I

    const/4 v5, 0x0

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 105
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_20
    sget v1, Lcom/cocosw/bottomsheet/R$styleable;->BottomSheet_bs_moreDrawable:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->more:Landroid/graphics/drawable/Drawable;

    .line 106
    sget v1, Lcom/cocosw/bottomsheet/R$styleable;->BottomSheet_bs_closeDrawable:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->close:Landroid/graphics/drawable/Drawable;

    .line 107
    sget v1, Lcom/cocosw/bottomsheet/R$styleable;->BottomSheet_bs_moreText:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->moreText:Ljava/lang/String;

    .line 108
    sget v1, Lcom/cocosw/bottomsheet/R$styleable;->BottomSheet_bs_collapseListIcons:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->collapseListIcons:Z

    .line 109
    sget v1, Lcom/cocosw/bottomsheet/R$styleable;->BottomSheet_bs_headerLayout:I

    sget v2, Lcom/cocosw/bottomsheet/R$layout;->bs_header:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->mHeaderLayoutId:I

    .line 110
    sget v1, Lcom/cocosw/bottomsheet/R$styleable;->BottomSheet_bs_listItemLayout:I

    sget v2, Lcom/cocosw/bottomsheet/R$layout;->bs_list_entry:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->mListItemLayoutId:I

    .line 111
    sget v1, Lcom/cocosw/bottomsheet/R$styleable;->BottomSheet_bs_gridItemLayout:I

    sget v2, Lcom/cocosw/bottomsheet/R$layout;->bs_grid_entry:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->mGridItemLayoutId:I
    :try_end_5f
    .catchall {:try_start_20 .. :try_end_5f} :catchall_70

    .line 113
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 117
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_6f

    .line 118
    new-instance v1, Lcom/cocosw/bottomsheet/TranslucentHelper;

    invoke-direct {v1, p0, p1}, Lcom/cocosw/bottomsheet/TranslucentHelper;-><init>(Landroid/app/Dialog;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->helper:Lcom/cocosw/bottomsheet/TranslucentHelper;

    .line 120
    :cond_6f
    return-void

    .line 113
    :catchall_70
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method static synthetic access$000(Lcom/cocosw/bottomsheet/BottomSheet;)V
    .registers 1
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->showFullItems()V

    return-void
.end method

.method static synthetic access$100(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/content/DialogInterface$OnShowListener;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->showListener:Landroid/content/DialogInterface$OnShowListener;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/ActionMenu;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/util/SparseIntArray;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->hidden:Landroid/util/SparseIntArray;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/cocosw/bottomsheet/BottomSheet;)I
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->mGridItemLayoutId:I

    return v0
.end method

.method static synthetic access$1400(Lcom/cocosw/bottomsheet/BottomSheet;)I
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->mListItemLayoutId:I

    return v0
.end method

.method static synthetic access$1700(Lcom/cocosw/bottomsheet/BottomSheet;)Z
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->collapseListIcons:Z

    return v0
.end method

.method static synthetic access$200(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/cocosw/bottomsheet/BottomSheet;)V
    .registers 1
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->showShortItems()V

    return-void
.end method

.method static synthetic access$2200(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/content/DialogInterface$OnDismissListener;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/cocosw/bottomsheet/BottomSheet;)I
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->limit:I

    return v0
.end method

.method static synthetic access$300(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/GridView;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    return-object v0
.end method

.method static synthetic access$402(Lcom/cocosw/bottomsheet/BottomSheet;Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;
    .param p1, "x1"    # Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    return-object p1
.end method

.method static synthetic access$600(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;

    return-object v0
.end method

.method private getNumColumns()I
    .registers 6

    .prologue
    const/4 v2, 0x1

    .line 127
    :try_start_1
    const-class v3, Landroid/widget/GridView;

    const-string v4, "mRequestedNumColumns"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 128
    .local v1, "numColumns":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 129
    iget-object v3, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_12} :catch_14

    move-result v2

    .line 131
    .end local v1    # "numColumns":Ljava/lang/reflect/Field;
    :goto_13
    return v2

    .line 130
    :catch_14
    move-exception v0

    .line 131
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_13
.end method

.method private hasDivider()Z
    .registers 2

    .prologue
    .line 409
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    iget-object v0, v0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private init(Landroid/content/Context;)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    const/4 v12, 0x1

    const/4 v2, 0x0

    .line 156
    iget-boolean v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnTouchOutside:Z

    invoke-virtual {p0, v1}, Lcom/cocosw/bottomsheet/BottomSheet;->setCanceledOnTouchOutside(Z)V

    .line 157
    sget v1, Lcom/cocosw/bottomsheet/R$layout;->bottom_sheet_dialog:I

    invoke-static {p1, v1, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;

    .line 158
    .local v9, "mDialogView":Lcom/cocosw/bottomsheet/ClosableSlidingLayout;
    sget v1, Lcom/cocosw/bottomsheet/R$id;->bs_main:I

    invoke-virtual {v9, v1}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/LinearLayout;

    .line 159
    .local v10, "mainLayout":Landroid/widget/LinearLayout;
    iget v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->mHeaderLayoutId:I

    invoke-static {p1, v1, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v10, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 160
    invoke-virtual {p0, v9}, Lcom/cocosw/bottomsheet/BottomSheet;->setContentView(Landroid/view/View;)V

    .line 161
    iget-boolean v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnSwipeDown:Z

    if-nez v1, :cond_2c

    .line 162
    iget-boolean v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnSwipeDown:Z

    iput-boolean v1, v9, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->swipeable:Z

    .line 163
    :cond_2c
    new-instance v1, Lcom/cocosw/bottomsheet/BottomSheet$1;

    invoke-direct {v1, p0}, Lcom/cocosw/bottomsheet/BottomSheet$1;-><init>(Lcom/cocosw/bottomsheet/BottomSheet;)V

    invoke-virtual {v9, v1}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->setSlideListener(Lcom/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener;)V

    .line 175
    new-instance v1, Lcom/cocosw/bottomsheet/BottomSheet$2;

    invoke-direct {v1, p0}, Lcom/cocosw/bottomsheet/BottomSheet$2;-><init>(Lcom/cocosw/bottomsheet/BottomSheet;)V

    invoke-super {p0, v1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 190
    const/4 v1, 0x2

    new-array v8, v1, [I

    .line 191
    .local v8, "location":[I
    invoke-virtual {v9, v8}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getLocationOnScreen([I)V

    .line 193
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-lt v1, v4, :cond_6f

    .line 194
    aget v1, v8, v2

    if-nez v1, :cond_d9

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->helper:Lcom/cocosw/bottomsheet/TranslucentHelper;

    iget v1, v1, Lcom/cocosw/bottomsheet/TranslucentHelper;->mStatusBarHeight:I

    :goto_50
    invoke-virtual {v9, v2, v1, v2, v2}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->setPadding(IIII)V

    .line 195
    invoke-virtual {v9, v2}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->helper:Lcom/cocosw/bottomsheet/TranslucentHelper;

    iget-boolean v1, v1, Lcom/cocosw/bottomsheet/TranslucentHelper;->mNavBarAvailable:Z

    if-eqz v1, :cond_dc

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->helper:Lcom/cocosw/bottomsheet/TranslucentHelper;

    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/cocosw/bottomsheet/TranslucentHelper;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v9}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->getPaddingBottom()I

    move-result v5

    add-int/2addr v1, v5

    :goto_6c
    invoke-virtual {v4, v2, v2, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 198
    :cond_6f
    sget v1, Lcom/cocosw/bottomsheet/R$id;->bottom_sheet_title:I

    invoke-virtual {v9, v1}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 199
    .local v11, "title":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->title:Ljava/lang/CharSequence;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$700(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_8b

    .line 200
    invoke-virtual {v11, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 201
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->title:Ljava/lang/CharSequence;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$700(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    :cond_8b
    sget v1, Lcom/cocosw/bottomsheet/R$id;->bottom_sheet_title_image:I

    invoke-virtual {v9, v1}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;

    .line 205
    sget v1, Lcom/cocosw/bottomsheet/R$id;->bottom_sheet_gridview:I

    invoke-virtual {v9, v1}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/GridView;

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    .line 206
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    iput-object v1, v9, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->mTarget:Landroid/view/View;

    .line 207
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->grid:Z
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$800(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Z

    move-result v1

    if-nez v1, :cond_b0

    .line 208
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    invoke-virtual {v1, v12}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 211
    :cond_b0
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->grid:Z
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$800(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Z

    move-result v1

    if-eqz v1, :cond_e1

    .line 212
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_b9
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getMenu()Landroid/view/Menu;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/Menu;->size()I

    move-result v1

    if-ge v7, v1, :cond_e1

    .line 213
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getMenu()Landroid/view/Menu;

    move-result-object v1

    invoke-interface {v1, v7}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_de

    .line 214
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "You must set icon for each items in grid style"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .end local v7    # "i":I
    .end local v11    # "title":Landroid/widget/TextView;
    :cond_d9
    move v1, v2

    .line 194
    goto/16 :goto_50

    :cond_dc
    move v1, v2

    .line 195
    goto :goto_6c

    .line 212
    .restart local v7    # "i":I
    .restart local v11    # "title":Landroid/widget/TextView;
    :cond_de
    add-int/lit8 v7, v7, 0x1

    goto :goto_b9

    .line 218
    .end local v7    # "i":I
    :cond_e1
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->limit:I
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$900(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)I

    move-result v1

    if-lez v1, :cond_189

    .line 219
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->limit:I
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$900(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)I

    move-result v1

    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getNumColumns()I

    move-result v4

    mul-int/2addr v1, v4

    iput v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->limit:I

    .line 223
    :goto_f6
    invoke-virtual {v9, v2}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->setCollapsible(Z)V

    .line 225
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$1000(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Lcom/cocosw/bottomsheet/ActionMenu;

    move-result-object v1

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    .line 226
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->menuItem:Lcom/cocosw/bottomsheet/ActionMenu;

    .line 228
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getMenu()Landroid/view/Menu;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/Menu;->size()I

    move-result v1

    iget v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->limit:I

    if-le v1, v4, :cond_149

    .line 229
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$1000(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Lcom/cocosw/bottomsheet/ActionMenu;

    move-result-object v1

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->fullMenuItem:Lcom/cocosw/bottomsheet/ActionMenu;

    .line 230
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$1000(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Lcom/cocosw/bottomsheet/ActionMenu;

    move-result-object v1

    iget v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->limit:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Lcom/cocosw/bottomsheet/ActionMenu;->clone(I)Lcom/cocosw/bottomsheet/ActionMenu;

    move-result-object v1

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->menuItem:Lcom/cocosw/bottomsheet/ActionMenu;

    .line 231
    new-instance v0, Lcom/cocosw/bottomsheet/ActionMenuItem;

    sget v3, Lcom/cocosw/bottomsheet/R$id;->bs_more:I

    iget v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->limit:I

    add-int/lit8 v5, v1, -0x1

    iget-object v6, p0, Lcom/cocosw/bottomsheet/BottomSheet;->moreText:Ljava/lang/String;

    move-object v1, p1

    move v4, v2

    invoke-direct/range {v0 .. v6}, Lcom/cocosw/bottomsheet/ActionMenuItem;-><init>(Landroid/content/Context;IIIILjava/lang/CharSequence;)V

    .line 232
    .local v0, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->more:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 233
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->menuItem:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v1, v0}, Lcom/cocosw/bottomsheet/ActionMenu;->add(Lcom/cocosw/bottomsheet/ActionMenuItem;)Landroid/view/MenuItem;

    .line 234
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->menuItem:Lcom/cocosw/bottomsheet/ActionMenu;

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    .line 235
    invoke-virtual {v9, v12}, Lcom/cocosw/bottomsheet/ClosableSlidingLayout;->setCollapsible(Z)V

    .line 238
    .end local v0    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :cond_149
    new-instance v3, Lcom/cocosw/bottomsheet/BottomSheet$3;

    invoke-direct {v3, p0}, Lcom/cocosw/bottomsheet/BottomSheet$3;-><init>(Lcom/cocosw/bottomsheet/BottomSheet;)V

    .line 315
    .local v3, "baseAdapter":Landroid/widget/BaseAdapter;
    new-instance v1, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    sget v4, Lcom/cocosw/bottomsheet/R$layout;->bs_list_divider:I

    sget v5, Lcom/cocosw/bottomsheet/R$id;->headerlayout:I

    sget v6, Lcom/cocosw/bottomsheet/R$id;->header:I

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;-><init>(Landroid/content/Context;Landroid/widget/BaseAdapter;III)V

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    .line 316
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    iget-object v2, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 317
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    iget-object v2, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    invoke-virtual {v1, v2}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->setGridView(Landroid/widget/GridView;)V

    .line 319
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    new-instance v2, Lcom/cocosw/bottomsheet/BottomSheet$4;

    invoke-direct {v2, p0, v9}, Lcom/cocosw/bottomsheet/BottomSheet$4;-><init>(Lcom/cocosw/bottomsheet/BottomSheet;Lcom/cocosw/bottomsheet/ClosableSlidingLayout;)V

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 338
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$2000(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v1

    if-eqz v1, :cond_185

    .line 339
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$2000(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/cocosw/bottomsheet/BottomSheet;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 341
    :cond_185
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->setListLayout()V

    .line 342
    return-void

    .line 221
    .end local v3    # "baseAdapter":Landroid/widget/BaseAdapter;
    :cond_189
    const v1, 0x7fffffff

    iput v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->limit:I

    goto/16 :goto_f6
.end method

.method private setListLayout()V
    .registers 3

    .prologue
    .line 414
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->hasDivider()Z

    move-result v0

    if-nez v0, :cond_7

    .line 430
    :goto_6
    return-void

    .line 416
    :cond_7
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/cocosw/bottomsheet/BottomSheet$6;

    invoke-direct {v1, p0}, Lcom/cocosw/bottomsheet/BottomSheet$6;-><init>(Lcom/cocosw/bottomsheet/BottomSheet;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_6
.end method

.method private showFullItems()V
    .registers 5

    .prologue
    const/4 v3, -0x1

    .line 368
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_16

    .line 369
    new-instance v0, Landroid/transition/ChangeBounds;

    invoke-direct {v0}, Landroid/transition/ChangeBounds;-><init>()V

    .line 370
    .local v0, "changeBounds":Landroid/transition/Transition;
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/transition/Transition;->setDuration(J)Landroid/transition/Transition;

    .line 371
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    invoke-static {v1, v0}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;Landroid/transition/Transition;)V

    .line 373
    .end local v0    # "changeBounds":Landroid/transition/Transition;
    :cond_16
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->fullMenuItem:Lcom/cocosw/bottomsheet/ActionMenu;

    iput-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    .line 374
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->updateSection()V

    .line 375
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->notifyDataSetChanged()V

    .line 376
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->list:Landroid/widget/GridView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/GridView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 377
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 378
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/cocosw/bottomsheet/BottomSheet;->close:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 379
    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;

    new-instance v2, Lcom/cocosw/bottomsheet/BottomSheet$5;

    invoke-direct {v2, p0}, Lcom/cocosw/bottomsheet/BottomSheet$5;-><init>(Lcom/cocosw/bottomsheet/BottomSheet;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 385
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->setListLayout()V

    .line 386
    return-void
.end method

.method private showShortItems()V
    .registers 3

    .prologue
    .line 389
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->menuItem:Lcom/cocosw/bottomsheet/ActionMenu;

    iput-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    .line 390
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->updateSection()V

    .line 391
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->notifyDataSetChanged()V

    .line 392
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->setListLayout()V

    .line 394
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->icon:Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$500(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1f

    .line 395
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 400
    :goto_1e
    return-void

    .line 397
    :cond_1f
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 398
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->icon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->icon:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$500(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1e
.end method

.method private updateSection()V
    .registers 7

    .prologue
    .line 346
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v4}, Lcom/cocosw/bottomsheet/ActionMenu;->removeInvisible()V

    .line 348
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->grid:Z
    invoke-static {v4}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$800(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Z

    move-result v4

    if-nez v4, :cond_64

    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v4}, Lcom/cocosw/bottomsheet/ActionMenu;->size()I

    move-result v4

    if-lez v4, :cond_64

    .line 349
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/cocosw/bottomsheet/ActionMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/MenuItem;->getGroupId()I

    move-result v0

    .line 350
    .local v0, "groupId":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 351
    .local v3, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_26
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v4}, Lcom/cocosw/bottomsheet/ActionMenu;->size()I

    move-result v4

    if-ge v1, v4, :cond_50

    .line 352
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v4, v1}, Lcom/cocosw/bottomsheet/ActionMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/MenuItem;->getGroupId()I

    move-result v4

    if-eq v4, v0, :cond_4d

    .line 353
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {v4, v1}, Lcom/cocosw/bottomsheet/ActionMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/MenuItem;->getGroupId()I

    move-result v0

    .line 354
    new-instance v4, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v5}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;-><init>(ILjava/lang/CharSequence;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 351
    :cond_4d
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 357
    :cond_50
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_65

    .line 358
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v2, v4, [Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    .line 359
    .local v2, "s":[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 360
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-virtual {v4, v2}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->setSections([Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;)V

    .line 365
    .end local v0    # "groupId":I
    .end local v1    # "i":I
    .end local v2    # "s":[Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    .end local v3    # "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;>;"
    :cond_64
    :goto_64
    return-void

    .line 362
    .restart local v0    # "groupId":I
    .restart local v1    # "i":I
    .restart local v3    # "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;>;"
    :cond_65
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    iget-object v4, v4, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->clear()V

    goto :goto_64
.end method


# virtual methods
.method public getMenu()Landroid/view/Menu;
    .registers 2

    .prologue
    .line 463
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->menu:Lcom/cocosw/bottomsheet/ActionMenu;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$1000(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Lcom/cocosw/bottomsheet/ActionMenu;

    move-result-object v0

    return-object v0
.end method

.method public invalidate()V
    .registers 2

    .prologue
    .line 470
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->updateSection()V

    .line 471
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet;->adapter:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->notifyDataSetChanged()V

    .line 472
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->setListLayout()V

    .line 473
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 435
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 436
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/cocosw/bottomsheet/BottomSheet;->init(Landroid/content/Context;)V

    .line 438
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 439
    .local v1, "params":Landroid/view/WindowManager$LayoutParams;
    const/4 v2, -0x2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 440
    const/16 v2, 0x50

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 442
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [I

    const v4, 0x10100f4

    aput v4, v3, v5

    invoke-virtual {v2, v3}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 444
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    const/4 v3, -0x1

    :try_start_2c
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v2

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->width:I
    :try_end_32
    .catchall {:try_start_2c .. :try_end_32} :catchall_45

    .line 446
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 448
    new-instance v2, Lcom/cocosw/bottomsheet/BottomSheet$7;

    invoke-direct {v2, p0}, Lcom/cocosw/bottomsheet/BottomSheet$7;-><init>(Lcom/cocosw/bottomsheet/BottomSheet;)V

    invoke-super {p0, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 457
    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 458
    return-void

    .line 446
    :catchall_45
    move-exception v2

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v2
.end method

.method protected onStart()V
    .registers 1

    .prologue
    .line 404
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 405
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/BottomSheet;->showShortItems()V

    .line 406
    return-void
.end method

.method public setCanceledOnSwipeDown(Z)V
    .registers 2
    .param p1, "cancel"    # Z

    .prologue
    .line 147
    iput-boolean p1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnSwipeDown:Z

    .line 148
    return-void
.end method

.method public setCanceledOnTouchOutside(Z)V
    .registers 2
    .param p1, "cancel"    # Z

    .prologue
    .line 137
    invoke-super {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 138
    iput-boolean p1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->cancelOnTouchOutside:Z

    .line 139
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 477
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 478
    return-void
.end method

.method public setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnShowListener;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet;->showListener:Landroid/content/DialogInterface$OnShowListener;

    .line 153
    return-void
.end method
