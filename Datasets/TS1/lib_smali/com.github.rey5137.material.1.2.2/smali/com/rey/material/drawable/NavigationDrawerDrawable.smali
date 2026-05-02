.class public Lcom/rey/material/drawable/NavigationDrawerDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "NavigationDrawerDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;
    }
.end annotation


# static fields
.field public static final STATE_ARROW:I = 0x1

.field public static final STATE_DRAWER:I


# instance fields
.field private mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

.field private mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;


# direct methods
.method public constructor <init>(Lcom/rey/material/drawable/ToolbarRippleDrawable;Lcom/rey/material/drawable/LineMorphingDrawable;)V
    .registers 4
    .param p1, "rippleDrawable"    # Lcom/rey/material/drawable/ToolbarRippleDrawable;
    .param p2, "lineDrawable"    # Lcom/rey/material/drawable/LineMorphingDrawable;

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    .line 23
    iput-object p2, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    .line 25
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    invoke-virtual {v0, p0}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 26
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p0}, Lcom/rey/material/drawable/LineMorphingDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 27
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 48
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/LineMorphingDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 49
    return-void
.end method

.method public getIconAnimProgress()F
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/LineMorphingDrawable;->getAnimProgress()F

    move-result v0

    return v0
.end method

.method public getIconState()I
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0}, Lcom/rey/material/drawable/LineMorphingDrawable;->getLineState()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 65
    const/4 v0, -0x3

    return v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/rey/material/drawable/NavigationDrawerDrawable;->invalidateSelf()V

    .line 83
    return-void
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 97
    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .registers 3
    .param p1, "state"    # [I

    .prologue
    .line 102
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->onStateChange([I)Z

    move-result v0

    return v0
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 5
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 87
    invoke-virtual {p0, p2, p3, p4}, Lcom/rey/material/drawable/NavigationDrawerDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 88
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 53
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setAlpha(I)V

    .line 54
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/LineMorphingDrawable;->setAlpha(I)V

    .line 55
    return-void
.end method

.method public setBounds(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 70
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setBounds(IIII)V

    .line 71
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/rey/material/drawable/LineMorphingDrawable;->setBounds(IIII)V

    .line 72
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 60
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/LineMorphingDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 61
    return-void
.end method

.method public setDither(Z)V
    .registers 3
    .param p1, "dither"    # Z

    .prologue
    .line 76
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/ToolbarRippleDrawable;->setDither(Z)V

    .line 77
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/LineMorphingDrawable;->setDither(Z)V

    .line 78
    return-void
.end method

.method public setIconState(IF)Z
    .registers 4
    .param p1, "state"    # I
    .param p2, "progress"    # F

    .prologue
    .line 38
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/drawable/LineMorphingDrawable;->setLineState(IF)Z

    move-result v0

    return v0
.end method

.method public switchIconState(IZ)V
    .registers 4
    .param p1, "state"    # I
    .param p2, "animation"    # Z

    .prologue
    .line 30
    iget-object v0, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/drawable/LineMorphingDrawable;->switchLineState(IZ)V

    .line 31
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 92
    invoke-virtual {p0, p2}, Lcom/rey/material/drawable/NavigationDrawerDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    .line 93
    return-void
.end method
