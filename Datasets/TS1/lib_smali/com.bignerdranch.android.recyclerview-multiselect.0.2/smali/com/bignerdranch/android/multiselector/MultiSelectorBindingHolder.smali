.class public abstract Lcom/bignerdranch/android/multiselector/MultiSelectorBindingHolder;
.super Landroid/support/v7/widget/RebindReportingHolder;
.source "MultiSelectorBindingHolder.java"

# interfaces
.implements Lcom/bignerdranch/android/multiselector/SelectableHolder;


# instance fields
.field private final mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/bignerdranch/android/multiselector/MultiSelector;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;
    .param p2, "multiSelector"    # Lcom/bignerdranch/android/multiselector/MultiSelector;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RebindReportingHolder;-><init>(Landroid/view/View;)V

    .line 18
    iput-object p2, p0, Lcom/bignerdranch/android/multiselector/MultiSelectorBindingHolder;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    .line 19
    return-void
.end method


# virtual methods
.method protected onRebind()V
    .registers 5

    .prologue
    .line 23
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/MultiSelectorBindingHolder;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    invoke-virtual {p0}, Lcom/bignerdranch/android/multiselector/MultiSelectorBindingHolder;->getAdapterPosition()I

    move-result v1

    invoke-virtual {p0}, Lcom/bignerdranch/android/multiselector/MultiSelectorBindingHolder;->getItemId()J

    move-result-wide v2

    invoke-virtual {v0, p0, v1, v2, v3}, Lcom/bignerdranch/android/multiselector/MultiSelector;->bindHolder(Lcom/bignerdranch/android/multiselector/SelectableHolder;IJ)V

    .line 24
    return-void
.end method
