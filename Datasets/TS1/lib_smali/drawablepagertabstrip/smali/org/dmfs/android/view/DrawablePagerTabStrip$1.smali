.class Lorg/dmfs/android/view/DrawablePagerTabStrip$1;
.super Ljava/lang/Object;
.source "DrawablePagerTabStrip.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/dmfs/android/view/DrawablePagerTabStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/android/view/DrawablePagerTabStrip;

.field private final synthetic val$x:I


# direct methods
.method constructor <init>(Lorg/dmfs/android/view/DrawablePagerTabStrip;I)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip$1;->this$0:Lorg/dmfs/android/view/DrawablePagerTabStrip;

    iput p2, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip$1;->val$x:I

    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 318
    iget-object v0, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip$1;->this$0:Lorg/dmfs/android/view/DrawablePagerTabStrip;

    iget-object v0, v0, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    iget-object v1, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip$1;->this$0:Lorg/dmfs/android/view/DrawablePagerTabStrip;

    iget-object v1, v1, Lorg/dmfs/android/view/DrawablePagerTabStrip;->mPager:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v1}, Lorg/dmfs/android/view/ViewPager;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lorg/dmfs/android/view/DrawablePagerTabStrip$1;->val$x:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lorg/dmfs/android/view/ViewPager;->setCurrentItem(I)V

    .line 319
    return-void
.end method
