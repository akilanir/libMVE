.class public Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;
.super Landroid/widget/ArrayAdapter;
.source "MaterialSimpleListAdapter.java"

# interfaces
.implements Lcom/afollestad/materialdialogs/internal/MDAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;",
        ">;",
        "Lcom/afollestad/materialdialogs/internal/MDAdapter;"
    }
.end annotation


# instance fields
.field private dialog:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    sget v0, Lcom/afollestad/materialdialogs/commons/R$layout;->md_simplelist_item:I

    const v1, 0x1020016

    invoke-direct {p0, p1, v0, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II)V

    .line 27
    return-void
.end method


# virtual methods
.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 41
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 12
    .param p1, "index"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 46
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 47
    .local v3, "view":Landroid/view/View;
    iget-object v4, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    if-eqz v4, :cond_70

    .line 48
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;

    .line 49
    .local v1, "item":Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
    const v4, 0x1020006

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 50
    .local v0, "ic":Landroid/widget/ImageView;
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_71

    .line 51
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 52
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getIconPadding()I

    move-result v4

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getIconPadding()I

    move-result v5

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getIconPadding()I

    move-result v6

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getIconPadding()I

    move-result v7

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 54
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getBackgroundColor()I

    move-result v5

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 59
    :goto_44
    const v4, 0x1020016

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 60
    .local v2, "tv":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v4}, Lcom/afollestad/materialdialogs/MaterialDialog;->getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getItemColor()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    invoke-virtual {v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;->getContent()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    iget-object v4, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getRegularFont()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 64
    .end local v0    # "ic":Landroid/widget/ImageView;
    .end local v1    # "item":Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
    .end local v2    # "tv":Landroid/widget/TextView;
    :cond_70
    return-object v3

    .line 57
    .restart local v0    # "ic":Landroid/widget/ImageView;
    .restart local v1    # "item":Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
    :cond_71
    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_44
.end method

.method public hasStableIds()Z
    .registers 2

    .prologue
    .line 36
    const/4 v0, 0x1

    return v0
.end method

.method public setDialog(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 32
    return-void
.end method
