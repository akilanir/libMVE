.class public Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;
.super Ljava/lang/Object;
.source "RippleForegroundListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private rippleViewId:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "rippleViewId"    # I

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;->rippleViewId:I

    .line 18
    iput p1, p0, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;->rippleViewId:I

    .line 19
    return-void
.end method


# virtual methods
.method public findRippleView(Landroid/view/View;)Landroid/view/View;
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget v1, p0, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;->rippleViewId:I

    if-ne v0, v1, :cond_9

    .line 62
    .end local p1    # "view":Landroid/view/View;
    :goto_8
    return-object p1

    .line 59
    .restart local p1    # "view":Landroid/view/View;
    :cond_9
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_1c

    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;->findRippleView(Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    goto :goto_8

    .line 62
    :cond_1c
    const/4 p1, 0x0

    goto :goto_8
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 26
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v4

    int-to-float v4, v4

    add-float v1, v3, v4

    .line 27
    .local v1, "x":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v4

    int-to-float v4, v4

    add-float v2, v3, v4

    .line 29
    .local v2, "y":F
    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/util/RippleForegroundListener;->findRippleView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    .line 31
    .local v0, "rippleView":Landroid/view/View;
    if-nez v0, :cond_1e

    .line 52
    :goto_1d
    return v5

    .line 35
    :cond_1e
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_27

    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->drawableHotspotChanged(FF)V

    .line 41
    :cond_27
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    packed-switch v3, :pswitch_data_38

    :pswitch_2e
    goto :goto_1d

    .line 43
    :pswitch_2f
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/view/View;->setPressed(Z)V

    goto :goto_1d

    .line 47
    :pswitch_34
    invoke-virtual {v0, v5}, Landroid/view/View;->setPressed(Z)V

    goto :goto_1d

    .line 41
    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_34
        :pswitch_2e
        :pswitch_34
    .end packed-switch
.end method
