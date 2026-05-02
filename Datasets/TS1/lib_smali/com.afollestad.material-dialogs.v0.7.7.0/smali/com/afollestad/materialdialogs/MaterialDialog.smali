.class public Lcom/afollestad/materialdialogs/MaterialDialog;
.super Lcom/afollestad/materialdialogs/DialogBase;
.source "MaterialDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/MaterialDialog$4;,
        Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;,
        Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;,
        Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;,
        Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;,
        Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;,
        Lcom/afollestad/materialdialogs/MaterialDialog$ListType;,
        Lcom/afollestad/materialdialogs/MaterialDialog$Builder;,
        Lcom/afollestad/materialdialogs/MaterialDialog$DialogException;,
        Lcom/afollestad/materialdialogs/MaterialDialog$NotImplementedException;
    }
.end annotation


# instance fields
.field protected content:Landroid/widget/TextView;

.field protected customViewFrame:Landroid/widget/FrameLayout;

.field protected icon:Landroid/widget/ImageView;

.field protected input:Landroid/widget/EditText;

.field protected inputMinMax:Landroid/widget/TextView;

.field protected listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

.field protected listView:Landroid/widget/ListView;

.field protected final mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

.field private mHandler:Landroid/os/Handler;

.field protected mProgress:Landroid/widget/ProgressBar;

.field protected mProgressLabel:Landroid/widget/TextView;

.field protected mProgressMinMax:Landroid/widget/TextView;

.field protected negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

.field protected neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

.field protected positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

.field protected selectedIndicesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected title:Landroid/widget/TextView;

.field protected titleFrame:Landroid/view/View;


# direct methods
.method protected constructor <init>(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)V
    .registers 5
    .param p1, "builder"    # Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 86
    iget-object v1, p1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {p1}, Lcom/afollestad/materialdialogs/DialogInit;->getTheme(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/afollestad/materialdialogs/DialogBase;-><init>(Landroid/content/Context;I)V

    .line 87
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mHandler:Landroid/os/Handler;

    .line 88
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 89
    iget-object v1, p1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 90
    .local v0, "inflater":Landroid/view/LayoutInflater;
    invoke-static {p1}, Lcom/afollestad/materialdialogs/DialogInit;->getInflateLayout(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    .line 91
    invoke-static {p0}, Lcom/afollestad/materialdialogs/DialogInit;->init(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 92
    return-void
.end method

.method private sendMultichoiceCallback()Z
    .registers 7

    .prologue
    .line 306
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 307
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 308
    .local v2, "selectedTitles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/CharSequence;>;"
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 309
    .local v0, "i":Ljava/lang/Integer;
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 311
    .end local v0    # "i":Ljava/lang/Integer;
    :cond_2a
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/Integer;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Integer;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/CharSequence;

    invoke-interface {v2, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/CharSequence;

    invoke-interface {v5, p0, v3, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;->onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;[Ljava/lang/Integer;[Ljava/lang/CharSequence;)Z

    move-result v3

    return v3
.end method

.method private sendSingleChoiceCallback(Landroid/view/View;)Z
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 298
    const/4 v0, 0x0

    .line 299
    .local v0, "text":Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    if-ltz v1, :cond_11

    .line 300
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    aget-object v0, v1, v2

    .line 302
    :cond_11
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    invoke-interface {v1, p0, p1, v2, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;->onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;Landroid/view/View;ILjava/lang/CharSequence;)Z

    move-result v1

    return v1
.end method


# virtual methods
.method protected final checkIfListInitScroll()V
    .registers 3

    .prologue
    .line 102
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    if-nez v0, :cond_5

    .line 144
    :goto_4
    return-void

    .line 104
    :cond_5
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/afollestad/materialdialogs/MaterialDialog$1;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$1;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_4
.end method

.method public clearSelectedIndices()V
    .registers 3

    .prologue
    .line 1526
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    if-nez v0, :cond_c

    .line 1527
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You can only use clearSelectedIndicies() with multi choice list dialogs."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1528
    :cond_c
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    .line 1529
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1530
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v0, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    if-eqz v0, :cond_2e

    .line 1531
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->notifyDataSetChanged()V

    .line 1535
    return-void

    .line 1533
    :cond_2e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You can only use clearSelectedIndicies() with the default adapter implementation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic findViewById(I)Landroid/view/View;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 58
    invoke-super {p0, p1}, Lcom/afollestad/materialdialogs/DialogBase;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Landroid/view/View;
    .registers 4
    .param p1, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1199
    sget-object v0, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_26

    .line 1201
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v1, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultPositive:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1205
    :goto_13
    return-object v0

    .line 1203
    :pswitch_14
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v1, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultNeutral:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_13

    .line 1205
    :pswitch_1d
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    sget v1, Lcom/afollestad/materialdialogs/R$id;->buttonDefaultNegative:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/internal/MDRootLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    goto :goto_13

    .line 1199
    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_14
        :pswitch_1d
    .end packed-switch
.end method

.method public final getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    return-object v0
.end method

.method getButtonSelector(Lcom/afollestad/materialdialogs/DialogAction;Z)Landroid/graphics/drawable/Drawable;
    .registers 7
    .param p1, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
    .param p2, "isStacked"    # Z

    .prologue
    const/4 v3, 0x0

    .line 264
    if-eqz p2, :cond_31

    .line 265
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorStacked:I

    if-eqz v1, :cond_1a

    .line 266
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorStacked:I

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 291
    :cond_19
    :goto_19
    return-object v0

    .line 267
    :cond_1a
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_stacked_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 268
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_19

    .line 269
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_stacked_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_19

    .line 271
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :cond_31
    sget-object v1, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_c8

    .line 273
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    if-eqz v1, :cond_53

    .line 274
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_19

    .line 275
    :cond_53
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_positive_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 276
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_19

    .line 277
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_positive_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_19

    .line 280
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :pswitch_6a
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    if-eqz v1, :cond_81

    .line 281
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_19

    .line 282
    :cond_81
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_neutral_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 283
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_19

    .line 284
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_neutral_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_19

    .line 287
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :pswitch_98
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    if-eqz v1, :cond_b0

    .line 288
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto/16 :goto_19

    .line 289
    :cond_b0
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_negative_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 290
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_19

    .line 291
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_negative_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto/16 :goto_19

    .line 271
    :pswitch_data_c8
    .packed-switch 0x1
        :pswitch_6a
        :pswitch_98
    .end packed-switch
.end method

.method public final getContentView()Landroid/widget/TextView;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1240
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    return-object v0
.end method

.method public final getCurrentProgress()I
    .registers 2

    .prologue
    .line 1389
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    if-nez v0, :cond_6

    const/4 v0, -0x1

    .line 1390
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v0

    goto :goto_5
.end method

.method public final getCustomView()Landroid/view/View;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1250
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    return-object v0
.end method

.method public final getInputEditText()Landroid/widget/EditText;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1223
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    return-object v0
.end method

.method protected final getListSelector()Landroid/graphics/drawable/Drawable;
    .registers 5

    .prologue
    .line 256
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listSelector:I

    if-eqz v1, :cond_18

    .line 257
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listSelector:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 260
    :cond_17
    :goto_17
    return-object v0

    .line 258
    :cond_18
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_list_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 259
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_17

    .line 260
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_list_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_17
.end method

.method public final getListView()Landroid/widget/ListView;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1218
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    return-object v0
.end method

.method public final getMaxProgress()I
    .registers 2

    .prologue
    .line 1434
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    if-nez v0, :cond_6

    const/4 v0, -0x1

    .line 1435
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v0

    goto :goto_5
.end method

.method public getProgressBar()Landroid/widget/ProgressBar;
    .registers 2

    .prologue
    .line 1394
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method public getSelectedIndex()I
    .registers 2

    .prologue
    .line 1466
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    if-eqz v0, :cond_b

    .line 1467
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 1469
    :goto_a
    return v0

    :cond_b
    const/4 v0, -0x1

    goto :goto_a
.end method

.method public getSelectedIndices()[Ljava/lang/Integer;
    .registers 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1480
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    if-eqz v0, :cond_17

    .line 1481
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Integer;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Integer;

    .line 1483
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public final getTitleView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 1231
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    return-object v0
.end method

.method public final getView()Landroid/view/View;
    .registers 2

    .prologue
    .line 1213
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    return-object v0
.end method

.method public final hasActionButtons()Z
    .registers 2

    .prologue
    .line 1297
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->numberOfActionButtons()I

    move-result v0

    if-lez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final incrementProgress(I)V
    .registers 3
    .param p1, "by"    # I

    .prologue
    .line 1398
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCurrentProgress()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setProgress(I)V

    .line 1399
    return-void
.end method

.method protected invalidateInputMinMaxIndicator(IZ)V
    .registers 12
    .param p1, "currentLength"    # I
    .param p2, "emptyDisabled"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1576
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    if-eqz v6, :cond_52

    .line 1577
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v8, v8, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1578
    if-eqz p2, :cond_2a

    if-eqz p1, :cond_30

    :cond_2a
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v6, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    if-le p1, v6, :cond_53

    :cond_30
    move v2, v4

    .line 1579
    .local v2, "isDisabled":Z
    :goto_31
    if-eqz v2, :cond_55

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLengthErrorColor:I

    .line 1580
    .local v0, "colorText":I
    :goto_37
    if-eqz v2, :cond_5a

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLengthErrorColor:I

    .line 1581
    .local v1, "colorWidget":I
    :goto_3d
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1582
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-static {v6, v1}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/EditText;I)V

    .line 1583
    sget-object v6, Lcom/afollestad/materialdialogs/DialogAction;->POSITIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual {p0, v6}, Lcom/afollestad/materialdialogs/MaterialDialog;->getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Landroid/view/View;

    move-result-object v3

    .line 1584
    .local v3, "positiveAb":Landroid/view/View;
    if-nez v2, :cond_5f

    :goto_4f
    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 1586
    .end local v0    # "colorText":I
    .end local v1    # "colorWidget":I
    .end local v2    # "isDisabled":Z
    .end local v3    # "positiveAb":Landroid/view/View;
    :cond_52
    return-void

    :cond_53
    move v2, v5

    .line 1578
    goto :goto_31

    .line 1579
    .restart local v2    # "isDisabled":Z
    :cond_55
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    goto :goto_37

    .line 1580
    .restart local v0    # "colorText":I
    :cond_5a
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    goto :goto_3d

    .restart local v1    # "colorWidget":I
    .restart local v3    # "positiveAb":Landroid/view/View;
    :cond_5f
    move v4, v5

    .line 1584
    goto :goto_4f
.end method

.method protected final invalidateList()V
    .registers 3

    .prologue
    .line 150
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    if-nez v0, :cond_5

    .line 158
    :cond_4
    :goto_4
    return-void

    .line 152
    :cond_5
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    array-length v0, v0

    if-nez v0, :cond_18

    :cond_12
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_4

    .line 155
    :cond_18
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 156
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-nez v0, :cond_2b

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    if-eqz v0, :cond_4

    .line 157
    :cond_2b
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    goto :goto_4
.end method

.method public final isCancelled()Z
    .registers 2

    .prologue
    .line 1457
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final isIndeterminateProgress()Z
    .registers 2

    .prologue
    .line 1430
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    return v0
.end method

.method public final numberOfActionButtons()I
    .registers 3

    .prologue
    .line 1306
    const/4 v0, 0x0

    .line 1307
    .local v0, "number":I
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->getVisibility()I

    move-result v1

    if-nez v1, :cond_11

    .line 1308
    add-int/lit8 v0, v0, 0x1

    .line 1309
    :cond_11
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_21

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->getVisibility()I

    move-result v1

    if-nez v1, :cond_21

    .line 1310
    add-int/lit8 v0, v0, 0x1

    .line 1311
    :cond_21
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_31

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->getVisibility()I

    move-result v1

    if-nez v1, :cond_31

    .line 1312
    add-int/lit8 v0, v0, 0x1

    .line 1313
    :cond_31
    return v0
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 318
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/DialogAction;

    .line 319
    .local v0, "tag":Lcom/afollestad/materialdialogs/DialogAction;
    sget-object v1, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_9c

    .line 351
    :cond_11
    :goto_11
    return-void

    .line 321
    :pswitch_12
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    if-eqz v1, :cond_26

    .line 322
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 323
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onPositive(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 325
    :cond_26
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    if-eqz v1, :cond_2f

    .line 326
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendSingleChoiceCallback(Landroid/view/View;)Z

    .line 327
    :cond_2f
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    if-eqz v1, :cond_38

    .line 328
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendMultichoiceCallback()Z

    .line 329
    :cond_38
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    if-eqz v1, :cond_55

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-eqz v1, :cond_55

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallInputCallback:Z

    if-nez v1, :cond_55

    .line 330
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;->onInput(Lcom/afollestad/materialdialogs/MaterialDialog;Ljava/lang/CharSequence;)V

    .line 331
    :cond_55
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    goto :goto_11

    .line 335
    :pswitch_5f
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    if-eqz v1, :cond_73

    .line 336
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 337
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onNegative(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 339
    :cond_73
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    goto :goto_11

    .line 343
    :pswitch_7d
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    if-eqz v1, :cond_91

    .line 344
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 345
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 347
    :cond_91
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    goto/16 :goto_11

    .line 319
    :pswitch_data_9c
    .packed-switch 0x1
        :pswitch_7d
        :pswitch_5f
        :pswitch_12
    .end packed-switch
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 15
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 162
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    if-eqz v7, :cond_1a

    .line 164
    const/4 v6, 0x0

    .line 165
    .local v6, "text":Ljava/lang/CharSequence;
    instance-of v7, p2, Landroid/widget/TextView;

    if-eqz v7, :cond_12

    move-object v7, p2

    .line 166
    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    .line 167
    :cond_12
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    invoke-interface {v7, p0, p2, p3, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;->onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    .line 241
    .end local v6    # "text":Ljava/lang/CharSequence;
    :cond_19
    :goto_19
    return-void

    .line 168
    :cond_1a
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-eqz v7, :cond_24

    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v8, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->REGULAR:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v7, v8, :cond_3b

    .line 170
    :cond_24
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v7, :cond_2d

    .line 172
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 174
    :cond_2d
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    iget-object v8, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v8, v8, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    aget-object v8, v8, p3

    invoke-interface {v7, p0, p2, p3, v8}, Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;->onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    goto :goto_19

    .line 177
    :cond_3b
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v8, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->MULTI:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v7, v8, :cond_9a

    .line 178
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_72

    const/4 v5, 0x1

    .line 179
    .local v5, "shouldBeChecked":Z
    :goto_4e
    sget v7, Lcom/afollestad/materialdialogs/R$id;->control:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 180
    .local v2, "cb":Landroid/widget/CheckBox;
    if-eqz v5, :cond_83

    .line 182
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    if-eqz v7, :cond_7e

    .line 185
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendMultichoiceCallback()Z

    move-result v7

    if-eqz v7, :cond_74

    .line 186
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_19

    .line 178
    .end local v2    # "cb":Landroid/widget/CheckBox;
    .end local v5    # "shouldBeChecked":Z
    :cond_72
    const/4 v5, 0x0

    goto :goto_4e

    .line 189
    .restart local v2    # "cb":Landroid/widget/CheckBox;
    .restart local v5    # "shouldBeChecked":Z
    :cond_74
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_19

    .line 193
    :cond_7e
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_19

    .line 197
    :cond_83
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 198
    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 199
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    if-eqz v7, :cond_19

    .line 200
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendMultichoiceCallback()Z

    goto :goto_19

    .line 202
    .end local v2    # "cb":Landroid/widget/CheckBox;
    .end local v5    # "shouldBeChecked":Z
    :cond_9a
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v8, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->SINGLE:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v7, v8, :cond_19

    .line 203
    const/4 v1, 0x1

    .line 204
    .local v1, "allowSelection":Z
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    .line 205
    .local v0, "adapter":Lcom/afollestad/materialdialogs/MaterialDialogAdapter;
    sget v7, Lcom/afollestad/materialdialogs/R$id;->control:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RadioButton;

    .line 207
    .local v4, "radio":Landroid/widget/RadioButton;
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v7, :cond_ee

    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    if-nez v7, :cond_ee

    .line 209
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 211
    const/4 v1, 0x0

    .line 213
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput p3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 214
    invoke-direct {p0, p2}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendSingleChoiceCallback(Landroid/view/View;)Z

    .line 225
    :cond_c6
    :goto_c6
    if-eqz v1, :cond_19

    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    if-eq v7, p3, :cond_19

    .line 226
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput p3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 228
    iget-object v7, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->mRadioButton:Landroid/widget/RadioButton;

    if-nez v7, :cond_dc

    .line 229
    const/4 v7, 0x1

    iput-boolean v7, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->mInitRadio:Z

    .line 230
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->notifyDataSetChanged()V

    .line 232
    :cond_dc
    iget-object v7, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->mRadioButton:Landroid/widget/RadioButton;

    if-eqz v7, :cond_e6

    .line 233
    iget-object v7, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->mRadioButton:Landroid/widget/RadioButton;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 235
    :cond_e6
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 236
    iput-object v4, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->mRadioButton:Landroid/widget/RadioButton;

    goto/16 :goto_19

    .line 215
    :cond_ee
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallSingleChoiceCallback:Z

    if-eqz v7, :cond_c6

    .line 216
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 218
    .local v3, "oldSelected":I
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput p3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 220
    invoke-direct {p0, p2}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendSingleChoiceCallback(Landroid/view/View;)Z

    move-result v1

    .line 222
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput v3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    goto :goto_c6
.end method

.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1539
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_24

    .line 1540
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-static {p0, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->showKeyboard(Landroid/content/DialogInterface;Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)V

    .line 1541
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-lez v0, :cond_24

    .line 1542
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 1544
    :cond_24
    invoke-super {p0, p1}, Lcom/afollestad/materialdialogs/DialogBase;->onShow(Landroid/content/DialogInterface;)V

    .line 1545
    return-void
.end method

.method protected onStop()V
    .registers 2

    .prologue
    .line 1590
    invoke-super {p0}, Lcom/afollestad/materialdialogs/DialogBase;->onStop()V

    .line 1591
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_c

    .line 1592
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-static {p0, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->hideKeyboard(Landroid/content/DialogInterface;Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)V

    .line 1593
    :cond_c
    return-void
.end method

.method public final setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V
    .registers 4
    .param p1, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
    .param p2, "titleRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 1288
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;Ljava/lang/CharSequence;)V

    .line 1289
    return-void
.end method

.method public final setActionButton(Lcom/afollestad/materialdialogs/DialogAction;Ljava/lang/CharSequence;)V
    .registers 7
    .param p1, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "title"    # Ljava/lang/CharSequence;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    const/16 v0, 0x8

    const/4 v1, 0x0

    .line 1262
    sget-object v2, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_48

    .line 1264
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    .line 1265
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v2, p2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 1266
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    if-nez p2, :cond_1f

    :goto_1b
    invoke-virtual {v2, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 1279
    :goto_1e
    return-void

    :cond_1f
    move v0, v1

    .line 1266
    goto :goto_1b

    .line 1269
    :pswitch_21
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    .line 1270
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v2, p2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 1271
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    if-nez p2, :cond_32

    :goto_2e
    invoke-virtual {v2, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    goto :goto_1e

    :cond_32
    move v0, v1

    goto :goto_2e

    .line 1274
    :pswitch_34
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    .line 1275
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v2, p2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 1276
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    if-nez p2, :cond_45

    :goto_41
    invoke-virtual {v2, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    goto :goto_1e

    :cond_45
    move v0, v1

    goto :goto_41

    .line 1262
    nop

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_21
        :pswitch_34
    .end packed-switch
.end method

.method public final setContent(I)V
    .registers 3
    .param p1, "newContentRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1359
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setContent(Ljava/lang/CharSequence;)V

    .line 1360
    return-void
.end method

.method public final varargs setContent(I[Ljava/lang/Object;)V
    .registers 4
    .param p1, "newContentRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "formatArgs"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1364
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setContent(Ljava/lang/CharSequence;)V

    .line 1365
    return-void
.end method

.method public final setContent(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "newContent"    # Ljava/lang/CharSequence;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1353
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1354
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/16 v0, 0x8

    :goto_f
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1355
    return-void

    .line 1354
    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public bridge synthetic setContentView(I)V
    .registers 2
    .param p1, "x0"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .prologue
    .line 58
    invoke-super {p0, p1}, Lcom/afollestad/materialdialogs/DialogBase;->setContentView(I)V

    return-void
.end method

.method public bridge synthetic setContentView(Landroid/view/View;)V
    .registers 2
    .param p1, "x0"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .prologue
    .line 58
    invoke-super {p0, p1}, Lcom/afollestad/materialdialogs/DialogBase;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method public bridge synthetic setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Landroid/view/ViewGroup$LayoutParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessError;
        }
    .end annotation

    .prologue
    .line 58
    invoke-super {p0, p1, p2}, Lcom/afollestad/materialdialogs/DialogBase;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public setIcon(I)V
    .registers 4
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1335
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1336
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    if-eqz p1, :cond_e

    const/4 v0, 0x0

    :goto_a
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1337
    return-void

    .line 1336
    :cond_e
    const/16 v0, 0x8

    goto :goto_a
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1341
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1342
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    if-eqz p1, :cond_e

    const/4 v0, 0x0

    :goto_a
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1343
    return-void

    .line 1342
    :cond_e
    const/16 v0, 0x8

    goto :goto_a
.end method

.method public setIconAttribute(I)V
    .registers 4
    .param p1, "attrId"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1347
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1348
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 1349
    return-void
.end method

.method protected setInternalInputCallback()V
    .registers 3

    .prologue
    .line 1548
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-nez v0, :cond_5

    .line 1573
    :goto_4
    return-void

    .line 1549
    :cond_5
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    new-instance v1, Lcom/afollestad/materialdialogs/MaterialDialog$3;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$3;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    goto :goto_4
.end method

.method public final setItems([Ljava/lang/CharSequence;)V
    .registers 5
    .param p1, "items"    # [Ljava/lang/CharSequence;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1377
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-nez v0, :cond_e

    .line 1378
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This MaterialDialog instance does not yet have an adapter set to it. You cannot use setItems()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1379
    :cond_e
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    .line 1380
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v0, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    if-eqz v0, :cond_33

    .line 1381
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    new-instance v1, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    invoke-static {v2}, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->getLayoutForType(Lcom/afollestad/materialdialogs/MaterialDialog$ListType;)I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;I)V

    iput-object v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    .line 1385
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1386
    return-void

    .line 1383
    :cond_33
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "When using a custom adapter, setItems() cannot be used. Set items through the adapter instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setMaxProgress(I)V
    .registers 4
    .param p1, "max"    # I

    .prologue
    .line 1424
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v1, -0x2

    if-gt v0, v1, :cond_f

    .line 1425
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use setMaxProgress() on this dialog."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1426
    :cond_f
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 1427
    return-void
.end method

.method public setMessage(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1372
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setContent(Ljava/lang/CharSequence;)V

    .line 1373
    return-void
.end method

.method public final setProgress(I)V
    .registers 4
    .param p1, "progress"    # I

    .prologue
    .line 1404
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v1, -0x2

    if-gt v0, v1, :cond_f

    .line 1405
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use setProgress() on this dialog."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1406
    :cond_f
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 1407
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/afollestad/materialdialogs/MaterialDialog$2;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$2;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1421
    return-void
.end method

.method public final setProgressNumberFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 1452
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    .line 1453
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCurrentProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setProgress(I)V

    .line 1454
    return-void
.end method

.method public final setProgressPercentFormat(Ljava/text/NumberFormat;)V
    .registers 3
    .param p1, "format"    # Ljava/text/NumberFormat;

    .prologue
    .line 1443
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    .line 1444
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCurrentProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setProgress(I)V

    .line 1445
    return-void
.end method

.method public setSelectedIndex(I)V
    .registers 4
    .param p1, "index"    # I
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1496
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 1497
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v0, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    if-eqz v0, :cond_1c

    .line 1498
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->notifyDataSetChanged()V

    .line 1502
    return-void

    .line 1500
    :cond_1c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You can only use setSelectedIndex() with the default adapter implementation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSelectedIndices([Ljava/lang/Integer;)V
    .registers 4
    .param p1, "indices"    # [Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1513
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    .line 1514
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    .line 1515
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_27

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v0, v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    if-eqz v0, :cond_27

    .line 1516
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v0, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialogAdapter;->notifyDataSetChanged()V

    .line 1520
    return-void

    .line 1518
    :cond_27
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You can only use setSelectedIndices() with the default adapter implementation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setTitle(I)V
    .registers 3
    .param p1, "newTitleRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1325
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1326
    return-void
.end method

.method public final varargs setTitle(I[Ljava/lang/Object;)V
    .registers 4
    .param p1, "newTitleRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "formatArgs"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1330
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1331
    return-void
.end method

.method public final setTitle(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "newTitle"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1319
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1320
    return-void
.end method

.method public final setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V
    .registers 5
    .param p1, "target"    # Landroid/widget/TextView;
    .param p2, "t"    # Landroid/graphics/Typeface;

    .prologue
    .line 95
    if-nez p2, :cond_3

    .line 99
    :goto_2
    return-void

    .line 96
    :cond_3
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v1

    or-int/lit16 v0, v1, 0x80

    .line 97
    .local v0, "flags":I
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 98
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_2
.end method

.method public show()V
    .registers 4
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1184
    :try_start_0
    invoke-super {p0}, Lcom/afollestad/materialdialogs/DialogBase;->show()V
    :try_end_3
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_0 .. :try_end_3} :catch_4

    .line 1188
    return-void

    .line 1185
    :catch_4
    move-exception v0

    .line 1186
    .local v0, "e":Landroid/view/WindowManager$BadTokenException;
    new-instance v1, Lcom/afollestad/materialdialogs/MaterialDialog$DialogException;

    const-string v2, "Bad window token, you cannot show a dialog before an Activity is created or after it\'s hidden."

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog$DialogException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
