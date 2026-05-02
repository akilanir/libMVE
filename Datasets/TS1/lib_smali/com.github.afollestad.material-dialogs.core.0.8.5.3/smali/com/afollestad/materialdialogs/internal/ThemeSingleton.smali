.class public Lcom/afollestad/materialdialogs/internal/ThemeSingleton;
.super Ljava/lang/Object;
.source "ThemeSingleton.java"


# static fields
.field private static singleton:Lcom/afollestad/materialdialogs/internal/ThemeSingleton;


# instance fields
.field public backgroundColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public btnSelectorNegative:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public btnSelectorNeutral:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public btnSelectorPositive:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public btnSelectorStacked:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field public buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field public contentColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field public darkTheme:Z

.field public dividerColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public icon:Landroid/graphics/drawable/Drawable;

.field public itemColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field public linkColor:Landroid/content/res/ColorStateList;
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public listSelector:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field public negativeColor:Landroid/content/res/ColorStateList;
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public neutralColor:Landroid/content/res/ColorStateList;
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public positiveColor:Landroid/content/res/ColorStateList;
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public titleColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field public widgetColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->darkTheme:Z

    .line 28
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->titleColor:I

    .line 30
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->contentColor:I

    .line 32
    iput-object v1, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->positiveColor:Landroid/content/res/ColorStateList;

    .line 34
    iput-object v1, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->neutralColor:Landroid/content/res/ColorStateList;

    .line 36
    iput-object v1, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->negativeColor:Landroid/content/res/ColorStateList;

    .line 38
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->widgetColor:I

    .line 40
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->itemColor:I

    .line 42
    iput-object v1, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->icon:Landroid/graphics/drawable/Drawable;

    .line 43
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->backgroundColor:I

    .line 45
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->dividerColor:I

    .line 47
    iput-object v1, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->linkColor:Landroid/content/res/ColorStateList;

    .line 50
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->listSelector:I

    .line 52
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorStacked:I

    .line 54
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorPositive:I

    .line 56
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorNeutral:I

    .line 58
    iput v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorNegative:I

    .line 61
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 62
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 63
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 64
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 65
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    return-void
.end method

.method public static get()Lcom/afollestad/materialdialogs/internal/ThemeSingleton;
    .registers 1

    .prologue
    .line 24
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->get(Z)Lcom/afollestad/materialdialogs/internal/ThemeSingleton;

    move-result-object v0

    return-object v0
.end method

.method public static get(Z)Lcom/afollestad/materialdialogs/internal/ThemeSingleton;
    .registers 2
    .param p0, "createIfNull"    # Z

    .prologue
    .line 18
    sget-object v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->singleton:Lcom/afollestad/materialdialogs/internal/ThemeSingleton;

    if-nez v0, :cond_d

    if-eqz p0, :cond_d

    .line 19
    new-instance v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;

    invoke-direct {v0}, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;-><init>()V

    sput-object v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->singleton:Lcom/afollestad/materialdialogs/internal/ThemeSingleton;

    .line 20
    :cond_d
    sget-object v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->singleton:Lcom/afollestad/materialdialogs/internal/ThemeSingleton;

    return-object v0
.end method
