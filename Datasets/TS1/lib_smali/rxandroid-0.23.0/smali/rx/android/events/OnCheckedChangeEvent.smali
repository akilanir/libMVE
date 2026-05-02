.class public Lrx/android/events/OnCheckedChangeEvent;
.super Ljava/lang/Object;
.source "OnCheckedChangeEvent.java"


# instance fields
.field public final value:Z

.field public final view:Landroid/widget/CompoundButton;


# direct methods
.method public constructor <init>(Landroid/widget/CompoundButton;)V
    .registers 3
    .param p1, "view"    # Landroid/widget/CompoundButton;

    .prologue
    .line 23
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lrx/android/events/OnCheckedChangeEvent;-><init>(Landroid/widget/CompoundButton;Z)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/widget/CompoundButton;Z)V
    .registers 3
    .param p1, "view"    # Landroid/widget/CompoundButton;
    .param p2, "value"    # Z

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lrx/android/events/OnCheckedChangeEvent;->view:Landroid/widget/CompoundButton;

    .line 28
    iput-boolean p2, p0, Lrx/android/events/OnCheckedChangeEvent;->value:Z

    .line 29
    return-void
.end method
