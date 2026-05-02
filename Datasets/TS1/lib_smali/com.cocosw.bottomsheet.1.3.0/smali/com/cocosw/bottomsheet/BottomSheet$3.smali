.class Lcom/cocosw/bottomsheet/BottomSheet$3;
.super Landroid/widget/BaseAdapter;
.source "BottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/BottomSheet;->init(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cocosw/bottomsheet/BottomSheet;


# direct methods
.method constructor <init>(Lcom/cocosw/bottomsheet/BottomSheet;)V
    .registers 2

    .prologue
    .line 238
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 309
    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .prologue
    .line 267
    const/4 v0, 0x0

    return v0
.end method

.method public getCount()I
    .registers 3

    .prologue
    .line 242
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$1100(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/ActionMenu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/ActionMenu;->size()I

    move-result v0

    iget-object v1, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->hidden:Landroid/util/SparseIntArray;
    invoke-static {v1}, Lcom/cocosw/bottomsheet/BottomSheet;->access$1200(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/util/SparseIntArray;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/SparseIntArray;->size()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getItem(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 247
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->actions:Lcom/cocosw/bottomsheet/ActionMenu;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet;->access$1100(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/ActionMenu;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 238
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/BottomSheet$3;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 252
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v6, 0x0

    .line 273
    if-nez p2, :cond_6e

    .line 274
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    invoke-virtual {v4}, Lcom/cocosw/bottomsheet/BottomSheet;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "layout_inflater"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater;

    .line 276
    .local v2, "inflater":Landroid/view/LayoutInflater;
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->builder:Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-static {v4}, Lcom/cocosw/bottomsheet/BottomSheet;->access$400(Lcom/cocosw/bottomsheet/BottomSheet;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    move-result-object v4

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$Builder;->grid:Z
    invoke-static {v4}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->access$800(Lcom/cocosw/bottomsheet/BottomSheet$Builder;)Z

    move-result v4

    if-eqz v4, :cond_63

    .line 277
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->mGridItemLayoutId:I
    invoke-static {v4}, Lcom/cocosw/bottomsheet/BottomSheet;->access$1300(Lcom/cocosw/bottomsheet/BottomSheet;)I

    move-result v4

    invoke-virtual {v2, v4, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 280
    :goto_27
    new-instance v0, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;

    invoke-direct {v0, p0}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;-><init>(Lcom/cocosw/bottomsheet/BottomSheet$3;)V

    .line 281
    .local v0, "holder":Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;
    sget v4, Lcom/cocosw/bottomsheet/R$id;->bs_list_title:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    # setter for: Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->title:Landroid/widget/TextView;
    invoke-static {v0, v4}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->access$1502(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 282
    sget v4, Lcom/cocosw/bottomsheet/R$id;->bs_list_image:I

    invoke-virtual {p2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    # setter for: Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->image:Landroid/widget/ImageView;
    invoke-static {v0, v4}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->access$1602(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;Landroid/widget/ImageView;)Landroid/widget/ImageView;

    .line 283
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 288
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :goto_45
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_46
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->hidden:Landroid/util/SparseIntArray;
    invoke-static {v4}, Lcom/cocosw/bottomsheet/BottomSheet;->access$1200(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/util/SparseIntArray;

    move-result-object v4

    invoke-virtual {v4}, Landroid/util/SparseIntArray;->size()I

    move-result v4

    if-ge v1, v4, :cond_75

    .line 289
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->hidden:Landroid/util/SparseIntArray;
    invoke-static {v4}, Lcom/cocosw/bottomsheet/BottomSheet;->access$1200(Lcom/cocosw/bottomsheet/BottomSheet;)Landroid/util/SparseIntArray;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v4

    if-gt v4, p1, :cond_60

    .line 290
    add-int/lit8 p1, p1, 0x1

    .line 288
    :cond_60
    add-int/lit8 v1, v1, 0x1

    goto :goto_46

    .line 279
    .end local v0    # "holder":Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;
    .end local v1    # "i":I
    .restart local v2    # "inflater":Landroid/view/LayoutInflater;
    :cond_63
    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->mListItemLayoutId:I
    invoke-static {v4}, Lcom/cocosw/bottomsheet/BottomSheet;->access$1400(Lcom/cocosw/bottomsheet/BottomSheet;)I

    move-result v4

    invoke-virtual {v2, v4, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    goto :goto_27

    .line 285
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :cond_6e
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;

    .restart local v0    # "holder":Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;
    goto :goto_45

    .line 293
    .restart local v1    # "i":I
    :cond_75
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/BottomSheet$3;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    .line 295
    .local v3, "item":Landroid/view/MenuItem;
    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->title:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->access$1500(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-interface {v3}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 296
    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-nez v4, :cond_b4

    .line 297
    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->image:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->access$1600(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    iget-object v4, p0, Lcom/cocosw/bottomsheet/BottomSheet$3;->this$0:Lcom/cocosw/bottomsheet/BottomSheet;

    # getter for: Lcom/cocosw/bottomsheet/BottomSheet;->collapseListIcons:Z
    invoke-static {v4}, Lcom/cocosw/bottomsheet/BottomSheet;->access$1700(Lcom/cocosw/bottomsheet/BottomSheet;)Z

    move-result v4

    if-eqz v4, :cond_b2

    const/16 v4, 0x8

    :goto_98
    invoke-virtual {v5, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 303
    :goto_9b
    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->image:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->access$1600(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-interface {v3}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 304
    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->title:Landroid/widget/TextView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->access$1500(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-interface {v3}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 306
    return-object p2

    .line 297
    :cond_b2
    const/4 v4, 0x4

    goto :goto_98

    .line 299
    :cond_b4
    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->image:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->access$1600(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 300
    # getter for: Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->image:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->access$1600(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-interface {v3}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9b
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 257
    const/4 v0, 0x1

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 262
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/BottomSheet$3;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v0

    return v0
.end method
