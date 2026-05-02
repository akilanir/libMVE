.class Lcom/cocosw/bottomsheet/ActionMenu;
.super Ljava/lang/Object;
.source "ActionMenu.java"

# interfaces
.implements Landroid/support/v4/internal/view/SupportMenu;


# static fields
.field private static final sCategoryToOrder:[I


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIsQwerty:Z

.field private mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cocosw/bottomsheet/ActionMenuItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 34
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/cocosw/bottomsheet/ActionMenu;->sCategoryToOrder:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x1
        0x4
        0x5
        0x3
        0x2
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mContext:Landroid/content/Context;

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 49
    return-void
.end method

.method private static findInsertIndex(Ljava/util/ArrayList;I)I
    .registers 5
    .param p1, "ordering"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cocosw/bottomsheet/ActionMenuItem;",
            ">;I)I"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_1a

    .line 53
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cocosw/bottomsheet/ActionMenuItem;

    .line 54
    .local v1, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getOrder()I

    move-result v2

    if-gt v2, p1, :cond_17

    .line 55
    add-int/lit8 v2, v0, 0x1

    .line 58
    .end local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :goto_16
    return v2

    .line 52
    .restart local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 58
    .end local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :cond_1a
    const/4 v2, 0x0

    goto :goto_16
.end method

.method private findItemIndex(I)I
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 169
    iget-object v2, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 170
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 171
    .local v1, "itemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_19

    .line 172
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cocosw/bottomsheet/ActionMenuItem;

    invoke-virtual {v3}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getItemId()I

    move-result v3

    if-ne v3, p1, :cond_16

    .line 176
    .end local v0    # "i":I
    :goto_15
    return v0

    .line 171
    .restart local v0    # "i":I
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 176
    :cond_19
    const/4 v0, -0x1

    goto :goto_15
.end method

.method private findItemWithShortcut(ILandroid/view/KeyEvent;)Lcom/cocosw/bottomsheet/ActionMenuItem;
    .registers 9
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 207
    iget-boolean v4, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mIsQwerty:Z

    .line 208
    .local v4, "qwerty":Z
    iget-object v3, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 209
    .local v3, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 211
    .local v2, "itemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    if-ge v0, v2, :cond_22

    .line 212
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cocosw/bottomsheet/ActionMenuItem;

    .line 213
    .local v1, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    if-eqz v4, :cond_1a

    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getAlphabeticShortcut()C

    move-result v5

    .line 215
    .local v5, "shortcut":C
    :goto_17
    if-ne p1, v5, :cond_1f

    .line 219
    .end local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    .end local v5    # "shortcut":C
    :goto_19
    return-object v1

    .line 213
    .restart local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :cond_1a
    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getNumericShortcut()C

    move-result v5

    goto :goto_17

    .line 211
    .restart local v5    # "shortcut":C
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 219
    .end local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    .end local v5    # "shortcut":C
    :cond_22
    const/4 v1, 0x0

    goto :goto_19
.end method

.method private static getOrdering(I)I
    .registers 4
    .param p0, "categoryOrder"    # I

    .prologue
    .line 73
    const/high16 v1, -0x10000

    and-int/2addr v1, p0

    shr-int/lit8 v0, v1, 0x10

    .line 75
    .local v0, "index":I
    if-ltz v0, :cond_c

    sget-object v1, Lcom/cocosw/bottomsheet/ActionMenu;->sCategoryToOrder:[I

    array-length v1, v1

    if-lt v0, v1, :cond_14

    .line 76
    :cond_c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "order does not contain a valid category."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_14
    sget-object v1, Lcom/cocosw/bottomsheet/ActionMenu;->sCategoryToOrder:[I

    aget v1, v1, v0

    shl-int/lit8 v1, v1, 0x10

    const v2, 0xffff

    and-int/2addr v2, p0

    or-int/2addr v1, v2

    return v1
.end method


# virtual methods
.method public add(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "titleRes"    # I

    .prologue
    const/4 v0, 0x0

    .line 91
    invoke-virtual {p0, v0, v0, v0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public add(IIII)Landroid/view/MenuItem;
    .registers 6
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "titleRes"    # I

    .prologue
    .line 95
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/cocosw/bottomsheet/ActionMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 12
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 99
    new-instance v0, Lcom/cocosw/bottomsheet/ActionMenuItem;

    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/ActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v4, 0x0

    move v2, p1

    move v3, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/cocosw/bottomsheet/ActionMenuItem;-><init>(Landroid/content/Context;IIIILjava/lang/CharSequence;)V

    .line 101
    .local v0, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    iget-object v1, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-static {p3}, Lcom/cocosw/bottomsheet/ActionMenu;->getOrdering(I)I

    move-result v3

    invoke-static {v2, v3}, Lcom/cocosw/bottomsheet/ActionMenu;->findInsertIndex(Ljava/util/ArrayList;I)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 102
    return-object v0
.end method

.method add(Lcom/cocosw/bottomsheet/ActionMenuItem;)Landroid/view/MenuItem;
    .registers 5
    .param p1, "item"    # Lcom/cocosw/bottomsheet/ActionMenuItem;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getOrder()I

    move-result v2

    invoke-static {v2}, Lcom/cocosw/bottomsheet/ActionMenu;->getOrdering(I)I

    move-result v2

    invoke-static {v1, v2}, Lcom/cocosw/bottomsheet/ActionMenu;->findInsertIndex(Ljava/util/ArrayList;I)I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 107
    return-object p1
.end method

.method public add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v0, 0x0

    .line 87
    invoke-virtual {p0, v0, v0, v0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public addIntentOptions(IIILandroid/content/ComponentName;[Landroid/content/Intent;Landroid/content/Intent;I[Landroid/view/MenuItem;)I
    .registers 22
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "caller"    # Landroid/content/ComponentName;
    .param p5, "specifics"    # [Landroid/content/Intent;
    .param p6, "intent"    # Landroid/content/Intent;
    .param p7, "flags"    # I
    .param p8, "outSpecificItems"    # [Landroid/view/MenuItem;

    .prologue
    .line 113
    iget-object v10, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 114
    .local v7, "pm":Landroid/content/pm/PackageManager;
    const/4 v10, 0x0

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    invoke-virtual {v7, v0, v1, v2, v10}, Landroid/content/pm/PackageManager;->queryIntentActivityOptions(Landroid/content/ComponentName;[Landroid/content/Intent;Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v6

    .line 116
    .local v6, "lri":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v6, :cond_67

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v3

    .line 118
    .local v3, "N":I
    :goto_17
    and-int/lit8 v10, p7, 0x1

    if-nez v10, :cond_1e

    .line 119
    invoke-virtual {p0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;->removeGroup(I)V

    .line 122
    :cond_1e
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1f
    if-ge v4, v3, :cond_6e

    .line 123
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/pm/ResolveInfo;

    .line 124
    .local v8, "ri":Landroid/content/pm/ResolveInfo;
    new-instance v9, Landroid/content/Intent;

    iget v10, v8, Landroid/content/pm/ResolveInfo;->specificIndex:I

    if-gez v10, :cond_69

    move-object/from16 v10, p6

    :goto_2f
    invoke-direct {v9, v10}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 126
    .local v9, "rintent":Landroid/content/Intent;
    new-instance v10, Landroid/content/ComponentName;

    iget-object v11, v8, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v11, v11, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v11, v11, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object v12, v8, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v12, v12, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v10, v11, v12}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 129
    invoke-virtual {v8, v7}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v10

    move/from16 v0, p3

    invoke-virtual {p0, p1, p2, v0, v10}, Lcom/cocosw/bottomsheet/ActionMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v10

    invoke-virtual {v8, v7}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-interface {v10, v11}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    move-result-object v10

    invoke-interface {v10, v9}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    move-result-object v5

    .line 132
    .local v5, "item":Landroid/view/MenuItem;
    if-eqz p8, :cond_64

    iget v10, v8, Landroid/content/pm/ResolveInfo;->specificIndex:I

    if-ltz v10, :cond_64

    .line 133
    iget v10, v8, Landroid/content/pm/ResolveInfo;->specificIndex:I

    aput-object v5, p8, v10

    .line 122
    :cond_64
    add-int/lit8 v4, v4, 0x1

    goto :goto_1f

    .line 116
    .end local v3    # "N":I
    .end local v4    # "i":I
    .end local v5    # "item":Landroid/view/MenuItem;
    .end local v8    # "ri":Landroid/content/pm/ResolveInfo;
    .end local v9    # "rintent":Landroid/content/Intent;
    :cond_67
    const/4 v3, 0x0

    goto :goto_17

    .line 124
    .restart local v3    # "N":I
    .restart local v4    # "i":I
    .restart local v8    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_69
    iget v10, v8, Landroid/content/pm/ResolveInfo;->specificIndex:I

    aget-object v10, p5, v10

    goto :goto_2f

    .line 137
    .end local v8    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_6e
    return v3
.end method

.method public addSubMenu(I)Landroid/view/SubMenu;
    .registers 3
    .param p1, "titleRes"    # I

    .prologue
    .line 147
    const/4 v0, 0x0

    return-object v0
.end method

.method public addSubMenu(IIII)Landroid/view/SubMenu;
    .registers 6
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "titleRes"    # I

    .prologue
    .line 158
    const/4 v0, 0x0

    return-object v0
.end method

.method public addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 6
    .param p1, "groupId"    # I
    .param p2, "itemId"    # I
    .param p3, "order"    # I
    .param p4, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 153
    const/4 v0, 0x0

    return-object v0
.end method

.method public addSubMenu(Ljava/lang/CharSequence;)Landroid/view/SubMenu;
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 142
    const/4 v0, 0x0

    return-object v0
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 163
    return-void
.end method

.method clone(I)Lcom/cocosw/bottomsheet/ActionMenu;
    .registers 6
    .param p1, "size"    # I

    .prologue
    .line 314
    new-instance v0, Lcom/cocosw/bottomsheet/ActionMenu;

    invoke-virtual {p0}, Lcom/cocosw/bottomsheet/ActionMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/cocosw/bottomsheet/ActionMenu;-><init>(Landroid/content/Context;)V

    .line 315
    .local v0, "out":Lcom/cocosw/bottomsheet/ActionMenu;
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, p1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 316
    return-object v0
.end method

.method public close()V
    .registers 1

    .prologue
    .line 166
    return-void
.end method

.method public findItem(I)Landroid/view/MenuItem;
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 180
    invoke-direct {p0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;->findItemIndex(I)I

    move-result v0

    .line 181
    .local v0, "index":I
    if-gez v0, :cond_8

    .line 182
    const/4 v1, 0x0

    .line 185
    :goto_7
    return-object v1

    :cond_8
    iget-object v1, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/MenuItem;

    goto :goto_7
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getItem(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 189
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    return-object v0
.end method

.method public hasVisibleItems()Z
    .registers 5

    .prologue
    .line 193
    iget-object v2, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 194
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 196
    .local v1, "itemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1a

    .line 197
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cocosw/bottomsheet/ActionMenuItem;

    invoke-virtual {v3}, Lcom/cocosw/bottomsheet/ActionMenuItem;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_17

    .line 198
    const/4 v3, 0x1

    .line 202
    :goto_16
    return v3

    .line 196
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 202
    :cond_1a
    const/4 v3, 0x0

    goto :goto_16
.end method

.method public isShortcutKey(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 223
    invoke-direct {p0, p1, p2}, Lcom/cocosw/bottomsheet/ActionMenu;->findItemWithShortcut(ILandroid/view/KeyEvent;)Lcom/cocosw/bottomsheet/ActionMenuItem;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public performIdentifierAction(II)Z
    .registers 5
    .param p1, "id"    # I
    .param p2, "flags"    # I

    .prologue
    .line 227
    invoke-direct {p0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;->findItemIndex(I)I

    move-result v0

    .line 228
    .local v0, "index":I
    if-gez v0, :cond_8

    .line 229
    const/4 v1, 0x0

    .line 232
    :goto_7
    return v1

    :cond_8
    iget-object v1, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cocosw/bottomsheet/ActionMenuItem;

    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->invoke()Z

    move-result v1

    goto :goto_7
.end method

.method public performShortcut(ILandroid/view/KeyEvent;I)Z
    .registers 6
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;
    .param p3, "flags"    # I

    .prologue
    .line 236
    invoke-direct {p0, p1, p2}, Lcom/cocosw/bottomsheet/ActionMenu;->findItemWithShortcut(ILandroid/view/KeyEvent;)Lcom/cocosw/bottomsheet/ActionMenuItem;

    move-result-object v0

    .line 237
    .local v0, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    if-nez v0, :cond_8

    .line 238
    const/4 v1, 0x0

    .line 241
    :goto_7
    return v1

    :cond_8
    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/ActionMenuItem;->invoke()Z

    move-result v1

    goto :goto_7
.end method

.method public removeGroup(I)V
    .registers 6
    .param p1, "groupId"    # I

    .prologue
    .line 245
    iget-object v2, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 246
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 247
    .local v1, "itemCount":I
    const/4 v0, 0x0

    .line 248
    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_1e

    .line 249
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/cocosw/bottomsheet/ActionMenuItem;

    invoke-virtual {v3}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getGroupId()I

    move-result v3

    if-ne v3, p1, :cond_1b

    .line 250
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 251
    add-int/lit8 v1, v1, -0x1

    goto :goto_7

    .line 253
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 256
    :cond_1e
    return-void
.end method

.method removeInvisible()V
    .registers 4

    .prologue
    .line 320
    iget-object v2, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 321
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    :cond_6
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 322
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cocosw/bottomsheet/ActionMenuItem;

    .line 323
    .local v0, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    invoke-virtual {v0}, Lcom/cocosw/bottomsheet/ActionMenuItem;->isVisible()Z

    move-result v2

    if-nez v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_6

    .line 325
    .end local v0    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :cond_1c
    return-void
.end method

.method public removeItem(I)V
    .registers 4
    .param p1, "id"    # I

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lcom/cocosw/bottomsheet/ActionMenu;->findItemIndex(I)I

    move-result v0

    .line 260
    .local v0, "index":I
    if-gez v0, :cond_7

    .line 265
    :goto_6
    return-void

    .line 264
    :cond_7
    iget-object v1, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_6
.end method

.method public setGroupCheckable(IZZ)V
    .registers 9
    .param p1, "group"    # I
    .param p2, "checkable"    # Z
    .param p3, "exclusive"    # Z

    .prologue
    .line 269
    iget-object v3, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 270
    .local v3, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 272
    .local v2, "itemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v2, :cond_1e

    .line 273
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cocosw/bottomsheet/ActionMenuItem;

    .line 274
    .local v1, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getGroupId()I

    move-result v4

    if-ne v4, p1, :cond_1b

    .line 275
    invoke-virtual {v1, p2}, Lcom/cocosw/bottomsheet/ActionMenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 276
    invoke-virtual {v1, p3}, Lcom/cocosw/bottomsheet/ActionMenuItem;->setExclusiveCheckable(Z)Lcom/cocosw/bottomsheet/ActionMenuItem;

    .line 272
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 279
    .end local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :cond_1e
    return-void
.end method

.method public setGroupEnabled(IZ)V
    .registers 8
    .param p1, "group"    # I
    .param p2, "enabled"    # Z

    .prologue
    .line 282
    iget-object v3, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 283
    .local v3, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 285
    .local v2, "itemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v2, :cond_1b

    .line 286
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cocosw/bottomsheet/ActionMenuItem;

    .line 287
    .local v1, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getGroupId()I

    move-result v4

    if-ne v4, p1, :cond_18

    .line 288
    invoke-virtual {v1, p2}, Lcom/cocosw/bottomsheet/ActionMenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 285
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 291
    .end local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :cond_1b
    return-void
.end method

.method public setGroupVisible(IZ)V
    .registers 8
    .param p1, "group"    # I
    .param p2, "visible"    # Z

    .prologue
    .line 294
    iget-object v3, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    .line 295
    .local v3, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/cocosw/bottomsheet/ActionMenuItem;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 297
    .local v2, "itemCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v2, :cond_1b

    .line 298
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cocosw/bottomsheet/ActionMenuItem;

    .line 299
    .local v1, "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    invoke-virtual {v1}, Lcom/cocosw/bottomsheet/ActionMenuItem;->getGroupId()I

    move-result v4

    if-ne v4, p1, :cond_18

    .line 300
    invoke-virtual {v1, p2}, Lcom/cocosw/bottomsheet/ActionMenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 297
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 303
    .end local v1    # "item":Lcom/cocosw/bottomsheet/ActionMenuItem;
    :cond_1b
    return-void
.end method

.method public setQwertyMode(Z)V
    .registers 2
    .param p1, "isQwerty"    # Z

    .prologue
    .line 306
    iput-boolean p1, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mIsQwerty:Z

    .line 307
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lcom/cocosw/bottomsheet/ActionMenu;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
