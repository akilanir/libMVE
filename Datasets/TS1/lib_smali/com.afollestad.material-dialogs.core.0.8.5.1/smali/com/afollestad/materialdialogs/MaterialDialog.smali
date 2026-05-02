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
        Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;,
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

.field private final mHandler:Landroid/os/Handler;

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
    .line 90
    iget-object v1, p1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {p1}, Lcom/afollestad/materialdialogs/DialogInit;->getTheme(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/afollestad/materialdialogs/DialogBase;-><init>(Landroid/content/Context;I)V

    .line 91
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mHandler:Landroid/os/Handler;

    .line 92
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 93
    iget-object v1, p1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 94
    .local v0, "inflater":Landroid/view/LayoutInflater;
    invoke-static {p1}, Lcom/afollestad/materialdialogs/DialogInit;->getInflateLayout(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    .line 95
    invoke-static {p0}, Lcom/afollestad/materialdialogs/DialogInit;->init(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 96
    return-void
.end method

.method private sendMultichoiceCallback()Z
    .registers 7

    .prologue
    .line 313
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    if-nez v3, :cond_8

    const/4 v3, 0x0

    .line 320
    :goto_7
    return v3

    .line 314
    :cond_8
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 315
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 316
    .local v2, "selectedTitles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/CharSequence;>;"
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_18
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 317
    .local v0, "i":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ltz v3, :cond_18

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v4, v4, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    if-gt v3, v4, :cond_18

    .line 318
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_18

    .line 320
    .end local v0    # "i":Ljava/lang/Integer;
    :cond_45
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

    goto :goto_7
.end method

.method private sendSingleChoiceCallback(Landroid/view/View;)Z
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 304
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    if-nez v1, :cond_8

    const/4 v1, 0x0

    .line 309
    :goto_7
    return v1

    .line 305
    :cond_8
    const/4 v0, 0x0

    .line 306
    .local v0, "text":Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    if-ltz v1, :cond_24

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    array-length v2, v2

    if-ge v1, v2, :cond_24

    .line 307
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    aget-object v0, v1, v2

    .line 309
    :cond_24
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    invoke-interface {v1, p0, p1, v2, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;->onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;Landroid/view/View;ILjava/lang/CharSequence;)Z

    move-result v1

    goto :goto_7
.end method


# virtual methods
.method protected final checkIfListInitScroll()V
    .registers 3

    .prologue
    .line 106
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    if-nez v0, :cond_5

    .line 147
    :goto_4
    return-void

    .line 108
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
    .registers 2

    .prologue
    .line 1696
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->clearSelectedIndices(Z)V

    .line 1697
    return-void
.end method

.method public clearSelectedIndices(Z)V
    .registers 4
    .param p1, "sendCallback"    # Z

    .prologue
    .line 1705
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v1, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->MULTI:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-eq v0, v1, :cond_12

    .line 1706
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You can only use clearSelectedIndices() with multi choice list dialogs."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1707
    :cond_12
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_3e

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v0, v0, Lcom/afollestad/materialdialogs/DefaultAdapter;

    if-eqz v0, :cond_3e

    .line 1708
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    if-eqz v0, :cond_29

    .line 1709
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1710
    :cond_29
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v0, Lcom/afollestad/materialdialogs/DefaultAdapter;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/DefaultAdapter;->notifyDataSetChanged()V

    .line 1711
    if-eqz p1, :cond_3d

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    if-eqz v0, :cond_3d

    .line 1712
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendMultichoiceCallback()Z

    .line 1716
    :cond_3d
    return-void

    .line 1714
    :cond_3e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You can only use clearSelectedIndices() with the default adapter implementation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic findViewById(I)Landroid/view/View;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 62
    invoke-super {p0, p1}, Lcom/afollestad/materialdialogs/DialogBase;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Lcom/afollestad/materialdialogs/internal/MDButton;
    .registers 4
    .param p1, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1363
    sget-object v0, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_14

    .line 1365
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    .line 1369
    :goto_d
    return-object v0

    .line 1367
    :pswitch_e
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    goto :goto_d

    .line 1369
    :pswitch_11
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    goto :goto_d

    .line 1363
    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_e
        :pswitch_11
    .end packed-switch
.end method

.method public final getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    return-object v0
.end method

.method getButtonSelector(Lcom/afollestad/materialdialogs/DialogAction;Z)Landroid/graphics/drawable/Drawable;
    .registers 8
    .param p1, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
    .param p2, "isStacked"    # Z

    .prologue
    const/16 v4, 0x15

    const/4 v3, 0x0

    .line 261
    if-eqz p2, :cond_33

    .line 262
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorStacked:I

    if-eqz v1, :cond_1c

    .line 263
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorStacked:I

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 297
    :cond_1b
    :goto_1b
    return-object v0

    .line 264
    :cond_1c
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_stacked_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 265
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_1b

    .line 266
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_stacked_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_1b

    .line 268
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :cond_33
    sget-object v1, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_ec

    .line 270
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    if-eqz v1, :cond_55

    .line 271
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_1b

    .line 272
    :cond_55
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_positive_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 273
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_1b

    .line 274
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_positive_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 275
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v4, :cond_1b

    .line 276
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonRippleColor:I

    invoke-static {v0, v1}, Lcom/afollestad/materialdialogs/util/RippleHelper;->applyColor(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_1b

    .line 280
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :pswitch_77
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    if-eqz v1, :cond_8e

    .line 281
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_1b

    .line 282
    :cond_8e
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_neutral_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 283
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_1b

    .line 284
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_neutral_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 285
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v4, :cond_1b

    .line 286
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonRippleColor:I

    invoke-static {v0, v1}, Lcom/afollestad/materialdialogs/util/RippleHelper;->applyColor(Landroid/graphics/drawable/Drawable;I)V

    goto/16 :goto_1b

    .line 290
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    :pswitch_b1
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    if-eqz v1, :cond_c9

    .line 291
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto/16 :goto_1b

    .line 292
    :cond_c9
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_negative_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 293
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_1b

    .line 294
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_btn_negative_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 295
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v4, :cond_1b

    .line 296
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonRippleColor:I

    invoke-static {v0, v1}, Lcom/afollestad/materialdialogs/util/RippleHelper;->applyColor(Landroid/graphics/drawable/Drawable;I)V

    goto/16 :goto_1b

    .line 268
    :pswitch_data_ec
    .packed-switch 0x1
        :pswitch_77
        :pswitch_b1
    .end packed-switch
.end method

.method public final getContentView()Landroid/widget/TextView;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1411
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    return-object v0
.end method

.method public final getCurrentProgress()I
    .registers 2

    .prologue
    .line 1560
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    if-nez v0, :cond_6

    const/4 v0, -0x1

    .line 1561
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
    .line 1421
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    return-object v0
.end method

.method public getIconView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 1402
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    return-object v0
.end method

.method public final getInputEditText()Landroid/widget/EditText;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 1387
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    return-object v0
.end method

.method protected final getListSelector()Landroid/graphics/drawable/Drawable;
    .registers 5

    .prologue
    .line 253
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listSelector:I

    if-eqz v1, :cond_18

    .line 254
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listSelector:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 257
    :cond_17
    :goto_17
    return-object v0

    .line 255
    :cond_18
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v2, Lcom/afollestad/materialdialogs/R$attr;->md_list_selector:I

    invoke-static {v1, v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 256
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_17

    .line 257
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
    .line 1382
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    return-object v0
.end method

.method public final getMaxProgress()I
    .registers 2

    .prologue
    .line 1605
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    if-nez v0, :cond_6

    const/4 v0, -0x1

    .line 1606
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
    .line 1565
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method public getSelectedIndex()I
    .registers 2

    .prologue
    .line 1637
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    if-eqz v0, :cond_b

    .line 1638
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 1640
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
    .line 1651
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    if-eqz v0, :cond_17

    .line 1652
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Integer;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Integer;

    .line 1654
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public final getTitleView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 1395
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    return-object v0
.end method

.method public final getView()Landroid/view/View;
    .registers 2

    .prologue
    .line 1377
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->view:Lcom/afollestad/materialdialogs/internal/MDRootLayout;

    return-object v0
.end method

.method public final hasActionButtons()Z
    .registers 2

    .prologue
    .line 1468
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
    .line 1569
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCurrentProgress()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setProgress(I)V

    .line 1570
    return-void
.end method

.method protected invalidateInputMinMaxIndicator(IZ)V
    .registers 13
    .param p1, "currentLength"    # I
    .param p2, "emptyDisabled"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1787
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    if-eqz v6, :cond_6d

    .line 1788
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v6, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    if-lez v6, :cond_6e

    .line 1789
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    const-string v7, "%d/%d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    iget-object v9, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v9, v9, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v4

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1790
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1792
    :goto_2f
    if-eqz p2, :cond_33

    if-eqz p1, :cond_45

    :cond_33
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v6, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    if-lez v6, :cond_3f

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v6, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    if-gt p1, v6, :cond_45

    :cond_3f
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v6, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMinLength:I

    if-ge p1, v6, :cond_76

    :cond_45
    move v2, v4

    .line 1795
    .local v2, "isDisabled":Z
    :goto_46
    if-eqz v2, :cond_78

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRangeErrorColor:I

    .line 1796
    .local v0, "colorText":I
    :goto_4c
    if-eqz v2, :cond_7d

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRangeErrorColor:I

    .line 1797
    .local v1, "colorWidget":I
    :goto_52
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v6, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    if-lez v6, :cond_5d

    .line 1798
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1799
    :cond_5d
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-static {v6, v1}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/EditText;I)V

    .line 1800
    sget-object v6, Lcom/afollestad/materialdialogs/DialogAction;->POSITIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual {p0, v6}, Lcom/afollestad/materialdialogs/MaterialDialog;->getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Lcom/afollestad/materialdialogs/internal/MDButton;

    move-result-object v3

    .line 1801
    .local v3, "positiveAb":Landroid/view/View;
    if-nez v2, :cond_82

    :goto_6a
    invoke-virtual {v3, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 1803
    .end local v0    # "colorText":I
    .end local v1    # "colorWidget":I
    .end local v2    # "isDisabled":Z
    .end local v3    # "positiveAb":Landroid/view/View;
    :cond_6d
    return-void

    .line 1791
    :cond_6e
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->inputMinMax:Landroid/widget/TextView;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2f

    :cond_76
    move v2, v5

    .line 1792
    goto :goto_46

    .line 1795
    .restart local v2    # "isDisabled":Z
    :cond_78
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    goto :goto_4c

    .line 1796
    .restart local v0    # "colorText":I
    :cond_7d
    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v1, v6, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    goto :goto_52

    .restart local v1    # "colorWidget":I
    .restart local v3    # "positiveAb":Landroid/view/View;
    :cond_82
    move v4, v5

    .line 1801
    goto :goto_6a
.end method

.method protected final invalidateList()V
    .registers 3

    .prologue
    .line 153
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    if-nez v0, :cond_5

    .line 161
    :cond_4
    :goto_4
    return-void

    .line 155
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

    .line 158
    :cond_18
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 159
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-nez v0, :cond_2b

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    if-eqz v0, :cond_4

    .line 160
    :cond_2b
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    goto :goto_4
.end method

.method public final isCancelled()Z
    .registers 2

    .prologue
    .line 1628
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
    .line 1601
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    return v0
.end method

.method public final numberOfActionButtons()I
    .registers 3

    .prologue
    .line 1477
    const/4 v0, 0x0

    .line 1478
    .local v0, "number":I
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->getVisibility()I

    move-result v1

    if-nez v1, :cond_11

    .line 1479
    add-int/lit8 v0, v0, 0x1

    .line 1480
    :cond_11
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_21

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->getVisibility()I

    move-result v1

    if-nez v1, :cond_21

    .line 1481
    add-int/lit8 v0, v0, 0x1

    .line 1482
    :cond_21
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_31

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->getVisibility()I

    move-result v1

    if-nez v1, :cond_31

    .line 1483
    add-int/lit8 v0, v0, 0x1

    .line 1484
    :cond_31
    return v0
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 327
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/DialogAction;

    .line 328
    .local v0, "tag":Lcom/afollestad/materialdialogs/DialogAction;
    sget-object v1, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_d2

    .line 366
    :cond_11
    :goto_11
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onAnyCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    if-eqz v1, :cond_1e

    .line 367
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onAnyCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    invoke-interface {v1, p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;->onClick(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V

    .line 368
    :cond_1e
    return-void

    .line 330
    :pswitch_1f
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    if-eqz v1, :cond_33

    .line 331
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 332
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onPositive(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 334
    :cond_33
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onPositiveCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    if-eqz v1, :cond_40

    .line 335
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onPositiveCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    invoke-interface {v1, p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;->onClick(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V

    .line 336
    :cond_40
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallSingleChoiceCallback:Z

    if-nez v1, :cond_49

    .line 337
    invoke-direct {p0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendSingleChoiceCallback(Landroid/view/View;)Z

    .line 338
    :cond_49
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    if-nez v1, :cond_52

    .line 339
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendMultichoiceCallback()Z

    .line 340
    :cond_52
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    if-eqz v1, :cond_6f

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-eqz v1, :cond_6f

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallInputCallback:Z

    if-nez v1, :cond_6f

    .line 341
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;->onInput(Lcom/afollestad/materialdialogs/MaterialDialog;Ljava/lang/CharSequence;)V

    .line 342
    :cond_6f
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    goto :goto_11

    .line 346
    :pswitch_79
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    if-eqz v1, :cond_8d

    .line 347
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 348
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onNegative(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 350
    :cond_8d
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNegativeCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    if-eqz v1, :cond_9a

    .line 351
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNegativeCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    invoke-interface {v1, p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;->onClick(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V

    .line 352
    :cond_9a
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    goto/16 :goto_11

    .line 356
    :pswitch_a5
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    if-eqz v1, :cond_b9

    .line 357
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onAny(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 358
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    invoke-virtual {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;->onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 360
    :cond_b9
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNeutralCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    if-eqz v1, :cond_c6

    .line 361
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNeutralCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    invoke-interface {v1, p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;->onClick(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V

    .line 362
    :cond_c6
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v1, :cond_11

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    goto/16 :goto_11

    .line 328
    nop

    :pswitch_data_d2
    .packed-switch 0x1
        :pswitch_a5
        :pswitch_79
        :pswitch_1f
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
    .line 165
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    if-eqz v7, :cond_1a

    .line 167
    const/4 v6, 0x0

    .line 168
    .local v6, "text":Ljava/lang/CharSequence;
    instance-of v7, p2, Landroid/widget/TextView;

    if-eqz v7, :cond_12

    move-object v7, p2

    .line 169
    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    .line 170
    :cond_12
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    invoke-interface {v7, p0, p2, p3, v6}, Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;->onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    .line 238
    .end local v6    # "text":Ljava/lang/CharSequence;
    :cond_19
    :goto_19
    return-void

    .line 171
    :cond_1a
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-eqz v7, :cond_24

    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v8, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->REGULAR:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v7, v8, :cond_41

    .line 173
    :cond_24
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v7, :cond_2d

    .line 175
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 177
    :cond_2d
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    if-eqz v7, :cond_19

    .line 178
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    iget-object v8, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v8, v8, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    aget-object v8, v8, p3

    invoke-interface {v7, p0, p2, p3, v8}, Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;->onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    goto :goto_19

    .line 182
    :cond_41
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v8, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->MULTI:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v7, v8, :cond_a1

    .line 183
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_78

    const/4 v5, 0x1

    .line 184
    .local v5, "shouldBeChecked":Z
    :goto_54
    sget v7, Lcom/afollestad/materialdialogs/R$id;->control:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 185
    .local v2, "cb":Landroid/widget/CheckBox;
    if-eqz v5, :cond_89

    .line 187
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    if-eqz v7, :cond_84

    .line 190
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendMultichoiceCallback()Z

    move-result v7

    if-eqz v7, :cond_7a

    .line 191
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_19

    .line 183
    .end local v2    # "cb":Landroid/widget/CheckBox;
    .end local v5    # "shouldBeChecked":Z
    :cond_78
    const/4 v5, 0x0

    goto :goto_54

    .line 194
    .restart local v2    # "cb":Landroid/widget/CheckBox;
    .restart local v5    # "shouldBeChecked":Z
    :cond_7a
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_19

    .line 198
    :cond_84
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_19

    .line 202
    :cond_89
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 203
    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 204
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    if-eqz v7, :cond_19

    .line 205
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendMultichoiceCallback()Z

    goto/16 :goto_19

    .line 207
    .end local v2    # "cb":Landroid/widget/CheckBox;
    .end local v5    # "shouldBeChecked":Z
    :cond_a1
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v8, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->SINGLE:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-ne v7, v8, :cond_19

    .line 208
    const/4 v1, 0x1

    .line 209
    .local v1, "allowSelection":Z
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v0, Lcom/afollestad/materialdialogs/DefaultAdapter;

    .line 210
    .local v0, "adapter":Lcom/afollestad/materialdialogs/DefaultAdapter;
    sget v7, Lcom/afollestad/materialdialogs/R$id;->control:I

    invoke-virtual {p2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RadioButton;

    .line 212
    .local v4, "radio":Landroid/widget/RadioButton;
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    if-eqz v7, :cond_dc

    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    if-nez v7, :cond_dc

    .line 214
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->dismiss()V

    .line 216
    const/4 v1, 0x0

    .line 218
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput p3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 219
    invoke-direct {p0, p2}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendSingleChoiceCallback(Landroid/view/View;)Z

    .line 230
    :cond_cd
    :goto_cd
    if-eqz v1, :cond_19

    .line 231
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput p3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 232
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 233
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/DefaultAdapter;->notifyDataSetChanged()V

    goto/16 :goto_19

    .line 220
    :cond_dc
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v7, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallSingleChoiceCallback:Z

    if-eqz v7, :cond_cd

    .line 221
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 223
    .local v3, "oldSelected":I
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput p3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 225
    invoke-direct {p0, p2}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendSingleChoiceCallback(Landroid/view/View;)Z

    move-result v1

    .line 227
    iget-object v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput v3, v7, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    goto :goto_cd
.end method

.method public final onShow(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1750
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_24

    .line 1751
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-static {p0, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->showKeyboard(Landroid/content/DialogInterface;Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)V

    .line 1752
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-lez v0, :cond_24

    .line 1753
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 1755
    :cond_24
    invoke-super {p0, p1}, Lcom/afollestad/materialdialogs/DialogBase;->onShow(Landroid/content/DialogInterface;)V

    .line 1756
    return-void
.end method

.method protected onStop()V
    .registers 2

    .prologue
    .line 1807
    invoke-super {p0}, Lcom/afollestad/materialdialogs/DialogBase;->onStop()V

    .line 1808
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_c

    .line 1809
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-static {p0, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->hideKeyboard(Landroid/content/DialogInterface;Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)V

    .line 1810
    :cond_c
    return-void
.end method

.method public selectAllIndicies()V
    .registers 2

    .prologue
    .line 1722
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->selectAllIndicies(Z)V

    .line 1723
    return-void
.end method

.method public selectAllIndicies(Z)V
    .registers 5
    .param p1, "sendCallback"    # Z

    .prologue
    .line 1731
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    sget-object v2, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->MULTI:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    if-eq v1, v2, :cond_12

    .line 1732
    :cond_a
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "You can only use selectAllIndicies() with multi choice list dialogs."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1733
    :cond_12
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v1, :cond_63

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v1, v1, Lcom/afollestad/materialdialogs/DefaultAdapter;

    if-eqz v1, :cond_63

    .line 1734
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    if-nez v1, :cond_2b

    .line 1735
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    .line 1736
    :cond_2b
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2c
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_4e

    .line 1737
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4b

    .line 1738
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1736
    :cond_4b
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 1740
    :cond_4e
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v1, Lcom/afollestad/materialdialogs/DefaultAdapter;

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/DefaultAdapter;->notifyDataSetChanged()V

    .line 1741
    if-eqz p1, :cond_62

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    if-eqz v1, :cond_62

    .line 1742
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->sendMultichoiceCallback()Z

    .line 1746
    :cond_62
    return-void

    .line 1744
    .end local v0    # "i":I
    :cond_63
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "You can only use selectAllIndicies() with the default adapter implementation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V
    .registers 4
    .param p1, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
    .param p2, "titleRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 1459
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;Ljava/lang/CharSequence;)V

    .line 1460
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

    .line 1433
    sget-object v2, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_48

    .line 1435
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    .line 1436
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v2, p2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 1437
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->positiveButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    if-nez p2, :cond_1f

    :goto_1b
    invoke-virtual {v2, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    .line 1450
    :goto_1e
    return-void

    :cond_1f
    move v0, v1

    .line 1437
    goto :goto_1b

    .line 1440
    :pswitch_21
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    .line 1441
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v2, p2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 1442
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->neutralButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    if-nez p2, :cond_32

    :goto_2e
    invoke-virtual {v2, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    goto :goto_1e

    :cond_32
    move v0, v1

    goto :goto_2e

    .line 1445
    :pswitch_34
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p2, v2, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    .line 1446
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    invoke-virtual {v2, p2}, Lcom/afollestad/materialdialogs/internal/MDButton;->setText(Ljava/lang/CharSequence;)V

    .line 1447
    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->negativeButton:Lcom/afollestad/materialdialogs/internal/MDButton;

    if-nez p2, :cond_45

    :goto_41
    invoke-virtual {v2, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setVisibility(I)V

    goto :goto_1e

    :cond_45
    move v0, v1

    goto :goto_41

    .line 1433
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
    .line 1530
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setContent(Ljava/lang/CharSequence;)V

    .line 1531
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
    .line 1535
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setContent(Ljava/lang/CharSequence;)V

    .line 1536
    return-void
.end method

.method public final setContent(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "newContent"    # Ljava/lang/CharSequence;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1524
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1525
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->content:Landroid/widget/TextView;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const/16 v0, 0x8

    :goto_f
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1526
    return-void

    .line 1525
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
    .line 62
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
    .line 62
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
    .line 62
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
    .line 1506
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1507
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    if-eqz p1, :cond_e

    const/4 v0, 0x0

    :goto_a
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1508
    return-void

    .line 1507
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
    .line 1512
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1513
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->icon:Landroid/widget/ImageView;

    if-eqz p1, :cond_e

    const/4 v0, 0x0

    :goto_a
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1514
    return-void

    .line 1513
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
    .line 1518
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1519
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 1520
    return-void
.end method

.method protected setInternalInputCallback()V
    .registers 3

    .prologue
    .line 1759
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    if-nez v0, :cond_5

    .line 1784
    :goto_4
    return-void

    .line 1760
    :cond_5
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->input:Landroid/widget/EditText;

    new-instance v1, Lcom/afollestad/materialdialogs/MaterialDialog$3;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$3;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    goto :goto_4
.end method

.method public final varargs setItems([Ljava/lang/CharSequence;)V
    .registers 5
    .param p1, "items"    # [Ljava/lang/CharSequence;
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1548
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-nez v0, :cond_e

    .line 1549
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This MaterialDialog instance does not yet have an adapter set to it. You cannot use setItems()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1550
    :cond_e
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    .line 1551
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v0, v0, Lcom/afollestad/materialdialogs/DefaultAdapter;

    if-eqz v0, :cond_33

    .line 1552
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    new-instance v1, Lcom/afollestad/materialdialogs/DefaultAdapter;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    invoke-static {v2}, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->getLayoutForType(Lcom/afollestad/materialdialogs/MaterialDialog$ListType;)I

    move-result v2

    invoke-direct {v1, p0, v2}, Lcom/afollestad/materialdialogs/DefaultAdapter;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;I)V

    iput-object v1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    .line 1556
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->listView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v1, v1, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1557
    return-void

    .line 1554
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
    .line 1595
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v1, -0x2

    if-gt v0, v1, :cond_f

    .line 1596
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use setMaxProgress() on this dialog."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1597
    :cond_f
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 1598
    return-void
.end method

.method public setMessage(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/CharSequence;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1543
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setContent(Ljava/lang/CharSequence;)V

    .line 1544
    return-void
.end method

.method public final setProgress(I)V
    .registers 4
    .param p1, "progress"    # I

    .prologue
    .line 1575
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v1, -0x2

    if-gt v0, v1, :cond_f

    .line 1576
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot use setProgress() on this dialog."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1577
    :cond_f
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 1578
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/afollestad/materialdialogs/MaterialDialog$2;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$2;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1592
    return-void
.end method

.method public final setProgressNumberFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 1623
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    .line 1624
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCurrentProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setProgress(I)V

    .line 1625
    return-void
.end method

.method public final setProgressPercentFormat(Ljava/text/NumberFormat;)V
    .registers 3
    .param p1, "format"    # Ljava/text/NumberFormat;

    .prologue
    .line 1614
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput-object p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    .line 1615
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog;->getCurrentProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setProgress(I)V

    .line 1616
    return-void
.end method

.method public setSelectedIndex(I)V
    .registers 4
    .param p1, "index"    # I
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1667
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iput p1, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 1668
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v0, v0, Lcom/afollestad/materialdialogs/DefaultAdapter;

    if-eqz v0, :cond_1c

    .line 1669
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v0, Lcom/afollestad/materialdialogs/DefaultAdapter;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/DefaultAdapter;->notifyDataSetChanged()V

    .line 1673
    return-void

    .line 1671
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
    .line 1684
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    .line 1685
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_23

    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    instance-of v0, v0, Lcom/afollestad/materialdialogs/DefaultAdapter;

    if-eqz v0, :cond_23

    .line 1686
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    check-cast v0, Lcom/afollestad/materialdialogs/DefaultAdapter;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/DefaultAdapter;->notifyDataSetChanged()V

    .line 1690
    return-void

    .line 1688
    :cond_23
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
    .line 1496
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1497
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
    .line 1501
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1502
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
    .line 1490
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog;->title:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1491
    return-void
.end method

.method public final setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V
    .registers 5
    .param p1, "target"    # Landroid/widget/TextView;
    .param p2, "t"    # Landroid/graphics/Typeface;

    .prologue
    .line 99
    if-nez p2, :cond_3

    .line 103
    :goto_2
    return-void

    .line 100
    :cond_3
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaintFlags()I

    move-result v1

    or-int/lit16 v0, v1, 0x80

    .line 101
    .local v0, "flags":I
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 102
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_2
.end method

.method public show()V
    .registers 4
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1348
    :try_start_0
    invoke-super {p0}, Lcom/afollestad/materialdialogs/DialogBase;->show()V
    :try_end_3
    .catch Landroid/view/WindowManager$BadTokenException; {:try_start_0 .. :try_end_3} :catch_4

    .line 1352
    return-void

    .line 1349
    :catch_4
    move-exception v0

    .line 1350
    .local v0, "e":Landroid/view/WindowManager$BadTokenException;
    new-instance v1, Lcom/afollestad/materialdialogs/MaterialDialog$DialogException;

    const-string v2, "Bad window token, you cannot show a dialog before an Activity is created or after it\'s hidden."

    invoke-direct {v1, v2}, Lcom/afollestad/materialdialogs/MaterialDialog$DialogException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
