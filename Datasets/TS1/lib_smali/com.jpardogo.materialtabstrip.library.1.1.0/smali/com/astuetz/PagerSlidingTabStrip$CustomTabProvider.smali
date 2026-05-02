.class public interface abstract Lcom/astuetz/PagerSlidingTabStrip$CustomTabProvider;
.super Ljava/lang/Object;
.source "PagerSlidingTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/astuetz/PagerSlidingTabStrip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CustomTabProvider"
.end annotation


# virtual methods
.method public abstract getCustomTabView(Landroid/view/ViewGroup;I)Landroid/view/View;
.end method

.method public abstract tabSelected(Landroid/view/View;)V
.end method

.method public abstract tabUnselected(Landroid/view/View;)V
.end method
