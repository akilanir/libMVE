.class public abstract Landroid/support/v4/animation/AnimatorCompatHelper;
.super Ljava/lang/Object;
.source "AnimatorCompatHelper.java"


# static fields
.field static IMPL:Landroid/support/v4/animation/AnimatorProvider;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 26
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xc

    if-lt v0, v1, :cond_e

    .line 27
    new-instance v0, Landroid/support/v4/animation/HoneycombMr1AnimatorCompatProvider;

    invoke-direct {v0}, Landroid/support/v4/animation/HoneycombMr1AnimatorCompatProvider;-><init>()V

    sput-object v0, Landroid/support/v4/animation/AnimatorCompatHelper;->IMPL:Landroid/support/v4/animation/AnimatorProvider;

    .line 31
    :goto_d
    return-void

    .line 29
    :cond_e
    new-instance v0, Landroid/support/v4/animation/DonutAnimatorCompatProvider;

    invoke-direct {v0}, Landroid/support/v4/animation/DonutAnimatorCompatProvider;-><init>()V

    sput-object v0, Landroid/support/v4/animation/AnimatorCompatHelper;->IMPL:Landroid/support/v4/animation/AnimatorProvider;

    goto :goto_d
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method public static emptyValueAnimator()Landroid/support/v4/animation/ValueAnimatorCompat;
    .registers 1

    .prologue
    .line 34
    sget-object v0, Landroid/support/v4/animation/AnimatorCompatHelper;->IMPL:Landroid/support/v4/animation/AnimatorProvider;

    invoke-interface {v0}, Landroid/support/v4/animation/AnimatorProvider;->emptyValueAnimator()Landroid/support/v4/animation/ValueAnimatorCompat;

    move-result-object v0

    return-object v0
.end method
