.class public Lcom/jenzz/materialpreference/PreferenceCategory;
.super Landroid/preference/PreferenceCategory;
.source "PreferenceCategory.java"


# instance fields
.field private accentColor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 25
    invoke-direct {p0}, Lcom/jenzz/materialpreference/PreferenceCategory;->init()V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    invoke-direct {p0}, Lcom/jenzz/materialpreference/PreferenceCategory;->init()V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    invoke-direct {p0}, Lcom/jenzz/materialpreference/PreferenceCategory;->init()V

    .line 36
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
    .line 41
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 42
    invoke-direct {p0}, Lcom/jenzz/materialpreference/PreferenceCategory;->init()V

    .line 43
    return-void
.end method

.method private init()V
    .registers 2

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/PreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/jenzz/materialpreference/ThemeUtils;->resolveAccentColor(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceCategory;->accentColor:I

    .line 47
    return-void
.end method


# virtual methods
.method protected onBindView(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 58
    invoke-super {p0, p1}, Landroid/preference/PreferenceCategory;->onBindView(Landroid/view/View;)V

    .line 60
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/PreferenceCategory;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    .line 61
    .local v0, "title":Ljava/lang/CharSequence;
    sget v2, Lcom/jenzz/materialpreference/R$id;->title:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 62
    .local v1, "titleView":Landroid/widget/TextView;
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    iget v2, p0, Lcom/jenzz/materialpreference/PreferenceCategory;->accentColor:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 64
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2d

    const/4 v2, 0x0

    :goto_1e
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 65
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/PreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/jenzz/materialpreference/Typefaces;->getRobotoMedium(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 66
    return-void

    .line 64
    :cond_2d
    const/16 v2, 0x8

    goto :goto_1e
.end method

.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/jenzz/materialpreference/PreferenceCategory;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 53
    .local v0, "layoutInflater":Landroid/view/LayoutInflater;
    sget v1, Lcom/jenzz/materialpreference/R$layout;->mp_preference_category:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method
