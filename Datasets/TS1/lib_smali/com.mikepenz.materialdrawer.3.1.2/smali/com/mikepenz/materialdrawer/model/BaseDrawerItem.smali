.class public abstract Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;
.super Ljava/lang/Object;
.source "BaseDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Checkable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Tagable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Nameable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Iconable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Checkable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Tagable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private checkable:Z

.field private disabledIconColor:I

.field private disabledIconColorRes:I

.field private disabledTextColor:I

.field private disabledTextColorRes:I

.field private enabled:Z

.field private icon:Landroid/graphics/drawable/Drawable;

.field private iconColor:I

.field private iconColorRes:I

.field private iconRes:I

.field private iconTinted:Z

.field private identifier:I

.field private iicon:Lcom/mikepenz/iconics/typeface/IIcon;

.field private name:Ljava/lang/String;

.field private nameRes:I

.field private selectedColor:I

.field private selectedColorRes:I

.field private selectedIcon:Landroid/graphics/drawable/Drawable;

.field private selectedIconColor:I

.field private selectedIconColorRes:I

.field private selectedIconRes:I

.field private selectedTextColor:I

.field private selectedTextColorRes:I

.field private tag:Ljava/lang/Object;

.field private textColor:I

.field private textColorRes:I

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->identifier:I

    .line 22
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconRes:I

    .line 25
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconRes:I

    .line 27
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->nameRes:I

    .line 28
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->enabled:Z

    .line 29
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->checkable:Z

    .line 32
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    .line 34
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColor:I

    .line 35
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColorRes:I

    .line 37
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColor:I

    .line 38
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColorRes:I

    .line 39
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColor:I

    .line 40
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColorRes:I

    .line 41
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColor:I

    .line 42
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColorRes:I

    .line 44
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColor:I

    .line 45
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColorRes:I

    .line 46
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColor:I

    .line 47
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColorRes:I

    .line 48
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColor:I

    .line 49
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColorRes:I

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-void
.end method


# virtual methods
.method public getDisabledIconColor()I
    .registers 2

    .prologue
    .line 396
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColor:I

    return v0
.end method

.method public getDisabledIconColorRes()I
    .registers 2

    .prologue
    .line 388
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColorRes:I

    return v0
.end method

.method public getDisabledTextColor()I
    .registers 2

    .prologue
    .line 268
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColor:I

    return v0
.end method

.method public getDisabledTextColorRes()I
    .registers 2

    .prologue
    .line 276
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColorRes:I

    return v0
.end method

.method public getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;
    .registers 2

    .prologue
    .line 327
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iicon:Lcom/mikepenz/iconics/typeface/IIcon;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 302
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIconColor()I
    .registers 2

    .prologue
    .line 428
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColor:I

    return v0
.end method

.method public getIconColorRes()I
    .registers 2

    .prologue
    .line 420
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColorRes:I

    return v0
.end method

.method public getIconRes()I
    .registers 2

    .prologue
    .line 311
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconRes:I

    return v0
.end method

.method public getIdentifier()I
    .registers 2

    .prologue
    .line 365
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->identifier:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 344
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNameRes()I
    .registers 2

    .prologue
    .line 354
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->nameRes:I

    return v0
.end method

.method public getSelectedColor()I
    .registers 2

    .prologue
    .line 220
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColor:I

    return v0
.end method

.method public getSelectedColorRes()I
    .registers 2

    .prologue
    .line 228
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColorRes:I

    return v0
.end method

.method public getSelectedIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 336
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getSelectedIconColor()I
    .registers 2

    .prologue
    .line 412
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColor:I

    return v0
.end method

.method public getSelectedIconColorRes()I
    .registers 2

    .prologue
    .line 404
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColorRes:I

    return v0
.end method

.method public getSelectedIconRes()I
    .registers 2

    .prologue
    .line 319
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconRes:I

    return v0
.end method

.method public getSelectedTextColor()I
    .registers 2

    .prologue
    .line 252
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColor:I

    return v0
.end method

.method public getSelectedTextColorRes()I
    .registers 2

    .prologue
    .line 260
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColorRes:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 293
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 236
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColor:I

    return v0
.end method

.method public getTextColorRes()I
    .registers 2

    .prologue
    .line 244
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColorRes:I

    return v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 436
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public isCheckable()Z
    .registers 2

    .prologue
    .line 379
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->checkable:Z

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 374
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->enabled:Z

    return v0
.end method

.method public isIconTinted()Z
    .registers 2

    .prologue
    .line 284
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    return v0
.end method

.method public setCheckable(Z)V
    .registers 2
    .param p1, "checkable"    # Z

    .prologue
    .line 384
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->checkable:Z

    .line 385
    return-void
.end method

.method public setDisabledIconColor(I)V
    .registers 2
    .param p1, "disabledIconColor"    # I

    .prologue
    .line 400
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColor:I

    .line 401
    return-void
.end method

.method public setDisabledIconColorRes(I)V
    .registers 2
    .param p1, "disabledIconColorRes"    # I

    .prologue
    .line 392
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColorRes:I

    .line 393
    return-void
.end method

.method public setDisabledTextColor(I)V
    .registers 2
    .param p1, "disabledTextColor"    # I

    .prologue
    .line 272
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColor:I

    .line 273
    return-void
.end method

.method public setDisabledTextColorRes(I)V
    .registers 2
    .param p1, "disabledTextColorRes"    # I

    .prologue
    .line 280
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColorRes:I

    .line 281
    return-void
.end method

.method public setEnabled(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->enabled:Z

    .line 112
    return-object p0
.end method

.method public setIIcon(Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 2
    .param p1, "iicon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 332
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iicon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 333
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 307
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 308
    return-void
.end method

.method public setIconColor(I)V
    .registers 2
    .param p1, "iconColor"    # I

    .prologue
    .line 432
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColor:I

    .line 433
    return-void
.end method

.method public setIconColorRes(I)V
    .registers 2
    .param p1, "iconColorRes"    # I

    .prologue
    .line 424
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColorRes:I

    .line 425
    return-void
.end method

.method public setIconRes(I)V
    .registers 2
    .param p1, "iconRes"    # I

    .prologue
    .line 315
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconRes:I

    .line 316
    return-void
.end method

.method public setIconTinted(Z)V
    .registers 2
    .param p1, "iconTinted"    # Z

    .prologue
    .line 288
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    .line 289
    return-void
.end method

.method public setIdentifier(I)V
    .registers 2
    .param p1, "identifier"    # I

    .prologue
    .line 369
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->identifier:I

    .line 370
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 349
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Ljava/lang/String;

    .line 350
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->nameRes:I

    .line 351
    return-void
.end method

.method public setNameRes(I)V
    .registers 3
    .param p1, "nameRes"    # I

    .prologue
    .line 359
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->nameRes:I

    .line 360
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Ljava/lang/String;

    .line 361
    return-void
.end method

.method public setSelectedColor(I)V
    .registers 2
    .param p1, "selectedColor"    # I

    .prologue
    .line 224
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColor:I

    .line 225
    return-void
.end method

.method public setSelectedColorRes(I)V
    .registers 2
    .param p1, "selectedColorRes"    # I

    .prologue
    .line 232
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColorRes:I

    .line 233
    return-void
.end method

.method public setSelectedIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "selectedIcon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 340
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIcon:Landroid/graphics/drawable/Drawable;

    .line 341
    return-void
.end method

.method public setSelectedIconColor(I)V
    .registers 2
    .param p1, "selectedIconColor"    # I

    .prologue
    .line 416
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColor:I

    .line 417
    return-void
.end method

.method public setSelectedIconColorRes(I)V
    .registers 2
    .param p1, "selectedIconColorRes"    # I

    .prologue
    .line 408
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColorRes:I

    .line 409
    return-void
.end method

.method public setSelectedIconRes(I)V
    .registers 2
    .param p1, "selectedIconRes"    # I

    .prologue
    .line 323
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconRes:I

    .line 324
    return-void
.end method

.method public setSelectedTextColor(I)V
    .registers 2
    .param p1, "selectedTextColor"    # I

    .prologue
    .line 256
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColor:I

    .line 257
    return-void
.end method

.method public setSelectedTextColorRes(I)V
    .registers 2
    .param p1, "selectedTextColorRes"    # I

    .prologue
    .line 264
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColorRes:I

    .line 265
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .registers 2
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 298
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->tag:Ljava/lang/Object;

    .line 299
    return-void
.end method

.method public setTextColor(I)V
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 240
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColor:I

    .line 241
    return-void
.end method

.method public setTextColorRes(I)V
    .registers 2
    .param p1, "textColorRes"    # I

    .prologue
    .line 248
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColorRes:I

    .line 249
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 440
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 441
    return-void
.end method

.method public withCheckable(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "checkable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->checkable:Z

    .line 102
    return-object p0
.end method

.method public withDisabledIconColor(I)Ljava/lang/Object;
    .registers 2
    .param p1, "disabledIconColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColor:I

    .line 177
    return-object p0
.end method

.method public withDisabledIconColorRes(I)Ljava/lang/Object;
    .registers 2
    .param p1, "disabledIconColorRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 181
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColorRes:I

    .line 182
    return-object p0
.end method

.method public withDisabledTextColor(I)Ljava/lang/Object;
    .registers 2
    .param p1, "disabledTextColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColor:I

    .line 147
    return-object p0
.end method

.method public withDisabledTextColorRes(I)Ljava/lang/Object;
    .registers 2
    .param p1, "disabledTextColorRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 151
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColorRes:I

    .line 152
    return-object p0
.end method

.method public withEnabled(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->enabled:Z

    .line 107
    return-object p0
.end method

.method public withIcon(I)Ljava/lang/Object;
    .registers 2
    .param p1, "iconRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconRes:I

    .line 65
    return-object p0
.end method

.method public withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 60
    return-object p0
.end method

.method public withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Ljava/lang/Object;
    .registers 2
    .param p1, "iicon"    # Lcom/mikepenz/iconics/typeface/IIcon;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/iconics/typeface/IIcon;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iicon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 70
    return-object p0
.end method

.method public withIconColor(I)Ljava/lang/Object;
    .registers 2
    .param p1, "iconColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColor:I

    .line 157
    return-object p0
.end method

.method public withIconColorRes(I)Ljava/lang/Object;
    .registers 2
    .param p1, "iconColorRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 161
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColorRes:I

    .line 162
    return-object p0
.end method

.method public withIconTinted(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "iconTinted"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 199
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    .line 200
    return-object p0
.end method

.method public withIconTintingEnabled(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "iconTintingEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 193
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    .line 194
    return-object p0
.end method

.method public withIdentifier(I)Ljava/lang/Object;
    .registers 2
    .param p1, "identifier"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->identifier:I

    .line 55
    return-object p0
.end method

.method public withName(I)Ljava/lang/Object;
    .registers 3
    .param p1, "nameRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->nameRes:I

    .line 91
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Ljava/lang/String;

    .line 92
    return-object p0
.end method

.method public withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Ljava/lang/String;

    .line 85
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->nameRes:I

    .line 86
    return-object p0
.end method

.method public withSelectedColor(I)Ljava/lang/Object;
    .registers 2
    .param p1, "selectedColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColor:I

    .line 117
    return-object p0
.end method

.method public withSelectedColorRes(I)Ljava/lang/Object;
    .registers 2
    .param p1, "selectedColorRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColorRes:I

    .line 122
    return-object p0
.end method

.method public withSelectedIcon(I)Ljava/lang/Object;
    .registers 2
    .param p1, "selectedIconRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconRes:I

    .line 80
    return-object p0
.end method

.method public withSelectedIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 2
    .param p1, "selectedIcon"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIcon:Landroid/graphics/drawable/Drawable;

    .line 75
    return-object p0
.end method

.method public withSelectedIconColor(I)Ljava/lang/Object;
    .registers 2
    .param p1, "selectedIconColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColor:I

    .line 167
    return-object p0
.end method

.method public withSelectedIconColorRes(I)Ljava/lang/Object;
    .registers 2
    .param p1, "selectedColorRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 171
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColorRes:I

    .line 172
    return-object p0
.end method

.method public withSelectedTextColor(I)Ljava/lang/Object;
    .registers 2
    .param p1, "selectedTextColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 136
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColor:I

    .line 137
    return-object p0
.end method

.method public withSelectedTextColorRes(I)Ljava/lang/Object;
    .registers 2
    .param p1, "selectedColorRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 141
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColorRes:I

    .line 142
    return-object p0
.end method

.method public withTag(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->tag:Ljava/lang/Object;

    .line 97
    return-object p0
.end method

.method public withTextColor(I)Ljava/lang/Object;
    .registers 2
    .param p1, "textColor"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColor:I

    .line 127
    return-object p0
.end method

.method public withTextColorRes(I)Ljava/lang/Object;
    .registers 2
    .param p1, "textColorRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColorRes:I

    .line 132
    return-object p0
.end method

.method public withTintSelectedIcon(Z)Ljava/lang/Object;
    .registers 3
    .param p1, "iconTinted"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->withIconTintingEnabled(Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Ljava/lang/Object;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Typeface;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 215
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 216
    return-object p0
.end method
