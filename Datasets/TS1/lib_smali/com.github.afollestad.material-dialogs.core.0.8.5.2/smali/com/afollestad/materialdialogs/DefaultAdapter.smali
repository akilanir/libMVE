.class Lcom/afollestad/materialdialogs/DefaultAdapter;
.super Landroid/widget/BaseAdapter;
.source "DefaultAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/DefaultAdapter$1;
    }
.end annotation


# instance fields
.field private final dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

.field private final itemGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field private final layout:I
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/afollestad/materialdialogs/MaterialDialog;I)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .param p2, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 31
    iput p2, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->layout:I

    .line 32
    iget-object v0, p1, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->itemGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 33
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

    .line 142
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-ge v3, v4, :cond_9

    .line 145
    :goto_8
    return v2

    .line 144
    :cond_9
    iget-object v3, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v3}, Lcom/afollestad/materialdialogs/MaterialDialog;->getBuilder()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 145
    .local v0, "config":Landroid/content/res/Configuration;
    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v3

    if-ne v3, v1, :cond_23

    :goto_21
    move v2, v1

    goto :goto_8

    :cond_23
    move v1, v2

    goto :goto_21
.end method

.method private setupGravity(Landroid/view/ViewGroup;)V
    .registers 10
    .param p1, "view"    # Landroid/view/ViewGroup;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 109
    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    .line 110
    .local v2, "itemRoot":Landroid/widget/LinearLayout;
    iget-object v4, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->itemGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-virtual {v4}, Lcom/afollestad/materialdialogs/GravityEnum;->getGravityInt()I

    move-result v1

    .line 111
    .local v1, "gravityInt":I
    or-int/lit8 v4, v1, 0x10

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 113
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_56

    .line 114
    iget-object v4, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->itemGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    if-ne v4, v5, :cond_57

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/DefaultAdapter;->isRTL()Z

    move-result v4

    if-nez v4, :cond_57

    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/CompoundButton;

    if-eqz v4, :cond_57

    .line 115
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    .line 116
    .local v0, "first":Landroid/widget/CompoundButton;
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 118
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 119
    .local v3, "second":Landroid/widget/TextView;
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 120
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v4

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v5

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v6

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 123
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 124
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 138
    .end local v0    # "first":Landroid/widget/CompoundButton;
    .end local v3    # "second":Landroid/widget/TextView;
    :cond_56
    :goto_56
    return-void

    .line 125
    :cond_57
    iget-object v4, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->itemGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    if-ne v4, v5, :cond_56

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/DefaultAdapter;->isRTL()Z

    move-result v4

    if-eqz v4, :cond_56

    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/CompoundButton;

    if-eqz v4, :cond_56

    .line 126
    invoke-virtual {p1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    .line 127
    .restart local v0    # "first":Landroid/widget/CompoundButton;
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 129
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 130
    .restart local v3    # "second":Landroid/widget/TextView;
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 131
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v4

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v5

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v6

    invoke-virtual {v3}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 134
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 135
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_56
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    array-length v0, v0

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 47
    iget-object v0, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v0, v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 52
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "index"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 58
    if-nez p2, :cond_15

    .line 59
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v5}, Lcom/afollestad/materialdialogs/MaterialDialog;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    iget v8, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->layout:I

    invoke-virtual {v5, v8, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 61
    :cond_15
    sget v5, Lcom/afollestad/materialdialogs/R$id;->title:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 62
    .local v4, "tv":Landroid/widget/TextView;
    sget-object v5, Lcom/afollestad/materialdialogs/DefaultAdapter$1;->$SwitchMap$com$afollestad$materialdialogs$MaterialDialog$ListType:[I

    iget-object v8, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v8, v8, Lcom/afollestad/materialdialogs/MaterialDialog;->listType:Lcom/afollestad/materialdialogs/MaterialDialog$ListType;

    invoke-virtual {v8}, Lcom/afollestad/materialdialogs/MaterialDialog$ListType;->ordinal()I

    move-result v8

    aget v5, v5, v8

    packed-switch v5, :pswitch_data_108

    .line 80
    :goto_2c
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    aget-object v5, v5, p1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v8, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v8, v8, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v8, v8, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    invoke-virtual {v5, v4, v8}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTypeface(Landroid/widget/TextView;Landroid/graphics/Typeface;)V

    .line 84
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, ":"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v8, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v8, v8, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v8, v8, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    aget-object v8, v8, p1

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    move-object v5, p2

    .line 85
    check-cast v5, Landroid/view/ViewGroup;

    invoke-direct {p0, v5}, Lcom/afollestad/materialdialogs/DefaultAdapter;->setupGravity(Landroid/view/ViewGroup;)V

    .line 87
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemIds:[I

    if-eqz v5, :cond_8f

    .line 88
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemIds:[I

    array-length v5, v5

    if-ge p1, v5, :cond_f2

    .line 89
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemIds:[I

    aget v5, v5, p1

    invoke-virtual {p2, v5}, Landroid/view/View;->setId(I)V

    .line 93
    :cond_8f
    :goto_8f
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-lt v5, v8, :cond_ae

    move-object v1, p2

    .line 94
    check-cast v1, Landroid/view/ViewGroup;

    .line 95
    .local v1, "group":Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    const/4 v8, 0x2

    if-ne v5, v8, :cond_ae

    .line 97
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    instance-of v5, v5, Landroid/widget/CompoundButton;

    if-eqz v5, :cond_f7

    .line 98
    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 104
    .end local v1    # "group":Landroid/view/ViewGroup;
    :cond_ae
    :goto_ae
    return-object p2

    .line 65
    :pswitch_af
    sget v5, Lcom/afollestad/materialdialogs/R$id;->control:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioButton;

    .line 66
    .local v2, "radio":Landroid/widget/RadioButton;
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    if-ne v5, p1, :cond_ce

    move v3, v6

    .line 67
    .local v3, "selected":Z
    :goto_c0
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {v2, v5}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/RadioButton;I)V

    .line 68
    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setChecked(Z)V

    goto/16 :goto_2c

    .end local v3    # "selected":Z
    :cond_ce
    move v3, v7

    .line 66
    goto :goto_c0

    .line 73
    .end local v2    # "radio":Landroid/widget/RadioButton;
    :pswitch_d0
    sget v5, Lcom/afollestad/materialdialogs/R$id;->control:I

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 74
    .local v0, "checkbox":Landroid/widget/CheckBox;
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->selectedIndicesList:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v5, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    .line 75
    .restart local v3    # "selected":Z
    iget-object v5, p0, Lcom/afollestad/materialdialogs/DefaultAdapter;->dialog:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {v0, v5}, Lcom/afollestad/materialdialogs/internal/MDTintHelper;->setTint(Landroid/widget/CheckBox;I)V

    .line 76
    invoke-virtual {v0, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto/16 :goto_2c

    .line 90
    .end local v0    # "checkbox":Landroid/widget/CheckBox;
    .end local v3    # "selected":Z
    :cond_f2
    const/4 v5, -0x1

    invoke-virtual {p2, v5}, Landroid/view/View;->setId(I)V

    goto :goto_8f

    .line 99
    .restart local v1    # "group":Landroid/view/ViewGroup;
    :cond_f7
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    instance-of v5, v5, Landroid/widget/CompoundButton;

    if-eqz v5, :cond_ae

    .line 100
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_ae

    .line 62
    nop

    :pswitch_data_108
    .packed-switch 0x1
        :pswitch_af
        :pswitch_d0
    .end packed-switch
.end method

.method public hasStableIds()Z
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x1

    return v0
.end method
