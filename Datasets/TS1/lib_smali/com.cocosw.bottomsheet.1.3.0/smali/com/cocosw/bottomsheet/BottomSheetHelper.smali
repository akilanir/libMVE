.class public Lcom/cocosw/bottomsheet/BottomSheetHelper;
.super Ljava/lang/Object;
.source "BottomSheetHelper.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static shareAction(Landroid/app/Activity;Landroid/content/Intent;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    .registers 8
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 37
    new-instance v4, Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    invoke-direct {v4, p0}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v4}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->grid()Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    move-result-object v0

    .line 38
    .local v0, "builder":Lcom/cocosw/bottomsheet/BottomSheet$Builder;
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 40
    .local v3, "pm":Landroid/content/pm/PackageManager;
    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    .line 42
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_33

    .line 43
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    invoke-virtual {v4, v3}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    invoke-virtual {v4, v3}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v1, v5, v4}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->sheet(ILandroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .line 42
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 46
    :cond_33
    new-instance v4, Lcom/cocosw/bottomsheet/BottomSheetHelper$1;

    invoke-direct {v4, v2, p1, p0}, Lcom/cocosw/bottomsheet/BottomSheetHelper$1;-><init>(Ljava/util/List;Landroid/content/Intent;Landroid/app/Activity;)V

    invoke-virtual {v0, v4}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->listener(Landroid/content/DialogInterface$OnClickListener;)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .line 59
    sget v4, Lcom/cocosw/bottomsheet/R$integer;->bs_initial_grid_row:I

    invoke-virtual {v0, v4}, Lcom/cocosw/bottomsheet/BottomSheet$Builder;->limit(I)Lcom/cocosw/bottomsheet/BottomSheet$Builder;

    .line 60
    return-object v0
.end method
