.class abstract Lcom/koushikdutta/ion/ContextReference;
.super Ljava/lang/ref/WeakReference;
.source "ContextReference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/ion/ContextReference$ImageViewContextReference;,
        Lcom/koushikdutta/ion/ContextReference$SupportFragmentContextReference;,
        Lcom/koushikdutta/ion/ContextReference$FragmentContextReference;,
        Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;,
        Lcom/koushikdutta/ion/ContextReference$ServiceContextReference;,
        Lcom/koushikdutta/ion/ContextReference$NormalContextReference;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/ref/WeakReference",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lcom/koushikdutta/ion/ContextReference;, "Lcom/koushikdutta/ion/ContextReference<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 21
    return-void
.end method

.method public static fromContext(Landroid/content/Context;)Lcom/koushikdutta/ion/ContextReference;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 165
    instance-of v0, p0, Landroid/app/Service;

    if-eqz v0, :cond_c

    .line 166
    new-instance v0, Lcom/koushikdutta/ion/ContextReference$ServiceContextReference;

    check-cast p0, Landroid/app/Service;

    .end local p0    # "context":Landroid/content/Context;
    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/ContextReference$ServiceContextReference;-><init>(Landroid/app/Service;)V

    .line 170
    .restart local p0    # "context":Landroid/content/Context;
    :goto_b
    return-object v0

    .line 167
    :cond_c
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_18

    .line 168
    new-instance v0, Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;

    check-cast p0, Landroid/app/Activity;

    .end local p0    # "context":Landroid/content/Context;
    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/ContextReference$ActivityContextReference;-><init>(Landroid/app/Activity;)V

    goto :goto_b

    .line 170
    .restart local p0    # "context":Landroid/content/Context;
    :cond_18
    new-instance v0, Lcom/koushikdutta/ion/ContextReference$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/ion/ContextReference$1;-><init>(Landroid/content/Context;)V

    goto :goto_b
.end method


# virtual methods
.method public abstract getContext()Landroid/content/Context;
.end method

.method public abstract isAlive()Ljava/lang/String;
.end method
