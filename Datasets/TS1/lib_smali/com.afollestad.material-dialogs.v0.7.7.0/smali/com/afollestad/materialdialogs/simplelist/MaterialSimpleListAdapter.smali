.class public Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;
.super Landroid/widget/ArrayAdapter;
.source "MaterialSimpleListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;",
        ">;"
    }
.end annotation


# instance fields
.field private dialog:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    sget v0, Lcom/afollestad/materialdialogs/R$layout;->md_simplelist_item:I

    const v1, 0x1020016

    invoke-direct {p0, p1, v0, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II)V

    .line 39
    return-void
.end method

.method private isRTL()Z
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 106
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-ge v3, v4, :cond_9

    .line 109
    :goto_8
    return v2

    .line 108
    :cond_9
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 109
    .local v0, "config":Landroid/content/res/Configuration;
    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v3

    if-ne v3, v1, :cond_1d

    :goto_1b
    move v2, v1

    goto :goto_8

    :cond_1d
    move v1, v2

    goto :goto_1b
.end method

.method private setupGravity(Landroid/view/ViewGroup;)V
    .registers 11
    .param p1, "view"    # Landroid/view/ViewGroup;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 72
    move-object v3, p1

    check-cast v3, Landroid/widget/LinearLayout;

    .line 73
    .local v3, "itemRoot":Landroid/widget/LinearLayout;
    iget-object v5, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getItemsGravity()Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v1

    .line 74
    .local v1, "gravity":Lcom/afollestad/materialdialogs/GravityEnum;
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/GravityEnum;->getGravityInt()I

    move-result v2

    .line 75
    .local v2, "gravityInt":I
    or-int/lit8 v5, v2, 0x10

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 77
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_66

    .line 78
    iget-object v5, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getItemsGravity()Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v5

    sget-object v6, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    if-ne v5, v6, :cond_67

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->isRTL()Z

    move-result v5

    if-nez v5, :cond_67

    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    instance-of v5, v5, Landroid/widget/ImageView;

    if-eqz v5, :cond_67

    .line 79
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    .line 80
    .local v0, "first":Landroid/widget/CompoundButton;
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 82
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 83
    .local v4, "second":Landroid/widget/TextView;
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 84
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v5

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v6

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v7

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 87
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 88
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 102
    .end local v0    # "first":Landroid/widget/CompoundButton;
    .end local v4    # "second":Landroid/widget/TextView;
    :cond_66
    :goto_66
    return-void

    .line 89
    :cond_67
    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    if-ne v1, v5, :cond_66

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->isRTL()Z

    move-result v5

    if-eqz v5, :cond_66

    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    instance-of v5, v5, Landroid/widget/ImageView;

    if-eqz v5, :cond_66

    .line 90
    invoke-virtual {p1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    .line 91
    .restart local v0    # "first":Landroid/widget/CompoundButton;
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 93
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 94
    .restart local v4    # "second":Landroid/widget/TextView;
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 95
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v5

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v6

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v7

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 98
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 99
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_66
.end method


# virtual methods
.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 48
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 10
    .param p1, "index"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 53
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 54
    .local v3, "view":Landroid/view/View;
    iget-object v4, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v4, :cond_56

    .line 55
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;

    .line 56
    .local v1, "item":Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
    const v4, 0x1020006

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 57
    .local v0, "ic":Landroid/widget/ImageView;
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_57

    .line 58
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 61
    :goto_24
    const v4, 0x1020016

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 62
    .local v2, "tv":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v4}, Lcom/afollestad/materialdialogs/MaterialDialog;->getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getItemColor()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getContent()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    iget-object v4, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getRegularFont()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    move-object v4, v3

    .line 65
    check-cast v4, Landroid/view/ViewGroup;

    invoke-direct {p0, v4}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->setupGravity(Landroid/view/ViewGroup;)V

    .line 67
    .end local v0    # "ic":Landroid/widget/ImageView;
    .end local v1    # "item":Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
    .end local v2    # "tv":Landroid/widget/TextView;
    :cond_56
    return-object v3

    .line 60
    .restart local v0    # "ic":Landroid/widget/ImageView;
    .restart local v1    # "item":Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
    :cond_57
    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_24
.end method

.method public hasStableIds()Z
    .registers 2

    .prologue
    .line 43
    const/4 v0, 0x1

    return v0
.end method

.method public setDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 3
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 28
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->setDialog(Lcom/afollestad/materialdialogs/MaterialDialog;Z)V

    .line 29
    return-void
.end method

.method public setDialog(Lcom/afollestad/materialdialogs/MaterialDialog;Z)V
    .registers 3
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .param p2, "notifyDataSetChanged"    # Z

    .prologue
    .line 32
    iput-object p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 33
    if-eqz p2, :cond_7

    .line 34
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->notifyDataSetChanged()V

    .line 35
    :cond_7
    return-void
.end method
