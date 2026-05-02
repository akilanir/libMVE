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

.field protected buttonRippleColor:I

.field protected buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field protected callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

.field protected cancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field protected cancelable:Z

.field protected canceledOnTouchOutside:Z

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

.field protected inputMinLength:I

.field protected inputPrefill:Ljava/lang/CharSequence;

.field protected inputRangeErrorColor:I

.field protected inputType:I

.field protected itemColor:I

.field protected itemColorSet:Z

.field protected itemIds:[I

.field protected items:[Ljava/lang/CharSequence;

.field protected itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

.field protected keyListener:Landroid/content/DialogInterface$OnKeyListener;

.field protected limitIconToDefaultSize:Z

.field protected linkColor:Landroid/content/res/ColorStateList;

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

.field protected onAnyCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

.field protected onNegativeCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

.field protected onNeutralCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

.field protected onPositiveCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

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
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/16 v9, 0x15

    const/4 v8, 0x1

    const/4 v7, -0x1

    const/4 v6, 0x0

    .line 480
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 377
    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 378
    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 379
    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 380
    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 381
    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 382
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonRippleColor:I

    .line 383
    iput v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    .line 384
    iput v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    .line 405
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    .line 406
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallSingleChoiceCallback:Z

    .line 407
    sget-object v5, Lcom/afollestad/materialdialogs/Theme;->LIGHT:Lcom/afollestad/materialdialogs/Theme;

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 408
    iput-boolean v8, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelable:Z

    .line 409
    iput-boolean v8, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->canceledOnTouchOutside:Z

    .line 410
    const v5, 0x3f99999a    # 1.2f

    iput v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentLineSpacingMultiplier:F

    .line 411
    iput v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 412
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    .line 413
    iput-boolean v8, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    .line 418
    iput v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->maxIconSize:I

    .line 431
    const/4 v5, -0x2

    iput v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    .line 432
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressMax:I

    .line 437
    iput v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    .line 439
    iput v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMinLength:I

    .line 440
    iput v7, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    .line 441
    iput v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRangeErrorColor:I

    .line 448
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColorSet:Z

    .line 449
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColorSet:Z

    .line 450
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColorSet:Z

    .line 451
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColorSet:Z

    .line 452
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColorSet:Z

    .line 453
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColorSet:Z

    .line 454
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColorSet:Z

    .line 455
    iput-boolean v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColorSet:Z

    .line 481
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    .line 482
    sget v5, Lcom/afollestad/materialdialogs/R$color;->md_material_blue_600:I

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v1

    .line 485
    .local v1, "materialBlue":I
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->colorAccent:I

    invoke-static {p1, v5, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v5

    iput v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 486
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v9, :cond_78

    .line 487
    const v5, 0x1010435

    iget v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v5

    iput v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 490
    :cond_78
    iget v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    .line 491
    iget v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    .line 492
    iget v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    .line 493
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_link_color:I

    iget v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    invoke-static {p1, v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v5

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->linkColor:Landroid/content/res/ColorStateList;

    .line 496
    const/4 v0, 0x0

    .line 497
    .local v0, "fallback":I
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v9, :cond_aa

    .line 498
    const v5, 0x101042c

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    .line 499
    :cond_aa
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_btn_ripple_color:I

    sget v6, Lcom/afollestad/materialdialogs/R$attr;->colorControlHighlight:I

    invoke-static {p1, v6, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v6

    invoke-static {p1, v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;II)I

    move-result v5

    iput v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonRippleColor:I

    .line 502
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    .line 503
    const-string v5, "%1d/%2d"

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    .line 506
    const v5, 0x1010036

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v3

    .line 507
    .local v3, "primaryTextColor":I
    invoke-static {v3}, Lcom/afollestad/materialdialogs/util/DialogUtils;->isColorDark(I)Z

    move-result v5

    if-eqz v5, :cond_136

    sget-object v5, Lcom/afollestad/materialdialogs/Theme;->LIGHT:Lcom/afollestad/materialdialogs/Theme;

    :goto_d1
    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 510
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->checkSingleton()V

    .line 513
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_title_gravity:I

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 514
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_content_gravity:I

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 515
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_btnstacked_gravity:I

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 516
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_items_gravity:I

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 517
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_buttons_gravity:I

    iget-object v6, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {p1, v5, v6}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveGravityEnum(Landroid/content/Context;ILcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/GravityEnum;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 519
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_medium_font:I

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    .line 520
    .local v2, "mediumFont":Ljava/lang/String;
    sget v5, Lcom/afollestad/materialdialogs/R$attr;->md_regular_font:I

    invoke-static {p1, v5}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v4

    .line 521
    .local v4, "regularFont":Ljava/lang/String;
    invoke-virtual {p0, v2, v4}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->typeface(Ljava/lang/String;Ljava/lang/String;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 523
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    if-nez v5, :cond_128

    .line 525
    :try_start_11b
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v9, :cond_139

    .line 526
    const-string v5, "sans-serif-medium"

    const/4 v6, 0x0

    invoke-static {v5, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;
    :try_end_128
    .catch Ljava/lang/Exception; {:try_start_11b .. :try_end_128} :catch_143

    .line 532
    :cond_128
    :goto_128
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    if-nez v5, :cond_135

    .line 534
    :try_start_12c
    const-string v5, "sans-serif"

    const/4 v6, 0x0

    invoke-static {v5, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;
    :try_end_135
    .catch Ljava/lang/Exception; {:try_start_12c .. :try_end_135} :catch_145

    .line 538
    :cond_135
    :goto_135
    return-void

    .line 507
    .end local v2    # "mediumFont":Ljava/lang/String;
    .end local v4    # "regularFont":Ljava/lang/String;
    :cond_136
    sget-object v5, Lcom/afollestad/materialdialogs/Theme;->DARK:Lcom/afollestad/materialdialogs/Theme;

    goto :goto_d1

    .line 528
    .restart local v2    # "mediumFont":Ljava/lang/String;
    .restart local v4    # "regularFont":Ljava/lang/String;
    :cond_139
    :try_start_139
    const-string v5, "sans-serif"

    const/4 v6, 0x1

    invoke-static {v5, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    iput-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;
    :try_end_142
    .catch Ljava/lang/Exception; {:try_start_139 .. :try_end_142} :catch_143

    goto :goto_128

    .line 529
    :catch_143
    move-exception v5

    goto :goto_128

    .line 535
    :catch_145
    move-exception v5

    goto :goto_135
.end method

.method private checkSingleton()V
    .registers 3

    .prologue
    .line 541
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->get(Z)Lcom/afollestad/materialdialogs/internal/ThemeSingleton;

    move-result-object v1

    if-nez v1, :cond_8

    .line 582
    :goto_7
    return-void

    .line 542
    :cond_8
    invoke-static {}, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->get()Lcom/afollestad/materialdialogs/internal/ThemeSingleton;

    move-result-object v0

    .line 543
    .local v0, "s":Lcom/afollestad/materialdialogs/internal/ThemeSingleton;
    iget-boolean v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->darkTheme:Z

    if-eqz v1, :cond_14

    .line 544
    sget-object v1, Lcom/afollestad/materialdialogs/Theme;->DARK:Lcom/afollestad/materialdialogs/Theme;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 545
    :cond_14
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->titleColor:I

    if-eqz v1, :cond_1c

    .line 546
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->titleColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    .line 547
    :cond_1c
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->contentColor:I

    if-eqz v1, :cond_24

    .line 548
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->contentColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    .line 549
    :cond_24
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->positiveColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_2c

    .line 550
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->positiveColor:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    .line 551
    :cond_2c
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->neutralColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_34

    .line 552
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->neutralColor:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    .line 553
    :cond_34
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->negativeColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_3c

    .line 554
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->negativeColor:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    .line 555
    :cond_3c
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->itemColor:I

    if-eqz v1, :cond_44

    .line 556
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->itemColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    .line 557
    :cond_44
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_4c

    .line 558
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->icon:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 559
    :cond_4c
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->backgroundColor:I

    if-eqz v1, :cond_54

    .line 560
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->backgroundColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    .line 561
    :cond_54
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->dividerColor:I

    if-eqz v1, :cond_5c

    .line 562
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->dividerColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor:I

    .line 563
    :cond_5c
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorStacked:I

    if-eqz v1, :cond_64

    .line 564
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorStacked:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorStacked:I

    .line 565
    :cond_64
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->listSelector:I

    if-eqz v1, :cond_6c

    .line 566
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->listSelector:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listSelector:I

    .line 567
    :cond_6c
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorPositive:I

    if-eqz v1, :cond_74

    .line 568
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorPositive:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    .line 569
    :cond_74
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorNeutral:I

    if-eqz v1, :cond_7c

    .line 570
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorNeutral:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    .line 571
    :cond_7c
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorNegative:I

    if-eqz v1, :cond_84

    .line 572
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnSelectorNegative:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    .line 573
    :cond_84
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->widgetColor:I

    if-eqz v1, :cond_8c

    .line 574
    iget v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->widgetColor:I

    iput v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 575
    :cond_8c
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->linkColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_94

    .line 576
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->linkColor:Landroid/content/res/ColorStateList;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->linkColor:Landroid/content/res/ColorStateList;

    .line 577
    :cond_94
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 578
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 579
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 580
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 581
    iget-object v1, v0, Lcom/afollestad/materialdialogs/internal/ThemeSingleton;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

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
    .line 1194
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 1195
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set adapter() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1196
    :cond_c
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->adapter:Landroid/widget/ListAdapter;

    .line 1197
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackCustom:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    .line 1198
    return-object p0
.end method

.method public alwaysCallInputCallback()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 1327
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallInputCallback:Z

    .line 1328
    return-object p0
.end method

.method public alwaysCallMultiChoiceCallback()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 861
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallMultiChoiceCallback:Z

    .line 862
    return-object p0
.end method

.method public alwaysCallSingleChoiceCallback()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 833
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallSingleChoiceCallback:Z

    .line 834
    return-object p0
.end method

.method public autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "dismiss"    # Z

    .prologue
    .line 1182
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss:Z

    .line 1183
    return-object p0
.end method

.method public backgroundColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 1121
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->backgroundColor:I

    .line 1122
    return-object p0
.end method

.method public backgroundColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 1130
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
    .line 1126
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

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
    .line 978
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    .line 979
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    .line 980
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    .line 981
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
    .line 985
    sget-object v0, Lcom/afollestad/materialdialogs/MaterialDialog$4;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p2}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_14

    .line 987
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorPositive:I

    .line 996
    :goto_d
    return-object p0

    .line 990
    :pswitch_e
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNeutral:I

    goto :goto_d

    .line 993
    :pswitch_11
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorNegative:I

    goto :goto_d

    .line 985
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
    .line 973
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnSelectorStacked:I

    .line 974
    return-object p0
.end method

.method public btnStackedGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1006
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->btnStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 1007
    return-object p0
.end method

.method public build()Lcom/afollestad/materialdialogs/MaterialDialog;
    .registers 2
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1333
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {v0, p0}, Lcom/afollestad/materialdialogs/MaterialDialog;-><init>(Lcom/afollestad/materialdialogs/MaterialDialog$Builder;)V

    return-object v0
.end method

.method public buttonRippleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 600
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonRippleColor:I

    .line 601
    return-object p0
.end method

.method public buttonRippleColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 609
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonRippleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public buttonRippleColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 605
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonRippleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public buttonsGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 805
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->buttonsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 806
    return-object p0
.end method

.method public callback(Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1134
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->callback:Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;

    .line 1135
    return-object p0
.end method

.method public cancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnCancelListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1229
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelListener:Landroid/content/DialogInterface$OnCancelListener;

    .line 1230
    return-object p0
.end method

.method public cancelable(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "cancelable"    # Z

    .prologue
    .line 1164
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->cancelable:Z

    .line 1165
    return-object p0
.end method

.method public canceledOnTouchOutside(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "canceledOnTouchOutside"    # Z

    .prologue
    .line 1169
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->canceledOnTouchOutside:Z

    .line 1170
    return-object p0
.end method

.method public content(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "contentRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 678
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 679
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
    .line 690
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 691
    return-object p0
.end method

.method public content(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "content"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 683
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 684
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set content() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 685
    :cond_c
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content:Ljava/lang/CharSequence;

    .line 686
    return-object p0
.end method

.method public contentColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 695
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor:I

    .line 696
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColorSet:Z

    .line 697
    return-object p0
.end method

.method public contentColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 706
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 707
    return-object p0
.end method

.method public contentColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 701
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 702
    return-object p0
.end method

.method public contentGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 711
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 712
    return-object p0
.end method

.method public contentLineSpacing(F)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "multiplier"    # F

    .prologue
    .line 716
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->contentLineSpacingMultiplier:F

    .line 717
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
    .line 1011
    iget-object v1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 1012
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
    .line 1016
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content:Ljava/lang/CharSequence;

    if-eqz v0, :cond_c

    .line 1017
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use customView() when you have content set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1018
    :cond_c
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_18

    .line 1019
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use customView() when you have items set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1020
    :cond_18
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    if-eqz v0, :cond_24

    .line 1021
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use customView() with an input dialog"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1022
    :cond_24
    iget v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    const/4 v1, -0x2

    if-gt v0, v1, :cond_2d

    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    if-eqz v0, :cond_35

    .line 1023
    :cond_2d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot use customView() with a progress dialog"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1024
    :cond_35
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_4c

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4c

    .line 1025
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1026
    :cond_4c
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    .line 1027
    iput-boolean p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->wrapCustomViewInScroll:Z

    .line 1028
    return-object p0
.end method

.method public dismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnDismissListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1224
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 1225
    return-object p0
.end method

.method public dividerColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 1107
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor:I

    .line 1108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColorSet:Z

    .line 1109
    return-object p0
.end method

.method public dividerColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 1117
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
    .line 1113
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->dividerColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public forceStacking(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "stacked"    # Z

    .prologue
    .line 1239
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->forceStacking:Z

    .line 1240
    return-object p0
.end method

.method public final getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 469
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    return-object v0
.end method

.method public final getItemColor()I
    .registers 2

    .prologue
    .line 473
    iget v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    return v0
.end method

.method public final getRegularFont()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 477
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
    .line 663
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 664
    return-object p0
.end method

.method public iconAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "iconAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 673
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 674
    return-object p0
.end method

.method public iconRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "icon"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 668
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/support/v4/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->icon:Landroid/graphics/drawable/Drawable;

    .line 669
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
    .line 1262
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

    .line 1258
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
    .line 1254
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
    .line 1244
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 1245
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set content() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1246
    :cond_c
    iput-object p4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    .line 1247
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputHint:Ljava/lang/CharSequence;

    .line 1248
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputPrefill:Ljava/lang/CharSequence;

    .line 1249
    iput-boolean p3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputAllowEmpty:Z

    .line 1250
    return-object p0
.end method

.method public inputMaxLength(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "maxLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x1L
            to = 0x7fffffffL
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1275
    invoke-virtual {p0, v0, p1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRange(III)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public inputMaxLength(II)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "maxLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x1L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p2, "errorColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1283
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRange(III)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public inputMaxLengthRes(II)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "maxLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x1L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p2, "errorColor"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1291
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRangeRes(III)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public inputRange(II)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "minLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p2, "maxLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = -0x1L
            to = 0x7fffffffL
        .end annotation
    .end param

    .prologue
    .line 1296
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRange(III)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public inputRange(III)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 6
    .param p1, "minLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p2, "maxLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = -0x1L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p3, "errorColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 1305
    if-gez p1, :cond_a

    .line 1306
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Min length for input dialogs cannot be less than 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1307
    :cond_a
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMinLength:I

    .line 1308
    iput p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputMaxLength:I

    .line 1309
    if-nez p3, :cond_1b

    .line 1310
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    sget v1, Lcom/afollestad/materialdialogs/R$color;->md_edittext_error:I

    invoke-static {v0, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRangeErrorColor:I

    .line 1314
    :goto_1a
    return-object p0

    .line 1312
    :cond_1b
    iput p3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRangeErrorColor:I

    goto :goto_1a
.end method

.method public inputRangeRes(III)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "minLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p2, "maxLength"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x1L
            to = 0x7fffffffL
        .end annotation
    .end param
    .param p3, "errorColor"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 1323
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p3}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputRange(III)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public inputType(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 1266
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputType:I

    .line 1267
    return-object p0
.end method

.method public itemColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 763
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public itemColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 787
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public itemColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 775
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

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
    .line 734
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 735
    return-object p0
.end method

.method public items(Ljava/util/Collection;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 7
    .param p1, "collection"    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 721
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v4

    if-lez v4, :cond_27

    .line 722
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v4

    new-array v0, v4, [Ljava/lang/String;

    .line 723
    .local v0, "array":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 724
    .local v1, "i":I
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 725
    .local v3, "obj":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v1

    .line 726
    add-int/lit8 v1, v1, 0x1

    .line 727
    goto :goto_11

    .line 728
    .end local v3    # "obj":Ljava/lang/Object;
    :cond_24
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 730
    .end local v0    # "array":[Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_27
    return-object p0
.end method

.method public varargs items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "items"    # [Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 739
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 740
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set items() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 741
    :cond_c
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items:[Ljava/lang/CharSequence;

    .line 742
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

    .line 746
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    .line 747
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    .line 748
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    .line 749
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

    .line 846
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndices:[Ljava/lang/Integer;

    .line 847
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    .line 848
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    .line 849
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    .line 850
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

    .line 818
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->selectedIndex:I

    .line 819
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallback:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;

    .line 820
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackSingleChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackSingleChoice;

    .line 821
    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listCallbackMultiChoice:Lcom/afollestad/materialdialogs/MaterialDialog$ListCallbackMultiChoice;

    .line 822
    return-object p0
.end method

.method public itemsColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 753
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColor:I

    .line 754
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemColorSet:Z

    .line 755
    return-object p0
.end method

.method public itemsColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 779
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public itemsColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 767
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public itemsGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 791
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 792
    return-object p0
.end method

.method public itemsIds(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "idsArrayRes"    # I
        .annotation build Landroid/support/annotation/ArrayRes;
        .end annotation
    .end param

    .prologue
    .line 801
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsIds([I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public itemsIds([I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "idsArray"    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 796
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemIds:[I

    .line 797
    return-object p0
.end method

.method public keyListener(Landroid/content/DialogInterface$OnKeyListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnKeyListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1234
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->keyListener:Landroid/content/DialogInterface$OnKeyListener;

    .line 1235
    return-object p0
.end method

.method public limitIconToDefaultSize()Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2

    .prologue
    .line 1205
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->limitIconToDefaultSize:Z

    .line 1206
    return-object p0
.end method

.method public linkColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 951
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->linkColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public linkColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "colorStateList"    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 963
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->linkColor:Landroid/content/res/ColorStateList;

    .line 964
    return-object p0
.end method

.method public linkColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 959
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveActionTextColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->linkColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public linkColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 955
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getActionTextColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->linkColor(Landroid/content/res/ColorStateList;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public listSelector(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "selectorRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 968
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->listSelector:I

    .line 969
    return-object p0
.end method

.method public maxIconSize(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "maxIconSize"    # I

    .prologue
    .line 1210
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->maxIconSize:I

    .line 1211
    return-object p0
.end method

.method public maxIconSizeRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "maxIconSizeRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 1215
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
    .line 905
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
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 917
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColor:Landroid/content/res/ColorStateList;

    .line 918
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeColorSet:Z

    .line 919
    return-object p0
.end method

.method public negativeColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 913
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
    .line 909
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
    .line 923
    if-nez p1, :cond_3

    .line 924
    .end local p0    # "this":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    :goto_2
    return-object p0

    .restart local p0    # "this":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    :cond_3
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object p0

    goto :goto_2
.end method

.method public negativeText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "message"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 928
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText:Ljava/lang/CharSequence;

    .line 929
    return-object p0
.end method

.method public neutralColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 933
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
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 945
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColor:Landroid/content/res/ColorStateList;

    .line 946
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralColorSet:Z

    .line 947
    return-object p0
.end method

.method public neutralColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 941
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
    .line 937
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
    .line 895
    if-nez p1, :cond_3

    .line 896
    .end local p0    # "this":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    :goto_2
    return-object p0

    .restart local p0    # "this":Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    :cond_3
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object p0

    goto :goto_2
.end method

.method public neutralText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "message"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 900
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->neutralText:Ljava/lang/CharSequence;

    .line 901
    return-object p0
.end method

.method public onAny(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1154
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onAnyCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    .line 1155
    return-object p0
.end method

.method public onNegative(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1144
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNegativeCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    .line 1145
    return-object p0
.end method

.method public onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1149
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNeutralCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    .line 1150
    return-object p0
.end method

.method public onPositive(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "callback"    # Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1139
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onPositiveCallback:Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;

    .line 1140
    return-object p0
.end method

.method public positiveColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 877
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
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 889
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColor:Landroid/content/res/ColorStateList;

    .line 890
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveColorSet:Z

    .line 891
    return-object p0
.end method

.method public positiveColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 4
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 885
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
    .line 881
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
    .line 866
    if-nez p1, :cond_3

    .line 868
    :goto_2
    return-object p0

    .line 867
    :cond_3
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    goto :goto_2
.end method

.method public positiveText(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "message"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 872
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText:Ljava/lang/CharSequence;

    .line 873
    return-object p0
.end method

.method public progress(ZI)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "indeterminate"    # Z
    .param p2, "max"    # I

    .prologue
    .line 1039
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->customView:Landroid/view/View;

    if-eqz v0, :cond_c

    .line 1040
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You cannot set progress() when you\'re using a custom view."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1041
    :cond_c
    if-eqz p1, :cond_15

    .line 1042
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    .line 1043
    const/4 v0, -0x2

    iput v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    .line 1049
    :goto_14
    return-object p0

    .line 1045
    :cond_15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateProgress:Z

    .line 1046
    const/4 v0, -0x1

    iput v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress:I

    .line 1047
    iput p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressMax:I

    goto :goto_14
.end method

.method public progress(ZIZ)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 5
    .param p1, "indeterminate"    # Z
    .param p2, "max"    # I
    .param p3, "showMinMax"    # Z

    .prologue
    .line 1061
    iput-boolean p3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showMinMax:Z

    .line 1062
    invoke-virtual {p0, p1, p2}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progress(ZI)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public progressIndeterminateStyle(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "horizontal"    # Z

    .prologue
    .line 1088
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->indeterminateIsHorizontalProgress:Z

    .line 1089
    return-object p0
.end method

.method public progressNumberFormat(Ljava/lang/String;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "format"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1070
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressNumberFormat:Ljava/lang/String;

    .line 1071
    return-object p0
.end method

.method public progressPercentFormat(Ljava/text/NumberFormat;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "format"    # Ljava/text/NumberFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1079
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->progressPercentFormat:Ljava/text/NumberFormat;

    .line 1080
    return-object p0
.end method

.method public show()Lcom/afollestad/materialdialogs/MaterialDialog;
    .registers 2
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 1338
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v0

    .line 1339
    .local v0, "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->show()V

    .line 1340
    return-object v0
.end method

.method public showListener(Landroid/content/DialogInterface$OnShowListener;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "listener"    # Landroid/content/DialogInterface$OnShowListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1219
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->showListener:Landroid/content/DialogInterface$OnShowListener;

    .line 1220
    return-object p0
.end method

.method public theme(Lcom/afollestad/materialdialogs/Theme;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "theme"    # Lcom/afollestad/materialdialogs/Theme;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1159
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->theme:Lcom/afollestad/materialdialogs/Theme;

    .line 1160
    return-object p0
.end method

.method public title(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "titleRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 585
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    .line 586
    return-object p0
.end method

.method public title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 590
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title:Ljava/lang/CharSequence;

    .line 591
    return-object p0
.end method

.method public titleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 613
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor:I

    .line 614
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColorSet:Z

    .line 615
    return-object p0
.end method

.method public titleColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 623
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->resolveColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public titleColorRes(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 619
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public titleGravity(Lcom/afollestad/materialdialogs/GravityEnum;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 595
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->titleGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 596
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
    .line 635
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    .line 636
    iput-object p2, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    .line 637
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
    .line 649
    if-eqz p1, :cond_27

    .line 650
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    .line 651
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->mediumFont:Landroid/graphics/Typeface;

    if-nez v0, :cond_27

    .line 652
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

    .line 654
    :cond_27
    if-eqz p2, :cond_4e

    .line 655
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p2}, Lcom/afollestad/materialdialogs/util/TypefaceHelper;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    .line 656
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->regularFont:Landroid/graphics/Typeface;

    if-nez v0, :cond_4e

    .line 657
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

    .line 659
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
    .line 1093
    iput p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor:I

    .line 1094
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColorSet:Z

    .line 1095
    return-object p0
.end method

.method public widgetColorAttr(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;
    .registers 3
    .param p1, "colorAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 1103
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
    .line 1099
    iget-object v0, p0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->context:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/util/DialogUtils;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->widgetColor(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    return-object v0
.end method
