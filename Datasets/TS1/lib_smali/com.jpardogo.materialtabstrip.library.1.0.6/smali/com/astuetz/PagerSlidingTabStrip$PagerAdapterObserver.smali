.class Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;
.super Landroid/database/DataSetObserver;
.source "PagerSlidingTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/astuetz/PagerSlidingTabStrip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PagerAdapterObserver"
.end annotation


# instance fields
.field private attached:Z

.field final synthetic this$0:Lcom/astuetz/PagerSlidingTabStrip;


# direct methods
.method private constructor <init>(Lcom/astuetz/PagerSlidingTabStrip;)V
    .registers 3

    .prologue
    .line 499
    iput-object p1, p0, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 501
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->attached:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/astuetz/PagerSlidingTabStrip;Lcom/astuetz/PagerSlidingTabStrip$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/astuetz/PagerSlidingTabStrip;
    .param p2, "x1"    # Lcom/astuetz/PagerSlidingTabStrip$1;

    .prologue
    .line 499
    invoke-direct {p0, p1}, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;-><init>(Lcom/astuetz/PagerSlidingTabStrip;)V

    return-void
.end method


# virtual methods
.method public isAttached()Z
    .registers 2

    .prologue
    .line 513
    iget-boolean v0, p0, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->attached:Z

    return v0
.end method

.method public onChanged()V
    .registers 2

    .prologue
    .line 505
    iget-object v0, p0, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->this$0:Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v0}, Lcom/astuetz/PagerSlidingTabStrip;->notifyDataSetChanged()V

    .line 506
    return-void
.end method

.method public setAttached(Z)V
    .registers 2
    .param p1, "attached"    # Z

    .prologue
    .line 509
    iput-boolean p1, p0, Lcom/astuetz/PagerSlidingTabStrip$PagerAdapterObserver;->attached:Z

    .line 510
    return-void
.end method
