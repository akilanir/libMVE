.class public Lcom/rey/material/app/SimpleDialog;
.super Lcom/rey/material/app/Dialog;
.source "SimpleDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/app/SimpleDialog$1;,
        Lcom/rey/material/app/SimpleDialog$Builder;,
        Lcom/rey/material/app/SimpleDialog$InternalAdapter;,
        Lcom/rey/material/app/SimpleDialog$InternalListView;,
        Lcom/rey/material/app/SimpleDialog$InternalScrollView;,
        Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;
    }
.end annotation


# static fields
.field protected static final MODE_CUSTOM:I = 0x4

.field protected static final MODE_ITEMS:I = 0x2

.field protected static final MODE_MESSAGE:I = 0x1

.field protected static final MODE_MULTI_ITEMS:I = 0x3

.field protected static final MODE_NONE:I


# instance fields
.field private mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

.field private mCheckBoxStyle:I

.field private mItemHeight:I

.field private mItemTextAppearance:I

.field private mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

.field private mMessage:Lcom/rey/material/widget/TextView;

.field private mMessageTextAppearanceId:I

.field private mMessageTextColor:I

.field private mMode:I

.field private mOnSelectionChangedListener:Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;

.field private mRadioButtonStyle:I

.field private mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    sget v0, Lcom/rey/material/R$style;->Material_App_Dialog_Simple_Light:I

    invoke-direct {p0, p1, v0}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "style"    # I

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Lcom/rey/material/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 70
    return-void
.end method

.method static synthetic access$100(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/SimpleDialog;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/rey/material/app/SimpleDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/SimpleDialog;

    .prologue
    .line 27
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mItemHeight:I

    return v0
.end method

.method static synthetic access$300(Lcom/rey/material/app/SimpleDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/SimpleDialog;

    .prologue
    .line 27
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mMode:I

    return v0
.end method

.method static synthetic access$400(Lcom/rey/material/app/SimpleDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/SimpleDialog;

    .prologue
    .line 27
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mCheckBoxStyle:I

    return v0
.end method

.method static synthetic access$500(Lcom/rey/material/app/SimpleDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/SimpleDialog;

    .prologue
    .line 27
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mRadioButtonStyle:I

    return v0
.end method

.method static synthetic access$600(Lcom/rey/material/app/SimpleDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/SimpleDialog;

    .prologue
    .line 27
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mItemTextAppearance:I

    return v0
.end method

.method static synthetic access$700(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/SimpleDialog;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mOnSelectionChangedListener:Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;

    return-object v0
.end method

.method static synthetic access$800(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/app/SimpleDialog$InternalListView;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/SimpleDialog;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    return-object v0
.end method

.method private initListView()V
    .registers 6

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 285
    new-instance v0, Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/rey/material/app/SimpleDialog$InternalListView;-><init>(Lcom/rey/material/app/SimpleDialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    .line 286
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-virtual {v0, v3}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setDividerHeight(I)V

    .line 287
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-virtual {v0, v3}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setCacheColorHint(I)V

    .line 288
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    const/high16 v1, 0x2000000

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setScrollBarStyle(I)V

    .line 289
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-virtual {v0, v3}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setClipToPadding(Z)V

    .line 290
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-static {}, Lcom/rey/material/drawable/BlankDrawable;->getInstance()Lcom/rey/material/drawable/BlankDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 291
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    iget v1, p0, Lcom/rey/material/app/SimpleDialog;->mContentPadding:I

    iget v2, p0, Lcom/rey/material/app/SimpleDialog;->mActionPadding:I

    sub-int/2addr v1, v2

    invoke-virtual {v0, v3, v3, v3, v1}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setPadding(IIII)V

    .line 292
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-virtual {v0, v3}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setVerticalFadingEdgeEnabled(Z)V

    .line 293
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-virtual {v0, v4}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setOverScrollMode(I)V

    .line 294
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setLayoutDirection(Landroid/view/View;I)V

    .line 296
    new-instance v0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;-><init>(Lcom/rey/material/app/SimpleDialog;Lcom/rey/material/app/SimpleDialog$1;)V

    iput-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    .line 297
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog$InternalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 298
    return-void
.end method

.method private initMessageView()V
    .registers 4

    .prologue
    .line 160
    new-instance v0, Lcom/rey/material/widget/TextView;

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/rey/material/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    .line 161
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/app/SimpleDialog;->mMessageTextAppearanceId:I

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 162
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    iget v1, p0, Lcom/rey/material/app/SimpleDialog;->mMessageTextColor:I

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/TextView;->setTextColor(I)V

    .line 163
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    const v1, 0x800013

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/TextView;->setGravity(I)V

    .line 164
    return-void
.end method

.method private initScrollView()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 151
    new-instance v0, Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;-><init>(Lcom/rey/material/app/SimpleDialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    .line 152
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    iget v1, p0, Lcom/rey/material/app/SimpleDialog;->mContentPadding:I

    iget v2, p0, Lcom/rey/material/app/SimpleDialog;->mActionPadding:I

    sub-int/2addr v1, v2

    invoke-virtual {v0, v3, v3, v3, v1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->setPadding(IIII)V

    .line 153
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    invoke-virtual {v0, v3}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->setClipToPadding(Z)V

    .line 154
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->setFillViewport(Z)V

    .line 155
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    const/high16 v1, 0x2000000

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->setScrollBarStyle(I)V

    .line 156
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setLayoutDirection(Landroid/view/View;I)V

    .line 157
    return-void
.end method


# virtual methods
.method public applyStyle(I)Lcom/rey/material/app/Dialog;
    .registers 12
    .param p1, "resId"    # I

    .prologue
    const/4 v9, 0x0

    .line 81
    invoke-super {p0, p1}, Lcom/rey/material/app/Dialog;->applyStyle(I)Lcom/rey/material/app/Dialog;

    .line 83
    if-nez p1, :cond_7

    .line 118
    :cond_6
    :goto_6
    return-object p0

    .line 86
    :cond_7
    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog;->getContext()Landroid/content/Context;

    move-result-object v7

    sget-object v8, Lcom/rey/material/R$styleable;->SimpleDialog:[I

    invoke-virtual {v7, p1, v8}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 87
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v4, 0x0

    .line 88
    .local v4, "textAppearance":I
    const/4 v5, 0x0

    .line 89
    .local v5, "textColor":I
    const/4 v6, 0x0

    .line 91
    .local v6, "textColorDefined":Z
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    .local v2, "count":I
    :goto_19
    if-ge v3, v2, :cond_64

    .line 92
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 94
    .local v1, "attr":I
    sget v7, Lcom/rey/material/R$styleable;->SimpleDialog_di_messageTextAppearance:I

    if-ne v1, v7, :cond_2a

    .line 95
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    .line 91
    :cond_27
    :goto_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 96
    :cond_2a
    sget v7, Lcom/rey/material/R$styleable;->SimpleDialog_di_messageTextColor:I

    if-ne v1, v7, :cond_34

    .line 97
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v5

    .line 98
    const/4 v6, 0x1

    goto :goto_27

    .line 100
    :cond_34
    sget v7, Lcom/rey/material/R$styleable;->SimpleDialog_di_radioButtonStyle:I

    if-ne v1, v7, :cond_40

    .line 101
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/app/SimpleDialog;->radioButtonStyle(I)Lcom/rey/material/app/SimpleDialog;

    goto :goto_27

    .line 102
    :cond_40
    sget v7, Lcom/rey/material/R$styleable;->SimpleDialog_di_checkBoxStyle:I

    if-ne v1, v7, :cond_4c

    .line 103
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/app/SimpleDialog;->checkBoxStyle(I)Lcom/rey/material/app/SimpleDialog;

    goto :goto_27

    .line 104
    :cond_4c
    sget v7, Lcom/rey/material/R$styleable;->SimpleDialog_di_itemHeight:I

    if-ne v1, v7, :cond_58

    .line 105
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/app/SimpleDialog;->itemHeight(I)Lcom/rey/material/app/SimpleDialog;

    goto :goto_27

    .line 106
    :cond_58
    sget v7, Lcom/rey/material/R$styleable;->SimpleDialog_di_itemTextAppearance:I

    if-ne v1, v7, :cond_27

    .line 107
    invoke-virtual {v0, v1, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/rey/material/app/SimpleDialog;->itemTextAppearance(I)Lcom/rey/material/app/SimpleDialog;

    goto :goto_27

    .line 110
    .end local v1    # "attr":I
    :cond_64
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 112
    if-eqz v4, :cond_6c

    .line 113
    invoke-virtual {p0, v4}, Lcom/rey/material/app/SimpleDialog;->messageTextAppearance(I)Lcom/rey/material/app/SimpleDialog;

    .line 115
    :cond_6c
    if-eqz v6, :cond_6

    .line 116
    invoke-virtual {p0, v5}, Lcom/rey/material/app/SimpleDialog;->messageTextColor(I)Lcom/rey/material/app/SimpleDialog;

    goto :goto_6
.end method

.method public checkBoxStyle(I)Lcom/rey/material/app/SimpleDialog;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 248
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mCheckBoxStyle:I

    if-eq v0, p1, :cond_14

    .line 249
    iput p1, p0, Lcom/rey/material/app/SimpleDialog;->mCheckBoxStyle:I

    .line 250
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    if-eqz v0, :cond_14

    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_14

    .line 251
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->notifyDataSetChanged()V

    .line 253
    :cond_14
    return-object p0
.end method

.method public clearContent()Lcom/rey/material/app/Dialog;
    .registers 2

    .prologue
    .line 123
    invoke-super {p0}, Lcom/rey/material/app/Dialog;->clearContent()Lcom/rey/material/app/Dialog;

    .line 124
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/app/SimpleDialog;->mMode:I

    .line 125
    return-object p0
.end method

.method public contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    if-nez v0, :cond_7

    .line 138
    invoke-direct {p0}, Lcom/rey/material/app/SimpleDialog;->initScrollView()V

    .line 140
    :cond_7
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eq v0, p1, :cond_24

    if-eqz p1, :cond_24

    .line 141
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->removeAllViews()V

    .line 142
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->addView(Landroid/view/View;)V

    .line 143
    const/4 v0, 0x4

    iput v0, p0, Lcom/rey/material/app/SimpleDialog;->mMode:I

    .line 144
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    invoke-super {p0, v0}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 147
    :cond_24
    return-object p0
.end method

.method public getSelectedIndex()I
    .registers 2

    .prologue
    .line 360
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    if-nez v0, :cond_6

    const/4 v0, -0x1

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->getLastSelectedIndex()I

    move-result v0

    goto :goto_5
.end method

.method public getSelectedIndexes()[I
    .registers 2

    .prologue
    .line 346
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->getSelectedIndexes()[I

    move-result-object v0

    goto :goto_5
.end method

.method public getSelectedValue()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 367
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->getLastSelectedValue()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getSelectedValues()[Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 353
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->getSelectedValues()[Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public itemHeight(I)Lcom/rey/material/app/SimpleDialog;
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 262
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mItemHeight:I

    if-eq v0, p1, :cond_f

    .line 263
    iput p1, p0, Lcom/rey/material/app/SimpleDialog;->mItemHeight:I

    .line 264
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    if-eqz v0, :cond_f

    .line 265
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->notifyDataSetChanged()V

    .line 267
    :cond_f
    return-object p0
.end method

.method public itemTextAppearance(I)Lcom/rey/material/app/SimpleDialog;
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 276
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mItemTextAppearance:I

    if-eq v0, p1, :cond_f

    .line 277
    iput p1, p0, Lcom/rey/material/app/SimpleDialog;->mItemTextAppearance:I

    .line 278
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    if-eqz v0, :cond_f

    .line 279
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->notifyDataSetChanged()V

    .line 281
    :cond_f
    return-object p0
.end method

.method public items([Ljava/lang/CharSequence;I)Lcom/rey/material/app/SimpleDialog;
    .registers 6
    .param p1, "items"    # [Ljava/lang/CharSequence;
    .param p2, "selectedIndex"    # I

    .prologue
    .line 307
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    if-nez v0, :cond_7

    .line 308
    invoke-direct {p0}, Lcom/rey/material/app/SimpleDialog;->initListView()V

    .line 310
    :cond_7
    const/4 v0, 0x2

    iput v0, p0, Lcom/rey/material/app/SimpleDialog;->mMode:I

    .line 311
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p2, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->setItems([Ljava/lang/CharSequence;[I)V

    .line 312
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-super {p0, v0}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 313
    return-object p0
.end method

.method public message(I)Lcom/rey/material/app/SimpleDialog;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 197
    if-nez p1, :cond_8

    const/4 v0, 0x0

    :goto_3
    invoke-virtual {p0, v0}, Lcom/rey/material/app/SimpleDialog;->message(Ljava/lang/CharSequence;)Lcom/rey/material/app/SimpleDialog;

    move-result-object v0

    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public message(Ljava/lang/CharSequence;)Lcom/rey/material/app/SimpleDialog;
    .registers 4
    .param p1, "message"    # Ljava/lang/CharSequence;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    if-nez v0, :cond_7

    .line 173
    invoke-direct {p0}, Lcom/rey/material/app/SimpleDialog;->initScrollView()V

    .line 175
    :cond_7
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    if-nez v0, :cond_e

    .line 176
    invoke-direct {p0}, Lcom/rey/material/app/SimpleDialog;->initMessageView()V

    .line 178
    :cond_e
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    if-eq v0, v1, :cond_25

    .line 179
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->removeAllViews()V

    .line 180
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, v1}, Lcom/rey/material/app/SimpleDialog$InternalScrollView;->addView(Landroid/view/View;)V

    .line 183
    :cond_25
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 185
    const/4 v0, 0x1

    iput v0, p0, Lcom/rey/material/app/SimpleDialog;->mMode:I

    .line 186
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mScrollView:Lcom/rey/material/app/SimpleDialog$InternalScrollView;

    invoke-super {p0, v0}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 188
    :cond_38
    return-object p0
.end method

.method public messageTextAppearance(I)Lcom/rey/material/app/SimpleDialog;
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 206
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessageTextAppearanceId:I

    if-eq v0, p1, :cond_15

    .line 207
    iput p1, p0, Lcom/rey/material/app/SimpleDialog;->mMessageTextAppearanceId:I

    .line 208
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    if-eqz v0, :cond_15

    .line 209
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/app/SimpleDialog;->mMessageTextAppearanceId:I

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 211
    :cond_15
    return-object p0
.end method

.method public messageTextColor(I)Lcom/rey/material/app/SimpleDialog;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 220
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessageTextColor:I

    if-eq v0, p1, :cond_f

    .line 221
    iput p1, p0, Lcom/rey/material/app/SimpleDialog;->mMessageTextColor:I

    .line 222
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    if-eqz v0, :cond_f

    .line 223
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mMessage:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setTextColor(I)V

    .line 225
    :cond_f
    return-object p0
.end method

.method public varargs multiChoiceItems([Ljava/lang/CharSequence;[I)Lcom/rey/material/app/SimpleDialog;
    .registers 4
    .param p1, "items"    # [Ljava/lang/CharSequence;
    .param p2, "selectedIndexes"    # [I

    .prologue
    .line 323
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    if-nez v0, :cond_7

    .line 324
    invoke-direct {p0}, Lcom/rey/material/app/SimpleDialog;->initListView()V

    .line 326
    :cond_7
    const/4 v0, 0x3

    iput v0, p0, Lcom/rey/material/app/SimpleDialog;->mMode:I

    .line 327
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->setItems([Ljava/lang/CharSequence;[I)V

    .line 328
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;

    invoke-super {p0, v0}, Lcom/rey/material/app/Dialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/Dialog;

    .line 329
    return-object p0
.end method

.method protected onCreate()V
    .registers 2

    .prologue
    .line 74
    sget v0, Lcom/rey/material/R$style;->TextAppearance_AppCompat_Body1:I

    invoke-virtual {p0, v0}, Lcom/rey/material/app/SimpleDialog;->messageTextAppearance(I)Lcom/rey/material/app/SimpleDialog;

    .line 75
    const/4 v0, -0x2

    invoke-virtual {p0, v0}, Lcom/rey/material/app/SimpleDialog;->itemHeight(I)Lcom/rey/material/app/SimpleDialog;

    .line 76
    sget v0, Lcom/rey/material/R$style;->TextAppearance_AppCompat_Body1:I

    invoke-virtual {p0, v0}, Lcom/rey/material/app/SimpleDialog;->itemTextAppearance(I)Lcom/rey/material/app/SimpleDialog;

    .line 77
    return-void
.end method

.method public onSelectionChangedListener(Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;)Lcom/rey/material/app/SimpleDialog;
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;

    .prologue
    .line 338
    iput-object p1, p0, Lcom/rey/material/app/SimpleDialog;->mOnSelectionChangedListener:Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;

    .line 339
    return-object p0
.end method

.method public radioButtonStyle(I)Lcom/rey/material/app/SimpleDialog;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 234
    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mRadioButtonStyle:I

    if-eq v0, p1, :cond_14

    .line 235
    iput p1, p0, Lcom/rey/material/app/SimpleDialog;->mRadioButtonStyle:I

    .line 236
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    if-eqz v0, :cond_14

    iget v0, p0, Lcom/rey/material/app/SimpleDialog;->mMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_14

    .line 237
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog;->mAdapter:Lcom/rey/material/app/SimpleDialog$InternalAdapter;

    invoke-virtual {v0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->notifyDataSetChanged()V

    .line 239
    :cond_14
    return-object p0
.end method

.method public title(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;
    .registers 7
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v1, 0x0

    .line 130
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_17

    const/4 v0, 0x1

    .line 131
    .local v0, "titleVisible":Z
    :goto_8
    iget v3, p0, Lcom/rey/material/app/SimpleDialog;->mContentPadding:I

    if-eqz v0, :cond_19

    move v2, v1

    :goto_d
    iget v4, p0, Lcom/rey/material/app/SimpleDialog;->mContentPadding:I

    invoke-virtual {p0, v3, v2, v4, v1}, Lcom/rey/material/app/SimpleDialog;->contentMargin(IIII)Lcom/rey/material/app/Dialog;

    .line 132
    invoke-super {p0, p1}, Lcom/rey/material/app/Dialog;->title(Ljava/lang/CharSequence;)Lcom/rey/material/app/Dialog;

    move-result-object v1

    return-object v1

    .end local v0    # "titleVisible":Z
    :cond_17
    move v0, v1

    .line 130
    goto :goto_8

    .line 131
    .restart local v0    # "titleVisible":Z
    :cond_19
    iget v2, p0, Lcom/rey/material/app/SimpleDialog;->mContentPadding:I

    goto :goto_d
.end method
