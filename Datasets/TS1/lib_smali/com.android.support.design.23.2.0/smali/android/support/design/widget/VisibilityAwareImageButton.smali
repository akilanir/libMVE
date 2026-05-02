.class Landroid/support/design/widget/VisibilityAwareImageButton;
.super Landroid/support/v7/widget/AppCompatImageButton;
.source "VisibilityAwareImageButton.java"


# instance fields
.field private mUserSetVisibility:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/VisibilityAwareImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/design/widget/VisibilityAwareImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/AppCompatImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    invoke-virtual {p0}, Landroid/support/design/widget/VisibilityAwareImageButton;->getVisibility()I

    move-result v0

    iput v0, p0, Landroid/support/design/widget/VisibilityAwareImageButton;->mUserSetVisibility:I

    .line 39
    return-void
.end method


# virtual methods
.method final getUserSetVisibility()I
    .registers 2

    .prologue
    .line 54
    iget v0, p0, Landroid/support/design/widget/VisibilityAwareImageButton;->mUserSetVisibility:I

    return v0
.end method

.method final internalSetVisibility(IZ)V
    .registers 3
    .param p1, "visibility"    # I
    .param p2, "fromUser"    # Z

    .prologue
    .line 47
    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatImageButton;->setVisibility(I)V

    .line 48
    if-eqz p2, :cond_7

    .line 49
    iput p1, p0, Landroid/support/design/widget/VisibilityAwareImageButton;->mUserSetVisibility:I

    .line 51
    :cond_7
    return-void
.end method

.method public setVisibility(I)V
    .registers 3
    .param p1, "visibility"    # I

    .prologue
    .line 43
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/support/design/widget/VisibilityAwareImageButton;->internalSetVisibility(IZ)V

    .line 44
    return-void
.end method
