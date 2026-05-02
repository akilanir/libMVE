.class public Lcom/jenzz/materialpreference/Preference;
.super Landroid/preference/Preference;
.source "Preference.java"


# instance fields
.field private icon:Landroid/graphics/drawable/Drawable;

.field private iconResId:I

.field imageFrame:Landroid/view/View;

.field imageView:Landroid/widget/ImageView;

.field summaryView:Landroid/widget/TextView;

.field titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 33
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v1, v1}, Lcom/jenzz/materialpreference/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 39
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/jenzz/materialpreference/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/jenzz/materialpreference/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 50
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/jenzz/materialpreference/Preference;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 51
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v3, 0x0

    .line 54
    const/4 v1, 0x1

    new-array v1, v1, [I

    const v2, 0x1010002

    aput v2, v1, v3

    .line 55
    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 57
    .local v0, "typedArray":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v3, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/jenzz/materialpreference/Preference;->iconResId:I

    .line 58
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 59
    return-void
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 79
    invoke-super {p0, p1}, Landroid/preference/Preference;->onBindView(Landroid/view/View;)V

    .line 81
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/Preference;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    .line 82
    .local v1, "title":Ljava/lang/CharSequence;
    sget v2, Lcom/jenzz/materialpreference/R$id;->title:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/jenzz/materialpreference/Preference;->titleView:Landroid/widget/TextView;

    .line 83
    iget-object v2, p0, Lcom/jenzz/materialpreference/Preference;->titleView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    iget-object v5, p0, Lcom/jenzz/materialpreference/Preference;->titleView:Landroid/widget/TextView;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a3

    move v2, v3

    :goto_22
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 85
    iget-object v2, p0, Lcom/jenzz/materialpreference/Preference;->titleView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/jenzz/materialpreference/Preference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/jenzz/materialpreference/Typefaces;->getRobotoRegular(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 87
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/Preference;->getSummary()Ljava/lang/CharSequence;

    move-result-object v0

    .line 88
    .local v0, "summary":Ljava/lang/CharSequence;
    sget v2, Lcom/jenzz/materialpreference/R$id;->summary:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/jenzz/materialpreference/Preference;->summaryView:Landroid/widget/TextView;

    .line 89
    iget-object v2, p0, Lcom/jenzz/materialpreference/Preference;->summaryView:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    iget-object v5, p0, Lcom/jenzz/materialpreference/Preference;->summaryView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a6

    move v2, v3

    :goto_4e
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 91
    iget-object v2, p0, Lcom/jenzz/materialpreference/Preference;->summaryView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/jenzz/materialpreference/Preference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/jenzz/materialpreference/Typefaces;->getRobotoRegular(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 93
    iget-object v2, p0, Lcom/jenzz/materialpreference/Preference;->icon:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_76

    iget v2, p0, Lcom/jenzz/materialpreference/Preference;->iconResId:I

    if-lez v2, :cond_76

    .line 94
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/Preference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v5, p0, Lcom/jenzz/materialpreference/Preference;->iconResId:I

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/jenzz/materialpreference/Preference;->icon:Landroid/graphics/drawable/Drawable;

    .line 96
    :cond_76
    sget v2, Lcom/jenzz/materialpreference/R$id;->icon:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/jenzz/materialpreference/Preference;->imageView:Landroid/widget/ImageView;

    .line 97
    iget-object v2, p0, Lcom/jenzz/materialpreference/Preference;->imageView:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/jenzz/materialpreference/Preference;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 98
    iget-object v5, p0, Lcom/jenzz/materialpreference/Preference;->imageView:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/jenzz/materialpreference/Preference;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_a8

    move v2, v3

    :goto_8e
    invoke-virtual {v5, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 100
    sget v2, Lcom/jenzz/materialpreference/R$id;->icon_frame:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/jenzz/materialpreference/Preference;->imageFrame:Landroid/view/View;

    .line 101
    iget-object v2, p0, Lcom/jenzz/materialpreference/Preference;->imageFrame:Landroid/view/View;

    iget-object v5, p0, Lcom/jenzz/materialpreference/Preference;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_aa

    :goto_9f
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 102
    return-void

    .end local v0    # "summary":Ljava/lang/CharSequence;
    :cond_a3
    move v2, v4

    .line 84
    goto/16 :goto_22

    .restart local v0    # "summary":Ljava/lang/CharSequence;
    :cond_a6
    move v2, v4

    .line 90
    goto :goto_4e

    :cond_a8
    move v2, v4

    .line 98
    goto :goto_8e

    :cond_aa
    move v3, v4

    .line 101
    goto :goto_9f
.end method

.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/Preference;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "layout_inflater"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 65
    .local v1, "layoutInflater":Landroid/view/LayoutInflater;
    sget v5, Lcom/jenzz/materialpreference/R$layout;->mp_preference:I

    invoke-virtual {v1, v5, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 67
    .local v0, "layout":Landroid/view/View;
    sget v5, Lcom/jenzz/materialpreference/R$id;->widget_frame:I

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 68
    .local v2, "widgetFrame":Landroid/view/ViewGroup;
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/Preference;->getWidgetLayoutResource()I

    move-result v3

    .line 69
    .local v3, "widgetLayoutResId":I
    if-eqz v3, :cond_24

    .line 70
    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 72
    :cond_24
    if-eqz v3, :cond_2a

    :goto_26
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 74
    return-object v0

    .line 72
    :cond_2a
    const/16 v4, 0x8

    goto :goto_26
.end method

.method public setIcon(I)V
    .registers 2
    .param p1, "iconResId"    # I

    .prologue
    .line 106
    invoke-super {p0, p1}, Landroid/preference/Preference;->setIcon(I)V

    .line 107
    iput p1, p0, Lcom/jenzz/materialpreference/Preference;->iconResId:I

    .line 108
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 112
    invoke-super {p0, p1}, Landroid/preference/Preference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 113
    iput-object p1, p0, Lcom/jenzz/materialpreference/Preference;->icon:Landroid/graphics/drawable/Drawable;

    .line 114
    return-void
.end method
