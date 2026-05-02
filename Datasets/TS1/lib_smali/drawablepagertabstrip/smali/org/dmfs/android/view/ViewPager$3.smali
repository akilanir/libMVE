.class Lorg/dmfs/android/view/ViewPager$3;
.super Ljava/lang/Object;
.source "ViewPager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/view/ViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/android/view/ViewPager;


# direct methods
.method constructor <init>(Lorg/dmfs/android/view/ViewPager;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lorg/dmfs/android/view/ViewPager$3;->this$0:Lorg/dmfs/android/view/ViewPager;

    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 250
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager$3;->this$0:Lorg/dmfs/android/view/ViewPager;

    const/4 v1, 0x0

    # invokes: Lorg/dmfs/android/view/ViewPager;->setScrollState(I)V
    invoke-static {v0, v1}, Lorg/dmfs/android/view/ViewPager;->access$0(Lorg/dmfs/android/view/ViewPager;I)V

    .line 251
    iget-object v0, p0, Lorg/dmfs/android/view/ViewPager$3;->this$0:Lorg/dmfs/android/view/ViewPager;

    invoke-virtual {v0}, Lorg/dmfs/android/view/ViewPager;->populate()V

    .line 252
    return-void
.end method
