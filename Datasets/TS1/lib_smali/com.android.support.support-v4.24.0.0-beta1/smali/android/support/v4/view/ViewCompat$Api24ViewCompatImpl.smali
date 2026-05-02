.class Landroid/support/v4/view/ViewCompat$Api24ViewCompatImpl;
.super Landroid/support/v4/view/ViewCompat$MarshmallowViewCompatImpl;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Api24ViewCompatImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1774
    invoke-direct {p0}, Landroid/support/v4/view/ViewCompat$MarshmallowViewCompatImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public hasPointerCapture(Landroid/view/View;)Z
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1782
    invoke-static {p1}, Landroid/support/v4/view/ViewCompatApi24;->hasPointerCapture(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method public releasePointerCapture(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1787
    invoke-static {p1}, Landroid/support/v4/view/ViewCompatApi24;->releasePointerCapture(Landroid/view/View;)V

    .line 1788
    return-void
.end method

.method public setPointerCapture(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1777
    invoke-static {p1}, Landroid/support/v4/view/ViewCompatApi24;->setPointerCapture(Landroid/view/View;)V

    .line 1778
    return-void
.end method

.method public setPointerIcon(Landroid/view/View;Landroid/support/v4/view/PointerIconCompat;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "pointerIconCompat"    # Landroid/support/v4/view/PointerIconCompat;

    .prologue
    .line 1792
    invoke-virtual {p2}, Landroid/support/v4/view/PointerIconCompat;->getPointerIcon()Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompatApi24;->setPointerIcon(Landroid/view/View;Ljava/lang/Object;)V

    .line 1793
    return-void
.end method
