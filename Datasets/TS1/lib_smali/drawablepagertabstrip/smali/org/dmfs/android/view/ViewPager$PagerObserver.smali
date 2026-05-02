.class Lorg/dmfs/android/view/ViewPager$PagerObserver;
.super Landroid/database/DataSetObserver;
.source "ViewPager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/view/ViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PagerObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/android/view/ViewPager;


# direct methods
.method private constructor <init>(Lorg/dmfs/android/view/ViewPager;)V
    .registers 2

    .prologue
    .line 2824
    iput-object p1, p0, Lorg/dmfs/android/view/ViewPager$PagerObserver;->this$0:Lorg/dmfs/android/view/ViewPager;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/view/ViewPager;Lorg/dmfs/android/view/ViewPager$PagerObserver;)V
    .registers 3

    .prologue
    .line 2824
    invoke-direct {p0, p1}, Lorg/dmfs/android/view/ViewPager$PagerObserver;-><init>(Lorg/dmfs/android/view/ViewPager;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 2

    .prologue
    .line 2827
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager$PagerObserver;->this$0:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v0}, Lorg/dmfs/android/view/ViewPager;->dataSetChanged()V

    .line 2828
    return-void
.end method

.method public onInvalidated()V
    .registers 2

    .prologue
    .line 2831
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager$PagerObserver;->this$0:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v0}, Lorg/dmfs/android/view/ViewPager;->dataSetChanged()V

    .line 2832
    return-void
.end method
