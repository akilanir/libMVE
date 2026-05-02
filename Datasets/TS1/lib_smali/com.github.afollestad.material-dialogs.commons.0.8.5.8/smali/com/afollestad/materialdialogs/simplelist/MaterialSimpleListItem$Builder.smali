.class public Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
.super Ljava/lang/Object;
.source "MaterialSimpleListItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected mBackgroundColor:I

.field protected mContent:Ljava/lang/CharSequence;

.field private final mContext:Landroid/content/Context;

.field protected mIcon:Landroid/graphics/drawable/Drawable;

.field protected mIconPadding:I

.field protected mId:J

.field protected mTag:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContext:Landroid/content/Context;

    .line 68
    const-string v0, "#BCBCBC"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mBackgroundColor:I

    .line 69
    return-void
.end method


# virtual methods
.method public backgroundColor(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 2
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 105
    iput p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mBackgroundColor:I

    .line 106
    return-object p0
.end method

.method public backgroundColorAttr(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 114
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->backgroundColor(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    move-result-object v0

    return-object v0
.end method

.method public backgroundColorRes(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 110
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->backgroundColor(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;
    .registers 3

    .prologue
    .line 128
    new-instance v0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem;-><init>(Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$1;)V

    return-object v0
.end method

.method public content(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 3
    .param p1, "contentRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 101
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    move-result-object v0

    return-object v0
.end method

.method public content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 2
    .param p1, "content"    # Ljava/lang/CharSequence;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContent:Ljava/lang/CharSequence;

    .line 97
    return-object p0
.end method

.method public icon(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 3
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 77
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    move-result-object v0

    return-object v0
.end method

.method public icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 73
    return-object p0
.end method

.method public iconPadding(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 2
    .param p1, "padding"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param

    .prologue
    .line 81
    iput p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mIconPadding:I

    .line 82
    return-object p0
.end method

.method public iconPaddingDp(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 5
    .param p1, "paddingDp"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param

    .prologue
    .line 86
    const/4 v0, 0x1

    int-to-float v1, p1

    iget-object v2, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mIconPadding:I

    .line 88
    return-object p0
.end method

.method public iconPaddingRes(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 3
    .param p1, "paddingRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 92
    iget-object v0, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->iconPadding(I)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;

    move-result-object v0

    return-object v0
.end method

.method public id(J)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 3
    .param p1, "id"    # J

    .prologue
    .line 118
    iput-wide p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mId:J

    .line 119
    return-object p0
.end method

.method public tag(Ljava/lang/Object;)Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;
    .registers 2
    .param p1, "tag"    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 123
    iput-object p1, p0, Lcom/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder;->mTag:Ljava/lang/Object;

    .line 124
    return-object p0
.end method
