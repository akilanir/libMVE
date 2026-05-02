.class public Lcom/rey/material/drawable/ThemeDrawable;
.super Landroid/graphics/drawable/LevelListDrawable;
.source "ThemeDrawable.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# instance fields
.field private mStyleId:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "styleId"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/graphics/drawable/LevelListDrawable;-><init>()V

    .line 15
    iput p1, p0, Lcom/rey/material/drawable/ThemeDrawable;->mStyleId:I

    .line 17
    iget v0, p0, Lcom/rey/material/drawable/ThemeDrawable;->mStyleId:I

    if-eqz v0, :cond_13

    .line 18
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 19
    invoke-direct {p0}, Lcom/rey/material/drawable/ThemeDrawable;->initDrawables()V

    .line 21
    :cond_13
    return-void
.end method

.method private initDrawables()V
    .registers 7

    .prologue
    .line 24
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v3

    .line 25
    .local v3, "themeManager":Lcom/rey/material/app/ThemeManager;
    invoke-virtual {v3}, Lcom/rey/material/app/ThemeManager;->getThemeCount()I

    move-result v0

    .line 27
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    if-ge v2, v0, :cond_23

    .line 28
    invoke-virtual {v3}, Lcom/rey/material/app/ThemeManager;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v5, p0, Lcom/rey/material/drawable/ThemeDrawable;->mStyleId:I

    invoke-virtual {v3, v5, v2}, Lcom/rey/material/app/ThemeManager;->getStyle(II)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 29
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0, v2, v2, v1}, Lcom/rey/material/drawable/ThemeDrawable;->addLevel(IILandroid/graphics/drawable/Drawable;)V

    .line 27
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 32
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_23
    invoke-virtual {v3}, Lcom/rey/material/app/ThemeManager;->getCurrentTheme()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/rey/material/drawable/ThemeDrawable;->setLevel(I)Z

    .line 33
    return-void
.end method


# virtual methods
.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/rey/material/drawable/ThemeDrawable;->getLevel()I

    move-result v0

    iget v1, p1, Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;->theme:I

    if-eq v0, v1, :cond_d

    .line 38
    iget v0, p1, Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;->theme:I

    invoke-virtual {p0, v0}, Lcom/rey/material/drawable/ThemeDrawable;->setLevel(I)Z

    .line 39
    :cond_d
    return-void
.end method
