.class public Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
.super Ljava/lang/Object;
.source "MaterialDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/MaterialDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected adapter:Landroid/widget/ListAdapter;

.field protected alwaysCallInputCallback:Z

.field protected alwaysCallMultiChoiceCallback:Z

.field protected alwaysCallSingleChoiceCallback:Z

.field protected autoDismiss:Z

.field protected backgroundColor:I

.field protected btnSelectorNegative:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field protected btnSelectorNeutral:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field protected btnSelectorPositive:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field protected btnSelectorStacked:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field protected btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field protected buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field protected callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

.field protected cancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field protected cancelable:Z

.field protected content:Ljava/lang/CharSequence;

.field protected contentColor:I

.field protected contentColorSet:Z

.field protected contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field protected contentLineSpacingMultiplier:F

.field protected final context:Landroid/content/Context;

.field protected customView:Landroid/view/View;

.field protected dismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field protected dividerColor:I

.field protected dividerColorSet:Z

.field protected forceStacking:Z

.field protected icon:Landroid/graphics/drawable/Drawable;

.field protected indeterminateIsHorizontalProgress:Z

.field protected indeterminateProgress:Z

.field protected inputAllowEmpty:Z

.field protected inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

.field protected inputHint:Ljava/lang/CharSequence;

.field protected inputMaxLength:I

.field protected inputMaxLengthErrorColor:I

.field protected inputPrefill:Ljava/lang/CharSequence;

.field protected inputType:I

.field protected itemColor:I

.field protected itemColorSet:Z

.field protected items:[Ljava/lang/CharSequence;

.field protected itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field protected keyListener:Landroid/content/DialogInterface$OnKeyListener;

.field protected limitIconToDefaultSize:Z

.field protected listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

.field protected listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

.field protected listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

.field protected listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

.field protected listSelector:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field protected maxIconSize:I

.field protected mediumFont:Landroid/graphics/Typeface;

.field protected negativeColor:Landroid/content/res/ColorStateList;

.field protected negativeColorSet:Z

.field protected negativeText:Ljava/lang/CharSequence;

.field protected neutralColor:Landroid/content/res/ColorStateList;

.field protected neutralColorSet:Z

.field protected neutralText:Ljava/lang/CharSequence;

.field protected positiveColor:Landroid/content/res/ColorStateList;

.field protected positiveColorSet:Z

.field protected positiveText:Ljava/lang/CharSequence;

.field protected progress:I

.field protected progressMax:I

.field protected progressNumberFormat:Ljava/lang/String;

.field protected progressPercentFormat:Ljava/text/NumberFormat;

.field protected regularFont:Landroid/graphics/Typeface;

.field protected selectedIndex:I

.field protected selectedIndices:[Ljava/lang/Integer;

.field protected showListener:Landroid/content/DialogInterface$OnShowListener;

.field protected showMinMax:Z

.field protected theme:Lcom/afollestad/materialdialogs/Theme;

.field protected title:Ljava/lang/CharSequence;

.field protected titleColor:I

.field protected titleColorSet:Z

.field protected titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field protected widgetColor:I

.field protected widgetColorSet:Z

.field protected wrapCustomViewInScroll:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/16 v8, 0x15

    const/4 v7, 0x1

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 458
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 360
    sget-object v4, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 361
    sget-object v4, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 362
    sget-object v4, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 363
    sget-object v4, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 364
    sget-object v4, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 365
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    .line 366
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    .line 382
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    .line 383
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallSingleChoiceCallback:Z

    .line 384
    sget-object v4, Lcom/afollestad/materialdialogs/Theme;->LIGHT:Lcom/afollestad/materialdialogs/Theme;

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 385
    iput-boolean v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelable:Z

    .line 386
    const v4, 0x3f99999a    # 1.2f

    iput v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentLineSpacingMultiplier:F

    .line 387
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 388
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    .line 389
    iput-boolean v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    .line 394
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->maxIconSize:I

    .line 407
    const/4 v4, -0x2

    iput v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    .line 408
    iput v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressMax:I

    .line 413
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    .line 415
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    .line 416
    iput v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLengthErrorColor:I

    .line 422
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColorSet:Z

    .line 423
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColorSet:Z

    .line 424
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColorSet:Z

    .line 425
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColorSet:Z

    .line 426
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColorSet:Z

    .line 427
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColorSet:Z

    .line 428
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColorSet:Z

    .line 429
    iput-boolean v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColorSet:Z

    .line 459
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    .line 460
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/afollestad/materialdialogs/R$color;->md_material_blue_600:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 463
    .local v0, "materialBlue":I
    sget v4, Lcom/afollestad/materialdialogs/R$attr;->colorAccent:I

    invoke-static {p1, v4, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v4

    iput v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 464
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v8, :cond_76

    .line 465
    const v4, 0x1010435

    iget v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v4, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v4

    iput v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 468
    :cond_76
    iget v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v4}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    .line 469
    iget v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v4}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    .line 470
    iget v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v4}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    .line 472
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    .line 473
    const-string v4, "%1d/%2d"

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    .line 476
    const v4, 0x1010036

    invoke-static {p1, v4}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v2

    .line 477
    .local v2, "primaryTextColor":I
    invoke-static {v2}, Lcom/afollestad/materialdialogs/util/DialogUtils;->isColorDark(I)Z

    move-result v4

    if-eqz v4, :cond_10c

    sget-object v4, Lcom/afollestad/materialdialogs/Theme;->LIGHT:Lcom/afollestad/materialdialogs/Theme;

    :goto_a7
    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 480
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->checkSingleton()V

    .line 483
    sget v4, Lcom/afollestad/materialdialogs/R$attr;->md_title_gravity:I

    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v4, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 484
    sget v4, Lcom/afollestad/materialdialogs/R$attr;->md_content_gravity:I

    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v4, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 485
    sget v4, Lcom/afollestad/materialdialogs/R$attr;->md_btnstacked_gravity:I

    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v4, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 486
    sget v4, Lcom/afollestad/materialdialogs/R$attr;->md_items_gravity:I

    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v4, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 487
    sget v4, Lcom/afollestad/materialdialogs/R$attr;->md_buttons_gravity:I

    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v4, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 489
    sget v4, Lcom/afollestad/materialdialogs/R$attr;->md_medium_font:I

    invoke-static {p1, v4}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    .line 490
    .local v1, "mediumFont":Ljava/lang/String;
    sget v4, Lcom/afollestad/materialdialogs/R$attr;->md_regular_font:I

    invoke-static {p1, v4}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    .line 491
    .local v3, "regularFont":Ljava/lang/String;
    invoke-virtual {p0, v1, v3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->typeface(Ljava/lang/String;Ljava/lang/String;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 493
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    if-nez v4, :cond_fe

    .line 495
    :try_start_f1
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v4, v8, :cond_10f

    .line 496
    const-string v4, "sans-serif-medium"

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;
    :try_end_fe
    .catch Ljava/lang/Throwable; {:try_start_f1 .. :try_end_fe} :catch_119

    .line 502
    :cond_fe
    :goto_fe
    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    if-nez v4, :cond_10b

    .line 504
    :try_start_102
    const-string v4, "sans-serif"

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;
    :try_end_10b
    .catch Ljava/lang/Throwable; {:try_start_102 .. :try_end_10b} :catch_11b

    .line 508
    :cond_10b
    :goto_10b
    return-void

    .line 477
    .end local v1    # "mediumFont":Ljava/lang/String;
    .end local v3    # "regularFont":Ljava/lang/String;
    :cond_10c
    sget-object v4, Lcom/afollestad/materialdialogs/Theme;->DARK:Lcom/afollestad/materialdialogs/Theme;

    goto :goto_a7

    .line 498
    .restart local v1    # "mediumFont":Ljava/lang/String;
    .restart local v3    # "regularFont":Ljava/lang/String;
    :cond_10f
    :try_start_10f
    const-string v4, "sans-serif"

    const/4 v5, 0x1

    invoke-static {v4, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v4

    iput-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;
    :try_end_118
    .catch Ljava/lang/Throwable; {:try_start_10f .. :try_end_118} :catch_119

    goto :goto_fe

    .line 499
    :catch_119
    move-exception v4

    goto :goto_fe

    .line 505
    :catch_11b
    move-exception v4

    goto :goto_10b
.end method

.method private checkSingleton()V
    .registers 3

    .prologue
    .line 511
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/afollestad/materialdialogs/ThemeSingleton;->get(Z)Lcom/afollestad/materialdialogs/ThemeSingleton;

    move-result-object v1

    if-nez v1, :cond_8

    .line 550
    :goto_7
    return-void

    .line 512
    :cond_8
    invoke-static {}, Lcom/afollestad/materialdialogs/ThemeSingleton;->get()Lcom/afollestad/materialdialogs/ThemeSingleton;

    move-result-object v0

    .line 513
    .local v0, "s":Lcom/afollestad/materialdialogs/ThemeSingleton;
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->darkTheme:Z

    if-eqz v1, :cond_14

    .line 514
    sget-object v1, Lcom/afollestad/materialdialogs/Theme;->DARK:Lcom/afollestad/materialdialogs/Theme;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 515
    :cond_14
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->titleColor:I

    if-eqz v1, :cond_1c

    .line 516
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->titleColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    .line 517
    :cond_1c
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->contentColor:I

    if-eqz v1, :cond_24

    .line 518
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->contentColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    .line 519
    :cond_24
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->positiveColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_2c

    .line 520
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->positiveColor:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    .line 521
    :cond_2c
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->neutralColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_34

    .line 522
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->neutralColor:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    .line 523
    :cond_34
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->negativeColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_3c

    .line 524
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->negativeColor:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    .line 525
    :cond_3c
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->itemColor:I

    if-eqz v1, :cond_44

    .line 526
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->itemColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    .line 527
    :cond_44
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_4c

    .line 528
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->icon:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 529
    :cond_4c
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->backgroundColor:I

    if-eqz v1, :cond_54

    .line 530
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->backgroundColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    .line 531
    :cond_54
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->dividerColor:I

    if-eqz v1, :cond_5c

    .line 532
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->dividerColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor:I

    .line 533
    :cond_5c
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorStacked:I

    if-eqz v1, :cond_64

    .line 534
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorStacked:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorStacked:I

    .line 535
    :cond_64
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->listSelector:I

    if-eqz v1, :cond_6c

    .line 536
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->listSelector:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listSelector:I

    .line 537
    :cond_6c
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorPositive:I

    if-eqz v1, :cond_74

    .line 538
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorPositive:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    .line 539
    :cond_74
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorNeutral:I

    if-eqz v1, :cond_7c

    .line 540
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorNeutral:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    .line 541
    :cond_7c
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorNegative:I

    if-eqz v1, :cond_84

    .line 542
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnSelectorNegative:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    .line 543
    :cond_84
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->widgetColor:I

    if-eqz v1, :cond_8c

    .line 544
    iget v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->widgetColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 545
    :cond_8c
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 546
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 547
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 548
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 549
    iget-object v1, v0, Lcom/afollestad/materialdialogs/ThemeSingleton;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    goto/16 :goto_7
.end method


# virtual methods
.method public adapter(Landroid/widget/ListAdapter;Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "adapter"    # Landroid/widget/ListAdapter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 1060
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 1061
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set adapter() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1062
    :cond_c
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    .line 1063
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    .line 1064
    return-object p0
.end method

.method public alwaysCallInputCallback()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 1163
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallInputCallback:Z

    .line 1164
    return-object p0
.end method

.method public alwaysCallMultiChoiceCallback()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 772
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    .line 773
    return-object p0
.end method

.method public alwaysCallSingleChoiceCallback()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 744
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallSingleChoiceCallback:Z

    .line 745
    return-object p0
.end method

.method public autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "dismiss"    # Z

    .prologue
    .line 1048
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    .line 1049
    return-object p0
.end method

.method public backgroundColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 1012
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    .line 1013
    return-object p0
.end method

.method public backgroundColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 1021
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public backgroundColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 1017
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public btnSelector(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "selectorRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 869
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    .line 870
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    .line 871
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    .line 872
    return-object p0
.end method

.method public btnSelector(ILcom/afollestad/materialdialogs/DialogAction;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "selectorRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 876
    sget-object v0, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p2}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_14

    .line 878
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    .line 887
    :goto_d
    return-object p0

    .line 881
    :pswitch_e
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    goto :goto_d

    .line 884
    :pswitch_11
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    goto :goto_d

    .line 876
    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_e
        :pswitch_11
    .end packed-switch
.end method

.method public btnSelectorStacked(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "selectorRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 864
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorStacked:I

    .line 865
    return-object p0
.end method

.method public btnStackedGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 897
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 898
    return-object p0
.end method

.method public build()Lcom/afollestad/materialdialogs/MaterialDialog;
    .registers 2
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1169
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {v0, p0}, Lcom/afollestad/materialdialogs/MaterialDialog;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)V

    return-object v0
.end method

.method public buttonsGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 716
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 717
    return-object p0
.end method

.method public callback(Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1025
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    .line 1026
    return-object p0
.end method

.method public cancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnCancelListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1095
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelListener:Landroid/content/DialogInterface$OnCancelListener;

    .line 1096
    return-object p0
.end method

.method public cancelable(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "cancelable"    # Z

    .prologue
    .line 1035
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelable:Z

    .line 1036
    return-object p0
.end method

.method public content(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "contentRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 635
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 636
    return-object p0
.end method

.method public varargs content(I[Ljava/lang/Object;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "contentRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "formatArgs"    # [Ljava/lang/Object;

    .prologue
    .line 647
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 648
    return-object p0
.end method

.method public content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "content"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 640
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 641
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set content() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 642
    :cond_c
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content:Ljava/lang/CharSequence;

    .line 643
    return-object p0
.end method

.method public contentColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 652
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    .line 653
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColorSet:Z

    .line 654
    return-object p0
.end method

.method public contentColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 663
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 664
    return-object p0
.end method

.method public contentColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 658
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 659
    return-object p0
.end method

.method public contentGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 668
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 669
    return-object p0
.end method

.method public contentLineSpacing(F)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "multiplier"    # F

    .prologue
    .line 673
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentLineSpacingMultiplier:F

    .line 674
    return-object p0
.end method

.method public customView(IZ)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "layoutRes"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "wrapInScrollView"    # Z

    .prologue
    .line 902
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 903
    .local v0, "li":Landroid/view/LayoutInflater;
    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v1

    return-object v1
.end method

.method public customView(Landroid/view/View;Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "wrapInScrollView"    # Z

    .prologue
    .line 907
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content:Ljava/lang/CharSequence;

    if-eqz v0, :cond_c

    .line 908
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use customView() when you have content set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 909
    :cond_c
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_18

    .line 910
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use customView() when you have items set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 911
    :cond_18
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    if-eqz v0, :cond_24

    .line 912
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use customView() with an input dialog"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 913
    :cond_24
    iget v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v1, -0x2

    if-gt v0, v1, :cond_2d

    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-eqz v0, :cond_35

    .line 914
    :cond_2d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use customView() with a progress dialog"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 915
    :cond_35
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_4c

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4c

    .line 916
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 917
    :cond_4c
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    .line 918
    iput-boolean p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->wrapCustomViewInScroll:Z

    .line 919
    return-object p0
.end method

.method public dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnDismissListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1090
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 1091
    return-object p0
.end method

.method public dividerColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 998
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor:I

    .line 999
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColorSet:Z

    .line 1000
    return-object p0
.end method

.method public dividerColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 1008
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public dividerColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 1004
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public forceStacking(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "stacked"    # Z

    .prologue
    .line 1105
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->forceStacking:Z

    .line 1106
    return-object p0
.end method

.method public final getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 443
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    return-object v0
.end method

.method public final getItemColor()I
    .registers 2

    .prologue
    .line 451
    iget v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    return v0
.end method

.method public final getItemsGravity()Lcom/afollestad/materialdialogs/GravityEnum;
    .registers 2

    .prologue
    .line 447
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    return-object v0
.end method

.method public final getRegularFont()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 455
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public icon(Landroid/graphics/drawable/Drawable;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 620
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 621
    return-object p0
.end method

.method public iconAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "iconAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 630
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 631
    return-object p0
.end method

.method public iconRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "icon"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 625
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 626
    return-object p0
.end method

.method public input(IILcom/afollestad/materialdialogs/MaterialDialog$InputCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "hint"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "prefill"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p3, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1128
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->input(IIZLcom/afollestad/materialdialogs/MaterialDialog$InputCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public input(IIZLcom/afollestad/materialdialogs/MaterialDialog$InputCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 7
    .param p1, "hint"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "prefill"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p3, "allowEmptyInput"    # Z
    .param p4, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 1124
    if-nez p1, :cond_b

    move-object v1, v0

    :goto_4
    if-nez p2, :cond_12

    :goto_6
    invoke-virtual {p0, v1, v0, p3, p4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->input(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLcom/afollestad/materialdialogs/MaterialDialog$InputCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0

    :cond_b
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    goto :goto_4

    :cond_12
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p2}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_6
.end method

.method public input(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "hint"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "prefill"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1120
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->input(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLcom/afollestad/materialdialogs/MaterialDialog$InputCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public input(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLcom/afollestad/materialdialogs/MaterialDialog$InputCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 7
    .param p1, "hint"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "prefill"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "allowEmptyInput"    # Z
    .param p4, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1110
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 1111
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set content() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1112
    :cond_c
    iput-object p4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    .line 1113
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputHint:Ljava/lang/CharSequence;

    .line 1114
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputPrefill:Ljava/lang/CharSequence;

    .line 1115
    iput-boolean p3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputAllowEmpty:Z

    .line 1116
    return-object p0
.end method

.method public inputMaxLength(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "maxLength"    # I

    .prologue
    .line 1137
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength(II)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public inputMaxLength(II)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "maxLength"    # I
    .param p2, "errorColor"    # I

    .prologue
    .line 1144
    const/4 v0, 0x1

    if-ge p1, v0, :cond_b

    .line 1145
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Max length for input dialogs cannot be less than 1."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1146
    :cond_b
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    .line 1147
    if-nez p2, :cond_1e

    .line 1148
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/afollestad/materialdialogs/R$color;->md_edittext_error:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLengthErrorColor:I

    .line 1152
    :goto_1d
    return-object p0

    .line 1150
    :cond_1e
    iput p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLengthErrorColor:I

    goto :goto_1d
.end method

.method public inputMaxLengthRes(II)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "maxLength"    # I
    .param p2, "errorColor"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 1159
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength(II)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public inputType(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 1132
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    .line 1133
    return-object p0
.end method

.method public itemColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 697
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    .line 698
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColorSet:Z

    .line 699
    return-object p0
.end method

.method public itemColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 707
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public itemColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 703
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public items(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "itemsRes"    # I
        .annotation build Landroid/support/annotation/ArrayRes;
        .end annotation
    .end param

    .prologue
    .line 678
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 679
    return-object p0
.end method

.method public items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "items"    # [Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 683
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 684
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set items() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 685
    :cond_c
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    .line 686
    return-object p0
.end method

.method public itemsCallback(Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 690
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    .line 691
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    .line 692
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    .line 693
    return-object p0
.end method

.method public itemsCallbackMultiChoice([Ljava/lang/Integer;Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "selectedIndices"    # [Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 757
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    .line 758
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    .line 759
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    .line 760
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    .line 761
    return-object p0
.end method

.method public itemsCallbackSingleChoice(ILcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "selectedIndex"    # I
    .param p2, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 729
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 730
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    .line 731
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    .line 732
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    .line 733
    return-object p0
.end method

.method public itemsGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 711
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 712
    return-object p0
.end method

.method public keyListener(Landroid/content/DialogInterface$OnKeyListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnKeyListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1100
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->keyListener:Landroid/content/DialogInterface$OnKeyListener;

    .line 1101
    return-object p0
.end method

.method public limitIconToDefaultSize()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 1071
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->limitIconToDefaultSize:Z

    .line 1072
    return-object p0
.end method

.method public listSelector(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "selectorRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 859
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listSelector:I

    .line 860
    return-object p0
.end method

.method public maxIconSize(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "maxIconSize"    # I

    .prologue
    .line 1076
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->maxIconSize:I

    .line 1077
    return-object p0
.end method

.method public maxIconSizeRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "maxIconSizeRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 1081
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->maxIconSize(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public negativeColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 814
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public negativeColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 826
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    .line 827
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColorSet:Z

    .line 828
    return-object p0
.end method

.method public negativeColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 822
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public negativeColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 818
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public negativeText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "negativeRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 832
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "message"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 836
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    .line 837
    return-object p0
.end method

.method public neutralColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 841
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public neutralColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 853
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    .line 854
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColorSet:Z

    .line 855
    return-object p0
.end method

.method public neutralColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 849
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public neutralColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 845
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public neutralText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "neutralRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 805
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public neutralText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "message"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 809
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    .line 810
    return-object p0
.end method

.method public positiveColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 787
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public positiveColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 799
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    .line 800
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColorSet:Z

    .line 801
    return-object p0
.end method

.method public positiveColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 795
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public positiveColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 791
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public positiveText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "postiveRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 777
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 778
    return-object p0
.end method

.method public positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "message"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 782
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    .line 783
    return-object p0
.end method

.method public progress(ZI)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "indeterminate"    # Z
    .param p2, "max"    # I

    .prologue
    .line 930
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 931
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set progress() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 932
    :cond_c
    if-eqz p1, :cond_15

    .line 933
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    .line 934
    const/4 v0, -0x2

    iput v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    .line 940
    :goto_14
    return-object p0

    .line 936
    :cond_15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    .line 937
    const/4 v0, -0x1

    iput v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    .line 938
    iput p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressMax:I

    goto :goto_14
.end method

.method public progress(ZIZ)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "indeterminate"    # Z
    .param p2, "max"    # I
    .param p3, "showMinMax"    # Z

    .prologue
    .line 952
    iput-boolean p3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showMinMax:Z

    .line 953
    invoke-virtual {p0, p1, p2}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress(ZI)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public progressIndeterminateStyle(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "horizontal"    # Z

    .prologue
    .line 979
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    .line 980
    return-object p0
.end method

.method public progressNumberFormat(Ljava/lang/String;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "format"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 961
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    .line 962
    return-object p0
.end method

.method public progressPercentFormat(Ljava/text/NumberFormat;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "format"    # Ljava/text/NumberFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 970
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    .line 971
    return-object p0
.end method

.method public show()Lcom/afollestad/materialdialogs/MaterialDialog;
    .registers 2
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1174
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v0

    .line 1175
    .local v0, "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 1176
    return-object v0
.end method

.method public showListener(Landroid/content/DialogInterface$OnShowListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnShowListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1085
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showListener:Landroid/content/DialogInterface$OnShowListener;

    .line 1086
    return-object p0
.end method

.method public theme(Lcom/afollestad/materialdialogs/Theme;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "theme"    # Lcom/afollestad/materialdialogs/Theme;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1030
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 1031
    return-object p0
.end method

.method public title(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "titleRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 553
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 554
    return-object p0
.end method

.method public title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 558
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title:Ljava/lang/CharSequence;

    .line 559
    return-object p0
.end method

.method public titleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 568
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    .line 569
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColorSet:Z

    .line 570
    return-object p0
.end method

.method public titleColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 579
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 580
    return-object p0
.end method

.method public titleColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 574
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 575
    return-object p0
.end method

.method public titleGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 563
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 564
    return-object p0
.end method

.method public typeface(Landroid/graphics/Typeface;Landroid/graphics/Typeface;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "medium"    # Landroid/graphics/Typeface;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "regular"    # Landroid/graphics/Typeface;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 592
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    .line 593
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    .line 594
    return-object p0
.end method

.method public typeface(Ljava/lang/String;Ljava/lang/String;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 6
    .param p1, "medium"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "regular"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 606
    if-eqz p1, :cond_27

    .line 607
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    .line 608
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    if-nez v0, :cond_27

    .line 609
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No font asset found for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 611
    :cond_27
    if-eqz p2, :cond_4e

    .line 612
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p2}, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    .line 613
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    if-nez v0, :cond_4e

    .line 614
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No font asset found for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 616
    :cond_4e
    return-object p0
.end method

.method public widgetColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 984
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 985
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColorSet:Z

    .line 986
    return-object p0
.end method

.method public widgetColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 994
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public widgetColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 990
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method
