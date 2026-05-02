.class public Lcom/afollestad/materialdialogs/ThemeSingleton;
.super Ljava/lang/Object;
.source "ThemeSingleton.java"


# static fields
.field private static singleton:Lcom/afollestad/materialdialogs/ThemeSingleton;


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

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->darkTheme:Z

    .line 26
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->titleColor:I

    .line 28
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->contentColor:I

    .line 30
    iput-object v1, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->positiveColor:Landroid/content/res/ColorStateList;

    .line 32
    iput-object v1, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->neutralColor:Landroid/content/res/ColorStateList;

    .line 34
    iput-object v1, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->negativeColor:Landroid/content/res/ColorStateList;

    .line 36
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->widgetColor:I

    .line 38
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->itemColor:I

    .line 40
    iput-object v1, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->icon:Landroid/graphics/drawable/Drawable;

    .line 41
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->backgroundColor:I

    .line 43
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->dividerColor:I

    .line 46
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->listSelector:I

    .line 48
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorStacked:I

    .line 50
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorPositive:I

    .line 52
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorNeutral:I

    .line 54
    iput v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorNegative:I

    .line 57
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 58
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 59
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 60
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 61
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/ThemeSingleton;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    return-void
.end method

.method public static get()Lcom/afollestad/materialdialogs/ThemeSingleton;
    .registers 1

    .prologue
    .line 22
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/afollestad/materialdialogs/ThemeSingleton;->get(Z)Lcom/afollestad/materialdialogs/ThemeSingleton;

    move-result-object v0

    return-object v0
.end method

.method public static get(Z)Lcom/afollestad/materialdialogs/ThemeSingleton;
    .registers 2
    .param p0, "createIfNull"    # Z

    .prologue
    .line 16
    sget-object v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->singleton:Lcom/afollestad/materialdialogs/ThemeSingleton;

    if-nez v0, :cond_d

    if-eqz p0, :cond_d

    .line 17
    new-instance v0, Lcom/afollestad/materialdialogs/ThemeSingleton;

    invoke-direct {v0}, Lcom/afollestad/materialdialogs/ThemeSingleton;-><init>()V

    sput-object v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->singleton:Lcom/afollestad/materialdialogs/ThemeSingleton;

    .line 18
    :cond_d
    sget-object v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->singleton:Lcom/afollestad/materialdialogs/ThemeSingleton;

    return-object v0
.end method
